require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @user_input = params[:input]
    @url = "https://wagon-dictionary.herokuapp.com/#{@user_input}"
    @dictionary_info = URI.open(@url).read
    @user_data = JSON.parse(@dictionary_info)
    @results = ""
    @array = params[:options]

    def valid(array, word)
      new_arr = word.split
      array.each |letter|
    end
    # the word can be built and is in the dictionary
    if @user_data["found"] && @array.
      @results = "Congrats! #{@user_data["word"]} is a valid english word!"
    # the word can't be built
    elsif !@array.include? @user_data["word"]
    # @results = "Sorry but #{@user_data["word"] cannot be built out of #{@user_data["options"]}}"
    # the word is not in the dictionary
    else
      @results = "Sorry but #{@user_data["word"]} is not a valid english word :("
    end
  end

end
