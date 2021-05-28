Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0949D393DF5
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 09:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9BB6E04A;
	Fri, 28 May 2021 07:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDF56E086;
 Fri, 28 May 2021 07:33:30 +0000 (UTC)
IronPort-SDR: 2WKnYVhNwElGZwdO4C4Bd8xT1O0c9F61W0yoCLz4hjn9ru+k4JpMXNyZRLamJ9Nm3w65lfcDQj
 pWBekr0o4BHw==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="199873450"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="199873450"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 00:33:27 -0700
IronPort-SDR: +2flAWMyfi+BrvSi08Z3Dbb6bBW5eJxZIvEZippad5kt55ymfG6l0OOxjFrdffwEbjIJ5+fXR1
 MvDOn/85UQxg==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="443906591"
Received: from jdahlin-mobl1.ger.corp.intel.com ([10.249.254.92])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 00:33:26 -0700
Message-ID: <169de7a9af59135d1b63278b3b69a892ecfd4549.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Fri, 28 May 2021 09:33:23 +0200
In-Reply-To: <1dffe27a-bfc6-075e-f198-0c47cd282638@amd.com>
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
 <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
 <e594a1d45b22e92e052d1070beadc5928e5c0ba1.camel@linux.intel.com>
 <17037c04-603c-44c8-84a2-bce49c0e4f0c@amd.com>
 <97b0903d941c05a8877579749c6a2ea6ec107d0b.camel@linux.intel.com>
 <1dffe27a-bfc6-075e-f198-0c47cd282638@amd.com>
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

On Fri, 2021-05-28 at 09:16 +0200, Christian König wrote:
> Am 27.05.21 um 17:51 schrieb Thomas Hellström:
> > On Thu, 2021-05-27 at 17:32 +0200, Christian König wrote:
> > > Am 27.05.21 um 17:05 schrieb Thomas Hellström:
> > > > On Thu, 2021-05-27 at 17:01 +0200, Thomas Hellström wrote:
> > > > > On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
> > > > > > Am 27.05.21 um 16:19 schrieb Thomas Hellström:
> > > > > > > The swapping code was dereference bo->ttm pointers
> > > > > > > without
> > > > > > > having
> > > > > > > the
> > > > > > > dma-resv lock held. Also it might try to swap out
> > > > > > > unpopulated
> > > > > > > bos.
> > > > > > > 
> > > > > > > Fix this by moving the bo->ttm dereference until we have
> > > > > > > the
> > > > > > > reservation
> > > > > > > lock. Check that the ttm_tt is populated after the
> > > > > > > swap_notify
> > > > > > > callback.
> > > > > > > 
> > > > > > > Signed-off-by: Thomas Hellström
> > > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/ttm/ttm_bo.c     | 16
> > > > > > > +++++++++++++++-
> > > > > > >     drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
> > > > > > >     2 files changed, 18 insertions(+), 6 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > index 9f53506a82fc..86213d37657b 100644
> > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > > @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct
> > > > > > > ttm_buffer_object
> > > > > > > *bo, struct ttm_operation_ctx *ctx,
> > > > > > >           if (!ttm_bo_evict_swapout_allowable(bo, ctx,
> > > > > > > &place,
> > > > > > > &locked, NULL))
> > > > > > >                   return -EBUSY;
> > > > > > >     
> > > > > > > +       dma_resv_assert_held(bo->base.resv);
> > > > > > > +
> > > > > > > +       if (!bo->ttm ||
> > > > > > > +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> > > > > > > +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
> > > > > > > {
> > > > > > > +               if (locked)
> > > > > > > +                       dma_resv_unlock(bo->base.resv);
> > > > > > > +               return -EBUSY;
> > > > > > > +       }
> > > > > > > +
> > > > > > >           if (!ttm_bo_get_unless_zero(bo)) {
> > > > > > >                   if (locked)
> > > > > > >                           dma_resv_unlock(bo->base.resv);
> > > > > > > @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct
> > > > > > > ttm_buffer_object
> > > > > > > *bo, struct ttm_operation_ctx *ctx,
> > > > > > >           if (bo->bdev->funcs->swap_notify)
> > > > > > >                   bo->bdev->funcs->swap_notify(bo);
> > > > > > >     
> > > > > > > -       ret = ttm_tt_swapout(bo->bdev, bo->ttm,
> > > > > > > gfp_flags);
> > > > > > > +       if (ttm_tt_is_populated(bo->ttm))
> > > > > > > +               ret = ttm_tt_swapout(bo->bdev, bo->ttm,
> > > > > > > gfp_flags);
> > > > > > Exactly that is what I won't recommend. We would try to
> > > > > > swap
> > > > > > out
> > > > > > the
> > > > > > same BO over and over again with that.
> > > > > But we wouldn't since the BO is taken off the LRU and never
> > > > > re-
> > > > > added,
> > > > > 
> > > > > 
> > > > In fact, we'd probably might want to take the !bo->ttm bos off
> > > > the
> > > > LRU
> > > > as well..
> > > No, we don't want to take any BOs of the LRU unless they are
> > > pinned.
> > > 
> > > Adding a TT object or populating it doesn't necessarily put the
> > > BO
> > > back
> > > to the LRU.
> > OK, but swapped bos are also taken off the LRU list so these
> > unpopulated bos are just taking the same path. Only difference to
> > swapped is that they don't get read back on re-populate, but
> > typically
> > cleared.
> > 
> > But what would be the point of keeping swapped-out bos on the LRU
> > list?, particularly when we're iterating under a spinlock?
> > Shouldn't we try to re-add to LRU (if not already on an LRU) just
> > before populating? There aren't really that many calls in core TTM.
> 
> I want to avoid removing BOs from the LRU as much as possible since
> we 
> forgot on multiple places that we want to re-add them.
> 
> Conceptual I think the swapped BOs should have a separate memory
> domain, 
> this way we can ignore them cleanly when swapping things out.

Yes, that would of course work as well. Keeping them on the system LRU
is IMO highly undesirable.

> 
> Going to pick this patch up, modifying it a bit more and then pushing
> it 
> to drm-misc-fixes for upstreaming.

OK, I dropped the TTM fix for the purge-in-swap-notify from the i915
series, hoping that the reworked variant of this patch lands first.

Thanks,
Thomas

> 
> Thanks,
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > 
> > 
> > 
> > > Christian.
> > > 
> > > > /Thomas
> > > > 
> > 
> 


