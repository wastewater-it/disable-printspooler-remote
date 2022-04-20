$servers = Import-csv -Path .\servers-without-printserver.csv
ForEach ($server in $servers){
	try{
		Invoke-command -scriptblock {(Stop-Service -Name Spooler -Force),(Set-Service -Name Spooler -StartupType Disabled)} -computername $server.ServerName
		Write-Host "Disabled print spooler on $($server.ServerName)"
	}
	catch{
		Write-Host "Failed to execute on $($server.ServerName)"
	}
} 