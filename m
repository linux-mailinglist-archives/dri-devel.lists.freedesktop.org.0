Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578E38F336
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD416E907;
	Mon, 24 May 2021 18:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADF16E906;
 Mon, 24 May 2021 18:47:20 +0000 (UTC)
IronPort-SDR: im22Vv1nYw8xL6z8rYoTt7iHGgS1XW2pvNUmSJ9wnGA2mEwS/DHY8kBhgQP23ttOl7JSMAsWi9
 5Qhf9CUhP4Hw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="201752181"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="201752181"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:47:20 -0700
IronPort-SDR: VEk8O+SpTlCqwPFfirqN30Z7rIGXpv4VfPCOj1ACqkoNZ5qSHbNzfXZR329Cl9b4oQeKdX2NTM
 Yunk7K++iYPQ==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="442952602"
Received: from clanggaa-mobl1.ger.corp.intel.com ([10.249.254.179])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:47:18 -0700
Message-ID: <dd37f6b3dae8c7daf735f813520af4ab17131e2e.camel@linux.intel.com>
Subject: Re: [PATCH v3 08/12] drm/ttm: Use drm_memcpy_from_wc_dbm for TTM bo
 moves
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 24 May 2021 20:47:15 +0200
In-Reply-To: <CAM0jSHNP4NNQknBWLqn8h5kapcxVhAgwjjg3yQ9wDfYb41q92A@mail.gmail.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-9-thomas.hellstrom@linux.intel.com>
 <CAM0jSHNP4NNQknBWLqn8h5kapcxVhAgwjjg3yQ9wDfYb41q92A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-05-24 at 19:16 +0100, Matthew Auld wrote:
> On Fri, 21 May 2021 at 16:33, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > Use fast wc memcpy for reading out of wc memory for TTM bo moves.
> > 
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_util.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 912cbe8e60a2..4a7d3d672f9a 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -31,6 +31,7 @@
> > 
> >  #include <drm/ttm/ttm_bo_driver.h>
> >  #include <drm/ttm/ttm_placement.h>
> > +#include <drm/drm_memcpy.h>
> >  #include <drm/drm_vma_manager.h>
> >  #include <linux/dma-buf-map.h>
> >  #include <linux/io.h>
> > @@ -91,6 +92,7 @@ void ttm_move_memcpy(struct ttm_buffer_object
> > *bo,
> >         const struct ttm_kmap_iter_ops *src_ops = src_iter->ops;
> >         struct ttm_tt *ttm = bo->ttm;
> >         struct dma_buf_map src_map, dst_map;
> > +       bool wc_memcpy;
> >         pgoff_t i;
> > 
> >         /* Single TTM move. NOP */
> > @@ -114,11 +116,16 @@ void ttm_move_memcpy(struct ttm_buffer_object
> > *bo,
> >                 return;
> >         }
> > 
> > +       wc_memcpy = ((!src_ops->maps_tt || ttm->caching !=
> > ttm_cached) &&
> 
> Why do we only consider the caching value for the maps_tt case? Or am
> I misreading this?

Hmm, you're right we should probably check also the iomem caching or
ignore the tt caching. Sometimes these special memcpys tend to be less
cpu cache thrashing and should be used wherever possible, but I guess
we should start out with only using it when source is WC.

> 
> > +                    drm_has_memcpy_from_wc());
> > +
> >         for (i = 0; i < dst_mem->num_pages; ++i) {
> >                 dst_ops->map_local(dst_iter, &dst_map, i);
> >                 src_ops->map_local(src_iter, &src_map, i);
> > 
> > -               if (!src_map.is_iomem && !dst_map.is_iomem) {
> > +               if (wc_memcpy) {
> > +                       drm_memcpy_from_wc_dbm(&dst_map, &src_map,
> > PAGE_SIZE);
> 
> Do we need to check the return value here? memcpy_from_wc expects
> certain address alignment, or is that always guaranteed here? Maybe
> throw a warning just for paranoia?

It should always be PAGE_SIZE aligned. But I guess it doesn't hurt to
do 
if (wc_memcpy && drm_memcpy_from_wc_dbm())
;

> 
> > +               } else if (!src_map.is_iomem && !dst_map.is_iomem)
> > {
> >                         memcpy(dst_map.vaddr, src_map.vaddr,
> > PAGE_SIZE);
> >                 } else if (!src_map.is_iomem) {
> >                         dma_buf_map_memcpy_to(&dst_map,
> > src_map.vaddr,
> > --
> > 2.31.1
> > 


