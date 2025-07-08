Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F0AFC281
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD8D10E0B4;
	Tue,  8 Jul 2025 06:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="okYubNhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E96010E004;
 Tue,  8 Jul 2025 06:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kflIm0GHI5gDgXPh7YpPEcaQIX71Tz6RutxNuili+2aJLyB/YhfCMUJ1bGHwFXsDNbMaF6VACRtddqUN9u53zqCevqwZOB4OFrAPCIWqq9teTCTXnFtIPJcZgdnUBQvY50lxVeCWHtVkeFGOrCoN+T91jNzKMXJQVZtEvuAMKwbZJjRW6uXjBRf8qILkD8Of4VuttdwfBAJSuCbN3CPaL8jsFA3yVVdVQHj74tAlqRFattot0T4DkfDV8N0JTGsxstipcEsk1thUGp3Ea/ZcRPWKR8hXkYNlcxM3VZx99X/hp5O/Yr2cSnTpbQF8o9ClWMvfZZzoPkE6vHUwM3wcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7ig/4Gs7h35+G+xlsyo0Ci5PocqPbgYCrXx878TAxI=;
 b=U74whNeNiz9AGADvF0KJ5d8N2xCrXNHtEfGg2K4I9u6tXtpmn3owt18Ej16b1czJWLl1fa0Xrs58aYlAQ/ZyLT13lE1OrdmbYAWwY0k1STmkkBR0TAv8eiECXl18dhtGGAjNXmoLzIa046QZjlsUjSnCJc9HUjgUm7wXcDv2C1VkIQDt51WlY8YOuiht3C/XHSUZHyNJ3UFGr3u9RauKcXCcpa6y25CZ2xMHvrrh+n/Ts9LeHJxnNBh6GhPBht8bt71Voug13+GsM013x/Hf570nTDWjkG78BMfqbTelQlkPS9mBFPzbK4ADb/sS9NCHg16212z5asNgZsr4wDIL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7ig/4Gs7h35+G+xlsyo0Ci5PocqPbgYCrXx878TAxI=;
 b=okYubNhYyBRyJ7KGZpHbBr5azBGVjUZfcL8Y1BOACIrLV4D+RMYtPLGcJQj0dRDrxvXJRZvnC0IKm8t0LVAOdwMHZDHWpiOwUjyv/kUVyMuvvo+tY5G5bctkumoFbl3rLOLC2UEoJQ+o64IQK4foLnCBHk9YhmNUdPluRXy2I2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 06:10:49 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 06:10:49 +0000
Message-ID: <631700cf-85bf-474e-9e0a-85ccce24b509@amd.com>
Date: Tue, 8 Jul 2025 11:40:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250701190822.5272-1-Arunpravin.PaneerSelvam@amd.com>
 <20250701190822.5272-2-Arunpravin.PaneerSelvam@amd.com>
 <358045a3-c2ac-4d3c-942c-aa5473d88298@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <358045a3-c2ac-4d3c-942c-aa5473d88298@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::14) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 6942f1d2-04e6-474c-98c9-08ddbde62f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXgvUGVDcUdFRFBXaGZsOFF4SDhFZU5maHAySzJnUWJTbEhqUmRaWWRjeUdm?=
 =?utf-8?B?TlQwMGNqNGRSekNvWldYYVpKY2grSWo1U1FQTU5IVkh0L0JLWHM4UW9keGFp?=
 =?utf-8?B?eWx1ZFB1Umgxcm82TkxnNUhNOVlXeGJIQjNsRXZrOXJpRlQ1aU9rb1I5eURa?=
 =?utf-8?B?dXliNXpqeHltclJTZGU4a3NlaVBIRW8rN1BOa013SU1QUUx2N2tUeDBzYlFq?=
 =?utf-8?B?bTlXTllpV0hCM1IxbVJhbHN1OTEra1A5R2RJSnQ3WFZPWXU0UEYwM1haZXB1?=
 =?utf-8?B?ZHNTRnNWN1o4ei9sdEQ1T091N3JTRWRBMDRKdjNVYkhVQlM2U0dxTk1QRGtr?=
 =?utf-8?B?TGR6UUJNNTFONnp2SmRlcCs2VzdXU0p4RkZjZXBiTEJzMHh4YkhWREhyNGJs?=
 =?utf-8?B?TnNneTdpc090eE50UEFhU0NUc1lReXRWb3A2VlV4VllVMXNIcCtUYkNQL051?=
 =?utf-8?B?YnlZZytubFlmQjVvNUpGYm0wSVdkTC9pa1ZzaUFHaWZhOVVjOWJZeGs4M0pl?=
 =?utf-8?B?dDYvS2VkMHZCcEtYd2hVQ1JaTXgrWmZ0bklkeGg2eTBSUUZsdjAzSTVPcHlZ?=
 =?utf-8?B?dysrYUFBR0ZJanEzeFhSUm1MMmNaSDZQZWlxSmpiL3lsZlppTWxDNCt2dFB3?=
 =?utf-8?B?YkFnUm1WOWhSY1VaU2hHRE9jTWF6SkV6Y0R2emVpSFdZOHlPS1hCRjkwQXd2?=
 =?utf-8?B?RDNKZUk3WFhIVk10ZWM2ZVZyVytwcC9ZVzJrN3hORWtZZlpyOGUzQm9Qd1BP?=
 =?utf-8?B?cDljZlExdHpyS1REODRHazBLdHlZNVZIb1JvWFhyWXpxRHZPalZQemt4b3dG?=
 =?utf-8?B?VC9NRFA5YU82SE53VnRkL2Q4S0pONVJMVTRndS9rcCtwaURZRDM5azRNSlVi?=
 =?utf-8?B?bGo3Y0szV1hlcWpZcnFiNi9jc1lublVmbWRmT2ZVMjhrbGFmUDlQTjdJaDZm?=
 =?utf-8?B?aW1vd3hDMWN2eUVjMmg4VjJOdFB1NjhFbHhCZEVMS2pkT3h6dG5xNzFyV2hB?=
 =?utf-8?B?Y3R0Uy85UkxSNWV2SzZGNE91UzZpaEVkRlAyblJpWk5IRGVZcldMKzNEbmZ2?=
 =?utf-8?B?U1ZsWDBzeW9POFZzQnBZK0t5VkxidkZzSCtmbkYxdm1rUlJWRXFleUFqWG13?=
 =?utf-8?B?VWRTODlMWkhiTm5DbE45UkdwYzJpbjlKRTZjSThYdU5nSHhleW81UFhPSDFV?=
 =?utf-8?B?NDdXaEZ0cWRMMzlNR3UyYnc2QzZGYWgwU1lOSE5QbkdIZTRyNWJKM2FBcGQy?=
 =?utf-8?B?clFyYWNKYlFTOEptS0tORlRFNmtkQmMrYktmdUcyaWRRTUhPM2Y2NURQQitQ?=
 =?utf-8?B?bW5kUFZPNk9SU3daWEFPVjNNTTdTQlNSKzVvZkJlNWdRaFlKR3RxRlRJZktK?=
 =?utf-8?B?SFF2Tld2Qkl5SGVNZ2Y5ZVBJOVpzcldaUURxMng2MitpL1M1U1NwdllUOW9B?=
 =?utf-8?B?Ny9IbGhyMW4xZDlNYXVjR2dkZGFjdkltU0NmMER4dzZtcTVJdHk5ckhPaHAz?=
 =?utf-8?B?NmJnUmVlQ0k5cG9CZnZIcEJkYjZMQnZvVFovRDMvOUU2UVNEUUVSMDBHYm84?=
 =?utf-8?B?dUVtZDdiR05CeW14SjVyQ3ZSUTNPSTZsQWJmdjRLeW1manNoVW05SlB4U3h0?=
 =?utf-8?B?NE5NZFhWekVDS1F1Vmk4dHYxSm90UytFN0M5amRkbnYyWk5PcGhwUEVvdWtn?=
 =?utf-8?B?RFAwcnlrYTZtY2NzNEhpVGdBbW1zT0o0dDBMb0hZVG1lVXRqOUF1enI2N0dm?=
 =?utf-8?B?cnRGdmFnMGhOQWpuckRkUHlsVkpqNkpXUEg1cjZIRUgwL1ZoZkRTcVV5cVFG?=
 =?utf-8?Q?IHtJh1SJCewWnopsdAImFQjwO+qj1W+UHxP2c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFUvT25lNldsUzFuYXZiRWRQTUZxTEoxVDF0SHNyOExDZUVEMjQ3SXBZTWNH?=
 =?utf-8?B?RXFVMGtCdVZQZ0pPa3VqdnBYMWpRNWhadVluVWFkbGFlYXpPdzBGWEtYelY5?=
 =?utf-8?B?Z0d5VzYrMWNrWlpYN0dYaEN6SW5uVW5BUi9aWnRXMm0vNWNRUWYyM3ByemVq?=
 =?utf-8?B?cnBiczNjK3lhTHUvVEtOZ2o0OXlKeks1QmpoUDV3QmdsNEpDRSs2YUJWYlU1?=
 =?utf-8?B?LzVKK29VUUhFemhWeTRkS2FtNE5DNk1aT0xHMk4xZG5TTU1JZ0JscVJUTnM3?=
 =?utf-8?B?NU83TVN4OVNFbG50bEdnaTd2SEhXVVYyMXJFTUt4cTBKSFg2U3M3amQxNmNE?=
 =?utf-8?B?WS8wQTNjdmdIN2w1Y01iYWRXRENKb2xoa01ld3MyK1FsdFJUK0syaGZnejcw?=
 =?utf-8?B?WnVtTkduOG5KNENRdlp2VlZiYzcrQWNRMTBmcDg3YWpaVVlVaUk5ay9PZkhE?=
 =?utf-8?B?UGE4YkpjNnFEbld4Q2JVNG5FdEduQWpiOGlTaUErZis5Ky9UbUZWSUo0ZWhR?=
 =?utf-8?B?UzFNYkJoYUgyelZyWXBEMTN6QVdaaG5HeEtpeEU0SlhuYkNUbXltZGZkUmNC?=
 =?utf-8?B?MS9PSUNYeVBWdGJVc3kwQ2pqQ0dVd3prMCsxc2pJNTFhTnBnMEVsQXkzZEla?=
 =?utf-8?B?YjVWUFo2YzJuQUkzbHY4c01ZcC9vY3hsTUlUay9VekY1N1U3OFprRHNzbTVW?=
 =?utf-8?B?SURGYStnT21PM3RiaGt5dkYzTWJLbGV6SnRheHN2czJkaU9MSzVxMS9OODlH?=
 =?utf-8?B?VlNZYjF4NmZsTTZWckhvcVB6Y0JhRDZ2TWtENERINFFYcE1mYTBWU0ZkWFF2?=
 =?utf-8?B?Q3JBb1AxTFQ5dWdkUzZtRmQ1bEhXR2pLcUxaTnFVdlpyRHN2YkpJTExsUDds?=
 =?utf-8?B?VDJsSDdUNENEb1dHZlk5WnAxbk05SlRoMHdmdFF0aDRkbVhRcU9vV3h4RE94?=
 =?utf-8?B?eHg4NEp3dmthbEZVK1J1TlowUGQrQVc5OEZ2ajMra21nSnhIV3BVUngzOTZK?=
 =?utf-8?B?ZlpENTBEeVVhUERhL0EvUSszTGhnbDJaV05ZSFl0Y0xYRnUrdU9YU3BtZTli?=
 =?utf-8?B?TjcwU3hrQm9kM3lnMXZoLzVac2xrYW9MSjZZd3FRZGlHVUtlQ1RoZms0NEVJ?=
 =?utf-8?B?ZVNkOCtwbi8vczBBT3p5ZE95VU0xYlFuUTJ0bXg2MVZYb0UwL0tDTXYzZkMz?=
 =?utf-8?B?aGg4WDZHbEtMMzZnZUlPMUdVanFMUEtuYTg3M1FvVmNrWGh4TWJDRkgrYkJ2?=
 =?utf-8?B?QVdWMmh3MjFna2cwNVZZdFlIL0ZzRitaNUNwVVBiZDJyN0xFN3hLaUIrcWx4?=
 =?utf-8?B?aHRKUDA3b21nNzYzdnhObkFIbm9RTkxOU2NJYVhRdVVhaHlycmtpeWFzeFJS?=
 =?utf-8?B?cFhVV2pRaVExQzlnT25XdmxvaGJGRStYQ2NBUjNXTDJmVm1ZNlltMDJZSkkz?=
 =?utf-8?B?UzZwcy9XSk4vSFljcGZMVUxrS0c3a2h5YTNLUU5Zend4bFNxdnBxcjFBbFkz?=
 =?utf-8?B?Zzkyb1gvMGRQMlY1MnEyUzQ4ZE5vWWxNSkZ2K1laRVR5bWdIdGsyTVlHTzJn?=
 =?utf-8?B?N3kxSXpTeCsvUFFGYmt1Qm9nY2tnd2hOakg0bmU3eEoyZDQ2NWI2VkFqQlF0?=
 =?utf-8?B?Nnd1OGR0N2lIR3NvNENxZ3Uvem1lYzVKS3dzVzBtaExuczRUOHROekZpWDcw?=
 =?utf-8?B?QjB5QXhuK1pMaFlkWjFFd0t6WDJaUm43RFdaWG9SNTUvbjRKR09odTJWemVS?=
 =?utf-8?B?Rk13ZUJmU1lYQTByVER4UFpVWnZxN2VtakNLVGd6UXFRbDQ1bkN1L0lzZFUv?=
 =?utf-8?B?OC9TY1hRK0c5bXlMbGxJZG5WcHp6VHVDT1o4Z0o5dTh5WGg2Um1aUm96cGgr?=
 =?utf-8?B?a2ZvanQwU3YyLzFscnRBam5zazczNmRQZHdick1oY2FxQkN4ZW9zRC9WeXRJ?=
 =?utf-8?B?TXRaY3l4OTkyakdoVTEzVkRwN1FYQzRTaiswMkZlcXp3d1djalZDOW1FT1FY?=
 =?utf-8?B?TE5mcm8zOWhvYUZRMklnOWhyWVJPTTFSd1RSWDRyU0RGV1BXRUdwOGIybllP?=
 =?utf-8?B?dHMwZUxHRFZBb2JKU0FUSWE2OUozMFdmc0hZcW5Tak5lWTBEYnBZTXVIRTNP?=
 =?utf-8?Q?uaBd5Ksg/1VhSgn6o6XyWvOz4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6942f1d2-04e6-474c-98c9-08ddbde62f51
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:10:49.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OhzuZnlLuMRgo3lLF5lOn2D3sAXa4q8FSf9+7qpdEBMOfivI1ynC0+LkGWkh0sNpcpFxQ9dE5aqBVpWqIKHbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
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

Hi Matthew,

On 7/4/2025 2:22 PM, Matthew Auld wrote:
> On 01/07/2025 20:08, Arunpravin Paneer Selvam wrote:
>> - Added a handler in DRM buddy manager to reset the cleared
>>    flag for the blocks in the freelist.
>>
>> - This is necessary because, upon resuming, the VRAM becomes
>>    cluttered with BIOS data, yet the VRAM backend manager
>>    believes that everything has been cleared.
>>
>> v2:
>>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew 
>> Auld)
>>    - Force merge the two dirty blocks.(Matthew Auld)
>>    - Add a new unit test case for this issue.(Matthew Auld)
>>    - Having this function being able to flip the state either way 
>> would be
>>      good. (Matthew Brost)
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Cc: stable@vger.kernel.org
>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++
>>   drivers/gpu/drm/drm_buddy.c                  | 90 +++++++++++++++++---
>>   include/drm/drm_buddy.h                      |  2 +
>>   5 files changed, 99 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index a59f194e3360..b89e46f29b51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5193,6 +5193,8 @@ int amdgpu_device_resume(struct drm_device 
>> *dev, bool notify_clients)
>>           dev->dev->power.disable_depth--;
>>   #endif
>>       }
>> +
>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>       adev->in_suspend = false;
>>         if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 208b7d1d8a27..450e4bf093b7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -154,6 +154,7 @@ int amdgpu_vram_mgr_reserve_range(struct 
>> amdgpu_vram_mgr *mgr,
>>                     uint64_t start, uint64_t size);
>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>                         uint64_t start);
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>     bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>                   struct ttm_resource *res);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index abdc52b0895a..665656fbc948 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct 
>> amdgpu_vram_mgr *mgr)
>>       return atomic64_read(&mgr->vis_usage);
>>   }
>>   +/**
>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>> + *
>> + * @adev: amdgpu device pointer
>> + *
>> + * Reset the cleared drm buddy blocks.
>> + */
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>> +    struct drm_buddy *mm = &mgr->mm;
>> +
>> +    mutex_lock(&mgr->lock);
>> +    drm_buddy_reset_clear_state(mm, false);
>> +    mutex_unlock(&mgr->lock);
>> +}
>> +
>>   /**
>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for 
>> intersection
>>    *
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index a1e652b7631d..436f7e4ee202 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -12,6 +12,9 @@
>>     #include <drm/drm_buddy.h>
>>   +#define FORCE_MERGE    BIT(0)
>> +#define RESET_CLEAR    BIT(1)
>> +
>>   static struct kmem_cache *slab_blocks;
>>     static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>> @@ -60,6 +63,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>>       __list_add(&block->link, node->link.prev, &node->link);
>>   }
>>   +static bool is_force_merge_enabled(unsigned int flags)
>> +{
>> +    return flags & FORCE_MERGE;
>> +}
>> +
>> +static bool is_reset_clear_enabled(unsigned int flags)
>> +{
>> +    return flags & RESET_CLEAR;
>> +}
>> +
>>   static void clear_reset(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> @@ -122,7 +135,7 @@ __get_buddy(struct drm_buddy_block *block)
>>     static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>>                        struct drm_buddy_block *block,
>> -                     bool force_merge)
>> +                     unsigned int flags)
>>   {
>>       struct drm_buddy_block *parent;
>>       unsigned int order;
>> @@ -135,7 +148,7 @@ static unsigned int __drm_buddy_free(struct 
>> drm_buddy *mm,
>>           if (!drm_buddy_block_is_free(buddy))
>>               break;
>>   -        if (!force_merge) {
>> +        if (!is_force_merge_enabled(flags)) {
>>               /*
>>                * Check the block and its buddy clear state and exit
>>                * the loop if they both have the dissimilar state.
>> @@ -149,7 +162,9 @@ static unsigned int __drm_buddy_free(struct 
>> drm_buddy *mm,
>>           }
>>             list_del(&buddy->link);
>> -        if (force_merge && drm_buddy_block_is_clear(buddy))
>> +        if (is_force_merge_enabled(flags) &&
>> +            !is_reset_clear_enabled(flags) &&
>> +            drm_buddy_block_is_clear(buddy))
>>               mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>>             drm_block_free(mm, block);
>> @@ -167,7 +182,8 @@ static unsigned int __drm_buddy_free(struct 
>> drm_buddy *mm,
>>   static int __force_merge(struct drm_buddy *mm,
>>                u64 start,
>>                u64 end,
>> -             unsigned int min_order)
>> +             unsigned int min_order,
>> +             unsigned int flags)
>>   {
>>       unsigned int order;
>>       int i;
>> @@ -178,6 +194,8 @@ static int __force_merge(struct drm_buddy *mm,
>>       if (min_order > mm->max_order)
>>           return -EINVAL;
>>   +    flags |= FORCE_MERGE;
>> +
>>       for (i = min_order - 1; i >= 0; i--) {
>>           struct drm_buddy_block *block, *prev;
>>   @@ -198,7 +216,8 @@ static int __force_merge(struct drm_buddy *mm,
>>               if (!drm_buddy_block_is_free(buddy))
>>                   continue;
>>   -            WARN_ON(drm_buddy_block_is_clear(block) ==
>> +            WARN_ON(!is_reset_clear_enabled(flags) &&
>> +                drm_buddy_block_is_clear(block) ==
>>                   drm_buddy_block_is_clear(buddy));
>>                 /*
>> @@ -210,10 +229,11 @@ static int __force_merge(struct drm_buddy *mm,
>>                   prev = list_prev_entry(prev, link);
>>                 list_del(&block->link);
>> -            if (drm_buddy_block_is_clear(block))
>> +            if (!is_reset_clear_enabled(flags) &&
>> +                drm_buddy_block_is_clear(block))
>>                   mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   -            order = __drm_buddy_free(mm, block, true);
>> +            order = __drm_buddy_free(mm, block, flags);
>>               if (order >= min_order)
>>                   return 0;
>>           }
>> @@ -336,7 +356,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>       for (i = 0; i < mm->n_roots; ++i) {
>>           order = ilog2(size) - ilog2(mm->chunk_size);
>>           start = drm_buddy_block_offset(mm->roots[i]);
>> -        __force_merge(mm, start, start + size, order);
>> +        __force_merge(mm, start, start + size, order, 0);
>>             if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
>>               kunit_fail_current_test("buddy_fini() root");
>> @@ -405,6 +425,50 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   +/**
>> + * drm_buddy_reset_clear_state - reset blocks clear state
>> + *
>> + * @mm: DRM buddy manager
>> + * @is_clear: blocks clear state
>> + *
>> + * Reset the clear state based on @clear value for each block
>> + * in the freelist.
>> + */
>> +void drm_buddy_reset_clear_state(struct drm_buddy *mm, bool is_clear)
>> +{
>> +    u64 root_size, size, start;
>> +    unsigned int order;
>> +    int i;
>> +
>> +    for (i = 0; i <= mm->max_order; ++i) {
>> +        struct drm_buddy_block *block;
>> +
>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>> +                if (is_clear) {
>> +                    mark_cleared(block);
>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>> +                } else {
>> +                    clear_reset(block);
>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +                }
>> +            }
>> +        }
>> +    }
>
> Is it not possible to do the merge step first and then go through 
> whatever is left marking at clear/dirty? If we do that then we maybe 
> don't need any extra changes or flags outside of reset_clear_state? Or 
> am I missing something?

Yes you are right, I will make the changes accordingly.

Thanks,

Arun.

>
>> +
>> +    /* Force merge the two dirty or two cleared blocks */
>> +    size = mm->size;
>> +    for (i = 0; i < mm->n_roots; ++i) {
>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>> +        start = drm_buddy_block_offset(mm->roots[i]);
>> +        __force_merge(mm, start, start + size, order, RESET_CLEAR);
>> +
>> +        root_size = mm->chunk_size << order;
>> +        size -= root_size;
>> +    }
>> +}
>> +EXPORT_SYMBOL(drm_buddy_reset_clear_state);
>> +
>>   /**
>>    * drm_buddy_free_block - free a block
>>    *
>> @@ -419,7 +483,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>       if (drm_buddy_block_is_clear(block))
>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>   -    __drm_buddy_free(mm, block, false);
>> +    __drm_buddy_free(mm, block, 0);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>   @@ -566,7 +630,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block, false);
>> +        __drm_buddy_free(mm, block, 0);
>>       return ERR_PTR(err);
>>   }
>>   @@ -684,7 +748,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>     err_undo:
>>       if (tmp != order)
>> -        __drm_buddy_free(mm, block, false);
>> +        __drm_buddy_free(mm, block, 0);
>>       return ERR_PTR(err);
>>   }
>>   @@ -770,7 +834,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block, false);
>> +        __drm_buddy_free(mm, block, 0);
>>     err_free:
>>       if (err == -ENOSPC && total_allocated_on_err) {
>> @@ -1051,7 +1115,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>               if (order-- == min_order) {
>>                   /* Try allocation through force merge method */
>>                   if (mm->clear_avail &&
>> -                    !__force_merge(mm, start, end, min_order)) {
>> +                    !__force_merge(mm, start, end, min_order, 0)) {
>>                       block = __drm_buddy_alloc_blocks(mm, start,
>>                                        end,
>>                                        min_order,
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9689a7c5dd36..8b5273d4b2d1 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>                u64 new_size,
>>                struct list_head *blocks);
>>   +void drm_buddy_reset_clear_state(struct drm_buddy *mm, bool 
>> is_clear);
>> +
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>     void drm_buddy_free_list(struct drm_buddy *mm,
>
