Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677C893A83
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 13:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B94B10F0A4;
	Mon,  1 Apr 2024 11:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L21N3TIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2098.outbound.protection.outlook.com [40.107.223.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B8210E2A7;
 Mon,  1 Apr 2024 11:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqPnvF//PV64HcfeC222fTTaSDXTC8fwFah3LBwejIFDzMpyXTqv1JXKiai4vBjmebK0sJtBDMX6QnZNWslJ6gULg0n2q6g6+57Vz+yCl0Z/9nl2Gxdi/y23D/pBnEPk6l17NyNvuSpp9lkeJj4tHmK3ABpdi/8AAet8x8J28CIPSeyhEAxStRNIg01vo2GuO9Yh0PvtbATglvARRxneDTSRIlhX/Udu7TFDLsouUjD7giQJbHFGc/kUcUPCFNFPTzQoUhPEWB8aYgUnxFxtpv9nqz8imQORBqhNAhXtwblXv+QNMOkted25VoXSLqhOw2CndQtpCT66jYnON2QiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vuqIC0163Yofs0GU62R0PqY35sFRUcI0hWPhSIVWzM=;
 b=MZU+AiLHjRl0D9gIC+zQSdfJGWJUYLt5t6wCUpowO8jvXHJfrHG5DxMzC1vr2CalQORIhNaLHeP25UssVi93N5awGxuNYxHINtFSgQdMJqMimkn/AIpLjs/BswnwIPmc78ZJxaxpDxl5+sG75X1daKc9nE00OQa1xyfVkQEjVOX7tOOR8v0481RAZuvwdQO+h4Z2DnW3ew5DkiKxbSC75z8mdGTT7dloNjgPk7+Arc+9EGTxoyN60ytSmQb8bUY2d9neVv0HGkPMPe610tboRXDTtY4y47RdnhgPFO3yzPpnvEQe/TALCiT2nHnXIstQhu2NPjhC2SA0xrqpD1A9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vuqIC0163Yofs0GU62R0PqY35sFRUcI0hWPhSIVWzM=;
 b=L21N3TIxRvbhPiKLoFInaLT4iOVDMrZyd59q2+xZIpHnjzTAWP6kDuuzc+wclSdbUiaHIQOp92cXPYi/xNGKGeGoHsTIFZI0Q6HMbzydvLFd9l+TFjdix7rywF5hf7o5upQj7ZcWh7DsOsqydykaPVJZF1bfylvzEU7SrW16uQI=
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 11:08:33 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6710:26ed:ab04:558f%5]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 11:08:32 +0000
Message-ID: <e0675e99-7ee9-49eb-84d9-cd6b08b0d39a@amd.com>
Date: Mon, 1 Apr 2024 16:37:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] drm/buddy: Implement tracking clear page feature
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240318214058.2014-1-Arunpravin.PaneerSelvam@amd.com>
 <1625f8f8-09df-4b91-99cf-945f0d64deab@intel.com>
 <09e89c62-fdd5-46cf-8c0e-8d0aafd19bab@amd.com>
 <f35b29b2-bb92-4529-90a0-05875ba207fa@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <f35b29b2-bb92-4529-90a0-05875ba207fa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SN7PR12MB7250:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XoqEsEKLclzrnIrT2yL4R3iuMr2m8s/d2taXA26v+Nh30XZVni3wwFRD2CUOUu2C7oFVvhvE+87MFrulBZmrWFz4P87UtwEKPvG0gY12vADkIrDe0JRXfV7V9ETB4uiZNNsUdVxxB93cTanzCQVewYdSoNc4WOeh93LUF6Ma3FKNOJzWm6OX4gIh1PycFrYMwHk2k4d7seZugC1sT9QsL6h882wqNGz7/R+S72VjtnHUL1GaWkBlmHfaxIqT8RtkxnP5IJ5JwFHX/yLNJzFblEdxOHnX6DfBzzI5NnlghKnACWVcMJqVxFrAkzy/ITOUligCvGdbHssLDJ0mT+rMymvii90DFsktLJhS3W9T2S9HuIZorOmms49eyzLE0URyBUEOv0Sl7WwrZl0JvY0N2i64X8uE0laZysFU8wxfM26vwRK3qK9IjKzWJn1u46pJIfoIgsUxk7oi7T3utiDv1m1eT6khzp7zd9zLJ9Pfn+Q8LcTHsvfhYU61Vh472JVHWtnwYl9gcFMqSWWDkEyZjxGDOuH2i66d3LDRaMvCB2Jut4zvTEyxQyP8KMTKJju1z2UFXN6lX7nEeWp+vRE7cUDDV2UVcwm84tFreAhY0huTaQctkZH/hktSSq/0CmOUKXRafYKAeDRmVYxkAqofCrj7o9Y11tbbjmexA6M2AwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXJnaXBqT3p1Slc3Q3VaenRmaFNWOHRxQ2duVG53aE5hUVpRVEVsOUpZZUxE?=
 =?utf-8?B?TXBNR1ZZaGxVSXVSVWl1TmRkNmhlcHora1lENnNaVWo4a2pHZXdVeGJXMHFI?=
 =?utf-8?B?MjhwV0RhTzNUSkx5d1ZPMG9HVTIzeTZNTmUyZWZ4TVFyTkI5NkZBckR6TTBw?=
 =?utf-8?B?eGtldWY0cWxvT2xWWGhBUDRGUkovdk9weWozeXYvUi82VUhMZCthTnRyU05M?=
 =?utf-8?B?dE1iM1VYbXNsQXVXV25SNjZNcnl0ejl2Smx5eEFjbTVqa1FOaGZFb21vaXc5?=
 =?utf-8?B?MnRWTG1VVXFSUmszdHAzdGZMc2dmTlNVeXE3S1NQbElnNURTUWR1T0ErUmM3?=
 =?utf-8?B?YkdhemNTWko1OURFSU84a3BRYjc3VjRpenArYVp0UUNnZERlMEQrK3hwVTVm?=
 =?utf-8?B?MU1FZFhUWFVnMk9XVlNSbVcvQ2l6d00xb0hnOVpGYitYMC9WWHlNcmIxbnI4?=
 =?utf-8?B?RjdHUkIrSEhTeENNcmIwTWxpZGI5MGJDK1Z1UG9Xc04waXFLNnlUUWZ3R1J1?=
 =?utf-8?B?STkvMGtiSzR2eWN6elZvNHd4MDQ2Y0RWemppZTcrQ2l1S3R1VjNHZWpWb05P?=
 =?utf-8?B?T1JnQ3pVNmlTa01hNjlJOVh5SDllcjlDS2g1S1BIRXYzM3l6UEx2SjNvaldz?=
 =?utf-8?B?eVB2aVZSd05SV09NZTRoNU5TUllJSERvVFFxUTdxZkFjam1QUlV6MlNWWHVu?=
 =?utf-8?B?cFBvZ2t4LzM2aDV2Y3hFeEhZZ3NPSEd0a0NqUE4xdEJremVQQ0R2enZ2RVlR?=
 =?utf-8?B?YnVYVkprQ2l3VmZwYkVyQXFJb3hOa2Rtd3llcm9uQlpuTEQwOXZ2aExuci9Z?=
 =?utf-8?B?WDJXelVjYmVVSUVZTFFCTUcyRGhFM1RGRkt4SlYwZkJ5SjhNazZzM3d2ZGhU?=
 =?utf-8?B?a0FORHJKdmF4WXhvdkwra2VOc3laejBTYzhmTWN1ZnFmRnMrQWxIMEorbmtE?=
 =?utf-8?B?YnV0eEVDSFl3UGFtR1lpL3BKZ0xEV1VqR25yZlcvODk5cThaNTZoR3E5T2FF?=
 =?utf-8?B?cm9mc2lTYnFSRTdic09UYmNuZjNpaWVMWnkwTlpBREVNMnROeC9MK3A0cDNv?=
 =?utf-8?B?V3luS3NtMm1qOVVDZTJPbG5jZGlWdkFacXY2NlhYNHNoUXBWcDlqa0VYVnVV?=
 =?utf-8?B?Vm13MElyV2RJeVNwWDJ6Zy9xVkIrb2RQUkdxSG5oSGtmaU9WUkdpUkpwaXB2?=
 =?utf-8?B?WG5RMFc0VWNIZVRHMjhPSmZHMnYvdTBDNjZJamJyaTY5Y2JHSVFqeS9MUVFI?=
 =?utf-8?B?OGI4eDFsUDBtc1JDdnFoU3NwcXQ0YS82Wk1OZHZPWUg2bHNJWVRhUXhVQ204?=
 =?utf-8?B?Y08yNThmVTdzYi90dlBoWEdlb3M4QjFSK3h2endUUXVoTUlFdmt5RWNaYnov?=
 =?utf-8?B?RExWcXltd2pzbHhIRUJ1NDdlU2NDTnNIWU53SEZoQXlEaHBMWERzVnlTeWJ4?=
 =?utf-8?B?aEMzZ2NQdXFMY1BWaDBwMm4xQnNsUk5EWmxBeUp2TDFtNkdmUFlJbTh1dzd4?=
 =?utf-8?B?bm05Zkw2QjFjWWhOQ3lJa2M3SDJYWjBjdHViNnowOHFnM0F4MEZwK3h3Tks0?=
 =?utf-8?B?My8vZVkwV29FUFBsRk1jT0YzNFVMcW9DVDMwSEUwWE94eGpQL09RRmMvanNI?=
 =?utf-8?B?dHJ0cE5nZGFwbmNJUU1td2JHMG9FVUs4OFlyRE5VaVgrcC9yc0Y0ZUMxNFRB?=
 =?utf-8?B?SlhEMmo1RHpmbzNWSXFQU0FLTVZ2K3ZHRCtRWVJ5SnpWT3JsZUpqOW1RU09Z?=
 =?utf-8?B?WC9XUnRzQmhaajhMMHRTMVloNjlzMzhOdFIvRDEwdWM2RXJQZ0drNHhkRFBp?=
 =?utf-8?B?ck85WTQ5TzlscERJeGNmcE9BZVBYOHVTNXhHQzNaek5HdkpoWGpPeTBWN3R3?=
 =?utf-8?B?cXVITGtGNisvMjNHNFNZNkU0MTY0dklHbWhDTTBoZXJWckN1bWlESkcvVTRY?=
 =?utf-8?B?Zzk4U3plaW93Vm83dU5DVkhrRHlYZHVOUHhkWDQvQUFYaDlLZ2Vlb05IYXVW?=
 =?utf-8?B?SCtYOThqdncva1Y0eFNFSkRDWm1NaGFpeGN0dVU4MDJrc2Zxb3ZGSU9zMGNF?=
 =?utf-8?B?TmdURVBxb01SMFlqaTFaOUIvS00xWFhONWtoWkdZYkhOWEpLdHNkWVgxYUw5?=
 =?utf-8?Q?C9wqD9eQ0A0v5YSGpz/PK2bgQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b71e7d-3dda-4613-7229-08dc523c0130
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 11:08:31.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9J1xWrMTwcExj2p8s3WrXL22x9qyOzOP0mul6X5a53MTwBD8Uvuqop3SD0y0K4N5//d/MBX0ucgBTZ98vO6XdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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

On 3/28/2024 10:18 PM, Matthew Auld wrote:
> On 28/03/2024 16:07, Paneer Selvam, Arunpravin wrote:
>> Hi Matthew,
>>
>> On 3/26/2024 11:39 PM, Matthew Auld wrote:
>>> On 18/03/2024 21:40, Arunpravin Paneer Selvam wrote:
>>>> - Add tracking clear page feature.
>>>>
>>>> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>>>>    successfully clears the blocks in the free path. On the otherhand,
>>>>    DRM buddy marks each block as cleared.
>>>>
>>>> - Track the available cleared pages size
>>>>
>>>> - If driver requests cleared memory we prefer cleared memory
>>>>    but fallback to uncleared if we can't find the cleared blocks.
>>>>    when driver requests uncleared memory we try to use uncleared but
>>>>    fallback to cleared memory if necessary.
>>>>
>>>> - When a block gets freed we clear it and mark the freed block as 
>>>> cleared,
>>>>    when there are buddies which are cleared as well we can merge them.
>>>>    Otherwise, we prefer to keep the blocks as separated.
>>>>
>>>> - Add a function to support defragmentation.
>>>>
>>>> v1:
>>>>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>>>>      cleared. Else, reset the clear flag for each block in the 
>>>> list(Christian)
>>>>    - For merging the 2 cleared blocks compare as below,
>>>>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)(Christian)
>>>>    - Defragment the memory beginning from min_order
>>>>      till the required memory space is available.
>>>>
>>>> v2: (Matthew)
>>>>    - Add a wrapper drm_buddy_free_list_internal for the freeing of 
>>>> blocks
>>>>      operation within drm buddy.
>>>>    - Write a macro block_incompatible() to allocate the required 
>>>> blocks.
>>>>    - Update the xe driver for the drm_buddy_free_list change in 
>>>> arguments.
>>>>    - add a warning if the two blocks are incompatible on
>>>>      defragmentation
>>>>    - call full defragmentation in the fini() function
>>>>    - place a condition to test if min_order is equal to 0
>>>>    - replace the list with safe_reverse() variant as we might
>>>>      remove the block from the list.
>>>>
>>>> v3:
>>>>    - fix Gitlab user reported lockup issue.
>>>>    - Keep DRM_BUDDY_HEADER_CLEAR define sorted(Matthew)
>>>>    - modify to pass the root order instead max_order in fini()
>>>>      function(Matthew)
>>>>    - change bool 1 to true(Matthew)
>>>>    - add check if min_block_size is power of 2(Matthew)
>>>>    - modify the min_block_size datatype to u64(Matthew)
>>>>
>>>> v4:
>>>>    - rename the function drm_buddy_defrag with __force_merge.
>>>>    - Include __force_merge directly in drm buddy file and remove
>>>>      the defrag use in amdgpu driver.
>>>>    - Remove list_empty() check(Matthew)
>>>>    - Remove unnecessary space, headers and placement of new 
>>>> variables(Matthew)
>>>>    - Add a unit test case(Matthew)
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>>>>   drivers/gpu/drm/drm_buddy.c                   | 427 
>>>> ++++++++++++++----
>>>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>>>>   drivers/gpu/drm/tests/drm_buddy_test.c        |  18 +-
>>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
>>>>   include/drm/drm_buddy.h                       |  16 +-
>>>>   6 files changed, 360 insertions(+), 117 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> index 8db880244324..c0c851409241 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>>> @@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct 
>>>> ttm_resource_manager *man,
>>>>       return 0;
>>>>     error_free_blocks:
>>>> -    drm_buddy_free_list(mm, &vres->blocks);
>>>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>>>       mutex_unlock(&mgr->lock);
>>>>   error_fini:
>>>>       ttm_resource_fini(man, &vres->base);
>>>> @@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct 
>>>> ttm_resource_manager *man,
>>>>         amdgpu_vram_mgr_do_reserve(man);
>>>>   -    drm_buddy_free_list(mm, &vres->blocks);
>>>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>>>       mutex_unlock(&mgr->lock);
>>>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>>>> @@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device 
>>>> *adev)
>>>>           kfree(rsv);
>>>>         list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, 
>>>> blocks) {
>>>> -        drm_buddy_free_list(&mgr->mm, &rsv->allocated);
>>>> +        drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>>>>           kfree(rsv);
>>>>       }
>>>>       if (!adev->gmc.is_app_apu)
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index c4222b886db7..625a30a6b855 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -38,8 +38,8 @@ static void drm_block_free(struct drm_buddy *mm,
>>>>       kmem_cache_free(slab_blocks, block);
>>>>   }
>>>>   -static void list_insert_sorted(struct drm_buddy *mm,
>>>> -                   struct drm_buddy_block *block)
>>>> +static void list_insert(struct drm_buddy *mm,
>>>> +            struct drm_buddy_block *block)
>>>>   {
>>>>       struct drm_buddy_block *node;
>>>>       struct list_head *head;
>>>> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy 
>>>> *mm,
>>>>       __list_add(&block->link, node->link.prev, &node->link);
>>>>   }
>>>>   +static void clear_reset(struct drm_buddy_block *block)
>>>> +{
>>>> +    block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>>>> +}
>>>> +
>>>> +static void mark_cleared(struct drm_buddy_block *block)
>>>> +{
>>>> +    block->header |= DRM_BUDDY_HEADER_CLEAR;
>>>> +}
>>>> +
>>>>   static void mark_allocated(struct drm_buddy_block *block)
>>>>   {
>>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>> @@ -71,7 +81,7 @@ static void mark_free(struct drm_buddy *mm,
>>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>>       block->header |= DRM_BUDDY_FREE;
>>>>   -    list_insert_sorted(mm, block);
>>>> +    list_insert(mm, block);
>>>>   }
>>>>     static void mark_split(struct drm_buddy_block *block)
>>>> @@ -82,6 +92,114 @@ static void mark_split(struct drm_buddy_block 
>>>> *block)
>>>>       list_del(&block->link);
>>>>   }
>>>>   +static struct drm_buddy_block *
>>>> +__get_buddy(struct drm_buddy_block *block)
>>>> +{
>>>> +    struct drm_buddy_block *parent;
>>>> +
>>>> +    parent = block->parent;
>>>> +    if (!parent)
>>>> +        return NULL;
>>>> +
>>>> +    if (parent->left == block)
>>>> +        return parent->right;
>>>> +
>>>> +    return parent->left;
>>>> +}
>>>> +
>>>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>>>> +                     struct drm_buddy_block *block,
>>>> +                     bool force_merge)
>>>> +{
>>>> +    struct drm_buddy_block *parent;
>>>> +    unsigned int order;
>>>> +
>>>> +    while ((parent = block->parent)) {
>>>> +        struct drm_buddy_block *buddy;
>>>> +
>>>> +        buddy = __get_buddy(block);
>>>> +
>>>> +        if (!drm_buddy_block_is_free(buddy))
>>>> +            break;
>>>> +
>>>> +        if (!force_merge) {
>>>> +            /**
>>>
>>> Not really valid kernel-doc AFAIK. I think drop the extra *. Below 
>>> also.
>>>
>>>> +             * Check the block and its buddy clear state and exit
>>>> +             * the loop if they both have the dissimilar state.
>>>> +             */
>>>> +            if (drm_buddy_block_is_clear(block) !=
>>>> +                drm_buddy_block_is_clear(buddy))
>>>> +                break;
>>>> +
>>>> +            if (drm_buddy_block_is_clear(block))
>>>> +                mark_cleared(parent);
>>>> +        }
>>>> +
>>>> +        list_del(&buddy->link);
>>>> +        if (force_merge && drm_buddy_block_is_clear(buddy))
>>>> +            mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>>>> +
>>>> +        drm_block_free(mm, block);
>>>> +        drm_block_free(mm, buddy);
>>>> +
>>>> +        block = parent;
>>>> +    }
>>>> +
>>>> +    order = drm_buddy_block_order(block);
>>>> +    mark_free(mm, block);
>>>> +
>>>> +    return order;
>>>> +}
>>>> +
>>>> +static int __force_merge(struct drm_buddy *mm,
>>>> +             unsigned int min_order)
>>>> +{
>>>> +    unsigned int order;
>>>> +    int i;
>>>> +
>>>> +    if (!min_order)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    if (min_order > mm->max_order)
>>>> +        return -EINVAL;
>>>> +
>>>> +    for (i = min_order - 1; i >= 0; i--) {
>>>> +        struct drm_buddy_block *block, *prev;
>>>> +
>>>> +        list_for_each_entry_safe_reverse(block, prev, 
>>>> &mm->free_list[i], link) {
>>>> +            struct drm_buddy_block *buddy;
>>>> +
>>>> +            if (!block->parent)
>>>> +                continue;
>>>> +
>>>> +            buddy = __get_buddy(block);
>>>> +            if (!drm_buddy_block_is_free(buddy))
>>>> +                continue;
>>>> +
>>>> +            WARN_ON(drm_buddy_block_is_clear(block) ==
>>>> +                drm_buddy_block_is_clear(buddy));
>>>> +
>>>> +            /**
>>>> +             * If the prev block is same as buddy, don't access the
>>>> +             * block in the next iteration as we would free the
>>>> +             * buddy block as part of the free function.
>>>> +             */
>>>> +            if (prev == buddy)
>>>> +                prev = list_prev_entry(prev, link);
>>>> +
>>>> +            list_del(&block->link);
>>>> +            if (drm_buddy_block_is_clear(block))
>>>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>> +
>>>> +            order = __drm_buddy_free(mm, block, true);
>>>> +            if (order >= min_order)
>>>> +                return 0;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return -ENOMEM;
>>>> +}
>>>> +
>>>>   /**
>>>>    * drm_buddy_init - init memory manager
>>>>    *
>>>> @@ -137,7 +255,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>>> size, u64 chunk_size)
>>>>       offset = 0;
>>>>       i = 0;
>>>>   -    /*
>>>> +    /**
>>>>        * Split into power-of-two blocks, in case we are given a 
>>>> size that is
>>>>        * not itself a power-of-two.
>>>>        */
>>>> @@ -186,11 +304,21 @@ EXPORT_SYMBOL(drm_buddy_init);
>>>>    */
>>>>   void drm_buddy_fini(struct drm_buddy *mm)
>>>>   {
>>>> +    u64 root_size, size;
>>>> +    unsigned int order;
>>>>       int i;
>>>>   +    size = mm->size;
>>>> +
>>>>       for (i = 0; i < mm->n_roots; ++i) {
>>>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>>>> +        __force_merge(mm, order);
>>>> +
>>>> WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>>>>           drm_block_free(mm, mm->roots[i]);
>>>> +
>>>> +        root_size = mm->chunk_size << order;
>>>> +        size -= root_size;
>>>>       }
>>>>         WARN_ON(mm->avail != mm->size);
>>>> @@ -223,26 +351,17 @@ static int split_block(struct drm_buddy *mm,
>>>>       mark_free(mm, block->left);
>>>>       mark_free(mm, block->right);
>>>>   +    if (drm_buddy_block_is_clear(block)) {
>>>> +        mark_cleared(block->left);
>>>> +        mark_cleared(block->right);
>>>> +        clear_reset(block);
>>>> +    }
>>>> +
>>>>       mark_split(block);
>>>>         return 0;
>>>>   }
>>>>   -static struct drm_buddy_block *
>>>> -__get_buddy(struct drm_buddy_block *block)
>>>> -{
>>>> -    struct drm_buddy_block *parent;
>>>> -
>>>> -    parent = block->parent;
>>>> -    if (!parent)
>>>> -        return NULL;
>>>> -
>>>> -    if (parent->left == block)
>>>> -        return parent->right;
>>>> -
>>>> -    return parent->left;
>>>> -}
>>>> -
>>>>   /**
>>>>    * drm_get_buddy - get buddy address
>>>>    *
>>>> @@ -260,30 +379,6 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>>   }
>>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>>>> -                 struct drm_buddy_block *block)
>>>> -{
>>>> -    struct drm_buddy_block *parent;
>>>> -
>>>> -    while ((parent = block->parent)) {
>>>> -        struct drm_buddy_block *buddy;
>>>> -
>>>> -        buddy = __get_buddy(block);
>>>> -
>>>> -        if (!drm_buddy_block_is_free(buddy))
>>>> -            break;
>>>> -
>>>> -        list_del(&buddy->link);
>>>> -
>>>> -        drm_block_free(mm, block);
>>>> -        drm_block_free(mm, buddy);
>>>> -
>>>> -        block = parent;
>>>> -    }
>>>> -
>>>> -    mark_free(mm, block);
>>>> -}
>>>> -
>>>>   /**
>>>>    * drm_buddy_free_block - free a block
>>>>    *
>>>> @@ -295,26 +390,59 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>>>   {
>>>>       BUG_ON(!drm_buddy_block_is_allocated(block));
>>>>       mm->avail += drm_buddy_block_size(mm, block);
>>>> -    __drm_buddy_free(mm, block);
>>>> +    if (drm_buddy_block_is_clear(block))
>>>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>>> +
>>>> +    __drm_buddy_free(mm, block, false);
>>>>   }
>>>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>>>   -/**
>>>> - * drm_buddy_free_list - free blocks
>>>> - *
>>>> - * @mm: DRM buddy manager
>>>> - * @objects: input list head to free blocks
>>>> - */
>>>> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>>>> *objects)
>>>> +static void __drm_buddy_free_list(struct drm_buddy *mm,
>>>> +                  struct list_head *objects,
>>>> +                  bool mark_clear,
>>>> +                  bool mark_dirty)
>>>>   {
>>>>       struct drm_buddy_block *block, *on;
>>>>   +    WARN_ON(mark_dirty && mark_clear);
>>>> +
>>>>       list_for_each_entry_safe(block, on, objects, link) {
>>>> +        if (mark_clear)
>>>> +            mark_cleared(block);
>>>> +        else if (mark_dirty)
>>>> +            clear_reset(block);
>>>>           drm_buddy_free_block(mm, block);
>>>>           cond_resched();
>>>>       }
>>>>       INIT_LIST_HEAD(objects);
>>>>   }
>>>> +
>>>> +static void drm_buddy_free_list_internal(struct drm_buddy *mm,
>>>> +                     struct list_head *objects)
>>>> +{
>>>> +    /**
>>>> +     * Don't touch the clear/dirty bit, since allocation is still 
>>>> internal
>>>> +     * at this point. For example we might have just failed part 
>>>> of the
>>>> +     * allocation.
>>>> +     */
>>>> +    __drm_buddy_free_list(mm, objects, false, false);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_buddy_free_list - free blocks
>>>> + *
>>>> + * @mm: DRM buddy manager
>>>> + * @objects: input list head to free blocks
>>>> + * @flags: optional flags like DRM_BUDDY_CLEARED
>>>> + */
>>>> +void drm_buddy_free_list(struct drm_buddy *mm,
>>>> +             struct list_head *objects,
>>>> +             unsigned int flags)
>>>> +{
>>>> +    bool mark_clear = flags & DRM_BUDDY_CLEARED;
>>>> +
>>>> +    __drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
>>>> +}
>>>>   EXPORT_SYMBOL(drm_buddy_free_list);
>>>>     static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>>> @@ -327,10 +455,19 @@ static inline bool contains(u64 s1, u64 e1, 
>>>> u64 s2, u64 e2)
>>>>       return s1 <= s2 && e1 >= e2;
>>>>   }
>>>>   +static bool block_incompatible(struct drm_buddy_block *block, 
>>>> unsigned int flags)
>>>> +{
>>>> +    bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
>>>> +
>>>> +    return needs_clear != drm_buddy_block_is_clear(block);
>>>> +}
>>>> +
>>>>   static struct drm_buddy_block *
>>>> -alloc_range_bias(struct drm_buddy *mm,
>>>> -         u64 start, u64 end,
>>>> -         unsigned int order)
>>>> +__alloc_range_bias(struct drm_buddy *mm,
>>>> +           u64 start, u64 end,
>>>> +           unsigned int order,
>>>> +           unsigned long flags,
>>>> +           bool fallback)
>>>>   {
>>>>       struct drm_buddy_block *block;
>>>>       struct drm_buddy_block *buddy;
>>>> @@ -369,7 +506,10 @@ alloc_range_bias(struct drm_buddy *mm,
>>>>             if (contains(start, end, block_start, block_end) &&
>>>>               order == drm_buddy_block_order(block)) {
>>>> -            /*
>>>> +            if (!fallback && block_incompatible(block, flags))
>>>> +                continue;
>>>> +
>>>> +            /**
>>>>                * Find the free block within the range.
>>>>                */
>>>>               if (drm_buddy_block_is_free(block))
>>>> @@ -391,7 +531,7 @@ alloc_range_bias(struct drm_buddy *mm,
>>>>       return ERR_PTR(-ENOSPC);
>>>>     err_undo:
>>>> -    /*
>>>> +    /**
>>>>        * We really don't want to leave around a bunch of split 
>>>> blocks, since
>>>>        * bigger is better, so make sure we merge everything back 
>>>> before we
>>>>        * free the allocated blocks.
>>>> @@ -400,30 +540,57 @@ alloc_range_bias(struct drm_buddy *mm,
>>>>       if (buddy &&
>>>>           (drm_buddy_block_is_free(block) &&
>>>>            drm_buddy_block_is_free(buddy)))
>>>> -        __drm_buddy_free(mm, block);
>>>> +        __drm_buddy_free(mm, block, false);
>>>>       return ERR_PTR(err);
>>>>   }
>>>>     static struct drm_buddy_block *
>>>> -get_maxblock(struct drm_buddy *mm, unsigned int order)
>>>> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>>> +                 u64 start, u64 end,
>>>> +                 unsigned int order,
>>>> +                 unsigned long flags)
>>>> +{
>>>> +    struct drm_buddy_block *block;
>>>> +    bool fallback = false;
>>>> +
>>>> +    block = __alloc_range_bias(mm, start, end, order,
>>>> +                   flags, fallback);
>>>> +    if (IS_ERR(block) && mm->clear_avail)
>>>> +        return __alloc_range_bias(mm, start, end, order,
>>>> +                      flags, !fallback);
>>>> +
>>>> +    return block;
>>>> +}
>>>> +
>>>> +static struct drm_buddy_block *
>>>> +get_maxblock(struct drm_buddy *mm, unsigned int order,
>>>> +         unsigned long flags)
>>>>   {
>>>> -    struct drm_buddy_block *max_block = NULL, *node;
>>>> +    struct drm_buddy_block *max_block = NULL, *block = NULL;
>>>>       unsigned int i;
>>>>         for (i = order; i <= mm->max_order; ++i) {
>>>> -        if (!list_empty(&mm->free_list[i])) {
>>>> -            node = list_last_entry(&mm->free_list[i],
>>>> -                           struct drm_buddy_block,
>>>> -                           link);
>>>> -            if (!max_block) {
>>>> -                max_block = node;
>>>> +        struct drm_buddy_block *tmp_block;
>>>> +
>>>> +        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>>>> link) {
>>>> +            if (block_incompatible(tmp_block, flags))
>>>>                   continue;
>>>> -            }
>>>>   -            if (drm_buddy_block_offset(node) >
>>>> -                drm_buddy_block_offset(max_block)) {
>>>> -                max_block = node;
>>>> -            }
>>>> +            block = tmp_block;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        if (!block)
>>>> +            continue;
>>>> +
>>>> +        if (!max_block) {
>>>> +            max_block = block;
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        if (drm_buddy_block_offset(block) >
>>>> +            drm_buddy_block_offset(max_block)) {
>>>> +            max_block = block;
>>>>           }
>>>>       }
>>>>   @@ -440,11 +607,29 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>       int err;
>>>>         if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>>>> -        block = get_maxblock(mm, order);
>>>> +        block = get_maxblock(mm, order, flags);
>>>>           if (block)
>>>>               /* Store the obtained block order */
>>>>               tmp = drm_buddy_block_order(block);
>>>>       } else {
>>>> +        for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>> +            struct drm_buddy_block *tmp_block;
>>>> +
>>>> +            list_for_each_entry_reverse(tmp_block, 
>>>> &mm->free_list[tmp], link) {
>>>> +                if (block_incompatible(tmp_block, flags))
>>>> +                    continue;
>>>> +
>>>> +                block = tmp_block;
>>>> +                break;
>>>> +            }
>>>> +
>>>> +            if (block)
>>>> +                break;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (!block) {
>>>> +        /* Fallback method */
>>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>>               if (!list_empty(&mm->free_list[tmp])) {
>>>>                   block = list_last_entry(&mm->free_list[tmp],
>>>> @@ -454,10 +639,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>                       break;
>>>>               }
>>>>           }
>>>> -    }
>>>>   -    if (!block)
>>>> -        return ERR_PTR(-ENOSPC);
>>>> +        if (!block)
>>>> +            return ERR_PTR(-ENOSPC);
>>>> +    }
>>>>         BUG_ON(!drm_buddy_block_is_free(block));
>>>>   @@ -473,7 +658,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>     err_undo:
>>>>       if (tmp != order)
>>>> -        __drm_buddy_free(mm, block);
>>>> +        __drm_buddy_free(mm, block, false);
>>>>       return ERR_PTR(err);
>>>>   }
>>>>   @@ -524,6 +709,8 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>               mark_allocated(block);
>>>>               total_allocated += drm_buddy_block_size(mm, block);
>>>>               mm->avail -= drm_buddy_block_size(mm, block);
>>>> +            if (drm_buddy_block_is_clear(block))
>>>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>>               list_add_tail(&block->link, &allocated);
>>>>               continue;
>>>>           }
>>>> @@ -548,7 +735,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>       return 0;
>>>>     err_undo:
>>>> -    /*
>>>> +    /**
>>>>        * We really don't want to leave around a bunch of split 
>>>> blocks, since
>>>>        * bigger is better, so make sure we merge everything back 
>>>> before we
>>>>        * free the allocated blocks.
>>>> @@ -557,14 +744,14 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>       if (buddy &&
>>>>           (drm_buddy_block_is_free(block) &&
>>>>            drm_buddy_block_is_free(buddy)))
>>>> -        __drm_buddy_free(mm, block);
>>>> +        __drm_buddy_free(mm, block, false);
>>>>     err_free:
>>>>       if (err == -ENOSPC && total_allocated_on_err) {
>>>>           list_splice_tail(&allocated, blocks);
>>>>           *total_allocated_on_err = total_allocated;
>>>>       } else {
>>>> -        drm_buddy_free_list(mm, &allocated);
>>>> +        drm_buddy_free_list_internal(mm, &allocated);
>>>>       }
>>>>         return err;
>>>> @@ -630,11 +817,11 @@ static int __alloc_contig_try_harder(struct 
>>>> drm_buddy *mm,
>>>>               list_splice(&blocks_lhs, blocks);
>>>>               return 0;
>>>>           } else if (err != -ENOSPC) {
>>>> -            drm_buddy_free_list(mm, blocks);
>>>> +            drm_buddy_free_list_internal(mm, blocks);
>>>>               return err;
>>>>           }
>>>>           /* Free blocks for the next iteration */
>>>> -        drm_buddy_free_list(mm, blocks);
>>>> +        drm_buddy_free_list_internal(mm, blocks);
>>>>       }
>>>>         return -ENOSPC;
>>>> @@ -690,6 +877,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>       list_del(&block->link);
>>>>       mark_free(mm, block);
>>>>       mm->avail += drm_buddy_block_size(mm, block);
>>>> +    if (drm_buddy_block_is_clear(block))
>>>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>>>         /* Prevent recursively freeing this node */
>>>>       parent = block->parent;
>>>> @@ -701,6 +890,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>       if (err) {
>>>>           mark_allocated(block);
>>>>           mm->avail -= drm_buddy_block_size(mm, block);
>>>> +        if (drm_buddy_block_is_clear(block))
>>>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>>           list_add(&block->link, blocks);
>>>>       }
>>>>   @@ -709,13 +900,28 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>   }
>>>>   EXPORT_SYMBOL(drm_buddy_block_trim);
>>>>   +static struct drm_buddy_block *
>>>> +__drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>> +             u64 start, u64 end,
>>>> +             unsigned int order,
>>>> +             unsigned long flags)
>>>> +{
>>>> +    if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>>> +        /* Allocate traversing within the range */
>>>> +        return  __drm_buddy_alloc_range_bias(mm, start, end,
>>>> +                             order, flags);
>>>> +    else
>>>> +        /* Allocate from freelist */
>>>> +        return alloc_from_freelist(mm, order, flags);
>>>> +}
>>>> +
>>>>   /**
>>>>    * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>>>    *
>>>>    * @mm: DRM buddy manager to allocate from
>>>>    * @start: start of the allowed range for this block
>>>>    * @end: end of the allowed range for this block
>>>> - * @size: size of the allocation
>>>> + * @size: size of the allocation in bytes
>>>>    * @min_block_size: alignment of the allocation
>>>>    * @blocks: output list head to add allocated blocks
>>>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>> @@ -761,8 +967,18 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>           return -EINVAL;
>>>>         /* Actual range allocation */
>>>> -    if (start + size == end)
>>>> -        return __drm_buddy_alloc_range(mm, start, size, NULL, 
>>>> blocks);
>>>> +    if (start + size == end) {
>>>> +        err =  __drm_buddy_alloc_range(mm, start, size, NULL, 
>>>> blocks);
>>>> +        if (err) {
>>>> +            order = ilog2(size) - ilog2(mm->chunk_size);
>>>> +            if (mm->clear_avail && !__force_merge(mm, order))
>>>> +                return __drm_buddy_alloc_range(mm, start, size, 
>>>> NULL, blocks);
>>>
>>> That seems strange at a glance. With an actual range allocation like 
>>> with intitial fb or whatever it should just find all overlapping 
>>> pages, splitting down where needed on the edges. Not sure why 
>>> force_merge would factor in here?
>> In case of not merged (fragmentation due to dirty and clear pages 
>> split), if the memory request goes into that range, we might see the 
>> split blocks as not free and end up returning -ENOSPC.
>> I found this problem when I tried to allocate the max_order where the 
>> start + size == end and it ends up entering into this code block and 
>> it returns -ENOSPC as there is no force_merge call
>> and the requested range max order block seen as not free. And we have 
>> an another issue though if we use force_merge to defragment a 
>> specific ordered block, there is a less probability that
>> we merge back the required blocks in the specific range. For now, we 
>> can go ahead with no force merge support for actual range allocation 
>> if we are sure that we use this only for initial fb etc.
>
> Ah right, now I see. But AFAICT trouble is if we say allocate 8K range 
> at some specific offset, like above, which fails due to clear/dirty 
> split then calling force_merge(order(8K)) is not always going to help. 
> It will just force merge enough for 8K, but that might not be the 8K 
> at the offset we were looking for, so it still fails. I think perhaps 
> update the dfs in alloc_range to not bail when contains && split. Or I 
> think other option is to force merge the entire address space on err. 
> Other ideas?
For actual range allocation, if the min_block_size == mm->chunk_size, I 
think we can proceed with your first idea (i.e) update the dfs in 
alloc_range to not bail when contains && split.
For bias range allocation, we need to add range support to the 
force_merge, for instance we can just continue in the force_merge for 
loop if the contains(start, end, block_start, block_end) returns false.
Thoughts?

Thanks,
Arun.
>
>>
>> If there are no major concerns, can we push these patches?
>>
>> Regards,
>> Arun.
>>>> +
>>>> +            return err;
>>>> +        }
>>>> +
>>>> +        return err;
>>>> +    }
>>>>         original_size = size;
>>>>       original_min_size = min_block_size;
>>>> @@ -786,23 +1002,34 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>> *mm,
>>>>           BUG_ON(order < min_order);
>>>>             do {
>>>> -            if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>>> -                /* Allocate traversing within the range */
>>>> -                block = alloc_range_bias(mm, start, end, order);
>>>> -            else
>>>> -                /* Allocate from freelist */
>>>> -                block = alloc_from_freelist(mm, order, flags);
>>>> -
>>>> +            block = __drm_buddy_alloc_blocks(mm, start,
>>>> +                             end,
>>>> +                             order,
>>>> +                             flags);
>>>>               if (!IS_ERR(block))
>>>>                   break;
>>>>                 if (order-- == min_order) {
>>>> +                /**
>>>> +                 * Try allocation through force merge method
>>>> +                 */
>>>> +                if (mm->clear_avail && !__force_merge(mm, 
>>>> min_order)) {
>>>> +                    block = __drm_buddy_alloc_blocks(mm, start,
>>>> +                                     end,
>>>> +                                     min_order,
>>>> +                                     flags);
>>>> +                    if (!IS_ERR(block)) {
>>>> +                        order = min_order;
>>>> +                        break;
>>>> +                    }
>>>> +                }
>>>> +
>>>> +    ��           /**
>>>> +                 * Try contiguous block allocation through
>>>> +                 * try harder method.
>>>> +                 */
>>>>                   if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>>>>                       !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>>>> -                    /*
>>>> -                     * Try contiguous block allocation through
>>>> -                     * try harder method
>>>> -                     */
>>>>                       return __alloc_contig_try_harder(mm,
>>>>                                        original_size,
>>>>                                        original_min_size,
>>>> @@ -814,6 +1041,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>             mark_allocated(block);
>>>>           mm->avail -= drm_buddy_block_size(mm, block);
>>>> +        if (drm_buddy_block_is_clear(block))
>>>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>>           kmemleak_update_trace(block);
>>>>           list_add_tail(&block->link, &allocated);
>>>>   @@ -823,7 +1052,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>> *mm,
>>>>               break;
>>>>       } while (1);
>>>>   -    /* Trim the allocated block to the required size */
>>>> +    /**
>>>> +     * Trim the allocated block to the required size
>>>> +     */
>>>>       if (original_size != size) {
>>>>           struct list_head *trim_list;
>>>>           LIST_HEAD(temp);
>>>> @@ -852,7 +1083,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>       return 0;
>>>>     err_free:
>>>> -    drm_buddy_free_list(mm, &allocated);
>>>> +    drm_buddy_free_list_internal(mm, &allocated);
>>>>       return err;
>>>>   }
>>>>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>>> @@ -885,8 +1116,8 @@ void drm_buddy_print(struct drm_buddy *mm, 
>>>> struct drm_printer *p)
>>>>   {
>>>>       int order;
>>>>   -    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>>>> %lluMiB\n",
>>>> -           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>>>> +    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>>>> %lluMiB, clear_free: %lluMiB\n",
>>>> +           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, 
>>>> mm->clear_avail >> 20);
>>>>         for (order = mm->max_order; order >= 0; order--) {
>>>>           struct drm_buddy_block *block;
>>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>>>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> index 0d735d5c2b35..942345548bc3 100644
>>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>>> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct 
>>>> ttm_resource_manager *man,
>>>>       return 0;
>>>>     err_free_blocks:
>>>> -    drm_buddy_free_list(mm, &bman_res->blocks);
>>>> +    drm_buddy_free_list(mm, &bman_res->blocks, 0);
>>>>       mutex_unlock(&bman->lock);
>>>>   err_free_res:
>>>>       ttm_resource_fini(man, &bman_res->base);
>>>> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct 
>>>> ttm_resource_manager *man,
>>>>       struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>>         mutex_lock(&bman->lock);
>>>> -    drm_buddy_free_list(&bman->mm, &bman_res->blocks);
>>>> +    drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>>>>       bman->visible_avail += bman_res->used_visible_size;
>>>>       mutex_unlock(&bman->lock);
>>>>   @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device 
>>>> *bdev, unsigned int type)
>>>>       ttm_set_driver_manager(bdev, type, NULL);
>>>>         mutex_lock(&bman->lock);
>>>> -    drm_buddy_free_list(mm, &bman->reserved);
>>>> +    drm_buddy_free_list(mm, &bman->reserved, 0);
>>>>       drm_buddy_fini(mm);
>>>>       bman->visible_avail += bman->visible_reserved;
>>>>       WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
>>>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>>>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>> index 2f32fb2f12e7..454ad9952f56 100644
>>>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>>>> @@ -64,7 +64,7 @@ static void 
>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>                      "buddy_alloc didn't error size=%u\n", 3 * ps);
>>>>   -    drm_buddy_free_list(&mm, &middle);
>>>> +    drm_buddy_free_list(&mm, &middle, 0);
>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                  3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> @@ -74,7 +74,7 @@ static void 
>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>                      "buddy_alloc didn't error size=%u\n", 2 * ps);
>>>>   -    drm_buddy_free_list(&mm, &right);
>>>> +    drm_buddy_free_list(&mm, &right, 0);
>>>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                  3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> @@ -89,7 +89,7 @@ static void 
>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>>                      "buddy_alloc hit an error size=%u\n", 2 * ps);
>>>>   -    drm_buddy_free_list(&mm, &left);
>>>> +    drm_buddy_free_list(&mm, &left, 0);
>>>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>>>> mm_size,
>>>>                                   3 * ps, ps, &allocated,
>>>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>>> @@ -101,7 +101,7 @@ static void 
>>>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>>>         KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
>>>>   -    drm_buddy_free_list(&mm, &allocated);
>>>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>>>       drm_buddy_fini(&mm);
>>>>   }
>>>>   @@ -170,7 +170,7 @@ static void 
>>>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>>>                                 top, max_order);
>>>>       }
>>>>   -    drm_buddy_free_list(&mm, &holes);
>>>> +    drm_buddy_free_list(&mm, &holes, 0);
>>>>         /* Nothing larger than blocks of chunk_size now available */
>>>>       for (order = 1; order <= max_order; order++) {
>>>> @@ -182,7 +182,7 @@ static void 
>>>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>>>       }
>>>>         list_splice_tail(&holes, &blocks);
>>>> -    drm_buddy_free_list(&mm, &blocks);
>>>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>>>       drm_buddy_fini(&mm);
>>>>   }
>>>>   @@ -277,7 +277,7 @@ static void 
>>>> drm_test_buddy_alloc_pessimistic(struct kunit *test)
>>>>         list_del(&block->link);
>>>>       drm_buddy_free_block(&mm, block);
>>>> -    drm_buddy_free_list(&mm, &blocks);
>>>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>>>       drm_buddy_fini(&mm);
>>>>   }
>>>>   @@ -323,7 +323,7 @@ static void 
>>>> drm_test_buddy_alloc_optimistic(struct kunit *test)
>>>>                                  size, size, &tmp, flags),
>>>>                             "buddy_alloc unexpectedly succeeded, it 
>>>> should be full!");
>>>>   -    drm_buddy_free_list(&mm, &blocks);
>>>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>>>       drm_buddy_fini(&mm);
>>>>   }
>>>>   @@ -358,7 +358,7 @@ static void drm_test_buddy_alloc_limit(struct 
>>>> kunit *test)
>>>>                           drm_buddy_block_size(&mm, block),
>>>>                           BIT_ULL(mm.max_order) * PAGE_SIZE);
>>>>   -    drm_buddy_free_list(&mm, &allocated);
>>>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>>>       drm_buddy_fini(&mm);
>>>>   }
>>>>   diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> index 115ec745e502..1ad678b62c4a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> @@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>>> ttm_resource_manager *man,
>>>>       return 0;
>>>>     error_free_blocks:
>>>> -    drm_buddy_free_list(mm, &vres->blocks);
>>>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>>>       mutex_unlock(&mgr->lock);
>>>>   error_fini:
>>>>       ttm_resource_fini(man, &vres->base);
>>>> @@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct 
>>>> ttm_resource_manager *man,
>>>>       struct drm_buddy *mm = &mgr->mm;
>>>>         mutex_lock(&mgr->lock);
>>>> -    drm_buddy_free_list(mm, &vres->blocks);
>>>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>>>       mgr->visible_avail += vres->used_visible_size;
>>>>       mutex_unlock(&mgr->lock);
>>>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>> index a5b39fc01003..82570f77e817 100644
>>>> --- a/include/drm/drm_buddy.h
>>>> +++ b/include/drm/drm_buddy.h
>>>> @@ -25,6 +25,8 @@
>>>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>>> +#define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>>>> +#define DRM_BUDDY_CLEARED            BIT(4)
>>>>     struct drm_buddy_block {
>>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>> @@ -32,8 +34,9 @@ struct drm_buddy_block {
>>>>   #define   DRM_BUDDY_ALLOCATED       (1 << 10)
>>>>   #define   DRM_BUDDY_FREE       (2 << 10)
>>>>   #define   DRM_BUDDY_SPLIT       (3 << 10)
>>>> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>>>>   /* Free to be used, if needed in the future */
>>>> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>>>> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>>>>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>>>>       u64 header;
>>>>   @@ -86,6 +89,7 @@ struct drm_buddy {
>>>>       u64 chunk_size;
>>>>       u64 size;
>>>>       u64 avail;
>>>> +    u64 clear_avail;
>>>>   };
>>>>     static inline u64
>>>> @@ -112,6 +116,12 @@ drm_buddy_block_is_allocated(struct 
>>>> drm_buddy_block *block)
>>>>       return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>>>>   }
>>>>   +static inline bool
>>>> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
>>>> +{
>>>> +    return block->header & DRM_BUDDY_HEADER_CLEAR;
>>>> +}
>>>> +
>>>>   static inline bool
>>>>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>>>>   {
>>>> @@ -150,7 +160,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>     void drm_buddy_free_block(struct drm_buddy *mm, struct 
>>>> drm_buddy_block *block);
>>>>   -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>>>> *objects);
>>>> +void drm_buddy_free_list(struct drm_buddy *mm,
>>>> +             struct list_head *objects,
>>>> +             unsigned int flags);
>>>>     void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>

