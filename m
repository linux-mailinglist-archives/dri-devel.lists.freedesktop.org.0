Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3AB3EE88
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 21:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C3C10E0A0;
	Mon,  1 Sep 2025 19:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="mIp5z6bC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE40810E0A0;
 Mon,  1 Sep 2025 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OXmQwmuMTAG2HSIdNxmQ9RuY2Q8gE5vO81foFabz8EM=; b=mIp5z6bCmDN8CVf6e95RVanZY3
 3fs7ps5/6g3Kljt72q2L9SLWFPd6uRmqzLSHOVyBQ1XFJeFs7GhbDYSVgbEThdun76IK0wEGA6i1y
 PShFtPw+wCRuzBJKLhbeBjvgHpNEZX3wpKSyd5yrL6QPcJBD2grhKasAogHUNhEGnEvUtEZeIRGT5
 KPigGs+AQXMZS8CRletpvvIge7yfv16jUqGGGJnl8uUX0Knv50WdgYiVM8KBBpE+MvtwPYbwFMIko
 Az15hxI8cb2fpnL8NqUTh78c9T8HuQHBGSgKgAm5BgNk5+VEKgRCh2Q1LjteqHDVotxnchij1EUhK
 AYRGYM8Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1utAPZ-00000003qbD-0LLf; Mon, 01 Sep 2025 19:41:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id EBAB0300342; Mon, 01 Sep 2025 21:41:51 +0200 (CEST)
Date: Mon, 1 Sep 2025 21:41:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: christian.koenig@amd.com, matthew.auld@intel.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, alexander.deucher@amd.com
Subject: Re: [PATCH v5 1/2] drm/buddy: Optimize free block management with RB
 tree
Message-ID: <20250901194151.GJ4067720@noisy.programming.kicks-ass.net>
References: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
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

On Tue, Sep 02, 2025 at 12:26:04AM +0530, Arunpravin Paneer Selvam wrote:
> Replace the freelist (O(n)) used for free block management with a
> red-black tree, providing more efficient O(log n) search, insert,
> and delete operations. This improves scalability and performance
> when managing large numbers of free blocks per order (e.g., hundreds
> or thousands).

Did you consider the interval tree?


> @@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
>  	kmem_cache_free(slab_blocks, block);
>  }
>  
> -static void list_insert_sorted(struct drm_buddy *mm,
> -			       struct drm_buddy_block *block)
> +static void rbtree_insert(struct drm_buddy *mm,
> +			  struct drm_buddy_block *block)
>  {
> +	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
> +	struct rb_node **link = &root->rb_node;
> +	struct rb_node *parent = NULL;
>  	struct drm_buddy_block *node;
> -	struct list_head *head;
> +	u64 offset;
> +
> +	offset = drm_buddy_block_offset(block);
>  
> -	head = &mm->free_list[drm_buddy_block_order(block)];
> -	if (list_empty(head)) {
> -		list_add(&block->link, head);
> -		return;
> +	while (*link) {
> +		parent = *link;
> +		node = rb_entry(parent, struct drm_buddy_block, rb);
> +
> +		if (offset < drm_buddy_block_offset(node))
> +			link = &parent->rb_left;
> +		else
> +			link = &parent->rb_right;
>  	}
>  
> -	list_for_each_entry(node, head, link)
> -		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
> -			break;
> +	rb_link_node(&block->rb, parent, link);
> +	rb_insert_color(&block->rb, root);
> +}

static inline bool __drm_bb_less(const struct drm_buddy_block *a,
				 const struct drm_buddy_block *b)
{
	return drm_buddy_block_offset(a) < drm_buddy_block_offset(b);
}

#define __node_2_drm_bb(node) rb_entry((node), struct drm_buddy_block, rb)

static inline bool rb_drm_bb_less(struct rb_node *a, const struct rb_node *b)
{
	return __drm_bb_less(__node_2_drm_bb(a), __node_2_drm_bb(b));
}

static void rbtree_insert(struct drm_buddy *mm, struct drm_buddy_block *block)
{
	rb_add(block->rb, &mm->free_tree[drm_buddy_block_order(block)], rb_drm_bb_less);
}

> +
> +static void rbtree_remove(struct drm_buddy *mm,
> +			  struct drm_buddy_block *block)
> +{
> +	struct rb_root *root;
> +
> +	root = &mm->free_tree[drm_buddy_block_order(block)];
> +	rb_erase(&block->rb, root);
>  
> -	__list_add(&block->link, node->link.prev, &node->link);
> +	RB_CLEAR_NODE(&block->rb);
> +}
> +
> +static inline struct drm_buddy_block *
> +rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
> +{
> +	struct rb_node *node = rb_last(&mm->free_tree[order]);
> +
> +	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
> +}

rb_add_cached() caches the leftmost entry, if you invert the key, the
last is first.

> diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
> index 8d2ba3749866..17190bb4837c 100644
> --- a/include/linux/rbtree.h
> +++ b/include/linux/rbtree.h
> @@ -79,6 +79,62 @@ static inline void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent
>  	   ____ptr ? rb_entry(____ptr, type, member) : NULL; \
>  	})
>  
> +/**
> + * rbtree_for_each_entry - iterate in-order over rb_root of given type
> + *
> + * @pos:	the 'type *' to use as a loop cursor.
> + * @root:	'rb_root *' of the rbtree.
> + * @member:	the name of the rb_node field within 'type'.
> + */
> +#define rbtree_for_each_entry(pos, root, member) \
> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member); \
> +	     (pos); \
> +	     (pos) = rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member))
> +
> +/**
> + * rbtree_reverse_for_each_entry - iterate in reverse in-order over rb_root
> + * of given type
> + *
> + * @pos:	the 'type *' to use as a loop cursor.
> + * @root:	'rb_root *' of the rbtree.
> + * @member:	the name of the rb_node field within 'type'.
> + */
> +#define rbtree_reverse_for_each_entry(pos, root, member) \
> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member); \
> +	     (pos); \
> +	     (pos) = rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member))
> +
> +/**
> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
> + *
> + * @pos:	the 'type *' to use as a loop cursor
> + * @n:		another 'type *' to use as temporary storage
> + * @root:	'rb_root *' of the rbtree
> + * @member:	the name of the rb_node field within 'type'
> + */
> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
> +	     (pos); \
> +	     (pos) = (n), \
> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
> +
> +/**
> + * rbtree_reverse_for_each_entry_safe - iterate in reverse in-order over rb_root
> + * safe against removal
> + *
> + * @pos:	the struct type * to use as a loop cursor.
> + * @n:		another struct type * to use as temporary storage.
> + * @root:	pointer to struct rb_root to iterate.
> + * @member:	name of the rb_node field within the struct.
> + */
> +#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
> +	     (pos); \
> +	     (pos) = (n), \
> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)
> +

Not really a fan of these. That's typically a sign you're doing it
wrong. Full tree iteration is actually slower than linked list.
