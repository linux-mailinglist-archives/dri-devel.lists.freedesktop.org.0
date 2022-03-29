Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3075E4EAF88
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 16:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB0C10E8D8;
	Tue, 29 Mar 2022 14:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8906710E8B5;
 Tue, 29 Mar 2022 14:46:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEbDiNcY41n1OCzyJNw3PvteCmsM6f1V6OV2sfuinh8sS0CiYAzg0l631864yWPlN38dO2rtCwDEN+GW4vDc6M4E0E/R2eCPRZnmee1fahSu3C6ztQSJ5l0FpriMFSJReRKWj4IdlUrrgVHG1jxmQRGNGZv3+VKxTNcBcJ6/eC1fGiw9O2ZzAVt37SE/VAHu0ZgsYoXjN7TNZJCkV9x2E/Xh/8Ibb4tpymBZr3B+uN6ewKyoa1O/66jO36XIuw44Ej8H5ZNNHUpObnGN2N3Kvs96ZXzBLCCR4HHfshWBNEEWm4Q9cEFDAyrE6NYrOp+2WhM5tbjPMCLFU02wm2pjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+win/ldsTh05FnTDQz94KmBfPXSXs0/z3in5NQkp9A=;
 b=Kh1njs4N6yLwthHcJ8464RxGbEuSiN516WIwUGLv6PtgqLdPQQo5oK0nE/n7Dig4QLmOiIkUXLs3JHAJ19TxsrclnORzu92I+WFtss4GjPFDhutsMhRk76gzoqrZ2EF+9RxUTtAqMJbShn/Cnnu2fAEtr8SrBC6mbZBge2Ytjj9hOz8XR5c+8Vm100VzTfBquQqqxcsjWGcUA7yuYAUANPF7BOUut0+SGgwBWurPxPrpDmU9ZIMr1QSk1OqECbDk7zvLwPWrqSY9W5/XhH44NwJHSoU7j/EBEmNcooBmbpQpnMc1n6mqv1dWdDeL0aLF4Ikk71x+zRwIJjUJqy5oCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+win/ldsTh05FnTDQz94KmBfPXSXs0/z3in5NQkp9A=;
 b=AyHhbWmppvH2M5Z/sUcNsovlQzD8Ac97UH9iqAIkjo7XjH1NMSAu2Vk6i606GIuSdNHK01p+ny+4a6XnJ7Rs4N66ZTKZTuhGnkOruq6ssT5S9gqW+9DIYB/NAyPuWO/leWI7bkunbHhmXUfQ6func2SWlIa81bPl1SDxQCmxbuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB3821.namprd12.prod.outlook.com (2603:10b6:208:16f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 29 Mar
 2022 14:46:30 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 14:46:30 +0000
Message-ID: <dc41915d-4cd8-857f-8f2b-78e821ab9ab1@amd.com>
Date: Tue, 29 Mar 2022 10:46:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] UPSTREAM: drm/amdgpu: Disable ABM when AC mode
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: Ryan Lin <tsung-hua.lin@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, seanpaul@chromium.org,
 bas@basnieuwenhuizen.nl, nicholas.kazlauskas@amd.com, sashal@kernel.org,
 markyacoub@google.com, victorchengchi.lu@amd.com,
 ching-shih.li@amd.corp-partner.google.com, Rodrigo.Siqueira@amd.com,
 ddavenport@chromium.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 leon.li@amd.com
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
 <cd030261-6d49-263b-0018-4fc87cdf0958@amd.com>
In-Reply-To: <cd030261-6d49-263b-0018-4fc87cdf0958@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c138e329-9ffd-4795-75b4-08da1192e93c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3821:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3821157674F11EC80AEC2BBB8C1E9@MN2PR12MB3821.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PJ1sZoqM2wyA1kpOTqdYPZhw4iJQCy+amp5XDRENdB5+jBpXcKoYvQRCtDc7D3jA68qN1Q/gs74pwwsGK7LgclHC7G8Y9V0AOrY5FdRN9N7x6P/CP24Cc7pd3tbTj1CU2IaWR5q7VDXk5sDVIwWQoZvqE9XQr1Kj+sGrQHrQwF/cmFZZK+WMFNVxzxoibXfxpMSAwjoVH+9/STqDJ1qx8qujAti3wv47LII0Om1E3B6OvASV9JExulcoU1jwMmxvZiJrf6PVnwmlf3WuStxegb8x6w90CTxE2GTMj4OeHk0VRIJuKSOWqUiSNmDSb7BTy9ULO1Z1W7rHdWHKIJ9yNoA2duBD9cBDZpwBkD3daV5NcOj8NXEJ4/HKjoyGwDeQ7izGqCGy0T6XInOSc2rZ6I6HOcn2iRQHH24XAM7gDhgEc/cMXj9T8ADKHEJRPeE9IvUMhudlbsUyWss7VLBGiHN4VCRfon8A6iMnBhvp/7L9g0eiNtat4ygRA9B6K9tIHAzMjRj9qWM2C8mq/Jt44JL731F6hjYaxO8p85WdrIzCuWpSvwREEHfwrZc43DB7vxak7QHPmvD7c2CjEPncu+vuN3vSbLCV28fuxgaN6P6QZG6BalY1zTzPVWKho2AoFTx5lqffHKxILT9OL6Fz8fH2OLxqIxNrvh3vZrAcnXTj0n95NQUFc4lKfn5+4BBZxJrsn433hPH71Ye2LwzaF5KMwkYlFI1HSESbPBc54/9v13i1///cSz4RzS/rIJEV7VEkt8cjtczDIK5WMIMLAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(31686004)(186003)(26005)(508600001)(86362001)(316002)(31696002)(83380400001)(8936002)(6636002)(38100700002)(2616005)(44832011)(2906002)(6512007)(66556008)(8676002)(6506007)(6666004)(66946007)(921005)(53546011)(36756003)(7416002)(5660300002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGIzN3hyd3RuUjRvVHBYMUg2UXRYWEpCY3NNZ0NTdHkwNnk2em9WenlOTTZV?=
 =?utf-8?B?T2Fhb1JvcUlsN1l5WEZDQ21ITENTeExpNmZ3TzMyT01JZVlYTnBrTHNlNTVI?=
 =?utf-8?B?MXBqbG8rUC95cGhzcXg3TXp3SXBHMTUvZGF6Wm9ZMXlxT3ZoN3ZVcmozMEdw?=
 =?utf-8?B?aDBqaDJ6cE9kZ3VMRGhDdmV2V2JTOExWSkNxTU90T1VxdGVCMzVQYTNHQzdE?=
 =?utf-8?B?eTFnRDkxZ2hCSFYyUmhaMW9CTi8wMXRJRER4UUoxRG16MHNrL3ZubUFZQmxn?=
 =?utf-8?B?NUN2SHlUMlkzVFpNTVBrR1BZNEtjeEk4MzlhUU9vbzYwNjJ3ZC8rdHVHaTVv?=
 =?utf-8?B?NEkzdG9LQmJxSU9kaG9kUm9MWjFjeFBmRmd2dVBZdU5iYmhlZFZia2pQb2FH?=
 =?utf-8?B?anBOb2l1NkZFZDBFN2tMMTBQVUZnODdycHhDUFcrRGlsS0hsaG1uQU9jbVRK?=
 =?utf-8?B?WlJNUDRPL0dyOFNTelp3VlhRby9ySVVHQW9DcDhCMi95NHhDb1Y1emNwem9o?=
 =?utf-8?B?WEpMUFNYUm1Kblk3dk5YN1QyOXlrK0psK2RZaktOYnJWZXozS1FwQ01IV3d3?=
 =?utf-8?B?Yi91SjI3SDY2a0dUeS8zMEM2ZnlOaFI1NGJCY0xrVEdOT2dwb0NmTElxU3R1?=
 =?utf-8?B?aDN1cnI5akRsekwzand6R1Jsc0k2QWtSMkFzOEF2Q1dzTXVUVG5heHZxMGZw?=
 =?utf-8?B?L0Nxa09YeFpoOEZURHNTS1JVU29JSWhYaFdHRzlMeHVRcDFaUlcyQzRYUVBQ?=
 =?utf-8?B?dlN4dDNVUXdEbE9oSFlZNHBieEZNbFdYTGdXWWl4UzhoWlI0L0Y4TTBaaEJU?=
 =?utf-8?B?QzM3NUdJMGluVFBNVmpNMkhqSFRWZWc1UFdNVTBFUWZlcW1sZUhzMWRkZ3pT?=
 =?utf-8?B?VWZ2Ri9TUFJKRWQyZEE5anFwYVBWQmpIbUJRSExBQTNWWis0WmoyUVBacW01?=
 =?utf-8?B?ejZhT0l0RXBIc2lRZVhkVFU0TEVSNzUzbWlaM0I4YTQyVUVBOVhURFYvY29h?=
 =?utf-8?B?azBNUStMWm9wZVYxTlN3MzB4OG8wV1ZrNHBvR3I5Tlk0aEUrL0RRSG9ZS0Ns?=
 =?utf-8?B?Y2RqaExBeVByZzhHaklQNFcyRnRnUTc1VlhyQ2daVFl6VHFuMTgxNk9FS0h2?=
 =?utf-8?B?Q1R1ZVhhelQwYkNCaU8zNmRNUFJ3amNxaWZyVHh5U2tMdFZvNlBQQlJRcG5G?=
 =?utf-8?B?WS9tcmZZeHhmQ3NPcVYvdGxTbXhYMmtvTGxGVjB2aXpBSXA0NjhLdVRtK3Iv?=
 =?utf-8?B?Z2NYcDdmTmtwRHpjNGFaMjEzajNueXI4M3JERTk2akJzREtpZm5zM2hNbzM3?=
 =?utf-8?B?V05sbzBvaG1NOHVZOUdSbnlCZGV6cThGMENoaW9MaXhPNWh2ZjVIaU5PT3Bh?=
 =?utf-8?B?Rko1MThFVnJ2RnRzVnNURkNpeEVmTjJwWHdoQURVb2V0ZkZITW9KOWQrR1BH?=
 =?utf-8?B?YjlSWlE1WUwzc01GYjZvbVN4N1lJNlJtNzRIMUpxV2I0R1lsZk5rQVF1VFNO?=
 =?utf-8?B?MzN1L2hLTUd6NGRPeVNZTDVaeFgzUnZIN0EwZVp5QWE3SllZcnNObzloYXJt?=
 =?utf-8?B?SkFna3pSRUwwTDQya0xvQmVPbGhLUElsaC9OQnZDR0RVRlZOdUFpcTRmVzdC?=
 =?utf-8?B?bkQ1TUtGb3QwQk0vTjRBTktwN3daYXdyTGMyWmFzM0Z0VHhSb2FkSG9ab3E2?=
 =?utf-8?B?NksycStwbk81MnpaOGM5ZW9sbUcwZjJmYmppbHVPTEdjbVA1WUQ3cWlHMHUz?=
 =?utf-8?B?SzdsYk1uTU9VQnowWmFVV1JUVVpxTXYzSEhKcElVU1BGeHlrT1NLK1FnSkI0?=
 =?utf-8?B?Y3ErblRpRExrRHk2R0pMQjZxQUFscVFHd1M5RGxGV21pYjRBRmZURDZlRVRS?=
 =?utf-8?B?bzhjUUUxVkYyckFiallaL1Y3R2dtNWdpaGthUWFaV1NPVzFEYUZoYktySW01?=
 =?utf-8?B?aXVKcWtSKytkTWpCaWNTNGZJdjd1T1kxVHVEQ0JSMmRRekl0QWxjVnc0NldM?=
 =?utf-8?B?SFZnODgyNVdwakh0QTRuZ1IwazlOU3N4VXNUYmFkK3BuR3BQY21NKzcreUJN?=
 =?utf-8?B?TWlwRjAvR1FNVHpRTUlTSzRoMGdIeks4UFVObzRDeXBITkY4ZHNGZ1d1bmNR?=
 =?utf-8?B?R01HWEx1ZnhmbkpCK2hjV1F0bFpQOW1kU1QyZFNXWHg1aEw1TUF2NjkxM0d2?=
 =?utf-8?B?cncxemoycDkrcHI1VWdPeG5tV0FiSWQ4b1V0Z2tjS1VYeU9WaXF3MkJOaWg3?=
 =?utf-8?B?ZW9JeERhOVZNVFRaTklCbW1INzNucTByZGRxQVN6czNmdjg3VW10UW1xOVpC?=
 =?utf-8?B?WHBVRWozSGNwM0hsV0xZR3lNeEwxYkdja1lZcTBTK3pGUmFqSnU3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c138e329-9ffd-4795-75b4-08da1192e93c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 14:46:30.4941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ams0W536QQRoSvJPKs3NxdRarAz4tXUIPIXpKAtQNZ2YpNtFmxhrL/bzs5yvF0bdhTxSXDBlPK60RE5Fj1zDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3821
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-03-29 10:33, Harry Wentland wrote:
> 
> 
> On 2022-03-24 19:10, Ryan Lin wrote:
>> Disable ABM feature when the system is running on AC mode to get
>> the more perfect contrast of the display.
>>
>> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
>>  drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
>>  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
>>  4 files changed, 42 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> index c560c1ab62ecb..bc8bb9aad2e36 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> @@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>>  	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
>>  	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
>>  
>> +	if (strcmp(entry->device_class, "battery") == 0) {
>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>> +	}
>> +
>>  	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
>>  		if (power_supply_is_system_supplied() > 0)
>>  			DRM_DEBUG_DRIVER("pm: AC\n");
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index abfcc1304ba0c..3a0afe7602727 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>  
>>  	adev->gfx.gfx_off_req_count = 1;
>>  	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>> +	adev->pm.old_ac_power = true;
>>  
>>  	atomic_set(&adev->throttling_logging_enabled, 1);
>>  	/*
>> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> index 54a1408c8015c..478a734b66926 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
>> @@ -23,6 +23,8 @@
>>   *
>>   */
>>  
>> +#include <linux/power_supply.h>
>> +#include "amdgpu.h"
>>  #include "dmub_abm.h"
>>  #include "dce_abm.h"
>>  #include "dc.h"
>> @@ -51,6 +53,7 @@
>>  #define DISABLE_ABM_IMMEDIATELY 255
>>  
>>  
>> +extern uint amdgpu_dm_abm_level;
>>  
>>  static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
>>  {
>> @@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
>>  	dmub_abm_enable_fractional_pwm(abm->ctx);
>>  }
>>  
>> -static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
>> -{
>> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> -	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
>> -
>> -	/* return backlight in hardware format which is unsigned 17 bits, with
>> -	 * 1 bit integer and 16 bit fractional
>> -	 */
>> -	return backlight;
>> -}
>> -
>> -static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
>> -{
>> -	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> -	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
>> -
>> -	/* return backlight in hardware format which is unsigned 17 bits, with
>> -	 * 1 bit integer and 16 bit fractional
>> -	 */
>> -	return backlight;
>> -}
>> -
>>  static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>  {
>>  	union dmub_rb_cmd cmd;
>> @@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>  	int edp_num;
>>  	uint8_t panel_mask = 0;
>>  
>> +	if (power_supply_is_system_supplied() > 0)
>> +		level = 0;
>> +
>>  	get_edp_links(dc->dc, edp_links, &edp_num);
>>  
>>  	for (i = 0; i < edp_num; i++) {
>> @@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
>>  	return true;
>>  }
>>  
>> +static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
>> +{
>> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> +	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
>> +	struct dc_context *dc = abm->ctx;
>> +	struct amdgpu_device *adev = dc->driver_context;
>> +
>> +	if (adev->pm.ac_power != adev->pm.old_ac_power) {
> 
> This patch still has the problem of accessing adev from within DC.
> That'll break things on other platforms. This information needs to
> come in through the DC interface if we want to enable/disable ABM in
> this function.
> 
> After a closer look I also don't think that amdgpu is the right place
> to control the logic to disable ABM in AC mode, i.e. to switch between
> ABM levels. Take a look at dm_connector_state.abm_level and the
> abm_level_property. It's exposed to userspace as "abm level".
> 
> The "abm level" defaults to "0" unless userspace sets the "abm level"
> to something else. The same component that sets the "abm level"
> initially is the one that should set it to "0" when in AC mode.
> 

It might be that the ABM level is controlled via the abmlevel module
parameter. If that's the case and there isn't a userspace that sets the
"abm level" property then the easiest way to handle this is to switch
between 0 and amdgpu_dm_abm_level inside amdgpu_dm when there is a
AC/DC switch. Either way we shouldn't need to change DC.

Harry

> Harry
> 
>> +		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
>> +		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>> +		adev->pm.old_ac_power = adev->pm.ac_power;
>> +	}
>> +
>> +	/* return backlight in hardware format which is unsigned 17 bits, with
>> +	 * 1 bit integer and 16 bit fractional
>> +	 */
>> +	return backlight;
>> +}
>> +
>> +static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
>> +{
>> +	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
>> +	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
>> +
>> +	/* return backlight in hardware format which is unsigned 17 bits, with
>> +	 * 1 bit integer and 16 bit fractional
>> +	 */
>> +	return backlight;
>> +}
>> +
>>  static bool dmub_abm_init_config(struct abm *abm,
>>  	const char *src,
>>  	unsigned int bytes,
>> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> index f6e0e7d8a0077..de459411a0e83 100644
>> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>> @@ -445,6 +445,7 @@ struct amdgpu_pm {
>>  	uint32_t                smu_prv_buffer_size;
>>  	struct amdgpu_bo        *smu_prv_buffer;
>>  	bool ac_power;
>> +	bool old_ac_power;
>>  	/* powerplay feature */
>>  	uint32_t pp_feature;
>>  
> 

