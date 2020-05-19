Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944791DA4AC
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 00:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8606E395;
	Tue, 19 May 2020 22:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397426E395
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:40:39 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21234098-1500050 for multiple; Tue, 19 May 2020 23:40:36 +0100
MIME-Version: 1.0
In-Reply-To: <20200519084436.91718-1-nirmoy.das@amd.com>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/mm: expand rb_hole_addr augmented callbacks
Message-ID: <158992803505.6082.11680950778614479454@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 19 May 2020 23:40:35 +0100
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

Quoting Nirmoy Das (2020-05-19 09:44:35)
> Expand RB_DECLARE_CALLBACKS_MAX so that it is possible to store
> extra value(max hole alignment) in the rb_hole_addr augmented rbtree.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/drm_mm.c | 72 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index f4ca1ff80af9..91e90c635e05 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
> @@ -241,9 +241,74 @@ static void insert_hole_size(struct rb_root_cached *root,
>         rb_insert_color_cached(&node->rb_hole_size, root, first);
>  }
> 
> -RB_DECLARE_CALLBACKS_MAX(static, augment_callbacks,
> -                        struct drm_mm_node, rb_hole_addr,
> -                        u64, subtree_max_hole, HOLE_SIZE)
> +static inline bool
> +augment_callbacks_compute_max_hole(struct drm_mm_node *node, bool exit)
> +{
> +       struct drm_mm_node *child;
> +       u64 max = HOLE_SIZE(node);
> +
> +       if (node->rb_hole_addr.rb_left) {
> +               child = rb_entry(node->rb_hole_addr.rb_left, struct drm_mm_node,
> +                                rb_hole_addr);

We repeat rb_entry a lot. There's rb_hole_addr_to_node() which is
slightly more concise, but uses the _safe variant. Though you could

	child = rb_hole_addr_to_node(node->rb_hole_addr.rb_left);
	if (child && child->subtree_max_hole > max)
		max = child->subtree_max_hole;

which the compiler should generate equivalent code for.

But do have a think of a suitable name for a helper to tidy up all the
rb_entries that are overflowing 80cols.

> +               if (child->subtree_max_hole > max)
> +                       max = child->subtree_max_hole;
> +       }
> +
> +       if (node->rb_hole_addr.rb_right) {
> +               child = rb_entry(node->rb_hole_addr.rb_right,
> +                                struct drm_mm_node, rb_hole_addr);
> +               if (child->subtree_max_hole > max)
> +                       max = child->subtree_max_hole;
> +       }
> +
> +       if (exit && node->subtree_max_hole == max)
> +               return true;
> +
> +       node->subtree_max_hole = max;
> +       return false;
> +}
> +
> +static inline void
> +augment_callbacks_propagate(struct rb_node *rb, struct rb_node *stop)
> +{
> +       while (rb != stop) {
> +               struct drm_mm_node *node = rb_entry(rb,  struct drm_mm_node,
> +                                                   rb_hole_addr);

Coding style / checkpatch will insist on a newline here after the vars.


> +               if (augment_callbacks_compute_max_hole(node, true))
> +                       break;
> +
> +               rb = rb_parent(&node->rb_hole_addr);
> +       }
> +}
> +
> +static inline void
> +augment_callbacks_copy(struct rb_node *rb_old, struct rb_node *rb_new)
> +{
> +       struct drm_mm_node *old = rb_entry(rb_old, struct drm_mm_node,
> +                                          rb_hole_addr);
> +       struct drm_mm_node *new = rb_entry(rb_new, struct drm_mm_node,
> +                                          rb_hole_addr);
> +
> +       new->subtree_max_hole = old->subtree_max_hole;
> +}
> +
> +static void
> +augment_callbacks_rotate(struct rb_node *rb_old, struct rb_node *rb_new)
> +{
> +       struct drm_mm_node *old = rb_entry(rb_old, struct drm_mm_node,
> +                                          rb_hole_addr);
> +       struct drm_mm_node *new = rb_entry(rb_new, struct drm_mm_node,
> +                                          rb_hole_addr);
> +
> +       new->subtree_max_hole = old->subtree_max_hole;
> +       augment_callbacks_compute_max_hole(old, false);
> +}
> +
> +static const struct rb_augment_callbacks augment_callbacks = {
> +       .propagate = augment_callbacks_propagate,
> +       .copy = augment_callbacks_copy,
> +       .rotate = augment_callbacks_rotate
> +};

Faithful expansion of the macros,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
