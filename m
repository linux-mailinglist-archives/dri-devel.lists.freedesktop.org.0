Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMybAKA8lGnAAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:02:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685414AA26
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987F310E4BA;
	Tue, 17 Feb 2026 10:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW3TwmHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192F810E4B6;
 Tue, 17 Feb 2026 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771322509; x=1802858509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EZOVFbmqVwpfx8emY+CPAv7obRPc6FIef+3lq8i7RE0=;
 b=AW3TwmHlwgz1VMje5wKCx3yjOx5FebxyZ2zikWw0C/plRudOB0KRG8fW
 8WfuxMnPYD09gHJDxyWC3KYrhi5+UWYRzQmVA9WMAYxQpajsj4YSHzKpF
 m59rPJ17UugrECJNEUhFBvGps7yJqjvyL0/js2NF1wlPfD6gLiJCUJ1OZ
 RnNqxYQv32ZAaDuikhA5OdiE3e7kIcI+EEt35eF4H3tQYHS6vE/D55B/K
 2P+tTYoBitHm+CnzZTn5z1OM5cqYTyBEfUQSNElbOxFp5rv8Eahp0NRKL
 acojWmEcB6vsijXZlzrRtU2Ghxb7A/gZqvnSow5rzTPPHRKFCkhYWU/lq A==;
X-CSE-ConnectionGUID: An61C2isS5+skPGMUpDwSQ==
X-CSE-MsgGUID: ZP5PCi7tQX+azl5ufR7Sxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72454743"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72454743"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 02:01:49 -0800
X-CSE-ConnectionGUID: ye+HiEVnQp+E/joUV8iNgQ==
X-CSE-MsgGUID: +daWLWxIQFK2EfaHWjAHzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="213848019"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 02:01:46 -0800
Message-ID: <1c753753-ced2-41c9-bad1-c9a172003d2f@intel.com>
Date: Tue, 17 Feb 2026 10:01:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Improve offset-aligned allocation
 handling
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20260209083051.13376-1-Arunpravin.PaneerSelvam@amd.com>
 <ce9833ef-8cfa-4b1a-b4d5-eda0158cb19d@intel.com>
 <08987287-ce6a-452f-a1aa-080562afe7bd@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <08987287-ce6a-452f-a1aa-080562afe7bd@amd.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[intel.com:query timed out];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.auld@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[christian.koenig.amd.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2685414AA26
X-Rspamd-Action: no action

On 17/02/2026 06:03, Arunpravin Paneer Selvam wrote:
> Hi Matthew,
> 
> On 2/10/2026 9:56 PM, Matthew Auld wrote:
>> On 09/02/2026 08:30, Arunpravin Paneer Selvam wrote:
>>> Large alignment requests previously forced the buddy allocator to 
>>> search by
>>> alignment order, which often caused higher-order free blocks to be 
>>> split even
>>> when a suitably aligned smaller region already existed within them. 
>>> This led
>>> to excessive fragmentation, especially for workloads requesting small 
>>> sizes
>>> with large alignment constraints.
>>>
>>> This change prioritizes the requested allocation size during the 
>>> search and
>>> uses an augmented RB-tree field (subtree_max_alignment) to 
>>> efficiently locate
>>> free blocks that satisfy both size and offset-alignment requirements. 
>>> As a
>>> result, the allocator can directly select an aligned sub-region without
>>> splitting larger blocks unnecessarily.
>>>
>>> A practical example is the VKCTS test
>>> dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which 
>>> repeatedly
>>> allocates 8 KiB buffers with a 256 KiB alignment. Previously, such 
>>> allocations
>>> caused large blocks to be split aggressively, despite smaller aligned 
>>> regions
>>> being sufficient. With this change, those aligned regions are reused 
>>> directly,
>>> significantly reducing fragmentation.
>>>
>>> This improvement is visible in the amdgpu VRAM buddy allocator state
>>> (/sys/kernel/debug/dri/1/amdgpu_vram_mm). After the change, higher- 
>>> order blocks
>>> are preserved and the number of low-order fragments is substantially 
>>> reduced.
>>>
>>> Before:
>>>    order- 5 free: 1936 MiB, blocks: 15490
>>>    order- 4 free:  967 MiB, blocks: 15486
>>>    order- 3 free:  483 MiB, blocks: 15485
>>>    order- 2 free:  241 MiB, blocks: 15486
>>>    order- 1 free:  241 MiB, blocks: 30948
>>>
>>> After:
>>>    order- 5 free:  493 MiB, blocks:  3941
>>>    order- 4 free:  246 MiB, blocks:  3943
>>>    order- 3 free:  123 MiB, blocks:  4101
>>>    order- 2 free:   61 MiB, blocks:  4101
>>>    order- 1 free:   61 MiB, blocks:  8018
>>>
>>> By avoiding unnecessary splits, this change improves allocator 
>>> efficiency and
>>> helps maintain larger contiguous free regions under heavy offset-aligned
>>> allocation workloads.
>>>
>>> v2:(Matthew)
>>>    - Update augmented information along the path to the inserted node.
>>>
>>> v3:
>>>    - Move the patch to gpu/buddy.c file.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/buddy.c       | 271 +++++++++++++++++++++++++++++++-------
>>>   include/linux/gpu_buddy.h |   2 +
>>>   2 files changed, 228 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
>>> index 603c59a2013a..3a25eed050ba 100644
>>> --- a/drivers/gpu/buddy.c
>>> +++ b/drivers/gpu/buddy.c
>>> @@ -14,6 +14,16 @@
>>>     static struct kmem_cache *slab_blocks;
>>>   +static unsigned int gpu_buddy_block_offset_alignment(struct 
>>> gpu_buddy_block *block)
>>> +{
>>> +    return __ffs(gpu_buddy_block_offset(block));
>>
>> __ffs() will be undefined for offset zero it seems, so might blow up 
>> in some strange way. I guess just return the max possible alignment 
>> here if offset is zero? Also are we meant to use __ffs64() here?
> Yes, I had the same concern about __ffs() being undefined when the 
> offset is zero. My initial thought was to derive the maximum possible 
> alignment from the allocator size using ilog2(mm->size) and return that 
> value for the zero-offset case.
> 
> But, RB_DECLARE_CALLBACKS_MAX() requires the compute callback 
> (gpu_buddy_block_offset_alignment()) to accept only a single struct 
> gpu_buddy_block * argument. It does not provide a mechanism to pass 
> additional context such as the associated struct gpu_buddy *mm. As a 
> result, deriving the alignment from allocator state (e.g., via ilog2(mm- 
>  >size)) is not directly feasible within this callback. When I tested 
> the zero-offset case locally, __ffs() returned 64, which effectively 
> corresponds to the maximum alignment for a u64 offset. Based on that 
> observation, I initially left the __ffs() call unchanged for the zero 
> case as well.
> 
> One possible alternative would be to store a pointer to struct gpu_buddy 
> inside each gpu_buddy_block.
> 
> All other review comments have been addressed, and I will send a v4 once 
> this point is clarified.

Yeah, I was thinking we just return the max theoretical value, so 64, or 
perhaps 64+1. It just needs to be a value that will be larger than any 
other possible alignment, since zero is special. It shouldn't matter if 
that is larger than the actual real max for the region, I think.

if (!offset)
	return 64 + 1;

return __ffs64(offset);

?

> 
> Regards,
> Arun.
>>
>>> +}
>>> +
>>> +RB_DECLARE_CALLBACKS_MAX(static, gpu_buddy_augment_cb,
>>> +             struct gpu_buddy_block, rb,
>>> +             unsigned int, subtree_max_alignment,
>>> +             gpu_buddy_block_offset_alignment);
>>> +
>>>   static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
>>>                              struct gpu_buddy_block *parent,
>>>                              unsigned int order,
>>> @@ -31,6 +41,9 @@ static struct gpu_buddy_block 
>>> *gpu_block_alloc(struct gpu_buddy *mm,
>>>       block->header |= order;
>>>       block->parent = parent;
>>>   +    block->subtree_max_alignment =
>>> +        gpu_buddy_block_offset_alignment(block);
>>> +
>>>       RB_CLEAR_NODE(&block->rb);
>>>         BUG_ON(block->header & GPU_BUDDY_HEADER_UNUSED);
>>> @@ -67,26 +80,42 @@ static bool rbtree_is_empty(struct rb_root *root)
>>>       return RB_EMPTY_ROOT(root);
>>>   }
>>>   -static bool gpu_buddy_block_offset_less(const struct 
>>> gpu_buddy_block *block,
>>> -                    const struct gpu_buddy_block *node)
>>> -{
>>> -    return gpu_buddy_block_offset(block) < 
>>> gpu_buddy_block_offset(node);
>>> -}
>>> -
>>> -static bool rbtree_block_offset_less(struct rb_node *block,
>>> -                     const struct rb_node *node)
>>> -{
>>> -    return gpu_buddy_block_offset_less(rbtree_get_free_block(block),
>>> -                       rbtree_get_free_block(node));
>>> -}
>>> -
>>>   static void rbtree_insert(struct gpu_buddy *mm,
>>>                 struct gpu_buddy_block *block,
>>>                 enum gpu_buddy_free_tree tree)
>>>   {
>>> -    rb_add(&block->rb,
>>> - &mm->free_trees[tree][gpu_buddy_block_order(block)],
>>> -           rbtree_block_offset_less);
>>> +    struct rb_node **link, *parent = NULL;
>>> +    unsigned int block_alignment, order;
>>> +    struct gpu_buddy_block *node;
>>> +    struct rb_root *root;
>>> +
>>> +    order = gpu_buddy_block_order(block);
>>> +    block_alignment = gpu_buddy_block_offset_alignment(block);
>>> +
>>> +    root = &mm->free_trees[tree][order];
>>> +    link = &root->rb_node;
>>> +
>>> +    while (*link) {
>>> +        parent = *link;
>>> +        node = rbtree_get_free_block(parent);
>>> +        /*
>>> +         * Manual augmentation update during insertion traversal. 
>>> Required
>>> +         * because rb_insert_augmented() only calls rotate callback 
>>> during
>>> +         * rotations. This ensures all ancestors on the insertion 
>>> path have
>>> +         * correct subtree_max_alignment values.
>>> +         */
>>> +        if (node->subtree_max_alignment < block_alignment)
>>> +            node->subtree_max_alignment = block_alignment;
>>> +
>>> +        if (gpu_buddy_block_offset(block) < 
>>> gpu_buddy_block_offset(node))
>>> +            link = &parent->rb_left;
>>> +        else
>>> +            link = &parent->rb_right;
>>> +    }
>>> +
>>> +    block->subtree_max_alignment = block_alignment;
>>> +    rb_link_node(&block->rb, parent, link);
>>> +    rb_insert_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>>>   }
>>>     static void rbtree_remove(struct gpu_buddy *mm,
>>> @@ -99,7 +128,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
>>>       tree = get_block_tree(block);
>>>       root = &mm->free_trees[tree][order];
>>>   -    rb_erase(&block->rb, root);
>>> +    rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
>>>       RB_CLEAR_NODE(&block->rb);
>>>   }
>>>   @@ -790,6 +819,132 @@ alloc_from_freetree(struct gpu_buddy *mm,
>>>       return ERR_PTR(err);
>>>   }
>>>   +static bool
>>> +gpu_buddy_can_offset_align(u64 size, u64 min_block_size)
>>> +{
>>> +    return size < min_block_size && is_power_of_2(size);
>>> +}
>>> +
>>> +static bool gpu_buddy_subtree_can_satisfy(struct rb_node *node,
>>> +                      unsigned int alignment)
>>> +{
>>> +    struct gpu_buddy_block *block;
>>> +
>>> +    if (!node)
>>> +        return false;
>>
>> All callers seem to handle null case already, so could potentially 
>> drop this?
>>
>>> +
>>> +    block = rbtree_get_free_block(node);
>>> +    return block->subtree_max_alignment >= alignment;
>>> +}
>>> +
>>> +static struct gpu_buddy_block *
>>> +gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
>>> +                 enum gpu_buddy_free_tree tree,
>>> +                 unsigned int order,
>>> +                 unsigned int tmp,
>>> +                 unsigned int alignment,
>>> +                 unsigned long flags)
>>> +{
>>> +    struct rb_root *root = &mm->free_trees[tree][tmp];
>>> +    struct rb_node *rb = root->rb_node;
>>> +
>>> +    while (rb) {
>>> +        struct gpu_buddy_block *block = rbtree_get_free_block(rb);
>>> +        struct rb_node *left_node = rb->rb_left, *right_node = rb- 
>>> >rb_right;
>>> +
>>> +        if (right_node) {
>>> +            if (gpu_buddy_subtree_can_satisfy(right_node, alignment)) {
>>> +                rb = right_node;
>>> +                continue;
>>> +            }
>>> +        }
>>> +
>>> +        if (gpu_buddy_block_order(block) >= order &&
>>
>> Is this not always true? With that we can drop order, or better yet s/ 
>> tmp/order/ ?
>>
>>> + __ffs(gpu_buddy_block_offset(block)) >= alignment)
>>
>> Same here with undefined offset zero case. I guess also use the helper.
>>
>>> +            return block;
>>> +
>>> +        if (left_node) {
>>> +            if (gpu_buddy_subtree_can_satisfy(left_node, alignment)) {
>>> +                rb = left_node;
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
>>> +static struct gpu_buddy_block *
>>> +gpu_buddy_offset_aligned_allocation(struct gpu_buddy *mm,
>>> +                    u64 size,
>>> +                    u64 min_block_size,
>>> +                    unsigned long flags)
>>> +{
>>> +    struct gpu_buddy_block *block = NULL;
>>> +    unsigned int order, tmp, alignment;
>>> +    struct gpu_buddy_block *buddy;
>>> +    enum gpu_buddy_free_tree tree;
>>> +    unsigned long pages;
>>> +    int err;
>>> +
>>> +    alignment = ilog2(min_block_size);
>>> +    pages = size >> ilog2(mm->chunk_size);
>>> +    order = fls(pages) - 1;
>>> +
>>> +    tree = (flags & GPU_BUDDY_CLEAR_ALLOCATION) ?
>>> +        GPU_BUDDY_CLEAR_TREE : GPU_BUDDY_DIRTY_TREE;
>>> +
>>> +    for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>> +        block = gpu_buddy_find_block_aligned(mm, tree, order,
>>> +                             tmp, alignment, flags);
>>> +        if (!block) {
>>> +            tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
>>> +                GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
>>> +            block = gpu_buddy_find_block_aligned(mm, tree, order,
>>> +                                 tmp, alignment, flags);
>>> +        }
>>> +
>>> +        if (block)
>>> +            break;
>>> +    }
>>> +
>>> +    if (!block)
>>> +        return ERR_PTR(-ENOSPC);
>>> +
>>> +    while (gpu_buddy_block_order(block) > order) {
>>> +        struct gpu_buddy_block *left, *right;
>>> +
>>> +        err = split_block(mm, block);
>>> +        if (unlikely(err))
>>> +            goto err_undo;
>>> +
>>> +        left  = block->left;
>>> +        right = block->right;
>>> +
>>> +        if (__ffs(gpu_buddy_block_offset(right)) >= alignment)
>>
>> Might be better to use the helper for this?
>>
>>> +            block = right;
>>> +        else
>>> +            block = left;
>>> +    }
>>> +
>>> +    return block;
>>> +
>>> +err_undo:
>>> +    /*
>>> +     * We really don't want to leave around a bunch of split blocks, 
>>> since
>>> +     * bigger is better, so make sure we merge everything back 
>>> before we
>>> +     * free the allocated blocks.
>>> +     */
>>> +    buddy = __get_buddy(block);
>>> +    if (buddy &&
>>> +        (gpu_buddy_block_is_free(block) &&
>>> +         gpu_buddy_block_is_free(buddy)))
>>> +        __gpu_buddy_free(mm, block, false);
>>> +    return ERR_PTR(err);
>>> +}
>>> +
>>>   static int __alloc_range(struct gpu_buddy *mm,
>>>                struct list_head *dfs,
>>>                u64 start, u64 size,
>>> @@ -1059,6 +1214,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
>>>   static struct gpu_buddy_block *
>>>   __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>>                u64 start, u64 end,
>>> +             u64 size, u64 min_block_size,
>>>                unsigned int order,
>>>                unsigned long flags)
>>>   {
>>> @@ -1066,6 +1222,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>>           /* Allocate traversing within the range */
>>>           return  __gpu_buddy_alloc_range_bias(mm, start, end,
>>>                                order, flags);
>>> +    else if (size < min_block_size)
>>> +        /* Allocate from an offset-aligned region without size 
>>> rounding */
>>> +        return gpu_buddy_offset_aligned_allocation(mm, size,
>>> +                               min_block_size,
>>> +                               flags);
>>>       else
>>>           /* Allocate from freetree */
>>>           return alloc_from_freetree(mm, order, flags);
>>> @@ -1137,8 +1298,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
>>>       if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
>>>           size = roundup_pow_of_two(size);
>>>           min_block_size = size;
>>> -    /* Align size value to min_block_size */
>>> -    } else if (!IS_ALIGNED(size, min_block_size)) {
>>> +        /*
>>> +         * Normalize the requested size to min_block_size for 
>>> regular allocations.
>>> +         * Offset-aligned allocations intentionally skip size rounding.
>>> +         */
>>> +    } else if (!gpu_buddy_can_offset_align(size, min_block_size)) {
>>>           size = round_up(size, min_block_size);
>>>       }
>>>   @@ -1158,43 +1322,60 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy 
>>> *mm,
>>>       do {
>>>           order = min(order, (unsigned int)fls(pages) - 1);
>>>           BUG_ON(order > mm->max_order);
>>> -        BUG_ON(order < min_order);
>>> +        /*
>>> +         * Regular allocations must not allocate blocks smaller than 
>>> min_block_size.
>>> +         * Offset-aligned allocations deliberately bypass this 
>>> constraint.
>>> +         */
>>> +        BUG_ON(size >= min_block_size && order < min_order);
>>>             do {
>>> +            unsigned int fallback_order;
>>> +
>>>               block = __gpu_buddy_alloc_blocks(mm, start,
>>>                                end,
>>> +                             size,
>>> +                             min_block_size,
>>>                                order,
>>>                                flags);
>>>               if (!IS_ERR(block))
>>>                   break;
>>>   -            if (order-- == min_order) {
>>> -                /* Try allocation through force merge method */
>>> -                if (mm->clear_avail &&
>>> -                    !__force_merge(mm, start, end, min_order)) {
>>> -                    block = __gpu_buddy_alloc_blocks(mm, start,
>>> -                                     end,
>>> -                                     min_order,
>>> -                                     flags);
>>> -                    if (!IS_ERR(block)) {
>>> -                        order = min_order;
>>> -                        break;
>>> -                    }
>>> -                }
>>> +            if (size < min_block_size) {
>>> +                fallback_order = order;
>>> +            } else if (order == min_order) {
>>> +                fallback_order = min_order;
>>> +            } else {
>>> +                order--;
>>> +                continue;
>>> +            }
>>>   -                /*
>>> -                 * Try contiguous block allocation through
>>> -                 * try harder method.
>>> -                 */
>>> -                if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
>>> -                    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
>>> -                    return __alloc_contig_try_harder(mm,
>>> -                                     original_size,
>>> -                                     original_min_size,
>>> -                                     blocks);
>>> -                err = -ENOSPC;
>>> -                goto err_free;
>>> +            /* Try allocation through force merge method */
>>> +            if (mm->clear_avail &&
>>> +                !__force_merge(mm, start, end, fallback_order)) {
>>> +                block = __gpu_buddy_alloc_blocks(mm, start,
>>> +                                 end,
>>> +                                 size,
>>> +                                 min_block_size,
>>> +                                 fallback_order,
>>> +                                 flags);
>>> +                if (!IS_ERR(block)) {
>>> +                    order = fallback_order;
>>> +                    break;
>>> +                }
>>>               }
>>> +
>>> +            /*
>>> +             * Try contiguous block allocation through
>>> +             * try harder method.
>>> +             */
>>> +            if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
>>> +                !(flags & GPU_BUDDY_RANGE_ALLOCATION))
>>> +                return __alloc_contig_try_harder(mm,
>>> +                                 original_size,
>>> +                                 original_min_size,
>>> +                                 blocks);
>>> +            err = -ENOSPC;
>>> +            goto err_free;
>>>           } while (1);
>>>             mark_allocated(mm, block);
>>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>>> index 07ac65db6d2e..7ad817c69ec6 100644
>>> --- a/include/linux/gpu_buddy.h
>>> +++ b/include/linux/gpu_buddy.h
>>> @@ -11,6 +11,7 @@
>>>   #include <linux/slab.h>
>>>   #include <linux/sched.h>
>>>   #include <linux/rbtree.h>
>>> +#include <linux/rbtree_augmented.h>
>>>     #define GPU_BUDDY_RANGE_ALLOCATION        BIT(0)
>>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>> @@ -58,6 +59,7 @@ struct gpu_buddy_block {
>>>       };
>>>         struct list_head tmp_link;
>>> +    unsigned int subtree_max_alignment;
>>>   };
>>>     /* Order-zero must be at least SZ_4K */
>>>
>>> base-commit: 9d757669b2b22cd224c334924f798393ffca537c
>>
> 

