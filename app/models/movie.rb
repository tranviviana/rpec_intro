class Movie < ActiveRecord::Base
  def self.all_ratings
    %w[G PG PG-13 R]
  end
  def self.find_in_tmdb(search_term)
    api_key = ''  
    base_url = 'https://api.themoviedb.org/'
    url = "#{base_url}?api_key=#{api_key}&query=#{search_term}"
    Faraday.get(url)
  end
  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end
end
