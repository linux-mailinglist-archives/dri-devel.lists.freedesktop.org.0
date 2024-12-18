Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E08E9F6280
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFA510EB42;
	Wed, 18 Dec 2024 10:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fd8m+opN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FA110EB40;
 Wed, 18 Dec 2024 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734516923; x=1766052923;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zPR6Vu+jyxEVGtaGlHA9wM84vimIooBOwK7FQRw4RSw=;
 b=Fd8m+opNJzI5YXCO9x4EAW2XhU33XoWj3AW3pVppb2X8mzRkQE35tjr6
 3fxg5ZNmT4famZl2en65G7Daua2r94g29c5AJGmAoFAKMWARcRIQ7Cnwl
 Y7rJLr8QXxsq9TQMgiqhaMoxCWvhXJtokFoaxzwYCz+V4G2MuzQJ2RzzF
 Hkht7ENXXc0GSflmWqxHUGprB/RgJ0yPl6JVAZ/Gb6kl3KtXeojmKIF3J
 Lw++yzLnDTFCb0/pwh2C557Hb50JbSIbWWaFpK8kCl8I5JuKXG5Ck7TAG
 Q8thrYTO2mVEwc531Uj489BWOWLpgx+A6O5aZ9Afx2O5d68g0/g2pMLNa w==;
X-CSE-ConnectionGUID: 9Wwqo1r1R86Z93scg4L5fA==
X-CSE-MsgGUID: UVruB/YHTjyB1gEuiMyLTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35134326"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35134326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 02:15:09 -0800
X-CSE-ConnectionGUID: tUdJRlzoSlOglfpjDQt+WA==
X-CSE-MsgGUID: PyEPSASdRNO//bvJNI5xQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98232558"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 02:15:06 -0800
Message-ID: <f130c073fdc2338292010e5c737155d9ad696618.camel@linux.intel.com>
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 18 Dec 2024 11:15:04 +0100
In-Reply-To: <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2024-12-03 at 15:51 +0100, Christian K=C3=B6nig wrote:
> Am 03.12.24 um 14:42 schrieb Thomas Hellstr=C3=B6m:
> > On Tue, 2024-12-03 at 14:12 +0100, Christian K=C3=B6nig wrote:
> > > Am 15.11.24 um 16:01 schrieb Thomas Hellstr=C3=B6m:
> > > > Provide a helper to shrink ttm_tt page-vectors on a per-page
> > > > basis. A ttm_backup backend could then in theory get away with
> > > > allocating a single temporary page for each struct ttm_tt.
> > > >=20
> > > > This is accomplished by splitting larger pages before trying to
> > > > back them up.
> > > >=20
> > > > In the future we could allow ttm_backup to handle backing up
> > > > large pages as well, but currently there's no benefit in
> > > > doing that, since the shmem backup backend would have to
> > > > split those anyway to avoid allocating too much temporary
> > > > memory, and if the backend instead inserts pages into the
> > > > swap-cache, those are split on reclaim by the core.
> > > >=20
> > > > Due to potential backup- and recover errors, allow partially
> > > > swapped
> > > > out struct ttm_tt's, although mark them as swapped out stopping
> > > > them
> > > > from being swapped out a second time. More details in the
> > > > ttm_pool.c
> > > > DOC section.
> > > >=20
> > > > v2:
> > > > - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> > > > - s/back_up/backup/
> > > > - Add a writeback parameter to the exported interface.
> > > > v8:
> > > > - Use a struct for flags for readability (Matt Brost)
> > > > - Address misc other review comments (Matt Brost)
> > > > v9:
> > > > - Update the kerneldoc for the ttm_tt::backup field.
> > > > v10:
> > > > - Rebase.
> > > > v13:
> > > > - Rebase on ttm_backup interface change. Update kerneldoc.
> > > > - Rebase and adjust ttm_tt_is_swapped().
> > > >=20
> > > > Cc: Christian K=C3=B6nig<christian.koenig@amd.com>
> > > > Cc: Somalapuram Amaranath<Amaranath.Somalapuram@amd.com>
> > > > Cc: Matthew Brost<matthew.brost@intel.com>
> > > > Cc:<dri-devel@lists.freedesktop.org>
> > > > Signed-off-by: Thomas
> > > > Hellstr=C3=B6m<thomas.hellstrom@linux.intel.com>
> > > > Reviewed-by: Matthew Brost<matthew.brost@intel.com>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_pool.c | 396
> > > > +++++++++++++++++++++++++++++++--
> > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0 |=C2=A0 37 ++=
+
> > > > =C2=A0=C2=A0 include/drm/ttm/ttm_pool.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 6 +
> > > > =C2=A0=C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 32 ++-
> > > > =C2=A0=C2=A0 4 files changed, 457 insertions(+), 14 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > index 8504dbe19c1a..f58864439edb 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > @@ -41,6 +41,7 @@
> > > > =C2=A0=C2=A0 #include <asm/set_memory.h>
> > > > =C2=A0=C2=A0 #endif
> > > > =C2=A0=C2=A0=20
> > > > +#include <drm/ttm/ttm_backup.h>
> > > > =C2=A0=C2=A0 #include <drm/ttm/ttm_pool.h>
> > > > =C2=A0=C2=A0 #include <drm/ttm/ttm_tt.h>
> > > > =C2=A0=C2=A0 #include <drm/ttm/ttm_bo.h>
> > > > @@ -58,6 +59,32 @@ struct ttm_pool_dma {
> > > > =C2=A0=C2=A0=C2=A0	unsigned long vaddr;
> > > > =C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=20
> > > > +/**
> > > > + * struct ttm_pool_tt_restore - State representing restore
> > > > from
> > > > backup
> > > > + * @alloced_pages: Total number of already allocated pages for
> > > > the
> > > > ttm_tt.
> > > > + * @restored_pages: Number of (sub) pages restored from swap
> > > > for
> > > > this
> > > > + *		=C2=A0=C2=A0=C2=A0=C2=A0 chunk of 1 << @order pages.
> > > > + * @first_page: The ttm page ptr representing for
> > > > @old_pages[0].
> > > > + * @caching_divide: Page pointer where subsequent pages are
> > > > cached.
> > > > + * @old_pages: Backup copy of page pointers that were replaced
> > > > by
> > > > the new
> > > > + *	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page allocation.
> > > > + * @pool: The pool used for page allocation while restoring.
> > > > + * @order: The order of the last page allocated while
> > > > restoring.
> > > > + *
> > > > + * Recovery from backup might fail when we've recovered less
> > > > than
> > > > the
> > > > + * full ttm_tt. In order not to loose any data (yet), keep
> > > > information
> > > > + * around that allows us to restart a failed ttm backup
> > > > recovery.
> > > > + */
> > > > +struct ttm_pool_tt_restore {
> > > > +	pgoff_t alloced_pages;
> > > > +	pgoff_t restored_pages;
> > > > +	struct page **first_page;
> > > > +	struct page **caching_divide;
> > > > +	struct ttm_pool *pool;
> > > > +	unsigned int order;
> > > > +	struct page *old_pages[];
> > > > +};
> > > > +
> > > > =C2=A0=C2=A0 static unsigned long page_pool_size;
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 MODULE_PARM_DESC(page_pool_size, "Number of pages in t=
he
> > > > WC/UC/DMA pool");
> > > > @@ -354,11 +381,105 @@ static unsigned int
> > > > ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
> > > > =C2=A0=C2=A0=C2=A0	return p->private;
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > +/*
> > > > + * To be able to insert single pages into backup directly,
> > > > + * we need to split multi-order page allocations and make them
> > > > look
> > > > + * like single-page allocations.
> > > > + */
> > > > +static void ttm_pool_split_for_swap(struct ttm_pool *pool,
> > > > struct
> > > > page *p)
> > > > +{
> > > > +	unsigned int order =3D ttm_pool_page_order(pool, p);
> > > > +	pgoff_t nr;
> > > > +
> > > > +	if (!order)
> > > > +		return;
> > > > +
> > > > +	split_page(p, order);
> > > What exactly should split_page() do here and why is that
> > > necessary?
> > >=20
> > > IIRC that function just updated the reference count and updated
> > > things
> > > like page owner tracking and memcg accounting. Which should both
> > > be
> > > completely irrelevant here.
> > >=20
> > > Or do you just do that so that you can free each page
> > > individually?
> > Yes, exactly. Like For a 2MiB page we'd otherwise have to allocate
> > 2MiB
> > of shmem backing storage, potentially from kernel reserves before
> > we
> > could actually free anything. Since (currently) the shmem objects
> > we
> > use are 4K-page only, this should make the process "allocate shmem
> > and
> > back up" much less likely to deplete the kernel memory reserves.
>=20
> Ah, yes that makes totally sense now.
>=20
> >=20
> > Taking a step back and looking at potentially other solution, like
> > direct insertion into the swap cache, then even if inserting a 2MiB
> > page into the swap cache, vmscan would split it before writeback,
> > and
> > still it didn't appear very stable. So inserting one 4K page at a
> > time
> > seemed neccessary. If I were to take a guess that's why shmem, when
> > configured for 2MiB pages, like with i915, also splits the pages
> > before
> > moving to swap-cache / writeback.
> >=20
> >=20
> > > > +	nr =3D 1UL << order;
> > > > +	while (nr--)
> > > > +		(p++)->private =3D 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * DOC: Partial backup and restoration of a struct ttm_tt.
> > > > + *
> > > > + * Swapout using ttm_backup_backup_page() and swapin using
> > > > + * ttm_backup_copy_page() may fail.
> > > > + * The former most likely due to lack of swap-space or memory,
> > > > the
> > > > latter due
> > > > + * to lack of memory or because of signal interruption during
> > > > waits.
> > > > + *
> > > > + * Backup failure is easily handled by using a ttm_tt pages
> > > > vector
> > > > that holds
> > > > + * both swap entries and page pointers. This has to be taken
> > > > into
> > > > account when
> > > > + * restoring such a ttm_tt from backup, and when freeing it
> > > > while
> > > > backed up.
> > > > + * When restoring, for simplicity, new pages are actually
> > > > allocated from the
> > > > + * pool and the contents of any old pages are copied in and
> > > > then
> > > > the old pages
> > > > + * are released.
> > > > + *
> > > > + * For restoration failures, the struct ttm_pool_tt_restore
> > > > holds
> > > > sufficient state
> > > > + * to be able to resume an interrupted restore, and that
> > > > structure
> > > > is freed once
> > > > + * the restoration is complete. If the struct ttm_tt is
> > > > destroyed
> > > > while there
> > > > + * is a valid struct ttm_pool_tt_restore attached, that is
> > > > also
> > > > properly taken
> > > > + * care of.
> > > > + */
> > > > +
> > > > +static bool ttm_pool_restore_valid(const struct
> > > > ttm_pool_tt_restore *restore)
> > > > +{
> > > > +	return restore && restore->restored_pages < (1 <<
> > > > restore-
> > > > > order);
> > > > +}
> > > > +
> > > > +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore
> > > > *restore,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_backup *backup,
> > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *=
ctx)
> > > > +{
> > > > +	unsigned int i, nr =3D 1 << restore->order;
> > > > +	int ret =3D 0;
> > > > +
> > > > +	if (!ttm_pool_restore_valid(restore))
> > > > +		return 0;
> > > > +
> > > > +	for (i =3D restore->restored_pages; i < nr; ++i) {
> > > > +		struct page *p =3D restore->old_pages[i];
> > > > +
> > > > +		if (ttm_backup_page_ptr_is_handle(p)) {
> > > > +			unsigned long handle =3D
> > > > ttm_backup_page_ptr_to_handle(p);
> > > > +
> > > > +			if (handle =3D=3D 0)
> > > > +				continue;
> > > > +
> > > > +			ret =3D ttm_backup_copy_page
> > > > +				(backup, restore-
> > > > >first_page[i],
> > > > +				 handle, ctx->interruptible);
> > > That coding style looks really odd, I didn't even notice that it
> > > is a
> > > function call initially.
> > >=20
> > > Maybe put everything under the if into a separate function.
> > At a minimum, I'll fix up the formatting here.
> >=20
> > > > +			if (ret)
> > > > +				break;
> > > > +
> > > > +			ttm_backup_drop(backup, handle);
> > > > +		} else if (p) {
> > > > +			/*
> > > > +			 * We could probably avoid splitting
> > > > the
> > > > old page
> > > > +			 * using clever logic, but ATM we
> > > > don't
> > > > care, as
> > > > +			 * we prioritize releasing memory
> > > > ASAP.
> > > > Note that
> > > > +			 * here, the old retained page is
> > > > always
> > > > write-back
> > > > +			 * cached.
> > > > +			 */
> > > > +			ttm_pool_split_for_swap(restore->pool,
> > > > p);
> > > > +			copy_highpage(restore->first_page[i],
> > > > p);
> > > > +			__free_pages(p, 0);
> > > > +		}
> > > > +
> > > > +		restore->restored_pages++;
> > > > +		restore->old_pages[i] =3D NULL;
> > > > +		cond_resched();
> > > There is a push to remove cond_resched(), see here:
> > > https://patchwork.kernel.org/project/linux-mm/patch/20231107230822.37=
1443-30-ankur.a.arora@oracle.com/
> > >=20
> > > Not sure in which discussion that removal went, but IIRC we
> > > should
> > > not
> > > add any new users of it.
> > I'll read up on that and remove if needed. I'm curious how / if
> > voluntary preemption is going to be handled.
>=20
> I didn't fully understood it either, but the push kind of seems to be
> that drivers or in this cases subsystems are not supposed to mess
> with=20
> cond_resched() any more and just rely on preemptive kernels.
>=20
> > >=20

So I took a deeper look into this. From what I can tell, cond_resched()
is replaced by some other implicit preemption mechanism, and it seems
the series is still being worked on, but meanwhile there's nothing
ensuring that latency-causing long loops will be preempted.

So IMHO it should be easy to just remove the cond_resched() when that
series lands, and if it is deemed necessary to add it meanwhile.

But OTOH, the cond_resched() in this code was added without benchmark
justification, so I have removed it. If needed could be re-added
pending the merge of the new preemption code.

Thanks,
Thomas






