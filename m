Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44349434710
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 10:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E156E879;
	Wed, 20 Oct 2021 08:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC016E847;
 Wed, 20 Oct 2021 08:38:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="226188503"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="226188503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:38:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="494524838"
Received: from sischoen-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.45.52])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 01:38:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, daniel@ffwll.ch, matthew.auld@intel.com,
 alexander.deucher@amd.com, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [PATCH 02/13] drm: Move and rename i915 buddy source
In-Reply-To: <20211019225409.569355-3-Arunpravin.PaneerSelvam@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
 <20211019225409.569355-3-Arunpravin.PaneerSelvam@amd.com>
Date: Wed, 20 Oct 2021 11:38:26 +0300
Message-ID: <87wnm8nla5.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Oct 2021, Arunpravin <Arunpravin.PaneerSelvam@amd.com> wrote:
> - Move i915_buddy.c to drm root folder
> - Rename "i915" string with "drm" string wherever applicable
> - Rename "I915" string with "DRM" string wherever applicable
> - Fix header file dependencies
> - Fix alignment issues
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  .../drm/{i915/i915_buddy.c => drm_buddy.c}    | 193 +++++++++---------
>  include/drm/drm_buddy.h                       |  10 +
>  2 files changed, 105 insertions(+), 98 deletions(-)
>  rename drivers/gpu/drm/{i915/i915_buddy.c => drm_buddy.c} (58%)
>
> diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/drm_buddy.c
> similarity index 58%
> rename from drivers/gpu/drm/i915/i915_buddy.c
> rename to drivers/gpu/drm/drm_buddy.c
> index 6e2ad68f8f3f..0398706cb7ae 100644
> --- a/drivers/gpu/drm/i915/i915_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -6,21 +6,18 @@
>  #include <linux/kmemleak.h>
>  #include <linux/sizes.h>
>  
> -#include "i915_buddy.h"
> -
> -#include "i915_gem.h"
> -#include "i915_utils.h"
> +#include <drm/drm_buddy.h>

Please ensure the series builds after every commit. Clearly this is not
the case here.

BR,
Jani.

>  
>  static struct kmem_cache *slab_blocks;
>  
> -static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
> -						 struct i915_buddy_block *parent,
> -						 unsigned int order,
> -						 u64 offset)
> +static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
> +					       struct drm_buddy_block *parent,
> +					       unsigned int order,
> +					       u64 offset)
>  {
> -	struct i915_buddy_block *block;
> +	struct drm_buddy_block *block;
>  
> -	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
> +	BUG_ON(order > DRM_BUDDY_MAX_ORDER);
>  
>  	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
>  	if (!block)
> @@ -30,43 +27,43 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
>  	block->header |= order;
>  	block->parent = parent;
>  
> -	GEM_BUG_ON(block->header & I915_BUDDY_HEADER_UNUSED);
> +	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>  	return block;
>  }
>  
> -static void i915_block_free(struct i915_buddy_mm *mm,
> -			    struct i915_buddy_block *block)
> +static void drm_block_free(struct drm_buddy_mm *mm,
> +			   struct drm_buddy_block *block)
>  {
>  	kmem_cache_free(slab_blocks, block);
>  }
>  
> -static void mark_allocated(struct i915_buddy_block *block)
> +static void mark_allocated(struct drm_buddy_block *block)
>  {
> -	block->header &= ~I915_BUDDY_HEADER_STATE;
> -	block->header |= I915_BUDDY_ALLOCATED;
> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
> +	block->header |= DRM_BUDDY_ALLOCATED;
>  
>  	list_del(&block->link);
>  }
>  
> -static void mark_free(struct i915_buddy_mm *mm,
> -		      struct i915_buddy_block *block)
> +static void mark_free(struct drm_buddy_mm *mm,
> +		      struct drm_buddy_block *block)
>  {
> -	block->header &= ~I915_BUDDY_HEADER_STATE;
> -	block->header |= I915_BUDDY_FREE;
> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
> +	block->header |= DRM_BUDDY_FREE;
>  
>  	list_add(&block->link,
> -		 &mm->free_list[i915_buddy_block_order(block)]);
> +		 &mm->free_list[drm_buddy_block_order(block)]);
>  }
>  
> -static void mark_split(struct i915_buddy_block *block)
> +static void mark_split(struct drm_buddy_block *block)
>  {
> -	block->header &= ~I915_BUDDY_HEADER_STATE;
> -	block->header |= I915_BUDDY_SPLIT;
> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
> +	block->header |= DRM_BUDDY_SPLIT;
>  
>  	list_del(&block->link);
>  }
>  
> -int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
>  {
>  	unsigned int i;
>  	u64 offset;
> @@ -87,7 +84,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>  	mm->chunk_size = chunk_size;
>  	mm->max_order = ilog2(size) - ilog2(chunk_size);
>  
> -	GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
> +	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>  
>  	mm->free_list = kmalloc_array(mm->max_order + 1,
>  				      sizeof(struct list_head),
> @@ -101,7 +98,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>  	mm->n_roots = hweight64(size);
>  
>  	mm->roots = kmalloc_array(mm->n_roots,
> -				  sizeof(struct i915_buddy_block *),
> +				  sizeof(struct drm_buddy_block *),
>  				  GFP_KERNEL);
>  	if (!mm->roots)
>  		goto out_free_list;
> @@ -114,21 +111,21 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>  	 * not itself a power-of-two.
>  	 */
>  	do {
> -		struct i915_buddy_block *root;
> +		struct drm_buddy_block *root;
>  		unsigned int order;
>  		u64 root_size;
>  
>  		root_size = rounddown_pow_of_two(size);
>  		order = ilog2(root_size) - ilog2(chunk_size);
>  
> -		root = i915_block_alloc(mm, NULL, order, offset);
> +		root = drm_block_alloc(mm, NULL, order, offset);
>  		if (!root)
>  			goto out_free_roots;
>  
>  		mark_free(mm, root);
>  
> -		GEM_BUG_ON(i > mm->max_order);
> -		GEM_BUG_ON(i915_buddy_block_size(mm, root) < chunk_size);
> +		BUG_ON(i > mm->max_order);
> +		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
>  
>  		mm->roots[i] = root;
>  
> @@ -141,45 +138,45 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
>  
>  out_free_roots:
>  	while (i--)
> -		i915_block_free(mm, mm->roots[i]);
> +		drm_block_free(mm, mm->roots[i]);
>  	kfree(mm->roots);
>  out_free_list:
>  	kfree(mm->free_list);
>  	return -ENOMEM;
>  }
>  
> -void i915_buddy_fini(struct i915_buddy_mm *mm)
> +void drm_buddy_fini(struct drm_buddy_mm *mm)
>  {
>  	int i;
>  
>  	for (i = 0; i < mm->n_roots; ++i) {
> -		GEM_WARN_ON(!i915_buddy_block_is_free(mm->roots[i]));
> -		i915_block_free(mm, mm->roots[i]);
> +		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> +		drm_block_free(mm, mm->roots[i]);
>  	}
>  
> -	GEM_WARN_ON(mm->avail != mm->size);
> +	WARN_ON(mm->avail != mm->size);
>  
>  	kfree(mm->roots);
>  	kfree(mm->free_list);
>  }
>  
> -static int split_block(struct i915_buddy_mm *mm,
> -		       struct i915_buddy_block *block)
> +static int split_block(struct drm_buddy_mm *mm,
> +		       struct drm_buddy_block *block)
>  {
> -	unsigned int block_order = i915_buddy_block_order(block) - 1;
> -	u64 offset = i915_buddy_block_offset(block);
> +	unsigned int block_order = drm_buddy_block_order(block) - 1;
> +	u64 offset = drm_buddy_block_offset(block);
>  
> -	GEM_BUG_ON(!i915_buddy_block_is_free(block));
> -	GEM_BUG_ON(!i915_buddy_block_order(block));
> +	BUG_ON(!drm_buddy_block_is_free(block));
> +	BUG_ON(!drm_buddy_block_order(block));
>  
> -	block->left = i915_block_alloc(mm, block, block_order, offset);
> +	block->left = drm_block_alloc(mm, block, block_order, offset);
>  	if (!block->left)
>  		return -ENOMEM;
>  
> -	block->right = i915_block_alloc(mm, block, block_order,
> +	block->right = drm_block_alloc(mm, block, block_order,
>  					offset + (mm->chunk_size << block_order));
>  	if (!block->right) {
> -		i915_block_free(mm, block->left);
> +		drm_block_free(mm, block->left);
>  		return -ENOMEM;
>  	}
>  
> @@ -191,10 +188,10 @@ static int split_block(struct i915_buddy_mm *mm,
>  	return 0;
>  }
>  
> -static struct i915_buddy_block *
> -get_buddy(struct i915_buddy_block *block)
> +static struct drm_buddy_block *
> +get_buddy(struct drm_buddy_block *block)
>  {
> -	struct i915_buddy_block *parent;
> +	struct drm_buddy_block *parent;
>  
>  	parent = block->parent;
>  	if (!parent)
> @@ -206,23 +203,23 @@ get_buddy(struct i915_buddy_block *block)
>  	return parent->left;
>  }
>  
> -static void __i915_buddy_free(struct i915_buddy_mm *mm,
> -			      struct i915_buddy_block *block)
> +static void __drm_buddy_free(struct drm_buddy_mm *mm,
> +			     struct drm_buddy_block *block)
>  {
> -	struct i915_buddy_block *parent;
> +	struct drm_buddy_block *parent;
>  
>  	while ((parent = block->parent)) {
> -		struct i915_buddy_block *buddy;
> +		struct drm_buddy_block *buddy;
>  
>  		buddy = get_buddy(block);
>  
> -		if (!i915_buddy_block_is_free(buddy))
> +		if (!drm_buddy_block_is_free(buddy))
>  			break;
>  
>  		list_del(&buddy->link);
>  
> -		i915_block_free(mm, block);
> -		i915_block_free(mm, buddy);
> +		drm_block_free(mm, block);
> +		drm_block_free(mm, buddy);
>  
>  		block = parent;
>  	}
> @@ -230,20 +227,20 @@ static void __i915_buddy_free(struct i915_buddy_mm *mm,
>  	mark_free(mm, block);
>  }
>  
> -void i915_buddy_free(struct i915_buddy_mm *mm,
> -		     struct i915_buddy_block *block)
> +void drm_buddy_free(struct drm_buddy_mm *mm,
> +		    struct drm_buddy_block *block)
>  {
> -	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
> -	mm->avail += i915_buddy_block_size(mm, block);
> -	__i915_buddy_free(mm, block);
> +	BUG_ON(!drm_buddy_block_is_allocated(block));
> +	mm->avail += drm_buddy_block_size(mm, block);
> +	__drm_buddy_free(mm, block);
>  }
>  
> -void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects)
> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
>  {
> -	struct i915_buddy_block *block, *on;
> +	struct drm_buddy_block *block, *on;
>  
>  	list_for_each_entry_safe(block, on, objects, link) {
> -		i915_buddy_free(mm, block);
> +		drm_buddy_free(mm, block);
>  		cond_resched();
>  	}
>  	INIT_LIST_HEAD(objects);
> @@ -257,16 +254,16 @@ void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects)
>   *   2 = 2^2 * mm->chunk_size
>   *   ...
>   */
> -struct i915_buddy_block *
> -i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
> +struct drm_buddy_block *
> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
>  {
> -	struct i915_buddy_block *block = NULL;
> +	struct drm_buddy_block *block = NULL;
>  	unsigned int i;
>  	int err;
>  
>  	for (i = order; i <= mm->max_order; ++i) {
>  		block = list_first_entry_or_null(&mm->free_list[i],
> -						 struct i915_buddy_block,
> +						 struct drm_buddy_block,
>  						 link);
>  		if (block)
>  			break;
> @@ -275,7 +272,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
>  	if (!block)
>  		return ERR_PTR(-ENOSPC);
>  
> -	GEM_BUG_ON(!i915_buddy_block_is_free(block));
> +	BUG_ON(!drm_buddy_block_is_free(block));
>  
>  	while (i != order) {
>  		err = split_block(mm, block);
> @@ -288,13 +285,13 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
>  	}
>  
>  	mark_allocated(block);
> -	mm->avail -= i915_buddy_block_size(mm, block);
> +	mm->avail -= drm_buddy_block_size(mm, block);
>  	kmemleak_update_trace(block);
>  	return block;
>  
>  out_free:
>  	if (i != order)
> -		__i915_buddy_free(mm, block);
> +		__drm_buddy_free(mm, block);
>  	return ERR_PTR(err);
>  }
>  
> @@ -314,16 +311,16 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   *
>   * Intended for pre-allocating portions of the address space, for example to
>   * reserve a block for the initial framebuffer or similar, hence the expectation
> - * here is that i915_buddy_alloc() is still the main vehicle for
> + * here is that drm_buddy_alloc() is still the main vehicle for
>   * allocations, so if that's not the case then the drm_mm range allocator is
>   * probably a much better fit, and so you should probably go use that instead.
>   */
> -int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
> -			   struct list_head *blocks,
> -			   u64 start, u64 size)
> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> +			  struct list_head *blocks,
> +			  u64 start, u64 size)
>  {
> -	struct i915_buddy_block *block;
> -	struct i915_buddy_block *buddy;
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
>  	LIST_HEAD(allocated);
>  	LIST_HEAD(dfs);
>  	u64 end;
> @@ -349,37 +346,37 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>  		u64 block_end;
>  
>  		block = list_first_entry_or_null(&dfs,
> -						 struct i915_buddy_block,
> +						 struct drm_buddy_block,
>  						 tmp_link);
>  		if (!block)
>  			break;
>  
>  		list_del(&block->tmp_link);
>  
> -		block_start = i915_buddy_block_offset(block);
> -		block_end = block_start + i915_buddy_block_size(mm, block) - 1;
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>  
>  		if (!overlaps(start, end, block_start, block_end))
>  			continue;
>  
> -		if (i915_buddy_block_is_allocated(block)) {
> +		if (drm_buddy_block_is_allocated(block)) {
>  			err = -ENOSPC;
>  			goto err_free;
>  		}
>  
>  		if (contains(start, end, block_start, block_end)) {
> -			if (!i915_buddy_block_is_free(block)) {
> +			if (!drm_buddy_block_is_free(block)) {
>  				err = -ENOSPC;
>  				goto err_free;
>  			}
>  
>  			mark_allocated(block);
> -			mm->avail -= i915_buddy_block_size(mm, block);
> +			mm->avail -= drm_buddy_block_size(mm, block);
>  			list_add_tail(&block->link, &allocated);
>  			continue;
>  		}
>  
> -		if (!i915_buddy_block_is_split(block)) {
> +		if (!drm_buddy_block_is_split(block)) {
>  			err = split_block(mm, block);
>  			if (unlikely(err))
>  				goto err_undo;
> @@ -400,26 +397,26 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
>  	 */
>  	buddy = get_buddy(block);
>  	if (buddy &&
> -	    (i915_buddy_block_is_free(block) &&
> -	     i915_buddy_block_is_free(buddy)))
> -		__i915_buddy_free(mm, block);
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy)))
> +		__drm_buddy_free(mm, block);
>  
>  err_free:
> -	i915_buddy_free_list(mm, &allocated);
> +	drm_buddy_free_list(mm, &allocated);
>  	return err;
>  }
>  
> -void i915_buddy_block_print(struct i915_buddy_mm *mm,
> -			    struct i915_buddy_block *block,
> -			    struct drm_printer *p)
> +void drm_buddy_block_print(struct drm_buddy_mm *mm,
> +			   struct drm_buddy_block *block,
> +			   struct drm_printer *p)
>  {
> -	u64 start = i915_buddy_block_offset(block);
> -	u64 size = i915_buddy_block_size(mm, block);
> +	u64 start = drm_buddy_block_offset(block);
> +	u64 size = drm_buddy_block_size(mm, block);
>  
>  	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
>  }
>  
> -void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
> +void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
>  {
>  	int order;
>  
> @@ -427,11 +424,11 @@ void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
>  		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
>  
>  	for (order = mm->max_order; order >= 0; order--) {
> -		struct i915_buddy_block *block;
> +		struct drm_buddy_block *block;
>  		u64 count = 0, free;
>  
>  		list_for_each_entry(block, &mm->free_list[order], link) {
> -			GEM_BUG_ON(!i915_buddy_block_is_free(block));
> +			BUG_ON(!drm_buddy_block_is_free(block));
>  			count++;
>  		}
>  
> @@ -451,14 +448,14 @@ void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
>  #include "selftests/i915_buddy.c"
>  #endif
>  
> -void i915_buddy_module_exit(void)
> +void drm_buddy_module_exit(void)
>  {
>  	kmem_cache_destroy(slab_blocks);
>  }
>  
> -int __init i915_buddy_module_init(void)
> +int __init drm_buddy_module_init(void)
>  {
> -	slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
> +	slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
>  	if (!slab_blocks)
>  		return -ENOMEM;
>  
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 521ed532d2b8..390b133fe342 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -9,9 +9,19 @@
>  #include <linux/bitops.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
> +#include <linux/sched.h>
>  
>  #include <drm/drm_print.h>
>  
> +#define range_overflows(start, size, max) ({ \
> +	typeof(start) start__ = (start); \
> +	typeof(size) size__ = (size); \
> +	typeof(max) max__ = (max); \
> +	(void)(&start__ == &size__); \
> +	(void)(&start__ == &max__); \
> +	start__ >= max__ || size__ > max__ - start__; \
> +})
> +
>  struct drm_buddy_block {
>  #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>  #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)

-- 
Jani Nikula, Intel Open Source Graphics Center
