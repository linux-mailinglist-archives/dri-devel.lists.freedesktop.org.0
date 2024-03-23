Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE62887684
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 02:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0EF1129CD;
	Sat, 23 Mar 2024 01:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F4/Bn0d9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0070C1129CD;
 Sat, 23 Mar 2024 01:59:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDklutzv0l22v6F5+pTDF393Hqv1jJWKBjPSJT8CVqMtmlfSbH+6HrrEHrtojWDO3F6+DehGUb+tYEW/YFC2JDIq+l/sWxK6K6Sw+SKxbzu6Fs+mlEkhDHaD9MMKzWj4qDr2fYZQO0dtKGjwYGuTXXrVQTUJRis0cqVCLNMZkAUyOBT5UosHt2h69RzPa50NtyLx879ihQHt096uxstYB8vkZqPnv1TKw+9OExkRtvBYKnSmEtCNanIsLIaQ+aQ6/HfMm12FsmWE4ZZbuNMlsEPc83nTCEapXS+d3hAyAIVkzoUrs57NnjeUs3wYI18ivjTb/AvwFs+ANcmAz2zwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoaT9kwHF/9EhunTKC7l7GhMrVyxDxZGRe9mKbjcHMI=;
 b=fEB47vv9+WIGo5ztB6Z+yTfhiJTkTjPsnAXCKQof8UN9o2c83UG2hHa5f8WzooZO3GVJLPhM6hi5sp1nwA6HerE5Q6fyhbbBUFhsoUvlkLRgKQSWyVCa8oQ9lR9i+wtGsq14HUtbBMebZe8SGx8/6K7rc/dnQDmNO7ntQjb6hMZKgsfDWUI22P/fxsQ1dQ6BXPt2ILN+pMDv5xnNrXqp6B3Yr4RwqkmE+wR2eSKXO3+YPOszZR4lgBGGrfIxysoL9F0RQq8VcdmxaZcWZtZk+vqc+ZthenOQMv8iesoC3FyCMDANWP3lrbsO2ykBVAZlCixMPRhI2fzRhTMBXbiIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoaT9kwHF/9EhunTKC7l7GhMrVyxDxZGRe9mKbjcHMI=;
 b=F4/Bn0d91N4GpZJGXJIGsJu1qEz5kJIUrIYAHy2DAQBnDXFVA1bOQYc/mWNhzTb3s/OLLaR9pEmM+9P8padjkEkiC3GRVoMum6ZBztYak8vE7ZnzMSS02ZpdfFTpnY9vx0PAUTJDQkVCyj2GlRwb1XenHBN5wPGIVL+NZQMVpCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Sat, 23 Mar
 2024 01:59:22 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::f405:814f:a551:4b85]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::f405:814f:a551:4b85%7]) with mapi id 15.20.7386.031; Sat, 23 Mar 2024
 01:59:22 +0000
Message-ID: <37461b49-4209-4b72-94f1-355445b864e0@amd.com>
Date: Fri, 22 Mar 2024 21:59:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Implement strict NUMA pool allocations
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: felix.kuehling@amd.com, alexander.deucher@amd.com,
 Joe Greathouse <joseph.greathouse@amd.com>
References: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
 <f3cd8e6e-20ae-4093-b77a-2474b3a2f5dc@amd.com>
Content-Language: en-US
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <f3cd8e6e-20ae-4093-b77a-2474b3a2f5dc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To DS7PR12MB5933.namprd12.prod.outlook.com
 (2603:10b6:8:7c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4d68c6-b314-4ddd-ef66-08dc4adcdbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QTz5PnMBPrHpyG+lsvNyPgWNiO8Jks0jjWIKKDuFZsZ5ueAHmM8y2ItInRZQ5HNJmd3W7VTi6mCIFW8ik9CnWAdZiwEeEUxbz90ZuQShspE1yZYVGWmshFGhXrz1V0ArYjFmVVyN4VKOvjJJ1xDHN811qlT8UYkuQ+qmnAdqlt56CTpOLgAY7kivaR9bycrn3/HcTWcvN4riyEMweMbv99CyHPzDfFVa1/anasK6gTYkuC8TNVRt9FJ0w608BhjVPOvrmtK2KLy02PO2jcGlHKJYTUjF07cJqsgnM74b2F9eTyjSNo3C6GIa/AuBUw0BfBhMxCUpUCGSMb0Z4sMEbGfFjT+Iw4Dc4fx7cI9o/B6mstuLwDZYhWp5XczBi4E5eTEdHYoRq9sjksqztohDtyp1YhO5nqvrAek6igwg+tYrLWdgJhy8knIH4Y0cfNjUCEXh32l1p87NQfJQAAzWeCQjCdycyuQBnHBEnPUJcEW0CDcwKQ04YATMN9WYbo5etAyjCRy30bF6nm6fdR4fjykhEFh+7uD7OuBzPnOANTwFaiV7fV0yM7cYB8MAFkFQTw4Y37zjGjbNdp7/Xg0vDF+pdS/ugopyfrAXFkN2QW8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNOWUFPcjZMNElsbUQ4SnVqTXhLTkZucS9OV3pPMEFiOVVjTi8rTmZ1ZVVx?=
 =?utf-8?B?RjBwWWRFQkl5Y0VzYy9id1E1c0szMWMzWVZCRGRkV1pBaUpTODRrL2d4YzEr?=
 =?utf-8?B?ZU5uVm5zNFpvV0prYXMyUlNNUmM4Z3llb2VmVmduSmZGdkxtZlNUeUF6Vm9C?=
 =?utf-8?B?dmk2RjM2aEhmRWYzdXpCWmRXZVp1akFHRDdVMnp6aERtS3hQTmZoZnhBT0xZ?=
 =?utf-8?B?MGM1V1o2anJ4SVUxYUNNd0hTSml0bkNqVHd1LzdQMWV0am9Vc1ZZVTJNQzdo?=
 =?utf-8?B?bjRxV28zZFY1N0hnSnVDUDR5eHhLYVpzb2hHbmRMbWtyMXN3SEZpb1U2cnhq?=
 =?utf-8?B?cWFXaktxZ21RZWxVbWtCOW9qaTRWL0l0WkVpRDJZdVVIc3J6WFJVVXI5MUFr?=
 =?utf-8?B?VzgzSGZrL0trZlZiMGd4eGd0V2RKOUxaTzlHWklzZnBMWFpnOEQ5YnMycEs0?=
 =?utf-8?B?VWhEd0VUV0w5dk42MzZQSlRYOHZDTllYR1FTWldSTCtQRjlBU1A4NWloSnFD?=
 =?utf-8?B?OThEQVVCV0lCUjNlcmIrV09vYU9NMDAvaU9MWldla3BacStXdnhYM1JvS2lv?=
 =?utf-8?B?T01USHo2azJRQW90b25Na1phSTNTTENuMDgxajlZMGRmV0pSOXlmejlMZjI1?=
 =?utf-8?B?Y0FOWUhHdmlDems3SG1MblpoamlJN1A4SnNOektDY2wyZk1xKy9nL25qZDRF?=
 =?utf-8?B?RXF2dlVnVm5jb2lzbEZxS3lEN0VkbWtxVW9CeUxBTHBiM3k5TFBzQVFJWjhu?=
 =?utf-8?B?Z1NETmY0YjlBZU50MFExZDdIdVhnMGIzOG5ZbDEvaG5DcmEwWkp4VjNzdlg5?=
 =?utf-8?B?bVRWTlNuWmJLNzhoWDVPVCs2VnVBTktTTUIwTjRTMElqeTJmd3ZhYS9EQ05h?=
 =?utf-8?B?VkVFT3AvVlk1V2RGbW5zSXRKdTBRWVFnS2tVQTlLV0luWkp2WUduNVpvWnVq?=
 =?utf-8?B?Zzd2OFovQmZCZEJOanY3Rll0TEE3djVoK3lBMytzb2o5YzBTQ29CS3g0L2Ru?=
 =?utf-8?B?VU1xdmtqMExRMzZVSnlOcWliVFBodnNUNHZYQ21zVFY3T2hHS2V3d29OUFdI?=
 =?utf-8?B?bG0wNlRUK0ZLZDl6eTBVMUZqMS8wWC9taUJ5NVpnK3hZMEE3OUJDY2hFNzhi?=
 =?utf-8?B?OEZRSWFZKzA3MytsSy9lM29VTDNGa3B5ZUVmd3lYd3U3RE52bXRaV0RhTmEw?=
 =?utf-8?B?SWtwb0daWThkUEg5Mi9hU3JaOEJPTTMrcndEOFVCcUNESHhyNmw4dzQrUDVY?=
 =?utf-8?B?dzNFQVBZbFQ2S0pOMHRRcVp0dVFlc0JMTjNjdGJlcThEdDAvb3c4ZjhRR243?=
 =?utf-8?B?YzhtbFAyWVNEWll2R1NXeWQvUG84Nm0xYi9mTk1ybEFmZzVHSWRVNGlSNGlQ?=
 =?utf-8?B?cE1MK0kzM1g0ZnNpQTRDZ0l0K0gvYzJwbm9WaFJRb1ZZYXJsYUFEK1pVV0l2?=
 =?utf-8?B?dXY3a1N5aFlkb3RHSFlHdEc4cEdtRVpveDJXNDAzeVhKWlJFRE1GdGJ0aFpo?=
 =?utf-8?B?K0s3Yk90RjBtVXN5ZGt0NHd6R3lGZURmclNiK3ZLcGJ3N3dvdFc3ZFNzT3hX?=
 =?utf-8?B?MDMxODJQWjZvMkJiend4L3lpRzBkSXpsUFMyNkwwNEJYSjIxa3JqblVEOTdS?=
 =?utf-8?B?RncwSlFMRU9lRkxWVFYzS091b2NQZFErdkJTckludVVZc2l1N1BmYUY0ZG91?=
 =?utf-8?B?WU1PZ0hQL1NMOUY1dG9VNnZqRkRXOEZaZk02cW1zbnYzRGV0WkdCbzRrZUI2?=
 =?utf-8?B?bkNweDF6QkxOYVJRTlpNVHExUDJnam84bFNCZTZXZlhDM2R2amd1YlBrMDE2?=
 =?utf-8?B?bEV0K2NGWlN4UE1uOWpGbEtEb3RnT0h3eGpkVHlkdU9lMnJGTU9kZmthNHc3?=
 =?utf-8?B?c3l4QVNiaTc0QmM4bkN5R29ZK0ZUMnVIYmdZL3YrK21qOVJacmdwVjBoUDQy?=
 =?utf-8?B?RHJIdGxPVWlCcFdiVkp3NitCL29UejNEOGlMUGJDM1ovVXp1S1hrQS9LMURP?=
 =?utf-8?B?dVpCSTlyc0J5YStzZG0xN0pIR3lKU2FHMG1SRjFJUlhZaGRucTUwUXo1UEV2?=
 =?utf-8?B?dlBzMEpYRVBHdXNqNnp1K1JKcDRSL0lTL0hqSUl5Umpjb1NCSDZXL0VGaU9C?=
 =?utf-8?Q?li4DDd4Z2LSAR1iD+dzFU6Wjt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4d68c6-b314-4ddd-ef66-08dc4adcdbe6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2024 01:59:22.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsaLM+5gEYy+13KdmtufdGSnlEpzTn4yyBoI14CZesW0EPfHiQ7Xllv9RFJLne6xOs+ZkZ2mo2sgWDxjAaesVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
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




On 3/22/2024 9:15 AM, Christian König wrote:
> Am 22.03.24 um 08:07 schrieb Rajneesh Bhardwaj:
>> This change allows TTM to be flexible to honor NUMA localized
>> allocations which can result in significant performance improvement on a
>> multi socket NUMA system. On GFXIP 9.4.3 based AMD APUs, we see
>> manyfold benefits of this change resulting not only in ~10% performance
>> improvement in certain benchmarks but also generating more consistent
>> and less sporadic results specially when the NUMA balancing is not
>> explecitely disabled. In certain scenarios, workloads show a run-to-run
>> variability e.g. HPL would show a ~10x performance drop after running
>> back to back 4-5 times and would recover later on a subsequent run. This
>> is seen with memory intensive other workloads too. It was seen that when
>> CPU caches were dropped e.g. sudo sysctl -w vm.drop_caches=1, the
>> variability reduced but the performance was still well below a good run.
>>
>> Use of __GFP_THISNODE flag ensures that during memory allocation, kernel
>> prioritizes memory allocations from the local or closest NUMA node
>> thereby reducing memory access latency.
>
> Exactly that's what it doesn't do.
>
> __GFP_THISNODE just means it enforces allocation from the specified node.

Thanks for the feedback, Christian.

Sure, maybe I should have made it clear in the commit message that there 
is no fallback to zonelist while allocating slab cache. And this is 
exactly what we want, we don't want the pages to be landing on remote nodes.

>
> Additional to that there is a mandatory requirement that this flag is 
> only used if it has to be used for correctness. And that is simply not 
> the case here.


Sorry ,I didn't quite understand this. What is the mandatory 
requirement, could you please clarify this?  Based on the documentation 
I read about this and after reading the kernel source code, I didn't 
find any hard requirement to discourage use of this.


>
> So as long as nobody can explain why that should help this is an 
> absolutely no-go.


Could you please clarify the controversial part here? We have absolutely 
strong backing data the proves the usefulness besides this change 
restricts us to a certain HW IP. Also, the possibilty of OOM killer 
seems to less actually when we use __THISNODE.

https://elixir.bootlin.com/linux/latest/source/mm/page_alloc.c#L3439


Another important thing I want to highlight here is that for AMD 
GFXIP9.4.3 APU, which has unified HBM stack (no RAM/VRAM distinction), 
we get the backing vram pages using ttm_pool_alloc_page(nid) already.



>
> Regards,
> Christian.
>
>>   When memory is allocated using
>> __GFP_THISNODE flag, memory allocations will predominantly be done on
>> the local node, consequency, the shrinkers may priotitize reclaiming
>> memory from caches assocoated with local node to maintain memory
>> locality and minimize latency, thereby provide better shinker targeting.
>>
>> Reduced memory pressure on remote nodes, can also indirectly influence
>> shrinker behavior by potentially reducing the frequency and intensity of
>> memory reclamation operation on remote nodes and could provide improved
>> overall system performance.
>>
>> While this change could be more beneficial in general, i.e., without the
>> use of a module parameter, but in absence of widespread testing, limit
>> it to the AMD GFXIP 9.4.3 based ttm pool initializations only.
>>
>>
>> Cc: Joe Greathouse <joseph.greathouse@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  8 ++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  7 ++++++-
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 10 +++++-----
>>   drivers/gpu/drm/ttm/ttm_device.c          |  2 +-
>>   drivers/gpu/drm/ttm/ttm_pool.c            |  7 ++++++-
>>   include/drm/ttm/ttm_pool.h                |  4 +++-
>>   7 files changed, 30 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 9c62552bec34..96532cfc6230 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -253,6 +253,7 @@ extern int amdgpu_user_partt_mode;
>>   extern int amdgpu_agp;
>>     extern int amdgpu_wbrf;
>> +extern bool strict_numa_alloc;
>>     #define AMDGPU_VM_MAX_NUM_CTX            4096
>>   #define AMDGPU_SG_THRESHOLD            (256*1024*1024)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 80b9642f2bc4..a183a6b4493d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -781,6 +781,14 @@ int queue_preemption_timeout_ms = 9000;
>>   module_param(queue_preemption_timeout_ms, int, 0644);
>>   MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption 
>> timeout in ms (1 = Minimum, 9000 = default)");
>>   +/**
>> + * DOC: strict_numa_alloc(bool)
>> + * Policy to force NUMA allocation requests from the proximity NUMA 
>> domain only.
>> + */
>> +bool strict_numa_alloc;
>> +module_param(strict_numa_alloc, bool, 0444);
>> +MODULE_PARM_DESC(strict_numa_alloc, "Force NUMA allocation requests 
>> to be satisfied from the closest node only (false = default)");
>> +
>>   /**
>>    * DOC: debug_evictions(bool)
>>    * Enable extra debug messages to help determine the cause of 
>> evictions
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index b0ed10f4de60..a9f78f85e28c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1768,6 +1768,7 @@ static int amdgpu_ttm_reserve_tmr(struct 
>> amdgpu_device *adev)
>>     static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
>>   {
>> +    bool policy = true;
>>       int i;
>>         if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
>> @@ -1779,11 +1780,15 @@ static int amdgpu_ttm_pools_init(struct 
>> amdgpu_device *adev)
>>       if (!adev->mman.ttm_pools)
>>           return -ENOMEM;
>>   +    /* Policy not only depends on the module param but also on the 
>> ASIC
>> +     * setting use_strict_numa_alloc as well.
>> +     */
>>       for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
>>           ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
>>                     adev->gmc.mem_partitions[i].numa.node,
>> -                  false, false);
>> +                  false, false, policy && strict_numa_alloc);
>>       }
>> +
>>       return 0;
>>   }
>>   diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> index 2d9cae8cd984..6ff47aac570a 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> @@ -87,7 +87,7 @@ static struct ttm_pool 
>> *ttm_pool_pre_populated(struct kunit *test,
>>       pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>       KUNIT_ASSERT_NOT_NULL(test, pool);
>>   -    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>> +    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>>         err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>       KUNIT_ASSERT_EQ(test, err, 0);
>> @@ -152,7 +152,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
>>       KUNIT_ASSERT_NOT_NULL(test, pool);
>>         ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, 
>> params->use_dma_alloc,
>> -              false);
>> +              false, false);
>>         KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
>>       KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>> @@ -219,7 +219,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct 
>> kunit *test)
>>       pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>       KUNIT_ASSERT_NOT_NULL(test, pool);
>>   -    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>> +    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>>         err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>       KUNIT_ASSERT_EQ(test, err, 0);
>> @@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit 
>> *test)
>>       pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>       KUNIT_ASSERT_NOT_NULL(test, pool);
>>   -    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
>> +    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
>>       ttm_pool_alloc(pool, tt, &simple_ctx);
>>         pt = &pool->caching[caching].orders[order];
>> @@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct 
>> kunit *test)
>>       pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>       KUNIT_ASSERT_NOT_NULL(test, pool);
>>   -    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
>> +    ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false, false);
>>       ttm_pool_alloc(pool, tt, &simple_ctx);
>>         pt = &pool->caching[caching].orders[order];
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index f5187b384ae9..540e8a44f015 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -215,7 +215,7 @@ int ttm_device_init(struct ttm_device *bdev, 
>> const struct ttm_device_funcs *func
>>         ttm_sys_man_init(bdev);
>>   -    ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), 
>> use_dma_alloc, use_dma32);
>> +    ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, 
>> use_dma32, false);
>>         bdev->vma_manager = vma_manager;
>>       spin_lock_init(&bdev->lru_lock);
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>> b/drivers/gpu/drm/ttm/ttm_pool.c
>> index dbc96984d331..73aafd06c361 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -447,6 +447,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct 
>> ttm_tt *tt,
>>       else
>>           gfp_flags |= GFP_HIGHUSER;
>>   +    if (pool->use_strict_numa_alloc)
>> +        gfp_flags |= __GFP_THISNODE;
>> +
>>       for (order = min_t(unsigned int, MAX_ORDER, __fls(num_pages));
>>            num_pages;
>>            order = min_t(unsigned int, order, __fls(num_pages))) {
>> @@ -555,7 +558,8 @@ EXPORT_SYMBOL(ttm_pool_free);
>>    * Initialize the pool and its pool types.
>>    */
>>   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> -           int nid, bool use_dma_alloc, bool use_dma32)
>> +           int nid, bool use_dma_alloc, bool use_dma32,
>> +           bool use_strict_numa_alloc)
>>   {
>>       unsigned int i, j;
>>   @@ -565,6 +569,7 @@ void ttm_pool_init(struct ttm_pool *pool, 
>> struct device *dev,
>>       pool->nid = nid;
>>       pool->use_dma_alloc = use_dma_alloc;
>>       pool->use_dma32 = use_dma32;
>> +    pool->use_strict_numa_alloc = use_strict_numa_alloc;
>>         if (use_dma_alloc || nid != NUMA_NO_NODE) {
>>           for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
>> index 30a347e5aa11..6b7bdc952466 100644
>> --- a/include/drm/ttm/ttm_pool.h
>> +++ b/include/drm/ttm/ttm_pool.h
>> @@ -72,6 +72,7 @@ struct ttm_pool {
>>         bool use_dma_alloc;
>>       bool use_dma32;
>> +    bool use_strict_numa_alloc;
>>         struct {
>>           struct ttm_pool_type orders[MAX_ORDER + 1];
>> @@ -83,7 +84,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct 
>> ttm_tt *tt,
>>   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
>>     void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>> -           int nid, bool use_dma_alloc, bool use_dma32);
>> +           int nid, bool use_dma_alloc, bool use_dma32,
>> +           bool use_strict_numa_alloc);
>>   void ttm_pool_fini(struct ttm_pool *pool);
>>     int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>
