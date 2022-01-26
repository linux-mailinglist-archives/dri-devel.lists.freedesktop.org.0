Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010BD49D15B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 19:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0819510E5A7;
	Wed, 26 Jan 2022 18:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40D110E5C0;
 Wed, 26 Jan 2022 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643220190; x=1674756190;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Xz7F0VZqry6fzPFUZ6cSkRN+f2hiB88wPKMWIZP6Pig=;
 b=aGWWnsFLyoVMYWNBxrCMz3FccCMdrg4zUZCykDE/TiA4Mv8fVP20GL/d
 Upb6XOn3x/Faj57S6S/MzsbCf8uflfcGc/bvoCeHMApkFxsZlkWzwAHb4
 DIlag7E/Pur/CmfLJBSflnej+HKmKSnDOcF772Hh7BHYky4odY+mYHNDY
 XeVer7p0ea/0IljLo/rTQEdgKtfIqLOOIBhK3vq3JbSFEXRrPWfAc2HLq
 3MRZRzJDYtCmvtgW3eec4A+nrCFdwWNHorFvSuaRLco1hczaDJlko+2Pk
 YE7M8zY9S1042Wpv8+4Av9/S2caWghrK6o/qP6u070cdkvTT5hTI9zaRt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="233987420"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="233987420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 10:03:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="535276103"
Received: from nbasu-mobl.ger.corp.intel.com (HELO localhost) ([10.252.16.197])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 10:03:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 01/20] drm: improve drm_buddy_alloc function
In-Reply-To: <20220126152155.3070602-2-matthew.auld@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-2-matthew.auld@intel.com>
Date: Wed, 26 Jan 2022 20:03:04 +0200
Message-ID: <87r18uxtlz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jan 2022, Matthew Auld <matthew.auld@intel.com> wrote:
> From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>
> - Make drm_buddy_alloc a single function to handle
>   range allocation and non-range allocation demands
>
> - Implemented a new function alloc_range() which allocates
>   the requested power-of-two block comply with range limitations
>
> - Moved order computation and memory alignment logic from
>   i915 driver to drm buddy
>
> v2:
>   merged below changes to keep the build unbroken
>    - drm_buddy_alloc_range() becomes obsolete and may be removed
>    - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>    - apply enhanced drm_buddy_alloc() function to i915 driver
>
> v3(Matthew Auld):
>   - Fix alignment issues and remove unnecessary list_empty check
>   - add more validation checks for input arguments
>   - make alloc_range() block allocations as bottom-up
>   - optimize order computation logic
>   - replace uint64_t with u64, which is preferred in the kernel
>
> v4(Matthew Auld):
>   - keep drm_buddy_alloc_range() function implementation for generic
>     actual range allocations
>   - keep alloc_range() implementation for end bias allocations
>
> v5(Matthew Auld):
>   - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>     as place->lpfn will currently always be zero for i915
>
> v6(Matthew Auld):
>   - fixup potential uaf - If we are unlucky and can't allocate
>     enough memory when splitting blocks, where we temporarily
>     end up with the given block and its buddy on the respective
>     free list, then we need to ensure we delete both blocks,
>     and no just the buddy, before potentially freeing them
>
>   - fix warnings reported by kernel test robot <lkp@intel.com>
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/drm_buddy.c                   | 326 +++++++++++++-----
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>  include/drm/drm_buddy.h                       |  22 +-
>  4 files changed, 293 insertions(+), 124 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index d60878bc9c20..954e31962c74 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -282,23 +282,99 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>  }
>  EXPORT_SYMBOL(drm_buddy_free_list);
>  
> -/**
> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
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
> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
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
> +alloc_range_bias(struct drm_buddy *mm,
> +		 u64 start, u64 end,
> +		 unsigned int order)
> +{
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
> +	LIST_HEAD(dfs);
> +	int err;
> +	int i;
> +
> +	end = end - 1;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		if (drm_buddy_block_order(block) < order)
> +			continue;
> +
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(start, end, block_start, block_end))
> +			continue;
> +
> +		if (drm_buddy_block_is_allocated(block))
> +			continue;
> +
> +		if (contains(start, end, block_start, block_end) &&
> +		    order == drm_buddy_block_order(block)) {
> +			/*
> +			 * Find the free block within the range.
> +			 */
> +			if (drm_buddy_block_is_free(block))
> +				return block;
> +
> +			continue;
> +		}
> +
> +		if (!drm_buddy_block_is_split(block)) {
> +			err = split_block(mm, block);
> +			if (unlikely(err))
> +				goto err_undo;
> +		}
> +
> +		list_add(&block->right->tmp_link, &dfs);
> +		list_add(&block->left->tmp_link, &dfs);
> +	} while (1);
> +
> +	return ERR_PTR(-ENOSPC);
> +
> +err_undo:
> +	/*
> +	 * We really don't want to leave around a bunch of split blocks, since
> +	 * bigger is better, so make sure we merge everything back before we
> +	 * free the allocated blocks.
> +	 */
> +	buddy = get_buddy(block);
> +	if (buddy &&
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy))) {
> +		list_del(&block->link);
> +		__drm_buddy_free(mm, block);
> +	}
> +	return ERR_PTR(err);
> +}
> +
> +static struct drm_buddy_block *
> +alloc_from_freelist(struct drm_buddy *mm,
> +		    unsigned int order,
> +		    unsigned long flags)
>  {
>  	struct drm_buddy_block *block = NULL;
>  	unsigned int i;
> @@ -320,78 +396,30 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>  	while (i != order) {
>  		err = split_block(mm, block);
>  		if (unlikely(err))
> -			goto out_free;
> +			goto err_undo;
>  
> -		/* Go low */
> -		block = block->left;
> +		block = block->right;
>  		i--;
>  	}
> -
> -	mark_allocated(block);
> -	mm->avail -= drm_buddy_block_size(mm, block);
> -	kmemleak_update_trace(block);
>  	return block;
>  
> -out_free:
> -	if (i != order)
> +err_undo:
> +	if (i != order) {
> +		list_del(&block->link);
>  		__drm_buddy_free(mm, block);
> +	}
>  	return ERR_PTR(err);
>  }
> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> -
> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> -{
> -	return s1 <= e2 && e1 >= s2;
> -}
>  
> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> -{
> -	return s1 <= s2 && e1 >= e2;
> -}
> -
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
> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
> - * allocations, so if that's not the case then the drm_mm range allocator is
> - * probably a much better fit, and so you should probably go use that instead.
> - *
> - * Note that it's safe to chain together multiple alloc_ranges
> - * with the same blocks list
> - *
> - * Returns:
> - * 0 on success, error code on failure.
> - */
> -int drm_buddy_alloc_range(struct drm_buddy *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size)
> +static int __alloc_range(struct drm_buddy *mm,
> +			 struct list_head *dfs,
> +			 u64 start, u64 size,
> +			 struct list_head *blocks)
>  {
>  	struct drm_buddy_block *block;
>  	struct drm_buddy_block *buddy;
> -	LIST_HEAD(allocated);
> -	LIST_HEAD(dfs);
>  	u64 end;
>  	int err;
> -	int i;
> -
> -	if (size < mm->chunk_size)
> -		return -EINVAL;
> -
> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
> -		return -EINVAL;
> -
> -	if (range_overflows(start, size, mm->size))
> -		return -EINVAL;
> -
> -	for (i = 0; i < mm->n_roots; ++i)
> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>  
>  	end = start + size - 1;
>  
> @@ -399,7 +427,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>  		u64 block_start;
>  		u64 block_end;
>  
> -		block = list_first_entry_or_null(&dfs,
> +		block = list_first_entry_or_null(dfs,
>  						 struct drm_buddy_block,
>  						 tmp_link);
>  		if (!block)
> @@ -426,7 +454,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>  
>  			mark_allocated(block);
>  			mm->avail -= drm_buddy_block_size(mm, block);
> -			list_add_tail(&block->link, &allocated);
> +			list_add_tail(&block->link, blocks);
>  			continue;
>  		}
>  
> @@ -436,11 +464,10 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>  				goto err_undo;
>  		}
>  
> -		list_add(&block->right->tmp_link, &dfs);
> -		list_add(&block->left->tmp_link, &dfs);
> +		list_add(&block->right->tmp_link, dfs);
> +		list_add(&block->left->tmp_link, dfs);
>  	} while (1);
>  
> -	list_splice_tail(&allocated, blocks);
>  	return 0;
>  
>  err_undo:
> @@ -452,14 +479,149 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>  	buddy = get_buddy(block);
>  	if (buddy &&
>  	    (drm_buddy_block_is_free(block) &&
> -	     drm_buddy_block_is_free(buddy)))
> +	     drm_buddy_block_is_free(buddy))) {
> +		list_del(&block->link);
>  		__drm_buddy_free(mm, block);
> +	}
> +
> +err_free:
> +	drm_buddy_free_list(mm, blocks);
> +	return err;
> +}
> +
> +/**
> + * __drm_buddy_alloc_range - actual range allocation
> + *
> + * @mm: DRM buddy manager to allocate from
> + * @start: start of the allowed range for this block
> + * @size: size of the allocation
> + * @blocks: output list head to add allocated blocks
> + *
> + * Intended for pre-allocating portions of the address space, for example to
> + * reserve a block for the initial framebuffer or similar
> + *
> + * Note that it's safe to chain together multiple alloc_ranges
> + * with the same blocks list
> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
> +				   u64 start,
> +				   u64 size,
> +				   struct list_head *blocks)
> +{
> +	LIST_HEAD(dfs);
> +	int i;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	return __alloc_range(mm, &dfs, start, size, blocks);
> +}
> +
> +/**
> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
> + *
> + * @mm: DRM buddy manager to allocate from
> + * @start: start of the allowed range for this block
> + * @end: end of the allowed range for this block
> + * @size: size of the allocation
> + * @min_page_size: alignment of the allocation
> + * @blocks: output list head to add allocated blocks
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
> + *
> + * alloc_range_bias() called on range limitations, which traverses
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
> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			   u64 start, u64 end, u64 size,
> +			   u64 min_page_size,
> +			   struct list_head *blocks,
> +			   unsigned long flags)
> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int min_order, order;
> +	unsigned long pages;
> +	LIST_HEAD(allocated);
> +	int err;
> +
> +	if (size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (min_page_size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (!is_power_of_2(min_page_size))
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (check_range_overflow(start, end, size, mm->size))
> +		return -EINVAL;
> +
> +	/* Actual range allocation */
> +	if (start + size == end)
> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
> +
> +	pages = size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
> +	do {
> +		order = min(order, (unsigned int)fls(pages) - 1);
> +		BUG_ON(order > mm->max_order);
> +		BUG_ON(order < min_order);
> +
> +		do {
> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> +				/* Allocate traversing within the range */
> +				block = alloc_range_bias(mm, start, end, order);
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
>  err_free:
>  	drm_buddy_free_list(mm, &allocated);
>  	return err;
>  }
> -EXPORT_SYMBOL(drm_buddy_alloc_range);
> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>  
>  /**
>   * drm_buddy_block_print - print block information
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 6ba314f9836a..1411f4cf1f21 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>  	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>  	struct i915_ttm_buddy_resource *bman_res;
>  	struct drm_buddy *mm = &bman->mm;
> -	unsigned long n_pages;
> -	unsigned int min_order;
> +	unsigned long n_pages, lpfn;
>  	u64 min_page_size;
>  	u64 size;
>  	int err;
>  
> -	GEM_BUG_ON(place->fpfn || place->lpfn);
> +	lpfn = place->lpfn;
> +	if (!lpfn)
> +		lpfn = man->size;
>  
>  	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>  	if (!bman_res)
> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>  	INIT_LIST_HEAD(&bman_res->blocks);
>  	bman_res->mm = mm;
>  
> +	if (place->fpfn || lpfn != man->size)
> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>  	GEM_BUG_ON(!bman_res->base.num_pages);
>  	size = bman_res->base.num_pages << PAGE_SHIFT;
>  
> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>  		min_page_size = bo->page_alignment << PAGE_SHIFT;
>  
>  	GEM_BUG_ON(min_page_size < mm->chunk_size);
> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +
>  	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		unsigned long pages;
> +
>  		size = roundup_pow_of_two(size);
> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
> +		min_page_size = size;
> +
> +		pages = size >> ilog2(mm->chunk_size);
> +		if (pages > lpfn)
> +			lpfn = pages;
>  	}
>  
>  	if (size > mm->size) {
> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>  
>  	n_pages = size >> ilog2(mm->chunk_size);
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
> -			block = drm_buddy_alloc_blocks(mm, order);
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
> -
> -		if (!n_pages)
> -			break;
> -	} while (1);
> +	mutex_lock(&bman->lock);
> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +				    (u64)lpfn << PAGE_SHIFT,
> +				    (u64)n_pages << PAGE_SHIFT,
> +				     min_page_size,
> +				     &bman_res->blocks,
> +				     bman_res->flags);
> +	mutex_unlock(&bman->lock);
> +	if (unlikely(err))
> +		goto err_free_blocks;
>  
>  	*res = &bman_res->base;
>  	return 0;
> @@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>  {
>  	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>  	struct drm_buddy *mm = &bman->mm;
> +	unsigned long flags = 0;
>  	int ret;
>  
> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
>  	mutex_lock(&bman->lock);
> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
> +	ret = drm_buddy_alloc_blocks(mm, start,
> +				     start + size,
> +				     size, mm->chunk_size,
> +				     &bman->reserved,
> +				     flags);
>  	mutex_unlock(&bman->lock);
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> index 312077941411..72c90b432e87 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> @@ -20,6 +20,7 @@ struct drm_buddy;
>   *
>   * @base: struct ttm_resource base class we extend
>   * @blocks: the list of struct i915_buddy_block for this resource/allocation
> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>   * @mm: the struct i915_buddy_mm for this resource
>   *
>   * Extends the struct ttm_resource to manage an address space allocation with
> @@ -28,6 +29,7 @@ struct drm_buddy;
>  struct i915_ttm_buddy_resource {
>  	struct ttm_resource base;
>  	struct list_head blocks;
> +	unsigned long flags;
>  	struct drm_buddy *mm;
>  };
>  
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index f524db152413..865664b90a8a 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -13,15 +13,22 @@
>  
>  #include <drm/drm_print.h>
>  
> -#define range_overflows(start, size, max) ({ \
> +#define check_range_overflow(start, end, size, max) ({ \

Random drive-by comment, why the rename? The old one is understandable,
it's a bool, while "check", to me, implies it might *do* something in
case of overflow.


>  	typeof(start) start__ = (start); \
> +	typeof(end) end__ = (end);\
>  	typeof(size) size__ = (size); \
>  	typeof(max) max__ = (max); \
>  	(void)(&start__ == &size__); \
>  	(void)(&start__ == &max__); \
> -	start__ >= max__ || size__ > max__ - start__; \
> +	(void)(&start__ == &end__); \
> +	(void)(&end__ == &size__); \
> +	(void)(&end__ == &max__); \
> +	start__ >= max__ || end__ > max__ || \
> +	size__ > end__ - start__; \
>  })
>  
> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> +
>  struct drm_buddy_block {
>  #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>  #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> @@ -131,12 +138,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>  
>  void drm_buddy_fini(struct drm_buddy *mm);
>  
> -struct drm_buddy_block *
> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
> -
> -int drm_buddy_alloc_range(struct drm_buddy *mm,
> -			  struct list_head *blocks,
> -			  u64 start, u64 size);
> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> +			   u64 start, u64 end, u64 size,
> +			   u64 min_page_size,
> +			   struct list_head *blocks,
> +			   unsigned long flags);
>  
>  void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);

-- 
Jani Nikula, Intel Open Source Graphics Center
