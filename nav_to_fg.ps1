# Get list of files in navdata folder
$list = Get-ChildItem -Path .\navdata
foreach($string in $list){
# Get letters for subfolders creation
    $icao1=$string.Name.Substring(0,1)
    $icao2=$string.Name.Substring(1,1)
    $icao3=$string.Name.Substring(2,1)

# Get just name from filename.ext, we know it is 4 symbols, so we take just that
    $icao_name=$string.Name.Substring(0,4)

# Create new name for FG
    $new_name=$icao_name+".procedures.xml"

# Create string for new foder creation
    $new_dir=".\FG_navdata\"+$icao1+"\"+$icao2+"\"+$icao3

# Create string of new path to file and new file name
    $new_fullname=$new_dir+"\"+$new_name 

# Add new folder to structure
    New-Item -Path $new_dir -ItemType Directory -Force

# Copy file to new place with new name
    Copy-Item -Path $string.FullName -Destination $new_fullname
}