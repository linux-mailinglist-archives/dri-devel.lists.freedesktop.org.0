Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5935A933A8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 09:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8F610E41A;
	Fri, 18 Apr 2025 07:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S4P8EIR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5910E41A;
 Fri, 18 Apr 2025 07:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qunoqgb9nq7byDxkmqlMfDhC+Fve48tqevRY3s75adJzz03gya5SrwEDbwCpyuUCNYnIY5ZcH+wq71HdF59DUweQV73NkEzggyVXyUxxqIqxUayMylY6ittmNw5q8hiQzvX2q+1/2JP3n7agBf97BmCjNpkhvSO/E/UxqX8QMq+Iuplk85/vU7GUagI5BD6161J1QXnmoo6yvaQruQ0SYHnYaxXR35Burih/0YE9Fi50OuuWkdStSPWGnaTesttjrJ1RdowjWoAIZ+wYqSxDcKEqkhljZYIasr+SNY29xMac43RpZNRX9IYpSCJhsOFTic73QkYPF4+hOg3VKsYz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni0hWnZcRQ9B3nyHi+AXgToNYGv+81ndFo2bZXvnGCk=;
 b=P1xTdGGLT0x+XXzm74g+fUsEYSsibrv5xOg1w+2QNOw73KDS2U3oCwRCuDXz2gTfME7qu6eE202rWD2ge/LnPiYbzqzsGmSZwRJRy00XjTK/Upc+Wroh+Xcd5EN+eHKUdPUTRnlsoPeiz/in7SJOx7vgMXy7mwGnDV1KrwuK48fvB1sDrh9tpX83NtmiHEfb1CRyNOWm6Q4jJMGKTZv5NJVRJ1T98BQndpLvhI8Q4tsbEh47+tzFz/iIyAUCHAv5HLQKNJfu03608qQp6JUrCEGihXdZNpl/FILEuxg8wNxhvXZom2CItkUMtDVw1MxNut214fziYWdKWjVnHPWegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni0hWnZcRQ9B3nyHi+AXgToNYGv+81ndFo2bZXvnGCk=;
 b=S4P8EIR7MBk5JxUZPYNIXX+UCinxQfnhxsKTMGuRmUSSssnevHibFVp3l/GmjyLyPiMin2fhrHJG7FwvLQctzpZnm+hCvfJdtQ1D1yMonM1WowJxAIMIBNe1PpCb8GijdJ6UyS2BccbcFV8xZe87uD4wmAMEm+NucZvRTVXObF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by LV3PR12MB9330.namprd12.prod.outlook.com (2603:10b6:408:217::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Fri, 18 Apr
 2025 07:46:55 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Fri, 18 Apr 2025
 07:46:55 +0000
Message-ID: <da4c289e-1cfa-404d-83d5-4f70f6829150@amd.com>
Date: Fri, 18 Apr 2025 13:16:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: fix the warning for hit_low and evict_low
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417093409.2242506-1-sunil.khatri@amd.com>
 <dd96e4fb-ba21-40d3-9c53-3e8d4f7bbc86@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <dd96e4fb-ba21-40d3-9c53-3e8d4f7bbc86@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::20) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|LV3PR12MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: a08e618f-291a-49e3-4824-08dd7e4d30ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zjg1OVp1R1U2dU5BaDY5cWFLZy9nd2h0dXl6Wm41Wm0vY2FTRU94YXZsTkpL?=
 =?utf-8?B?NW9LckJMQ2t2MjhTZHVGNmErWDhxK3ZyMUJCYjF5RmNWTU5QZUMvd1VIYXpN?=
 =?utf-8?B?enY4Qi9XVERtRW0wR0gxTG1LTTl5RGJUb3dXOFVuNXU0MjAwUjZVZ3BQVEYy?=
 =?utf-8?B?OWkwVHhIbUJIN3pFK0hIZXBOYWY0TlVVd3Z2SWZxVmsxVUVWbm5GbnRyL01B?=
 =?utf-8?B?bW0xcDNHa0htQXdFblBrd3ZnZFFFRXJrZkNsRHVJbUpWaWtLdW1UbXJSOGJ3?=
 =?utf-8?B?NVBqcDg2QjVUeVYvbmpmSmZVcGVYUmQ3RXVqTTV1aElDSjQ0cnhycW5HSU1q?=
 =?utf-8?B?MUUyR3k0eUFobTRaU05EM1hrSkhudGJoMThray9YVFpzZ21kbXFoR2o3WkZo?=
 =?utf-8?B?bWhNempBTjRvUHVJeklKQ2hSaDcxNWZYT1VJWkw2cGV0VGIwZXVEcmY0T3B3?=
 =?utf-8?B?L0UydlRWVkc5dUluUzBTMVV5Nm1yN1hjVWI1MkRLb242UVdzTlhpRjZxa0d4?=
 =?utf-8?B?R3RXZm1MRVRrMkxJMk9TTVVtQm43eUNDM1U2YjVYNlFmc1E0VmNncGJ6QndO?=
 =?utf-8?B?T1BmVlQySnZ4N3NCRUFLWS9IdDJnbGVuUHVaSkZVcUpXQjBtZVovQzJMRU5Q?=
 =?utf-8?B?TzJobnpPeXJLQVh0UnQvUHlaMm1WSW5LZVEyRzl3NHRMcGZvSThTVzdiTjlS?=
 =?utf-8?B?K01KYzZTQlBNMWpVL1AwOWlmd3FOQVlOYnRDbWUybjVsb1lOSWxETk80d003?=
 =?utf-8?B?aE1mY1NLRkxSMDFGTUZXWEJTeHNLZDlMVXgwZjMreDRicTQxRlZVZnh0QXRM?=
 =?utf-8?B?NFAyQzcxS1ZIcWpRTytaZGorYW5MeSsreU5rRy93TXBDVjJaSGw3WDgrQjdW?=
 =?utf-8?B?K0pFanlJZ0NKeFk0YWNsWWczT1M4aGN6bFdkaFQzYWR6NFRsUDJCM1dFNERJ?=
 =?utf-8?B?QkpvNm04WkFuNFV1aWY3aE13c1pUU09aMHVmWnMwNXlFRHhwT20wdEFoZUJJ?=
 =?utf-8?B?UEF0aFBBVWlWclZLU0ZZRnlCQXRoS2p5UktVYy9Da0U3WUxlaE54ZzNJV1ZW?=
 =?utf-8?B?bFJDNkg1S1FyK0JXS3RYY2hleUp2VVJldm5CcU93MGNnY2ZadE9JWGU2QnBB?=
 =?utf-8?B?V3hTT28ySGJ6TXZLY0lWQW9iZkZPQTFUZXFjcFRoclRCdko4NmVtZ2JLQWdQ?=
 =?utf-8?B?K2RWV0VIZW1QOHZGSWdSbnVMRWhTbmt0VDNjTU9nZ0JFMXNTYWhkS1lFd0Fy?=
 =?utf-8?B?eGYxTG5OdzNjWFo2Slo0L2tUUlZjM2VtWTJjeUpZZEtmK1dSWU1rSFpQclRN?=
 =?utf-8?B?elZ1Qlk4aGVabkNMUFdxOE1XZFNWOUt0WE5QL244SXArSmRaQWtIdkFnU29S?=
 =?utf-8?B?a3FjV3BxWTZMWjlMVTlNOVpPTGJEMFZMRk9peFJjbTg2OVllUW8yejdJUjk5?=
 =?utf-8?B?VFVOcTFKTjdHVVZHQW1objNLMTZEeDBDMFdLZUtHOFNwT3hHQjdRcnBQQjV5?=
 =?utf-8?B?TjY4U1oxdm53ZVZhUGNLR0JuZUNTVytpbVlqZE9IKzZJWDNVQi9FUkRhOGI0?=
 =?utf-8?B?STFSZWJBUDdJWXN2MWNzNDVGN0NLYXBLZzhqcER2TUQrQmFPY2dKeVB5N3d4?=
 =?utf-8?B?YkFKOXYzaEVEQWtNdzFUVWlxQm42K1Z2RVpIS29DRERDbm1rbFNXL3pkTEoz?=
 =?utf-8?B?MUdHNzJwT1BvMndpdHVZZWF6NlE2R3N1WFIyZUpWTGpTVm4xb1NNMmRQcmxS?=
 =?utf-8?B?bmNyUEV6djRTWTRWTjFpWk5IOXpOTUFxZmFVQlcvTk9uQWhRSjlKY2ltd2x4?=
 =?utf-8?B?dDBEUC9sUTBCM0E4VTNNVHdYWWV5QW0zQkFHc1VheXEwTU96RWpIb1BSYVlW?=
 =?utf-8?B?R1VwWjlyRDBGa3hMM1hqRDhGVVcrYnQ3ZHBXTURMSE8xaVVtT0tNYmVaNWhO?=
 =?utf-8?Q?ZzNoqV3Ut7I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHpGYWFYWWI2endrNnA5M1B6dzFyM2hZREJUdjBhY0JpWURwSXN4M0t0T2hr?=
 =?utf-8?B?c09CTDEwUHNjZWpuQ1c3UERVeUllSHRIK1FrQ2luR1htNTQzRnlsZkhaZjR1?=
 =?utf-8?B?UzlYaWp0cVpYbTVXb1J5elZZcmJrcXI3TnFJVDNGK1dzeTNpK2hSVVplT3dV?=
 =?utf-8?B?M1hrbTBMRmNRdVlWWXp3ZVlEb1VId0VHN293eEdjVGM3dzNZREtWRllUSlhj?=
 =?utf-8?B?TVhDQStVN1VQNENGSzN1cW1tZmlUZFpvK3lxM3ZkMVBBM1hNSnFGdVpMek4z?=
 =?utf-8?B?VmlhbkNkQmtraSsvRjdoMjdITERvcEJueURZL25uY0k5YVljSzY5bHdjMGxD?=
 =?utf-8?B?bTFnejR2M2hIM3VyWlE1bmdsRlZoQitxaUJNUFUyeXUrc2RwQlRieGFiZmFi?=
 =?utf-8?B?Z0p2eWdqMnM0K0xVQjgwUnF1RWpmSHFOeFI4dU5sclVseThiTDJMdUZxck1i?=
 =?utf-8?B?cHF4ZXFpNEZYQ3NaT1hWSVk5WXJDYTRDMkFEMlcxSkp0RW9OWDhBQXM1QVkz?=
 =?utf-8?B?NEpyN05jMDh5S0hUUkxpM2dWazQzUnlxOTRnYW05NXZ6ZlJFOElGNDRhVmxS?=
 =?utf-8?B?UllERWV4NlcrMk93TVhYSUJzTlhnSlEzb3doa21iUUM0YnpqUDIwL3ZtN2tv?=
 =?utf-8?B?WDByM21Vd3Y1OFFEQUpydXNqWTl0eHhkTHVkbUdLVzVaSjZpQXFwTzRRRGp5?=
 =?utf-8?B?Mlh2aUVZSmlsRHA1Rnl0eEswSkw4SlJiZFFYQjg4LzBVbCs2dlVMNUg4M1pU?=
 =?utf-8?B?VUZGbk54ajhDUU0wUnFqbUxOSkx3dlB3a1F0b2ZPWW5ZcDdKa2JUdjA2UjE0?=
 =?utf-8?B?TzJUWnZucHNJbGR5UytDL0RVeEhLVHBwVnVlRDJkdENzU2tWVFhoYUNCaDkx?=
 =?utf-8?B?SlN3b0NtT1pEU3VOSG9PZk44dWtvR0NQaTlPM0V1eS9hVExOU2VubkVUMm53?=
 =?utf-8?B?MkFZQ093OVNJWGk5U3NQTDNlSUtUMER0cGM0aTJxb01JQ0ZIdW9YekJxamhk?=
 =?utf-8?B?Z2hzNzNRNEZKUGVOcWtqNmxqenEybTFvWndtK3RtMXBMU0hkUzNIc0Y5T0lO?=
 =?utf-8?B?NEpzZ0tJczhyZmdnRVdzZGZ6Tmd3eldMN2UrSngzYk9qMHgrQWNsbWpzakFj?=
 =?utf-8?B?R082c042bkwwMXRnb09Yd0pSbmJNMitGVFlqTFg3RTFLWnpZZ053TGk0TjFP?=
 =?utf-8?B?Vis5TXBrOHhMNzZYdW5hWDAvcWw3dTVLRjY2R3VjMFcxRTdQQWJQTE1WSEVL?=
 =?utf-8?B?dVZHUk9VajdZdEhhTGVBVFZ6Sk1mS0FpZm50QjBHZkYvN2l6L1NNSURLQWE5?=
 =?utf-8?B?a1lpOEFjNmJwRDlBVnc1dkpDMldwRTRrVW9xZGpMa1lralZlaWtST2REUU8z?=
 =?utf-8?B?aUhod1AzUHVzWjBVT3NyK2k2V2l5OTZhVUw2NWs1a3FML3NBaVJ5WGcwdkNC?=
 =?utf-8?B?dGlVcHF1SEl0dU55RnB3UlgrOE1rU3dqSlMva3orcW0vSXBjT0I4Rm9uY0ZC?=
 =?utf-8?B?dXUyaFQwU1FTN1JibzN6cXg2cWNZb256T25QMEdOOWZ4Tm9oQmhhcVlFOFc3?=
 =?utf-8?B?OG40ajQ2eEdhYkFGNm10UStOR2lZL2pSV0tCSlBVSXRkaXBvWW9yaENFRGpR?=
 =?utf-8?B?ZEE2VDNtUWdWSGpUcXgrdklRVmZpbEtKNUdoSWlPeGZyN1RTMXFpeUErbVJC?=
 =?utf-8?B?VlVhTDdEeHo2dXU4SVF6VWE4TE1tWmduTkY1NzVCTXViOEx1TEV4MmwxODhi?=
 =?utf-8?B?L04rUiswenVwbHpSUWhvNjRKQlJQQi8rZ05pblNuSHlaNmo1T1lGeTBmN05Z?=
 =?utf-8?B?QVErVjdsT0lJSDRabzlyTWhxNUxJQnVkMHVSMUQ0amE5UWpxazgvQTVhb0p6?=
 =?utf-8?B?dnZvY08yUXoyTzcvU3JxeHAvcFlsbFk2M2paRm12ZkIzUW12K1htRythUUVz?=
 =?utf-8?B?NXlPMHpEOHNvVjV3MkM2dnI3bEdsRVFiTHVFV1J1bS9yaVd2VHNBZnBWekE5?=
 =?utf-8?B?OEVqaWJ6Tmo2eE1ncUZHeWdEOHhBRUZlYVp3eE1lUXNxZSt4eFZpN2o5Wi91?=
 =?utf-8?B?cTdWQWl0Q0o5R1hrVnQram52aDVFV0VXaGo1ZG40VEF4cDRReVlrQmtzRHBa?=
 =?utf-8?Q?mkCaQGmCNLOOIdG9oYiQ+JrZt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08e618f-291a-49e3-4824-08dd7e4d30ce
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:46:55.6043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzhXyVLOeJgMqWFitsCurnRwXBvmereBgq2jHxVhfEER34mBDzxGUlOP4HlZXlX4Hegg6PEGwRjSsJLHhJF1Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9330
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


On 4/17/2025 5:01 PM, Tvrtko Ursulin wrote:
>
> On 17/04/2025 10:34, Sunil Khatri wrote:
>> fix the below warning messages:
>> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 
>> 'hit_low' not described in 'ttm_bo_swapout_walk'
>> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 
>> 'evict_low' not described in 'ttm_bo_swapout_walk'
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 95b86003c50d..33fefdcc6323 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1093,7 +1093,8 @@ struct ttm_bo_swapout_walk {
>>       struct ttm_lru_walk walk;
>>       /** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
>>       gfp_t gfp_flags;
>> -
>> +    /** @hit_low: flag to mark low */
>> +    /** @evict_low:  flag for low eviction */
>>       bool hit_low, evict_low;
>>   };
>
> Hm, could you check if you could copy and adapt more detailed comments 
> from struct ttm_bo_evict_walk?
Even i doubt how to put it and i could not find that appropriate 
message. Let me add the original owner also for review if the comment 
could be made better.
Regards
Sunil Khatri
>
>     /** @try_low: Whether we should attempt to evict BO's with low 
> watermark threshold */
>     bool try_low;
>     /** @hit_low: If we cannot evict a bo when @try_low is false 
> (first pass) */
>     bool hit_low;
> };
>
> Regards,
>
> Tvrtko
>
