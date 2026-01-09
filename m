Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A9D0B51A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501010E912;
	Fri,  9 Jan 2026 16:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdbkAvfz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174CB10E910;
 Fri,  9 Jan 2026 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767976936; x=1799512936;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0jjufuSgUGdcBWU99CGbO/ni1CnXtJoDNBcE6WTvAvA=;
 b=ZdbkAvfzlD0Eg3D9TAEwpIKFMjUVcwSqL5liDjLaVp8h8vFdfwE43l+Q
 r2BogF4BThfLAvdj4BEz4sTo0dVAdmf+TNOL3M2nU9o7x3gOfPiwjRj+2
 /AruLzCQP9vcdbyTQO+STEcqWXt3WpgdgLxwt4KBOpMHbBoEavO4xujlI
 FSUddUgI40E0OBJlJk7q2R9CKEIDAW8jAmrxqobC/C90mQksvYBFU1uQf
 e/dlmQ22TbqG17fyh0oUrHi4ZruXrm3JIklDRk6ghNVsZ7xi/aCs3DMhW
 DHAPwQQI3j8SsVqIES+BNdWBTQRVKjMG0uMz4I7WuBUyAnd5Q+xj7Htk9 g==;
X-CSE-ConnectionGUID: eQ8D0Ji3SHOjXKdohKhVbA==
X-CSE-MsgGUID: Dmeua9XVRJ67qZIcSg9asg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69517847"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="69517847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:42:15 -0800
X-CSE-ConnectionGUID: Usj9Z4mCTO2SN271sYyxQQ==
X-CSE-MsgGUID: Ss/XKTXjQLe0QXYrelNlxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203427027"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.142])
 ([10.245.244.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 08:42:13 -0800
Message-ID: <b2aa28aa-ce9c-4948-9bed-289700f4eb4a@intel.com>
Date: Fri, 9 Jan 2026 16:42:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/buddy: Optimize large alignment handling to avoid
 unnecessary splits
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20251211122319.2054-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251211122319.2054-1-Arunpravin.PaneerSelvam@amd.com>
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

On 11/12/2025 12:23, Arunpravin Paneer Selvam wrote:
> Large alignment requests previously forced the allocator to search by
> alignment order, causing large free blocks to be split even when a
> smaller aligned range existed within them. This patch switches the
> search to prioritize the requested size and uses an augmented RB-tree
> field (subtree_max_alignment) to efficiently locate blocks that satisfy
> both size and alignment. This prevents unnecessary block splitting and
> significantly reduces fragmentation.
> 
> A practical example is the VKCTS test
> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which
> allocates 8 KiB buffers with a 256 KiB alignment. Previously, these
> requests caused the allocator to split large blocks despite having
> smaller aligned portions within them that could satisfy the allocation.
> The new design now identifies and allocates from these portions,
> avoiding unnecessary splitting.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 205 +++++++++++++++++++++++++++++++++---
>   include/drm/drm_buddy.h     |   3 +
>   2 files changed, 191 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index f2c92902e4a3..f749814bb270 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -23,6 +23,18 @@ static struct kmem_cache *slab_blocks;
>   #define for_each_free_tree(tree) \
>   	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
>   
> +static unsigned int drm_buddy_min_offset_or_size_order(struct drm_buddy_block *block)
> +{
> +	return min_t(unsigned int,
> +		     __ffs(drm_buddy_block_offset(block)),
> +		     drm_buddy_block_order(block));

Didn't quite get this bit. Why do we pick the min between the order and 
"alignment"? Say we have order zero block but is has 256K addr alignment 
this just selects zero? What is the idea here?

> +}
> +
> +RB_DECLARE_CALLBACKS_MAX(static, drm_buddy_augment_cb,
> +			 struct drm_buddy_block, rb,
> +			 unsigned int, subtree_max_alignment,
> +			 drm_buddy_min_offset_or_size_order);
> +
>   static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>   					       struct drm_buddy_block *parent,
>   					       unsigned int order,
> @@ -40,6 +52,9 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>   	block->header |= order;
>   	block->parent = parent;
>   
> +	block->subtree_max_alignment =
> +		drm_buddy_min_offset_or_size_order(block);
> +
>   	RB_CLEAR_NODE(&block->rb);
>   
>   	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
> @@ -76,26 +91,32 @@ static bool rbtree_is_empty(struct rb_root *root)
>   	return RB_EMPTY_ROOT(root);
>   }
>   
> -static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
> -					const struct drm_buddy_block *node)
> -{
> -	return drm_buddy_block_offset(block) < drm_buddy_block_offset(node);
> -}
> -
> -static bool rbtree_block_offset_less(struct rb_node *block,
> -				     const struct rb_node *node)
> -{
> -	return drm_buddy_block_offset_less(rbtree_get_free_block(block),
> -					   rbtree_get_free_block(node));
> -}
> -
>   static void rbtree_insert(struct drm_buddy *mm,
>   			  struct drm_buddy_block *block,
>   			  enum drm_buddy_free_tree tree)
>   {
> -	rb_add(&block->rb,
> -	       &mm->free_trees[tree][drm_buddy_block_order(block)],
> -	       rbtree_block_offset_less);
> +	struct rb_node **link, *parent = NULL;
> +	struct drm_buddy_block *node;
> +	struct rb_root *root;
> +	unsigned int order;
> +
> +	order = drm_buddy_block_order(block);
> +
> +	root = &mm->free_trees[tree][order];
> +	link = &root->rb_node;
> +
> +	while (*link) {
> +		parent = *link;
> +		node = rbtree_get_free_block(parent);
> +
> +		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
> +			link = &parent->rb_left;
> +		else
> +			link = &parent->rb_right;

Is this correct? From the docs it sounds like we are meant to update the 
max alignment for each subtree on the path leading up to the insertion? 
It looks like insert_augmentated will only do it if there is something 
to be rebalanced.

> +	}
> +
> +	rb_link_node(&block->rb, parent, link);
> +	rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
>   }
>   
>   static void rbtree_remove(struct drm_buddy *mm,
> @@ -108,7 +129,7 @@ static void rbtree_remove(struct drm_buddy *mm,
>   	tree = get_block_tree(block);
>   	root = &mm->free_trees[tree][order];
>   
> -	rb_erase(&block->rb, root);
> +	rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
>   	RB_CLEAR_NODE(&block->rb);
>   }
>   
> @@ -596,6 +617,88 @@ static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags
>   	return needs_clear != drm_buddy_block_is_clear(block);
>   }
>   
> +static bool drm_buddy_subtree_can_satisfy(struct rb_node *node,
> +					  unsigned int alignment)
> +{
> +	struct drm_buddy_block *block;
> +
> +	if (!node)
> +		return false;
> +
> +	block = rbtree_get_free_block(node);
> +	return block->subtree_max_alignment >= alignment;
> +}
> +
> +static struct drm_buddy_block *
> +drm_buddy_find_block_aligned(struct drm_buddy *mm,
> +			     enum drm_buddy_free_tree tree,
> +			     unsigned int order,
> +			     unsigned int tmp,
> +			     unsigned int alignment,
> +			     unsigned long flags)
> +{
> +	struct rb_root *root = &mm->free_trees[tree][tmp];
> +	struct rb_node *rb = root->rb_node;
> +
> +	/* Try to find a block of the requested size that is already aligned */
> +	while (rb) {
> +		struct drm_buddy_block *block = rbtree_get_free_block(rb);
> +		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
> +
> +		if (left_node) {
> +			if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
> +				rb = left_node;
> +				continue;
> +			}
> +		}
> +
> +		if (drm_buddy_block_order(block) >= order &&
> +		    __ffs(drm_buddy_block_offset(block)) >= alignment)
> +			return block;
> +
> +		if (right_node) {
> +			if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
> +				rb = right_node;
> +				continue;
> +			}
> +		}
> +
> +		break;
> +	}
> +
> +	if (tmp < max(order, alignment))
> +		return NULL;
> +
> +	/* If none found, look for a larger block that can satisfy the alignment */

What is the idea here? IIUC we are looking at some specific order and we 
want some min addr alignment, if the above can't find any subtree with 
suitable max alignment then we should bail and try the next order? Why 
instead do we do the search again with the same alignment below?

> +	rb = root->rb_node;
> +	while (rb) {
> +		struct drm_buddy_block *block = rbtree_get_free_block(rb);
> +		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
> +
> +		if (left_node) {
> +			if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
> +				rb = left_node;
> +				continue;
> +			}
> +		}
> +
> +		if (drm_buddy_block_order(block) >= max(order, alignment) &&
> +		    drm_buddy_min_offset_or_size_order(block) >= alignment)
> +			return block;
> +
> +		if (right_node) {
> +			if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
> +				rb = right_node;
> +				continue;
> +			}
> +		}
> +
> +		break;
> +	}
> +
> +	return NULL;
> +}
> +
>   static struct drm_buddy_block *
>   __alloc_range_bias(struct drm_buddy *mm,
>   		   u64 start, u64 end,
> @@ -798,6 +901,69 @@ alloc_from_freetree(struct drm_buddy *mm,
>   	return ERR_PTR(err);
>   }
>   
> +static int drm_buddy_offset_aligned_allocation(struct drm_buddy *mm,
> +					       u64 size,
> +					       u64 min_block_size,
> +					       unsigned long flags,
> +					       struct list_head *blocks)
> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int order, tmp, alignment;
> +	enum drm_buddy_free_tree tree;
> +	unsigned long pages;
> +
> +	alignment = ilog2(min_block_size);
> +	pages = size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +
> +	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
> +		DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
> +
> +	for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +		block = drm_buddy_find_block_aligned(mm, tree, order,
> +						     tmp, alignment, flags);
> +		if (!block) {
> +			tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
> +				DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
> +			block = drm_buddy_find_block_aligned(mm, tree, order,
> +							     tmp, alignment, flags);
> +		}
> +
> +		if (block)
> +			break;
> +	}
> +
> +	if (!block)
> +		return -ENOSPC;
> +
> +	while (drm_buddy_block_order(block) > order) {
> +		unsigned int child_order = drm_buddy_block_order(block) - 1;
> +		struct drm_buddy_block *left, *right;
> +		int r;
> +
> +		r = split_block(mm, block);
> +		if (r)
> +			return r;
> +
> +		left  = block->left;
> +		right = block->right;
> +
> +		if (child_order >= alignment)
> +			block = right;
> +		else
> +			block = left;
> +	}
> +
> +	mark_allocated(mm, block);
> +	mm->avail -= drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail -= drm_buddy_block_size(mm, block);
> +	kmemleak_update_trace(block);
> +	list_add_tail(&block->link, blocks);
> +
> +	return 0;
> +}
> +
>   static int __alloc_range(struct drm_buddy *mm,
>   			 struct list_head *dfs,
>   			 u64 start, u64 size,
> @@ -1147,6 +1313,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		min_block_size = size;
>   	/* Align size value to min_block_size */
>   	} else if (!IS_ALIGNED(size, min_block_size)) {
> +		if (min_block_size > size && is_power_of_2(size))
> +			return drm_buddy_offset_aligned_allocation(mm, size,
> +								   min_block_size,
> +								   flags,
> +								   blocks);
>   		size = round_up(size, min_block_size);
>   	}
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index d7891d08f67a..da6a40fb4763 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -11,6 +11,7 @@
>   #include <linux/slab.h>
>   #include <linux/sched.h>
>   #include <linux/rbtree.h>
> +#include <linux/rbtree_augmented.h>
>   
>   #include <drm/drm_print.h>
>   
> @@ -60,6 +61,8 @@ struct drm_buddy_block {
>   	};
>   
>   	struct list_head tmp_link;
> +
> +	unsigned int subtree_max_alignment;
>   };
>   
>   /* Order-zero must be at least SZ_4K */

