Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F94D3931B4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2CC6F3FA;
	Thu, 27 May 2021 15:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E46F3FA;
 Thu, 27 May 2021 15:05:12 +0000 (UTC)
IronPort-SDR: ruK5SZTlAJbtuWWruQFoxuFuIlqGer/0i9JSeTl5xc+s5HfMgdve8rhlZKjFg5RSCnnk4G06S8
 y1lSr0Hnk3YA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183090380"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="183090380"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:05:11 -0700
IronPort-SDR: rX0iP5n4vxkD8U6eoadxTbMGWSM0uO0cFv5k4VCfkp7Khj0slTX2ncW5ygf082L6L2HNdxSPmA
 XaZgVOXPsylQ==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="414942024"
Received: from ibanaga-mobl.ger.corp.intel.com ([10.249.254.58])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 08:05:08 -0700
Message-ID: <e594a1d45b22e92e052d1070beadc5928e5c0ba1.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Thu, 27 May 2021 17:05:06 +0200
In-Reply-To: <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
 <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
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

On Thu, 2021-05-27 at 17:01 +0200, Thomas Hellström wrote:
> On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
> > Am 27.05.21 um 16:19 schrieb Thomas Hellström:
> > > The swapping code was dereference bo->ttm pointers without having
> > > the
> > > dma-resv lock held. Also it might try to swap out unpopulated
> > > bos.
> > > 
> > > Fix this by moving the bo->ttm dereference until we have the
> > > reservation
> > > lock. Check that the ttm_tt is populated after the swap_notify
> > > callback.
> > > 
> > > Signed-off-by: Thomas Hellström
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo.c     | 16 +++++++++++++++-
> > >   drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
> > >   2 files changed, 18 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > index 9f53506a82fc..86213d37657b 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct
> > > ttm_buffer_object
> > > *bo, struct ttm_operation_ctx *ctx,
> > >         if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
> > > &locked, NULL))
> > >                 return -EBUSY;
> > >   
> > > +       dma_resv_assert_held(bo->base.resv);
> > > +
> > > +       if (!bo->ttm ||
> > > +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> > > +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) {
> > > +               if (locked)
> > > +                       dma_resv_unlock(bo->base.resv);
> > > +               return -EBUSY;
> > > +       }
> > > +
> > >         if (!ttm_bo_get_unless_zero(bo)) {
> > >                 if (locked)
> > >                         dma_resv_unlock(bo->base.resv);
> > > @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct ttm_buffer_object
> > > *bo, struct ttm_operation_ctx *ctx,
> > >         if (bo->bdev->funcs->swap_notify)
> > >                 bo->bdev->funcs->swap_notify(bo);
> > >   
> > > -       ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
> > > +       if (ttm_tt_is_populated(bo->ttm))
> > > +               ret = ttm_tt_swapout(bo->bdev, bo->ttm,
> > > gfp_flags);
> > 
> > Exactly that is what I won't recommend. We would try to swap out
> > the 
> > same BO over and over again with that.
> 
> But we wouldn't since the BO is taken off the LRU and never re-added,
> 
> 
In fact, we'd probably might want to take the !bo->ttm bos off the LRU
as well..

/Thomas

