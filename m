Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE951BA4BCE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 19:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECC010EAAE;
	Fri, 26 Sep 2025 17:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4ZrxT+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326710E058;
 Fri, 26 Sep 2025 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758906537; x=1790442537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1ufvjGQLbxbg6rNNNy/03qHnlPm8o8IrClziDpfYv7Y=;
 b=k4ZrxT+lz50ObA4iUVT1XdF9bJwcqga3vb18SdqDe4u+hT/1yJY7Eaxb
 jou7dLIwaO5VdTC3ZHQGuK0qMNnom1hI45RDW53kWVJHl+zfm4JZyftLY
 op/aAkgR2OuyjxDZCw9ujhdeAn9m8aLGI4OZ6BDGzm7n58rAjEwugv7/4
 TjS25MHgt2MTiaP2FhOcZ9ew2tb0iB97BPzdkOTvPieuLsjHfA4Ul8h8l
 CVMBGhoTywIAEk1EnExJIFy/+dKDw6BKAcp213lsPyb4CaNoQ8o4Jb3gw
 D4pN0+ohcSmS8r7fYhBWKE1VsL+cSq2HEPEyaCtoiKGsWdruUnSyqlG0s g==;
X-CSE-ConnectionGUID: bIIMtFAPT3adxUrbEuNaKQ==
X-CSE-MsgGUID: bXFKCSZ+SNu1IYdvriKvKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61133828"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61133828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 10:08:56 -0700
X-CSE-ConnectionGUID: rkMphPX8SA6TnCkjLFT2rw==
X-CSE-MsgGUID: 6MWayDfWQH2K1nGTM7cWeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="201359385"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.9])
 ([10.245.245.9])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 10:08:53 -0700
Message-ID: <c1936b9c-3c0c-4a33-84e8-574d67790265@intel.com>
Date: Fri, 26 Sep 2025 18:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/buddy: Separate clear and dirty free block
 trees
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, jani.nikula@linux.intel.com,
 peterz@infradead.org, samuel.pitoiset@gmail.com, stable@vger.kernel.org
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
 <20250923090242.60649-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250923090242.60649-2-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/09/2025 10:02, Arunpravin Paneer Selvam wrote:
> Maintain two separate RB trees per order - one for clear (zeroed) blocks
> and another for dirty (uncleared) blocks. This separation improves
> code clarity and makes it more obvious which tree is being searched
> during allocation. It also improves scalability and efficiency when
> searching for a specific type of block, avoiding unnecessary checks
> and making the allocator more predictable under fragmentation.
> 
> The changes have been validated using the existing drm_buddy_test
> KUnit test cases, along with selected graphics workloads,
> to ensure correctness and avoid regressions.
> 
> v2: Missed adding the suggested-by tag. Added it in v2.
> 
> v3(Matthew):
>    - Remove the double underscores from the internal functions.
>    - Rename the internal functions to have less generic names.
>    - Fix the error handling code.
>    - Pass tree argument for the tree macro.
>    - Use the existing dirty/free bit instead of new tree field.
>    - Make free_trees[] instead of clear_tree and dirty_tree for
>      more cleaner approach.
> 
> v4:
>    - A bug was reported by Intel CI and it is fixed by
>      Matthew Auld.
>    - Replace the get_root function with
>      &mm->free_trees[tree][order] (Matthew)
>    - Remove the unnecessary rbtree_is_empty() check (Matthew)
>    - Remove the unnecessary get_tree_for_flags() function.
>    - Rename get_tree_for_block() name with get_block_tree() for more
>      clarity.
> 
> v5(Jani Nikula):
>    - Don't use static inline in .c files.
>    - enum free_tree and enumerator names are quite generic for a header
>      and usage and the whole enum should be an implementation detail.
> 
> v6:
>    - Rewrite the __force_merge() function using the rb_last() and rb_prev().
> 
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
> ---
>   drivers/gpu/drm/drm_buddy.c | 321 ++++++++++++++++++++----------------
>   include/drm/drm_buddy.h     |   2 +-
>   2 files changed, 182 insertions(+), 141 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 67aa67229cc3..6e12a0b5d5e3 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -12,9 +12,16 @@
>   
>   #include <drm/drm_buddy.h>
>   
> +enum drm_buddy_free_tree {
> +	DRM_BUDDY_CLEAR_TREE = 0,
> +	DRM_BUDDY_DIRTY_TREE,
> +	DRM_BUDDY_MAX_FREE_TREES,
> +};
> +
>   static struct kmem_cache *slab_blocks;
>   
> -#define rbtree_get_free_block(node) rb_entry((node), struct drm_buddy_block, rb)
> +#define for_each_free_tree(tree) \
> +	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)

Some places seem to open code this? Maybe just drop this or use it 
everywhere?

>   
>   static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>   					       struct drm_buddy_block *parent,
> @@ -45,6 +52,30 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> +static enum drm_buddy_free_tree
> +get_block_tree(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_is_clear(block) ?
> +	       DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
> +}
> +
> +static struct drm_buddy_block *
> +rbtree_get_free_block(const struct rb_node *node)
> +{
> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> +}
> +
> +static struct drm_buddy_block *
> +rbtree_last_free_block(struct rb_root *root)
> +{
> +	return rbtree_get_free_block(rb_last(root));
> +}
> +
> +static bool rbtree_is_empty(struct rb_root *root)
> +{
> +	return RB_EMPTY_ROOT(root);
> +}
> +
>   static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
>   					const struct drm_buddy_block *node)
>   {
> @@ -59,37 +90,28 @@ static bool rbtree_block_offset_less(struct rb_node *block,
>   }
>   
>   static void rbtree_insert(struct drm_buddy *mm,
> -			  struct drm_buddy_block *block)
> +			  struct drm_buddy_block *block,
> +			  enum drm_buddy_free_tree tree)
>   {
>   	rb_add(&block->rb,
> -	       &mm->free_tree[drm_buddy_block_order(block)],
> +	       &mm->free_trees[tree][drm_buddy_block_order(block)],
>   	       rbtree_block_offset_less);
>   }
>   
>   static void rbtree_remove(struct drm_buddy *mm,
>   			  struct drm_buddy_block *block)
>   {
> +	unsigned int order = drm_buddy_block_order(block);
>   	struct rb_root *root;
> +	enum drm_buddy_free_tree tree;
>   
> -	root = &mm->free_tree[drm_buddy_block_order(block)];
> -	rb_erase(&block->rb, root);
> +	tree = get_block_tree(block);
> +	root = &mm->free_trees[tree][order];
>   
> +	rb_erase(&block->rb, root);
>   	RB_CLEAR_NODE(&block->rb);
>   }
>   
> -static struct drm_buddy_block *
> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
> -{
> -	struct rb_node *node = rb_last(&mm->free_tree[order]);
> -
> -	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> -}
> -
> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
> -{
> -	return RB_EMPTY_ROOT(&mm->free_tree[order]);
> -}
> -
>   static void clear_reset(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
> @@ -112,10 +134,13 @@ static void mark_allocated(struct drm_buddy *mm,
>   static void mark_free(struct drm_buddy *mm,
>   		      struct drm_buddy_block *block)
>   {
> +	enum drm_buddy_free_tree tree;
> +
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	rbtree_insert(mm, block);
> +	tree = get_block_tree(block);
> +	rbtree_insert(mm, block, tree);
>   }
>   
>   static void mark_split(struct drm_buddy *mm,
> @@ -201,6 +226,7 @@ static int __force_merge(struct drm_buddy *mm,
>   			 u64 end,
>   			 unsigned int min_order)
>   {
> +	enum drm_buddy_free_tree tree;
>   	unsigned int order;
>   	int i;
>   
> @@ -210,45 +236,48 @@ static int __force_merge(struct drm_buddy *mm,
>   	if (min_order > mm->max_order)
>   		return -EINVAL;
>   
> -	for (i = min_order - 1; i >= 0; i--) {
> -		struct rb_root *root = &mm->free_tree[i];
> -		struct rb_node *iter;
> +	for_each_free_tree(tree) {
> +		for (i = min_order - 1; i >= 0; i--) {
> +			struct rb_node *iter = rb_last(&mm->free_trees[tree][i]);
>   
> -		iter = rb_last(root);
> -
> -		while (iter) {
> -			struct drm_buddy_block *block, *buddy;
> -			u64 block_start, block_end;
> +			while (iter) {
> +				struct drm_buddy_block *block, *buddy;
> +				u64 block_start, block_end;
>   
> -			block = rbtree_get_free_block(iter);
> -			iter = rb_prev(iter);
> +				block = rbtree_get_free_block(iter);
> +				iter = rb_prev(iter);
>   
> -			if (!block || !block->parent)
> -				continue;
> +				if (!block || !block->parent)
> +					continue;
>   
> -			block_start = drm_buddy_block_offset(block);
> -			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +				block_start = drm_buddy_block_offset(block);
> +				block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>   
> -			if (!contains(start, end, block_start, block_end))
> -				continue;
> +				if (!contains(start, end, block_start, block_end))
> +					continue;
>   
> -			buddy = __get_buddy(block);
> -			if (!drm_buddy_block_is_free(buddy))
> -				continue;
> +				buddy = __get_buddy(block);
> +				if (!drm_buddy_block_is_free(buddy))
> +					continue;
>   
> -			WARN_ON(drm_buddy_block_is_clear(block) ==
> -				drm_buddy_block_is_clear(buddy));
> +				WARN_ON(drm_buddy_block_is_clear(block) ==
> +					drm_buddy_block_is_clear(buddy));
>   
> -			if (iter == &buddy->rb)
> -				iter = rb_prev(iter);
> +				/*
> +				 * Advance to the next node when the current node is the buddy,
> +				 * as freeing the block will also remove its buddy from the tree.
> +				 */
> +				if (iter == &buddy->rb)
> +					iter = rb_prev(iter);
>   
> -			rbtree_remove(mm, block);
> -			if (drm_buddy_block_is_clear(block))
> -				mm->clear_avail -= drm_buddy_block_size(mm, block);
> +				rbtree_remove(mm, block);
> +				if (drm_buddy_block_is_clear(block))
> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
>   
> -			order = __drm_buddy_free(mm, block, true);
> -			if (order >= min_order)
> -				return 0;
> +				order = __drm_buddy_free(mm, block, true);
> +				if (order >= min_order)
> +					return 0;
> +			}

Do we need all these changes in __force_merge? Can't we just always pick 
the dirty tree and keep everything else the same? If something is 
non-merged there must be a dirty block preventing that, and when force 
merging everything unmerged will be re-labled as dirty anyway, so the 
second loop through the clean tree should always yield nothing?

>   		}
>   	}
>   
> @@ -269,7 +298,7 @@ static int __force_merge(struct drm_buddy *mm,
>    */
>   int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   {
> -	unsigned int i;
> +	unsigned int i, j;
>   	u64 offset;
>   
>   	if (size < chunk_size)
> @@ -291,14 +320,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   
>   	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>   
> -	mm->free_tree = kmalloc_array(mm->max_order + 1,
> -				      sizeof(struct rb_root),
> -				      GFP_KERNEL);
> -	if (!mm->free_tree)
> +	mm->free_trees = kmalloc_array(DRM_BUDDY_MAX_FREE_TREES,
> +				       sizeof(*mm->free_trees),
> +				       GFP_KERNEL);
> +	if (!mm->free_trees)
>   		return -ENOMEM;
>   
> -	for (i = 0; i <= mm->max_order; ++i)
> -		mm->free_tree[i] = RB_ROOT;
> +	for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++) {
> +		mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
> +						  sizeof(struct rb_root),
> +						  GFP_KERNEL);
> +		if (!mm->free_trees[i])
> +			goto out_free_tree;
> +
> +		for (j = 0; j <= mm->max_order; ++j)
> +			mm->free_trees[i][j] = RB_ROOT;
> +	}
>   
>   	mm->n_roots = hweight64(size);
>   
> @@ -346,7 +383,9 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   		drm_block_free(mm, mm->roots[i]);
>   	kfree(mm->roots);
>   out_free_tree:
> -	kfree(mm->free_tree);
> +	while (i--)
> +		kfree(mm->free_trees[i]);

out_free_roots is also decrementing 'i' here it seems, so looks like 
this might blow up?

> +	kfree(mm->free_trees);
>   	return -ENOMEM;
>   }
>   EXPORT_SYMBOL(drm_buddy_init);
> @@ -382,8 +421,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   
>   	WARN_ON(mm->avail != mm->size);
>   
> +	for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++)
> +		kfree(mm->free_trees[i]);
>   	kfree(mm->roots);
> -	kfree(mm->free_tree);
>   }
>   EXPORT_SYMBOL(drm_buddy_fini);
>   
> @@ -407,8 +447,7 @@ static int split_block(struct drm_buddy *mm,
>   		return -ENOMEM;
>   	}
>   
> -	mark_free(mm, block->left);
> -	mark_free(mm, block->right);
> +	mark_split(mm, block);
>   
>   	if (drm_buddy_block_is_clear(block)) {
>   		mark_cleared(block->left);
> @@ -416,7 +455,8 @@ static int split_block(struct drm_buddy *mm,
>   		clear_reset(block);
>   	}
>   
> -	mark_split(mm, block);
> +	mark_free(mm, block->left);
> +	mark_free(mm, block->right);
>   
>   	return 0;
>   }
> @@ -449,6 +489,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>    */
>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>   {
> +	enum drm_buddy_free_tree src_tree, dst_tree;
>   	u64 root_size, size, start;
>   	unsigned int order;
>   	int i;
> @@ -463,19 +504,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>   		size -= root_size;
>   	}
>   
> +	src_tree = is_clear ? DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
> +	dst_tree = is_clear ? DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
> +
>   	for (i = 0; i <= mm->max_order; ++i) {
> +		struct rb_root *root = &mm->free_trees[src_tree][i];
>   		struct drm_buddy_block *block, *tmp;
>   
> -		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[i], rb) {
> -			if (is_clear != drm_buddy_block_is_clear(block)) {
> -				if (is_clear) {
> -					mark_cleared(block);
> -					mm->clear_avail += drm_buddy_block_size(mm, block);
> -				} else {
> -					clear_reset(block);
> -					mm->clear_avail -= drm_buddy_block_size(mm, block);
> -				}
> +		rbtree_postorder_for_each_entry_safe(block, tmp, root, rb) {
> +			rbtree_remove(mm, block);
> +			if (is_clear) {
> +				mark_cleared(block);
> +				mm->clear_avail += drm_buddy_block_size(mm, block);
> +			} else {
> +				clear_reset(block);
> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   			}
> +
> +			rbtree_insert(mm, block, dst_tree);
>   		}
>   	}
>   }
> @@ -665,27 +711,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order,
> -	     unsigned long flags)
> +get_maxblock(struct drm_buddy *mm,
> +	     unsigned int order,
> +	     enum drm_buddy_free_tree tree)
>   {
>   	struct drm_buddy_block *max_block = NULL, *block = NULL;
> +	struct rb_root *root;
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		struct rb_node *iter = rb_last(&mm->free_tree[i]);
> -		struct drm_buddy_block *tmp_block;
> -
> -		while (iter) {
> -			tmp_block = rbtree_get_free_block(iter);
> -
> -			if (!block_incompatible(tmp_block, flags)) {
> -				block = tmp_block;
> -				break;
> -			}
> -
> -			iter = rb_prev(iter);
> -		}
> -
> +		root = &mm->free_trees[tree][i];
> +		block = rbtree_last_free_block(root);
>   		if (!block)
>   			continue;
>   
> @@ -709,43 +745,39 @@ alloc_from_freetree(struct drm_buddy *mm,
>   		    unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
> +	struct rb_root *root;
> +	enum drm_buddy_free_tree tree;
>   	unsigned int tmp;
>   	int err;
>   
> +	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
> +		DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
> +
>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order, flags);
> +		block = get_maxblock(mm, order, tree);
>   		if (block)
>   			/* Store the obtained block order */
>   			tmp = drm_buddy_block_order(block);
>   	} else {
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			struct rb_node *iter = rb_last(&mm->free_tree[tmp]);
> -			struct drm_buddy_block *tmp_block;
> -
> -			while (iter) {
> -				tmp_block = rbtree_get_free_block(iter);
> -
> -				if (!block_incompatible(tmp_block, flags)) {
> -					block = tmp_block;
> -					break;
> -				}
> -
> -				iter = rb_prev(iter);
> -			}
> -
> +			/* Get RB tree root for this order and tree */
> +			root = &mm->free_trees[tree][tmp];
> +			block = rbtree_last_free_block(root);
>   			if (block)
>   				break;
>   		}
>   	}
>   
>   	if (!block) {
> -		/* Fallback method */
> +		/* Try allocating from the other tree */
> +		tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
> +			DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
> +
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			if (!rbtree_is_empty(mm, tmp)) {

Did you mean to drop the is_empty() check here? If it's overkill I think 
better just not add it in the previous patch?

> -				block = rbtree_last_entry(mm, tmp);
> -				if (block)
> -					break;
> -			}
> +			root = &mm->free_trees[tree][tmp];
> +			block = rbtree_last_free_block(root);
> +			if (block)
> +				break;
>   		}
>   
>   		if (!block)
> @@ -887,9 +919,9 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   				     struct list_head *blocks)
>   {
>   	u64 rhs_offset, lhs_offset, lhs_size, filled;
> +	enum drm_buddy_free_tree tree;
>   	struct drm_buddy_block *block;
>   	LIST_HEAD(blocks_lhs);
> -	struct rb_node *iter;
>   	unsigned long pages;
>   	unsigned int order;
>   	u64 modify_size;
> @@ -901,40 +933,43 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   	if (order == 0)
>   		return -ENOSPC;
>   
> -	if (rbtree_is_empty(mm, order))
> +	if (rbtree_is_empty(&mm->free_trees[DRM_BUDDY_CLEAR_TREE][order]) &&
> +	    rbtree_is_empty(&mm->free_trees[DRM_BUDDY_DIRTY_TREE][order]))

Could potentially merge this with the for_each_tree loop below?

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   		return -ENOSPC;
>   
> -	iter = rb_last(&mm->free_tree[order]);
> -
> -	while (iter) {
> -		block = rbtree_get_free_block(iter);
> -
> -		/* Allocate blocks traversing RHS */
> -		rhs_offset = drm_buddy_block_offset(block);
> -		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> -					       &filled, blocks);
> -		if (!err || err != -ENOSPC)
> -			return err;
> -
> -		lhs_size = max((size - filled), min_block_size);
> -		if (!IS_ALIGNED(lhs_size, min_block_size))
> -			lhs_size = round_up(lhs_size, min_block_size);
> -
> -		/* Allocate blocks traversing LHS */
> -		lhs_offset = drm_buddy_block_offset(block) - lhs_size;
> -		err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
> -					       NULL, &blocks_lhs);
> -		if (!err) {
> -			list_splice(&blocks_lhs, blocks);
> -			return 0;
> -		} else if (err != -ENOSPC) {
> +	for_each_free_tree(tree) {
> +		struct rb_node *iter = rb_last(&mm->free_trees[tree][order]);
> +
> +		while (iter) {
> +			block = rbtree_get_free_block(iter);
> +
> +			/* Allocate blocks traversing RHS */
> +			rhs_offset = drm_buddy_block_offset(block);
> +			err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
> +						       &filled, blocks);
> +			if (!err || err != -ENOSPC)
> +				return err;
> +
> +			lhs_size = max((size - filled), min_block_size);
> +			if (!IS_ALIGNED(lhs_size, min_block_size))
> +				lhs_size = round_up(lhs_size, min_block_size);
> +
> +			/* Allocate blocks traversing LHS */
> +			lhs_offset = drm_buddy_block_offset(block) - lhs_size;
> +			err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
> +						       NULL, &blocks_lhs);
> +			if (!err) {
> +				list_splice(&blocks_lhs, blocks);
> +				return 0;
> +			} else if (err != -ENOSPC) {
> +				drm_buddy_free_list_internal(mm, blocks);
> +				return err;
> +			}
> +			/* Free blocks for the next iteration */
>   			drm_buddy_free_list_internal(mm, blocks);
> -			return err;
> -		}
> -		/* Free blocks for the next iteration */
> -		drm_buddy_free_list_internal(mm, blocks);
>   
> -		iter = rb_prev(iter);
> +			iter = rb_prev(iter);
> +		}
>   	}
>   
>   	return -ENOSPC;
> @@ -1239,6 +1274,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
>    */
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   {
> +	enum drm_buddy_free_tree tree;
>   	int order;
>   
>   	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
> @@ -1246,11 +1282,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   
>   	for (order = mm->max_order; order >= 0; order--) {
>   		struct drm_buddy_block *block, *tmp;
> +		struct rb_root *root;
>   		u64 count = 0, free;
>   
> -		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[order], rb) {
> -			BUG_ON(!drm_buddy_block_is_free(block));
> -			count++;
> +		for_each_free_tree(tree) {
> +			root = &mm->free_trees[tree][order];
> +
> +			rbtree_postorder_for_each_entry_safe(block, tmp, root, rb) {
> +				BUG_ON(!drm_buddy_block_is_free(block));
> +				count++;
> +			}
>   		}
>   
>   		drm_printf(p, "order-%2d ", order);
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9ee105d4309f..d7891d08f67a 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -73,7 +73,7 @@ struct drm_buddy_block {
>    */
>   struct drm_buddy {
>   	/* Maintain a free list for each order. */
> -	struct rb_root *free_tree;
> +	struct rb_root **free_trees;
>   
>   	/*
>   	 * Maintain explicit binary tree(s) to track the allocation of the

