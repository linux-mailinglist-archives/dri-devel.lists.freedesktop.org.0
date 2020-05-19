Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26E41DA50A
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 00:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7746E3A0;
	Tue, 19 May 2020 22:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722886E3A0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 22:56:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21234203-1500050 for multiple; Tue, 19 May 2020 23:56:03 +0100
MIME-Version: 1.0
In-Reply-To: <20200519084436.91718-2-nirmoy.das@amd.com>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
 <20200519084436.91718-2-nirmoy.das@amd.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/mm: improve rb_hole_addr rbtree search
Message-ID: <158992896210.6082.4915032891292068718@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Tue, 19 May 2020 23:56:02 +0100
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
> +#define DRM_MM_ALIGN_SHIFT 6
>  #define HOLE_SIZE(NODE) ((NODE)->hole_size)
>  #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
> +#define HOLE_SIZE_ALIGN(NODE) ((NODE->hole_size << DRM_MM_ALIGN_SHIFT) | \
> +                              ffs(HOLE_ADDR(NODE)))

Fwiw, max hole size of 58b, we would need to stop storing byte
extents...

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

What was the point in storing the packed alignment if we are just
searching for a hole big enough for (size + alignment)?
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
