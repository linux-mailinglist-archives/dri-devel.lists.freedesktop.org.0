Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F13931A1
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3D46E06E;
	Thu, 27 May 2021 15:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AE26F403;
 Thu, 27 May 2021 15:01:52 +0000 (UTC)
IronPort-SDR: hzwW6WaPdHY8VXVRpf4ajPLTxqu/WimjAjrVRXnM8m0jvFvimhi8ebVShEJ49AFm2D5/6NtV+R
 U14lBeOQz+xw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183089144"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="183089144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:01:50 -0700
IronPort-SDR: FL1KthgPsXdjh9mLeCpOsaNy///C3J7yZa1KKSJCrZhY6Wo+c8cLsM0615sv60tcKeSKSxwiWX
 Ni6cYeGHnv/Q==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="477522057"
Received: from ibanaga-mobl.ger.corp.intel.com ([10.249.254.58])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:01:49 -0700
Message-ID: <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Thu, 27 May 2021 17:01:46 +0200
In-Reply-To: <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
> Am 27.05.21 um 16:19 schrieb Thomas Hellström:
> > The swapping code was dereference bo->ttm pointers without having
> > the
> > dma-resv lock held. Also it might try to swap out unpopulated bos.
> > 
> > Fix this by moving the bo->ttm dereference until we have the
> > reservation
> > lock. Check that the ttm_tt is populated after the swap_notify
> > callback.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c     | 16 +++++++++++++++-
> >   drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
> >   2 files changed, 18 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 9f53506a82fc..86213d37657b 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> >         if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
> > &locked, NULL))
> >                 return -EBUSY;
> >   
> > +       dma_resv_assert_held(bo->base.resv);
> > +
> > +       if (!bo->ttm ||
> > +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> > +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) {
> > +               if (locked)
> > +                       dma_resv_unlock(bo->base.resv);
> > +               return -EBUSY;
> > +       }
> > +
> >         if (!ttm_bo_get_unless_zero(bo)) {
> >                 if (locked)
> >                         dma_resv_unlock(bo->base.resv);
> > @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> >         if (bo->bdev->funcs->swap_notify)
> >                 bo->bdev->funcs->swap_notify(bo);
> >   
> > -       ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
> > +       if (ttm_tt_is_populated(bo->ttm))
> > +               ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
> 
> Exactly that is what I won't recommend. We would try to swap out the 
> same BO over and over again with that.

But we wouldn't since the BO is taken off the LRU and never re-added,

> 
> Why not move that to the check above as well?

Because the BO may become unpopulated in swap_notify(), i915, like
vmwgfx, sometimes sets up gpu bindings from system, and when we get a
notification from user-space that those are purgeable, we don't want to
purge immediately but wait for a potential swapout.

/Thomas


> 
> Christian.
> 
> >   out:
> >   
> >         /*
> > @@ -1225,6 +1236,9 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > *bo, struct ttm_operation_ctx *ctx,
> >         if (locked)
> >                 dma_resv_unlock(bo->base.resv);
> >         ttm_bo_put(bo);
> > +
> > +       /* Don't break locking rules. */
> > +       WARN_ON(ret == -EBUSY);
> >         return ret;
> >   }
> >   
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > b/drivers/gpu/drm/ttm/ttm_device.c
> > index 460953dcad11..eaa7487ae404 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -143,14 +143,12 @@ int ttm_device_swapout(struct ttm_device
> > *bdev, struct ttm_operation_ctx *ctx,
> >   
> >                 for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> >                         list_for_each_entry(bo, &man->lru[j], lru)
> > {
> > -                               uint32_t num_pages;
> > +                               pgoff_t num_pages;
> >   
> > -                               if (!bo->ttm ||
> > -                                   bo->ttm->page_flags &
> > TTM_PAGE_FLAG_SG ||
> > -                                   bo->ttm->page_flags &
> > TTM_PAGE_FLAG_SWAPPED)
> > +                               if (!READ_ONCE(bo->ttm))
> >                                         continue;
> >   
> > -                               num_pages = bo->ttm->num_pages;
> > +                               num_pages = bo->base.size >>
> > PAGE_SHIFT;
> >                                 ret = ttm_bo_swapout(bo, ctx,
> > gfp_flags);
> >                                 /* ttm_bo_swapout has dropped the
> > lru_lock */
> >                                 if (!ret)
> 


