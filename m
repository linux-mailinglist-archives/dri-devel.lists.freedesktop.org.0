Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09479E385C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 12:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D3E10E4AF;
	Wed,  4 Dec 2024 11:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJpbkDTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EBD10E0A7;
 Wed,  4 Dec 2024 11:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733310550; x=1764846550;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qDCgtLQm2SNLBhK2fk9t6cJuIbIntk4gs5FPp5h/iGU=;
 b=TJpbkDTkGkhwBdxixowrc4BKTcCS493i4V9/jZIh4cViTAECGh33RktU
 RZ4i/LCsnw5jzAYoT9xT9pSPzWmQ4wL09GeALijK5z76Hjown5DNAljQ8
 N/8Ow95U/7KOarwGsmDzwr8wGoSl+sld4h1/MAWI8+nOlGon3c9fnO3Ry
 PCYxXR/x2cwPSjnZ0lsNexIxLx5OE7j6kfQcZZFuEGpbXfjCrDENZ3h3z
 VsZEch/9jp+4wQpv+0q+0+mTENTTJWfCky0uM65UJMXZMBBtihx4AF1Nd
 K9uvP4hu+SmxTDiUpeInR+n+zj3wnp7HXOLahSx5yB/TlFPw/xXQWEoOO A==;
X-CSE-ConnectionGUID: 5z4C4YQeQ2q/5orP/QPvXA==
X-CSE-MsgGUID: pOlYS3qWS0K8P6zPU+KzDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33444462"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33444462"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:09:10 -0800
X-CSE-ConnectionGUID: S53o9GXZSpKi2QtYmoJ3gQ==
X-CSE-MsgGUID: aERnropqQZ2nmoNgj08rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93397030"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.221])
 ([10.245.246.221])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 03:09:07 -0800
Message-ID: <9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com>
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 04 Dec 2024 12:09:04 +0100
In-Reply-To: <1e378253-57f0-46b1-b6a7-a6b8997d7e1b@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
 <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
 <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
 <c74e9f5c-3201-4083-8b79-80fdbbd903f2@amd.com>
 <5f3c04297fd6f008cad0415d6b6c04ba8c3b5a8c.camel@linux.intel.com>
 <26747cae-d66a-4bc4-9efb-4fdda4ac766b@amd.com>
 <e7654f8140ce2bd1afdca20b21b139cf810b6070.camel@linux.intel.com>
 <1e378253-57f0-46b1-b6a7-a6b8997d7e1b@amd.com>
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

On Wed, 2024-12-04 at 11:56 +0100, Christian K=C3=B6nig wrote:
> Am 04.12.24 um 10:56 schrieb Thomas Hellstr=C3=B6m:
> > On Wed, 2024-12-04 at 10:16 +0100, Christian K=C3=B6nig wrote:
> > > Am 03.12.24 um 18:44 schrieb Thomas Hellstr=C3=B6m:
> > > > On Tue, 2024-12-03 at 17:46 +0100, Christian K=C3=B6nig wrote:
> > > > > Am 03.12.24 um 17:43 schrieb Thomas Hellstr=C3=B6m:
> > > > > > On Tue, 2024-12-03 at 17:39 +0100, Christian K=C3=B6nig wrote:
> > > > > > > Am 03.12.24 um 17:31 schrieb Thomas Hellstr=C3=B6m:
> > > > > > > > On Tue, 2024-12-03 at 17:20 +0100, Christian K=C3=B6nig
> > > > > > > > wrote:
> > > > > > > > > [SNIP]
> > > > > > > > > > > > > > @@ -453,9 +601,36 @@ int
> > > > > > > > > > > > > > ttm_pool_alloc(struct
> > > > > > > > > > > > > > ttm_pool
> > > > > > > > > > > > > > *pool,
> > > > > > > > > > > > > > struct ttm_tt *tt,
> > > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0	else
> > > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0		gfp_flags |=3D
> > > > > > > > > > > > > > GFP_HIGHUSER;
> > > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > > > -	for (order =3D min_t(unsigned int,
> > > > > > > > > > > > > > MAX_PAGE_ORDER,
> > > > > > > > > > > > > > __fls(num_pages));
> > > > > > > > > > > > > > -	=C2=A0=C2=A0=C2=A0=C2=A0 num_pages;
> > > > > > > > > > > > > > -	=C2=A0=C2=A0=C2=A0=C2=A0 order =3D min_t(unsi=
gned int,
> > > > > > > > > > > > > > order,
> > > > > > > > > > > > > > __fls(num_pages)))
> > > > > > > > > > > > > > {
> > > > > > > > > > > > > > +	order =3D min_t(unsigned int,
> > > > > > > > > > > > > > MAX_PAGE_ORDER,
> > > > > > > > > > > > > > __fls(num_pages));
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	if (tt->page_flags &
> > > > > > > > > > > > > > TTM_TT_FLAG_PRIV_BACKED_UP) {
> > > > > > > > > > > > > > +		if (!tt->restore) {
> > > > > > > > > > > > > > +			gfp_t gfp =3D
> > > > > > > > > > > > > > GFP_KERNEL
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > __GFP_NOWARN;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +			if (ctx-
> > > > > > > > > > > > > > > gfp_retry_mayfail)
> > > > > > > > > > > > > > +				gfp |=3D
> > > > > > > > > > > > > > __GFP_RETRY_MAYFAIL;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +			tt->restore =3D
> > > > > > > > > > > > > > +				kvzalloc(s
> > > > > > > > > > > > > > truc
> > > > > > > > > > > > > > t_si
> > > > > > > > > > > > > > ze(t
> > > > > > > > > > > > > > t-
> > > > > > > > > > > > > > > restore,
> > > > > > > > > > > > > > old_pages,
> > > > > > > > > > > > > > +				=09
> > > > > > > > > > > > > > =09
> > > > > > > > > > > > > > (size_t)1
> > > > > > > > > > > > > > <<
> > > > > > > > > > > > > > order), gfp);
> > > > > > > > > > > > > > +			if (!tt->restore)
> > > > > > > > > > > > > > +				return -
> > > > > > > > > > > > > > ENOMEM;
> > > > > > > > > > > > > > +		} else if
> > > > > > > > > > > > > > (ttm_pool_restore_valid(tt-
> > > > > > > > > > > > > > > restore)) {
> > > > > > > > > > > > > > +			struct
> > > > > > > > > > > > > > ttm_pool_tt_restore
> > > > > > > > > > > > > > *restore =3D
> > > > > > > > > > > > > > tt-
> > > > > > > > > > > > > > > restore;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +			num_pages -=3D
> > > > > > > > > > > > > > restore-
> > > > > > > > > > > > > > > alloced_pages;
> > > > > > > > > > > > > > +			order =3D
> > > > > > > > > > > > > > min_t(unsigned
> > > > > > > > > > > > > > int,
> > > > > > > > > > > > > > order,
> > > > > > > > > > > > > > __fls(num_pages));
> > > > > > > > > > > > > > +			pages +=3D restore-
> > > > > > > > > > > > > > > alloced_pages;
> > > > > > > > > > > > > > +			r =3D
> > > > > > > > > > > > > > ttm_pool_restore_tt(restore,
> > > > > > > > > > > > > > tt-
> > > > > > > > > > > > > > > backup, ctx);
> > > > > > > > > > > > > > +			if (r)
> > > > > > > > > > > > > > +				return r;
> > > > > > > > > > > > > > +			caching =3D restore-
> > > > > > > > > > > > > > > caching_divide;
> > > > > > > > > > > > > > +		}
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +		tt->restore->pool =3D pool;
> > > > > > > > > > > > > > +	}
> > > > > > > > > > > > > Hui? Why is that part of the allocation
> > > > > > > > > > > > > function
> > > > > > > > > > > > > now?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > At bare minimum I would expect that this is a
> > > > > > > > > > > > > new
> > > > > > > > > > > > > function.
> > > > > > > > > > > > It's because we now have partially backed up
> > > > > > > > > > > > tts,
> > > > > > > > > > > > so
> > > > > > > > > > > > the
> > > > > > > > > > > > restore is
> > > > > > > > > > > > interleaved on a per-page basis, replacing the
> > > > > > > > > > > > backup
> > > > > > > > > > > > handles
> > > > > > > > > > > > with
> > > > > > > > > > > > page-pointers. I'll see if I can separate out
> > > > > > > > > > > > at
> > > > > > > > > > > > least
> > > > > > > > > > > > the
> > > > > > > > > > > > initialization here.
> > > > > > > > > > > Yeah, that kind of makes sense.
> > > > > > > > > > >=20
> > > > > > > > > > > My expectation was just that we now have explicit
> > > > > > > > > > > ttm_pool_swapout()
> > > > > > > > > > > and
> > > > > > > > > > > ttm_pool_swapin() functions.
> > > > > > > > > > I fully understand, although in the allocation
> > > > > > > > > > step,
> > > > > > > > > > that
> > > > > > > > > > would
> > > > > > > > > > also
> > > > > > > > > > increase the memory pressure since we might
> > > > > > > > > > momentarily
> > > > > > > > > > have
> > > > > > > > > > twice
> > > > > > > > > > the
> > > > > > > > > > bo-size allocated, if the shmem object was never
> > > > > > > > > > swapped
> > > > > > > > > > out,
> > > > > > > > > > and
> > > > > > > > > > we
> > > > > > > > > > don't want to unnecessarily risc OOM at recover
> > > > > > > > > > time,
> > > > > > > > > > although
> > > > > > > > > > that
> > > > > > > > > > should be a recoverable situation now. If the OOM
> > > > > > > > > > receiver
> > > > > > > > > > can
> > > > > > > > > > free
> > > > > > > > > > up
> > > > > > > > > > system memory resources they can could potentially
> > > > > > > > > > restart
> > > > > > > > > > the
> > > > > > > > > > recover.
> > > > > > > > > What I meant was more that we have ttm_pool_swapout()
> > > > > > > > > which
> > > > > > > > > does
> > > > > > > > > a
> > > > > > > > > mix
> > > > > > > > > of moving each page to a swap backend and freeing one
> > > > > > > > > by
> > > > > > > > > one.
> > > > > > > > >=20
> > > > > > > > > And ttm_pool_swapin() which allocates a bit of memory
> > > > > > > > > (usually
> > > > > > > > > one
> > > > > > > > > huge
> > > > > > > > > page) and then copies the content back in from the
> > > > > > > > > swap
> > > > > > > > > backend.
> > > > > > > > >=20
> > > > > > > > > Alternatively we could rename ttm_pool_alloc() into
> > > > > > > > > something
> > > > > > > > > like
> > > > > > > > > ttm_pool_populate() and ttm_pool_free() into
> > > > > > > > > ttm_pool_unpopulate(),
> > > > > > > > > but
> > > > > > > > > those names are not very descriptive either.
> > > > > > > > >=20
> > > > > > > > > It's just that we now do a bit more than just alloc
> > > > > > > > > and
> > > > > > > > > free
> > > > > > > > > in
> > > > > > > > > those
> > > > > > > > > functions, so the naming doesn't really match that
> > > > > > > > > well
> > > > > > > > > any
> > > > > > > > > more.
> > > > > > > > So what about ttm_pool_alloc() and
> > > > > > > > ttm_pool_recover/swapin(),
> > > > > > > > both
> > > > > > > > pointing to the same code, but _alloc() asserts that
> > > > > > > > the tt
> > > > > > > > isn't
> > > > > > > > backed up?
> > > > > > > >=20
> > > > > > > > That would give a clean interface at least.
> > > > > > > More or less ok. I would just put figuring out the gfp
> > > > > > > flags
> > > > > > > and
> > > > > > > the
> > > > > > > stuff inside the for (order... loop into separate
> > > > > > > functions.
> > > > > > > And
> > > > > > > then
> > > > > > > remove the if (tt->page_flags &
> > > > > > > TTM_TT_FLAG_PRIV_BACKED_UP)
> > > > > > > from
> > > > > > > the
> > > > > > > pool.
> > > > > > >=20
> > > > > > > In other words you trigger the back restore by calling a
> > > > > > > different
> > > > > > > function than the allocation one.
> > > > > > I'll take a look at this as well.
> > > > > Ah, and BTW: It's perfectly possible that ttm_tt_free() is
> > > > > called
> > > > > because a halve swapped TT is about to be destroyed!
> > > > >=20
> > > > > If I'm not completely mistaken that is not handled gracefully
> > > > > when we
> > > > > try to always backup from in the ttm_tt_free() function.
> > > > >=20
> > > > > So we clearly need the separation of move this TT to a backup
> > > > > (and
> > > > > eventually only partially) and freeing it.
> > > > Hm. I'm not sure I follow completely.
> > > >=20
> > > > The ttm_pool interface is currently:
> > > >=20
> > > > ttm_pool_alloc() -> allocs and may recover from backup. May
> > > > leave
> > > > partially backed up. Called from ttm_tt_populate() or its
> > > > driver
> > > > callbacks.
> > > Yeah that this is done by a single function looks really strange
> > > to
> > > me.
> > >=20
> > > > ttm_pool_backup_tt() -> Attempts to back up (the not already
> > > > backed
> > > > up
> > > > part of a tt. Called from ttm_tt_backup(), which is just a tt
> > > > layer
> > > > wrapper. If called with purge=3D=3Dtrue, then frees memory
> > > > bypassing
> > > > the
> > > > pool to return it to the system directly.
> > > >=20
> > > > ttm_pool_free() -> Frees a (potentially backed up or partially
> > > > backed
> > > > up) tt. Called from ttm_tt_unpopulate() or its driver
> > > > callbacks.
> > > Ah! I missed that you have separated that functionality from the
> > > free
> > > path.
> > >=20
> > > I've only saw the allocation path and though I need to clear that
> > > up
> > > first.
> > >=20
> > > > So the backup functionality is implemented with a minimal
> > > > change to
> > > > upper layers, and I don't think there is a correctness problem
> > > > on
> > > > free().
> > > >=20
> > > > So could you clarify a bit if it is this interface you think
> > > > needs
> > > > changing or that the implementation is better at separating out
> > > > the
> > > > backup functionality from the pool functionality?
> > > I think we should just make the ttm pool object take charge of
> > > allocation, backup, restore and free operation on the TT objects.
> > >=20
> > > And all of those are separate operations, they just internally
> > > share
> > > steps to archive what they should do.
> > So are we looking at an interface change like:
> >=20
> > ttm_pool_alloc() // no recover. Errors if backed-up-data present.
> > ttm_pool_alloc_and_recover() // because you can't alloc first and
> > then
> > recover in a memory-efficient manner, since you need to interleave.
> > ttm_pool_backup() // as currently
> > ttm_pool_drop_backed_up() //drops the backed-up data if any.
> > ttm_pool_free() // frees all data. errors if backed-up-data
> > present.
> >=20
> > Is this what you mean?
>=20
> Yes, exactly that.

OK, then sure I'll update.

>=20
> >=20
> > > BTW I really dislike that tt->restore is allocated dynamically.
> > > That
> > > is
> > > just another allocation which can cause problems.
> > > We should probably have all the state necessary for the operation
> > > in
> > > the
> > > TT object.
> > Initially it was done this way. But that meant a pre-allocated
> > struct
> > page-pointer array the of 1 << MAX_PAGE_ORDER size (2MiB) for each
> > ttm_tt. That lead to a patch to reduce the MAX_PAGE_ORDER to PMD
> > size
> > order, but=C2=A0 as you might remember, that needed to be ripped out
> > because
> > the PMD size macros aren't constant across all architectures. IIRC
> > it
> > was ARM causing compilation failures, and Linus wasn't happy.
>=20
> Yeah, I do remember that. But I don't fully get why you need this=20
> page-pointer array in the first place?

So the TTM page-pointer array holds the backup handles when backed up.
During recovery, We allocate a (potentially huge) page and populate the
TTM page-pointer array with pointers into that. Meanwhile we need to
keep the backup handles for the recover phase in the restore structure,
and in the middle of the recover phase you might hit an -EINTR.

Thanks,
Thomas


>=20
> >=20
> > So, enter the dynamic allocation which is temporary, and 1/512 of
> > the
> > size of the memory we need to allocate for the buffer object. IIRC
> > that
> > was discussed with Matt when he reiewed and we concluded that it
> > should
> > be ok. I think this approach leads to less memory pressure than if
> > we'd
> > keep that array around all the time for *all* the allocated bos,
> > and
> > the allocation is never during reclaim.
>=20
> Hui? How do you avoid having to allocate that during reclaim?
>=20
> I absolutely don't see that on the code currently.

During reclaim we back up only. When this allocation happens we're
about to recover, which means we are not in reclaim.

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > Thanks,
> > > > Thomas
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > > > Christian.
> > > > >=20
> > > > > > /Thomas
> > > > > >=20
> > > > > >=20
> > > > > > > > For a renaming change that touch all TTM drivers, I'd
> > > > > > > > rather
> > > > > > > > put
> > > > > > > > that
> > > > > > > > as a last patch since getting acks for that from all
> > > > > > > > TTM
> > > > > > > > driver
> > > > > > > > maintainers seems like a hopeless undertaking.
> > > > > > > Yeah the acks are not the problem, merging it through the
> > > > > > > xe
> > > > > > > tree
> > > > > > > would be.
> > > > > > >=20
> > > > > > > Christian.
> > > > > > >=20
> > > > > > >=20
> > > > > > > > /Thomas
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > > Christian.
> > > > > > > > >=20
> > > > > > > > > > /Thomas
>=20

