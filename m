Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25766444876
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 19:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605CF73FD1;
	Wed,  3 Nov 2021 18:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5D673FCE;
 Wed,  3 Nov 2021 18:42:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="229020571"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="229020571"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 11:42:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="729738581"
Received: from badunne-mobl5.ger.corp.intel.com (HELO [10.252.16.100])
 ([10.252.16.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 11:42:03 -0700
Message-ID: <781f4204-ec6b-7094-a96b-0f4c196ffaeb@intel.com>
Date: Wed, 3 Nov 2021 18:41:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/8] drm: improve drm_buddy_alloc function
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-8-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211025130033.1547667-8-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2021 14:00, Arunpravin wrote:
> - Make drm_buddy_alloc a single function to handle
>    range allocation and non-range allocation demands
> 
> - Implemented a new function alloc_range() which allocates
>    the requested power-of-two block comply with range limitations
> 
> - Moved order computation and memory alignment logic from
>    i915 driver to drm buddy
> 
> V2:
> merged below changes to keep the build unbroken
> - drm_buddy_alloc_range() becomes obsolete and may be removed
> - enable ttm range allocation (fpfn / lpfn) support in i915 driver
> - apply enhanced drm_buddy_alloc() function to i915 driver
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c                   | 265 +++++++++++-------
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++---
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>   include/drm/drm_buddy.h                       |  22 +-
>   4 files changed, 207 insertions(+), 149 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 39eb1d224bec..406e3d521903 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -274,63 +274,6 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
>   }
>   EXPORT_SYMBOL(drm_buddy_free_list);
>   
> -/**
> - * drm_buddy_alloc - allocate power-of-two blocks
> - *
> - * @mm: DRM buddy manager to allocate from
> - * @order: size of the allocation
> - *
> - * The order value here translates to:
> - *
> - * 0 = 2^0 * mm->chunk_size
> - * 1 = 2^1 * mm->chunk_size
> - * 2 = 2^2 * mm->chunk_size
> - *
> - * Returns:
> - * allocated ptr to the &drm_buddy_block on success
> - */
> -struct drm_buddy_block *
> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
> -{
> -	struct drm_buddy_block *block = NULL;
> -	unsigned int i;
> -	int err;
> -
> -	for (i = order; i <= mm->max_order; ++i) {
> -		block = list_first_entry_or_null(&mm->free_list[i],
> -						 struct drm_buddy_block,
> -						 link);
> -		if (block)
> -			break;
> -	}
> -
> -	if (!block)
> -		return ERR_PTR(-ENOSPC);
> -
> -	BUG_ON(!drm_buddy_block_is_free(block));
> -
> -	while (i != order) {
> -		err = split_block(mm, block);
> -		if (unlikely(err))
> -			goto out_free;
> -
> -		/* Go low */
> -		block = block->left;
> -		i--;
> -	}
> -
> -	mark_allocated(block);
> -	mm->avail -= drm_buddy_block_size(mm, block);
> -	kmemleak_update_trace(block);
> -	return block;
> -
> -out_free:
> -	if (i != order)
> -		__drm_buddy_free(mm, block);
> -	return ERR_PTR(err);
> -}
> -EXPORT_SYMBOL(drm_buddy_alloc);
> -
>   static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>   {
>   	return s1 <= e2 && e1 >= s2;
> @@ -341,52 +284,22 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   	return s1 <= s2 && e1 >= e2;
>   }
>   
> -/**
> - * drm_buddy_alloc_range - allocate range
> - *
> - * @mm: DRM buddy manager to allocate from
> - * @blocks: output list head to add allocated blocks
> - * @start: start of the allowed range for this block
> - * @size: size of the allocation
> - *
> - * Intended for pre-allocating portions of the address space, for example to
> - * reserve a block for the initial framebuffer or similar, hence the expectation
> - * here is that drm_buddy_alloc() is still the main vehicle for
> - * allocations, so if that's not the case then the drm_mm range allocator is
> - * probably a much better fit, and so you should probably go use that instead.
> - *
> - * Note that it's safe to chain together multiple alloc_ranges
> - * with the same blocks list
> - *
> - * Returns:
> - * 0 on success, error code on failure.
> - */
> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size)
> +static struct drm_buddy_block *
> +alloc_range(struct drm_buddy_mm *mm,
> +	    u64 start, u64 end,
> +	    unsigned int order)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
> -	LIST_HEAD(allocated);
>   	LIST_HEAD(dfs);
> -	u64 end;
>   	int err;
>   	int i;
>   
> -	if (size < mm->chunk_size)
> -		return -EINVAL;
> -
> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
> -		return -EINVAL;
> -
> -	if (range_overflows(start, size, mm->size))
> -		return -EINVAL;
> +	end = end - 1;
>   
>   	for (i = 0; i < mm->n_roots; ++i)
>   		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>   
> -	end = start + size - 1;
> -
>   	do {
>   		u64 block_start;
>   		u64 block_end;
> @@ -394,31 +307,32 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>   		block = list_first_entry_or_null(&dfs,
>   						 struct drm_buddy_block,
>   						 tmp_link);
> +

No need for the newline.

>   		if (!block)
>   			break;
>   
>   		list_del(&block->tmp_link);
>   
> +		if (drm_buddy_block_order(block) < order)
> +			continue;
> +
>   		block_start = drm_buddy_block_offset(block);
>   		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>   
>   		if (!overlaps(start, end, block_start, block_end))
>   			continue;
>   
> -		if (drm_buddy_block_is_allocated(block)) {
> -			err = -ENOSPC;
> -			goto err_free;
> -		}
> +		if (drm_buddy_block_is_allocated(block))
> +			continue;
>   
> -		if (contains(start, end, block_start, block_end)) {
> -			if (!drm_buddy_block_is_free(block)) {
> -				err = -ENOSPC;
> -				goto err_free;
> -			}
> +		if (contains(start, end, block_start, block_end)
> +				&& order == drm_buddy_block_order(block)) {

Alignment looks off, also && should be on the line above.

> +			/*
> +			 * Find the free block within the range.
> +			 */
> +			if (drm_buddy_block_is_free(block))
> +				return block;

Would it make sense to keep searching here, rather than restarting the 
search from scratch every time? Would it work if we pass in the total 
size and min order?

I take it this will now also be used for allocating CPU mappable memory 
using an end bias?

>   
> -			mark_allocated(block);
> -			mm->avail -= drm_buddy_block_size(mm, block);
> -			list_add_tail(&block->link, &allocated);
>   			continue;
>   		}
>   
> @@ -428,12 +342,11 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>   				goto err_undo;
>   		}
>   
> -		list_add(&block->right->tmp_link, &dfs);
>   		list_add(&block->left->tmp_link, &dfs);
> +		list_add(&block->right->tmp_link, &dfs);

So this is now top-down? Do we need this? Also I guess this now changes 
the ordering of the allocated blocks? Ideally they would appear in 
order, starting from the lowest address(at least for the actual range 
allocation, and not just the bias thing). I think some places might only 
check the first block to get the device address, where underneath we 
have a contiguous allocation.


>   	} while (1);
>   
> -	list_splice_tail(&allocated, blocks);
> -	return 0;
> +	return ERR_PTR(-ENOSPC);
>   
>   err_undo:
>   	/*
> @@ -446,12 +359,148 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>   	    (drm_buddy_block_is_free(block) &&
>   	     drm_buddy_block_is_free(buddy)))
>   		__drm_buddy_free(mm, block);
> +	return ERR_PTR(err);
> +}
> +
> +static struct drm_buddy_block *
> +alloc_from_freelist(struct drm_buddy_mm *mm,
> +		    unsigned int order,
> +		    unsigned long flags)
> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int i;
> +	int err;
> +
> +	for (i = order; i <= mm->max_order; ++i) {
> +		if (!list_empty(&mm->free_list[i])) {

list_first_entry_or_null already handles that.

> +			block = list_first_entry_or_null(&mm->free_list[i],
> +							 struct drm_buddy_block,
> +							 link);
> +
> +			if (block)
> +				break;
> +		}
> +	}
> +
> +	if (!block)
> +		return ERR_PTR(-ENOSPC);
> +
> +	BUG_ON(!drm_buddy_block_is_free(block));
> +
> +	while (i != order) {
> +		err = split_block(mm, block);
> +

No need for the newline.

> +		if (unlikely(err))
> +			goto err_undo;
> +
> +		block = block->right;
> +		i--;
> +	}
> +	return block;
> +
> +err_undo:
> +	if (i != order)
> +		__drm_buddy_free(mm, block);
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * drm_buddy_alloc - allocate power-of-two blocks
> + *
> + * @mm: DRM buddy manager to allocate from
> + * @start: start of the allowed range for this block
> + * @end: end of the allowed range for this block
> + * @size: size of the allocation
> + * @min_page_size: alignment of the allocation
> + * @blocks: output list head to add allocated blocks
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
> + *
> + * alloc_range() called on range limitations, which traverses
> + * the tree and returns the desired block.
> + *
> + * alloc_from_freelist() called when *no* range restrictions
> + * are enforced, which picks the block from the freelist.
> + *
> + * blocks are allocated in order, the order value here translates to:
> + *
> + * 0 = 2^0 * mm->chunk_size
> + * 1 = 2^1 * mm->chunk_size
> + * 2 = 2^2 * mm->chunk_size
> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    u64 min_page_size,
> +		    struct list_head *blocks,
> +		    unsigned long flags)

Do we need to validate the flags somewhere?

> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int min_order, order;
> +	unsigned long pages;
> +	LIST_HEAD(allocated);
> +	int err;
> +
> +	if (size < mm->chunk_size)
> +		return -EINVAL;

Also:

if (min_page_size < mm->chunk_size)
       return -EINVAL;

if (!is_power_of_2_u64(min_page_size))
       return -EINVAL;

?

> +
> +	if (!IS_ALIGNED(start, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(end, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(size, mm->chunk_size))
> +		return -EINVAL;

Maybe:

if (!IS_ALIGNED(start | end | size, mm->chunk_size))
         return -EINVAL;

?

> +
> +	if (check_range_overflow(start, end, size, mm->size))
> +		return -EINVAL;
> +
> +	pages = size >> ilog2(mm->chunk_size);
> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
> +	do {
> +		order = fls(pages) - 1;

Maybe:

order = min(order, fls(pages) - 1);

We shouldn't need to reset the order here all the way back to the number 
of pages, I think. We are still holding the lock, and so we still get 
the same answer as before, assuming we needed to decrement the order 
below. Otherwise that might be slightly wasteful AFAIK.

> +		BUG_ON(order > mm->max_order);
> +		BUG_ON(order < min_order);
> +
> +		do {
> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> +				/* Allocate traversing within the range */
> +				block = alloc_range(mm, start, end, order);

Ok, so blocks might be in a random order, which is a slight concern for 
actual range allocations(not the bias thing). Can we somehow make 
alloc_range just do the old behaviour when end - start == size? Not the 
end of the world though if not.

> +			else
> +				/* Allocate from freelist */
> +				block = alloc_from_freelist(mm, order, flags);
> +
> +			if (!IS_ERR(block))
> +				break;
> +
> +			if (order-- == min_order) {
> +				err = -ENOSPC;
> +				goto err_free;
> +			}
> +		} while (1);
> +
> +		mark_allocated(block);
> +		mm->avail -= drm_buddy_block_size(mm, block);
> +		kmemleak_update_trace(block);
> +		list_add_tail(&block->link, &allocated);
> +
> +		pages -= BIT(order);
> +
> +		if (!pages)
> +			break;
> +	} while (1);
> +
> +	list_splice_tail(&allocated, blocks);
> +	return 0;
>   
>   err_free:
>   	drm_buddy_free_list(mm, &allocated);
>   	return err;
>   }
> -EXPORT_SYMBOL(drm_buddy_alloc_range);
> +EXPORT_SYMBOL(drm_buddy_alloc);
>   
>   /**
>    * drm_buddy_block_print - print block information
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index c4b70cb8c248..75197ba6e40d 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct i915_ttm_buddy_resource *bman_res;
>   	struct drm_buddy_mm *mm = &bman->mm;
> -	unsigned long n_pages;
> -	unsigned int min_order;
> +	unsigned long n_pages, lpfn;
>   	u64 min_page_size;
>   	u64 size;
>   	int err;
>   
> -	GEM_BUG_ON(place->fpfn || place->lpfn);
> +	lpfn = place->lpfn;
> +	if (!lpfn)
> +		lpfn = man->size;
>   
>   	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>   	if (!bman_res)
> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	INIT_LIST_HEAD(&bman_res->blocks);
>   	bman_res->mm = mm;
>   
> +	if (place->fpfn || lpfn != man->size)
> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>   	GEM_BUG_ON(!bman_res->base.num_pages);
>   	size = bman_res->base.num_pages << PAGE_SHIFT;
>   
> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   		min_page_size = bo->page_alignment << PAGE_SHIFT;
>   
>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
>   		size = roundup_pow_of_two(size);
> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
> +		min_page_size = size;
> +
> +		pages = size >> ilog2(mm->chunk_size);
> +		if (pages > lpfn)
> +			lpfn = pages;
>   	}
>   
>   	if (size > mm->size) {
> @@ -73,34 +83,17 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   
>   	n_pages = size >> ilog2(mm->chunk_size);
>   
> -	do {
> -		struct drm_buddy_block *block;
> -		unsigned int order;
> -
> -		order = fls(n_pages) - 1;
> -		GEM_BUG_ON(order > mm->max_order);
> -		GEM_BUG_ON(order < min_order);
> -
> -		do {
> -			mutex_lock(&bman->lock);
> -			block = drm_buddy_alloc(mm, order);
> -			mutex_unlock(&bman->lock);
> -			if (!IS_ERR(block))
> -				break;
> -
> -			if (order-- == min_order) {
> -				err = -ENOSPC;
> -				goto err_free_blocks;
> -			}
> -		} while (1);
> -
> -		n_pages -= BIT(order);
> -
> -		list_add_tail(&block->link, &bman_res->blocks);
> +	mutex_lock(&bman->lock);
> +	err = drm_buddy_alloc(mm, (uint64_t)place->fpfn << PAGE_SHIFT,
> +				  (uint64_t)place->lpfn << PAGE_SHIFT,
> +				  (uint64_t)n_pages << PAGE_SHIFT,

s/uint64_t/u64/

Some other places also. AFAIK that is preferred in the kernel, outside 
of maybe uapi headers.

> +				   min_page_size,
> +				   &bman_res->blocks,
> +				   bman_res->flags);
> +	mutex_unlock(&bman->lock);
>   
> -		if (!n_pages)
> -			break;
> -	} while (1);
> +	if (unlikely(err))
> +		goto err_free_blocks;
>   
>   	*res = &bman_res->base;
>   	return 0;
> @@ -266,10 +259,18 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>   {
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   	struct drm_buddy_mm *mm = &bman->mm;
> +	unsigned long flags = 0;
> +	u64 min_size;
>   	int ret;
>   
> +	min_size = size;
> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>   	mutex_lock(&bman->lock);
> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
> +	ret = drm_buddy_alloc(mm, start, start + size,
> +				  size, min_size,
> +				  &bman->reserved,
> +				  flags);
>   	mutex_unlock(&bman->lock);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index fa644b512c2e..5ba490875f66 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -20,6 +20,7 @@ struct drm_buddy_mm;
>    *
>    * @base: struct ttm_resource base class we extend
>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>    * @mm: the struct i915_buddy_mm for this resource
>    *
>    * Extends the struct ttm_resource to manage an address space allocation with
> @@ -28,6 +29,7 @@ struct drm_buddy_mm;
>   struct i915_ttm_buddy_resource {
>   	struct ttm_resource base;
>   	struct list_head blocks;
> +	unsigned long flags;
>   	struct drm_buddy_mm *mm;
>   };
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 5ce3fc702f80..c7bb5509a7ad 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -13,15 +13,22 @@
>   
>   #include <drm/drm_print.h>
>   
> -#define range_overflows(start, size, max) ({ \
> +#define check_range_overflow(start, end, size, max) ({ \
>   	typeof(start) start__ = (start); \
> +	typeof(end) end__ = (end);\
>   	typeof(size) size__ = (size); \
>   	typeof(max) max__ = (max); \
>   	(void)(&start__ == &size__); \
>   	(void)(&start__ == &max__); \
> -	start__ >= max__ || size__ > max__ - start__; \
> +	(void)(&start__ == &end__); \
> +	(void)(&end__ == &size__); \
> +	(void)(&end__ == &max__); \
> +	start__ >= max__ || end__ > max__ \
> +		|| size__ > end__ - start__; \
>   })
>   
> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)

Would it make sense to make this an enum or something?

enum drm_buddy_alloc_mode {
     DRM_BUDDY_ALLOC_FIRST = 0,
     DRM_BUDDY_ALLOC_TOPDOWN,
     DRM_BUDDY_ALLOC_RANGE,
};

That way can more easily see where this is actually used, rather than 
having an opaque 'unsigned long flags'? Or are we expecting to combine 
allocation strategies or something? Anyway, just a thought.

> +
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> @@ -131,12 +138,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>   
>   void drm_buddy_fini(struct drm_buddy_mm *mm);
>   
> -struct drm_buddy_block *
> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
> -
> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size);
> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
> +		    u64 start, u64 end, u64 size,
> +		    u64 min_page_size,
> +		    struct list_head *blocks,
> +		    unsigned long flags);
>   
>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>   
> 
