Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2188701A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170491120DB;
	Mon,  4 Mar 2024 12:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkzrbKpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DED31120DA;
 Mon,  4 Mar 2024 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709555802; x=1741091802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+FtajtSxKbInVirJmin7eCfNQOWaG6cSc3qGgSAMFUQ=;
 b=RkzrbKpcHxKvsjkEQJEsmws/hqLN4K/XOzfBPwM1TxYQi0Jr3ctkFxnt
 0Pnpfd7VqlsvlWD+4PojASTqhRR1mFClmulprgS9su9Ww9Beu0N4gE1aU
 V+yBJjUSZU1L8gtE12OWmo18FHwbAsHeeozLHp70oh/qdEaiWzYXsIJgS
 y7j55CnLSIF9N7RjYximc1J7a18VbUFpePfjpQH2bsbNo0FUvqQc06K4k
 lWTqVxHzrWE/jcSqrOC09YWrUzPtv6Jg4EOHtcTR35I+3av1JsrBRk67x
 q6ERCeVMJvE490mcgU1h0sTg0dPkuk6w/mLNoA8T/NDJ0hT0kDCe2HhNG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7854531"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7854531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8937331"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.228])
 ([10.252.23.228])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:36:39 -0800
Message-ID: <0bae5cd3-2cb0-4ed2-ba49-ac991e909cbd@intel.com>
Date: Mon, 4 Mar 2024 12:36:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/buddy: Add defragmentation support
Content-Language: en-GB
To: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, felix.kuehling@amd.com
References: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
 <20240221121801.3252-3-Arunpravin.PaneerSelvam@amd.com>
 <2c841f63-10d5-4de3-b331-6b320a92dc64@intel.com>
 <ebdc7ceb-2ec4-460c-b8a3-c90184cd800e@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ebdc7ceb-2ec4-460c-b8a3-c90184cd800e@amd.com>
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

On 04/03/2024 12:22, Paneer Selvam, Arunpravin wrote:
> Hi Matthew,
> 
> On 2/22/2024 12:12 AM, Matthew Auld wrote:
>> On 21/02/2024 12:18, Arunpravin Paneer Selvam wrote:
>>> Add a function to support defragmentation.
>>>
>>> v1:
>>>    - Defragment the memory beginning from min_order
>>>      till the required memory space is available.
>>>
>>> v2(Matthew):
>>>    - add amdgpu user for defragmentation
>>>    - add a warning if the two blocks are incompatible on
>>>      defragmentation
>>>    - call full defragmentation in the fini() function
>>>    - place a condition to test if min_order is equal to 0
>>>    - replace the list with safe_reverse() variant as we might
>>>      remove the block from the list.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++-
>>>   drivers/gpu/drm/drm_buddy.c                  | 93 +++++++++++++++++---
>>>   include/drm/drm_buddy.h                      |  3 +
>>>   3 files changed, 97 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index e494f5bf136a..cff8a526c622 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>                          min_block_size,
>>>                          &vres->blocks,
>>>                          vres->flags);
>>> -        if (unlikely(r))
>>> -            goto error_free_blocks;
>>> +        if (unlikely(r)) {
>>> +            if (r == -ENOSPC) {
>>> +                drm_buddy_defrag(mm, min_block_size);
>>> +                r = drm_buddy_alloc_blocks(mm, fpfn,
>>> +                               lpfn,
>>> +                               size,
>>> +                               min_block_size,
>>> +                               &vres->blocks,
>>> +                               vres->flags);
>>> +                if (unlikely(r))
>>> +                    goto error_free_blocks;
>>> +            } else {
>>> +                goto error_free_blocks;
>>> +            }
>>> +        }
>>>             if (size > remaining_size)
>>>               remaining_size = 0;
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 18e004fa39d3..56bd1560fbcd 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -203,6 +203,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>>           drm_block_free(mm, mm->roots[i]);
>>>       }
>>>   +    drm_buddy_defrag(mm, mm->chunk_size << mm->max_order);
>>
>> I think this needs to be called higher up, otherwise we blow up with 
>> the WARN, plus we just freed the root(s). There is also the case with 
>> non-power-of-two VRAM size, in which case you get multiple roots and 
>> max_order is just the largest root and not entire address space. I 
>> guess do this in the loop above and use the root order instead?
>>
>> Also this should be done as part of the first patch and then in this 
>> patch it is just a case of exporting it. Every commit should ideally 
>> be functional by itself.
> You mean we move the above change in drm_buddy_fini function and 
> drm_buddy_defrag function as part of first patch.
> And just we add export function and add amdgpu user in this patch. Is my 
> understanding correct?

Yeah, I think that makes sense.

> 
> Thanks,
> Arun.
>>
>>> +
>>>       WARN_ON(mm->avail != mm->size);
>>>         kfree(mm->roots);
>>> @@ -276,25 +278,39 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>   }
>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>>> -                 struct drm_buddy_block *block)
>>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>>> +                     struct drm_buddy_block *block,
>>> +                     bool defrag)
>>>   {
>>> +    unsigned int order, block_order;
>>>       struct drm_buddy_block *parent;
>>>   +    block_order = drm_buddy_block_order(block);
>>> +
>>>       while ((parent = block->parent)) {
>>> -        struct drm_buddy_block *buddy;
>>> +        struct drm_buddy_block *buddy = NULL;
>>>             buddy = __get_buddy(block);
>>>             if (!drm_buddy_block_is_free(buddy))
>>>               break;
>>>   -        if (drm_buddy_block_is_clear(block) !=
>>> -            drm_buddy_block_is_clear(buddy))
>>> -            break;
>>> +        if (!defrag) {
>>> +            /*
>>> +             * Check the block and its buddy clear state and exit
>>> +             * the loop if they both have the dissimilar state.
>>> +             */
>>> +            if (drm_buddy_block_is_clear(block) !=
>>> +                drm_buddy_block_is_clear(buddy))
>>> +                break;
>>>   -        if (drm_buddy_block_is_clear(block))
>>> -            mark_cleared(parent);
>>> +            if (drm_buddy_block_is_clear(block))
>>> +                mark_cleared(parent);
>>> +        }
>>> +
>>> +        WARN_ON(defrag &&
>>> +            (drm_buddy_block_is_clear(block) ==
>>> +             drm_buddy_block_is_clear(buddy)));
>>>             list_del(&buddy->link);
>>>   @@ -304,8 +320,57 @@ static void __drm_buddy_free(struct drm_buddy 
>>> *mm,
>>>           block = parent;
>>>       }
>>>   -    mark_free(mm, block);
>>> +    order = drm_buddy_block_order(block);
>>> +    if (block_order != order)
>>> +        mark_free(mm, block);
>>> +
>>> +    return order;
>>> +}
>>> +
>>> +/**
>>> + * drm_buddy_defrag - Defragmentation routine
>>> + *
>>> + * @mm: DRM buddy manager
>>> + * @min_block_size: minimum size in bytes to begin
>>> + * the defragmentation process
>>> + *
>>> + * Driver calls the defragmentation function when the
>>> + * requested memory allocation returns -ENOSPC.
>>> + */
>>> +void drm_buddy_defrag(struct drm_buddy *mm,
>>> +              unsigned int min_block_size)
>>
>> u64 min_block_size. Most cards have 4G+ of VRAM :)
>>
>>> +{
>>> +    struct drm_buddy_block *block, *tmp;
>>> +    unsigned int order, min_order;
>>> +    struct list_head *list;
>>> +    unsigned long pages;
>>> +    int i;
>>> +
>>> +    pages = min_block_size >> ilog2(mm->chunk_size);
>>> +    min_order = fls(pages) - 1;
>>
>> I think min_block_size should be power-of-two, no?
>>
>>> +
>>> +    if (!min_order)
>>> +        return;
>>> +
>>> +    if (min_order > mm->max_order)
>>> +        return;
>>> +
>>> +    for (i = min_order - 1; i >= 0; i--) {
>>> +        list = &mm->free_list[i];
>>> +        if (list_empty(list))
>>> +            continue;
>>> +
>>> +        list_for_each_entry_safe_reverse(block, tmp, list, link) {
>>> +            if (!block->parent)
>>> +                continue;
>>> +
>>> +            order = __drm_buddy_free(mm, block, 1);
>>
>> s/1/true/
>>
>>> +            if (order >= min_order)
>>> +                return;
>>> +        }
>>> +    }
>>>   }
>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>     /**
>>>    * drm_buddy_free_block - free a block
>>> @@ -321,7 +386,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>>       if (drm_buddy_block_is_clear(block))
>>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>>   -    __drm_buddy_free(mm, block);
>>> +    __drm_buddy_free(mm, block, 0);
>>>   }
>>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>>   @@ -468,7 +533,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>>       if (buddy &&
>>>           (drm_buddy_block_is_free(block) &&
>>>            drm_buddy_block_is_free(buddy)))
>>> -        __drm_buddy_free(mm, block);
>>> +        __drm_buddy_free(mm, block, 0);
>>>       return ERR_PTR(err);
>>>   }
>>>   @@ -586,7 +651,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>     err_undo:
>>>       if (tmp != order)
>>> -        __drm_buddy_free(mm, block);
>>> +        __drm_buddy_free(mm, block, 0);
>>>       return ERR_PTR(err);
>>>   }
>>>   @@ -666,7 +731,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>       if (buddy &&
>>>           (drm_buddy_block_is_free(block) &&
>>>            drm_buddy_block_is_free(buddy)))
>>> -        __drm_buddy_free(mm, block);
>>> +        __drm_buddy_free(mm, block, 0);
>>>     err_free:
>>>       if (err == -ENOSPC && total_allocated_on_err) {
>>> @@ -828,7 +893,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>>    * @mm: DRM buddy manager to allocate from
>>>    * @start: start of the allowed range for this block
>>>    * @end: end of the allowed range for this block
>>> - * @size: size of the allocation
>>> + * @size: size of the allocation in bytes
>>>    * @min_block_size: alignment of the allocation
>>>    * @blocks: output list head to add allocated blocks
>>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 352a6364e26a..68a874846e78 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -167,6 +167,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>>>                struct list_head *objects,
>>>                unsigned int flags);
>>>   +void drm_buddy_defrag(struct drm_buddy *mm,
>>> +              unsigned int min_order);
>>> +
>>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>>                  struct drm_buddy_block *block,
> 
