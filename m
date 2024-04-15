Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F38A571F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 18:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F097610ED03;
	Mon, 15 Apr 2024 16:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XEbCh6cR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B135410ED03;
 Mon, 15 Apr 2024 16:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpBJM6rOc7NfM24UcnlQAc6buVVgMHOjvZnU09AIsA5kOzZ1MeJ9KekrPed4ATwpfeZslv7ublx3je0RkZ3arnM9DhsSvJRYi92M2ZJftPEffZTwMhKB77jnNMWIjMLuO1ETVXSTqzhqiqd4cRGDHPNJUqCDPoG31roUubwhrlR9bI2S2Yiur9cgIL+SSR5PjYUQYZTitSH7S8s8nIBXkoq8VCf7G9pS+jiAqXjrK09tEZurhtdr6EZLKrsAdkHQ845P30Wa4zHr7/N7737Bom8Lk11q9PauNO3nL5/onXqw0i43NiFoyuqkUh6gdYLfzMbsWnnh3M9xEhoCGmvIwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaMDnasCc7gnXHxuo9Fvu9IFFJOt8QUNqRwtm8kaVwY=;
 b=g16O2wQCBiaSNQzO6n+mzi4Ydv4L5BTidfzKlSqeKObpkIgUZluEzmM8N7uy60LHrajMsg5PrtDRb6UvXA9EE1XPxzTzUDpJFLBCCpHkXPJqKyzcwxba835Yq9feprQlY9ZVEV0f8ULnC6C+kxjnCLHqaERXv/QW8s6M9PRAr/t5za1RFfKCTCP4chlXBb3BIZ33ZyEenSvC6lt5ZQL4KQOs4tQQDa+vAvxJQSc46emiYHmDvyCn8dHY2gAdfnj5Z3+daR87v5Q1+oC8u5i263qyR7aDPrLwpqvGIaidLyuZFfrmCFTgSqNtcFZRoEg/EsNBCglb0XCz1wYfpIA6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaMDnasCc7gnXHxuo9Fvu9IFFJOt8QUNqRwtm8kaVwY=;
 b=XEbCh6cRiY1rXIeBFHyIxxQNArTVFV7fZduWXQZv0hdRlC4gAuiOLXK3FOv8roPdblEOvsj8ETcOc3uw4+YmCm4Z7LWKyClaR0npyxV+HWiXvRSWhP6X/weMDA5tmOJgBRajSW9fyzpHAn5v2YTxXhV37O02RCwZ3NtWCaYe3x4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 16:09:13 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%5]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 16:09:13 +0000
Message-ID: <bb57c6d6-3fa8-4503-97f5-eb9e9bfcf8ed@amd.com>
Date: Mon, 15 Apr 2024 21:39:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] drm/buddy: Implement tracking clear page feature
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240414212349.2834-1-Arunpravin.PaneerSelvam@amd.com>
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240414212349.2834-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0250.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::15) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: c206e4dd-cf0e-440f-5053-08dc5d66646c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LzZJPM3roAGBwAtM8P1tT5NIi52m/4/7o/YxB8clDCefpyPlcgBU6lDwwiMNMnP3Fc2WusshJLCQOGq4SbjBVpGk7UzMyUMkheH0sovmPzEyDPeEa29SAgRMXEyViA2fCbalfS4XIi768A9jVwAVK9HRkmcdnE0KubUb4KGgDNYO0HiNUaxsdoxRbBwZ7EI3ki921HgwCvfZurUw86nPxRxdD3Dwfx1omDBCfkHx0W8bQeZb+D8Qzg6/SFLVNc4NCdswpcyWayWsNxddzwunlaUWodsKI+NR+ExQdGEaeYTonR7laV8qQ0Oqja77UQc6uivywbgdrORbJDOhgXisPkiwH5JrLhHxdGYwF91URHl5Ygs4kvluNPb9V2hNOnb44D0LcJwZl95xEC3hJpj6ibhq5QUgFEUOVDHs3EuqKBdeQGp5C6CvZevmTWybQc3YNiqb5NnviI26vswCAOdwT8EoJMB2ThhrXf/EJBogaGYerIPvyNsf7h8vH7MxfrT40oCqlXJdc3C4Adh1LOqOEVMWg8BC4btOnKUMWfJVpyIhuLXKGBi2Hb8LENT8Osu4atpUsdsI+gthg5wuQb5d4EbamrVVuCBIcIpvR9E4+Jk05S5IsQihA7Mh3smrcSNWSJidWHg2gOZN1l/elw/Z0rEC9WIXQCJhB2GKrhf2AiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VksydjU3TGl0VVlXeFBPY1hWb3c4ZmpuaHdlMXE3QVFUY01PWlBiS3VyUmV6?=
 =?utf-8?B?RVByR0pNZE9SaFhyRmZ2SVF6SXZidWtXUHRTbURybTQrK2NaWStOanVwNUJV?=
 =?utf-8?B?S0VibDdNOS9EZFZBd0wrZ1JyK2JDRk5hcE1mMUtQeEZ6ODZZaHVxUUQ2bmtn?=
 =?utf-8?B?citxQjF1blFWWjRuS3dlb2FzaVJwMU42MnZEMWhjdzcwUndVQUZRTHVFUjRh?=
 =?utf-8?B?dWt6M3RLYmNGclVvU2JXbXpGdUR5YVhBOW9WbTRaRG1YLzg1dHAzcG5lbDN4?=
 =?utf-8?B?VkI5UFdFN29SUEY0blpsZk5FWWhuTnNOS0ZlRHFlVENQbmI0UFJoMVhsMDlV?=
 =?utf-8?B?bFZBMWljUGFGZmxXNW1qT2wydlEzYTlXWXRxZWtPaG9RNGx2RllMRWlVeDNT?=
 =?utf-8?B?cDVmQng3U1dDNTRmV1ZKTGRpNk90ZDF5MVdRcGg0OFh6WFBDRGNtTG90d0lB?=
 =?utf-8?B?Ykd2KzFQK2tVOUJ0Nm1MckJON0VEVFMybFpJbWNHeitwRVBLdW9mUUVqUEk5?=
 =?utf-8?B?SDhDZDY0MlJhVWdOTHpEWXpOMjUyZDBEbXJjU2RYaCs3N1FaK3RUWWYvVXN2?=
 =?utf-8?B?NGw4MkhXaTUwWFF5ZzBEOW14Zk11U3Zhc2hoMGNlczhCZ2ZHUlJRWUpRMS80?=
 =?utf-8?B?WlZkek5ReUNVRkI5dUNiTW9jVHNQTXcxWE9KUExyOER2dWdaZTNiNFRDaThm?=
 =?utf-8?B?ZlYwU2Q2VGVRNlJjZllWN1RXa3o3M1hkZjRLWW54TWR0cmZXSzFZdmthblV0?=
 =?utf-8?B?RGY5Vm1jNlN2dlNVVS9iWm9RTkF3RXp5VWg0cGhhbU9JYWRlcU1IN2lUYlpz?=
 =?utf-8?B?QmJWUGd4MVVxS1JVNC95VityNnVpb1MwM0JiSWFYVXVKWVRCeFRkOWllZGEz?=
 =?utf-8?B?eXJPWHdTa2ZlSHZObTdNaExxTkdKZ1FYTDNXdHZ0VEdlVnAreTdjRUNzMGF3?=
 =?utf-8?B?WGxwYlp5L0lrUUZUSTJkeFNHRXJQMU5TOGdQRGx1U3M3eFlMSDR3cXlwckZn?=
 =?utf-8?B?K1phSHNoZ2NMdzFKK3FaMWI1N2k5M25Sb1Nrd1grRjNRRE9kY2U2eGVBM1Yr?=
 =?utf-8?B?VlpGcDRXTlhJWVYxUVUwRjZNRGhHc3pUQjhwMzFsZE1ZNUJhblFrTzR6VjU1?=
 =?utf-8?B?NHVjdVJBbWZwaWdPcnpLbm0zczlJNWF4M25XK2o3WFUwTkhRT0t0Q2sxRWpw?=
 =?utf-8?B?S1pBQXduci9yTm94SEIvY0tXRGVMMzNjRDhrbS9Rckp2b01leklYZUhEMFNJ?=
 =?utf-8?B?N016SXFvRm9KMkg3RmZhYzJFbUp4eno3VC81T3JxUk1ZN3NSem1pdmwxdzFN?=
 =?utf-8?B?U0xCa1RiRmFEa3hwZHZoMzF4TjFwWEVWVzExUTl1SnJUYUxGT0kyMGt0TDVQ?=
 =?utf-8?B?eHBqUlpRTUp6cDhYQk1UNjdCdEhYWUptTmtqeDFDVGwzY05XcGlEV1owVnIv?=
 =?utf-8?B?MEN6d2ZVMkU2clF6SzFVRGk4QkQwMGJNaFNwaldYM1RZR2trK2JXSkFoek95?=
 =?utf-8?B?TjBkblIxMWRiSWF3WXZndmlyVTZpNjJRdG9MeDBRUTlIanc2MFJPSDBDTnMy?=
 =?utf-8?B?eU9mUHlUam5sMUpNbWNFdUUxUlJuMjlucWRtWmVFVjBVSTJGWFM4STFjVEF3?=
 =?utf-8?B?cHpQeVpnTVY3SFFuVVdFYU9uYkJsbVBDOWZXQ3MyeElScGJQd3JoMnZ3bjJ2?=
 =?utf-8?B?YVlNQW92aTNZUW5zMjdITDd6b21ObHdNTEFrd2RkWFJhWmxxM0F1Vlkyd3pT?=
 =?utf-8?B?Szd3QVZSUElzVUQ3VW1ScGhIeUVDUUw4OW10VXpkMHQ3TDNRcEcvNGd3bWls?=
 =?utf-8?B?MlV3SklrUTM1K0Jablc3WGRJczRyNUdOalE3SC95K3lJNFlPSmZDS29jYzJh?=
 =?utf-8?B?blFOUURrRWRJcnRJU08yanpSNGdIemE0SFltRmtNNmlVVE8zUTVLWmtxRzRw?=
 =?utf-8?B?ZG1XbkhUZ1pXT2R4dDZaMzByMWJRZ1hPQlAyd3JhalZ2NnhTckFadU5wcUx5?=
 =?utf-8?B?TjRBQkZtcWorcHlQK3F4TERBdG85SVBsSUcwTXBITGQrUzh0Y0VsMDl5UVFV?=
 =?utf-8?B?b1U3YkhYZmZMRDdFT3hidk9FdW10WmlDZjJxTCtBdVdZMTlkRTNPWGEzOGFx?=
 =?utf-8?Q?JhxxTHJwxFFnyRVmjlCUs8OLT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c206e4dd-cf0e-440f-5053-08dc5d66646c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 16:09:13.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYmnZ9wsTGmxBAFUcSFc6yMxeqWJye9KkdKOGsbCB6M28z1ZvH9Vw1Llmynb+Weh05uA8DygufJH4CEGCTU2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
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

Hi Christian,
Could you please push these patches into drm branch.

Thanks,
Arun.

On 4/15/2024 2:53 AM, Arunpravin Paneer Selvam wrote:
> - Add tracking clear page feature.
>
> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>    successfully clears the blocks in the free path. On the otherhand,
>    DRM buddy marks each block as cleared.
>
> - Track the available cleared pages size
>
> - If driver requests cleared memory we prefer cleared memory
>    but fallback to uncleared if we can't find the cleared blocks.
>    when driver requests uncleared memory we try to use uncleared but
>    fallback to cleared memory if necessary.
>
> - When a block gets freed we clear it and mark the freed block as cleared,
>    when there are buddies which are cleared as well we can merge them.
>    Otherwise, we prefer to keep the blocks as separated.
>
> - Add a function to support defragmentation.
>
> v1:
>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>      cleared. Else, reset the clear flag for each block in the list(Christian)
>    - For merging the 2 cleared blocks compare as below,
>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)(Christian)
>    - Defragment the memory beginning from min_order
>      till the required memory space is available.
>
> v2: (Matthew)
>    - Add a wrapper drm_buddy_free_list_internal for the freeing of blocks
>      operation within drm buddy.
>    - Write a macro block_incompatible() to allocate the required blocks.
>    - Update the xe driver for the drm_buddy_free_list change in arguments.
>    - add a warning if the two blocks are incompatible on
>      defragmentation
>    - call full defragmentation in the fini() function
>    - place a condition to test if min_order is equal to 0
>    - replace the list with safe_reverse() variant as we might
>      remove the block from the list.
>
> v3:
>    - fix Gitlab user reported lockup issue.
>    - Keep DRM_BUDDY_HEADER_CLEAR define sorted(Matthew)
>    - modify to pass the root order instead max_order in fini()
>      function(Matthew)
>    - change bool 1 to true(Matthew)
>    - add check if min_block_size is power of 2(Matthew)
>    - modify the min_block_size datatype to u64(Matthew)
>
> v4:
>    - rename the function drm_buddy_defrag with __force_merge.
>    - Include __force_merge directly in drm buddy file and remove
>      the defrag use in amdgpu driver.
>    - Remove list_empty() check(Matthew)
>    - Remove unnecessary space, headers and placement of new variables(Matthew)
>    - Add a unit test case(Matthew)
>
> v5:
>    - remove force merge support to actual range allocation and not to bail
>      out when contains && split(Matthew)
>    - add range support to force merge function.
>
> v6:
>    - modify the alloc_range() function clear page non merged blocks
>      allocation(Matthew)
>    - correct the list_insert function name(Matthew).
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>   drivers/gpu/drm/drm_buddy.c                   | 427 ++++++++++++++----
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>   drivers/gpu/drm/tests/drm_buddy_test.c        |  28 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
>   include/drm/drm_buddy.h                       |  16 +-
>   6 files changed, 363 insertions(+), 124 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 8db880244324..c0c851409241 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> @@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   		kfree(rsv);
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
> -		drm_buddy_free_list(&mgr->mm, &rsv->allocated);
> +		drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>   		kfree(rsv);
>   	}
>   	if (!adev->gmc.is_app_apu)
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 5ebdd6f8f36e..284ebae71cc4 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>   	__list_add(&block->link, node->link.prev, &node->link);
>   }
>   
> +static void clear_reset(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
> +}
> +
> +static void mark_cleared(struct drm_buddy_block *block)
> +{
> +	block->header |= DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static void mark_allocated(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
> @@ -82,6 +92,133 @@ static void mark_split(struct drm_buddy_block *block)
>   	list_del(&block->link);
>   }
>   
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= e2 && e1 >= s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= s2 && e1 >= e2;
> +}
> +
> +static struct drm_buddy_block *
> +__get_buddy(struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *parent;
> +
> +	parent = block->parent;
> +	if (!parent)
> +		return NULL;
> +
> +	if (parent->left == block)
> +		return parent->right;
> +
> +	return parent->left;
> +}
> +
> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
> +				     struct drm_buddy_block *block,
> +				     bool force_merge)
> +{
> +	struct drm_buddy_block *parent;
> +	unsigned int order;
> +
> +	while ((parent = block->parent)) {
> +		struct drm_buddy_block *buddy;
> +
> +		buddy = __get_buddy(block);
> +
> +		if (!drm_buddy_block_is_free(buddy))
> +			break;
> +
> +		if (!force_merge) {
> +			/*
> +			 * Check the block and its buddy clear state and exit
> +			 * the loop if they both have the dissimilar state.
> +			 */
> +			if (drm_buddy_block_is_clear(block) !=
> +			    drm_buddy_block_is_clear(buddy))
> +				break;
> +
> +			if (drm_buddy_block_is_clear(block))
> +				mark_cleared(parent);
> +		}
> +
> +		list_del(&buddy->link);
> +		if (force_merge && drm_buddy_block_is_clear(buddy))
> +			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
> +
> +		drm_block_free(mm, block);
> +		drm_block_free(mm, buddy);
> +
> +		block = parent;
> +	}
> +
> +	order = drm_buddy_block_order(block);
> +	mark_free(mm, block);
> +
> +	return order;
> +}
> +
> +static int __force_merge(struct drm_buddy *mm,
> +			 u64 start,
> +			 u64 end,
> +			 unsigned int min_order)
> +{
> +	unsigned int order;
> +	int i;
> +
> +	if (!min_order)
> +		return -ENOMEM;
> +
> +	if (min_order > mm->max_order)
> +		return -EINVAL;
> +
> +	for (i = min_order - 1; i >= 0; i--) {
> +		struct drm_buddy_block *block, *prev;
> +
> +		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
> +			struct drm_buddy_block *buddy;
> +			u64 block_start, block_end;
> +
> +			if (!block->parent)
> +				continue;
> +
> +			block_start = drm_buddy_block_offset(block);
> +			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +			if (!contains(start, end, block_start, block_end))
> +				continue;
> +
> +			buddy = __get_buddy(block);
> +			if (!drm_buddy_block_is_free(buddy))
> +				continue;
> +
> +			WARN_ON(drm_buddy_block_is_clear(block) ==
> +				drm_buddy_block_is_clear(buddy));
> +
> +			/*
> +			 * If the prev block is same as buddy, don't access the
> +			 * block in the next iteration as we would free the
> +			 * buddy block as part of the free function.
> +			 */
> +			if (prev == buddy)
> +				prev = list_prev_entry(prev, link);
> +
> +			list_del(&block->link);
> +			if (drm_buddy_block_is_clear(block))
> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
> +
> +			order = __drm_buddy_free(mm, block, true);
> +			if (order >= min_order)
> +				return 0;
> +		}
> +	}
> +
> +	return -ENOMEM;
> +}
> +
>   /**
>    * drm_buddy_init - init memory manager
>    *
> @@ -186,11 +323,21 @@ EXPORT_SYMBOL(drm_buddy_init);
>    */
>   void drm_buddy_fini(struct drm_buddy *mm)
>   {
> +	u64 root_size, size;
> +	unsigned int order;
>   	int i;
>   
> +	size = mm->size;
> +
>   	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		__force_merge(mm, 0, size, order);
> +
>   		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>   		drm_block_free(mm, mm->roots[i]);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
>   	}
>   
>   	WARN_ON(mm->avail != mm->size);
> @@ -223,26 +370,17 @@ static int split_block(struct drm_buddy *mm,
>   	mark_free(mm, block->left);
>   	mark_free(mm, block->right);
>   
> +	if (drm_buddy_block_is_clear(block)) {
> +		mark_cleared(block->left);
> +		mark_cleared(block->right);
> +		clear_reset(block);
> +	}
> +
>   	mark_split(block);
>   
>   	return 0;
>   }
>   
> -static struct drm_buddy_block *
> -__get_buddy(struct drm_buddy_block *block)
> -{
> -	struct drm_buddy_block *parent;
> -
> -	parent = block->parent;
> -	if (!parent)
> -		return NULL;
> -
> -	if (parent->left == block)
> -		return parent->right;
> -
> -	return parent->left;
> -}
> -
>   /**
>    * drm_get_buddy - get buddy address
>    *
> @@ -260,30 +398,6 @@ drm_get_buddy(struct drm_buddy_block *block)
>   }
>   EXPORT_SYMBOL(drm_get_buddy);
>   
> -static void __drm_buddy_free(struct drm_buddy *mm,
> -			     struct drm_buddy_block *block)
> -{
> -	struct drm_buddy_block *parent;
> -
> -	while ((parent = block->parent)) {
> -		struct drm_buddy_block *buddy;
> -
> -		buddy = __get_buddy(block);
> -
> -		if (!drm_buddy_block_is_free(buddy))
> -			break;
> -
> -		list_del(&buddy->link);
> -
> -		drm_block_free(mm, block);
> -		drm_block_free(mm, buddy);
> -
> -		block = parent;
> -	}
> -
> -	mark_free(mm, block);
> -}
> -
>   /**
>    * drm_buddy_free_block - free a block
>    *
> @@ -295,42 +409,74 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>   {
>   	BUG_ON(!drm_buddy_block_is_allocated(block));
>   	mm->avail += drm_buddy_block_size(mm, block);
> -	__drm_buddy_free(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
> +
> +	__drm_buddy_free(mm, block, false);
>   }
>   EXPORT_SYMBOL(drm_buddy_free_block);
>   
> -/**
> - * drm_buddy_free_list - free blocks
> - *
> - * @mm: DRM buddy manager
> - * @objects: input list head to free blocks
> - */
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
> +static void __drm_buddy_free_list(struct drm_buddy *mm,
> +				  struct list_head *objects,
> +				  bool mark_clear,
> +				  bool mark_dirty)
>   {
>   	struct drm_buddy_block *block, *on;
>   
> +	WARN_ON(mark_dirty && mark_clear);
> +
>   	list_for_each_entry_safe(block, on, objects, link) {
> +		if (mark_clear)
> +			mark_cleared(block);
> +		else if (mark_dirty)
> +			clear_reset(block);
>   		drm_buddy_free_block(mm, block);
>   		cond_resched();
>   	}
>   	INIT_LIST_HEAD(objects);
>   }
> -EXPORT_SYMBOL(drm_buddy_free_list);
>   
> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +static void drm_buddy_free_list_internal(struct drm_buddy *mm,
> +					 struct list_head *objects)
>   {
> -	return s1 <= e2 && e1 >= s2;
> +	/*
> +	 * Don't touch the clear/dirty bit, since allocation is still internal
> +	 * at this point. For example we might have just failed part of the
> +	 * allocation.
> +	 */
> +	__drm_buddy_free_list(mm, objects, false, false);
>   }
>   
> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +/**
> + * drm_buddy_free_list - free blocks
> + *
> + * @mm: DRM buddy manager
> + * @objects: input list head to free blocks
> + * @flags: optional flags like DRM_BUDDY_CLEARED
> + */
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned int flags)
>   {
> -	return s1 <= s2 && e1 >= e2;
> +	bool mark_clear = flags & DRM_BUDDY_CLEARED;
> +
> +	__drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
> +}
> +EXPORT_SYMBOL(drm_buddy_free_list);
> +
> +static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags)
> +{
> +	bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
> +
> +	return needs_clear != drm_buddy_block_is_clear(block);
>   }
>   
>   static struct drm_buddy_block *
> -alloc_range_bias(struct drm_buddy *mm,
> -		 u64 start, u64 end,
> -		 unsigned int order)
> +__alloc_range_bias(struct drm_buddy *mm,
> +		   u64 start, u64 end,
> +		   unsigned int order,
> +		   unsigned long flags,
> +		   bool fallback)
>   {
>   	u64 req_size = mm->chunk_size << order;
>   	struct drm_buddy_block *block;
> @@ -379,6 +525,9 @@ alloc_range_bias(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
> +			if (!fallback && block_incompatible(block, flags))
> +				continue;
> +
>   			/*
>   			 * Find the free block within the range.
>   			 */
> @@ -410,30 +559,57 @@ alloc_range_bias(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, false);
>   	return ERR_PTR(err);
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order)
> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
> +			     u64 start, u64 end,
> +			     unsigned int order,
> +			     unsigned long flags)
> +{
> +	struct drm_buddy_block *block;
> +	bool fallback = false;
> +
> +	block = __alloc_range_bias(mm, start, end, order,
> +				   flags, fallback);
> +	if (IS_ERR(block) && mm->clear_avail)
> +		return __alloc_range_bias(mm, start, end, order,
> +					  flags, !fallback);
> +
> +	return block;
> +}
> +
> +static struct drm_buddy_block *
> +get_maxblock(struct drm_buddy *mm, unsigned int order,
> +	     unsigned long flags)
>   {
> -	struct drm_buddy_block *max_block = NULL, *node;
> +	struct drm_buddy_block *max_block = NULL, *block = NULL;
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		if (!list_empty(&mm->free_list[i])) {
> -			node = list_last_entry(&mm->free_list[i],
> -					       struct drm_buddy_block,
> -					       link);
> -			if (!max_block) {
> -				max_block = node;
> +		struct drm_buddy_block *tmp_block;
> +
> +		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
> +			if (block_incompatible(tmp_block, flags))
>   				continue;
> -			}
>   
> -			if (drm_buddy_block_offset(node) >
> -			    drm_buddy_block_offset(max_block)) {
> -				max_block = node;
> -			}
> +			block = tmp_block;
> +			break;
> +		}
> +
> +		if (!block)
> +			continue;
> +
> +		if (!max_block) {
> +			max_block = block;
> +			continue;
> +		}
> +
> +		if (drm_buddy_block_offset(block) >
> +		    drm_buddy_block_offset(max_block)) {
> +			max_block = block;
>   		}
>   	}
>   
> @@ -450,11 +626,29 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	int err;
>   
>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order);
> +		block = get_maxblock(mm, order, flags);
>   		if (block)
>   			/* Store the obtained block order */
>   			tmp = drm_buddy_block_order(block);
>   	} else {
> +		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			struct drm_buddy_block *tmp_block;
> +
> +			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
> +				if (block_incompatible(tmp_block, flags))
> +					continue;
> +
> +				block = tmp_block;
> +				break;
> +			}
> +
> +			if (block)
> +				break;
> +		}
> +	}
> +
> +	if (!block) {
> +		/* Fallback method */
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>   			if (!list_empty(&mm->free_list[tmp])) {
>   				block = list_last_entry(&mm->free_list[tmp],
> @@ -464,10 +658,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>   					break;
>   			}
>   		}
> -	}
>   
> -	if (!block)
> -		return ERR_PTR(-ENOSPC);
> +		if (!block)
> +			return ERR_PTR(-ENOSPC);
> +	}
>   
>   	BUG_ON(!drm_buddy_block_is_free(block));
>   
> @@ -483,7 +677,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>   
>   err_undo:
>   	if (tmp != order)
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, false);
>   	return ERR_PTR(err);
>   }
>   
> @@ -526,16 +720,18 @@ static int __alloc_range(struct drm_buddy *mm,
>   		}
>   
>   		if (contains(start, end, block_start, block_end)) {
> -			if (!drm_buddy_block_is_free(block)) {
> +			if (drm_buddy_block_is_free(block)) {
> +				mark_allocated(block);
> +				total_allocated += drm_buddy_block_size(mm, block);
> +				mm->avail -= drm_buddy_block_size(mm, block);
> +				if (drm_buddy_block_is_clear(block))
> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
> +				list_add_tail(&block->link, &allocated);
> +				continue;
> +			} else if (!mm->clear_avail) {
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
> -
> -			mark_allocated(block);
> -			total_allocated += drm_buddy_block_size(mm, block);
> -			mm->avail -= drm_buddy_block_size(mm, block);
> -			list_add_tail(&block->link, &allocated);
> -			continue;
>   		}
>   
>   		if (!drm_buddy_block_is_split(block)) {
> @@ -567,14 +763,14 @@ static int __alloc_range(struct drm_buddy *mm,
>   	if (buddy &&
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
> -		__drm_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block, false);
>   
>   err_free:
>   	if (err == -ENOSPC && total_allocated_on_err) {
>   		list_splice_tail(&allocated, blocks);
>   		*total_allocated_on_err = total_allocated;
>   	} else {
> -		drm_buddy_free_list(mm, &allocated);
> +		drm_buddy_free_list_internal(mm, &allocated);
>   	}
>   
>   	return err;
> @@ -640,11 +836,11 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   			list_splice(&blocks_lhs, blocks);
>   			return 0;
>   		} else if (err != -ENOSPC) {
> -			drm_buddy_free_list(mm, blocks);
> +			drm_buddy_free_list_internal(mm, blocks);
>   			return err;
>   		}
>   		/* Free blocks for the next iteration */
> -		drm_buddy_free_list(mm, blocks);
> +		drm_buddy_free_list_internal(mm, blocks);
>   	}
>   
>   	return -ENOSPC;
> @@ -700,6 +896,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	list_del(&block->link);
>   	mark_free(mm, block);
>   	mm->avail += drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
>   
>   	/* Prevent recursively freeing this node */
>   	parent = block->parent;
> @@ -711,6 +909,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	if (err) {
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		list_add(&block->link, blocks);
>   	}
>   
> @@ -719,13 +919,28 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   }
>   EXPORT_SYMBOL(drm_buddy_block_trim);
>   
> +static struct drm_buddy_block *
> +__drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			 u64 start, u64 end,
> +			 unsigned int order,
> +			 unsigned long flags)
> +{
> +	if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> +		/* Allocate traversing within the range */
> +		return  __drm_buddy_alloc_range_bias(mm, start, end,
> +						     order, flags);
> +	else
> +		/* Allocate from freelist */
> +		return alloc_from_freelist(mm, order, flags);
> +}
> +
>   /**
>    * drm_buddy_alloc_blocks - allocate power-of-two blocks
>    *
>    * @mm: DRM buddy manager to allocate from
>    * @start: start of the allowed range for this block
>    * @end: end of the allowed range for this block
> - * @size: size of the allocation
> + * @size: size of the allocation in bytes
>    * @min_block_size: alignment of the allocation
>    * @blocks: output list head to add allocated blocks
>    * @flags: DRM_BUDDY_*_ALLOCATION flags
> @@ -800,23 +1015,33 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		BUG_ON(order < min_order);
>   
>   		do {
> -			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> -				/* Allocate traversing within the range */
> -				block = alloc_range_bias(mm, start, end, order);
> -			else
> -				/* Allocate from freelist */
> -				block = alloc_from_freelist(mm, order, flags);
> -
> +			block = __drm_buddy_alloc_blocks(mm, start,
> +							 end,
> +							 order,
> +							 flags);
>   			if (!IS_ERR(block))
>   				break;
>   
>   			if (order-- == min_order) {
> +				/* Try allocation through force merge method */
> +				if (mm->clear_avail &&
> +				    !__force_merge(mm, start, end, min_order)) {
> +					block = __drm_buddy_alloc_blocks(mm, start,
> +									 end,
> +									 min_order,
> +									 flags);
> +					if (!IS_ERR(block)) {
> +						order = min_order;
> +						break;
> +					}
> +				}
> +
> +				/*
> +				 * Try contiguous block allocation through
> +				 * try harder method.
> +				 */
>   				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>   				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
> -					/*
> -					 * Try contiguous block allocation through
> -					 * try harder method
> -					 */
>   					return __alloc_contig_try_harder(mm,
>   									 original_size,
>   									 original_min_size,
> @@ -828,6 +1053,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		kmemleak_update_trace(block);
>   		list_add_tail(&block->link, &allocated);
>   
> @@ -866,7 +1093,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	return 0;
>   
>   err_free:
> -	drm_buddy_free_list(mm, &allocated);
> +	drm_buddy_free_list_internal(mm, &allocated);
>   	return err;
>   }
>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> @@ -899,8 +1126,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   {
>   	int order;
>   
> -	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
> -		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
> +	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
> +		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
>   	for (order = mm->max_order; order >= 0; order--) {
>   		struct drm_buddy_block *block;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 0d735d5c2b35..942345548bc3 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	return 0;
>   
>   err_free_blocks:
> -	drm_buddy_free_list(mm, &bman_res->blocks);
> +	drm_buddy_free_list(mm, &bman_res->blocks, 0);
>   	mutex_unlock(&bman->lock);
>   err_free_res:
>   	ttm_resource_fini(man, &bman_res->base);
> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
> +	drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>   	bman->visible_avail += bman_res->used_visible_size;
>   	mutex_unlock(&bman->lock);
>   
> @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
>   	ttm_set_driver_manager(bdev, type, NULL);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(mm, &bman->reserved);
> +	drm_buddy_free_list(mm, &bman->reserved, 0);
>   	drm_buddy_fini(mm);
>   	bman->visible_avail += bman->visible_reserved;
>   	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index e48863a44556..4621a860cb05 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -103,7 +103,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      DRM_BUDDY_RANGE_ALLOCATION),
>   				       "buddy_alloc i failed with bias(%x-%x), size=%u, ps=%u\n",
>   				       bias_start, bias_end, bias_size, bias_size);
> -		drm_buddy_free_list(&mm, &tmp);
> +		drm_buddy_free_list(&mm, &tmp, 0);
>   
>   		/* single page with internal round_up */
>   		KUNIT_ASSERT_FALSE_MSG(test,
> @@ -113,7 +113,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   							      DRM_BUDDY_RANGE_ALLOCATION),
>   				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
>   				       bias_start, bias_end, ps, bias_size);
> -		drm_buddy_free_list(&mm, &tmp);
> +		drm_buddy_free_list(&mm, &tmp, 0);
>   
>   		/* random size within */
>   		size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
> @@ -153,14 +153,14 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   			 * unallocated, and ideally not always on the bias
>   			 * boundaries.
>   			 */
> -			drm_buddy_free_list(&mm, &tmp);
> +			drm_buddy_free_list(&mm, &tmp, 0);
>   		} else {
>   			list_splice_tail(&tmp, &allocated);
>   		}
>   	}
>   
>   	kfree(order);
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   
>   	/*
> @@ -220,7 +220,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   			      "buddy_alloc passed with bias(%x-%x), size=%u\n",
>   			      bias_start, bias_end, ps);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -269,7 +269,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>   			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
>   
> -	drm_buddy_free_list(&mm, &middle);
> +	drm_buddy_free_list(&mm, &middle, 0);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> @@ -279,7 +279,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>   			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
>   
> -	drm_buddy_free_list(&mm, &right);
> +	drm_buddy_free_list(&mm, &right, 0);
>   	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							   3 * ps, ps, &allocated,
>   							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> @@ -294,7 +294,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>   			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
>   
> -	drm_buddy_free_list(&mm, &left);
> +	drm_buddy_free_list(&mm, &left, 0);
>   	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
>   							    3 * ps, ps, &allocated,
>   							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
> @@ -306,7 +306,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>   
>   	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -375,7 +375,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   							  top, max_order);
>   	}
>   
> -	drm_buddy_free_list(&mm, &holes);
> +	drm_buddy_free_list(&mm, &holes, 0);
>   
>   	/* Nothing larger than blocks of chunk_size now available */
>   	for (order = 1; order <= max_order; order++) {
> @@ -387,7 +387,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   	}
>   
>   	list_splice_tail(&holes, &blocks);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -482,7 +482,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   
>   	list_del(&block->link);
>   	drm_buddy_free_block(&mm, block);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -528,7 +528,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
>   							   size, size, &tmp, flags),
>   						  "buddy_alloc unexpectedly succeeded, it should be full!");
>   
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -563,7 +563,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   						drm_buddy_block_size(&mm, block),
>   						BIT_ULL(mm.max_order) * PAGE_SIZE);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 115ec745e502..1ad678b62c4a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a5b39fc01003..82570f77e817 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -25,6 +25,8 @@
>   #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
>   #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
> +#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
> +#define DRM_BUDDY_CLEARED			BIT(4)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -32,8 +34,9 @@ struct drm_buddy_block {
>   #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
>   #define   DRM_BUDDY_FREE	   (2 << 10)
>   #define   DRM_BUDDY_SPLIT	   (3 << 10)
> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>   /* Free to be used, if needed in the future */
> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>   	u64 header;
>   
> @@ -86,6 +89,7 @@ struct drm_buddy {
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;
> +	u64 clear_avail;
>   };
>   
>   static inline u64
> @@ -112,6 +116,12 @@ drm_buddy_block_is_allocated(struct drm_buddy_block *block)
>   	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>   }
>   
> +static inline bool
> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static inline bool
>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>   {
> @@ -150,7 +160,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned int flags);
>   
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,

