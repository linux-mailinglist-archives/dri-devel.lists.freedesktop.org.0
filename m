Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F461DA42A
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 23:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0812E891FA;
	Tue, 19 May 2020 21:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAB0891FA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 21:56:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21233878-1500050 for multiple; Tue, 19 May 2020 22:55:58 +0100
MIME-Version: 1.0
In-Reply-To: <20200519084436.91718-2-nirmoy.das@amd.com>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
 <20200519084436.91718-2-nirmoy.das@amd.com>
Subject: Re: [PATCH 2/2] drm/mm: improve rb_hole_addr rbtree search
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158992535712.8153.7425446771660817226@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 19 May 2020 22:55:57 +0100
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com,
 nirmoy.aiemd@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Nirmoy Das (2020-05-19 09:44:36)
> Userspace can still abuse alignment while allocating buffer object
> to slow down rb_hole_addr rbtree search. This patch improves search
> in fragmented rb_hole_addr rbtree by storing maximum subtree hole
> alignment and use that to skip a complete subtree if that subtree
> can not fit a (size + alignment) request.
> 
> With this patch applied, 50k bo allocs of size 4k and alignment 9k
> took ~0.24 sec on amdgpu, compared to  27 sec without it.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/drm_mm.c | 66 ++++++++++++++++++++++++++++++++++------
>  include/drm/drm_mm.h     |  1 +
>  2 files changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 91e90c635e05..1af0a211b660 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -212,8 +212,11 @@ static void drm_mm_interval_tree_add_node(struct drm_mm_node *hole_node,
>                                    &drm_mm_interval_tree_augment);
>  }
>  
> +#define DRM_MM_ALIGN_SHIFT 6
>  #define HOLE_SIZE(NODE) ((NODE)->hole_size)
>  #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
> +#define HOLE_SIZE_ALIGN(NODE) ((NODE->hole_size << DRM_MM_ALIGN_SHIFT) | \
> +                              ffs(HOLE_ADDR(NODE)))
>  
>  static u64 rb_to_hole_size(struct rb_node *rb)
>  {
> @@ -241,6 +244,33 @@ static void insert_hole_size(struct rb_root_cached *root,
>         rb_insert_color_cached(&node->rb_hole_size, root, first);
>  }
>  
> +static inline bool
> +augment_callbacks_compute_max_hole_align(struct drm_mm_node *node, bool exit)
> +{
> +       struct drm_mm_node *child;
> +       u64 max = HOLE_SIZE_ALIGN(node);
> +
> +       if (node->rb_hole_addr.rb_left) {
> +               child = rb_entry(node->rb_hole_addr.rb_left, struct drm_mm_node,
> +                                rb_hole_addr);
> +               if (child->subtree_max_hole_align > max)
> +                       max = child->subtree_max_hole_align;
> +       }
> +
> +       if (node->rb_hole_addr.rb_right) {
> +               child = rb_entry(node->rb_hole_addr.rb_right,
> +                                struct drm_mm_node, rb_hole_addr);
> +               if (child->subtree_max_hole_align > max)
> +                       max = child->subtree_max_hole_align;
> +       }
> +
> +       if (exit && node->subtree_max_hole_align == max)
> +               return true;
> +
> +       node->subtree_max_hole_align = max;
> +       return false;
> +}
> +
>  static inline bool
>  augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
>  {
> @@ -271,10 +301,14 @@ augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
>  static inline void
>  augment_callbacks_propagate(struct rb_node *rb, struct rb_node *stop)
>  {
> +       bool compute_max_hole, compute_max_hole_align;
> +
>         while (rb != stop) {
>                 struct drm_mm_node *node = rb_entry(rb,  struct drm_mm_node,
>                                                     rb_hole_addr);
> -               if (augment_callbacks_compute_max_hole(node, true))
> +               compute_max_hole = augment_callbacks_compute_max_hole(node, true);
> +               compute_max_hole_align = augment_callbacks_compute_max_hole_align(node, true);
> +               if (compute_max_hole && compute_max_hole_align)
>                         break;
>  
>                 rb = rb_parent(&node->rb_hole_addr);
> @@ -290,6 +324,7 @@ augment_callbacks_copy(struct rb_node *rb_old, struct rb_node *rb_new)
>                                            rb_hole_addr);
>  
>         new->subtree_max_hole = old->subtree_max_hole;
> +       new->subtree_max_hole_align = old->subtree_max_hole_align;
>  }
>  
>  static void
> @@ -301,7 +336,9 @@ augment_callbacks_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
>                                            rb_hole_addr);
>  
>         new->subtree_max_hole = old->subtree_max_hole;
> +       new->subtree_max_hole_align = old->subtree_max_hole_align;
>         augment_callbacks_compute_max_hole(old, false);
> +       augment_callbacks_compute_max_hole_align(old, false);
>  }
>  
>  static const struct rb_augment_callbacks augment_callbacks = {
> @@ -313,7 +350,9 @@ static const struct rb_augment_callbacks augment_callbacks = {
>  static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
>  {
>         struct rb_node **link = &root->rb_node, *rb_parent = NULL;
> -       u64 start = HOLE_ADDR(node), subtree_max_hole = node->subtree_max_hole;
> +       u64 start = HOLE_ADDR(node);
> +       u64 subtree_max_hole = node->subtree_max_hole;
> +       u64 subtree_max_hole_align = node->subtree_max_hole_align;
>         struct drm_mm_node *parent;
>  
>         while (*link) {
> @@ -322,6 +361,9 @@ static void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
>                 if (parent->subtree_max_hole < subtree_max_hole)
>                         parent->subtree_max_hole = subtree_max_hole;
>  
> +               if (parent->subtree_max_hole_align < subtree_max_hole_align)
> +                       parent->subtree_max_hole_align = subtree_max_hole_align;
> +
>                 if (start < HOLE_ADDR(parent))
>                         link = &parent->rb_hole_addr.rb_left;
>                 else
> @@ -339,6 +381,7 @@ static void add_hole(struct drm_mm_node *node)
>         node->hole_size =
>                 __drm_mm_hole_node_end(node) - __drm_mm_hole_node_start(node);
>         node->subtree_max_hole = node->hole_size;
> +       node->subtree_max_hole_align = HOLE_SIZE_ALIGN(node);
>         DRM_MM_BUG_ON(!drm_mm_hole_follows(node));
>  
>         insert_hole_size(&mm->holes_size, node);
> @@ -355,8 +398,10 @@ static void rm_hole(struct drm_mm_node *node)
>         rb_erase_cached(&node->rb_hole_size, &node->mm->holes_size);
>         rb_erase_augmented(&node->rb_hole_addr, &node->mm->holes_addr,
>                            &augment_callbacks);
> +
>         node->hole_size = 0;
>         node->subtree_max_hole = 0;
> +       node->subtree_max_hole_align = 0;
>  
>         DRM_MM_BUG_ON(drm_mm_hole_follows(node));
>  }
> @@ -458,10 +503,11 @@ first_hole(struct drm_mm *mm,
>   * else return parent of @entry
>   */
>  static struct drm_mm_node *
> -next_hole_high_addr(struct drm_mm_node *entry, u64 size)
> +next_hole_high_addr(struct drm_mm_node *entry, u64 size, u64 alignment)
>  {
>         struct rb_node *rb_node, *left_rb_node, *parent_rb_node;
>         struct drm_mm_node *left_node;
> +       u64 req_align = (size + alignment) << DRM_MM_ALIGN_SHIFT;
>  
>         if (!entry)
>                 return NULL;
> @@ -473,6 +519,7 @@ next_hole_high_addr(struct drm_mm_node *entry, u64 size)
>                 left_node = rb_entry(left_rb_node,
>                                      struct drm_mm_node, rb_hole_addr);
>                 if ((left_node->subtree_max_hole < size ||
> +                    left_node->subtree_max_hole_align < req_align ||
>                      entry->size == entry->subtree_max_hole) &&
>                     parent_rb_node && parent_rb_node->rb_left != rb_node)
>                         return rb_hole_addr_to_node(parent_rb_node);
> @@ -498,10 +545,11 @@ next_hole_high_addr(struct drm_mm_node *entry, u64 size)
>   * else return parent of @entry
>   */
>  static struct drm_mm_node *
> -next_hole_low_addr(struct drm_mm_node *entry, u64 size)
> +next_hole_low_addr(struct drm_mm_node *entry, u64 size, u64 alignment)
>  {
>         struct rb_node *rb_node, *right_rb_node, *parent_rb_node;
>         struct drm_mm_node *right_node;
> +       u64 req_align = (size + alignment) << DRM_MM_ALIGN_SHIFT;
>  
>         if (!entry)
>                 return NULL;
> @@ -513,6 +561,7 @@ next_hole_low_addr(struct drm_mm_node *entry, u64 size)
>                 right_node = rb_entry(right_rb_node,
>                                       struct drm_mm_node, rb_hole_addr);
>                 if ((right_node->subtree_max_hole < size ||
> +                    right_node->subtree_max_hole_align < req_align ||
>                      entry->size == entry->subtree_max_hole) &&
>                     parent_rb_node && parent_rb_node->rb_right != rb_node)
>                         return rb_hole_addr_to_node(parent_rb_node);
> @@ -524,7 +573,7 @@ next_hole_low_addr(struct drm_mm_node *entry, u64 size)
>  static struct drm_mm_node *
>  next_hole(struct drm_mm *mm,
>           struct drm_mm_node *node,
> -         u64 size,
> +         u64 size, u64 alignment,
>           enum drm_mm_insert_mode mode)
>  {
>         switch (mode) {
> @@ -533,10 +582,10 @@ next_hole(struct drm_mm *mm,
>                 return rb_hole_size_to_node(rb_prev(&node->rb_hole_size));
>  
>         case DRM_MM_INSERT_LOW:
> -               return next_hole_low_addr(node, size);
> +               return next_hole_low_addr(node, size, alignment);
>  
>         case DRM_MM_INSERT_HIGH:
> -               return next_hole_high_addr(node, size);
> +               return next_hole_high_addr(node, size, alignment);

Our test case is of course hitting DRM_MM_INSERT_BEST so shows no
benefit. Though I do have an open-coded search to avoid the O(N^2)
behaviour that just ascends the size rbtree until it is happy (rather
than looking at all nodes within a size).

Searching top-down/bottom-up does have its merits though, so if with
this rbtree it's always quicker than best...
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
