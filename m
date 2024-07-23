Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3593A34C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 16:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E19310E5E8;
	Tue, 23 Jul 2024 14:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDFlvjKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBF189496;
 Tue, 23 Jul 2024 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721746589; x=1753282589;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VjCF4sXMLJzVAPahkYhBhf3XDbD38u6a10PWcLs7eEY=;
 b=RDFlvjKrY9rt9JArGxgPPHMEAaSu2Abi+/WBmp8wHdOdjmgu7urfZa4Y
 2YwgGle1HfveukF8LHwV6DAg+INYgd5JdcGlwsrYttlyqrAmg1z+TwLm5
 GUDl1cmbjynQwzDtqNjm6t1vihJIGtSZFgXQstN3WT1GL022ownlP4OsK
 W9w1HQ9KTEpeyFJW0yNIDNNCM75IH99WD9exEtytZO0BECY/IV6r/dxGT
 KW3J+OD8x/pLXEe0S+ZgUJX4Vc+6FQa3lczDGDEIkGJHRyga0KheoTSpg
 EWEo4qcnRROOuBp1TPaBXW68JFRambmhP7dFJv6KIXNcBgfdtnceUXi4m g==;
X-CSE-ConnectionGUID: iJfs0tDVSquoGPw0TdyAnQ==
X-CSE-MsgGUID: 9fZIWo9LSGSxR2cRWyX8+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="22275937"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="22275937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 07:56:27 -0700
X-CSE-ConnectionGUID: JI1b0nlES9mdxo1viCUyJQ==
X-CSE-MsgGUID: j+Gurl6ARbGvUzOV4HFpBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="82902810"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.253])
 ([10.245.245.253])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 07:56:26 -0700
Message-ID: <c2660981-0e9b-43e8-abf1-26060d308de6@intel.com>
Date: Tue, 23 Jul 2024 15:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com, frank.min@amd.com,
 marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
 <635ee761-13a5-413e-9953-cfb8c6d3cc0e@amd.com>
 <67ca2d5c-a762-4627-94d1-532b0e3d2100@intel.com>
 <f4027aee-1ff2-4f0d-8230-6f6b2e101f78@amd.com>
 <9fce9f74-ebbb-4763-9f87-218055e61654@intel.com>
 <dad0c7b4-2dc7-4c2c-bc75-ff70ead452e3@amd.com>
 <72c98414-3d17-4f00-85c3-2e584757c85b@intel.com>
 <2c3a79fb-4fdb-4c2d-806f-ceeed8116043@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <2c3a79fb-4fdb-4c2d-806f-ceeed8116043@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

On 22/07/2024 12:41, Paneer Selvam, Arunpravin wrote:
> Hi Matthew,
> 
> On 7/19/2024 4:01 PM, Matthew Auld wrote:
>> On 17/07/2024 16:02, Paneer Selvam, Arunpravin wrote:
>>>
>>>
>>> On 7/16/2024 3:34 PM, Matthew Auld wrote:
>>>> On 16/07/2024 10:50, Paneer Selvam, Arunpravin wrote:
>>>>> Hi Matthew,
>>>>>
>>>>> On 7/10/2024 6:20 PM, Matthew Auld wrote:
>>>>>> On 10/07/2024 07:03, Paneer Selvam, Arunpravin wrote:
>>>>>>> Thanks Alex.
>>>>>>>
>>>>>>> Hi Matthew,
>>>>>>> Any comments?
>>>>>>
>>>>>> Do we not pass the required address alignment when allocating the 
>>>>>> pages in the first place?
>>>>> If address alignment is really useful, we can add that in the 
>>>>> drm_buddy_alloc_blocks() function.
>>>>
>>>> I mean don't we already pass the min page size, which should give us 
>>>> matching physical address alignment?
>>> I think we don't need to align the address to the passed 
>>> min_block_size value for all the contiguous
>>> buffers, so I thought that decision we can leave it to the drivers 
>>> and they can achieve that through trim function
>>> in this kind of a specific request.
>>
>> I would have assumed it would be simpler to use min_block_size and 
>> then trim the size, if it's too big? That would then also take care of 
>> the try_harder case?
> For example, if the required contiguous size is 1MiB and min_block_size 
> is 256KiB, to perform the address alignment of 256KiB, we might need to 
> over-allocate at least
> to the min_block_size (say 256KiB). Now the size becomes 1280KiB and 

If we have 1M contig request then it should already be aligned to 256K 
and every other power-of-two < 1M. VRAM should start at offset zero, so 
1M block will have 1M address alignment, and so should also be aligned 
to 256K, right?

Or does "address alignment of 256KiB" mean something else here? To me it 
just means IS_ALIGNED(block_start, 256K).

> since the contiguous flag is enabled, we will round up the size to the 
> next power of two and the size
> value becomes 2MiB. Next, in trimming we should round up the block start 
> address to the min_block_size. May be we can keep the above mentioned 
> operations under the
> flag combination DRM_BUDDY_CONTIGUOUS_ALLOCATION && 
> DRM_BUDDY_ADDRESS_ALIGNMENT?.
> 
> At the moment, we cannot support address alignment for try_harder 
> allocations since in case of try_harder allocations we first traverse 
> RHS to allocate the maximum possible
> and traverse LHS (here we align the LHS size to min_block_size) to 
> allocate the remaining size. May be in case of 
> DRM_BUDDY_ADDRESS_ALIGNMENT, we should first allocate
> LHS satisfying the address alignment requirement and then traverse RHS 
> to allocate the remaining size if required?
>>
>> Also how are we dealing with the multi-block try_harder case? AFAICT 
>> we only allow trimming single block atm, or is it not possible to 
>> trigger that path here? Or are we handling that somehow?
> not possible to trigger that path here. only when we either 
> over-allocate the LHS size and pass the multiple blocks to the trim 
> function or implement the above mentioned method.
>>
>>>
>>> https://patchwork.freedesktop.org/series/136150/
>>> We are getting this sparse error from the Intel CI. Do you think 
>>> these errors are introduced with this patches?
>>
>> I think it's safe to ignore, there seem to be other series with the 
>> same thing.
> Thanks.
>>
>>>
>>> Thanks,
>>> Arun.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Arun.
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Arun.
>>>>>>>
>>>>>>> On 7/9/2024 1:42 AM, Alex Deucher wrote:
>>>>>>>> On Thu, Jul 4, 2024 at 4:40 AM Arunpravin Paneer Selvam
>>>>>>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>>>>>>> - Add a new start parameter in trim function to specify exact
>>>>>>>>>    address from where to start the trimming. This would help us
>>>>>>>>>    in situations like if drivers would like to do address 
>>>>>>>>> alignment
>>>>>>>>>    for specific requirements.
>>>>>>>>>
>>>>>>>>> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>>>>>>>>    flag to disable the allocator trimming part. This patch enables
>>>>>>>>>    the drivers control trimming and they can do it themselves
>>>>>>>>>    based on the application requirements.
>>>>>>>>>
>>>>>>>>> v1:(Matthew)
>>>>>>>>>    - check new_start alignment with min chunk_size
>>>>>>>>>    - use range_overflows()
>>>>>>>>>
>>>>>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>>>>> Series is:
>>>>>>>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>
>>>>>>>> I'd like to take this series through the amdgpu tree if there 
>>>>>>>> are no
>>>>>>>> objections as it's required for display buffers on some chips 
>>>>>>>> and I'd
>>>>>>>> like to make sure it lands in 6.11.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>>
>>>>>>>> Alex
>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/drm_buddy.c          | 25 
>>>>>>>>> +++++++++++++++++++++++--
>>>>>>>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>>>>>>>>   include/drm/drm_buddy.h              |  2 ++
>>>>>>>>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c 
>>>>>>>>> b/drivers/gpu/drm/drm_buddy.c
>>>>>>>>> index 94f8c34fc293..8cebe1fa4e9d 100644
>>>>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>>>>> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct 
>>>>>>>>> drm_buddy *mm,
>>>>>>>>>    * drm_buddy_block_trim - free unused pages
>>>>>>>>>    *
>>>>>>>>>    * @mm: DRM buddy manager
>>>>>>>>> + * @start: start address to begin the trimming.
>>>>>>>>>    * @new_size: original size requested
>>>>>>>>>    * @blocks: Input and output list of allocated blocks.
>>>>>>>>>    * MUST contain single block as input to be trimmed.
>>>>>>>>> @@ -866,11 +867,13 @@ static int 
>>>>>>>>> __alloc_contig_try_harder(struct drm_buddy *mm,
>>>>>>>>>    * 0 on success, error code on failure.
>>>>>>>>>    */
>>>>>>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>>> +                        u64 *start,
>>>>>>>>>                           u64 new_size,
>>>>>>>>>                           struct list_head *blocks)
>>>>>>>>>   {
>>>>>>>>>          struct drm_buddy_block *parent;
>>>>>>>>>          struct drm_buddy_block *block;
>>>>>>>>> +       u64 block_start, block_end;
>>>>>>>>>          LIST_HEAD(dfs);
>>>>>>>>>          u64 new_start;
>>>>>>>>>          int err;
>>>>>>>>> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>>>                                   struct drm_buddy_block,
>>>>>>>>>                                   link);
>>>>>>>>>
>>>>>>>>> +       block_start = drm_buddy_block_offset(block);
>>>>>>>>> +       block_end = block_start + drm_buddy_block_size(mm, block);
>>>>>>>>> +
>>>>>>>>>          if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>>>>>>>>                  return -EINVAL;
>>>>>>>>>
>>>>>>>>> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy 
>>>>>>>>> *mm,
>>>>>>>>>          if (new_size == drm_buddy_block_size(mm, block))
>>>>>>>>>                  return 0;
>>>>>>>>>
>>>>>>>>> +       new_start = block_start;
>>>>>>>>> +       if (start) {
>>>>>>>>> +               new_start = *start;
>>>>>>>>> +
>>>>>>>>> +               if (new_start < block_start)
>>>>>>>>> +                       return -EINVAL;
>>>>>>>>> +
>>>>>>>>> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
>>>>>>>>> +                       return -EINVAL;
>>>>>>>>> +
>>>>>>>>> +               if (range_overflows(new_start, new_size, 
>>>>>>>>> block_end))
>>>>>>>>> +                       return -EINVAL;
>>>>>>>>> +       }
>>>>>>>>> +
>>>>>>>>>          list_del(&block->link);
>>>>>>>>>          mark_free(mm, block);
>>>>>>>>>          mm->avail += drm_buddy_block_size(mm, block);
>>>>>>>>> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>>>          parent = block->parent;
>>>>>>>>>          block->parent = NULL;
>>>>>>>>>
>>>>>>>>> -       new_start = drm_buddy_block_offset(block);
>>>>>>>>>          list_add(&block->tmp_link, &dfs);
>>>>>>>>>          err =  __alloc_range(mm, &dfs, new_start, new_size, 
>>>>>>>>> blocks, NULL);
>>>>>>>>>          if (err) {
>>>>>>>>> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct 
>>>>>>>>> drm_buddy *mm,
>>>>>>>>>          } while (1);
>>>>>>>>>
>>>>>>>>>          /* Trim the allocated block to the required size */
>>>>>>>>> -       if (original_size != size) {
>>>>>>>>> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>>>>>>>>> +           original_size != size) {
>>>>>>>>>                  struct list_head *trim_list;
>>>>>>>>>                  LIST_HEAD(temp);
>>>>>>>>>                  u64 trim_size;
>>>>>>>>> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct 
>>>>>>>>> drm_buddy *mm,
>>>>>>>>>                  }
>>>>>>>>>
>>>>>>>>>                  drm_buddy_block_trim(mm,
>>>>>>>>> +                                    NULL,
>>>>>>>>>                                       trim_size,
>>>>>>>>>                                       trim_list);
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>>>>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>>>>> index fe3779fdba2c..423b261ea743 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>>>>>> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>>>>>>>> ttm_resource_manager *man,
>>>>>>>>>          } while (remaining_size);
>>>>>>>>>
>>>>>>>>>          if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>>>>>>> -               if (!drm_buddy_block_trim(mm, vres->base.size, 
>>>>>>>>> &vres->blocks))
>>>>>>>>> +               if (!drm_buddy_block_trim(mm, NULL, 
>>>>>>>>> vres->base.size, &vres->blocks))
>>>>>>>>>                          size = vres->base.size;
>>>>>>>>>          }
>>>>>>>>>
>>>>>>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>>>>>>> index 82570f77e817..0c2f735f0265 100644
>>>>>>>>> --- a/include/drm/drm_buddy.h
>>>>>>>>> +++ b/include/drm/drm_buddy.h
>>>>>>>>> @@ -27,6 +27,7 @@
>>>>>>>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION BIT(2)
>>>>>>>>>   #define DRM_BUDDY_CLEAR_ALLOCATION BIT(3)
>>>>>>>>>   #define DRM_BUDDY_CLEARED BIT(4)
>>>>>>>>> +#define DRM_BUDDY_TRIM_DISABLE BIT(5)
>>>>>>>>>
>>>>>>>>>   struct drm_buddy_block {
>>>>>>>>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>>>>>>>> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy 
>>>>>>>>> *mm,
>>>>>>>>>                             unsigned long flags);
>>>>>>>>>
>>>>>>>>>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>>>>>>>> +                        u64 *start,
>>>>>>>>>                           u64 new_size,
>>>>>>>>>                           struct list_head *blocks);
>>>>>>>>>
>>>>>>>>> -- 
>>>>>>>>> 2.25.1
>>>>>>>>>
>>>>>>>
>>>>>
>>>
> 
