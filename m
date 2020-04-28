Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D701BC4F0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 18:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EFA6E85B;
	Tue, 28 Apr 2020 16:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A546E6E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:18:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21049063-1500050 for multiple; Tue, 28 Apr 2020 17:18:37 +0100
MIME-Version: 1.0
In-Reply-To: <20200428160423.4402-1-nirmoy.das@amd.com>
References: <20200428160423.4402-1-nirmoy.das@amd.com>
Subject: Re: [PATCH 1/1] drm/mm: optimize rb_hole_addr rbtree search in high
 addr mode
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158809071622.24122.16400979345123305890@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 28 Apr 2020 17:18:36 +0100
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
Cc: nirmoy.das@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Nirmoy Das (2020-04-28 17:04:23)
> Userspace can severely fragment rb_hole_addr rbtree by manipulating
> alignment while allocating buffers. Fragmented rb_hole_addr rbtree would
> result in large delays while allocating buffer object for a userspace
> application. It takes long time to find suitable hole because if we fail
> to find a suitable hole in the first attempt then we look for neighbouring
> nodes using rb_prev(). Traversing rbtree using rb_prev() can take really
> long time if the tree is fragmented.
> 
> This patch improves searches in fragmented rb_hole_addr rbtree by storing
> an extra field in drm_mm_node, max_hole_size. Each drm_mm_node now stores
> maximum hole size for its subtree in drm_mm_node->max_hole_size. Using
> drm_mm_node->max_hole_size, it is possible to eliminate complete
> subtree if that subtree is unable to serve a request hence reducing number
> of rb_prev() used.
> 
> Note: Implementation details of rb_hole_addr rbtree updates after a node
> removal and addition is borrowed from block/bfq-wf2q.c which is trying to
> achieve a similar goal.

Feels like it is an augmented rbtree?

> +static struct drm_mm_node *
> +next_hole_high_addr(struct drm_mm_node *entry, u64 size)
> +{
> +       struct rb_node *rb_node, *left_rb_node, *parent_rb_node;
> +       struct drm_mm_node *left_node;
> +
> +       if (!entry)
> +               return false;
> +
> +       rb_node = &entry->rb_hole_addr;
> +       if (rb_node->rb_left) {
> +               left_rb_node = rb_node->rb_left;
> +               parent_rb_node = rb_parent(rb_node);
> +               left_node = rb_entry(left_rb_node,
> +                                    struct drm_mm_node, rb_hole_addr);
> +               if ((left_node->max_hole_size < size ||
> +                    entry->size == entry->max_hole_size) &&
> +                   parent_rb_node && parent_rb_node->rb_left != rb_node)
> +                       return rb_hole_addr_to_node(parent_rb_node);
> +       }
> +
> +       return rb_hole_addr_to_node(rb_prev(rb_node));
> +}

The max_hole_size would equally apply to next_hole_low_addr(), right?

Sadly, I did not explore the fragmented search LOW/HIGH in test-drm_mm.c.
That would be a useful addition as well.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
