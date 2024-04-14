Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEFF8A4526
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 22:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFA211236D;
	Sun, 14 Apr 2024 20:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V6zLkTkG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEC011236A;
 Sun, 14 Apr 2024 20:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8jaucNCi9xI8TrQdWnaRy2VLpfr6cJSk1JxDAAXAU+yXhAqj7DIdNXSWVHiwa1LBjezL9g0MVQf0B8+Xz3SVc9ka1/6zJ4nr73iMk1hqPHCojeP8/Au+TnclzFcHx9XUJi3elhX2qVhVXV+PIM7o3I9oxfRcqEyyRJUyrrGpX4Dp7KBqMELd14tb6Otjy6RkCTJjarPpJvHAA4BQaxJY/mPCpaC3cn+acQUeaoS4+xA+zXh7B9924UKUGEu4t/hYMC8jjItup8seYmEZjG9NNh3ZarZXmODPV7ef4h2GTqqzXHBL6MMITvXfGj1FX5s0HrrTTpcs33p7uxwxjVyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKzlax2y4dtVSuMC1otLLaeaWKLY7qe14GEGMBn+8PY=;
 b=NTjx21cgyQDxmUMFdABml2J5WtOBE2FU91n7cUuOQnT+lx/rRHTTfeIidjyD+OPvW5ZncfBdaZJWehija5ZR7G+RUtYS0MJfqMtlWwmDjFfG4LFICMp9xgDq58ZTZZhUrPYinTZeEo5UJAv2FXWJDwDj1yRg+Dr7DQv7Trh9CxuVB7L00BoSBHE+2Gau09YxQlw8ublOO5cH4yR+mglJK8JEMZI/OTU9NLZdyCAhFPdA+8c73EiAvyP81XkprbC8MFhAZh0huh/3XEd6YdkRSC60Kl8X0V0tvfRiITbFssCBtKBmUqJAN4z9HWRJN5grgrVAt+oS1/pHCIUZaQD16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKzlax2y4dtVSuMC1otLLaeaWKLY7qe14GEGMBn+8PY=;
 b=V6zLkTkGLToRL1A/1QumoLMeKVUaACxqk5QfNqoIK5riF78e06nJkRwLPnhEh2/8Mz63PdbBj/f8e51kC1WHsdZ4vUVK0nzz8UZ9ij3Vzf0F91kHexwzB/OddqHJW0CIJYA61cylw4n0LSHkKDAszeA6JMtJpCKZLW1LLqjeySM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB5905.namprd12.prod.outlook.com (2603:10b6:208:379::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Sun, 14 Apr
 2024 20:36:24 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c55f:19e:6896:cf3%5]) with mapi id 15.20.7452.049; Sun, 14 Apr 2024
 20:36:24 +0000
Message-ID: <91ab7e46-e6f4-42df-8582-0075ff29809a@amd.com>
Date: Mon, 15 Apr 2024 02:06:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] drm/buddy: Implement tracking clear page feature
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, felix.kuehling@amd.com
References: <20240408151620.528163-1-Arunpravin.PaneerSelvam@amd.com>
 <b84061b0-2698-4fb8-89aa-e2922e9db4fe@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b84061b0-2698-4fb8-89aa-e2922e9db4fe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::12) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d92f00-564d-4840-e69e-08dc5cc28d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JiKNZoq0K3y945dTB4/x2LJ/zqNkUaOW8TGpkFNsuYPiMI9N2u6qXMJe2csyRj19H+zw8M9T57H+lecylyJbkyd7kkTUhc6debHWu2U3WGatBkRUzWJWyLpWxTQ5NykAd4beLa4cpBTJkLcQsUlLlg1athJN5VMpxOXu4xphgL6/lAAvQwKvveyJcDTz87xfQ+HJb2UCy5+woNPLzVMxlJYuvPKTIBt5KCxHeymIl77SxoyOvQ2chuYcEgv3SnU9UlpaoQJ0j/p6SNzSUZfWM/z1/zvQnx6j5Wr3p9ay6JmH4jGzz6lbMbyt6uF+vuRqjqibhwmTBBkygsPPd9qXnG8spLTJHuTRJLCFCkVuVjTo1B6gYFH7wMxoa06cPIcy+QLCnGltGU2OQmuc8dU8nbN6OrfPjpyZHBRK6LZQpPafLqN2yTkb0/mJgvi+gwLG6KtqirJJaalgWuGDPpoITS5TTkSNT+T7S3NsjuXyxF18mCMZFaigEcp001FTjoyAJuS4JAMbM2TWraHZf77sMQGzXGBSR5ztXRP8xSlgWzDKX65H4P7yF0key4U4is07dveb3M5klxPPACre+Ocu03RiR/lkd9GGgqbbI3bZSVFV/ij/+q45hzXaNalUMQqB+TznXlfpvv2fPcJgZ8trvRitDmD2eKP1ljeBw4JpasE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WSsyY1p6YTUvMmY4Zlc5alJDSkRXNXhocU04WXBIQ0JKTkdQeUZjd2luVFhO?=
 =?utf-8?B?ZGN2eE1BOTRLTmtvTDlrck5uLzJ6dE1YTG9wOW5iN1RjZFc5L0FZaFVpOTZY?=
 =?utf-8?B?Lys0SDRqY3NnaEdmMXIyM1E4cUxNaXVIZ3RhQkpsQjk1dHl1TkRyMjd0TzBV?=
 =?utf-8?B?emNsaEgxaU1wZWNSZWpSTk9aT285TjZUNjQyaDdYaFJCeGUxbUtldGdRNFh0?=
 =?utf-8?B?TTJwZnMwOVMwZjVUM1N2OXR0ZkVKU3dyU3VCaE9XRlFYM1ZMcStxeWJCVW5R?=
 =?utf-8?B?ZG9sMmRhbm5kUkZDMmRzeDRwZmE2UjFGdHVib0YyQ25JL0l3MHdyZGJpQzI5?=
 =?utf-8?B?VHNuS01FeVdRZFRWNGNqeEI3WEo5M1FueXhmdHpTWkhNcUpjcDBlQzVOcGxr?=
 =?utf-8?B?akthaDk5TFhscnVFdjA4S2hwZ05CcUUzVitKaUtXQTdlRDNGeFYzNzM3a1Vj?=
 =?utf-8?B?MzlNZ0FlZEozUWdHdTZ0ZkEweHpTa1d2TVMvM2dNdXFPZjlaR044TnVVakN3?=
 =?utf-8?B?WWpnTzNMbGswbTZJVXBuWEtEYnNxQlFTekIwd3g5UlpOM3AzcVNmM3hvN1Zo?=
 =?utf-8?B?b3VOQkh0dHJmWCtkNnYxTnJQVE4xUFd4R3RFbWw4SGZUamdNTTVFYUFGMC9W?=
 =?utf-8?B?Z3dXTXo1R0JTUnpmWllGUUxnQlZwVzlRbVpKMkcrK3BPYTRtNytaWlgrRm1O?=
 =?utf-8?B?NU90M1BSdlFlVCs5YzZvNlpQeStkeUdOeVBIQ2xTZXVXM0QvLzE5ckdrYzgz?=
 =?utf-8?B?ZXo4clBHTU1LbFMrc1dTL1BEb213dVJnbXJJaExvbktzd0pXNEg4Q0R5ZERW?=
 =?utf-8?B?Q0M5bWFVV2tsZlpEd08zRGRrMHFyU2NBNzF2L1Jvc0orMkJSb0xnb25Nc0xE?=
 =?utf-8?B?clFNMThSY2NlS1crVjZub0RXUVRrK0RUS1NwR3BnQ3NqaWEvVlpOQXhYSk5W?=
 =?utf-8?B?TWNuN3VhMGZkbFQxUWt4VStBQ25HRThUeDcxbm5jSzIwL2FrNjBGazdjMCsx?=
 =?utf-8?B?NzFxT0lBOVFmb0JibW0wN0JScFVnNTh2STlyN2loUW1hNDhpK21QRUcwNGNH?=
 =?utf-8?B?a2Q4cU0rNU5Oajg2d1l2L3hSYmx5Y3ZFd3hEWS9NTkhCdmdDZktBZjJKc3Vp?=
 =?utf-8?B?K2pGTzFJS2VPcy8rbHFQcXJZY1cwMzdabExaZHI1SWIzclAwWWdTcUpNclFp?=
 =?utf-8?B?MkFmOWlWcnQ2VHRaaUtVZGgwVzRybURTQlEvZE4wdysvNm14T2tpTjhnYVp5?=
 =?utf-8?B?VW5JczVIWWJPdDB2ODFaRCtUaHp3QkxPNDkrdStEcWlQM2h1S21aSGJCZ2o1?=
 =?utf-8?B?ZDJGWUo0RUFPT3BTWm4vUnBkU2QxRk5xM1A2eVlIczlSUnpOU3JqZUtVYUhR?=
 =?utf-8?B?eFZ6WnhJWThXNnI5Kzl5RXVMdmxnRDFaWlZUZ0laYXFyS1dEeUNYTWJBQ2JI?=
 =?utf-8?B?WExZV1VZSVBBTm4wemFtblNnWFJGY0dRSEtUc1JTNnRkWHVSbUJOQnhLK3FG?=
 =?utf-8?B?K2tGc2N1b1N4SWNXNi9IeElMaVBGTjR5bGRTN2VXVHYwZjl6NUxWcG0zS0x2?=
 =?utf-8?B?aUYyUDNsVlF3TW5uYy95bXJUTHBwTnFQSVQ3V2hKa3Iyd1RiZVhjN1Jqb3Mv?=
 =?utf-8?B?emZEcjB2V2ROK3k0WUVRQThZYXlDK1laMUkybG5iU1hpaHJFUEMwT0FSNDBH?=
 =?utf-8?B?bUN6NCttZlE1YlJYVVQwcFBIZ3N5aHZpc1N1NDJnNVJ2QzBvOXBTOHVpUi9X?=
 =?utf-8?B?R3hUU2pUM20xTHF3ZjhFM0p0Rm1VdmUxZVhGanB6NEczdmhyODU1NkwwYm1k?=
 =?utf-8?B?emZhRUhac0xDTEh3Sk5lLzNWUkM1TDFaK1BDblA3VGEybGFISW9pOGllTk92?=
 =?utf-8?B?WHR0ZTB1TGtBZVpMWEhEbEJvc3R3eHpjT1U5cHVvamVEZktWZWFQaE96OE93?=
 =?utf-8?B?SDU0QUorZ1F4YkRIOVhjMmlyOXBBMFlBaitHTXM3dkNWZWlsSjFoZGw2YUx2?=
 =?utf-8?B?Um54aGE1Sm5BSFU3UUlVcnphcEl2ZzRyWTZpcjJWV2hIbTZIcEZkWDliRGtG?=
 =?utf-8?B?dTVuK0dHTUtxMmt3cEdpWEFZTTBmMXlVQ0FvdUZjUEp5clJWdUJIQ0VodXJV?=
 =?utf-8?Q?ve7iJ+9HXloRGNIcE14dgr45d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d92f00-564d-4840-e69e-08dc5cc28d08
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 20:36:24.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jch2Es+0+8yYI6Z2WNGmlHuUAacSvcUcAsBEHheKMgoMcyPtr6i62+8Jh2m6bPaCfKB/jEhaT15q9sJUvkTV6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905
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

On 4/10/2024 6:22 PM, Matthew Auld wrote:
> On 08/04/2024 16:16, Arunpravin Paneer Selvam wrote:
>> - Add tracking clear page feature.
>>
>> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>>    successfully clears the blocks in the free path. On the otherhand,
>>    DRM buddy marks each block as cleared.
>>
>> - Track the available cleared pages size
>>
>> - If driver requests cleared memory we prefer cleared memory
>>    but fallback to uncleared if we can't find the cleared blocks.
>>    when driver requests uncleared memory we try to use uncleared but
>>    fallback to cleared memory if necessary.
>>
>> - When a block gets freed we clear it and mark the freed block as 
>> cleared,
>>    when there are buddies which are cleared as well we can merge them.
>>    Otherwise, we prefer to keep the blocks as separated.
>>
>> - Add a function to support defragmentation.
>>
>> v1:
>>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>>      cleared. Else, reset the clear flag for each block in the 
>> list(Christian)
>>    - For merging the 2 cleared blocks compare as below,
>>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)(Christian)
>>    - Defragment the memory beginning from min_order
>>      till the required memory space is available.
>>
>> v2: (Matthew)
>>    - Add a wrapper drm_buddy_free_list_internal for the freeing of 
>> blocks
>>      operation within drm buddy.
>>    - Write a macro block_incompatible() to allocate the required blocks.
>>    - Update the xe driver for the drm_buddy_free_list change in 
>> arguments.
>>    - add a warning if the two blocks are incompatible on
>>      defragmentation
>>    - call full defragmentation in the fini() function
>>    - place a condition to test if min_order is equal to 0
>>    - replace the list with safe_reverse() variant as we might
>>      remove the block from the list.
>>
>> v3:
>>    - fix Gitlab user reported lockup issue.
>>    - Keep DRM_BUDDY_HEADER_CLEAR define sorted(Matthew)
>>    - modify to pass the root order instead max_order in fini()
>>      function(Matthew)
>>    - change bool 1 to true(Matthew)
>>    - add check if min_block_size is power of 2(Matthew)
>>    - modify the min_block_size datatype to u64(Matthew)
>>
>> v4:
>>    - rename the function drm_buddy_defrag with __force_merge.
>>    - Include __force_merge directly in drm buddy file and remove
>>      the defrag use in amdgpu driver.
>>    - Remove list_empty() check(Matthew)
>>    - Remove unnecessary space, headers and placement of new 
>> variables(Matthew)
>>    - Add a unit test case(Matthew)
>>
>> v5:
>>    - remove force merge support to actual range allocation and not to 
>> bail
>>      out when contains && split(Matthew)
>>    - add range support to force merge function.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>>   drivers/gpu/drm/drm_buddy.c                   | 430 ++++++++++++++----
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>>   drivers/gpu/drm/tests/drm_buddy_test.c        |  28 +-
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
>>   include/drm/drm_buddy.h                       |  16 +-
>>   6 files changed, 368 insertions(+), 122 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 8db880244324..c0c851409241 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>         amdgpu_vram_mgr_do_reserve(man);
>>   -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>> @@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device 
>> *adev)
>>           kfree(rsv);
>>         list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, 
>> blocks) {
>> -        drm_buddy_free_list(&mgr->mm, &rsv->allocated);
>> +        drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>>           kfree(rsv);
>>       }
>>       if (!adev->gmc.is_app_apu)
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 5ebdd6f8f36e..83dbe252f727 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -38,8 +38,8 @@ static void drm_block_free(struct drm_buddy *mm,
>>       kmem_cache_free(slab_blocks, block);
>>   }
>>   -static void list_insert_sorted(struct drm_buddy *mm,
>> -                   struct drm_buddy_block *block)
>> +static void list_insert(struct drm_buddy *mm,
>> +            struct drm_buddy_block *block)
>
> Why the change here?
>
>>   {
>>       struct drm_buddy_block *node;
>>       struct list_head *head;
>> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>>       __list_add(&block->link, node->link.prev, &node->link);
>>   }
>>   +static void clear_reset(struct drm_buddy_block *block)
>> +{
>> +    block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>> +static void mark_cleared(struct drm_buddy_block *block)
>> +{
>> +    block->header |= DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>>   static void mark_allocated(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>> @@ -71,7 +81,7 @@ static void mark_free(struct drm_buddy *mm,
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_FREE;
>>   -    list_insert_sorted(mm, block);
>> +    list_insert(mm, block);
>>   }
>>     static void mark_split(struct drm_buddy_block *block)
>> @@ -82,6 +92,133 @@ static void mark_split(struct drm_buddy_block 
>> *block)
>>       list_del(&block->link);
>>   }
>>   +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +    return s1 <= e2 && e1 >= s2;
>> +}
>> +
>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +    return s1 <= s2 && e1 >= e2;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +__get_buddy(struct drm_buddy_block *block)
>> +{
>> +    struct drm_buddy_block *parent;
>> +
>> +    parent = block->parent;
>> +    if (!parent)
>> +        return NULL;
>> +
>> +    if (parent->left == block)
>> +        return parent->right;
>> +
>> +    return parent->left;
>> +}
>> +
>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>> +                     struct drm_buddy_block *block,
>> +                     bool force_merge)
>> +{
>> +    struct drm_buddy_block *parent;
>> +    unsigned int order;
>> +
>> +    while ((parent = block->parent)) {
>> +        struct drm_buddy_block *buddy;
>> +
>> +        buddy = __get_buddy(block);
>> +
>> +        if (!drm_buddy_block_is_free(buddy))
>> +            break;
>> +
>> +        if (!force_merge) {
>> +            /*
>> +             * Check the block and its buddy clear state and exit
>> +             * the loop if they both have the dissimilar state.
>> +             */
>> +            if (drm_buddy_block_is_clear(block) !=
>> +                drm_buddy_block_is_clear(buddy))
>> +                break;
>> +
>> +            if (drm_buddy_block_is_clear(block))
>> +                mark_cleared(parent);
>> +        }
>> +
>> +        list_del(&buddy->link);
>> +        if (force_merge && drm_buddy_block_is_clear(buddy))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>> +
>> +        drm_block_free(mm, block);
>> +        drm_block_free(mm, buddy);
>> +
>> +        block = parent;
>> +    }
>> +
>> +    order = drm_buddy_block_order(block);
>> +    mark_free(mm, block);
>> +
>> +    return order;
>> +}
>> +
>> +static int __force_merge(struct drm_buddy *mm,
>> +             u64 start,
>> +             u64 end,
>> +             unsigned int min_order)
>> +{
>> +    unsigned int order;
>> +    int i;
>> +
>> +    if (!min_order)
>> +        return -ENOMEM;
>> +
>> +    if (min_order > mm->max_order)
>> +        return -EINVAL;
>> +
>> +    for (i = min_order - 1; i >= 0; i--) {
>> +        struct drm_buddy_block *block, *prev;
>> +
>> +        list_for_each_entry_safe_reverse(block, prev, 
>> &mm->free_list[i], link) {
>> +            struct drm_buddy_block *buddy;
>> +            u64 block_start, block_end;
>> +
>> +            if (!block->parent)
>> +                continue;
>> +
>> +            block_start = drm_buddy_block_offset(block);
>> +            block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>> +
>> +            if (!contains(start, end, block_start, block_end))
>> +                continue;
>> +
>> +            buddy = __get_buddy(block);
>> +            if (!drm_buddy_block_is_free(buddy))
>> +                continue;
>> +
>> +            WARN_ON(drm_buddy_block_is_clear(block) ==
>> +                drm_buddy_block_is_clear(buddy));
>> +
>> +            /*
>> +             * If the prev block is same as buddy, don't access the
>> +             * block in the next iteration as we would free the
>> +             * buddy block as part of the free function.
>> +             */
>> +            if (prev == buddy)
>> +                prev = list_prev_entry(prev, link);
>> +
>> +            list_del(&block->link);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +
>> +            order = __drm_buddy_free(mm, block, true);
>> +            if (order >= min_order)
>> +                return 0;
>> +        }
>> +    }
>> +
>> +    return -ENOMEM;
>> +}
>> +
>>   /**
>>    * drm_buddy_init - init memory manager
>>    *
>> @@ -186,11 +323,21 @@ EXPORT_SYMBOL(drm_buddy_init);
>>    */
>>   void drm_buddy_fini(struct drm_buddy *mm)
>>   {
>> +    u64 root_size, size;
>> +    unsigned int order;
>>       int i;
>>   +    size = mm->size;
>> +
>>       for (i = 0; i < mm->n_roots; ++i) {
>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>> +        __force_merge(mm, 0, size, order);
>> +
>>           WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>>           drm_block_free(mm, mm->roots[i]);
>> +
>> +        root_size = mm->chunk_size << order;
>> +        size -= root_size;
>>       }
>>         WARN_ON(mm->avail != mm->size);
>> @@ -223,26 +370,17 @@ static int split_block(struct drm_buddy *mm,
>>       mark_free(mm, block->left);
>>       mark_free(mm, block->right);
>>   +    if (drm_buddy_block_is_clear(block)) {
>> +        mark_cleared(block->left);
>> +        mark_cleared(block->right);
>> +        clear_reset(block);
>> +    }
>> +
>>       mark_split(block);
>>         return 0;
>>   }
>>   -static struct drm_buddy_block *
>> -__get_buddy(struct drm_buddy_block *block)
>> -{
>> -    struct drm_buddy_block *parent;
>> -
>> -    parent = block->parent;
>> -    if (!parent)
>> -        return NULL;
>> -
>> -    if (parent->left == block)
>> -        return parent->right;
>> -
>> -    return parent->left;
>> -}
>> -
>>   /**
>>    * drm_get_buddy - get buddy address
>>    *
>> @@ -260,30 +398,6 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>> -                 struct drm_buddy_block *block)
>> -{
>> -    struct drm_buddy_block *parent;
>> -
>> -    while ((parent = block->parent)) {
>> -        struct drm_buddy_block *buddy;
>> -
>> -        buddy = __get_buddy(block);
>> -
>> -        if (!drm_buddy_block_is_free(buddy))
>> -            break;
>> -
>> -        list_del(&buddy->link);
>> -
>> -        drm_block_free(mm, block);
>> -        drm_block_free(mm, buddy);
>> -
>> -        block = parent;
>> -    }
>> -
>> -    mark_free(mm, block);
>> -}
>> -
>>   /**
>>    * drm_buddy_free_block - free a block
>>    *
>> @@ -295,42 +409,74 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>   {
>>       BUG_ON(!drm_buddy_block_is_allocated(block));
>>       mm->avail += drm_buddy_block_size(mm, block);
>> -    __drm_buddy_free(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>> +
>> +    __drm_buddy_free(mm, block, false);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>   -/**
>> - * drm_buddy_free_list - free blocks
>> - *
>> - * @mm: DRM buddy manager
>> - * @objects: input list head to free blocks
>> - */
>> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects)
>> +static void __drm_buddy_free_list(struct drm_buddy *mm,
>> +                  struct list_head *objects,
>> +                  bool mark_clear,
>> +                  bool mark_dirty)
>>   {
>>       struct drm_buddy_block *block, *on;
>>   +    WARN_ON(mark_dirty && mark_clear);
>> +
>>       list_for_each_entry_safe(block, on, objects, link) {
>> +        if (mark_clear)
>> +            mark_cleared(block);
>> +        else if (mark_dirty)
>> +            clear_reset(block);
>>           drm_buddy_free_block(mm, block);
>>           cond_resched();
>>       }
>>       INIT_LIST_HEAD(objects);
>>   }
>> -EXPORT_SYMBOL(drm_buddy_free_list);
>>   -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> +static void drm_buddy_free_list_internal(struct drm_buddy *mm,
>> +                     struct list_head *objects)
>>   {
>> -    return s1 <= e2 && e1 >= s2;
>> +    /*
>> +     * Don't touch the clear/dirty bit, since allocation is still 
>> internal
>> +     * at this point. For example we might have just failed part of the
>> +     * allocation.
>> +     */
>> +    __drm_buddy_free_list(mm, objects, false, false);
>>   }
>>   -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> +/**
>> + * drm_buddy_free_list - free blocks
>> + *
>> + * @mm: DRM buddy manager
>> + * @objects: input list head to free blocks
>> + * @flags: optional flags like DRM_BUDDY_CLEARED
>> + */
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned int flags)
>>   {
>> -    return s1 <= s2 && e1 >= e2;
>> +    bool mark_clear = flags & DRM_BUDDY_CLEARED;
>> +
>> +    __drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
>> +}
>> +EXPORT_SYMBOL(drm_buddy_free_list);
>> +
>> +static bool block_incompatible(struct drm_buddy_block *block, 
>> unsigned int flags)
>> +{
>> +    bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
>> +
>> +    return needs_clear != drm_buddy_block_is_clear(block);
>>   }
>>     static struct drm_buddy_block *
>> -alloc_range_bias(struct drm_buddy *mm,
>> -         u64 start, u64 end,
>> -         unsigned int order)
>> +__alloc_range_bias(struct drm_buddy *mm,
>> +           u64 start, u64 end,
>> +           unsigned int order,
>> +           unsigned long flags,
>> +           bool fallback)
>>   {
>>       u64 req_size = mm->chunk_size << order;
>>       struct drm_buddy_block *block;
>> @@ -379,6 +525,9 @@ alloc_range_bias(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end) &&
>>               order == drm_buddy_block_order(block)) {
>> +            if (!fallback && block_incompatible(block, flags))
>> +                continue;
>> +
>>               /*
>>                * Find the free block within the range.
>>                */
>> @@ -410,30 +559,57 @@ alloc_range_bias(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, false);
>>       return ERR_PTR(err);
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order)
>> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>> +                 u64 start, u64 end,
>> +                 unsigned int order,
>> +                 unsigned long flags)
>>   {
>> -    struct drm_buddy_block *max_block = NULL, *node;
>> +    struct drm_buddy_block *block;
>> +    bool fallback = false;
>> +
>> +    block = __alloc_range_bias(mm, start, end, order,
>> +                   flags, fallback);
>> +    if (IS_ERR(block) && mm->clear_avail)
>> +        return __alloc_range_bias(mm, start, end, order,
>> +                      flags, !fallback);
>> +
>> +    return block;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +get_maxblock(struct drm_buddy *mm, unsigned int order,
>> +         unsigned long flags)
>> +{
>> +    struct drm_buddy_block *max_block = NULL, *block = NULL;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        if (!list_empty(&mm->free_list[i])) {
>> -            node = list_last_entry(&mm->free_list[i],
>> -                           struct drm_buddy_block,
>> -                           link);
>> -            if (!max_block) {
>> -                max_block = node;
>> +        struct drm_buddy_block *tmp_block;
>> +
>> +        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>> link) {
>> +            if (block_incompatible(tmp_block, flags))
>>                   continue;
>> -            }
>>   -            if (drm_buddy_block_offset(node) >
>> -                drm_buddy_block_offset(max_block)) {
>> -                max_block = node;
>> -            }
>> +            block = tmp_block;
>> +            break;
>> +        }
>> +
>> +        if (!block)
>> +            continue;
>> +
>> +        if (!max_block) {
>> +            max_block = block;
>> +            continue;
>> +        }
>> +
>> +        if (drm_buddy_block_offset(block) >
>> +            drm_buddy_block_offset(max_block)) {
>> +            max_block = block;
>>           }
>>       }
>>   @@ -450,11 +626,29 @@ alloc_from_freelist(struct drm_buddy *mm,
>>       int err;
>>         if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -        block = get_maxblock(mm, order);
>> +        block = get_maxblock(mm, order, flags);
>>           if (block)
>>               /* Store the obtained block order */
>>               tmp = drm_buddy_block_order(block);
>>       } else {
>> +        for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> +            struct drm_buddy_block *tmp_block;
>> +
>> +            list_for_each_entry_reverse(tmp_block, 
>> &mm->free_list[tmp], link) {
>> +                if (block_incompatible(tmp_block, flags))
>> +                    continue;
>> +
>> +                block = tmp_block;
>> +                break;
>> +            }
>> +
>> +            if (block)
>> +                break;
>> +        }
>> +    }
>> +
>> +    if (!block) {
>> +        /* Fallback method */
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>               if (!list_empty(&mm->free_list[tmp])) {
>>                   block = list_last_entry(&mm->free_list[tmp],
>> @@ -464,10 +658,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>>                       break;
>>               }
>>           }
>> -    }
>>   -    if (!block)
>> -        return ERR_PTR(-ENOSPC);
>> +        if (!block)
>> +            return ERR_PTR(-ENOSPC);
>> +    }
>>         BUG_ON(!drm_buddy_block_is_free(block));
>>   @@ -483,7 +677,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>     err_undo:
>>       if (tmp != order)
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, false);
>>       return ERR_PTR(err);
>>   }
>>   @@ -527,13 +721,22 @@ static int __alloc_range(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end)) {
>>               if (!drm_buddy_block_is_free(block)) {
>> -                err = -ENOSPC;
>> -                goto err_free;
>> +                if (drm_buddy_block_is_split(block)) {
>> +                    list_add(&block->right->tmp_link, dfs);
>> +                    list_add(&block->left->tmp_link, dfs);
>> +
>> +                    continue;
>> +                } else {
>> +                    err = -ENOSPC;
>> +                    goto err_free;
>> +                }
>>               }
>
> I think could maybe tweak this slightly to instead fallthrough if the 
> block is already split, also would be good to check clear_avail before 
> proceeding. Maybe something like:
>
> if (contains()) {
>     if (is_free()) {
>         mark_allocated()
>         .....
>         continue;
>    } else if (!mm->clear_avail) {
>        err = -ENOSPC;
>        goto err_free;
>    }
> }
>
>>                 mark_allocated(block);
>>               total_allocated += drm_buddy_block_size(mm, block);
>>               mm->avail -= drm_buddy_block_size(mm, block);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               list_add_tail(&block->link, &allocated);
>>               continue;
>>           }
>> @@ -567,14 +770,14 @@ static int __alloc_range(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, false);
>>     err_free:
>>       if (err == -ENOSPC && total_allocated_on_err) {
>>           list_splice_tail(&allocated, blocks);
>>           *total_allocated_on_err = total_allocated;
>>       } else {
>> -        drm_buddy_free_list(mm, &allocated);
>> +        drm_buddy_free_list_internal(mm, &allocated);
>>       }
>>         return err;
>> @@ -640,11 +843,11 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>               list_splice(&blocks_lhs, blocks);
>>               return 0;
>>           } else if (err != -ENOSPC) {
>> -            drm_buddy_free_list(mm, blocks);
>> +            drm_buddy_free_list_internal(mm, blocks);
>>               return err;
>>           }
>>           /* Free blocks for the next iteration */
>> -        drm_buddy_free_list(mm, blocks);
>> +        drm_buddy_free_list_internal(mm, blocks);
>>       }
>>         return -ENOSPC;
>> @@ -700,6 +903,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       list_del(&block->link);
>>       mark_free(mm, block);
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>         /* Prevent recursively freeing this node */
>>       parent = block->parent;
>> @@ -711,6 +916,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       if (err) {
>>           mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           list_add(&block->link, blocks);
>>       }
>>   @@ -719,13 +926,28 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>   }
>>   EXPORT_SYMBOL(drm_buddy_block_trim);
>>   +static struct drm_buddy_block *
>> +__drm_buddy_alloc_blocks(struct drm_buddy *mm,
>> +             u64 start, u64 end,
>> +             unsigned int order,
>> +             unsigned long flags)
>> +{
>> +    if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>> +        /* Allocate traversing within the range */
>> +        return  __drm_buddy_alloc_range_bias(mm, start, end,
>> +                             order, flags);
>> +    else
>> +        /* Allocate from freelist */
>> +        return alloc_from_freelist(mm, order, flags);
>> +}
>> +
>>   /**
>>    * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>    *
>>    * @mm: DRM buddy manager to allocate from
>>    * @start: start of the allowed range for this block
>>    * @end: end of the allowed range for this block
>> - * @size: size of the allocation
>> + * @size: size of the allocation in bytes
>>    * @min_block_size: alignment of the allocation
>>    * @blocks: output list head to add allocated blocks
>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>> @@ -800,23 +1022,33 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           BUG_ON(order < min_order);
>>             do {
>> -            if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>> -                /* Allocate traversing within the range */
>> -                block = alloc_range_bias(mm, start, end, order);
>> -            else
>> -                /* Allocate from freelist */
>> -                block = alloc_from_freelist(mm, order, flags);
>> -
>> +            block = __drm_buddy_alloc_blocks(mm, start,
>> +                             end,
>> +                             order,
>> +                             flags);
>>               if (!IS_ERR(block))
>>                   break;
>>                 if (order-- == min_order) {
>> +                /* Try allocation through force merge method */
>> +                if (mm->clear_avail &&
>> +                    !__force_merge(mm, start, end, min_order)) {
>
> Could maybe just check for clear_avail somewhere near the start of 
> __force_merge and just always return -ENOSPC if zero?
Already we are checking the mm->clear_avail, if the mm->clear_avail is 
0, we will not call the __force_merge() and
  __drm_buddy_alloc_blocks() functions and we should proceed for the try 
harder method if the contiguous flag is set.
If the try harder method too fails to allocate the blocks we would be 
returning -ENOSPC.

so the current behavior is if mm->clear_avail is zero, we will be 
returning -ENOSPC (if the contiguous flag is not set).

Thanks,
Arun.
>
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> +                    block = __drm_buddy_alloc_blocks(mm, start,
>> +                                     end,
>> +                                     min_order,
>> +                                     flags);
>> +                    if (!IS_ERR(block)) {
>> +                        order = min_order;
>> +                        break;
>> +                    }
>> +                }
>> +
>> +                /*
>> +                 * Try contiguous block allocation through
>> +                 * try harder method.
>> +                 */
>>                   if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>>                       !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>> -                    /*
>> -                     * Try contiguous block allocation through
>> -                     * try harder method
>> -                     */
>>                       return __alloc_contig_try_harder(mm,
>>                                        original_size,
>>                                        original_min_size,
>> @@ -828,6 +1060,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>             mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           kmemleak_update_trace(block);
>>           list_add_tail(&block->link, &allocated);
>>   @@ -866,7 +1100,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       return 0;
>>     err_free:
>> -    drm_buddy_free_list(mm, &allocated);
>> +    drm_buddy_free_list_internal(mm, &allocated);
>>       return err;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> @@ -899,8 +1133,8 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
>>   {
>>       int order;
>>   -    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB\n",
>> -           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>> +    drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB, clear_free: %lluMiB\n",
>> +           mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, 
>> mm->clear_avail >> 20);
>>         for (order = mm->max_order; order >= 0; order--) {
>>           struct drm_buddy_block *block;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 0d735d5c2b35..942345548bc3 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     err_free_blocks:
>> -    drm_buddy_free_list(mm, &bman_res->blocks);
>> +    drm_buddy_free_list(mm, &bman_res->blocks, 0);
>>       mutex_unlock(&bman->lock);
>>   err_free_res:
>>       ttm_resource_fini(man, &bman_res->base);
>> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct 
>> ttm_resource_manager *man,
>>       struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>         mutex_lock(&bman->lock);
>> -    drm_buddy_free_list(&bman->mm, &bman_res->blocks);
>> +    drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>>       bman->visible_avail += bman_res->used_visible_size;
>>       mutex_unlock(&bman->lock);
>>   @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device 
>> *bdev, unsigned int type)
>>       ttm_set_driver_manager(bdev, type, NULL);
>>         mutex_lock(&bman->lock);
>> -    drm_buddy_free_list(mm, &bman->reserved);
>> +    drm_buddy_free_list(mm, &bman->reserved, 0);
>>       drm_buddy_fini(mm);
>>       bman->visible_avail += bman->visible_reserved;
>>       WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index e48863a44556..4621a860cb05 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -103,7 +103,7 @@ static void 
>> drm_test_buddy_alloc_range_bias(struct kunit *test)
>>                                     DRM_BUDDY_RANGE_ALLOCATION),
>>                          "buddy_alloc i failed with bias(%x-%x), 
>> size=%u, ps=%u\n",
>>                          bias_start, bias_end, bias_size, bias_size);
>> -        drm_buddy_free_list(&mm, &tmp);
>> +        drm_buddy_free_list(&mm, &tmp, 0);
>>             /* single page with internal round_up */
>>           KUNIT_ASSERT_FALSE_MSG(test,
>> @@ -113,7 +113,7 @@ static void 
>> drm_test_buddy_alloc_range_bias(struct kunit *test)
>>                                     DRM_BUDDY_RANGE_ALLOCATION),
>>                          "buddy_alloc failed with bias(%x-%x), 
>> size=%u, ps=%u\n",
>>                          bias_start, bias_end, ps, bias_size);
>> -        drm_buddy_free_list(&mm, &tmp);
>> +        drm_buddy_free_list(&mm, &tmp, 0);
>>             /* random size within */
>>           size = max(round_up(prandom_u32_state(&prng) % bias_rem, 
>> ps), ps);
>> @@ -153,14 +153,14 @@ static void 
>> drm_test_buddy_alloc_range_bias(struct kunit *test)
>>                * unallocated, and ideally not always on the bias
>>                * boundaries.
>>                */
>> -            drm_buddy_free_list(&mm, &tmp);
>> +            drm_buddy_free_list(&mm, &tmp, 0);
>>           } else {
>>               list_splice_tail(&tmp, &allocated);
>>           }
>>       }
>>         kfree(order);
>> -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>         /*
>> @@ -220,7 +220,7 @@ static void 
>> drm_test_buddy_alloc_range_bias(struct kunit *test)
>>                     "buddy_alloc passed with bias(%x-%x), size=%u\n",
>>                     bias_start, bias_end, ps);
>>   -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -269,7 +269,7 @@ static void 
>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>                      "buddy_alloc didn't error size=%lu\n", 3 * ps);
>>   -    drm_buddy_free_list(&mm, &middle);
>> +    drm_buddy_free_list(&mm, &middle, 0);
>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                  3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> @@ -279,7 +279,7 @@ static void 
>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>                      "buddy_alloc didn't error size=%lu\n", 2 * ps);
>>   -    drm_buddy_free_list(&mm, &right);
>> +    drm_buddy_free_list(&mm, &right, 0);
>>       KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                  3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> @@ -294,7 +294,7 @@ static void 
>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>>                      "buddy_alloc hit an error size=%lu\n", 2 * ps);
>>   -    drm_buddy_free_list(&mm, &left);
>> +    drm_buddy_free_list(&mm, &left, 0);
>>       KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>>                                   3 * ps, ps, &allocated,
>> DRM_BUDDY_CONTIGUOUS_ALLOCATION),
>> @@ -306,7 +306,7 @@ static void 
>> drm_test_buddy_alloc_contiguous(struct kunit *test)
>>         KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
>>   -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -375,7 +375,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>                                 top, max_order);
>>       }
>>   -    drm_buddy_free_list(&mm, &holes);
>> +    drm_buddy_free_list(&mm, &holes, 0);
>>         /* Nothing larger than blocks of chunk_size now available */
>>       for (order = 1; order <= max_order; order++) {
>> @@ -387,7 +387,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>       }
>>         list_splice_tail(&holes, &blocks);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -482,7 +482,7 @@ static void 
>> drm_test_buddy_alloc_pessimistic(struct kunit *test)
>>         list_del(&block->link);
>>       drm_buddy_free_block(&mm, block);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -528,7 +528,7 @@ static void 
>> drm_test_buddy_alloc_optimistic(struct kunit *test)
>>                                  size, size, &tmp, flags),
>>                             "buddy_alloc unexpectedly succeeded, it 
>> should be full!");
>>   -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -563,7 +563,7 @@ static void drm_test_buddy_alloc_limit(struct 
>> kunit *test)
>>                           drm_buddy_block_size(&mm, block),
>>                           BIT_ULL(mm.max_order) * PAGE_SIZE);
>>   -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 115ec745e502..1ad678b62c4a 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>       struct drm_buddy *mm = &mgr->mm;
>>         mutex_lock(&mgr->lock);
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mgr->visible_avail += vres->used_visible_size;
>>       mutex_unlock(&mgr->lock);
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index a5b39fc01003..82570f77e817 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -25,6 +25,8 @@
>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>> +#define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>> +#define DRM_BUDDY_CLEARED            BIT(4)
>>     struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> @@ -32,8 +34,9 @@ struct drm_buddy_block {
>>   #define   DRM_BUDDY_ALLOCATED       (1 << 10)
>>   #define   DRM_BUDDY_FREE       (2 << 10)
>>   #define   DRM_BUDDY_SPLIT       (3 << 10)
>> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>>   /* Free to be used, if needed in the future */
>> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>>       u64 header;
>>   @@ -86,6 +89,7 @@ struct drm_buddy {
>>       u64 chunk_size;
>>       u64 size;
>>       u64 avail;
>> +    u64 clear_avail;
>>   };
>>     static inline u64
>> @@ -112,6 +116,12 @@ drm_buddy_block_is_allocated(struct 
>> drm_buddy_block *block)
>>       return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>>   }
>>   +static inline bool
>> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
>> +{
>> +    return block->header & DRM_BUDDY_HEADER_CLEAR;
>> +}
>> +
>>   static inline bool
>>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>>   {
>> @@ -150,7 +160,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>     void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>   -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects);
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned int flags);
>>     void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,

