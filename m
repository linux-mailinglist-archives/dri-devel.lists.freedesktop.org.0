Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57788B263D7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B31E10E846;
	Thu, 14 Aug 2025 11:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkXcKGXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC9C10E844;
 Thu, 14 Aug 2025 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755169904; x=1786705904;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Z0mW7UHju4T1KsPYth/8wKNGGMpevy00eG+YurduZ54=;
 b=mkXcKGXgoxyGUYEiEYctMKHQ1yMgsap3GhumnuoTduVcNWLo42LHmoxJ
 oWVgNFSAIF7JwEEks8WNKEpLWb+O6toj7MjSs4mrBlq/m05y2KmzQ9eDE
 n8SexdM9e1eLSAjoAEeCKS0F0e3CY0wA+sJx7dvsp8YAgzscgkO9gCSDn
 FTJXxGpPVXtoNtUXFdYWn5lWH8B4DvfuOyRPFdMVXxsnnFFZBXjS6NZFf
 DCmrtqHRp7CBWYf1KKRXtc4/WaH6PnabxQden4I+yCClo4JeOu3Anl3bj
 cvw0GRnYr072ttDhSD0z3qqa/HXvn2ip5yzHWbiddV4vhp9G/Qfgptxo/ Q==;
X-CSE-ConnectionGUID: RxXKqzRaT0mtUUbCbM+jgA==
X-CSE-MsgGUID: 1W24xP2gSE2x/KvZICZvjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57549697"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57549697"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:11:44 -0700
X-CSE-ConnectionGUID: RqjbZuUwThC/ORg1TaRdbg==
X-CSE-MsgGUID: 2XOdwdpDQ7CRmlbGbXPj9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="172069254"
Received: from zzombora-mobl1 (HELO [10.245.244.158]) ([10.245.244.158])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:11:42 -0700
Message-ID: <50c7331b-b945-4465-a7b4-0bf1b7565a96@intel.com>
Date: Thu, 14 Aug 2025 12:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 2/2] drm/buddy: Separate clear and dirty free block
 trees
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250724104640.2319-1-Arunpravin.PaneerSelvam@amd.com>
 <20250724104640.2319-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
In-Reply-To: <20250724104640.2319-2-Arunpravin.PaneerSelvam@amd.com>
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

On 24/07/2025 11:46, Arunpravin Paneer Selvam wrote:
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
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 316 ++++++++++++++++++++++--------------
>   include/drm/drm_buddy.h     |  15 +-
>   2 files changed, 204 insertions(+), 127 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 19e9773b41be..0ffb68474b83 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -43,27 +43,84 @@ static void drm_block_free(struct drm_buddy *mm,
>   	kmem_cache_free(slab_blocks, block);
>   }
>   
> +static inline struct rb_root *
> +__get_root(struct drm_buddy *mm,
> +	   unsigned int order,
> +	   enum free_tree tree)
> +{
> +	if (tree == CLEAR_TREE)
> +		return &mm->clear_tree[order];
> +	else
> +		return &mm->dirty_tree[order];
> +}
> +
> +static inline enum free_tree
> +__get_tree_for_block(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
> +}
> +
> +static inline enum free_tree
> +__get_tree_for_flags(unsigned long flags)

Do we need all these double underscores?

> +{
> +	return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : DIRTY_TREE;
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_get_entry(struct rb_node *node)
> +{
> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_prev_entry(struct rb_node *node)
> +{
> +	return rbtree_get_entry(rb_prev(node));
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_first_entry(struct rb_root *root)
> +{
> +	return rbtree_get_entry(rb_first(root));
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_last_entry(struct rb_root *root)
> +{
> +	return rbtree_get_entry(rb_last(root));
> +}
> +
> +static inline bool rbtree_is_empty(struct rb_root *root)
> +{
> +	return RB_EMPTY_ROOT(root);
> +}

Just wondering if these should have less generic names?

rb_tree_first_free_block()
rb_tree_last_free_block()
...

> +
>   static void rbtree_insert(struct drm_buddy *mm,
> -			  struct drm_buddy_block *block)
> +			  struct drm_buddy_block *block,
> +			  enum free_tree tree)
>   {
> -	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
> -	struct rb_node **link = &root->rb_node;
> -	struct rb_node *parent = NULL;
> +	struct rb_node **link, *parent = NULL;
>   	struct drm_buddy_block *node;
> -	u64 offset;
> +	struct rb_root *root;
> +	unsigned int order;
> +
> +	order = drm_buddy_block_order(block);
>   
> -	offset = drm_buddy_block_offset(block);
> +	root = __get_root(mm, order, tree);
> +	link = &root->rb_node;
>   
>   	while (*link) {
>   		parent = *link;
> -		node = rb_entry(parent, struct drm_buddy_block, rb);
> +		node = rbtree_get_entry(parent);
>   
> -		if (offset < drm_buddy_block_offset(node))
> +		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
>   			link = &parent->rb_left;
>   		else
>   			link = &parent->rb_right;
>   	}
>   
> +	block->tree = tree;
> +
>   	rb_link_node(&block->rb, parent, link);
>   	rb_insert_color(&block->rb, root);
>   }
> @@ -71,27 +128,15 @@ static void rbtree_insert(struct drm_buddy *mm,
>   static void rbtree_remove(struct drm_buddy *mm,
>   			  struct drm_buddy_block *block)
>   {
> +	unsigned int order = drm_buddy_block_order(block);
>   	struct rb_root *root;
>   
> -	root = &mm->free_tree[drm_buddy_block_order(block)];
> +	root = __get_root(mm, order, block->tree);
>   	rb_erase(&block->rb, root);
>   
>   	RB_CLEAR_NODE(&block->rb);
>   }
>   
> -static inline struct drm_buddy_block *
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
> @@ -114,10 +159,14 @@ static void mark_allocated(struct drm_buddy *mm,
>   static void mark_free(struct drm_buddy *mm,
>   		      struct drm_buddy_block *block)
>   {
> +	enum free_tree tree;
> +
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
>   	block->header |= DRM_BUDDY_FREE;
>   
> -	rbtree_insert(mm, block);
> +	tree = __get_tree_for_block(block);
> +
> +	rbtree_insert(mm, block, tree);
>   }
>   
>   static void mark_split(struct drm_buddy *mm,
> @@ -212,53 +261,52 @@ static int __force_merge(struct drm_buddy *mm,
>   	if (min_order > mm->max_order)
>   		return -EINVAL;
>   
> -	for (i = min_order - 1; i >= 0; i--) {
> -		struct drm_buddy_block *block, *prev_block, *first_block;
> -
> -		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
> +	for_each_free_tree() {
> +		for (i = min_order - 1; i >= 0; i--) {
> +			struct rb_root *root = __get_root(mm, i, tree);
> +			struct drm_buddy_block *block, *prev_block;
>   
> -		for_each_rb_entry_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
> -			struct drm_buddy_block *buddy;
> -			u64 block_start, block_end;
> +			for_each_rb_entry_reverse_safe(block, prev_block, root, rb) {
> +				struct drm_buddy_block *buddy;
> +				u64 block_start, block_end;
>   
> -			if (RB_EMPTY_NODE(&block->rb))
> -				break;
> +				if (RB_EMPTY_NODE(&block->rb))
> +					break;
>   
> -			if (!block->parent)
> -				continue;
> +				if (!block->parent)
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
> -			/*
> -			 * If the prev block is same as buddy, don't access the
> -			 * block in the next iteration as we would free the
> -			 * buddy block as part of the free function.
> -			 */
> -			if (prev_block && prev_block == buddy) {
> -				if (prev_block != first_block)
> -					prev_block = rb_entry(rb_prev(&prev_block->rb),
> -							      struct drm_buddy_block,
> -							      rb);
> -			}
> +				/*
> +				 * If the prev block is same as buddy, don't access the
> +				 * block in the next iteration as we would free the
> +				 * buddy block as part of the free function.
> +				 */
> +				if (prev_block && prev_block == buddy) {
> +					if (prev_block != rbtree_first_entry(root))
> +						prev_block = rbtree_prev_entry(&prev_block->rb);
> +				}
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
>   		}
>   	}
>   
> @@ -301,14 +349,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   
>   	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>   
> -	mm->free_tree = kmalloc_array(mm->max_order + 1,
> -				      sizeof(struct rb_root),
> -				      GFP_KERNEL);
> -	if (!mm->free_tree)
> +	mm->clear_tree = kmalloc_array(mm->max_order + 1,
> +				       sizeof(struct rb_root),
> +				       GFP_KERNEL);
> +	if (!mm->clear_tree)
> +		return -ENOMEM;
> +
> +	mm->dirty_tree = kmalloc_array(mm->max_order + 1,
> +				       sizeof(struct rb_root),
> +				       GFP_KERNEL);
> +	if (!mm->dirty_tree)

goto out_free_tree

>   		return -ENOMEM;
>   
> -	for (i = 0; i <= mm->max_order; ++i)
> -		mm->free_tree[i] = RB_ROOT;
> +	for (i = 0; i <= mm->max_order; ++i) {
> +		mm->clear_tree[i] = RB_ROOT;
> +		mm->dirty_tree[i] = RB_ROOT;
> +	}
>   
>   	mm->n_roots = hweight64(size);
>   
> @@ -356,7 +412,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   		drm_block_free(mm, mm->roots[i]);
>   	kfree(mm->roots);
>   out_free_tree:
> -	kfree(mm->free_tree);
> +	kfree(mm->clear_tree);
> +	kfree(mm->dirty_tree);
>   	return -ENOMEM;
>   }
>   EXPORT_SYMBOL(drm_buddy_init);
> @@ -393,7 +450,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   	WARN_ON(mm->avail != mm->size);
>   
>   	kfree(mm->roots);
> -	kfree(mm->free_tree);
> +	kfree(mm->clear_tree);
> +	kfree(mm->dirty_tree);
>   }
>   EXPORT_SYMBOL(drm_buddy_fini);
>   
> @@ -417,15 +475,15 @@ static int split_block(struct drm_buddy *mm,
>   		return -ENOMEM;
>   	}
>   
> -	mark_free(mm, block->left);
> -	mark_free(mm, block->right);
> -
>   	if (drm_buddy_block_is_clear(block)) {
>   		mark_cleared(block->left);
>   		mark_cleared(block->right);
>   		clear_reset(block);
>   	}
>   
> +	mark_free(mm, block->left);
> +	mark_free(mm, block->right);
> +
>   	mark_split(mm, block);
>   
>   	return 0;
> @@ -632,26 +690,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order,
> -	     unsigned long flags)
> +get_maxblock(struct drm_buddy *mm,
> +	     unsigned int order,
> +	     enum free_tree tree)
>   {
>   	struct drm_buddy_block *max_block = NULL, *block = NULL;
> +	struct rb_root *root;
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		struct drm_buddy_block *tmp_block;
> -
> -		for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
> -			if (block_incompatible(tmp_block, flags))
> +		root = __get_root(mm, i, tree);
> +		if (!rbtree_is_empty(root)) {
> +			block = rbtree_last_entry(root);
> +			if (!block)
>   				continue;
> -
> -			block = tmp_block;
> -			break;
>   		}
>   
> -		if (!block)
> -			continue;
> -
>   		if (!max_block) {
>   			max_block = block;
>   			continue;
> @@ -672,36 +726,38 @@ alloc_from_freetree(struct drm_buddy *mm,
>   		    unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
> +	struct rb_root *root;
> +	enum free_tree tree;
>   	unsigned int tmp;
>   	int err;
>   
> +	tree = __get_tree_for_flags(flags);
> +
>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order, flags);
> +		block = get_maxblock(mm, order, tree);
>   		if (block)
>   			/* Store the obtained block order */
>   			tmp = drm_buddy_block_order(block);
>   	} else {
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			struct drm_buddy_block *tmp_block;
> -
> -			for_each_rb_entry_reverse(tmp_block, &mm->free_tree[tmp], rb) {
> -				if (block_incompatible(tmp_block, flags))
> -					continue;
> -
> -				block = tmp_block;
> -				break;
> +			/* Get RB tree root for this order and tree */
> +			root = __get_root(mm, tmp, tree);
> +			if (!rbtree_is_empty(root)) {
> +				block = rbtree_last_entry(root);
> +				if (block)
> +					break;
>   			}
> -
> -			if (block)
> -				break;
>   		}
>   	}
>   
>   	if (!block) {
> -		/* Fallback method */
> +		/* Try allocating from the other tree */
> +		tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
> +
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> -			if (!rbtree_is_empty(mm, tmp)) {
> -				block = rbtree_last_entry(mm, tmp);
> +			root = __get_root(mm, tmp, tree);
> +			if (!rbtree_is_empty(root)) {
> +				block = rbtree_last_entry(root);
>   				if (block)
>   					break;
>   			}
> @@ -859,34 +915,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   	if (order == 0)
>   		return -ENOSPC;
>   
> -	if (rbtree_is_empty(mm, order))
> +	if (rbtree_is_empty(__get_root(mm, order, CLEAR_TREE)) &&
> +	    rbtree_is_empty(__get_root(mm, order, DIRTY_TREE)))
>   		return -ENOSPC;
>   
> -	for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
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
> +	for_each_free_tree() {
> +		struct rb_root *root = __get_root(mm, order, tree);
> +
> +		for_each_rb_entry_reverse(block, root, rb) {
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
>   		}
> -		/* Free blocks for the next iteration */
> -		drm_buddy_free_list_internal(mm, blocks);
>   	}
>   
>   	return -ENOSPC;
> @@ -1198,11 +1259,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   
>   	for (order = mm->max_order; order >= 0; order--) {
>   		struct drm_buddy_block *block;
> +		struct rb_root *root;
>   		u64 count = 0, free;
>   
> -		for_each_rb_entry(block, &mm->free_tree[order], rb) {
> -			BUG_ON(!drm_buddy_block_is_free(block));
> -			count++;
> +		for_each_free_tree() {
> +			root = __get_root(mm, order, tree);
> +
> +			for_each_rb_entry(block, root, rb) {
> +				BUG_ON(!drm_buddy_block_is_free(block));
> +				count++;
> +			}
>   		}
>   
>   		drm_printf(p, "order-%2d ", order);
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a64d108a33b7..afaf62ee05e1 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -14,6 +14,11 @@
>   
>   #include <drm/drm_print.h>
>   
> +enum free_tree {
> +	CLEAR_TREE = 0,
> +	DIRTY_TREE,
> +};
> +
>   #define range_overflows(start, size, max) ({ \
>   	typeof(start) start__ = (start); \
>   	typeof(size) size__ = (size); \
> @@ -23,6 +28,9 @@
>   	start__ >= max__ || size__ > max__ - start__; \
>   })
>   
> +#define for_each_free_tree() \

I think rather give this an explicit 'tree' argument? Having it hidden 
is harder to read IMO.

> +	for (enum free_tree tree = CLEAR_TREE; tree <= DIRTY_TREE; tree++)
> +
>   /*
>    * for_each_rb_entry() - iterate over an RB tree in order
>    * @pos:	the struct type * to use as a loop cursor
> @@ -89,9 +97,11 @@ struct drm_buddy_block {
>   	 * a list, if so desired. As soon as the block is freed with
>   	 * drm_buddy_free* ownership is given back to the mm.
>   	 */
> -	struct rb_node rb;
>   	struct list_head link;
>   	struct list_head tmp_link;
> +
> +	enum free_tree tree;

We also have the existing dirty/free bit in the block itself. Would it 
make sense to re-use that instead, if possible?

> +	struct rb_node rb;
>   };
>   
>   /* Order-zero must be at least SZ_4K */
> @@ -105,7 +115,8 @@ struct drm_buddy_block {
>    */
>   struct drm_buddy {
>   	/* Maintain a free list for each order. */
> -	struct rb_root *free_tree;
> +	struct rb_root *clear_tree;
> +	struct rb_root *dirty_tree;

Could potentially make this something like:

struct rb_root free_trees[DIRTY_TREE + 1]

Or define DIRTY_TREE + 1 as the last value in the enum and give it a 
special name. We can then just use the enum as the index directly, which 
might be cleaner?

>   
>   	/*
>   	 * Maintain explicit binary tree(s) to track the allocation of the

