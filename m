Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFA29E2780
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD3510E249;
	Tue,  3 Dec 2024 16:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zv3NFDY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E9389CAD;
 Tue,  3 Dec 2024 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733243496; x=1764779496;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LEfpd0xcp7zIbx2i2TeGCztSa5Lb0jhI7WS2jxutZZA=;
 b=Zv3NFDY3/w2ldTn7SlP2asjeKOeHEjfmM3ma75faBB4MrQ84iZuzF8OK
 t0d8evJVvjaxjbAm9lr6NbLnjYGVxsAFAdBPOomHuMjkm4D1jSXrfkt7v
 OFrgaSQSyi/6B5sEyXFGYFlNqIgMTzgN1TIHslwAbsS34HoD+yuBBTh55
 tYPwnOZNOFB6Tmc6pLOCjCXrkBSS3TmqRYeDwd0smlUm0VCqCP/dNUGSH
 T8v70ZrSH0+CgHIvoN4m+KACSe5Ac2myi+gVL3Wb6FEccGEQiGOqTY8aQ
 As8ySeX++p+jZLwrfcMFGTXjWJLXnQXyVEQoxJ5pGbEklsw4ojqcHJn2M A==;
X-CSE-ConnectionGUID: TXvOLlwUTXmjAKcKQCORPA==
X-CSE-MsgGUID: z3PFKRlwQgeEQCpr9SiiOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="50993862"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="50993862"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:31:35 -0800
X-CSE-ConnectionGUID: 0g74vZaWS76tr2642YWcUA==
X-CSE-MsgGUID: qv5dsyBbRzyAZRlerRouPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="124432207"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.120])
 ([10.245.246.120])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:31:33 -0800
Message-ID: <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Tue, 03 Dec 2024 17:31:30 +0100
In-Reply-To: <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
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

On Tue, 2024-12-03 at 17:20 +0100, Christian K=C3=B6nig wrote:
> [SNIP]
> > > > > > @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool
> > > > > > *pool,
> > > > > > struct ttm_tt *tt,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	else
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0		gfp_flags |=3D GFP_HIGHUSER;
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > -	for (order =3D min_t(unsigned int, MAX_PAGE_ORDER,
> > > > > > __fls(num_pages));
> > > > > > -	=C2=A0=C2=A0=C2=A0=C2=A0 num_pages;
> > > > > > -	=C2=A0=C2=A0=C2=A0=C2=A0 order =3D min_t(unsigned int, order,
> > > > > > __fls(num_pages)))
> > > > > > {
> > > > > > +	order =3D min_t(unsigned int, MAX_PAGE_ORDER,
> > > > > > __fls(num_pages));
> > > > > > +
> > > > > > +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> > > > > > +		if (!tt->restore) {
> > > > > > +			gfp_t gfp =3D GFP_KERNEL |
> > > > > > __GFP_NOWARN;
> > > > > > +
> > > > > > +			if (ctx->gfp_retry_mayfail)
> > > > > > +				gfp |=3D
> > > > > > __GFP_RETRY_MAYFAIL;
> > > > > > +
> > > > > > +			tt->restore =3D
> > > > > > +				kvzalloc(struct_size(tt-
> > > > > > > restore,
> > > > > > old_pages,
> > > > > > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > (size_t)1
> > > > > > <<
> > > > > > order), gfp);
> > > > > > +			if (!tt->restore)
> > > > > > +				return -ENOMEM;
> > > > > > +		} else if (ttm_pool_restore_valid(tt-
> > > > > > > restore)) {
> > > > > > +			struct ttm_pool_tt_restore
> > > > > > *restore =3D
> > > > > > tt-
> > > > > > > restore;
> > > > > > +
> > > > > > +			num_pages -=3D restore-
> > > > > > >alloced_pages;
> > > > > > +			order =3D min_t(unsigned int, order,
> > > > > > __fls(num_pages));
> > > > > > +			pages +=3D restore->alloced_pages;
> > > > > > +			r =3D ttm_pool_restore_tt(restore,
> > > > > > tt-
> > > > > > > backup, ctx);
> > > > > > +			if (r)
> > > > > > +				return r;
> > > > > > +			caching =3D restore->caching_divide;
> > > > > > +		}
> > > > > > +
> > > > > > +		tt->restore->pool =3D pool;
> > > > > > +	}
> > > > > Hui? Why is that part of the allocation function now?
> > > > >=20
> > > > > At bare minimum I would expect that this is a new function.
> > > > It's because we now have partially backed up tts, so the
> > > > restore is
> > > > interleaved on a per-page basis, replacing the backup handles
> > > > with
> > > > page-pointers. I'll see if I can separate out at least the
> > > > initialization here.
> > > Yeah, that kind of makes sense.
> > >=20
> > > My expectation was just that we now have explicit
> > > ttm_pool_swapout()
> > > and
> > > ttm_pool_swapin() functions.
> > I fully understand, although in the allocation step, that would
> > also
> > increase the memory pressure since we might momentarily have twice
> > the
> > bo-size allocated, if the shmem object was never swapped out, and
> > we
> > don't want to unnecessarily risc OOM at recover time, although that
> > should be a recoverable situation now. If the OOM receiver can free
> > up
> > system memory resources they can could potentially restart the
> > recover.
>=20
> What I meant was more that we have ttm_pool_swapout() which does a
> mix=20
> of moving each page to a swap backend and freeing one by one.
>=20
> And ttm_pool_swapin() which allocates a bit of memory (usually one
> huge=20
> page) and then copies the content back in from the swap backend.
>=20
> Alternatively we could rename ttm_pool_alloc() into something like=20
> ttm_pool_populate() and ttm_pool_free() into ttm_pool_unpopulate(),
> but=20
> those names are not very descriptive either.
>=20
> It's just that we now do a bit more than just alloc and free in those
> functions, so the naming doesn't really match that well any more.

So what about ttm_pool_alloc() and ttm_pool_recover/swapin(), both
pointing to the same code, but _alloc() asserts that the tt isn't
backed up?

That would give a clean interface at least.

For a renaming change that touch all TTM drivers, I'd rather put that
as a last patch since getting acks for that from all TTM driver
maintainers seems like a hopeless undertaking.

/Thomas




>=20
> Christian.
>=20
> >=20
> > /Thomas

