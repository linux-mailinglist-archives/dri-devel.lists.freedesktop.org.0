Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F51F476F49
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 11:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9625610F354;
	Thu, 16 Dec 2021 10:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0297210F34D;
 Thu, 16 Dec 2021 10:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639652163; x=1671188163;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r8xSdeX0Jj5DjJjhKQVgCgkQmYD7IXvDtBPQw1rVdBE=;
 b=Fp/F8QJpzCjvadjjAsfjizYbarS9AxkI5AI337E31GSr36R7Fn2Ihdob
 aQBe1EefbcLSDPY/vckmEbw4b36JV6Y490efdMmSKYyeg1ZuAKRtYHhN5
 C5NgY+3eMXzCHcan1LUvg/O6+8ziW94wZ353EqN5bVF478a61WD0lloJu
 HirayQ1Co9yM3CloDVka8+A89/hBZk5pm/RRszP57lGAeTq3Rif+Oi3+F
 mMb14UWXhawvXQYZn0zPxYK+rhehtbwF1uyRi0kaTdoDrmH4VTs4mvrn+
 R3WQmZLiWCeHT6rpvCl9mjkZrXxVqwFclr8vXH1FDAh6Xq5qwqwBvoSYa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="237000897"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="237000897"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 02:56:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506229476"
Received: from yshchyok-mobl1.ccr.corp.intel.com (HELO [10.252.21.121])
 ([10.252.21.121])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 02:55:59 -0800
Message-ID: <c75ea151-4656-833b-5232-c92d2a3b4825@intel.com>
Date: Thu, 16 Dec 2021 10:55:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-GB
To: Arunpravin <arunpravin.paneerselvam@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211201163938.133226-1-Arunpravin.PaneerSelvam@amd.com>
 <20211201163938.133226-2-Arunpravin.PaneerSelvam@amd.com>
 <MN2PR12MB4342EA8DD09D84589AE3C0A0E4709@MN2PR12MB4342.namprd12.prod.outlook.com>
 <7613e294-eab5-b034-aad9-857bd049d9c6@intel.com>
 <be7e62de-59d1-9c52-ee4a-c2d1a512f28f@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <be7e62de-59d1-9c52-ee4a-c2d1a512f28f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/12/2021 20:46, Arunpravin wrote:
> 
> 
> On 14/12/21 12:29 am, Matthew Auld wrote:
>> On 09/12/2021 15:47, Paneer Selvam, Arunpravin wrote:
>>> [AMD Official Use Only]
>>>
>>> Hi Matthew,
>>>
>>> Ping on this?
>>
>> No new comments from me :) I guess just a question of what we should do
>> with the selftests, and then ofc at some point being able to throw this
>> at CI, or at least test locally, once the series builds.
>>
> sure :) I think we should rewrite the i915 buddy selftests since now we
> have a single function for range and non-range requirements. I will
> rewrite the i915 buddy selftests and move to drm selftests folder?
> so for the time being, I remove the i915_buddy_mock_selftest() from
> i915_mock_selftests.h list to avoid build errors?

Yeah, whatever is easiest.

>>>
>>> Regards,
>>> Arun
>>> -----Original Message-----
>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Arunpravin
>>> Sent: Wednesday, December 1, 2021 10:10 PM
>>> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>> Cc: daniel@ffwll.ch; Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; jani.nikula@linux.intel.com; matthew.auld@intel.com; tzimmermann@suse.de; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
>>> Subject: [PATCH v4 2/6] drm: improve drm_buddy_alloc function
>>>
>>> - Make drm_buddy_alloc a single function to handle
>>>     range allocation and non-range allocation demands
>>>
>>> - Implemented a new function alloc_range() which allocates
>>>     the requested power-of-two block comply with range limitations
>>>
>>> - Moved order computation and memory alignment logic from
>>>     i915 driver to drm buddy
>>>
>>> v2:
>>>     merged below changes to keep the build unbroken
>>>      - drm_buddy_alloc_range() becomes obsolete and may be removed
>>>      - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>>      - apply enhanced drm_buddy_alloc() function to i915 driver
>>>
>>> v3(Matthew Auld):
>>>     - Fix alignment issues and remove unnecessary list_empty check
>>>     - add more validation checks for input arguments
>>>     - make alloc_range() block allocations as bottom-up
>>>     - optimize order computation logic
>>>     - replace uint64_t with u64, which is preferred in the kernel
>>>
>>> v4(Matthew Auld):
>>>     - keep drm_buddy_alloc_range() function implementation for generic
>>>       actual range allocations
>>>     - keep alloc_range() implementation for end bias allocations
>>>
>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>    drivers/gpu/drm/drm_buddy.c                   | 316 +++++++++++++-----
>>>    drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
>>>    drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>>    include/drm/drm_buddy.h                       |  22 +-
>>>    4 files changed, 285 insertions(+), 122 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c index 9340a4b61c5a..7f47632821f4 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -280,23 +280,97 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)  }  EXPORT_SYMBOL(drm_buddy_free_list);
>>>    
>>> -/**
>>> - * drm_buddy_alloc - allocate power-of-two blocks
>>> - *
>>> - * @mm: DRM buddy manager to allocate from
>>> - * @order: size of the allocation
>>> - *
>>> - * The order value here translates to:
>>> - *
>>> - * 0 = 2^0 * mm->chunk_size
>>> - * 1 = 2^1 * mm->chunk_size
>>> - * 2 = 2^2 * mm->chunk_size
>>> - *
>>> - * Returns:
>>> - * allocated ptr to the &drm_buddy_block on success
>>> - */
>>> -struct drm_buddy_block *
>>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) {
>>> +	return s1 <= e2 && e1 >= s2;
>>> +}
>>> +
>>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) {
>>> +	return s1 <= s2 && e1 >= e2;
>>> +}
>>> +
>>> +static struct drm_buddy_block *
>>> +alloc_range_bias(struct drm_buddy_mm *mm,
>>> +		 u64 start, u64 end,
>>> +		 unsigned int order)
>>> +{
>>> +	struct drm_buddy_block *block;
>>> +	struct drm_buddy_block *buddy;
>>> +	LIST_HEAD(dfs);
>>> +	int err;
>>> +	int i;
>>> +
>>> +	end = end - 1;
>>> +
>>> +	for (i = 0; i < mm->n_roots; ++i)
>>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>> +
>>> +	do {
>>> +		u64 block_start;
>>> +		u64 block_end;
>>> +
>>> +		block = list_first_entry_or_null(&dfs,
>>> +						 struct drm_buddy_block,
>>> +						 tmp_link);
>>> +		if (!block)
>>> +			break;
>>> +
>>> +		list_del(&block->tmp_link);
>>> +
>>> +		if (drm_buddy_block_order(block) < order)
>>> +			continue;
>>> +
>>> +		block_start = drm_buddy_block_offset(block);
>>> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>>> +
>>> +		if (!overlaps(start, end, block_start, block_end))
>>> +			continue;
>>> +
>>> +		if (drm_buddy_block_is_allocated(block))
>>> +			continue;
>>> +
>>> +		if (contains(start, end, block_start, block_end) &&
>>> +		    order == drm_buddy_block_order(block)) {
>>> +			/*
>>> +			 * Find the free block within the range.
>>> +			 */
>>> +			if (drm_buddy_block_is_free(block))
>>> +				return block;
>>> +
>>> +			continue;
>>> +		}
>>> +
>>> +		if (!drm_buddy_block_is_split(block)) {
>>> +			err = split_block(mm, block);
>>> +			if (unlikely(err))
>>> +				goto err_undo;
>>> +		}
>>> +
>>> +		list_add(&block->right->tmp_link, &dfs);
>>> +		list_add(&block->left->tmp_link, &dfs);
>>> +	} while (1);
>>> +
>>> +	return ERR_PTR(-ENOSPC);
>>> +
>>> +err_undo:
>>> +	/*
>>> +	 * We really don't want to leave around a bunch of split blocks, since
>>> +	 * bigger is better, so make sure we merge everything back before we
>>> +	 * free the allocated blocks.
>>> +	 */
>>> +	buddy = get_buddy(block);
>>> +	if (buddy &&
>>> +	    (drm_buddy_block_is_free(block) &&
>>> +	     drm_buddy_block_is_free(buddy)))
>>> +		__drm_buddy_free(mm, block);
>>> +	return ERR_PTR(err);
>>> +}
>>> +
>>> +static struct drm_buddy_block *
>>> +alloc_from_freelist(struct drm_buddy_mm *mm,
>>> +		    unsigned int order,
>>> +		    unsigned long flags)
>>>    {
>>>    	struct drm_buddy_block *block = NULL;
>>>    	unsigned int i;
>>> @@ -318,78 +392,28 @@ drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>>>    	while (i != order) {
>>>    		err = split_block(mm, block);
>>>    		if (unlikely(err))
>>> -			goto out_free;
>>> +			goto err_undo;
>>>    
>>> -		/* Go low */
>>> -		block = block->left;
>>> +		block = block->right;
>>>    		i--;
>>>    	}
>>> -
>>> -	mark_allocated(block);
>>> -	mm->avail -= drm_buddy_block_size(mm, block);
>>> -	kmemleak_update_trace(block);
>>>    	return block;
>>>    
>>> -out_free:
>>> +err_undo:
>>>    	if (i != order)
>>>    		__drm_buddy_free(mm, block);
>>>    	return ERR_PTR(err);
>>>    }
>>> -EXPORT_SYMBOL(drm_buddy_alloc);
>>> -
>>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2) -{
>>> -	return s1 <= e2 && e1 >= s2;
>>> -}
>>>    
>>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2) -{
>>> -	return s1 <= s2 && e1 >= e2;
>>> -}
>>> -
>>> -/**
>>> - * drm_buddy_alloc_range - allocate range
>>> - *
>>> - * @mm: DRM buddy manager to allocate from
>>> - * @blocks: output list head to add allocated blocks
>>> - * @start: start of the allowed range for this block
>>> - * @size: size of the allocation
>>> - *
>>> - * Intended for pre-allocating portions of the address space, for example to
>>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>>> - * here is that drm_buddy_alloc() is still the main vehicle for
>>> - * allocations, so if that's not the case then the drm_mm range allocator is
>>> - * probably a much better fit, and so you should probably go use that instead.
>>> - *
>>> - * Note that it's safe to chain together multiple alloc_ranges
>>> - * with the same blocks list
>>> - *
>>> - * Returns:
>>> - * 0 on success, error code on failure.
>>> - */
>>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>> -			  struct list_head *blocks,
>>> -			  u64 start, u64 size)
>>> +static int __alloc_range(struct drm_buddy_mm *mm,
>>> +			 struct list_head *dfs,
>>> +			 u64 start, u64 size,
>>> +			 struct list_head *blocks)
>>>    {
>>>    	struct drm_buddy_block *block;
>>>    	struct drm_buddy_block *buddy;
>>> -	LIST_HEAD(allocated);
>>> -	LIST_HEAD(dfs);
>>>    	u64 end;
>>>    	int err;
>>> -	int i;
>>> -
>>> -	if (size < mm->chunk_size)
>>> -		return -EINVAL;
>>> -
>>> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
>>> -		return -EINVAL;
>>> -
>>> -	if (range_overflows(start, size, mm->size))
>>> -		return -EINVAL;
>>> -
>>> -	for (i = 0; i < mm->n_roots; ++i)
>>> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>>    
>>>    	end = start + size - 1;
>>>    
>>> @@ -397,7 +421,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>>    		u64 block_start;
>>>    		u64 block_end;
>>>    
>>> -		block = list_first_entry_or_null(&dfs,
>>> +		block = list_first_entry_or_null(dfs,
>>>    						 struct drm_buddy_block,
>>>    						 tmp_link);
>>>    		if (!block)
>>> @@ -424,7 +448,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>>    
>>>    			mark_allocated(block);
>>>    			mm->avail -= drm_buddy_block_size(mm, block);
>>> -			list_add_tail(&block->link, &allocated);
>>> +			list_add_tail(&block->link, blocks);
>>>    			continue;
>>>    		}
>>>    
>>> @@ -434,11 +458,10 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>>    				goto err_undo;
>>>    		}
>>>    
>>> -		list_add(&block->right->tmp_link, &dfs);
>>> -		list_add(&block->left->tmp_link, &dfs);
>>> +		list_add(&block->right->tmp_link, dfs);
>>> +		list_add(&block->left->tmp_link, dfs);
>>>    	} while (1);
>>>    
>>> -	list_splice_tail(&allocated, blocks);
>>>    	return 0;
>>>    
>>>    err_undo:
>>> @@ -453,11 +476,144 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>>    	     drm_buddy_block_is_free(buddy)))
>>>    		__drm_buddy_free(mm, block);
>>>    
>>> +err_free:
>>> +	drm_buddy_free_list(mm, blocks);
>>> +	return err;
>>> +}
>>> +
>>> +/**
>>> + * __drm_buddy_alloc_range - actual range allocation
>>> + *
>>> + * @mm: DRM buddy manager to allocate from
>>> + * @start: start of the allowed range for this block
>>> + * @size: size of the allocation
>>> + * @blocks: output list head to add allocated blocks
>>> + *
>>> + * Intended for pre-allocating portions of the address space, for
>>> +example to
>>> + * reserve a block for the initial framebuffer or similar
>>> + *
>>> + * Note that it's safe to chain together multiple alloc_ranges
>>> + * with the same blocks list
>>> + *
>>> + * Returns:
>>> + * 0 on success, error code on failure.
>>> + */
>>> +static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>> +				   u64 start,
>>> +				   u64 size,
>>> +				   struct list_head *blocks)
>>> +{
>>> +	LIST_HEAD(dfs);
>>> +	int i;
>>> +
>>> +	for (i = 0; i < mm->n_roots; ++i)
>>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>> +
>>> +	return __alloc_range(mm, &dfs, start, size, blocks); }
>>> +
>>> +/**
>>> + * drm_buddy_alloc - allocate power-of-two blocks
>>> + *
>>> + * @mm: DRM buddy manager to allocate from
>>> + * @start: start of the allowed range for this block
>>> + * @end: end of the allowed range for this block
>>> + * @size: size of the allocation
>>> + * @min_page_size: alignment of the allocation
>>> + * @blocks: output list head to add allocated blocks
>>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>> + *
>>> + * alloc_range_bias() called on range limitations, which traverses
>>> + * the tree and returns the desired block.
>>> + *
>>> + * alloc_from_freelist() called when *no* range restrictions
>>> + * are enforced, which picks the block from the freelist.
>>> + *
>>> + * blocks are allocated in order, the order value here translates to:
>>> + *
>>> + * 0 = 2^0 * mm->chunk_size
>>> + * 1 = 2^1 * mm->chunk_size
>>> + * 2 = 2^2 * mm->chunk_size
>>> + *
>>> + * Returns:
>>> + * 0 on success, error code on failure.
>>> + */
>>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>> +		    u64 start, u64 end, u64 size,
>>> +		    u64 min_page_size,
>>> +		    struct list_head *blocks,
>>> +		    unsigned long flags)
>>> +{
>>> +	struct drm_buddy_block *block = NULL;
>>> +	unsigned int min_order, order;
>>> +	unsigned long pages;
>>> +	LIST_HEAD(allocated);
>>> +	int err;
>>> +
>>> +	if (size < mm->chunk_size)
>>> +		return -EINVAL;
>>> +
>>> +	if (min_page_size < mm->chunk_size)
>>> +		return -EINVAL;
>>> +
>>> +	if (!is_power_of_2(min_page_size))
>>> +		return -EINVAL;
>>> +
>>> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>>> +		return -EINVAL;
>>> +
>>> +	if (check_range_overflow(start, end, size, mm->size))
>>> +		return -EINVAL;
>>> +
>>> +	/* Actual range allocation */
>>> +	if (start + size == end)
>>> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
>>> +
>>> +	pages = size >> ilog2(mm->chunk_size);
>>> +	order = fls(pages) - 1;
>>> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>> +
>>> +	do {
>>> +		order = min(order, (unsigned int)fls(pages) - 1);
>>> +		BUG_ON(order > mm->max_order);
>>> +		BUG_ON(order < min_order);
>>> +
>>> +		do {
>>> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>> +				/* Allocate traversing within the range */
>>> +				block = alloc_range_bias(mm, start, end, order);
>>> +			else
>>> +				/* Allocate from freelist */
>>> +				block = alloc_from_freelist(mm, order, flags);
>>> +
>>> +			if (!IS_ERR(block))
>>> +				break;
>>> +
>>> +			if (order-- == min_order) {
>>> +				err = -ENOSPC;
>>> +				goto err_free;
>>> +			}
>>> +		} while (1);
>>> +
>>> +		mark_allocated(block);
>>> +		mm->avail -= drm_buddy_block_size(mm, block);
>>> +		kmemleak_update_trace(block);
>>> +		list_add_tail(&block->link, &allocated);
>>> +
>>> +		pages -= BIT(order);
>>> +
>>> +		if (!pages)
>>> +			break;
>>> +	} while (1);
>>> +
>>> +	list_splice_tail(&allocated, blocks);
>>> +	return 0;
>>> +
>>>    err_free:
>>>    	drm_buddy_free_list(mm, &allocated);
>>>    	return err;
>>>    }
>>> -EXPORT_SYMBOL(drm_buddy_alloc_range);
>>> +EXPORT_SYMBOL(drm_buddy_alloc);
>>>    
>>>    /**
>>>     * drm_buddy_block_print - print block information diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>> index c4b70cb8c248..7621d42155e6 100644
>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>    	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>    	struct i915_ttm_buddy_resource *bman_res;
>>>    	struct drm_buddy_mm *mm = &bman->mm;
>>> -	unsigned long n_pages;
>>> -	unsigned int min_order;
>>> +	unsigned long n_pages, lpfn;
>>>    	u64 min_page_size;
>>>    	u64 size;
>>>    	int err;
>>>    
>>> -	GEM_BUG_ON(place->fpfn || place->lpfn);
>>> +	lpfn = place->lpfn;
>>> +	if (!lpfn)
>>> +		lpfn = man->size;
>>>    
>>>    	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>>    	if (!bman_res)
>>> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>    	INIT_LIST_HEAD(&bman_res->blocks);
>>>    	bman_res->mm = mm;
>>>    
>>> +	if (place->fpfn || lpfn != man->size)
>>> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>> +
>>>    	GEM_BUG_ON(!bman_res->base.num_pages);
>>>    	size = bman_res->base.num_pages << PAGE_SHIFT;
>>>    
>>> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>    		min_page_size = bo->page_alignment << PAGE_SHIFT;
>>>    
>>>    	GEM_BUG_ON(min_page_size < mm->chunk_size);
>>> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>>> +
>>>    	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> +		unsigned long pages;
>>> +
>>>    		size = roundup_pow_of_two(size);
>>> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
>>> +		min_page_size = size;
>>> +
>>> +		pages = size >> ilog2(mm->chunk_size);
>>> +		if (pages > lpfn)
>>> +			lpfn = pages;
>>>    	}
>>>    
>>>    	if (size > mm->size) {
>>> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>>    
>>>    	n_pages = size >> ilog2(mm->chunk_size);
>>>    
>>> -	do {
>>> -		struct drm_buddy_block *block;
>>> -		unsigned int order;
>>> -
>>> -		order = fls(n_pages) - 1;
>>> -		GEM_BUG_ON(order > mm->max_order);
>>> -		GEM_BUG_ON(order < min_order);
>>> -
>>> -		do {
>>> -			mutex_lock(&bman->lock);
>>> -			block = drm_buddy_alloc(mm, order);
>>> -			mutex_unlock(&bman->lock);
>>> -			if (!IS_ERR(block))
>>> -				break;
>>> -
>>> -			if (order-- == min_order) {
>>> -				err = -ENOSPC;
>>> -				goto err_free_blocks;
>>> -			}
>>> -		} while (1);
>>> -
>>> -		n_pages -= BIT(order);
>>> -
>>> -		list_add_tail(&block->link, &bman_res->blocks);
>>> -
>>> -		if (!n_pages)
>>> -			break;
>>> -	} while (1);
>>> +	mutex_lock(&bman->lock);
>>> +	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
>>> +			(u64)place->lpfn << PAGE_SHIFT,
>>> +			(u64)n_pages << PAGE_SHIFT,
>>> +			 min_page_size,
>>> +			 &bman_res->blocks,
>>> +			 bman_res->flags);
>>> +	mutex_unlock(&bman->lock);
>>> +	if (unlikely(err))
>>> +		goto err_free_blocks;
>>>    
>>>    	*res = &bman_res->base;
>>>    	return 0;
>>> @@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,  {
>>>    	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>>    	struct drm_buddy_mm *mm = &bman->mm;
>>> +	unsigned long flags = 0;
>>>    	int ret;
>>>    
>>> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>> +
>>>    	mutex_lock(&bman->lock);
>>> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>>> +	ret = drm_buddy_alloc(mm, start,
>>> +			start + size,
>>> +			size, mm->chunk_size,
>>> +			&bman->reserved,
>>> +			flags);
>>>    	mutex_unlock(&bman->lock);
>>>    
>>>    	return ret;
>>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>> index fa644b512c2e..5ba490875f66 100644
>>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>>> @@ -20,6 +20,7 @@ struct drm_buddy_mm;
>>>     *
>>>     * @base: struct ttm_resource base class we extend
>>>     * @blocks: the list of struct i915_buddy_block for this resource/allocation
>>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>>     * @mm: the struct i915_buddy_mm for this resource
>>>     *
>>>     * Extends the struct ttm_resource to manage an address space allocation with @@ -28,6 +29,7 @@ struct drm_buddy_mm;  struct i915_ttm_buddy_resource {
>>>    	struct ttm_resource base;
>>>    	struct list_head blocks;
>>> +	unsigned long flags;
>>>    	struct drm_buddy_mm *mm;
>>>    };
>>>    
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h index f9ff48a3f3a6..221de702e909 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -13,15 +13,22 @@
>>>    
>>>    #include <drm/drm_print.h>
>>>    
>>> -#define range_overflows(start, size, max) ({ \
>>> +#define check_range_overflow(start, end, size, max) ({ \
>>>    	typeof(start) start__ = (start); \
>>> +	typeof(end) end__ = (end);\
>>>    	typeof(size) size__ = (size); \
>>>    	typeof(max) max__ = (max); \
>>>    	(void)(&start__ == &size__); \
>>>    	(void)(&start__ == &max__); \
>>> -	start__ >= max__ || size__ > max__ - start__; \
>>> +	(void)(&start__ == &end__); \
>>> +	(void)(&end__ == &size__); \
>>> +	(void)(&end__ == &max__); \
>>> +	start__ >= max__ || end__ > max__ || \
>>> +	size__ > end__ - start__; \
>>>    })
>>>    
>>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>>> +
>>>    struct drm_buddy_block {
>>>    #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)  #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10) @@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>>>    
>>>    void drm_buddy_fini(struct drm_buddy_mm *mm);
>>>    
>>> -struct drm_buddy_block *
>>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
>>> -
>>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>>> -			  struct list_head *blocks,
>>> -			  u64 start, u64 size);
>>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>>> +		    u64 start, u64 end, u64 size,
>>> +		    u64 min_page_size,
>>> +		    struct list_head *blocks,
>>> +		    unsigned long flags);
>>>    
>>>    void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>>>    
>>> --
>>> 2.25.1
>>>
