Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA211B369F0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3FB10E678;
	Tue, 26 Aug 2025 14:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dW1/GrK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B51710E678;
 Tue, 26 Aug 2025 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756218761; x=1787754761;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V86hg5bYldiZVdR1cabisCNfIJEfLDq82V1MC4p142Y=;
 b=dW1/GrK3G9fcLKYpgDqeQV+/1hsMkxAQQaDxTHK2R5xmnlrw+Mz0tH9Z
 5IRshXQR4uQVODo9VxZqLmGw5pFSDAmhvY+yy3GfLrzff98FAWF0R7DLV
 Z0k2q+xAG0TFe9xxpmT5h8uyn5QDSuz2W/h7mzM5Yg1zw9WS8vzFzbqW5
 AkJdV93RWEgraM2cpRlWQql7o+tswqWH/JrRuzG8ZK/9mieWumgs336S+
 kKD9Bc/6hAMyUtwE/sVLldGv9Es8LOr/usaTuFoAjLlV2vpO4caXyuTBr
 Xz4yktJIYfgY3DZtR3eKRc1yN/ZUOFJE2tbsOd6M+bPbE94ZRMI2fvfaY w==;
X-CSE-ConnectionGUID: e+8aXrgFQZ2iTnFWuVLGVw==
X-CSE-MsgGUID: HFTV+j7iT2+ZidlWxvhqzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="61089907"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61089907"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:32:30 -0700
X-CSE-ConnectionGUID: SfT9sUbhQZ+o4rQ/mdhz5g==
X-CSE-MsgGUID: R1cVcfAbSZyGnKxcVsbo0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174892756"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.228])
 ([10.245.245.228])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 07:32:28 -0700
Message-ID: <9c2736c0-7b82-4e1a-94ee-4575960df82f@intel.com>
Date: Tue, 26 Aug 2025 15:32:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/buddy: Separate clear and dirty free block
 trees
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com
References: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
 <20250821150641.2720-2-Arunpravin.PaneerSelvam@amd.com>
 <feae67f7-288e-4783-a059-b48dfea6e4e1@intel.com>
 <0f2992f6-3124-47db-9ab4-c09fe5e2fba5@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <0f2992f6-3124-47db-9ab4-c09fe5e2fba5@amd.com>
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

On 25/08/2025 12:31, Arunpravin Paneer Selvam wrote:
> 
> On 8/22/2025 5:32 PM, Matthew Auld wrote:
>> On 21/08/2025 16:06, Arunpravin Paneer Selvam wrote:
>>> Maintain two separate RB trees per order - one for clear (zeroed) blocks
>>> and another for dirty (uncleared) blocks. This separation improves
>>> code clarity and makes it more obvious which tree is being searched
>>> during allocation. It also improves scalability and efficiency when
>>> searching for a specific type of block, avoiding unnecessary checks
>>> and making the allocator more predictable under fragmentation.
>>>
>>> The changes have been validated using the existing drm_buddy_test
>>> KUnit test cases, along with selected graphics workloads,
>>> to ensure correctness and avoid regressions.
>>>
>>> v2: Missed adding the suggested-by tag. Added it in v2.
>>> v3(Matthew):
>>>    - Remove the double underscores from the internal functions.
>>>    - Rename the internal functions to have less generic names.
>>>    - Fix the error handling code.
>>>    - Pass tree argument for the tree macro.
>>>    - Use the existing dirty/free bit instead of new tree field.
>>>    - Make free_trees[] instead of clear_tree and dirty_tree for
>>>      more cleaner approach.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 342 ++++++++++++++++++++++--------------
>>>   include/drm/drm_buddy.h     |   8 +-
>>>   2 files changed, 215 insertions(+), 135 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 92226a46cc2c..f57c384889a9 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -14,6 +14,9 @@
>>>     static struct kmem_cache *slab_blocks;
>>>   +#define for_each_free_tree(tree) \
>>> +    for ((tree) = CLEAR_TREE; (tree) < MAX_FREE_TREES; (tree)++)
>>> +
>>>   /*
>>>    * for_each_rb_free_block() - iterate over an RB tree in order
>>>    * @pos:    the struct type * to use as a loop cursor
>>> @@ -78,22 +81,77 @@ static void drm_block_free(struct drm_buddy *mm,
>>>       kmem_cache_free(slab_blocks, block);
>>>   }
>>>   +static inline struct rb_root *
>>> +get_root(struct drm_buddy *mm,
>>> +     unsigned int order,
>>> +     enum free_tree tree)
>>> +{
>>> +    if (tree == CLEAR_TREE)
>>> +        return &mm->free_trees[CLEAR_TREE][order];
>>> +    else
>>> +        return &mm->free_trees[DIRTY_TREE][order];
>>
>> I think we can replace this with something like:
>>
>> return &mm->free_trees[tree][order];
> yes. we can replace with the above.
>>
>>> +}
>>> +
>>> +static inline enum free_tree
>>> +get_tree_for_block(struct drm_buddy_block *block)
>>> +{
>>> +    return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
>>> +}
>>> +
>>> +static inline enum free_tree
>>> +get_tree_for_flags(unsigned long flags)
>>> +{
>>> +    return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : 
>>> DIRTY_TREE;
>>> +}
>>> +
>>> +static inline struct drm_buddy_block *
>>> +rbtree_get_free_block(struct rb_node *node)
>>> +{
>>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>>> +}
>>> +
>>> +static inline struct drm_buddy_block *
>>> +rbtree_prev_free_block(struct rb_node *node)
>>> +{
>>> +    return rbtree_get_free_block(rb_prev(node));
>>> +}
>>> +
>>> +static inline struct drm_buddy_block *
>>> +rbtree_first_free_block(struct rb_root *root)
>>> +{
>>> +    return rbtree_get_free_block(rb_first(root));
>>> +}
>>> +
>>> +static inline struct drm_buddy_block *
>>> +rbtree_last_free_block(struct rb_root *root)
>>> +{
>>> +    return rbtree_get_free_block(rb_last(root));
>>> +}
>>> +
>>> +static inline bool rbtree_is_empty(struct rb_root *root)
>>> +{
>>> +    return RB_EMPTY_ROOT(root);
>>> +}
>>> +
>>>   static void rbtree_insert(struct drm_buddy *mm,
>>> -              struct drm_buddy_block *block)
>>> +              struct drm_buddy_block *block,
>>> +              enum free_tree tree)
>>>   {
>>> -    struct rb_root *root = &mm- 
>>> >free_tree[drm_buddy_block_order(block)];
>>> -    struct rb_node **link = &root->rb_node;
>>> -    struct rb_node *parent = NULL;
>>> +    struct rb_node **link, *parent = NULL;
>>>       struct drm_buddy_block *node;
>>> -    u64 offset;
>>> +    struct rb_root *root;
>>> +    unsigned int order;
>>> +
>>> +    order = drm_buddy_block_order(block);
>>>   -    offset = drm_buddy_block_offset(block);
>>> +    root = get_root(mm, order, tree);
>>> +    link = &root->rb_node;
>>>         while (*link) {
>>>           parent = *link;
>>> -        node = rb_entry(parent, struct drm_buddy_block, rb);
>>> +        node = rbtree_get_free_block(parent);
>>>   -        if (offset < drm_buddy_block_offset(node))
>>> +        if (drm_buddy_block_offset(block) < 
>>> drm_buddy_block_offset(node))
>>>               link = &parent->rb_left;
>>>           else
>>>               link = &parent->rb_right;
>>> @@ -106,27 +164,19 @@ static void rbtree_insert(struct drm_buddy *mm,
>>>   static void rbtree_remove(struct drm_buddy *mm,
>>>                 struct drm_buddy_block *block)
>>>   {
>>> +    unsigned int order = drm_buddy_block_order(block);
>>> +    enum free_tree tree;
>>>       struct rb_root *root;
>>>   -    root = &mm->free_tree[drm_buddy_block_order(block)];
>>> +    tree = drm_buddy_block_is_clear(block) ?
>>> +           CLEAR_TREE : DIRTY_TREE;
>>> +
>>> +    root = get_root(mm, order, tree);
>>>       rb_erase(&block->rb, root);
>>>         RB_CLEAR_NODE(&block->rb);
>>>   }
>>>   -static inline struct drm_buddy_block *
>>> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>>> -{
>>> -    struct rb_node *node = rb_last(&mm->free_tree[order]);
>>> -
>>> -    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>>> -}
>>> -
>>> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>>> -{
>>> -    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>>> -}
>>> -
>>>   static void clear_reset(struct drm_buddy_block *block)
>>>   {
>>>       block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>>> @@ -149,10 +199,14 @@ static void mark_allocated(struct drm_buddy *mm,
>>>   static void mark_free(struct drm_buddy *mm,
>>>                 struct drm_buddy_block *block)
>>>   {
>>> +    enum free_tree tree;
>>> +
>>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>>       block->header |= DRM_BUDDY_FREE;
>>>   -    rbtree_insert(mm, block);
>>> +    tree = get_tree_for_block(block);
>>> +
>>> +    rbtree_insert(mm, block, tree);
>>>   }
>>>     static void mark_split(struct drm_buddy *mm,
>>> @@ -238,6 +292,7 @@ static int __force_merge(struct drm_buddy *mm,
>>>                u64 end,
>>>                unsigned int min_order)
>>>   {
>>> +    enum free_tree tree;
>>>       unsigned int order;
>>>       int i;
>>>   @@ -247,50 +302,49 @@ static int __force_merge(struct drm_buddy *mm,
>>>       if (min_order > mm->max_order)
>>>           return -EINVAL;
>>>   -    for (i = min_order - 1; i >= 0; i--) {
>>> -        struct drm_buddy_block *block, *prev_block, *first_block;
>>> -
>>> -        first_block = rb_entry(rb_first(&mm->free_tree[i]), struct 
>>> drm_buddy_block, rb);
>>> +    for_each_free_tree(tree) {
>>> +        for (i = min_order - 1; i >= 0; i--) {
>>> +            struct rb_root *root = get_root(mm, i, tree);
>>> +            struct drm_buddy_block *block, *prev_block;
>>>   -        for_each_rb_free_block_reverse_safe(block, prev_block, 
>>> &mm->free_tree[i], rb) {
>>> -            struct drm_buddy_block *buddy;
>>> -            u64 block_start, block_end;
>>> +            for_each_rb_free_block_reverse_safe(block, prev_block, 
>>> root, rb) {
>>> +                struct drm_buddy_block *buddy;
>>> +                u64 block_start, block_end;
>>>   -            if (!block->parent)
>>> -                continue;
>>> +                if (!block->parent)
>>> +                    continue;
>>>   -            block_start = drm_buddy_block_offset(block);
>>> -            block_end = block_start + drm_buddy_block_size(mm, 
>>> block) - 1;
>>> +                block_start = drm_buddy_block_offset(block);
>>> +                block_end = block_start + drm_buddy_block_size(mm, 
>>> block) - 1;
>>>   -            if (!contains(start, end, block_start, block_end))
>>> -                continue;
>>> +                if (!contains(start, end, block_start, block_end))
>>> +                    continue;
>>>   -            buddy = __get_buddy(block);
>>> -            if (!drm_buddy_block_is_free(buddy))
>>> -                continue;
>>> +                buddy = __get_buddy(block);
>>> +                if (!drm_buddy_block_is_free(buddy))
>>> +                    continue;
>>>   -            WARN_ON(drm_buddy_block_is_clear(block) ==
>>> -                drm_buddy_block_is_clear(buddy));
>>> +                WARN_ON(drm_buddy_block_is_clear(block) ==
>>> +                    drm_buddy_block_is_clear(buddy));
>>>   -            /*
>>> -             * If the prev block is same as buddy, don't access the
>>> -             * block in the next iteration as we would free the
>>> -             * buddy block as part of the free function.
>>> -             */
>>> -            if (prev_block && prev_block == buddy) {
>>> -                if (prev_block != first_block)
>>> -                    prev_block = rb_entry(rb_prev(&prev_block->rb),
>>> -                                  struct drm_buddy_block,
>>> -                                  rb);
>>> -            }
>>> +                /*
>>> +                 * If the prev block is same as buddy, don't access the
>>> +                 * block in the next iteration as we would free the
>>> +                 * buddy block as part of the free function.
>>> +                 */
>>> +                if (prev_block && prev_block == buddy) {
>>> +                    if (prev_block != rbtree_first_free_block(root))
>>> +                        prev_block = 
>>> rbtree_prev_free_block(&prev_block->rb);
>>> +                }
>>>   -            rbtree_remove(mm, block);
>>> -            if (drm_buddy_block_is_clear(block))
>>> -                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> +                rbtree_remove(mm, block);
>>> +                if (drm_buddy_block_is_clear(block))
>>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>   -            order = __drm_buddy_free(mm, block, true);
>>> -            if (order >= min_order)
>>> -                return 0;
>>> +                order = __drm_buddy_free(mm, block, true);
>>> +                if (order >= min_order)
>>> +                    return 0;
>>> +            }
>>>           }
>>>       }
>>>   @@ -311,7 +365,7 @@ static int __force_merge(struct drm_buddy *mm,
>>>    */
>>>   int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>>   {
>>> -    unsigned int i;
>>> +    unsigned int i, j;
>>>       u64 offset;
>>>         if (size < chunk_size)
>>> @@ -333,14 +387,16 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>> size, u64 chunk_size)
>>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>>   -    mm->free_tree = kmalloc_array(mm->max_order + 1,
>>> -                      sizeof(struct rb_root),
>>> -                      GFP_KERNEL);
>>> -    if (!mm->free_tree)
>>> -        return -ENOMEM;
>>> +    for (i = 0; i < MAX_FREE_TREES; i++) {
>>> +        mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
>>> +                          sizeof(struct rb_root),
>>> +                          GFP_KERNEL);
>>> +        if (!mm->free_trees[i])
>>> +            goto out_free_tree;
>>>   -    for (i = 0; i <= mm->max_order; ++i)
>>> -        mm->free_tree[i] = RB_ROOT;
>>> +        for (j = 0; j <= mm->max_order; ++j)
>>> +            mm->free_trees[i][j] = RB_ROOT;
>>> +    }
>>>         mm->n_roots = hweight64(size);
>>>   @@ -388,7 +444,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>>> size, u64 chunk_size)
>>>           drm_block_free(mm, mm->roots[i]);
>>>       kfree(mm->roots);
>>>   out_free_tree:
>>> -    kfree(mm->free_tree);
>>> +    while (i--)
>>> +        kfree(mm->free_trees[i]);
>>>       return -ENOMEM;
>>>   }
>>>   EXPORT_SYMBOL(drm_buddy_init);
>>> @@ -424,8 +481,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>>         WARN_ON(mm->avail != mm->size);
>>>   +    for (i = 0; i < MAX_FREE_TREES; i++)
>>> +        kfree(mm->free_trees[i]);
>>>       kfree(mm->roots);
>>> -    kfree(mm->free_tree);
>>>   }
>>>   EXPORT_SYMBOL(drm_buddy_fini);
>>>   @@ -449,15 +507,15 @@ static int split_block(struct drm_buddy *mm,
>>>           return -ENOMEM;
>>>       }
>>>   -    mark_free(mm, block->left);
>>> -    mark_free(mm, block->right);
>>> -
>>>       if (drm_buddy_block_is_clear(block)) {
>>>           mark_cleared(block->left);
>>>           mark_cleared(block->right);
>>>           clear_reset(block);
>>>       }
>>>   +    mark_free(mm, block->left);
>>> +    mark_free(mm, block->right);
>>> +
>>>       mark_split(mm, block);
>>>         return 0;
>>> @@ -491,6 +549,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>>>    */
>>>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>>   {
>>> +    enum free_tree src_tree, dst_tree;
>>>       u64 root_size, size, start;
>>>       unsigned int order;
>>>       int i;
>>> @@ -505,19 +564,24 @@ void drm_buddy_reset_clear(struct drm_buddy 
>>> *mm, bool is_clear)
>>>           size -= root_size;
>>>       }
>>>   +    src_tree = is_clear ? DIRTY_TREE : CLEAR_TREE;
>>> +    dst_tree = is_clear ? CLEAR_TREE : DIRTY_TREE;
>>> +
>>>       for (i = 0; i <= mm->max_order; ++i) {
>>> +        struct rb_root *root = get_root(mm, order, src_tree);
>>>           struct drm_buddy_block *block;
>>>   -        for_each_rb_free_block_reverse(block, &mm->free_tree[i], 
>>> rb) {
>>> -            if (is_clear != drm_buddy_block_is_clear(block)) {
>>> -                if (is_clear) {
>>> -                    mark_cleared(block);
>>> -                    mm->clear_avail += drm_buddy_block_size(mm, block);
>>> -                } else {
>>> -                    clear_reset(block);
>>> -                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> -                }
>>> +        for_each_rb_free_block_reverse(block, root, rb) {
>>> +            rbtree_remove(mm, block);
>>> +            if (is_clear) {
>>> +                mark_cleared(block);
>>> +                mm->clear_avail += drm_buddy_block_size(mm, block);
>>> +            } else {
>>> +                clear_reset(block);
>>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>>               }
>>> +
>>> +            rbtree_insert(mm, block, dst_tree);
>>>           }
>>>       }
>>>   }
>>> @@ -707,26 +771,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>>   }
>>>     static struct drm_buddy_block *
>>> -get_maxblock(struct drm_buddy *mm, unsigned int order,
>>> -         unsigned long flags)
>>> +get_maxblock(struct drm_buddy *mm,
>>> +         unsigned int order,
>>> +         enum free_tree tree)
>>>   {
>>>       struct drm_buddy_block *max_block = NULL, *block = NULL;
>>> +    struct rb_root *root;
>>>       unsigned int i;
>>>         for (i = order; i <= mm->max_order; ++i) {
>>> -        struct drm_buddy_block *tmp_block;
>>> -
>>> -        for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[i], 
>>> rb) {
>>> -            if (block_incompatible(tmp_block, flags))
>>> +        root = get_root(mm, i, tree);
>>> +        if (!rbtree_is_empty(root)) {
>>> +            block = rbtree_last_free_block(root);
>>> +            if (!block)
>>>                   continue;
>>> -
>>> -            block = tmp_block;
>>> -            break;
>>>           }
>>>   -        if (!block)
>>> -            continue;
>>> -
>>>           if (!max_block) {
>>>               max_block = block;
>>>               continue;
>>> @@ -747,36 +807,38 @@ alloc_from_freetree(struct drm_buddy *mm,
>>>               unsigned long flags)
>>>   {
>>>       struct drm_buddy_block *block = NULL;
>>> +    struct rb_root *root;
>>> +    enum free_tree tree;
>>>       unsigned int tmp;
>>>       int err;
>>>   +    tree = get_tree_for_flags(flags);
>>> +
>>>       if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>>> -        block = get_maxblock(mm, order, flags);
>>> +        block = get_maxblock(mm, order, tree);
>>>           if (block)
>>>               /* Store the obtained block order */
>>>               tmp = drm_buddy_block_order(block);
>>>       } else {
>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>> -            struct drm_buddy_block *tmp_block;
>>> -
>>> -            for_each_rb_free_block_reverse(tmp_block, &mm- 
>>> >free_tree[tmp], rb) {
>>> -                if (block_incompatible(tmp_block, flags))
>>> -                    continue;
>>> -
>>> -                block = tmp_block;
>>> -                break;
>>> +            /* Get RB tree root for this order and tree */
>>> +            root = get_root(mm, tmp, tree);
>>> +            if (!rbtree_is_empty(root)) {
>>
>> Do we need this check? last_free_block should just return NULL? Or if 
>> this is somehow a cheaper check, maybe we should move it into the 
>> helper instead?
> Not required. last_free_block will return NULL. I will remove this check.
>>
>>> +                block = rbtree_last_free_block(root);
>>> +                if (block)
>>> +                    break;
>>>               }
>>> -
>>> -            if (block)
>>> -                break;
>>>           }
>>>       }
>>>         if (!block) {
>>> -        /* Fallback method */
>>> +        /* Try allocating from the other tree */
>>> +        tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
>>> +
>>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>>> -            if (!rbtree_is_empty(mm, tmp)) {
>>> -                block = rbtree_last_entry(mm, tmp);
>>> +            root = get_root(mm, tmp, tree);
>>> +            if (!rbtree_is_empty(root)) {
>>
>> Here also.
>>
>>> +                block = rbtree_last_free_block(root);
>>>                   if (block)
>>>                       break;
>>>               }
>>> @@ -923,6 +985,7 @@ static int __alloc_contig_try_harder(struct 
>>> drm_buddy *mm,
>>>       u64 rhs_offset, lhs_offset, lhs_size, filled;
>>>       struct drm_buddy_block *block;
>>>       LIST_HEAD(blocks_lhs);
>>> +    enum free_tree tree;
>>>       unsigned long pages;
>>>       unsigned int order;
>>>       u64 modify_size;
>>> @@ -934,34 +997,39 @@ static int __alloc_contig_try_harder(struct 
>>> drm_buddy *mm,
>>>       if (order == 0)
>>>           return -ENOSPC;
>>>   -    if (rbtree_is_empty(mm, order))
>>> +    if (rbtree_is_empty(get_root(mm, order, CLEAR_TREE)) &&
>>> +        rbtree_is_empty(get_root(mm, order, DIRTY_TREE)))
>>>           return -ENOSPC;
>>>   -    for_each_rb_free_block_reverse(block, &mm->free_tree[order], 
>>> rb) {
>>> -        /* Allocate blocks traversing RHS */
>>> -        rhs_offset = drm_buddy_block_offset(block);
>>> -        err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>>> -                           &filled, blocks);
>>> -        if (!err || err != -ENOSPC)
>>> -            return err;
>>> -
>>> -        lhs_size = max((size - filled), min_block_size);
>>> -        if (!IS_ALIGNED(lhs_size, min_block_size))
>>> -            lhs_size = round_up(lhs_size, min_block_size);
>>> -
>>> -        /* Allocate blocks traversing LHS */
>>> -        lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>>> -        err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>>> -                           NULL, &blocks_lhs);
>>> -        if (!err) {
>>> -            list_splice(&blocks_lhs, blocks);
>>> -            return 0;
>>> -        } else if (err != -ENOSPC) {
>>> +    for_each_free_tree(tree) {
>>> +        struct rb_root *root = get_root(mm, order, tree);
>>> +
>>> +        for_each_rb_free_block_reverse(block, root, rb) {
>>> +            /* Allocate blocks traversing RHS */
>>> +            rhs_offset = drm_buddy_block_offset(block);
>>> +            err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>>> +                               &filled, blocks);
>>> +            if (!err || err != -ENOSPC)
>>> +                return err;
>>> +
>>> +            lhs_size = max((size - filled), min_block_size);
>>> +            if (!IS_ALIGNED(lhs_size, min_block_size))
>>> +                lhs_size = round_up(lhs_size, min_block_size);
>>> +
>>> +            /* Allocate blocks traversing LHS */
>>> +            lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>>> +            err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>>> +                               NULL, &blocks_lhs);
>>> +            if (!err) {
>>> +                list_splice(&blocks_lhs, blocks);
>>> +                return 0;
>>> +            } else if (err != -ENOSPC) {
>>> +                drm_buddy_free_list_internal(mm, blocks);
>>> +                return err;
>>> +            }
>>> +            /* Free blocks for the next iteration */
>>>               drm_buddy_free_list_internal(mm, blocks);
>>> -            return err;
>>>           }
>>> -        /* Free blocks for the next iteration */
>>> -        drm_buddy_free_list_internal(mm, blocks);
>>>       }
>>>         return -ENOSPC;
>>> @@ -1266,6 +1334,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
>>>    */
>>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>>>   {
>>> +    enum free_tree tree;
>>>       int order;
>>>         drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>>> %lluMiB, clear_free: %lluMiB\n",
>>> @@ -1273,11 +1342,16 @@ void drm_buddy_print(struct drm_buddy *mm, 
>>> struct drm_printer *p)
>>>         for (order = mm->max_order; order >= 0; order--) {
>>>           struct drm_buddy_block *block;
>>> +        struct rb_root *root;
>>>           u64 count = 0, free;
>>>   -        for_each_rb_free_block(block, &mm->free_tree[order], rb) {
>>> -            BUG_ON(!drm_buddy_block_is_free(block));
>>> -            count++;
>>> +        for_each_free_tree(tree) {
>>> +            root = get_root(mm, order, tree);
>>
>> Hmm, actually maybe this helper should just give the root (or both)? 
>> Seems to be what all users want anyway?
> 
> Most of the time, we just need to root and the functionality determines 
> the tree (for example : rbtree_insert() or rbtree_remove()).
> 
> May be we can remove the get_root() and use &mm->free_trees[tree][order] 
> directly in all the places ?

Yeah, that might be better.

> 
> Regards,
> 
> Arun.
> 
>>
>>> +
>>> +            for_each_rb_free_block(block, root, rb) {
>>> +                BUG_ON(!drm_buddy_block_is_free(block));
>>> +                count++;
>>> +            }
>>>           }
>>>             drm_printf(p, "order-%2d ", order);
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 091823592034..2fc1cc7b78bf 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -14,6 +14,12 @@
>>>     #include <drm/drm_print.h>
>>>   +enum free_tree {
>>> +    CLEAR_TREE = 0,
>>> +    DIRTY_TREE,
>>> +    MAX_FREE_TREES,
>>> +};
>>> +
>>>   #define range_overflows(start, size, max) ({ \
>>>       typeof(start) start__ = (start); \
>>>       typeof(size) size__ = (size); \
>>> @@ -73,7 +79,7 @@ struct drm_buddy_block {
>>>    */
>>>   struct drm_buddy {
>>>       /* Maintain a free list for each order. */
>>> -    struct rb_root *free_tree;
>>> +    struct rb_root *free_trees[MAX_FREE_TREES];
>>>         /*
>>>        * Maintain explicit binary tree(s) to track the allocation of the
>>

