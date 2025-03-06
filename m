Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54909A54722
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 11:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE92E10E932;
	Thu,  6 Mar 2025 10:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqFX5mWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B679E10E92F;
 Thu,  6 Mar 2025 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741255241; x=1772791241;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4cusYBMRJK2W5vn7py8Ik48sJ/naU6rG7SY7NX6WG2s=;
 b=HqFX5mWwIPAb0AwjRb4ShNdlsk42CbprMQJWCN844z3JEYEJvyNrpTNB
 QMd8rJx6IDlLNlTd7buqXwsHSau/juXUxpKRXDAr+T01iMWbLY/cACUPo
 E63D/5sOcyOzfcQCVPBBCylEvzneEibfpK2FlbznpA2PYGqF5MkUFtuZw
 Q1w4gb6tU4l0I2G/Rb9ZYVa9Aik9kUZ2cGL6Zrt7ZP7xnwXqyAojqOdtT
 BM2tT2WtfUCvtIG3r7Lnd0A64SZEje69okO08aHtmL28ZRgSv4xquxO8s
 w4OO7u2RrI1W1JTl++QxnvxR6DxqZgAzbIRAdot0oJSJPc60Rf3rESk5v w==;
X-CSE-ConnectionGUID: zVHYbt97QLeglIF0Dm8o1Q==
X-CSE-MsgGUID: a2s71nJTSwSjAGPamYMbjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41963315"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="41963315"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 02:00:40 -0800
X-CSE-ConnectionGUID: 1hjG/EqlQHm3sCMoF8BFfQ==
X-CSE-MsgGUID: YDp/Z1+ISP+8oHbRMpj99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="118988275"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.140])
 ([10.245.246.140])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 02:00:34 -0800
Message-ID: <aef14ad7f07d1dc8b3f0c085d9c2c8ba42b77927.camel@linux.intel.com>
Subject: Re: RESEND Re: [PATCH v16 2/7] drm/ttm/pool, drm/ttm/tt: Provide a
 helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 06 Mar 2025 11:00:33 +0100
In-Reply-To: <CAPM=9txN-FsAk=W_QbyYhUk9fWios5t-h5oL=ZrdTKoxKjWVWg@mail.gmail.com>
References: <20250130101325.3068-1-thomas.hellstrom@linux.intel.com>
 <20250130101325.3068-3-thomas.hellstrom@linux.intel.com>
 <57ec915f-f766-413e-9377-af37071f29d8@amd.com>
 <cdb50c7a4e721afd6cebfbf7cacab6cd8cd524c7.camel@linux.intel.com>
 <a57a92694883a2243def43ee1c9b803d02c8e1b3.camel@linux.intel.com>
 <CAPM=9txN-FsAk=W_QbyYhUk9fWios5t-h5oL=ZrdTKoxKjWVWg@mail.gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-03-05 at 13:01 +1000, Dave Airlie wrote:
> I've looked over the two patches mentioned here, I think they have
> seen enough time and we need to unblock,
>=20
> Please add and merge them:
> Acked-by: Dave Airlie <airlied@redhat.com>
>=20
> Dave.

Thanks for unblocking, Dave. Pushed to drm-misc-next yesterday.

/Thomas




>=20
> On Tue, 25 Feb 2025 at 18:44, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
> >=20
> > Hi, Christian,
> >=20
> > Ping? I'd really want to get this in before -rc6
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > On Tue, 2025-02-18 at 16:40 +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Christian,
> > >=20
> > > On Wed, 2025-02-05 at 15:02 +0100, Christian K=C3=B6nig wrote:
> > > > Am 30.01.25 um 11:13 schrieb Thomas Hellstr=C3=B6m:
> > > > > Provide a helper to shrink ttm_tt page-vectors on a per-page
> > > > > basis. A ttm_backup backend could then in theory get away
> > > > > with
> > > > > allocating a single temporary page for each struct ttm_tt.
> > > > >=20
> > > > > This is accomplished by splitting larger pages before trying
> > > > > to
> > > > > back them up.
> > > > >=20
> > > > > In the future we could allow ttm_backup to handle backing up
> > > > > large pages as well, but currently there's no benefit in
> > > > > doing that, since the shmem backup backend would have to
> > > > > split those anyway to avoid allocating too much temporary
> > > > > memory, and if the backend instead inserts pages into the
> > > > > swap-cache, those are split on reclaim by the core.
> > > > >=20
> > > > > Due to potential backup- and recover errors, allow partially
> > > > > swapped
> > > > > out struct ttm_tt's, although mark them as swapped out
> > > > > stopping
> > > > > them
> > > > > from being swapped out a second time. More details in the
> > > > > ttm_pool.c
> > > > > DOC section.
> > > > >=20
> > > > > v2:
> > > > > - A couple of cleanups and error fixes in
> > > > > ttm_pool_back_up_tt.
> > > > > - s/back_up/backup/
> > > > > - Add a writeback parameter to the exported interface.
> > > > > v8:
> > > > > - Use a struct for flags for readability (Matt Brost)
> > > > > - Address misc other review comments (Matt Brost)
> > > > > v9:
> > > > > - Update the kerneldoc for the ttm_tt::backup field.
> > > > > v10:
> > > > > - Rebase.
> > > > > v13:
> > > > > - Rebase on ttm_backup interface change. Update kerneldoc.
> > > > > - Rebase and adjust ttm_tt_is_swapped().
> > > > > v15:
> > > > > - Rebase on ttm_backup return value change.
> > > > > - Rebase on previous restructuring of ttm_pool_alloc()
> > > > > - Rework the ttm_pool backup interface (Christian K=C3=B6nig)
> > > > > - Remove cond_resched() (Christian K=C3=B6nig)
> > > > > - Get rid of the need to allocate an intermediate page array
> > > > > =C2=A0=C2=A0 when restoring a multi-order page (Christian K=C3=B6=
nig)
> > > > > - Update documentation.
> > > > >=20
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > <thomas.hellstrom@linux.intel.com>
> > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > >=20
> > > > I've tried to wrap my head around all of this like twenty times
> > > > in
> > > > the
> > > > last three month, but was always interrupted at some point.
> > > >=20
> > > > Feel free to add Acked-by: Christian Koenig
> > > > <christian.koenig@amd.com>.
> > > >=20
> > > > Sorry,
> > > > Christian.
> > >=20
> > > Thanks a lot for all reviewing and comments so far. There are two
> > > TTM
> > > patches left in the series that don't have an ack by you:
> > >=20
> > > https://patchwork.freedesktop.org/patch/634715/?series=3D131815&rev=
=3D17
> > > and
> > >=20
> > > https://patchwork.freedesktop.org/patch/634716/?series=3D131815&rev=
=3D17
> > >=20
> > > None of them particularly big considering the amount of doc text.
> > >=20
> > > It'd be great if those could have an ack as well so we could
> > > finally
> > > merge this series.
> > >=20
> > > Thanks,
> > > Thomas
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > >=20
> > > >=20
> > > > > ---
> > > > > =C2=A0 drivers/gpu/drm/ttm/ttm_pool.c | 554
> > > > > +++++++++++++++++++++++++++++----
> > > > > =C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0 |=C2=A0 54 ++++
> > > > > =C2=A0 include/drm/ttm/ttm_pool.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 8 +
> > > > > =C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 67 +++-
> > > > > =C2=A0 4 files changed, 629 insertions(+), 54 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > index c9eba76d5143..ffb7abf52bab 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > @@ -41,6 +41,7 @@
> > > > > =C2=A0 #include <asm/set_memory.h>
> > > > > =C2=A0 #endif
> > > > >=20
> > > > > +#include <drm/ttm/ttm_backup.h>
> > > > > =C2=A0 #include <drm/ttm/ttm_pool.h>
> > > > > =C2=A0 #include <drm/ttm/ttm_tt.h>
> > > > > =C2=A0 #include <drm/ttm/ttm_bo.h>
> > > > > @@ -75,6 +76,35 @@ struct ttm_pool_alloc_state {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_c=
aching tt_caching;
> > > > > =C2=A0 };
> > > > >=20
> > > > > +/**
> > > > > + * struct ttm_pool_tt_restore - State representing restore
> > > > > from
> > > > > backup
> > > > > + * @pool: The pool used for page allocation while restoring.
> > > > > + * @snapshot_alloc: A snapshot of the most recent struct
> > > > > ttm_pool_alloc_state.
> > > > > + * @alloced_page: Pointer to the page most recently
> > > > > allocated
> > > > > from
> > > > > a pool or system.
> > > > > + * @first_dma: The dma address corresponding to
> > > > > @alloced_page if
> > > > > dma_mapping
> > > > > + * is requested.
> > > > > + * @alloced_pages: The number of allocated pages present in
> > > > > the
> > > > > struct ttm_tt
> > > > > + * page vector from this restore session.
> > > > > + * @restored_pages: The number of 4K pages restored for
> > > > > @alloced_page (which
> > > > > + * is typically a multi-order page).
> > > > > + * @page_caching: The struct ttm_tt requested caching
> > > > > + * @order: The order of @alloced_page.
> > > > > + *
> > > > > + * Recovery from backup might fail when we've recovered less
> > > > > than
> > > > > the
> > > > > + * full ttm_tt. In order not to loose any data (yet), keep
> > > > > information
> > > > > + * around that allows us to restart a failed ttm backup
> > > > > recovery.
> > > > > + */
> > > > > +struct ttm_pool_tt_restore {
> > > > > + struct ttm_pool *pool;
> > > > > + struct ttm_pool_alloc_state snapshot_alloc;
> > > > > + struct page *alloced_page;
> > > > > + dma_addr_t first_dma;
> > > > > + pgoff_t alloced_pages;
> > > > > + pgoff_t restored_pages;
> > > > > + enum ttm_caching page_caching;
> > > > > + unsigned int order;
> > > > > +};
> > > > > +
> > > > > =C2=A0 static unsigned long page_pool_size;
> > > > >=20
> > > > > =C2=A0 MODULE_PARM_DESC(page_pool_size, "Number of pages in the
> > > > > WC/UC/DMA pool");
> > > > > @@ -199,12 +229,11 @@ static int
> > > > > ttm_pool_apply_caching(struct
> > > > > ttm_pool_alloc_state *alloc)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > =C2=A0 }
> > > > >=20
> > > > > -/* Map pages of 1 << order size and fill the DMA address
> > > > > array
> > > > > */
> > > > > +/* DMA Map pages of 1 << order size and return the resulting
> > > > > dma_address. */
> > > > > =C2=A0 static int ttm_pool_map(struct ttm_pool *pool, unsigned in=
t
> > > > > order,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *p, dma_addr_t **dma_addr)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *p, dma_addr_t *dma_addr)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t=
 addr;
> > > > > - unsigned int i;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pool->=
use_dma_alloc) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_dma *dma =3D (void =
*)p-
> > > > > >private;
> > > > > @@ -218,10 +247,7 @@ static int ttm_pool_map(struct ttm_pool
> > > > > *pool,
> > > > > unsigned int order,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EFAULT;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > - for (i =3D 1 << order; i ; --i) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(*dma_addr)++ =
=3D addr;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addr +=3D PAGE_=
SIZE;
> > > > > - }
> > > > > + *dma_addr =3D addr;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > =C2=A0 }
> > > > > @@ -371,6 +397,190 @@ static unsigned int
> > > > > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return p->=
private;
> > > > > =C2=A0 }
> > > > >=20
> > > > > +/*
> > > > > + * Split larger pages so that we can free each PAGE_SIZE
> > > > > page as
> > > > > soon
> > > > > + * as it has been backed up, in order to avoid memory
> > > > > pressure
> > > > > during
> > > > > + * reclaim.
> > > > > + */
> > > > > +static void ttm_pool_split_for_swap(struct ttm_pool *pool,
> > > > > struct
> > > > > page *p)
> > > > > +{
> > > > > + unsigned int order =3D ttm_pool_page_order(pool, p);
> > > > > + pgoff_t nr;
> > > > > +
> > > > > + if (!order)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > > +
> > > > > + split_page(p, order);
> > > > > + nr =3D 1UL << order;
> > > > > + while (nr--)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (p++)->private =
=3D 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * DOC: Partial backup and restoration of a struct ttm_tt.
> > > > > + *
> > > > > + * Swapout using ttm_backup_backup_page() and swapin using
> > > > > + * ttm_backup_copy_page() may fail.
> > > > > + * The former most likely due to lack of swap-space or
> > > > > memory,
> > > > > the
> > > > > latter due
> > > > > + * to lack of memory or because of signal interruption
> > > > > during
> > > > > waits.
> > > > > + *
> > > > > + * Backup failure is easily handled by using a ttm_tt pages
> > > > > vector
> > > > > that holds
> > > > > + * both backup handles and page pointers. This has to be
> > > > > taken
> > > > > into account when
> > > > > + * restoring such a ttm_tt from backup, and when freeing it
> > > > > while
> > > > > backed up.
> > > > > + * When restoring, for simplicity, new pages are actually
> > > > > allocated from the
> > > > > + * pool and the contents of any old pages are copied in and
> > > > > then
> > > > > the old pages
> > > > > + * are released.
> > > > > + *
> > > > > + * For restoration failures, the struct ttm_pool_tt_restore
> > > > > holds
> > > > > sufficient state
> > > > > + * to be able to resume an interrupted restore, and that
> > > > > structure
> > > > > is freed once
> > > > > + * the restoration is complete. If the struct ttm_tt is
> > > > > destroyed
> > > > > while there
> > > > > + * is a valid struct ttm_pool_tt_restore attached, that is
> > > > > also
> > > > > properly taken
> > > > > + * care of.
> > > > > + */
> > > > > +
> > > > > +/* Is restore ongoing for the currently allocated page? */
> > > > > +static bool ttm_pool_restore_valid(const struct
> > > > > ttm_pool_tt_restore *restore)
> > > > > +{
> > > > > + return restore && restore->restored_pages < (1 <<
> > > > > restore-
> > > > > > order);
> > > > > +}
> > > > > +
> > > > > +/* DMA unmap and free a multi-order page, either to the
> > > > > relevant
> > > > > pool or to system. */
> > > > > +static pgoff_t ttm_pool_unmap_and_free(struct ttm_pool
> > > > > *pool,
> > > > > struct page *page,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const dma_addr_t
> > > > > *dma_addr,
> > > > > enum ttm_caching caching)
> > > > > +{
> > > > > + struct ttm_pool_type *pt =3D NULL;
> > > > > + unsigned int order;
> > > > > + pgoff_t nr;
> > > > > +
> > > > > + if (pool) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D ttm_p=
ool_page_order(pool, page);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr =3D (1UL << =
order);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dma_addr)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_unmap(pool, *dma_addr, nr);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt =3D ttm_pool=
_select_type(pool, caching, order);
> > > > > + } else {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D page-=
>private;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr =3D (1UL << =
order);
> > > > > + }
> > > > > +
> > > > > + if (pt)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_type_g=
ive(pt, page);
> > > > > + else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_free_p=
age(pool, caching, order, page);
> > > > > +
> > > > > + return nr;
> > > > > +}
> > > > > +
> > > > > +/* Populate the page-array using the most recent allocated
> > > > > multi-
> > > > > order page. */
> > > > > +static void ttm_pool_allocated_page_commit(struct page
> > > > > *allocated,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dm=
a_addr_t first_dma,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct
> > > > > ttm_pool_alloc_state *alloc,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pg=
off_t nr)
> > > > > +{
> > > > > + pgoff_t i;
> > > > > +
> > > > > + for (i =3D 0; i < nr; ++i)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *alloc->pages++=
 =3D allocated++;
> > > > > +
> > > > > + alloc->remaining_pages -=3D nr;
> > > > > +
> > > > > + if (!alloc->dma_addr)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > > +
> > > > > + for (i =3D 0; i < nr; ++i) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *alloc->dma_add=
r++ =3D first_dma;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first_dma +=3D =
PAGE_SIZE;
> > > > > + }
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * When restoring, restore backed-up content to the newly
> > > > > allocated page and
> > > > > + * if successful, populate the page-table and dma-address
> > > > > arrays.
> > > > > + */
> > > > > +static int ttm_pool_restore_commit(struct
> > > > > ttm_pool_tt_restore
> > > > > *restore,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_backup *backup,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > > > ttm_operation_ctx
> > > > > *ctx,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_alloc_state
> > > > > *alloc)
> > > > > +
> > > > > +{
> > > > > + pgoff_t i, nr =3D 1UL << restore->order;
> > > > > + struct page **first_page =3D alloc->pages;
> > > > > + struct page *p;
> > > > > + int ret =3D 0;
> > > > > +
> > > > > + for (i =3D restore->restored_pages; i < nr; ++i) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p =3D first_pag=
e[i];
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ttm_backup_=
page_ptr_is_handle(p)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long handle =3D
> > > > > ttm_backup_page_ptr_to_handle(p);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (handle =3D=3D 0) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 restore->restored_pages++;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 continue;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ttm_backup_copy_page(backup,
> > > > > restore->alloced_page + i,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle, ctx-
> > > > > > interruptible);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_backup_drop(backup, handle);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (p) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We could probably avoid splitting=
 the
> > > > > old page
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * using clever logic, but ATM we do=
n't
> > > > > care, as
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we prioritize releasing memory AS=
AP.
> > > > > Note that
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * here, the old retained page is al=
ways
> > > > > write-back
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cached.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_split_for_swap(restore->pool,
> > > > > p);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 copy_highpage(restore->alloced_page + i,
> > > > > p);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __free_pages(p, 0);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 restore->restor=
ed_pages++;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first_page[i] =
=3D
> > > > > ttm_backup_handle_to_page_ptr(0);
> > > > > + }
> > > > > +
> > > > > + if (ret) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!restore->r=
estored_pages) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr =3D alloc->dma_addr =
?
> > > > > &restore->first_dma : NULL;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_unmap_and_free(restore->pool,
> > > > > restore->alloced_page,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr,
> > > > > restore-
> > > > > > page_caching);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 restore->restored_pages =3D nr;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > > + }
> > > > > +
> > > > > + ttm_pool_allocated_page_commit(restore->alloced_page,
> > > > > restore->first_dma,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc, nr);
> > > > > + if (restore->page_caching =3D=3D alloc->tt_caching ||
> > > > > PageHighMem(restore->alloced_page))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc->caching_=
divide =3D alloc->pages;
> > > > > + restore->snapshot_alloc =3D *alloc;
> > > > > + restore->alloced_pages +=3D nr;
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +/* If restoring, save information needed for
> > > > > ttm_pool_restore_commit(). */
> > > > > +static void
> > > > > +ttm_pool_page_allocated_restore(struct ttm_pool *pool,
> > > > > unsigned
> > > > > int order,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct page *p,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 enum ttm_caching page_caching,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dma_addr_t first_dma,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct ttm_pool_tt_restore
> > > > > *restore,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 const struct
> > > > > ttm_pool_alloc_state
> > > > > *alloc)
> > > > > +{
> > > > > + restore->pool =3D pool;
> > > > > + restore->order =3D order;
> > > > > + restore->restored_pages =3D 0;
> > > > > + restore->page_caching =3D page_caching;
> > > > > + restore->first_dma =3D first_dma;
> > > > > + restore->alloced_page =3D p;
> > > > > + restore->snapshot_alloc =3D *alloc;
> > > > > +}
> > > > > +
> > > > > =C2=A0 /*
> > > > > =C2=A0=C2=A0 * Called when we got a page, either from a pool or n=
ewly
> > > > > allocated.
> > > > > =C2=A0=C2=A0 * if needed, dma map the page and populate the dma a=
ddress
> > > > > array.
> > > > > @@ -380,10 +590,11 @@ static unsigned int
> > > > > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > > > > =C2=A0=C2=A0 */
> > > > > =C2=A0 static int ttm_pool_page_allocated(struct ttm_pool *pool,
> > > > > unsigned int order,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct page *p, enum
> > > > > ttm_caching page_caching,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_alloc_state
> > > > > *alloc)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_alloc_state
> > > > > *alloc,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_tt_restore
> > > > > *restore)
> > > > > =C2=A0 {
> > > > > - pgoff_t i, nr =3D 1UL << order;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool cachi=
ng_consistent;
> > > > > + dma_addr_t first_dma;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r =3D =
0;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 caching_co=
nsistent =3D (page_caching =3D=3D alloc-
> > > > > >tt_caching)
> > > > > > > PageHighMem(p);
> > > > > @@ -395,17 +606,20 @@ static int
> > > > > ttm_pool_page_allocated(struct
> > > > > ttm_pool *pool, unsigned int order,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (alloc-=
>dma_addr) {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D ttm_pool_=
map(pool, order, p, &alloc-
> > > > > > dma_addr);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D ttm_pool_=
map(pool, order, p, &first_dma);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return r;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > - alloc->remaining_pages -=3D nr;
> > > > > - for (i =3D 0; i < nr; ++i)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *alloc->pages++=
 =3D p++;
> > > > > + if (restore) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_page_a=
llocated_restore(pool, order, p,
> > > > > page_caching,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 first_dma,
> > > > > restore, alloc);
> > > > > + } else {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_alloca=
ted_page_commit(p, first_dma,
> > > > > alloc, 1UL << order);
> > > > >=20
> > > > > - if (caching_consistent)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc->caching_=
divide =3D alloc->pages;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (caching_con=
sistent)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc->caching_divide =3D alloc->pages;
> > > > > + }
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > =C2=A0 }
> > > > > @@ -428,22 +642,24 @@ static void ttm_pool_free_range(struct
> > > > > ttm_pool *pool, struct ttm_tt *tt,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgoff_t start_=
page, pgoff_t
> > > > > end_page)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pag=
e **pages =3D &tt->pages[start_page];
> > > > > - unsigned int order;
> > > > > + struct ttm_backup *backup =3D tt->backup;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgoff_t i,=
 nr;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D=
 start_page; i < end_page; i +=3D nr, pages
> > > > > +=3D nr)
> > > > > {
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool=
_type *pt =3D NULL;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *p =
=3D *pages;
> > > > >=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D ttm_p=
ool_page_order(pool, *pages);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr =3D (1UL << =
order);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tt->dma_add=
ress)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_unmap(pool, tt->dma_address[i],
> > > > > nr);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr =3D 1;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ttm_backup_=
page_ptr_is_handle(p)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long handle =3D
> > > > > ttm_backup_page_ptr_to_handle(p);
> > > > >=20
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt =3D ttm_pool=
_select_type(pool, caching, order);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pt)
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_type_give(pt, *pages);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_free_page(pool, caching, order,
> > > > > *pages);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (handle !=3D 0)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ttm_backup_drop(backup, handle);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (p) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr =3D tt->dma_address =
?
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 tt->dma_address + i : NULL;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr =3D ttm_pool_unmap_and_free(pool, p,
> > > > > dma_addr, caching);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0 }
> > > > >=20
> > > > > @@ -467,22 +683,11 @@ static unsigned int
> > > > > ttm_pool_alloc_find_order(unsigned int highest,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return min=
_t(unsigned int, highest, __fls(alloc-
> > > > > > remaining_pages));
> > > > > =C2=A0 }
> > > > >=20
> > > > > -/**
> > > > > - * ttm_pool_alloc - Fill a ttm_tt object
> > > > > - *
> > > > > - * @pool: ttm_pool to use
> > > > > - * @tt: ttm_tt object to fill
> > > > > - * @ctx: operation context
> > > > > - *
> > > > > - * Fill the ttm_tt object with pages and also make sure to
> > > > > DMA
> > > > > map
> > > > > them when
> > > > > - * necessary.
> > > > > - *
> > > > > - * Returns: 0 on successe, negative error code otherwise.
> > > > > - */
> > > > > -int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct ttm_operation_ctx *ctx)
> > > > > +static int __ttm_pool_alloc(struct ttm_pool *pool, struct
> > > > > ttm_tt
> > > > > *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_=
operation_ctx *ctx,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_a=
lloc_state *alloc,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_t=
t_restore *restore)
> > > > > =C2=A0 {
> > > > > - struct ttm_pool_alloc_state alloc;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_c=
aching page_caching;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t gfp_=
flags =3D GFP_USER;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgoff_t ca=
ching_divide;
> > > > > @@ -491,10 +696,8 @@ int ttm_pool_alloc(struct ttm_pool
> > > > > *pool,
> > > > > struct ttm_tt *tt,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pag=
e *p;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r;
> > > > >=20
> > > > > - ttm_pool_alloc_state_init(tt, &alloc);
> > > > > -
> > > > > - WARN_ON(!alloc.remaining_pages ||
> > > > > ttm_tt_is_populated(tt));
> > > > > - WARN_ON(alloc.dma_addr && !pool->dev);
> > > > > + WARN_ON(!alloc->remaining_pages ||
> > > > > ttm_tt_is_populated(tt));
> > > > > + WARN_ON(alloc->dma_addr && !pool->dev);
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tt->pa=
ge_flags & TTM_TT_FLAG_ZERO_ALLOC)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_flags |=3D __GFP_ZERO;
> > > > > @@ -509,9 +712,9 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > > > > struct ttm_tt *tt,
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_cachi=
ng =3D tt->caching;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allow_pool=
s =3D true;
> > > > > - for (order =3D ttm_pool_alloc_find_order(MAX_PAGE_ORDER,
> > > > > &alloc);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc.remaining_pages;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D ttm_pool_alloc_find_ord=
er(order, &alloc)) {
> > > > > + for (order =3D ttm_pool_alloc_find_order(MAX_PAGE_ORDER,
> > > > > alloc);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc->remaining_pages;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D ttm_pool_alloc_find_ord=
er(order, alloc)) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool_type *pt;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* First, try to allocate a page fr=
om a
> > > > > pool if
> > > > > one exists. */
> > > > > @@ -541,30 +744,120 @@ int ttm_pool_alloc(struct ttm_pool
> > > > > *pool,
> > > > > struct ttm_tt *tt,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 r =3D -ENOMEM;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto error_free_all;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D ttm_pool_=
page_allocated(pool, order, p,
> > > > > page_caching, &alloc);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D ttm_pool_=
page_allocated(pool, order, p,
> > > > > page_caching, alloc,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 restore);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto error_free_page;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ttm_pool_re=
store_valid(restore)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D ttm_pool_restore_commit(restore, tt=
-
> > > > > > backup, ctx, alloc);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto error_free_all;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > > - r =3D ttm_pool_apply_caching(&alloc);
> > > > > + r =3D ttm_pool_apply_caching(alloc);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_free_all;
> > > > >=20
> > > > > + kfree(tt->restore);
> > > > > + tt->restore =3D NULL;
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > >=20
> > > > > =C2=A0 error_free_page:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_f=
ree_page(pool, page_caching, order, p);
> > > > >=20
> > > > > =C2=A0 error_free_all:
> > > > > - caching_divide =3D alloc.caching_divide - tt->pages;
> > > > > + if (tt->restore)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
> > > > > +
> > > > > + caching_divide =3D alloc->caching_divide - tt->pages;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_f=
ree_range(pool, tt, tt->caching, 0,
> > > > > caching_divide);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_f=
ree_range(pool, tt, ttm_cached,
> > > > > caching_divide,
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages -
> > > > > alloc.remaining_pages);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->num_pages - a=
lloc-
> > > > > > remaining_pages);
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
> > > > > =C2=A0 }
> > > > > +
> > > > > +/**
> > > > > + * ttm_pool_alloc - Fill a ttm_tt object
> > > > > + *
> > > > > + * @pool: ttm_pool to use
> > > > > + * @tt: ttm_tt object to fill
> > > > > + * @ctx: operation context
> > > > > + *
> > > > > + * Fill the ttm_tt object with pages and also make sure to
> > > > > DMA
> > > > > map
> > > > > them when
> > > > > + * necessary.
> > > > > + *
> > > > > + * Returns: 0 on successe, negative error code otherwise.
> > > > > + */
> > > > > +int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct ttm_operation_ctx *ctx)
> > > > > +{
> > > > > + struct ttm_pool_alloc_state alloc;
> > > > > +
> > > > > + if (WARN_ON(ttm_tt_is_backed_up(tt)))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > +
> > > > > + ttm_pool_alloc_state_init(tt, &alloc);
> > > > > +
> > > > > + return __ttm_pool_alloc(pool, tt, ctx, &alloc, NULL);
> > > > > +}
> > > > > =C2=A0 EXPORT_SYMBOL(ttm_pool_alloc);
> > > > >=20
> > > > > +/**
> > > > > + * ttm_pool_restore_and_alloc - Fill a ttm_tt, restoring
> > > > > previously backed-up
> > > > > + * content.
> > > > > + *
> > > > > + * @pool: ttm_pool to use
> > > > > + * @tt: ttm_tt object to fill
> > > > > + * @ctx: operation context
> > > > > + *
> > > > > + * Fill the ttm_tt object with pages and also make sure to
> > > > > DMA
> > > > > map
> > > > > them when
> > > > > + * necessary. Read in backed-up content.
> > > > > + *
> > > > > + * Returns: 0 on successe, negative error code otherwise.
> > > > > + */
> > > > > +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct
> > > > > ttm_tt *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const struct ttm_operation_ctx
> > > > > *ctx)
> > > > > +{
> > > > > + struct ttm_pool_alloc_state alloc;
> > > > > +
> > > > > + if (WARN_ON(!ttm_tt_is_backed_up(tt)))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > +
> > > > > + if (!tt->restore) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp_t gfp =3D G=
FP_KERNEL | __GFP_NOWARN;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_alloc_=
state_init(tt, &alloc);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ctx->gfp_re=
try_mayfail)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp |=3D __GFP_RETRY_MAYFAIL;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->restore =3D=
 kzalloc(sizeof(*tt->restore),
> > > > > gfp);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!tt->restor=
e)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->restore->sn=
apshot_alloc =3D alloc;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->restore->po=
ol =3D pool;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->restore->re=
stored_pages =3D 1;
> > > > > + } else {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_pool=
_tt_restore *restore =3D tt-
> > > > > > restore;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc =3D resto=
re->snapshot_alloc;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ttm_pool_re=
store_valid(tt->restore)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ttm_pool_restore_commit(restore,
> > > > > tt-
> > > > > > backup, ctx, &alloc);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!alloc.rema=
ining_pages)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > + }
> > > > > +
> > > > > + return __ttm_pool_alloc(pool, tt, ctx, &alloc, tt-
> > > > > > restore);
> > > > > +}
> > > > > +
> > > > > =C2=A0 /**
> > > > > =C2=A0=C2=A0 * ttm_pool_free - Free the backing pages from a ttm_=
tt
> > > > > object
> > > > > =C2=A0=C2=A0 *
> > > > > @@ -582,6 +875,163 @@ void ttm_pool_free(struct ttm_pool
> > > > > *pool,
> > > > > struct ttm_tt *tt)
> > > > > =C2=A0 }
> > > > > =C2=A0 EXPORT_SYMBOL(ttm_pool_free);
> > > > >=20
> > > > > +/**
> > > > > + * ttm_pool_drop_backed_up() - Release content of a swapped-
> > > > > out
> > > > > struct ttm_tt
> > > > > + * @tt: The struct ttm_tt.
> > > > > + *
> > > > > + * Release handles with associated content or any remaining
> > > > > pages
> > > > > of
> > > > > + * a backed-up struct ttm_tt.
> > > > > + */
> > > > > +void ttm_pool_drop_backed_up(struct ttm_tt *tt)
> > > > > +{
> > > > > + struct ttm_pool_tt_restore *restore;
> > > > > + pgoff_t start_page =3D 0;
> > > > > +
> > > > > + WARN_ON(!ttm_tt_is_backed_up(tt));
> > > > > +
> > > > > + restore =3D tt->restore;
> > > > > +
> > > > > + /*
> > > > > +=C2=A0 * Unmap and free any uncommitted restore page.
> > > > > +=C2=A0 * any tt page-array backup entries already read back
> > > > > has
> > > > > +=C2=A0 * been cleared already
> > > > > +=C2=A0 */
> > > > > + if (ttm_pool_restore_valid(restore)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma=
_addr =3D tt->dma_address ?
> > > > > &restore-
> > > > > > first_dma : NULL;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_unmap_=
and_free(restore->pool, restore-
> > > > > > alloced_page,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr, restore-
> > > > > > page_caching);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 restore->restor=
ed_pages =3D 1UL << restore->order;
> > > > > + }
> > > > > +
> > > > > + /*
> > > > > +=C2=A0 * If a restore is ongoing, part of the tt pages may
> > > > > have
> > > > > a
> > > > > +=C2=A0 * caching different than writeback.
> > > > > +=C2=A0 */
> > > > > + if (restore) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgoff_t mid =3D=
 restore-
> > > > > > snapshot_alloc.caching_divide - tt->pages;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start_page =3D =
restore->alloced_pages;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(mid > s=
tart_page);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Pages that m=
ight be dma-mapped and non-cached
> > > > > */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_free_r=
ange(restore->pool, tt, tt-
> > > > > > caching,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, mid);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Pages that m=
ight be dma-mapped but cached */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_free_r=
ange(restore->pool, tt,
> > > > > ttm_cached,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mid, restore-
> > > > > > alloced_pages);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(restore);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->restore =3D=
 NULL;
> > > > > + }
> > > > > +
> > > > > + ttm_pool_free_range(NULL, tt, ttm_cached, start_page,
> > > > > tt-
> > > > > > num_pages);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * ttm_pool_backup() - Back up or purge a struct ttm_tt
> > > > > + * @pool: The pool used when allocating the struct ttm_tt.
> > > > > + * @tt: The struct ttm_tt.
> > > > > + * @flags: Flags to govern the backup behaviour.
> > > > > + *
> > > > > + * Back up or purge a struct ttm_tt. If @purge is true, then
> > > > > + * all pages will be freed directly to the system rather
> > > > > than to
> > > > > the pool
> > > > > + * they were allocated from, making the function behave
> > > > > similarly
> > > > > to
> > > > > + * ttm_pool_free(). If @purge is false the pages will be
> > > > > backed
> > > > > up
> > > > > instead,
> > > > > + * exchanged for handles.
> > > > > + * A subsequent call to ttm_pool_restore_and_alloc() will
> > > > > then
> > > > > read back the content and
> > > > > + * a subsequent call to ttm_pool_drop_backed_up() will drop
> > > > > it.
> > > > > + * If backup of a page fails for whatever reason, @ttm will
> > > > > still
> > > > > be
> > > > > + * partially backed up, retaining those pages for which
> > > > > backup
> > > > > fails.
> > > > > + * In that case, this function can be retried, possibly
> > > > > after
> > > > > freeing up
> > > > > + * memory resources.
> > > > > + *
> > > > > + * Return: Number of pages actually backed up or freed, or
> > > > > negative
> > > > > + * error code on error.
> > > > > + */
> > > > > +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt
> > > > > *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const struct ttm_backup_flags *flags)
> > > > > +{
> > > > > + struct ttm_backup *backup =3D tt->backup;
> > > > > + struct page *page;
> > > > > + unsigned long handle;
> > > > > + gfp_t alloc_gfp;
> > > > > + gfp_t gfp;
> > > > > + int ret =3D 0;
> > > > > + pgoff_t shrunken =3D 0;
> > > > > + pgoff_t i, num_pages;
> > > > > +
> > > > > + if (WARN_ON(ttm_tt_is_backed_up(tt)))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > > +
> > > > > + if ((!ttm_backup_bytes_avail() && !flags->purge) ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 pool->use_dma_alloc || ttm_tt_is_backed=
_up(tt))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBUSY;
> > > > > +
> > > > > +#ifdef CONFIG_X86
> > > > > + /* Anything returned to the system needs to be cached.
> > > > > */
> > > > > + if (tt->caching !=3D ttm_cached)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_pages_array=
_wb(tt->pages, tt->num_pages);
> > > > > +#endif
> > > > > +
> > > > > + if (tt->dma_address || flags->purge) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i=
 < tt->num_pages; i +=3D num_pages) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page =3D tt->pages[i];
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!page)) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 num_pages =3D 1;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 continue;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D ttm_pool_page_order(pool, page)=
;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_pages =3D 1UL << order;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tt->dma_address)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ttm_pool_unmap(pool, tt-
> > > > > > dma_address[i],
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 num_pages);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (flags->purge) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 shrunken +=3D num_pages;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 page->private =3D 0;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 __free_pages(page, order);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 memset(tt->pages + i, 0,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_pages * sizeof(*tt-
> > > > > > pages));
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > + }
> > > > > +
> > > > > + if (flags->purge)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return shrunken=
;
> > > > > +
> > > > > + if (pool->use_dma32)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp =3D GFP_DMA=
32;
> > > > > + else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp =3D GFP_HIG=
HUSER;
> > > > > +
> > > > > + alloc_gfp =3D GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
> > > > > __GFP_RETRY_MAYFAIL;
> > > > > +
> > > > > + for (i =3D 0; i < tt->num_pages; ++i) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s64 shandle;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page =3D tt->pa=
ges[i];
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(!p=
age))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_split_=
for_swap(pool, page);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shandle =3D ttm=
_backup_backup_page(backup, page,
> > > > > flags->writeback, i,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfp,
> > > > > alloc_gfp);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (shandle < 0=
) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We allow partially shrunken tts */
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D shandle;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle =3D shan=
dle;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->pages[i] =
=3D
> > > > > ttm_backup_handle_to_page_ptr(handle);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_page(page);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shrunken++;
> > > > > + }
> > > > > +
> > > > > + return shrunken ? shrunken : ret;
> > > > > +}
> > > > > +
> > > > > =C2=A0 /**
> > > > > =C2=A0=C2=A0 * ttm_pool_init - Initialize a pool
> > > > > =C2=A0=C2=A0 *
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > index 3baf215eca23..00b7c28f2329 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > @@ -40,6 +40,7 @@
> > > > > =C2=A0 #include <drm/drm_cache.h>
> > > > > =C2=A0 #include <drm/drm_device.h>
> > > > > =C2=A0 #include <drm/drm_util.h>
> > > > > +#include <drm/ttm/ttm_backup.h>
> > > > > =C2=A0 #include <drm/ttm/ttm_bo.h>
> > > > > =C2=A0 #include <drm/ttm/ttm_tt.h>
> > > > >=20
> > > > > @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct
> > > > > ttm_tt
> > > > > *ttm,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm->swap_=
storage =3D NULL;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm->sg =
=3D bo->sg;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm->cachi=
ng =3D caching;
> > > > > + ttm->restore =3D NULL;
> > > > > + ttm->backup =3D NULL;
> > > > > =C2=A0 }
> > > > >=20
> > > > > =C2=A0 int ttm_tt_init(struct ttm_tt *ttm, struct
> > > > > ttm_buffer_object
> > > > > *bo,
> > > > > @@ -182,6 +185,13 @@ void ttm_tt_fini(struct ttm_tt *ttm)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fput(ttm->swap_storage);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm->swap_=
storage =3D NULL;
> > > > >=20
> > > > > + if (ttm_tt_is_backed_up(ttm))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_drop_b=
acked_up(ttm);
> > > > > + if (ttm->backup) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_backup_fini=
(ttm->backup);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm->backup =3D=
 NULL;
> > > > > + }
> > > > > +
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ttm->p=
ages)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvfree(ttm->pages);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > > @@ -253,6 +263,49 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
> > > > > =C2=A0 }
> > > > > =C2=A0 EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
> > > > >=20
> > > > > +/**
> > > > > + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> > > > > + * @bdev: The TTM device.
> > > > > + * @tt: The struct ttm_tt.
> > > > > + * @flags: Flags that govern the backup behaviour.
> > > > > + *
> > > > > + * Update the page accounting and call ttm_pool_shrink_tt to
> > > > > free
> > > > > pages
> > > > > + * or back them up.
> > > > > + *
> > > > > + * Return: Number of pages freed or swapped out, or negative
> > > > > error
> > > > > code on
> > > > > + * error.
> > > > > + */
> > > > > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt
> > > > > *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const struct ttm_backup_flags flags)
> > > > > +{
> > > > > + long ret;
> > > > > +
> > > > > + if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > > +
> > > > > + ret =3D ttm_pool_backup(&bdev->pool, tt, &flags);
> > > > > + if (ret > 0) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->page_flags =
&=3D ~TTM_TT_FLAG_PRIV_POPULATED;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tt->page_flags =
|=3D TTM_TT_FLAG_BACKED_UP;
> > > > > + }
> > > > > +
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt
> > > > > *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const struct ttm_operation_ctx *ctx)
> > > > > +{
> > > > > + int ret =3D ttm_pool_restore_and_alloc(&bdev->pool, tt,
> > > > > ctx);
> > > > > +
> > > > > + if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > > +
> > > > > + tt->page_flags &=3D ~TTM_TT_FLAG_BACKED_UP;
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL(ttm_tt_restore);
> > > > > +
> > > > > =C2=A0 /**
> > > > > =C2=A0=C2=A0 * ttm_tt_swapout - swap out tt object
> > > > > =C2=A0=C2=A0 *
> > > > > @@ -348,6 +401,7 @@ int ttm_tt_populate(struct ttm_device
> > > > > *bdev,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm->page_=
flags |=3D TTM_TT_FLAG_PRIV_POPULATED;
> > > > > + ttm->page_flags &=3D ~TTM_TT_FLAG_BACKED_UP;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlike=
ly(ttm->page_flags &
> > > > > TTM_TT_FLAG_SWAPPED)) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ttm_tt_swapin(ttm);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (unlikely(ret !=3D 0)) {
> > > > > diff --git a/include/drm/ttm/ttm_pool.h
> > > > > b/include/drm/ttm/ttm_pool.h
> > > > > index 160d954a261e..54cd34a6e4c0 100644
> > > > > --- a/include/drm/ttm/ttm_pool.h
> > > > > +++ b/include/drm/ttm/ttm_pool.h
> > > > > @@ -33,6 +33,7 @@
> > > > >=20
> > > > > =C2=A0 struct device;
> > > > > =C2=A0 struct seq_file;
> > > > > +struct ttm_backup_flags;
> > > > > =C2=A0 struct ttm_operation_ctx;
> > > > > =C2=A0 struct ttm_pool;
> > > > > =C2=A0 struct ttm_tt;
> > > > > @@ -89,6 +90,13 @@ void ttm_pool_fini(struct ttm_pool *pool);
> > > > >=20
> > > > > =C2=A0 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_fil=
e
> > > > > *m);
> > > > >=20
> > > > > +void ttm_pool_drop_backed_up(struct ttm_tt *tt);
> > > > > +
> > > > > +long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt
> > > > > *ttm,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 const struct ttm_backup_flags *flags);
> > > > > +int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct
> > > > > ttm_tt *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const struct ttm_operation_ctx
> > > > > *ctx);
> > > > > +
> > > > > =C2=A0 int ttm_pool_mgr_init(unsigned long num_pages);
> > > > > =C2=A0 void ttm_pool_mgr_fini(void);
> > > > >=20
> > > > > diff --git a/include/drm/ttm/ttm_tt.h
> > > > > b/include/drm/ttm/ttm_tt.h
> > > > > index 991edafdb2dd..c736c01ac2ca 100644
> > > > > --- a/include/drm/ttm/ttm_tt.h
> > > > > +++ b/include/drm/ttm/ttm_tt.h
> > > > > @@ -32,11 +32,13 @@
> > > > > =C2=A0 #include <drm/ttm/ttm_caching.h>
> > > > > =C2=A0 #include <drm/ttm/ttm_kmap_iter.h>
> > > > >=20
> > > > > +struct ttm_backup;
> > > > > =C2=A0 struct ttm_device;
> > > > > =C2=A0 struct ttm_tt;
> > > > > =C2=A0 struct ttm_resource;
> > > > > =C2=A0 struct ttm_buffer_object;
> > > > > =C2=A0 struct ttm_operation_ctx;
> > > > > +struct ttm_pool_tt_restore;
> > > > >=20
> > > > > =C2=A0 /**
> > > > > =C2=A0=C2=A0 * struct ttm_tt - This is a structure holding the pa=
ges,
> > > > > caching- and aperture
> > > > > @@ -85,17 +87,22 @@ struct ttm_tt {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * fa=
ult handling abuses the DMA api a bit and
> > > > > dma_map_attrs can't be
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * us=
ed to assure pgprot always matches.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > +=C2=A0 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set
> > > > > if the
> > > > > +=C2=A0 * struct ttm_tt has been (possibly partially) backed
> > > > > up.
> > > > > +=C2=A0 *
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TT=
M_TT_FLAG_PRIV_POPULATED: TTM internal only.
> > > > > DO NOT
> > > > > USE. This is
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * se=
t by TTM after ttm_tt_populate() has
> > > > > successfully
> > > > > returned, and is
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * th=
en unset when TTM calls ttm_tt_unpopulate().
> > > > > +=C2=A0 *
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0 #define TTM_TT_FLAG_SWAPPED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
> > > > > =C2=A0 #define TTM_TT_FLAG_ZERO_ALLOC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
> > > > > =C2=A0 #define TTM_TT_FLAG_EXTERNAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
> > > > > =C2=A0 #define TTM_TT_FLAG_EXTERNAL_MAPPABLE=C2=A0=C2=A0 BIT(3)
> > > > > =C2=A0 #define TTM_TT_FLAG_DECRYPTED=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> > > > > +#define TTM_TT_FLAG_BACKED_UP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5)
> > > > >=20
> > > > > -#define TTM_TT_FLAG_PRIV_POPULATED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(5)
> > > > > +#define TTM_TT_FLAG_PRIV_POPULATED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(6)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t p=
age_flags;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @num_p=
ages: Number of pages in the page array.
> > > > > */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t n=
um_pages;
> > > > > @@ -105,11 +112,20 @@ struct ttm_tt {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t=
 *dma_address;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @swap_=
storage: Pointer to shmem struct file for
> > > > > swap
> > > > > storage. */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct fil=
e *swap_storage;
> > > > > + /**
> > > > > +=C2=A0 * @backup: Pointer to backup struct for backed up tts.
> > > > > +=C2=A0 * Could be unified with @swap_storage. Meanwhile, the
> > > > > driver's
> > > > > +=C2=A0 * ttm_tt_create() callback is responsible for assigning
> > > > > +=C2=A0 * this field.
> > > > > +=C2=A0 */
> > > > > + struct ttm_backup *backup;
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @c=
aching: The current caching state of the
> > > > > pages, see
> > > > > enum
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * tt=
m_caching.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_c=
aching caching;
> > > > > + /** @restore: Partial restoration from backup state. TTM
> > > > > private */
> > > > > + struct ttm_pool_tt_restore *restore;
> > > > > =C2=A0 };
> > > > >=20
> > > > > =C2=A0 /**
> > > > > @@ -129,9 +145,38 @@ static inline bool
> > > > > ttm_tt_is_populated(struct
> > > > > ttm_tt *tt)
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return tt-=
>page_flags & TTM_TT_FLAG_PRIV_POPULATED;
> > > > > =C2=A0 }
> > > > >=20
> > > > > +/**
> > > > > + * ttm_tt_is_swapped() - Whether the ttm_tt is swapped out
> > > > > or
> > > > > backed up
> > > > > + * @tt: The struct ttm_tt.
> > > > > + *
> > > > > + * Return: true if swapped or backed up, false otherwise.
> > > > > + */
> > > > > =C2=A0 static inline bool ttm_tt_is_swapped(const struct ttm_tt
> > > > > *tt)
> > > > > =C2=A0 {
> > > > > - return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> > > > > + return tt->page_flags & (TTM_TT_FLAG_SWAPPED |
> > > > > TTM_TT_FLAG_BACKED_UP);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * ttm_tt_is_backed_up() - Whether the ttm_tt backed up
> > > > > + * @tt: The struct ttm_tt.
> > > > > + *
> > > > > + * Return: true if swapped or backed up, false otherwise.
> > > > > + */
> > > > > +static inline bool ttm_tt_is_backed_up(const struct ttm_tt
> > > > > *tt)
> > > > > +{
> > > > > + return tt->page_flags & TTM_TT_FLAG_BACKED_UP;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * ttm_tt_clear_backed_up() - Clear the ttm_tt backed-up
> > > > > status
> > > > > + * @tt: The struct ttm_tt.
> > > > > + *
> > > > > + * Drivers can use this functionto clear the backed-up
> > > > > status,
> > > > > + * for example before destroying or re-validating a purged
> > > > > tt.
> > > > > + */
> > > > > +static inline void ttm_tt_clear_backed_up(struct ttm_tt *tt)
> > > > > +{
> > > > > + tt->page_flags &=3D ~TTM_TT_FLAG_BACKED_UP;
> > > > > =C2=A0 }
> > > > >=20
> > > > > =C2=A0 /**
> > > > > @@ -235,6 +280,24 @@ void ttm_tt_mgr_init(unsigned long
> > > > > num_pages,
> > > > > unsigned long num_dma32_pages);
> > > > > =C2=A0 struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
> > > > > ttm_kmap_iter_tt *iter_tt,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_tt
> > > > > *tt);
> > > > > =C2=A0 unsigned long ttm_tt_pages_limit(void);
> > > > > +
> > > > > +/**
> > > > > + * struct ttm_backup_flags - Flags to govern backup
> > > > > behaviour.
> > > > > + * @purge: Free pages without backing up. Bypass pools.
> > > > > + * @writeback: Attempt to copy contents directly to swap
> > > > > space,
> > > > > even
> > > > > + * if that means blocking on writes to external memory.
> > > > > + */
> > > > > +struct ttm_backup_flags {
> > > > > + u32 purge : 1;
> > > > > + u32 writeback : 1;
> > > > > +};
> > > > > +
> > > > > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt
> > > > > *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const struct ttm_backup_flags flags);
> > > > > +
> > > > > +int ttm_tt_restore(struct ttm_device *bdev, struct ttm_tt
> > > > > *tt,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const struct ttm_operation_ctx *ctx);
> > > > > +
> > > > > =C2=A0 #if IS_ENABLED(CONFIG_AGP)
> > > > > =C2=A0 #include <linux/agp_backend.h>
> > > > >=20
> > > >=20
> > >=20
> >=20

