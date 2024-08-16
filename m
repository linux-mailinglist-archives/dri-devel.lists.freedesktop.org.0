Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F68795460E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 11:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5431A10E594;
	Fri, 16 Aug 2024 09:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYScxlEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0694310E58B;
 Fri, 16 Aug 2024 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723801647; x=1755337647;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZbVEBurPRuLu9W5mh86apYY1FAi4FTSUOXicPObsOlQ=;
 b=VYScxlEFyNGmkfCfESSAN6lU8lBA15SrrowEX4Bqc8p/6DRXGnCcnNQa
 CrvvWSPXB69bEFk9NXHJ0x7mOTnoNw5dKsxTaa6pf/EnAkAlcVgACov0I
 CzvzFjKMGSgK9kFkWomEvpW7fSWdnZ26jVmGpAhp9vzcdNt4pNb39ooX7
 l0ukjah3zNMKRW6Cd4AJDoCwwYWLErUbUwWYQdQ0A7lmKbyCoVGfLJ5ua
 HNGvVgBgrfYIzFG9X7h5leLCsq0oXFMk26FHJwV8eApohIaYrfay0iWuL
 brseRY+OgDZLglp0/TFh3pfuFdv/AQTlZyFuRorvMuZO/R7OCK+7EdKB4 A==;
X-CSE-ConnectionGUID: 6FgvT3sxROGIlQM2CCHD2A==
X-CSE-MsgGUID: PraJaBvxRAKPWEKFvRhy/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="44611143"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="44611143"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 02:47:26 -0700
X-CSE-ConnectionGUID: U5rgM0QcTAegXqBBYBdhCw==
X-CSE-MsgGUID: Q4+spq6yStWpfH5N+fKRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59460745"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.232])
 ([10.245.245.232])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 02:47:25 -0700
Message-ID: <78b356bd906e98f7dc738b4e0d2c6c5131c78f8b.camel@linux.intel.com>
Subject: Re: [PATCH v6 09/12] drm/ttm/pool: Provide a helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Fri, 16 Aug 2024 11:47:22 +0200
In-Reply-To: <ZrQFgmYPJuM24AVJ@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-10-thomas.hellstrom@linux.intel.com>
 <ZrQFgmYPJuM24AVJ@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-08-07 at 23:38 +0000, Matthew Brost wrote:
> On Wed, Jul 03, 2024 at 05:38:10PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Provide a helper to shrink ttm_tt page-vectors on a per-page
> > basis. A ttm_backup backend could then in theory get away with
> > allocating a single temporary page for each struct ttm_tt.
> >=20
> > This is accomplished by splitting larger pages before trying to
> > back them up.
> >=20
> > In the future we could allow ttm_backup to handle backing up
> > large pages as well, but currently there's no benefit in
> > doing that, since the shmem backup backend would have to
> > split those anyway to avoid allocating too much temporary
> > memory, and if the backend instead inserts pages into the
> > swap-cache, those are split on reclaim by the core.
> >=20
> > Due to potential backup- and recover errors, allow partially
> > swapped
> > out struct ttm_tt's, although mark them as swapped out stopping
> > them
> > from being swapped out a second time. More details in the
> > ttm_pool.c
> > DOC section.
> >=20
> > v2:
> > - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> > - s/back_up/backup/
> > - Add a writeback parameter to the exported interface.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 397
> > +++++++++++++++++++++++++++++++--
> > =C2=A0drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0 |=C2=A0 37 +++
> > =C2=A0include/drm/ttm/ttm_pool.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
5 +
> > =C2=A0include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++
> > =C2=A04 files changed, 446 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > b/drivers/gpu/drm/ttm/ttm_pool.c
> > index 6e1fd6985ffc..38e50cf81b0a 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -41,6 +41,7 @@
> > =C2=A0#include <asm/set_memory.h>
> > =C2=A0#endif
> > =C2=A0
> > +#include <drm/ttm/ttm_backup.h>
> > =C2=A0#include <drm/ttm/ttm_pool.h>
> > =C2=A0#include <drm/ttm/ttm_tt.h>
> > =C2=A0#include <drm/ttm/ttm_bo.h>
> > @@ -58,6 +59,32 @@ struct ttm_pool_dma {
> > =C2=A0	unsigned long vaddr;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct ttm_pool_tt_restore - State representing restore from
> > backup
> > + * @alloced_pages: Total number of already allocated pages for the
> > ttm_tt.
> > + * @restored_pages: Number of (sub) pages restored from swap for
> > this
> > + *		=C2=A0=C2=A0=C2=A0=C2=A0 chunk of 1 << @order pages.
> > + * @first_page: The ttm page ptr representing for @old_pages[0].
> > + * @caching_divide: Page pointer where subsequent pages are
> > cached.
> > + * @old_pages: Backup copy of page pointers that were replaced by
> > the new
> > + *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page allocation.
> > + * @pool: The pool used for page allocation while restoring.
> > + * @order: The order of the last page allocated while restoring.
> > + *
> > + * Recovery from backup might fail when we've recovered less than
> > the
> > + * full ttm_tt. In order not to loose any data (yet), keep
> > information
> > + * around that allows us to restart a failed ttm backup recovery.
> > + */
> > +struct ttm_pool_tt_restore {
> > +	pgoff_t alloced_pages;
> > +	pgoff_t restored_pages;
> > +	struct page **first_page;
> > +	struct page **caching_divide;
> > +	struct ttm_pool *pool;
> > +	unsigned int order;
> > +	struct page *old_pages[];
> > +};
> > +
> > =C2=A0static unsigned long page_pool_size;
> > =C2=A0
> > =C2=A0MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DM=
A
> > pool");
> > @@ -354,11 +381,102 @@ static unsigned int
> > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > =C2=A0	return p->private;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * To be able to insert single pages into backup directly,
> > + * we need to split multi-order page allocations and make them
> > look
> > + * like single-page allocations.
> > + */
> > +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct
> > page *p)
> > +{
> > +	unsigned int order =3D ttm_pool_page_order(pool, p);
> > +	pgoff_t nr;
> > +
> > +	if (!order)
> > +		return;
> > +
> > +	split_page(p, order);
> > +	nr =3D 1UL << order;
> > +	while (nr--)
> > +		(p++)->private =3D 0;
> > +}
> > +
> > +/**
> > + * DOC: Partial backup and restoration of a struct ttm_tt.
> > + *
> > + * Swapout using ttm_backup::ops::backup_page() and swapin using
> > + * ttm_backup::ops::copy_backed_up_page() may fail.
> > + * The former most likely due to lack of swap-space or memory, the
> > latter due
> > + * to lack of memory or because of signal interruption during
> > waits.
> > + *
> > + * Backupfailure is easily handled by using a ttm_tt pages vector
> > that holds
> > + * both swap entries and page pointers. This has to be taken into
> > account when
> > + * restoring such a ttm_tt from backup, and when freeing it while
> > backed up.
> > + * When restoring, for simplicity, new pages are actually
> > allocated from the
> > + * pool and the contents of any old pages are copied in and then
> > the old pages
> > + * are released.
> > + *
> > + * For restoration failures, the struct ttm_pool_tt_restore holds
> > sufficient state
> > + * to be able to resume an interrupted restore, and that structure
> > is freed once
> > + * the restoration is complete. If the struct ttm_tt is destroyed
> > while there
> > + * is a valid struct ttm_pool_tt_restore attached, that is also
> > properly taken
> > + * care of.
> > + */
> > +
> > +static bool ttm_pool_restore_valid(const struct
> > ttm_pool_tt_restore *restore)
> > +{
> > +	return restore && restore->restored_pages < (1 << restore-
> > >order);
> > +}
> > +
> > +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore
> > *restore,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_backup *backup,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> > +{
> > +	unsigned int i, nr =3D 1 << restore->order;
> > +	int ret =3D 0;
> > +
> > +	if (!ttm_pool_restore_valid(restore))
> > +		return 0;
> > +
> > +	for (i =3D restore->restored_pages; i < nr; ++i) {
> > +		struct page *p =3D restore->old_pages[i];
> > +
> > +		if (ttm_backup_page_ptr_is_handle(p)) {
> > +			unsigned long handle =3D
> > ttm_backup_page_ptr_to_handle(p);
> > +
> > +			if (handle =3D=3D 0)
> > +				continue;
> > +
> > +			ret =3D backup->ops->copy_backed_up_page
> > +				(backup, restore->first_page[i],
> > +				 handle, ctx->interruptible);
> > +			if (ret)
> > +				break;
> > +
> > +			backup->ops->drop(backup, handle);
> > +		} else if (p) {
> > +			/*
> > +			 * We could probably avoid splitting the
> > old page
> > +			 * using clever logic, but ATM we don't
> > care.
> > +			 */
> > +			ttm_pool_split_for_swap(restore->pool, p);
> > +			copy_highpage(restore->first_page[i], p);
> > +			__free_pages(p, 0);
> > +		}
> > +
> > +		restore->restored_pages++;
> > +		restore->old_pages[i] =3D NULL;
> > +		cond_resched();
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > =C2=A0/* Called when we got a page, either from a pool or newly
> > allocated */
> > =C2=A0static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigne=
d
> > int order,
> > =C2=A0				=C2=A0=C2=A0 struct page *p, dma_addr_t
> > **dma_addr,
> > =C2=A0				=C2=A0=C2=A0 unsigned long *num_pages,
> > -				=C2=A0=C2=A0 struct page ***pages)
> > +				=C2=A0=C2=A0 struct page ***pages,
> > +				=C2=A0=C2=A0 struct ttm_pool_tt_restore
> > *restore)
> > =C2=A0{
> > =C2=A0	unsigned int i;
> > =C2=A0	int r;
> > @@ -369,6 +487,16 @@ static int ttm_pool_page_allocated(struct
> > ttm_pool *pool, unsigned int order,
> > =C2=A0			return r;
> > =C2=A0	}
> > =C2=A0
> > +	if (restore) {
> > +		memcpy(restore->old_pages, *pages,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << order) * sizeof(*restore-
> > >old_pages));
> > +		memset(*pages, 0, (1 << order) * sizeof(**pages));
> > +		restore->order =3D order;
> > +		restore->restored_pages =3D 0;
> > +		restore->first_page =3D *pages;
> > +		restore->alloced_pages +=3D 1UL << order;
> > +	}
> > +
> > =C2=A0	*num_pages -=3D 1 << order;
> > =C2=A0	for (i =3D 1 << order; i; --i, ++(*pages), ++p)
> > =C2=A0		**pages =3D p;
> > @@ -394,22 +522,39 @@ static void ttm_pool_free_range(struct
> > ttm_pool *pool, struct ttm_tt *tt,
> > =C2=A0				pgoff_t start_page, pgoff_t
> > end_page)
> > =C2=A0{
> > =C2=A0	struct page **pages =3D &tt->pages[start_page];
> > +	struct ttm_backup *backup =3D tt->backup;
> > =C2=A0	unsigned int order;
> > =C2=A0	pgoff_t i, nr;
> > =C2=A0
> > =C2=A0	for (i =3D start_page; i < end_page; i +=3D nr, pages +=3D nr) {
> > =C2=A0		struct ttm_pool_type *pt =3D NULL;
> > +		struct page *p =3D *pages;
> > +
> > +		if (ttm_backup_page_ptr_is_handle(p)) {
> > +			unsigned long handle =3D
> > ttm_backup_page_ptr_to_handle(p);
> > +
> > +			nr =3D 1;
> > +			if (handle !=3D 0)
> > +				backup->ops->drop(backup, handle);
> > +			continue;
> > +		}
> > +
> > +		if (pool) {
> > +			order =3D ttm_pool_page_order(pool, p);
> > +			nr =3D (1UL << order);
> > +			if (tt->dma_address)
> > +				ttm_pool_unmap(pool, tt-
> > >dma_address[i], nr);
> > =C2=A0
> > -		order =3D ttm_pool_page_order(pool, *pages);
> > -		nr =3D (1UL << order);
> > -		if (tt->dma_address)
> > -			ttm_pool_unmap(pool, tt->dma_address[i],
> > nr);
> > +			pt =3D ttm_pool_select_type(pool, caching,
> > order);
> > +		} else {
> > +			order =3D p->private;
> > +			nr =3D (1UL << order);
> > +		}
> > =C2=A0
> > -		pt =3D ttm_pool_select_type(pool, caching, order);
> > =C2=A0		if (pt)
> > -			ttm_pool_type_give(pt, *pages);
> > +			ttm_pool_type_give(pt, p);
> > =C2=A0		else
> > -			ttm_pool_free_page(pool, caching, order,
> > *pages);
> > +			ttm_pool_free_page(pool, caching, order,
> > p);
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > @@ -453,9 +598,37 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > struct ttm_tt *tt,
> > =C2=A0	else
> > =C2=A0		gfp_flags |=3D GFP_HIGHUSER;
> > =C2=A0
> > -	for (order =3D min_t(unsigned int, MAX_PAGE_ORDER,
> > __fls(num_pages));
> > -	=C2=A0=C2=A0=C2=A0=C2=A0 num_pages;
> > -	=C2=A0=C2=A0=C2=A0=C2=A0 order =3D min_t(unsigned int, order, __fls(n=
um_pages)))
> > {
> > +	order =3D min_t(unsigned int, MAX_PAGE_ORDER,
> > __fls(num_pages));
> > +
> > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> > +		if (!tt->restore) {
> > +			gfp_t gfp =3D GFP_KERNEL | __GFP_NOWARN;
> > +
> > +			if (ctx->gfp_retry_mayfail)
> > +				gfp |=3D __GFP_RETRY_MAYFAIL;
> > +
> > +			tt->restore =3D
> > +				kvzalloc(struct_size(tt->restore,
> > old_pages,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 (size_t)1 <<
> > order), gfp);
> > +			/* RFC: Possibly loop on -ENOMEM and
> > reduce order. */
>=20
> I'd say this is fine as is. If we can't allocate memory from an array
> of
> pages here we likely pretty much screwed, right? e.g. We likely don't
> have a chance of actually allocating new pages for the backing store
> anyways. Also wouldn't the restart be broken if we can't fully track
> the
> state of the restore?
>=20
> > +			if (!tt->restore)
> > +				return -ENOMEM;
> > +		} else if (ttm_pool_restore_valid(tt->restore)) {
> > +			struct ttm_pool_tt_restore *restore =3D tt-
> > >restore;
> > +
> > +			num_pages -=3D restore->alloced_pages;
> > +			order =3D min_t(unsigned int, order,
> > __fls(num_pages));
> > +			pages +=3D restore->alloced_pages;
> > +			r =3D ttm_pool_restore_tt(restore, tt-
> > >backup, ctx);
> > +			if (r)
> > +				return r;
> > +			caching =3D restore->caching_divide;
> > +		}
> > +
> > +		tt->restore->pool =3D pool;
> > +	}
> > +
> > +	for (; num_pages; order =3D min_t(unsigned int, order,
> > __fls(num_pages))) {
> > =C2=A0		struct ttm_pool_type *pt;
> > =C2=A0
> > =C2=A0		page_caching =3D tt->caching;
> > @@ -472,11 +645,19 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > struct ttm_tt *tt,
> > =C2=A0				r =3D ttm_pool_page_allocated(pool,
> > order, p,
> > =C2=A0							=C2=A0=C2=A0=C2=A0
> > &dma_addr,
> > =C2=A0							=C2=A0=C2=A0=C2=A0
> > &num_pages,
> > -							=C2=A0=C2=A0=C2=A0
> > &pages);
> > +							=C2=A0=C2=A0=C2=A0
> > &pages,
> > +							=C2=A0=C2=A0=C2=A0 tt-
> > >restore);
> > =C2=A0				if (r)
> > =C2=A0					goto error_free_page;
> > =C2=A0
> > =C2=A0				caching =3D pages;
> > +				if (ttm_pool_restore_valid(tt-
> > >restore)) {
> > +					r =3D
> > ttm_pool_restore_tt(tt->restore, tt->backup,
> > +								ct
> > x);
> > +					if (r)
> > +						goto
> > error_free_all;
> > +				}
> > +
> > =C2=A0				if (num_pages < (1 << order))
> > =C2=A0					break;
> > =C2=A0
> > @@ -496,9 +677,17 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > struct ttm_tt *tt,
> > =C2=A0				caching =3D pages;
> > =C2=A0			}
> > =C2=A0			r =3D ttm_pool_page_allocated(pool, order,
> > p, &dma_addr,
> > -						=C2=A0=C2=A0=C2=A0 &num_pages,
> > &pages);
> > +						=C2=A0=C2=A0=C2=A0 &num_pages,
> > &pages,
> > +						=C2=A0=C2=A0=C2=A0 tt->restore);
> > =C2=A0			if (r)
> > =C2=A0				goto error_free_page;
> > +
> > +			if (ttm_pool_restore_valid(tt->restore)) {
> > +				r =3D ttm_pool_restore_tt(tt-
> > >restore, tt->backup, ctx);
> > +				if (r)
> > +					goto error_free_all;
> > +			}
> > +
> > =C2=A0			if (PageHighMem(p))
> > =C2=A0				caching =3D pages;
> > =C2=A0		}
> > @@ -517,12 +706,26 @@ int ttm_pool_alloc(struct ttm_pool *pool,
> > struct ttm_tt *tt,
> > =C2=A0	if (r)
> > =C2=A0		goto error_free_all;
> > =C2=A0
> > +	if (tt->restore) {
> > +		kvfree(tt->restore);
> > +		tt->restore =3D NULL;
> > +	}
> > +
> > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
> > +		tt->page_flags &=3D ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> > +				=C2=A0=C2=A0=C2=A0 TTM_TT_FLAG_SWAPPED);
> > +
> > =C2=A0	return 0;
> > =C2=A0
> > =C2=A0error_free_page:
> > =C2=A0	ttm_pool_free_page(pool, page_caching, order, p);
> > =C2=A0
> > =C2=A0error_free_all:
> > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> > +		tt->restore->caching_divide =3D caching;
> > +		return r;
> > +	}
> > +
> > =C2=A0	num_pages =3D tt->num_pages - num_pages;
> > =C2=A0	caching_divide =3D caching - tt->pages;
> > =C2=A0	ttm_pool_free_range(pool, tt, tt->caching, 0,
> > caching_divide);
> > @@ -549,6 +752,174 @@ void ttm_pool_free(struct ttm_pool *pool,
> > struct ttm_tt *tt)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(ttm_pool_free);
> > =C2=A0
> > +/**
> > + * ttm_pool_release_backed_up() - Release content of a swapped-out
> > struct ttm_tt
> > + * @tt: The struct ttm_tt.
> > + *
> > + * Release handles with associated content or any remaining pages
> > of
> > + * a backed-up struct ttm_tt.
> > + */
> > +void ttm_pool_release_backed_up(struct ttm_tt *tt)
> > +{
> > +	struct ttm_backup *backup =3D tt->backup;
> > +	struct ttm_pool_tt_restore *restore;
> > +	pgoff_t i, start_page =3D 0;
> > +	unsigned long handle;
> > +
> > +	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> > +		return;
> > +
> > +	restore =3D tt->restore;
> > +
> > +	if (ttm_pool_restore_valid(restore)) {
> > +		pgoff_t nr =3D 1UL << restore->order;
> > +
> > +		for (i =3D restore->restored_pages; i < nr; ++i) {
> > +			struct page *p =3D restore->old_pages[i];
> > +
> > +			if (ttm_backup_page_ptr_is_handle(p)) {
> > +				handle =3D
> > ttm_backup_page_ptr_to_handle(p);
> > +				if (handle =3D=3D 0)
> > +					continue;
> > +
> > +				backup->ops->drop(backup, handle);
> > +			} else if (p) {
> > +				ttm_pool_split_for_swap(restore-
> > >pool, p);
> > +				__free_pages(p, 0);
> > +			}
> > +		}
> > +	}
> > +
> > +	if (restore) {
> > +		pgoff_t mid =3D restore->caching_divide - tt->pages;
> > +
> > +		start_page =3D restore->alloced_pages;
> > +		/* Pages that might be dma-mapped and non-cached
> > */
> > +		ttm_pool_free_range(restore->pool, tt, tt-
> > >caching,
> > +				=C2=A0=C2=A0=C2=A0 0, mid);
> > +		/* Pages that might be dma-mapped but cached */
> > +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
> > +				=C2=A0=C2=A0=C2=A0 mid, restore->alloced_pages);
> > +	}
> > +
> > +	/* Shrunken pages. Cached and not dma-mapped. */
> > +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt-
> > >num_pages);
> > +
> > +	if (restore) {
> > +		kvfree(restore);
> > +		tt->restore =3D NULL;
> > +	}
> > +
> > +	tt->page_flags &=3D ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> > TTM_TT_FLAG_SWAPPED);
> > +}
> > +
> > +/**
> > + * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
> > + * @pool: The pool used when allocating the struct ttm_tt.
> > + * @ttm: The struct ttm_tt.
> > + * @purge: Don't back up but release pages directly to system.
> > + * @writeback: If !@purge, Try to write out directly to the
> > + * underlying persistent media.
> > + *
> > + * Back up or purge a struct ttm_tt. If @purge is true, then
> > + * all pages will be freed directly to the system rather than to
> > the pool
> > + * they were allocated from, making the function behave similarly
> > to
> > + * ttm_pool_free(). If @purge is false the pages will be backed up
> > instead,
> > + * exchanged for handles.
> > + * A subsequent call to ttm_pool_alloc() will then read back the
> > content and
> > + * a subsequent call to ttm_pool_release_shrunken() will drop it.
> > + * If backup of a page fails for whatever reason, @ttm will still
> > be
> > + * partially backed up, retaining those pages for which backup
> > fails.
> > + *
> > + * Return: Number of pages actually backed up or freed, or
> > negative
> > + * error code on error.
> > + */
> > +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> > bool purge,
> > +			bool writeback)
> > +{
> > +	struct ttm_backup *backup =3D ttm->backup;
> > +	struct page *page;
> > +	unsigned long handle;
> > +	gfp_t alloc_gfp;
> > +	gfp_t gfp;
> > +	int ret =3D 0;
> > +	pgoff_t shrunken =3D 0;
> > +	pgoff_t i, num_pages;
> > +
> > +	if ((!get_nr_swap_pages() && !purge) ||
> > +	=C2=A0=C2=A0=C2=A0 pool->use_dma_alloc ||
> > +	=C2=A0=C2=A0=C2=A0 (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> > +		return -EBUSY;
> > +
> > +#ifdef CONFIG_X86
> > +	/* Anything returned to the system needs to be cached. */
> > +	if (ttm->caching !=3D ttm_cached)
> > +		set_pages_array_wb(ttm->pages, ttm->num_pages);
> > +#endif
> > +
> > +	if (ttm->dma_address || purge) {
> > +		for (i =3D 0; i < ttm->num_pages; i +=3D num_pages) {
> > +			unsigned int order;
> > +
> > +			page =3D ttm->pages[i];
> > +			if (unlikely(!page)) {
> > +				num_pages =3D 1;
> > +				continue;
> > +			}
> > +
> > +			order =3D ttm_pool_page_order(pool, page);
> > +			num_pages =3D 1UL << order;
> > +			if (ttm->dma_address)
> > +				ttm_pool_unmap(pool, ttm-
> > >dma_address[i],
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_pages);
> > +			if (purge) {
> > +				shrunken +=3D num_pages;
> > +				page->private =3D 0;
> > +				__free_pages(page, order);
> > +				memset(ttm->pages + i, 0,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_pages * sizeof(*ttm-
> > >pages));
> > +			}
> > +		}
> > +	}
> > +
> > +	if (purge)
>=20
> if (purge || !backup)?
>=20
> > +		return shrunken;
> > +
> > +	if (pool->use_dma32)
> > +		gfp =3D GFP_DMA32;
> > +	else
> > +		gfp =3D GFP_HIGHUSER;
> > +
> > +	alloc_gfp =3D GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
> > __GFP_RETRY_MAYFAIL;
> > +
> > +	for (i =3D 0; i < ttm->num_pages; ++i) {
> > +		page =3D ttm->pages[i];
> > +		if (unlikely(!page))
> > +			continue;
> > +
> > +		ttm_pool_split_for_swap(pool, page);
> > +
> > +		handle =3D backup->ops->backup_page(backup, page,
> > writeback, i,
> > +						=C2=A0 gfp, alloc_gfp);
> > +		if (handle) {
> > +			ttm->pages[i] =3D
> > ttm_backup_handle_to_page_ptr(handle);
> > +			put_page(page);
> > +			shrunken++;
> > +		} else {
> > +			/* We allow partially shrunken tts */
> > +			ret =3D -ENOMEM;
> > +			break;
> > +		}
> > +		cond_resched();
> > +	}
> > +
> > +	if (shrunken)
> > +		ttm->page_flags |=3D (TTM_TT_FLAG_PRIV_BACKED_UP |
> > +				=C2=A0=C2=A0=C2=A0 TTM_TT_FLAG_SWAPPED);
> > +
> > +	return shrunken ? shrunken : ret;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_pool_init - Initialize a pool
> > =C2=A0 *
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > b/drivers/gpu/drm/ttm/ttm_tt.c
> > index 4b51b9023126..98ce25197b38 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -40,6 +40,7 @@
> > =C2=A0#include <drm/drm_cache.h>
> > =C2=A0#include <drm/drm_device.h>
> > =C2=A0#include <drm/drm_util.h>
> > +#include <drm/ttm/ttm_backup.h>
> > =C2=A0#include <drm/ttm/ttm_bo.h>
> > =C2=A0#include <drm/ttm/ttm_tt.h>
> > =C2=A0
> > @@ -158,6 +159,7 @@ static void ttm_tt_init_fields(struct ttm_tt
> > *ttm,
> > =C2=A0	ttm->swap_storage =3D NULL;
> > =C2=A0	ttm->sg =3D bo->sg;
> > =C2=A0	ttm->caching =3D caching;
> > +	ttm->restore =3D NULL;
>=20
> Set backup to NULL? Seems problematic if not set to NULL and driver
> doesn't choose to set the backup.
>=20
> > =C2=A0}
> > =C2=A0
> > =C2=A0int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > @@ -182,6 +184,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
> > =C2=A0		fput(ttm->swap_storage);
> > =C2=A0	ttm->swap_storage =3D NULL;
> > =C2=A0
> > +	ttm_pool_release_backed_up(ttm);
> > +	if (ttm->backup) {
>=20
> In patch 12 you don't set this to NULL on error. You will have to set
> it
> to NULL their or change this too:
>=20
> if (ttm->backup && !IS_ERR(ttm->backup))
>=20
> > +		ttm->backup->ops->fini(ttm->backup);
> > +		ttm->backup =3D NULL;
> > +	}
> > +
> > =C2=A0	if (ttm->pages)
> > =C2=A0		kvfree(ttm->pages);
> > =C2=A0	else
> > @@ -253,6 +261,35 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
> > =C2=A0
> > +/**
> > + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> > + * @bdev: The TTM device.
> > + * @tt: The struct ttm_tt.
> > + * @purge: Don't back up but release pages directly to system,
> > + * bypassing any pooling.
> > + * @writeback: If !@purge, try to write out directly to the
> > + * underlying persistent media.
> > + *
> > + * Helper for a TTM driver to use from the bo_shrink() method to
> > shrink
> > + * a struct ttm_tt, after it has done the necessary unbinding.
> > This function
> > + * will update the page accounting and call ttm_pool_shrink_tt to
> > free pages
> > + * or move them to the swap cache.
> > + *
> > + * Return: Number of pages freed or swapped out, or negative error
> > code on
> > + * error.
> > + */
> > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> > bool purge,
> > +		=C2=A0=C2=A0 bool writeback)
> > +{
> > +	long ret =3D ttm_pool_backup_tt(&bdev->pool, tt, purge,
> > writeback);
> > +
> > +	if (ret > 0)
> > +		tt->page_flags &=3D ~TTM_TT_FLAG_PRIV_POPULATED;
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL(ttm_tt_backup);
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_tt_swapout - swap out tt object
> > =C2=A0 *
> > diff --git a/include/drm/ttm/ttm_pool.h
> > b/include/drm/ttm/ttm_pool.h
> > index 160d954a261e..4e4db369952b 100644
> > --- a/include/drm/ttm/ttm_pool.h
> > +++ b/include/drm/ttm/ttm_pool.h
> > @@ -89,6 +89,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
> > =C2=A0
> > =C2=A0int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
> > =C2=A0
> > +void ttm_pool_release_backed_up(struct ttm_tt *tt);
> > +
> > +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> > +			bool purge, bool writeback);
> > +
> > =C2=A0int ttm_pool_mgr_init(unsigned long num_pages);
> > =C2=A0void ttm_pool_mgr_fini(void);
> > =C2=A0
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index 2b9d856ff388..6b990f1e7dd0 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -32,11 +32,13 @@
> > =C2=A0#include <drm/ttm/ttm_caching.h>
> > =C2=A0#include <drm/ttm/ttm_kmap_iter.h>
> > =C2=A0
> > +struct ttm_backup;
> > =C2=A0struct ttm_device;
> > =C2=A0struct ttm_tt;
> > =C2=A0struct ttm_resource;
> > =C2=A0struct ttm_buffer_object;
> > =C2=A0struct ttm_operation_ctx;
> > +struct ttm_pool_tt_restore;
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * struct ttm_tt - This is a structure holding the pages, caching=
-
> > and aperture
> > @@ -85,6 +87,9 @@ struct ttm_tt {
> > =C2=A0	 * fault handling abuses the DMA api a bit and
> > dma_map_attrs can't be
> > =C2=A0	 * used to assure pgprot always matches.
> > =C2=A0	 *
> > +	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is
> > set if the
> > +	 * struct ttm_tt has been (possibly partially) backed up.
> > +	 *
> > =C2=A0	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
> > USE. This is
> > =C2=A0	 * set by TTM after ttm_tt_populate() has successfully
> > returned, and is
> > =C2=A0	 * then unset when TTM calls ttm_tt_unpopulate().
> > @@ -96,6 +101,7 @@ struct ttm_tt {
> > =C2=A0#define TTM_TT_FLAG_DECRYPTED		BIT(4)
> > =C2=A0
> > =C2=A0#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> > +#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
> > =C2=A0	uint32_t page_flags;
> > =C2=A0	/** @num_pages: Number of pages in the page array. */
> > =C2=A0	uint32_t num_pages;
> > @@ -105,11 +111,21 @@ struct ttm_tt {
> > =C2=A0	dma_addr_t *dma_address;
> > =C2=A0	/** @swap_storage: Pointer to shmem struct file for swap
> > storage. */
> > =C2=A0	struct file *swap_storage;
> > +	/**
> > +	 * @backup: Pointer to backup struct for backed up tts.
> > +	 * RFC: Could possibly be unified with @swap_storage.
>=20
> I think longterm unifying with swap_storage is problably a good idea.
> Kinda goofy having two backup mechanisms.
>=20
> In the meantime, can you add a comment that is this is a driver owned
> field? This confused me until I looked at the last patch in this
> series
> where this field was being setup.
>=20
> > +	 */
> > +	struct ttm_backup *backup;
> > =C2=A0	/**
> > =C2=A0	 * @caching: The current caching state of the pages, see
> > enum
> > =C2=A0	 * ttm_caching.
> > =C2=A0	 */
> > =C2=A0	enum ttm_caching caching;
> > +	/**
> > +	 * @restore: Partial restoration from backup state.
> > +	 * RFC: Incorporate in struct ttm_backup?
>=20
> I think having a standalone restore field makes sense. Also probably
> mention is this a TTM private field and drivers shouldn't touch this.

Thanks for reviewing, Matt. I'll incorporate all your suggestions, but
assert that ttm->backup is valid in ttm_tt.c

Thanks,
Thomas


>=20
> Matt
>=20
> > +	 */
> > +	struct ttm_pool_tt_restore *restore;
> > =C2=A0};
> > =C2=A0
> > =C2=A0/**
> > @@ -230,6 +246,10 @@ void ttm_tt_mgr_init(unsigned long num_pages,
> > unsigned long num_dma32_pages);
> > =C2=A0struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct
> > ttm_kmap_iter_tt *iter_tt,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_tt *tt);
> > =C2=A0unsigned long ttm_tt_pages_limit(void);
> > +
> > +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> > bool purge,
> > +		=C2=A0=C2=A0 bool writeback);
> > +
> > =C2=A0#if IS_ENABLED(CONFIG_AGP)
> > =C2=A0#include <linux/agp_backend.h>
> > =C2=A0
> > --=20
> > 2.44.0
> >=20

