Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAmpCfg7cmnTfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 16:02:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD468440
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 16:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A0110E9D1;
	Thu, 22 Jan 2026 15:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nz9dM7//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3110E9CC;
 Thu, 22 Jan 2026 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769094130; x=1800630130;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ALR8GuadTX3So8VLx4Wdi/iae6jkbUBo1vY7iLVx9+g=;
 b=nz9dM7//MGiuB6ZisDT2cVRGEvJxjaJxZ4LVA9FXqipfV/F3nxvuYnXU
 QQ56zMHUNu5PL585l8RLiBcx2Oza0Imd2/UHmGmkov9VXqt2sUKli45dY
 oEYO9p+T0Xv22nWO6/YZZktLJZSj3lPl+aKO1D7oe3gPILmgKGE1Mugdd
 XIeS3N+4Sl0rJEQJ0gfRvPfWqReXPYjS2BfVn54cseb1w8Jc9CtRegGjA
 8VHdZx0FPz785hjN10Msoxc2YmALdi2FK7CHl+wxrvUkM38Sl75PmFEAU
 ODX22FCLRGi9Zut3eXfB95h7LxKI7zBsHyATT7ZWyseWAbR8m+QVEKNU/ g==;
X-CSE-ConnectionGUID: kXz8rzn2TmaU1nilN5EWYA==
X-CSE-MsgGUID: YTkXiBdIRuGWX1nSCo3Azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69355121"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69355121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:02:10 -0800
X-CSE-ConnectionGUID: iZVwGID0TqWjFX1NVtVw5Q==
X-CSE-MsgGUID: Y2NU/S/RSg6RyIs/5ttuYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211611258"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.59])
 ([10.245.244.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:02:08 -0800
Message-ID: <db877e44-a548-4a25-971b-d9a7729701a4@intel.com>
Date: Thu, 22 Jan 2026 15:02:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/buddy: Optimize large alignment handling to avoid
 unnecessary splits
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20251211122319.2054-1-Arunpravin.PaneerSelvam@amd.com>
 <b2aa28aa-ce9c-4948-9bed-289700f4eb4a@intel.com>
 <b8640bf9-1c00-47da-a659-ce79a7af67e3@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <b8640bf9-1c00-47da-a659-ce79a7af67e3@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B5BD468440
X-Rspamd-Action: no action

On 22/01/2026 14:13, Arunpravin Paneer Selvam wrote:
> 
> On 09/01/26 22:12, Matthew Auld wrote:
>> On 11/12/2025 12:23, Arunpravin Paneer Selvam wrote:
>>> Large alignment requests previously forced the allocator to search by
>>> alignment order, causing large free blocks to be split even when a
>>> smaller aligned range existed within them. This patch switches the
>>> search to prioritize the requested size and uses an augmented RB-tree
>>> field (subtree_max_alignment) to efficiently locate blocks that satisfy
>>> both size and alignment. This prevents unnecessary block splitting and
>>> significantly reduces fragmentation.
>>>
>>> A practical example is the VKCTS test
>>> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which
>>> allocates 8 KiB buffers with a 256 KiB alignment. Previously, these
>>> requests caused the allocator to split large blocks despite having
>>> smaller aligned portions within them that could satisfy the allocation.
>>> The new design now identifies and allocates from these portions,
>>> avoiding unnecessary splitting.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 205 +++++++++++++++++++++++++++++++++---
>>>   include/drm/drm_buddy.h     |   3 +
>>>   2 files changed, 191 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index f2c92902e4a3..f749814bb270 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -23,6 +23,18 @@ static struct kmem_cache *slab_blocks;
>>>   #define for_each_free_tree(tree) \
>>>       for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
>>>   +static unsigned int drm_buddy_min_offset_or_size_order(struct 
>>> drm_buddy_block *block)
>>> +{
>>> +    return min_t(unsigned int,
>>> +             __ffs(drm_buddy_block_offset(block)),
>>> +             drm_buddy_block_order(block));
>>
>> Didn't quite get this bit. Why do we pick the min between the order 
>> and "alignment"? Say we have order zero block but is has 256K addr 
>> alignment this just selects zero? What is the idea here?
> Sorry for the confusion. I mixed up two concepts and I have sent the 
> offset alignment only patch. Please have a look.
>>
>>> +}
>>> +
>>> +RB_DECLARE_CALLBACKS_MAX(static, drm_buddy_augment_cb,
>>> +             struct drm_buddy_block, rb,
>>> +             unsigned int, subtree_max_alignment,
>>> +             drm_buddy_min_offset_or_size_order);
>>> +
>>>   static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>>>                              struct drm_buddy_block *parent,
>>>                              unsigned int order,
>>> @@ -40,6 +52,9 @@ static struct drm_buddy_block 
>>> *drm_block_alloc(struct drm_buddy *mm,
>>>       block->header |= order;
>>>       block->parent = parent;
>>>   +    block->subtree_max_alignment =
>>> +        drm_buddy_min_offset_or_size_order(block);
>>> +
>>>       RB_CLEAR_NODE(&block->rb);
>>>         BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>>> @@ -76,26 +91,32 @@ static bool rbtree_is_empty(struct rb_root *root)
>>>       return RB_EMPTY_ROOT(root);
>>>   }
>>>   -static bool drm_buddy_block_offset_less(const struct 
>>> drm_buddy_block *block,
>>> -                    const struct drm_buddy_block *node)
>>> -{
>>> -    return drm_buddy_block_offset(block) < 
>>> drm_buddy_block_offset(node);
>>> -}
>>> -
>>> -static bool rbtree_block_offset_less(struct rb_node *block,
>>> -                     const struct rb_node *node)
>>> -{
>>> -    return drm_buddy_block_offset_less(rbtree_get_free_block(block),
>>> -                       rbtree_get_free_block(node));
>>> -}
>>> -
>>>   static void rbtree_insert(struct drm_buddy *mm,
>>>                 struct drm_buddy_block *block,
>>>                 enum drm_buddy_free_tree tree)
>>>   {
>>> -    rb_add(&block->rb,
>>> - &mm->free_trees[tree][drm_buddy_block_order(block)],
>>> -           rbtree_block_offset_less);
>>> +    struct rb_node **link, *parent = NULL;
>>> +    struct drm_buddy_block *node;
>>> +    struct rb_root *root;
>>> +    unsigned int order;
>>> +
>>> +    order = drm_buddy_block_order(block);
>>> +
>>> +    root = &mm->free_trees[tree][order];
>>> +    link = &root->rb_node;
>>> +
>>> +    while (*link) {
>>> +        parent = *link;
>>> +        node = rbtree_get_free_block(parent);
>>> +
>>> +        if (drm_buddy_block_offset(block) < 
>>> drm_buddy_block_offset(node))
>>> +            link = &parent->rb_left;
>>> +        else
>>> +            link = &parent->rb_right;
>>
>> Is this correct? From the docs it sounds like we are meant to update 
>> the max alignment for each subtree on the path leading up to the 
>> insertion? It looks like insert_augmentated will only do it if there 
>> is something to be rebalanced.
> AFAIU from the docs, rb_insert_augmented() updates the augmented value 
> (subtree_max_alignment) for all nodes on the insertion path, not only 
> when a rotation happens.

Unless I'm looking in the wrong place, the docs for insert_augmented():

"On insertion, the user must update the augmented information on the 
path leading to the inserted node, then call rb_link_node() as usual and 
rb_insert_augmented() instead of the usual rb_insert_color() call. If 
rb_insert_augmented() rebalances the rbtree, it will callback into a 
user provided function to update the augmented information on the 
affected subtrees."

Plus the example code they give for the augmented case also matches 
this, so pretty sure we need it. See interval_tree_insert [1]. Also if 
that is indeed true, then perhaps something to add to the kunit to catch 
this case.

[1] https://docs.kernel.org/core-api/rbtree.html#sample-usage


>>
>>> +    }
>>> +
>>> +    rb_link_node(&block->rb, parent, link);
>>> +    rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
>>>   }
>>>     static void rbtree_remove(struct drm_buddy *mm,
>>> @@ -108,7 +129,7 @@ static void rbtree_remove(struct drm_buddy *mm,
>>>       tree = get_block_tree(block);
>>>       root = &mm->free_trees[tree][order];
>>>   -    rb_erase(&block->rb, root);
>>> +    rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
>>>       RB_CLEAR_NODE(&block->rb);
>>>   }
>>>   @@ -596,6 +617,88 @@ static bool block_incompatible(struct 
>>> drm_buddy_block *block, unsigned int flags
>>>       return needs_clear != drm_buddy_block_is_clear(block);
>>>   }
>>>   +static bool drm_buddy_subtree_can_satisfy(struct rb_node *node,
>>> +                      unsigned int alignment)
>>> +{
>>> +    struct drm_buddy_block *block;
>>> +
>>> +    if (!node)
>>> +        return false;
>>> +
>>> +    block = rbtree_get_free_block(node);
>>> +    return block->subtree_max_alignment >= alignment;
>>> +}
>>> +
>>> +static struct drm_buddy_block *
>>> +drm_buddy_find_block_aligned(struct drm_buddy *mm,
>>> +                 enum drm_buddy_free_tree tree,
>>> +                 unsigned int order,
>>> +                 unsigned int tmp,
>>> +                 unsigned int alignment,
>>> +                 unsigned long flags)
>>> +{
>>> +    struct rb_root *root = &mm->free_trees[tree][tmp];
>>> +    struct rb_node *rb = root->rb_node;
>>> +
>>> +    /* Try to find a block of the requested size that is already 
>>> aligned */
>>> +    while (rb) {
>>> +        struct drm_buddy_block *block = rbtree_get_free_block(rb);
>>> +        struct rb_node *left_node = rb->rb_left, *right_node = rb- 
>>> >rb_right;
>>> +
>>> +        if (left_node) {
>>> +            if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
>>> +                rb = left_node;
>>> +                continue;
>>> +            }
>>> +        }
>>> +
>>> +        if (drm_buddy_block_order(block) >= order &&
>>> +            __ffs(drm_buddy_block_offset(block)) >= alignment)
>>> +            return block;
>>> +
>>> +        if (right_node) {
>>> +            if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
>>> +                rb = right_node;
>>> +                continue;
>>> +            }
>>> +        }
>>> +
>>> +        break;
>>> +    }
>>> +
>>> +    if (tmp < max(order, alignment))
>>> +        return NULL;
>>> +
>>> +    /* If none found, look for a larger block that can satisfy the 
>>> alignment */
>>
>> What is the idea here? IIUC we are looking at some specific order and 
>> we want some min addr alignment, if the above can't find any subtree 
>> with suitable max alignment then we should bail and try the next 
>> order? Why instead do we do the search again with the same alignment 
>> below?
> 
> Same as above, I mixed up two concepts. Please review v1 of offset 
> aligned allocation patch.
> 
> Regards,
> 
> Arun.
> 
>>
>>> +    rb = root->rb_node;
>>> +    while (rb) {
>>> +        struct drm_buddy_block *block = rbtree_get_free_block(rb);
>>> +        struct rb_node *left_node = rb->rb_left, *right_node = rb- 
>>> >rb_right;
>>> +
>>> +        if (left_node) {
>>> +            if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
>>> +                rb = left_node;
>>> +                continue;
>>> +            }
>>> +        }
>>> +
>>> +        if (drm_buddy_block_order(block) >= max(order, alignment) &&
>>> +            drm_buddy_min_offset_or_size_order(block) >= alignment)
>>> +            return block;
>>> +
>>> +        if (right_node) {
>>> +            if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
>>> +                rb = right_node;
>>> +                continue;
>>> +            }
>>> +        }
>>> +
>>> +        break;
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>>   static struct drm_buddy_block *
>>>   __alloc_range_bias(struct drm_buddy *mm,
>>>              u64 start, u64 end,
>>> @@ -798,6 +901,69 @@ alloc_from_freetree(struct drm_buddy *mm,
>>>       return ERR_PTR(err);
>>>   }
>>>   +static int drm_buddy_offset_aligned_allocation(struct drm_buddy *mm,
>>> +                           u64 size,
>>> +                           u64 min_block_size,
>>> +                           unsigned long flags,
>>> +                           struct list_head *blocks)
>>> +{
>>> +    struct drm_buddy_block *block = NULL;
>>> +    unsigned int order, tmp, alignment;
>>> +    enum drm_buddy_free_tree tree;
>>> +    unsigned long pages;
>>> +
>>> +    alignment = ilog2(min_block_size);
>>> +    pages = size >> ilog2(mm->chunk_size);
>>> +    order = fls(pages) - 1;
>>> +
>>> +    tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
>>> +        DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
>>> +
>>> +    for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>> +        block = drm_buddy_find_block_aligned(mm, tree, order,
>>> +                             tmp, alignment, flags);
>>> +        if (!block) {
>>> +            tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
>>> +                DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
>>> +            block = drm_buddy_find_block_aligned(mm, tree, order,
>>> +                                 tmp, alignment, flags);
>>> +        }
>>> +
>>> +        if (block)
>>> +            break;
>>> +    }
>>> +
>>> +    if (!block)
>>> +        return -ENOSPC;
>>> +
>>> +    while (drm_buddy_block_order(block) > order) {
>>> +        unsigned int child_order = drm_buddy_block_order(block) - 1;
>>> +        struct drm_buddy_block *left, *right;
>>> +        int r;
>>> +
>>> +        r = split_block(mm, block);
>>> +        if (r)
>>> +            return r;
>>> +
>>> +        left  = block->left;
>>> +        right = block->right;
>>> +
>>> +        if (child_order >= alignment)
>>> +            block = right;
>>> +        else
>>> +            block = left;
>>> +    }
>>> +
>>> +    mark_allocated(mm, block);
>>> +    mm->avail -= drm_buddy_block_size(mm, block);
>>> +    if (drm_buddy_block_is_clear(block))
>>> +        mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> +    kmemleak_update_trace(block);
>>> +    list_add_tail(&block->link, blocks);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int __alloc_range(struct drm_buddy *mm,
>>>                struct list_head *dfs,
>>>                u64 start, u64 size,
>>> @@ -1147,6 +1313,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>           min_block_size = size;
>>>       /* Align size value to min_block_size */
>>>       } else if (!IS_ALIGNED(size, min_block_size)) {
>>> +        if (min_block_size > size && is_power_of_2(size))
>>> +            return drm_buddy_offset_aligned_allocation(mm, size,
>>> +                                   min_block_size,
>>> +                                   flags,
>>> +                                   blocks);
>>>           size = round_up(size, min_block_size);
>>>       }
>>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index d7891d08f67a..da6a40fb4763 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -11,6 +11,7 @@
>>>   #include <linux/slab.h>
>>>   #include <linux/sched.h>
>>>   #include <linux/rbtree.h>
>>> +#include <linux/rbtree_augmented.h>
>>>     #include <drm/drm_print.h>
>>>   @@ -60,6 +61,8 @@ struct drm_buddy_block {
>>>       };
>>>         struct list_head tmp_link;
>>> +
>>> +    unsigned int subtree_max_alignment;
>>>   };
>>>     /* Order-zero must be at least SZ_4K */
>>

