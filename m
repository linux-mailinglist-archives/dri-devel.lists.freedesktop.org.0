Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF849B2D9DD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 12:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D2010E6E4;
	Wed, 20 Aug 2025 10:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSLJjM1J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FD610E6E1;
 Wed, 20 Aug 2025 10:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755684884; x=1787220884;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gUEnWJoLqJfU3NCtlqAB2OcvVSydCxGQgG/d0/BcVnQ=;
 b=gSLJjM1JIZsbY23r4bqLUZWp0e5ERUiD++pt0pizZtCCOXotpLn8XSSl
 puGXJ6J2pHNDrn6naAWSa3xqmGH6XrxOQal4kCrw1HYIluC3uXxF5fPMD
 70aeoeA5uo3UyppOwk+vi8lZp0g/U2ERGYZ8zZxoJTcJZjb0f32W0ncJe
 WVh/mCpgXFLGCstjzu0E9x0kiQG92QVPBpfo+F+ZN/Rq2De0b73zAzHYW
 x7ZoNMEgAHt1y9NssZ61yjUyaCQqCcbPDKpAoEMSfmGkuwd3kL1KHQ62D
 YicjXnJIYVng5LXJzMPiZLC0QG+Rmk6yCkNzZPTT30EWUpcgA/r9jnYEk g==;
X-CSE-ConnectionGUID: ROQz60e3S56v1evzd5vW5g==
X-CSE-MsgGUID: BElNEQ/aRjeDPHZ6EmnDPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61761825"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="61761825"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 03:14:43 -0700
X-CSE-ConnectionGUID: lmFgDkrASb2GOr4scN2nRA==
X-CSE-MsgGUID: aXQef7boR3u2SPYTLnZchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="198954539"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.57])
 ([10.245.245.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 03:14:41 -0700
Message-ID: <5961da7c-19a1-46df-862c-dc8ad3133763@intel.com>
Date: Wed, 20 Aug 2025 11:14:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Optimize free block management with RB
 tree
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250724104640.2319-1-Arunpravin.PaneerSelvam@amd.com>
 <868ec7ee-442c-4f78-84a8-0c1f966ecc60@intel.com>
 <0af2a7d9-f5c5-4d82-a631-1c2924a5a35a@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0af2a7d9-f5c5-4d82-a631-1c2924a5a35a@amd.com>
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

On 20/08/2025 08:56, Arunpravin Paneer Selvam wrote:
> Hi Matthew,
> 
> On 8/14/2025 4:15 PM, Matthew Auld wrote:
>> On 24/07/2025 11:46, Arunpravin Paneer Selvam wrote:
>>> Replace the freelist (O(n)) used for free block management with a
>>> red-black tree, providing more efficient O(log n) search, insert,
>>> and delete operations. This improves scalability and performance
>>> when managing large numbers of free blocks per order (e.g., hundreds
>>> or thousands).
>>>
>>> In the VK-CTS memory stress subtest, the buddy manager merges
>>> fragmented memory and inserts freed blocks into the freelist. Since
>>> freelist insertion is O(n), this becomes a bottleneck as fragmentation
>>> increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
>>> with the freelist, compared to just 0.03% with the RB tree
>>> (rbtree_insert.isra.0), despite performing the same sorted insert.
>>>
>>> This also improves performance in heavily fragmented workloads,
>>> such as games or graphics tests that stress memory.
>>
>> Neat. Also please Cc intel-gfx@lists.freedesktop.org and intel- 
>> xe@lists.freedesktop.org on the next revision so our CI can pick this up.
> Sure, I will add on v3.
>>
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 141 +++++++++++++++++++++++-------------
>>>   include/drm/drm_buddy.h     |  39 +++++++++-
>>>   2 files changed, 128 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index a1e652b7631d..19e9773b41be 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -31,6 +31,8 @@ static struct drm_buddy_block 
>>> *drm_block_alloc(struct drm_buddy *mm,
>>>       block->header |= order;
>>>       block->parent = parent;
>>>   +    RB_CLEAR_NODE(&block->rb);
>>> +
>>>       BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
>>>       return block;
>>>   }
>>> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>>>       kmem_cache_free(slab_blocks, block);
>>>   }
>>>   -static void list_insert_sorted(struct drm_buddy *mm,
>>> -                   struct drm_buddy_block *block)
>>> +static void rbtree_insert(struct drm_buddy *mm,
>>> +              struct drm_buddy_block *block)
>>>   {
>>> +    struct rb_root *root = &mm- 
>>> >free_tree[drm_buddy_block_order(block)];
>>> +    struct rb_node **link = &root->rb_node;
>>> +    struct rb_node *parent = NULL;
>>>       struct drm_buddy_block *node;
>>> -    struct list_head *head;
>>> +    u64 offset;
>>> +
>>> +    offset = drm_buddy_block_offset(block);
>>>   -    head = &mm->free_list[drm_buddy_block_order(block)];
>>> -    if (list_empty(head)) {
>>> -        list_add(&block->link, head);
>>> -        return;
>>> +    while (*link) {
>>> +        parent = *link;
>>> +        node = rb_entry(parent, struct drm_buddy_block, rb);
>>> +
>>> +        if (offset < drm_buddy_block_offset(node))
>>> +            link = &parent->rb_left;
>>> +        else
>>> +            link = &parent->rb_right;
>>>       }
>>>   -    list_for_each_entry(node, head, link)
>>> -        if (drm_buddy_block_offset(block) < 
>>> drm_buddy_block_offset(node))
>>> -            break;
>>> +    rb_link_node(&block->rb, parent, link);
>>> +    rb_insert_color(&block->rb, root);
>>> +}
>>> +
>>> +static void rbtree_remove(struct drm_buddy *mm,
>>> +              struct drm_buddy_block *block)
>>> +{
>>> +    struct rb_root *root;
>>>   -    __list_add(&block->link, node->link.prev, &node->link);
>>> +    root = &mm->free_tree[drm_buddy_block_order(block)];
>>> +    rb_erase(&block->rb, root);
>>> +
>>> +    RB_CLEAR_NODE(&block->rb);
>>> +}
>>> +
>>> +static inline struct drm_buddy_block *
>>> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>>> +{
>>> +    struct rb_node *node = rb_last(&mm->free_tree[order]);
>>> +
>>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>>> +}
>>> +
>>> +static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>>> +{
>>> +    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>>>   }
>>>     static void clear_reset(struct drm_buddy_block *block)
>>> @@ -70,12 +102,13 @@ static void mark_cleared(struct drm_buddy_block 
>>> *block)
>>>       block->header |= DRM_BUDDY_HEADER_CLEAR;
>>>   }
>>>   -static void mark_allocated(struct drm_buddy_block *block)
>>> +static void mark_allocated(struct drm_buddy *mm,
>>> +               struct drm_buddy_block *block)
>>>   {
>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>       block->header |= DRM_BUDDY_ALLOCATED;
>>>   -    list_del(&block->link);
>>> +    rbtree_remove(mm, block);
>>>   }
>>>     static void mark_free(struct drm_buddy *mm,
>>> @@ -84,15 +117,16 @@ static void mark_free(struct drm_buddy *mm,
>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>       block->header |= DRM_BUDDY_FREE;
>>>   -    list_insert_sorted(mm, block);
>>> +    rbtree_insert(mm, block);
>>>   }
>>>   -static void mark_split(struct drm_buddy_block *block)
>>> +static void mark_split(struct drm_buddy *mm,
>>> +               struct drm_buddy_block *block)
>>>   {
>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>       block->header |= DRM_BUDDY_SPLIT;
>>>   -    list_del(&block->link);
>>> +    rbtree_remove(mm, block);
>>>   }
>>>     static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>>> @@ -148,7 +182,7 @@ static unsigned int __drm_buddy_free(struct 
>>> drm_buddy *mm,
>>>                   mark_cleared(parent);
>>>           }
>>>   -        list_del(&buddy->link);
>>> +        rbtree_remove(mm, buddy);
>>>           if (force_merge && drm_buddy_block_is_clear(buddy))
>>>               mm->clear_avail -= drm_buddy_block_size(mm, buddy);
>>>   @@ -179,12 +213,17 @@ static int __force_merge(struct drm_buddy *mm,
>>>           return -EINVAL;
>>>         for (i = min_order - 1; i >= 0; i--) {
>>> -        struct drm_buddy_block *block, *prev;
>>> +        struct drm_buddy_block *block, *prev_block, *first_block;
>>> +
>>> +        first_block = rb_entry(rb_first(&mm->free_tree[i]), struct 
>>> drm_buddy_block, rb);
>>>   -        list_for_each_entry_safe_reverse(block, prev, &mm- 
>>> >free_list[i], link) {
>>> +        for_each_rb_entry_reverse_safe(block, prev_block, &mm- 
>>> >free_tree[i], rb) {
>>>               struct drm_buddy_block *buddy;
>>>               u64 block_start, block_end;
>>>   +            if (RB_EMPTY_NODE(&block->rb))
>>> +                break;
>>
>> If we got the block from the rb tree, can it be empty here?
> 
> I saw a crash earlier without this check while running graphics 
> workloads, but it is not happening now. I will
> 
> test with more workloads and remove it if everything looks fine.
> 
>>
>>> +
>>>               if (!block->parent)
>>>                   continue;
>>>   @@ -206,10 +245,14 @@ static int __force_merge(struct drm_buddy *mm,
>>>                * block in the next iteration as we would free the
>>>                * buddy block as part of the free function.
>>>                */
>>> -            if (prev == buddy)
>>> -                prev = list_prev_entry(prev, link);
>>> +            if (prev_block && prev_block == buddy) {
>>> +                if (prev_block != first_block)
>>> +                    prev_block = rb_entry(rb_prev(&prev_block->rb),
>>> +                                  struct drm_buddy_block,
>>> +                                  rb);
>>> +            }
>>>   -            list_del(&block->link);
>>> +            rbtree_remove(mm, block);
>>>               if (drm_buddy_block_is_clear(block))
>>>                   mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>   @@ -258,14 +301,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>> size, u64 chunk_size)
>>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>>   -    mm->free_list = kmalloc_array(mm->max_order + 1,
>>> -                      sizeof(struct list_head),
>>> +    mm->free_tree = kmalloc_array(mm->max_order + 1,
>>> +                      sizeof(struct rb_root),
>>>                         GFP_KERNEL);
>>> -    if (!mm->free_list)
>>> +    if (!mm->free_tree)
>>>           return -ENOMEM;
>>>         for (i = 0; i <= mm->max_order; ++i)
>>> -        INIT_LIST_HEAD(&mm->free_list[i]);
>>> +        mm->free_tree[i] = RB_ROOT;
>>>         mm->n_roots = hweight64(size);
>>>   @@ -273,7 +316,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>> size, u64 chunk_size)
>>>                     sizeof(struct drm_buddy_block *),
>>>                     GFP_KERNEL);
>>>       if (!mm->roots)
>>> -        goto out_free_list;
>>> +        goto out_free_tree;
>>>         offset = 0;
>>>       i = 0;
>>> @@ -312,8 +355,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>> size, u64 chunk_size)
>>>       while (i--)
>>>           drm_block_free(mm, mm->roots[i]);
>>>       kfree(mm->roots);
>>> -out_free_list:
>>> -    kfree(mm->free_list);
>>> +out_free_tree:
>>> +    kfree(mm->free_tree);
>>>       return -ENOMEM;
>>>   }
>>>   EXPORT_SYMBOL(drm_buddy_init);
>>> @@ -323,7 +366,7 @@ EXPORT_SYMBOL(drm_buddy_init);
>>>    *
>>>    * @mm: DRM buddy manager to free
>>>    *
>>> - * Cleanup memory manager resources and the freelist
>>> + * Cleanup memory manager resources and the freetree
>>>    */
>>>   void drm_buddy_fini(struct drm_buddy *mm)
>>>   {
>>> @@ -350,7 +393,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>>       WARN_ON(mm->avail != mm->size);
>>>         kfree(mm->roots);
>>> -    kfree(mm->free_list);
>>> +    kfree(mm->free_tree);
>>>   }
>>>   EXPORT_SYMBOL(drm_buddy_fini);
>>>   @@ -383,7 +426,7 @@ static int split_block(struct drm_buddy *mm,
>>>           clear_reset(block);
>>>       }
>>>   -    mark_split(block);
>>> +    mark_split(mm, block);
>>>         return 0;
>>>   }
>>> @@ -598,7 +641,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int 
>>> order,
>>>       for (i = order; i <= mm->max_order; ++i) {
>>>           struct drm_buddy_block *tmp_block;
>>>   -        list_for_each_entry_reverse(tmp_block, &mm->free_list[i], 
>>> link) {
>>> +        for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
>>>               if (block_incompatible(tmp_block, flags))
>>>                   continue;
>>>   @@ -624,7 +667,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int 
>>> order,
>>>   }
>>>     static struct drm_buddy_block *
>>> -alloc_from_freelist(struct drm_buddy *mm,
>>> +alloc_from_freetree(struct drm_buddy *mm,
>>>               unsigned int order,
>>>               unsigned long flags)
>>>   {
>>> @@ -641,7 +684,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>>               struct drm_buddy_block *tmp_block;
>>>   -            list_for_each_entry_reverse(tmp_block, &mm- 
>>> >free_list[tmp], link) {
>>> +            for_each_rb_entry_reverse(tmp_block, &mm- 
>>> >free_tree[tmp], rb) {
>>>                   if (block_incompatible(tmp_block, flags))
>>>                       continue;
>>>   @@ -657,10 +700,8 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>       if (!block) {
>>>           /* Fallback method */
>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>> -            if (!list_empty(&mm->free_list[tmp])) {
>>> -                block = list_last_entry(&mm->free_list[tmp],
>>> -                            struct drm_buddy_block,
>>> -                            link);
>>> +            if (!rbtree_is_empty(mm, tmp)) {
>>> +                block = rbtree_last_entry(mm, tmp);
>>>                   if (block)
>>>                       break;
>>>               }
>>> @@ -728,7 +769,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>             if (contains(start, end, block_start, block_end)) {
>>>               if (drm_buddy_block_is_free(block)) {
>>> -                mark_allocated(block);
>>> +                mark_allocated(mm, block);
>>>                   total_allocated += drm_buddy_block_size(mm, block);
>>>                   mm->avail -= drm_buddy_block_size(mm, block);
>>>                   if (drm_buddy_block_is_clear(block))
>>> @@ -806,7 +847,6 @@ static int __alloc_contig_try_harder(struct 
>>> drm_buddy *mm,
>>>   {
>>>       u64 rhs_offset, lhs_offset, lhs_size, filled;
>>>       struct drm_buddy_block *block;
>>> -    struct list_head *list;
>>>       LIST_HEAD(blocks_lhs);
>>>       unsigned long pages;
>>>       unsigned int order;
>>> @@ -819,11 +859,10 @@ static int __alloc_contig_try_harder(struct 
>>> drm_buddy *mm,
>>>       if (order == 0)
>>>           return -ENOSPC;
>>>   -    list = &mm->free_list[order];
>>> -    if (list_empty(list))
>>> +    if (rbtree_is_empty(mm, order))
>>>           return -ENOSPC;
>>>   -    list_for_each_entry_reverse(block, list, link) {
>>> +    for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
>>>           /* Allocate blocks traversing RHS */
>>>           rhs_offset = drm_buddy_block_offset(block);
>>>           err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>>> @@ -933,7 +972,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>       list_add(&block->tmp_link, &dfs);
>>>       err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>>>       if (err) {
>>> -        mark_allocated(block);
>>> +        mark_allocated(mm, block);
>>>           mm->avail -= drm_buddy_block_size(mm, block);
>>>           if (drm_buddy_block_is_clear(block))
>>>               mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> @@ -956,8 +995,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>           return  __drm_buddy_alloc_range_bias(mm, start, end,
>>>                                order, flags);
>>>       else
>>> -        /* Allocate from freelist */
>>> -        return alloc_from_freelist(mm, order, flags);
>>> +        /* Allocate from freetree */
>>> +        return alloc_from_freetree(mm, order, flags);
>>>   }
>>>     /**
>>> @@ -974,8 +1013,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>    * alloc_range_bias() called on range limitations, which traverses
>>>    * the tree and returns the desired block.
>>>    *
>>> - * alloc_from_freelist() called when *no* range restrictions
>>> - * are enforced, which picks the block from the freelist.
>>> + * alloc_from_freetree() called when *no* range restrictions
>>> + * are enforced, which picks the block from the freetree.
>>>    *
>>>    * Returns:
>>>    * 0 on success, error code on failure.
>>> @@ -1077,7 +1116,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>               }
>>>           } while (1);
>>>   -        mark_allocated(block);
>>> +        mark_allocated(mm, block);
>>>           mm->avail -= drm_buddy_block_size(mm, block);
>>>           if (drm_buddy_block_is_clear(block))
>>>               mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> @@ -1161,7 +1200,7 @@ void drm_buddy_print(struct drm_buddy *mm, 
>>> struct drm_printer *p)
>>>           struct drm_buddy_block *block;
>>>           u64 count = 0, free;
>>>   -        list_for_each_entry(block, &mm->free_list[order], link) {
>>> +        for_each_rb_entry(block, &mm->free_tree[order], rb) {
>>>               BUG_ON(!drm_buddy_block_is_free(block));
>>>               count++;
>>>           }
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 9689a7c5dd36..a64d108a33b7 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/list.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/sched.h>
>>> +#include <linux/rbtree.h>
>>>     #include <drm/drm_print.h>
>>>   @@ -22,6 +23,41 @@
>>>       start__ >= max__ || size__ > max__ - start__; \
>>>   })
>>>   +/*
>>> + * for_each_rb_entry() - iterate over an RB tree in order
>>> + * @pos:    the struct type * to use as a loop cursor
>>> + * @root:    pointer to struct rb_root to iterate
>>> + * @member:    name of the rb_node field within the struct
>>> + */
>>> +#define for_each_rb_entry(pos, root, member) \
>>> +    for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
>>> +         pos; \
>>> +         pos = rb_entry_safe(rb_next(&(pos)->member), typeof(*pos), 
>>> member))
>>> +
>>> +/*
>>> + * for_each_rb_entry_reverse() - iterate over an RB tree in reverse 
>>> order
>>> + * @pos:    the struct type * to use as a loop cursor
>>> + * @root:    pointer to struct rb_root to iterate
>>> + * @member:    name of the rb_node field within the struct
>>> + */
>>> +#define for_each_rb_entry_reverse(pos, root, member) \
>>> +    for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
>>> +         pos; \
>>> +         pos = rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), 
>>> member))
>>> +
>>> +/**
>>> + * for_each_rb_entry_reverse_safe() - safely iterate over an RB tree 
>>> in reverse order
>>> + * @pos:    the struct type * to use as a loop cursor.
>>> + * @n:        another struct type * to use as temporary storage.
>>> + * @root:    pointer to struct rb_root to iterate.
>>> + * @member:    name of the rb_node field within the struct.
>>> + */
>>> +#define for_each_rb_entry_reverse_safe(pos, n, root, member) \
>>
>> Would it make sense to give these a less generic name? Something like 
>> for_each_rb_free_block_* ?
>>
>> Also should this be exported or rather kept within .c?
> yes, I will change it.
>>
>>> +    for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
>>> +         n = pos ? rb_entry_safe(rb_prev(&(pos)->member), 
>>> typeof(*pos), member) : NULL; \
>>> +         pos; \
>>> +         pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), 
>>> typeof(*pos), member) : NULL)
>>
>>
>>> +
>>>   #define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>>>   #define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>>>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>> @@ -53,6 +89,7 @@ struct drm_buddy_block {
>>>        * a list, if so desired. As soon as the block is freed with
>>>        * drm_buddy_free* ownership is given back to the mm.
>>>        */
>>> +    struct rb_node rb;
>>>       struct list_head link;
>>
>> I think we can be slippery here and make this a union? They should be 
>> mutually exclusive AFAICT?
> 
> AFAIK, we need both, rb_node rb is for handling free blocks and the 
> list_head link for adding the allocated blocks into
> 
> the driver's list.

At a given time I think it is either on the free rb or user block list, 
not both at the same time, given that a block can't be free and 
allocated? Just thinking if there is an easy way to trim the size a bit, 
given that we are adding an entire rb_node, and there can be many of 
these of these blocks around.

> 
>>
>>>       struct list_head tmp_link;
>>
>> Otherwise it should be possible to get rid of this instead, and just 
>> re-use link? Could be done as separate patch, if this makes sense.
> 
> I think we cannot use link here since it is needed to add the allocated 
> blocks to the driver's list and tmp_link is already used in
> 
> alloc_range() and alloc_range_bias().

Yeah, I don't this will work, but union might still be an option instead.

> 
> Regards,
> 
> Arun.
> 
>>
>>>   };
>>> @@ -68,7 +105,7 @@ struct drm_buddy_block {
>>>    */
>>>   struct drm_buddy {
>>>       /* Maintain a free list for each order. */
>>> -    struct list_head *free_list;
>>> +    struct rb_root *free_tree;
>>>         /*
>>>        * Maintain explicit binary tree(s) to track the allocation of the
>>

