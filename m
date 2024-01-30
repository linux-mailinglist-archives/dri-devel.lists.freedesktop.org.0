Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12753842DE3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 21:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45ACD10F2A1;
	Tue, 30 Jan 2024 20:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1B911357A;
 Tue, 30 Jan 2024 20:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQsOOxkDIlU4tjDIc3a0n3EPozWKpM4RM5W0g4YGqso4rOl50/2dJj+b6W04buallGvmTjNSKGSCmLTogSQ3RzogK/Qp8aElnwz9OFZ83AFJK5nROV0NNds6KRXWkBHJqGkOjBQkvIUrHYdK7c5hFNL3RfGWf50OeVwcxJ0aEAaabpeJReNCaP1BAGBHrOFp8z+Rx/FexSYmkcUPnNncIGyBsfQZjXRAqc/q6INbSXTpHd/xub5osZky10+kfjw7KLFYS4aE6m9d+2HoGCOHgGYjCxYonry7jrxG2EukhZl86vgQoyI5jYJXh4SZCJqJNQhIHT66uHzuas+jNzp53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgBkFJX7nR9T1w08N26F0JCQREZPz7DIMoycskFtkh8=;
 b=dX3JDwNvc6t+YhmZUgIkJW4ODBsBbq0vrlgUOBPLb60VPpcNu6+HpQuirXOQmr25fVTa7m+8MuU8O2lTzJCMnhRrbdj8TLtQe6UqXcPXc2j+bHXferkB0D1chZKBWX50puI0bqLbY0uCXLA64z7UUtH95DwookzX+45+7v0h5YuxggOYaUpozjQ1VIqppTEfge4nHpoNnrncBGMzgm7suSHVbYVwYpEk4ux/hMBKLy+2V+PDTHqQDhGWnL4NZVuBPPM9oFLM9jNwFakwros81LGTzJMyOleAzFj104Ti9JuzGCuwQi2nRiL3S++NCygTwekB8l50uQiFMuhezY7k+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgBkFJX7nR9T1w08N26F0JCQREZPz7DIMoycskFtkh8=;
 b=hOBkblbKSKWaTNixyUOxf1IS0zNDNgFYprrIk/yX0KdyQIrZIA9lZ98eLGOUfJviYR5u3UADPLTSvv01nmgub3dY5IbLV6BvOwiXa6kYa5vszSNvMwJaqqeJd4Td6rccwCGe7DkMv1bKpgm+W2fp0UVkE6hETZpiJjIK6jVEdj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SJ2PR12MB9115.namprd12.prod.outlook.com (2603:10b6:a03:55c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 20:30:51 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 20:30:51 +0000
Message-ID: <f7d78505-3d96-9e42-8a30-b4921365f95e@amd.com>
Date: Wed, 31 Jan 2024 02:00:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] drm/buddy: Implement tracking clear page feature
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20231214134240.3183-1-Arunpravin.PaneerSelvam@amd.com>
 <963893ce-5f79-458b-9607-3a2d98fd2098@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <963893ce-5f79-458b-9607-3a2d98fd2098@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0204.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SJ2PR12MB9115:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e61e7f-61ab-433b-02be-08dc21d25962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ezlhxoeSZ5Uk5jo+DjKRygoIAX4uxY7AlJmIky79PDESBYcuqbshAtkXUfUgdPnlM0UcDnT36khbJh16JJEoHx5UkruAnTTzbXXhXuRnNh6SWgjNe4HTktFEUuzOzfNccGO36aXvDwBkI+/ma1JPEEcNDbRRZxWpodr0bR+1VkSaxH357rqCsktrKnqghbZ/Eu3T0NajPPnqr/0dDpXcrAEPh2pXJ2Z3HryVgznWDMZw69H7oDNhFbwoRelUGUkiERsmM2r7zR8JAiMIfBSO/lYGhGd2CE695qzebI9GoBP4gH8zXoJJVoui5uiBBcZdtBUN3LCV310cO/+9OotqMGBpwHVMInwUT2sciguY6ROYdT35/d4CrOAvVb024jijZjhF37BJ08boy5Il1TM8scLrNR2Be+NcojJKfGvEzIgVAE5JGQgnPC5+I45TcuKMmtlv+msmAd7c7VXTK10KCPnwrpUnXh4M1drfIYxE3ykg0/aXjSsDC63L4+VpWCY3tV+0FCWOwUcPimZ6XWyHwEtPVLX8M7Dp+J/umfQv7m94GfyxaclacQLX0Tntu4F+dNq6fGYqu9Y821zuk1grzasMJuPZbZNM/KbhcIfWZb28wHECxCfXidOpOvH1EyKQsrXrqF3YQjx2ImXKJblV7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(31696002)(478600001)(6666004)(86362001)(6512007)(6486002)(66946007)(6506007)(53546011)(2616005)(5660300002)(38100700002)(30864003)(966005)(2906002)(66556008)(4326008)(8936002)(66476007)(8676002)(316002)(31686004)(83380400001)(66574015)(26005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFFLdXJ4d3N2MWxsMFpIaE1QVTNCeE9aWTByQlovbGlOc0tza0pPbEtNSHVs?=
 =?utf-8?B?OVgvT0xkeWtuc3B1MGpUUzJpdTF6dzF3cGtFK1RRdmpHWEtxa0pnd2N3MVFn?=
 =?utf-8?B?WUZBMVpZOUx0SDNjUk9uVlE0Q2Q5UlJXL2pmaGxBWFNxWjh5Mmx5M2t3UXlC?=
 =?utf-8?B?cDFrdkx4MHBzcDRNaVN3TjlUQVF6WWpCKzNUenVHU2c3dzRDYWxUVkZaaytT?=
 =?utf-8?B?U2R3S0tXS29ibWl4VW5sYk1QaysyK2RQMWxlSkhpbXRxcVVybHVEZWxYUjYw?=
 =?utf-8?B?SEtBbTE0VTA2aVI5bmM1SUpaNFVKRnhsaWlaajZWdXgrTjM1WlhMeTNEaVlh?=
 =?utf-8?B?NFMxaG9DZ2hicWN2OWtZQVhNc1VNRnhaWkxwblVldVFCTThjN2R2ZWJGR0Fx?=
 =?utf-8?B?Q05wSExnWms3R3cyZXRHZ3BqR3JiTHErSjFvSTh3L25US2ZBTWdNZG9jWUdH?=
 =?utf-8?B?eldEdFVvdDlzT2ZCQVVUODR2U1V2QVI2YlZLYzFqeEF2UWMzZHl6L3E0aEpU?=
 =?utf-8?B?RGlDazYwKy8wOU5UVGpPMnUxd3daUzI0VzRNajk3azlWSCs2S3d0dVZUWlhQ?=
 =?utf-8?B?ZGxpOEZ2YjJjTGxSSVdjMFpMWTRxY21rTFlFTDE4a0Q2WXJsSXcrdWU0WWl2?=
 =?utf-8?B?VGtZeHdsN1pndjNtOTR4ZnlqdENJTDdPSDVncGkwU0JIVFJOSWhWenFlcklq?=
 =?utf-8?B?N3ZxMVhwT1lWelkwMlRFZWdjc3VqOHRXcU1SMjQ3Q2w0eWxQb2VuTlFsMXVm?=
 =?utf-8?B?dnB3NzBlOWVaK09GUnNRTXZoVXdNN0lXMzNYSVZlbUpzV2R3ZWpVRmtEeWsw?=
 =?utf-8?B?cWpnSXR3dytTQXJKUFRtTHhDVnV2cHpmUkdDODcrS0l6b0dhNG5LcDY5UGoy?=
 =?utf-8?B?OXhqVmhUVm5GQUc0WVRneTRGTVY0QWw4K2o4SXpjVjVCck8xSXZiMjYwaDdX?=
 =?utf-8?B?NVhSY3N3RGh2TXdIeTJrdXZWQnNWZzdqZERtZkJFYU5LV0ZiVVlseUY3TFdx?=
 =?utf-8?B?THl5VEJHVGxFRG9qSDhVS25sc0tabWR2aEJTMFRhaGh4QTZsVXY4QjRXR1l6?=
 =?utf-8?B?a2lGa1l5VmVneE5aWWRncGxodmhmVytpbkIwY05va0t3ZW14S1kvT3I2Z1pD?=
 =?utf-8?B?Zkt2aUxvVXZENFFuYUw3YWZyZVQ3djhhZlhxUlBuay9SMkU3eVNmMGR4d094?=
 =?utf-8?B?bzl4RHBXOC8vNnd1K0ZOajJlalhBUGl2RUpYL3lJT2Ryd2lLMVFjRFlMMGpy?=
 =?utf-8?B?ckU3VEY3S3h4bytCaGV1OHJnS1dmNXliUkc4b0ZUR2dVcFRSelBwSER0WUJn?=
 =?utf-8?B?M2NCMGZsVFVXdEpWQkpYcUV4azhjZFUxRmpMdzJyVG8ya3N1N1BsZXo3bE8v?=
 =?utf-8?B?Z0EwOGNpTWUwV1BadnQ0c0Z4b2hJYVNFdENhQVJxVEx2dE5VMlZvSTBWNExy?=
 =?utf-8?B?NjVTNW4zSHAwK29yaTRkNCtrTE8xVGpYUmZvNVUrc3JLNXVNVzJ5Wll4Tm53?=
 =?utf-8?B?bm9ITnhrc1ZKN0NlTUwxMEQ2ODdnK0t6eS9peVBuWVlpTmN4NnFHK3NIQjBM?=
 =?utf-8?B?eEx5cE5WcGR3dVdNZlFvWk5MRnRzSXJZTCtSV0R5RVlsUkNYdXlWSm1Ccnpw?=
 =?utf-8?B?MHozUlNoeFdRdTN0eE5DNHNnL3VTYjU3em5YeXRQeTRyUi9wb0o1aU02Mm1h?=
 =?utf-8?B?SXNOVjI1a3p0Zms0eHlOQ1lTVmtDa0MzaVVSRE5kVnZKQTR2WEVkQWY1OFlz?=
 =?utf-8?B?L3Z3NG9iZUlNMTRoQ0xUMUI5TnpKb1BNTXNXVVZ2czlOWlFsSkZOTzVJUVNW?=
 =?utf-8?B?SERvd204bjJkZ3hqdGh3clZkSWtZT3VFSkZrNCttODZDTllPMnZqWUhydmI5?=
 =?utf-8?B?eElZSHhsM2RPL2hJZkthOGt5S0tmQTFxZHRsaEQraVZadHBESkVKd0FZT3ls?=
 =?utf-8?B?c1lleG1hUUJQeTlQc2l6K0srWWZWcmZMKzFnZTF5dmxJMHlEc1RTL1p4RlVp?=
 =?utf-8?B?Z0MvUndDQS9tdVlRMzNaZjJUSXRqN1ZxUzdnakVJRkNKTG81UU9TS3FlKzVr?=
 =?utf-8?B?d05qRmVyUjQ4YzQvdzJQRjVZSEV3TnhBQXdmcUtNQ3NwbGtWZmcxajE5UGR3?=
 =?utf-8?Q?/gC4nIAzInPI03fOcqlRxElXb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e61e7f-61ab-433b-02be-08dc21d25962
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 20:30:50.9401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdSAPuBMLR6+lT+8VUIepnDlZB23hJtnJtbliHtb2Lo+Id+c4Kv0NdxWl7VxI1vQJBCCEMz4iVuFP9id3Uoikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9115
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,

On 12/21/2023 12:51 AM, Matthew Auld wrote:
> Hi,
>
> On 14/12/2023 13:42, Arunpravin Paneer Selvam wrote:
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
>
> I was not involved, but it looks like we have also tried enabling the 
> clear-on-free idea for VRAM in i915 and then also tracking that in the 
> allocator, however that work unfortunately is not upstream. The code 
> is open source though: 
> https://github.com/intel-gpu/intel-gpu-i915-backports/blob/backport/main/drivers/gpu/drm/i915/i915_buddy.c#L300
>
> It looks like some of the design differences there are having two 
> separate free lists, so mm->clean and mm->dirty (sounds reasonable to 
> me). And also the inclusion of a de-fragmentation routine, since buddy 
> blocks are now not always merged back, we might choose to run the 
> defrag in some cases, which also sounds reasonable. IIRC in amdgpu 
> userspace can control the page-size for an allocation, so perhaps you 
> would want to run it first if the allocation fails, before trying to 
> evict stuff?
I checked the clear-on-free idea implemented in i915. In amdgpu version, 
we are clearing all the blocks in amdgpu free routine and DRM buddy 
expects only the DRM_BUDDY_CLEARED flag. Basically, we are keeping the 
cleared blocks ready to be allocated when the user request for the 
cleared memory. We observed that this improves the performance on games 
and resolves the stutter issues as well. I see i915 active fences part 
does the same job for i915. Could we move this part into i915 free 
routine and set the DRM_BUDDY_CLEARED flag.

On de-fragmentation , I have included a function which can be called at 
places where we get -ENOSPC. This routine will merge back the clear and 
dirty blocks together to form a larger block of requested size. I am 
wondering where we could use this routine as for the non-contiguous 
memory we have the fallback method and for the contiguous memory we have 
the try harder method which searches through the tree.

I agree we can have 2 lists (clear list and dirty list) and this would 
reduce the search iterations. But we need to handle the 2 lists design 
in all the functions which might require more time for testing on all 
platforms. Could we just go ahead with 1 list (free list) for now and I 
am going to take up this work as my next task.

Thanks,
Arun.
>
>>
>> v1: (Christian)
>>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>>      cleared. Else, reset the clear flag for each block in the list.
>>
>>    - For merging the 2 cleared blocks compare as below,
>>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>>   drivers/gpu/drm/drm_buddy.c                   | 169 +++++++++++++++---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>>   drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
>>   include/drm/drm_buddy.h                       |  18 +-
>>   5 files changed, 168 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index 08916538a615..d0e199cc8f17 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -556,7 +556,7 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>       return 0;
>>     error_free_blocks:
>> -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>   error_fini:
>>       ttm_resource_fini(man, &vres->base);
>> @@ -589,7 +589,7 @@ static void amdgpu_vram_mgr_del(struct 
>> ttm_resource_manager *man,
>>         amdgpu_vram_mgr_do_reserve(man);
>>   -    drm_buddy_free_list(mm, &vres->blocks);
>> +    drm_buddy_free_list(mm, &vres->blocks, 0);
>>       mutex_unlock(&mgr->lock);
>>         atomic64_sub(vis_usage, &mgr->vis_usage);
>> @@ -897,7 +897,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device 
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
>> index f57e6d74fb0e..d44172f23f05 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
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
>> @@ -223,6 +233,12 @@ static int split_block(struct drm_buddy *mm,
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
>> @@ -273,6 +289,13 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>>           if (!drm_buddy_block_is_free(buddy))
>>               break;
>>   +        if (drm_buddy_block_is_clear(block) !=
>> +            drm_buddy_block_is_clear(buddy))
>> +            break;
>> +
>> +        if (drm_buddy_block_is_clear(block))
>> +            mark_cleared(parent);
>> +
>>           list_del(&buddy->link);
>>             drm_block_free(mm, block);
>> @@ -295,6 +318,9 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>   {
>>       BUG_ON(!drm_buddy_block_is_allocated(block));
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>> +
>>       __drm_buddy_free(mm, block);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>> @@ -305,10 +331,20 @@ EXPORT_SYMBOL(drm_buddy_free_block);
>>    * @mm: DRM buddy manager
>>    * @objects: input list head to free blocks
>>    */
>> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects)
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned long flags)
>>   {
>>       struct drm_buddy_block *block, *on;
>>   +    if (flags & DRM_BUDDY_CLEARED) {
>> +        list_for_each_entry(block, objects, link)
>> +            mark_cleared(block);
>> +    } else {
>> +        list_for_each_entry(block, objects, link)
>> +            clear_reset(block);
>> +    }
>> +
>>       list_for_each_entry_safe(block, on, objects, link) {
>>           drm_buddy_free_block(mm, block);
>>           cond_resched();
>> @@ -328,9 +364,11 @@ static inline bool contains(u64 s1, u64 e1, u64 
>> s2, u64 e2)
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
>>       struct drm_buddy_block *block;
>>       struct drm_buddy_block *buddy;
>> @@ -369,6 +407,15 @@ alloc_range_bias(struct drm_buddy *mm,
>>             if (contains(start, end, block_start, block_end) &&
>>               order == drm_buddy_block_order(block)) {
>> +            if (!fallback) {
>> +                if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                    if (!drm_buddy_block_is_clear(block))
>> +                        continue;
>> +                } else {
>> +                    if (drm_buddy_block_is_clear(block))
>> +                        continue;
>> +                }
>> +            }
>>               /*
>>                * Find the free block within the range.
>>                */
>> @@ -405,25 +452,58 @@ alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order)
>> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>> +                 u64 start, u64 end,
>> +                 unsigned int order,
>> +                 unsigned long flags)
>> +{
>> +    struct drm_buddy_block *block;
>> +    bool fallback = 0;
>> +
>> +    block = __alloc_range_bias(mm, start, end, order,
>> +                   flags, fallback);
>> +    if (IS_ERR(block))
>> +        return __alloc_range_bias(mm, start, end, order,
>> +                      flags, !fallback);
>> +
>> +    return block;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +get_maxblock(struct drm_buddy *mm, unsigned int order,
>> +         unsigned long flags)
>>   {
>> -    struct drm_buddy_block *max_block = NULL, *node;
>> +    struct drm_buddy_block *max_block = NULL, *block = NULL;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        if (!list_empty(&mm->free_list[i])) {
>> -            node = list_last_entry(&mm->free_list[i],
>> -                           struct drm_buddy_block,
>> -                           link);
>> -            if (!max_block) {
>> -                max_block = node;
>> -                continue;
>> +        struct drm_buddy_block *tmp_block;
>> +
>> +        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>> link) {
>> +            if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                /* Find a cleared block */
>> +                if (!drm_buddy_block_is_clear(tmp_block))
>> +                    continue;
>> +            } else {
>> +                if (drm_buddy_block_is_clear(tmp_block))
>> +                    continue;
>>               }
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
>>   @@ -440,11 +520,35 @@ alloc_from_freelist(struct drm_buddy *mm,
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
>> +                if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
>> +                    /* Find a cleared block */
>> +                    if (!drm_buddy_block_is_clear(tmp_block))
>> +                        continue;
>> +                } else {
>> +                    if (drm_buddy_block_is_clear(tmp_block))
>> +                        continue;
>> +                }
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
>> @@ -454,10 +558,10 @@ alloc_from_freelist(struct drm_buddy *mm,
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
>>   @@ -524,6 +628,8 @@ static int __alloc_range(struct drm_buddy *mm,
>>               mark_allocated(block);
>>               total_allocated += drm_buddy_block_size(mm, block);
>>               mm->avail -= drm_buddy_block_size(mm, block);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               list_add_tail(&block->link, &allocated);
>>               continue;
>>           }
>> @@ -558,7 +664,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>           list_splice_tail(&allocated, blocks);
>>           *total_allocated_on_err = total_allocated;
>>       } else {
>> -        drm_buddy_free_list(mm, &allocated);
>> +        drm_buddy_free_list(mm, &allocated, 0);
>>       }
>>         return err;
>> @@ -624,11 +730,11 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>               list_splice(&blocks_lhs, blocks);
>>               return 0;
>>           } else if (err != -ENOSPC) {
>> -            drm_buddy_free_list(mm, blocks);
>> +            drm_buddy_free_list(mm, blocks, 0);
>>               return err;
>>           }
>>           /* Free blocks for the next iteration */
>> -        drm_buddy_free_list(mm, blocks);
>> +        drm_buddy_free_list(mm, blocks, 0);
>>       }
>>         return -ENOSPC;
>> @@ -684,6 +790,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       list_del(&block->link);
>>       mark_free(mm, block);
>>       mm->avail += drm_buddy_block_size(mm, block);
>> +    if (drm_buddy_block_is_clear(block))
>> +        mm->clear_avail += drm_buddy_block_size(mm, block);
>>         /* Prevent recursively freeing this node */
>>       parent = block->parent;
>> @@ -695,6 +803,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>       if (err) {
>>           mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           list_add(&block->link, blocks);
>>       }
>>   @@ -782,7 +892,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>           do {
>>               if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>                   /* Allocate traversing within the range */
>> -                block = alloc_range_bias(mm, start, end, order);
>> +                block = __drm_buddy_alloc_range_bias(mm, start, end,
>> +                                     order, flags);
>>               else
>>                   /* Allocate from freelist */
>>                   block = alloc_from_freelist(mm, order, flags);
>> @@ -808,6 +919,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>             mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> +        if (drm_buddy_block_is_clear(block))
>> +            mm->clear_avail -= drm_buddy_block_size(mm, block);
>>           kmemleak_update_trace(block);
>>           list_add_tail(&block->link, &allocated);
>>   @@ -846,7 +959,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       return 0;
>>     err_free:
>> -    drm_buddy_free_list(mm, &allocated);
>> +    drm_buddy_free_list(mm, &allocated, 0);
>>       return err;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> @@ -879,8 +992,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct 
>> drm_printer *p)
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
>> index ea2af6bd9abe..e0860fce9ebd 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -83,7 +83,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>                                 top, max_order);
>>       }
>>   -    drm_buddy_free_list(&mm, &holes);
>> +    drm_buddy_free_list(&mm, &holes, 0);
>>         /* Nothing larger than blocks of chunk_size now available */
>>       for (order = 1; order <= max_order; order++) {
>> @@ -95,7 +95,7 @@ static void 
>> drm_test_buddy_alloc_pathological(struct kunit *test)
>>       }
>>         list_splice_tail(&holes, &blocks);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -190,7 +190,7 @@ static void 
>> drm_test_buddy_alloc_pessimistic(struct kunit *test)
>>         list_del(&block->link);
>>       drm_buddy_free_block(&mm, block);
>> -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -236,7 +236,7 @@ static void 
>> drm_test_buddy_alloc_optimistic(struct kunit *test)
>>                                  size, size, &tmp, flags),
>>                             "buddy_alloc unexpectedly succeeded, it 
>> should be full!");
>>   -    drm_buddy_free_list(&mm, &blocks);
>> +    drm_buddy_free_list(&mm, &blocks, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   @@ -271,7 +271,7 @@ static void drm_test_buddy_alloc_limit(struct 
>> kunit *test)
>>                           drm_buddy_block_size(&mm, block),
>>                           BIT_ULL(mm.max_order) * PAGE_SIZE);
>>   -    drm_buddy_free_list(&mm, &allocated);
>> +    drm_buddy_free_list(&mm, &allocated, 0);
>>       drm_buddy_fini(&mm);
>>   }
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index a5b39fc01003..f7311b59f2b0 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -6,6 +6,7 @@
>>   #ifndef __DRM_BUDDY_H__
>>   #define __DRM_BUDDY_H__
>>   +#include <linux/bitfield.h>
>>   #include <linux/bitops.h>
>>   #include <linux/list.h>
>>   #include <linux/slab.h>
>> @@ -25,15 +26,19 @@
>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>> +#define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>> +#define DRM_BUDDY_CLEARED            BIT(4)
>>     struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
>> +
>>   #define   DRM_BUDDY_ALLOCATED       (1 << 10)
>>   #define   DRM_BUDDY_FREE       (2 << 10)
>>   #define   DRM_BUDDY_SPLIT       (3 << 10)
>>   /* Free to be used, if needed in the future */
>> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
>> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>>       u64 header;
>>   @@ -86,6 +91,7 @@ struct drm_buddy {
>>       u64 chunk_size;
>>       u64 size;
>>       u64 avail;
>> +    u64 clear_avail;
>>   };
>>     static inline u64
>> @@ -112,6 +118,12 @@ drm_buddy_block_is_allocated(struct 
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
>> @@ -150,7 +162,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>     void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>   -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects);
>> +void drm_buddy_free_list(struct drm_buddy *mm,
>> +             struct list_head *objects,
>> +             unsigned long flags);
>>     void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,

