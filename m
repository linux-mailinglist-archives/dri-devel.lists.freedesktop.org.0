Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0765958B8E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1410E311;
	Tue, 20 Aug 2024 15:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEzEaONo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410110E277;
 Tue, 20 Aug 2024 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724168727; x=1755704727;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nd/BiIYQ38UO7qpJMeZwGdMyYMQbT9NSR9XmyAZjzXI=;
 b=KEzEaONoFWo9ump2Kuuz4bVyWij7hnt4JJ3uSBpVmJrjtOnAvLnqVQod
 LBdIMyoANB+lco942/fsPZacZqcP3D40kcbcjVPZAorknYdK5O+uCmZac
 y6L/+psSvyefBdM6hfIN8aKq/cfxln7Qz4R2ihTOLSbIQslpV9nDzaeUO
 YlCVFZyZegfQjHtdBNvlau5FdcAlGKLeurI3jW8i4M2oXNMhL6yQmji6R
 2+yz4nW0grckAozJDrokqTO/qpryP+3kQHuOu5VdRvtgov94xOYDK4zuM
 UGgYmLL77iyJtlfBwHxXsEc2/jfJ643d9eUalW8jlIKmZtXQIlypJWubb w==;
X-CSE-ConnectionGUID: oSNqm0JiSzOezCPHaNgojg==
X-CSE-MsgGUID: IYehFL+rR0i2a+g/fcNbvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26279790"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26279790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 08:45:27 -0700
X-CSE-ConnectionGUID: VcQhsFH4Rf+Aphj1YHbAbQ==
X-CSE-MsgGUID: tDmbNmw3RJCBNESzdTjjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60731816"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.74])
 ([10.245.245.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 08:45:25 -0700
Message-ID: <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Nirmoy
 Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Date: Tue, 20 Aug 2024 17:45:22 +0200
In-Reply-To: <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
 <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
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

On Tue, 2024-08-20 at 17:30 +0200, Christian K=C3=B6nig wrote:
> Am 20.08.24 um 15:33 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Nirmoy, Christian
> >=20
> > On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
> > > Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
> > > releasing backing stores if they want to skip clear-on-free.
> > >=20
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > What happens if two devices share the same global TTM pool
> > =C2=A0 type and one that does its own clearing. Wouldn't there be a
> > pretty
> > high chance that the the device that doesn't clear its own pages
> > allocate non-cleared memory from the pool?
>=20
> That's completely unproblematic. The flag indicates that the released
> pages are already cleared, if that isn't the case then the flag=20
> shouldn't be set on the TT object.

Yeah, this patch is OK, but the way the follow-up xe patch uses it is
problematic since, AFAICT, xe dma clears on alloc, meaning the pool
pages are not cleared after use.

/Thomas

>=20
> If one device clear it's pages and another device doesn't clear it's=20
> pages then we would just clear the pages of the device which doesn't
> do=20
> it with a hardware DMA.
>=20
> Regards,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
> > > =C2=A0=C2=A0include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +++++-
> > > =C2=A0=C2=A02 files changed, 16 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index 8504dbe19c1a..935ab3cfd046 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
> > > *pool, dma_addr_t dma_addr,
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/* Give pages into a specific pool_type */
> > > -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
> > > page
> > > *p)
> > > +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
> > > page
> > > *p,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool cleared)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	unsigned int i, num_pages =3D 1 << pt->order;
> > > =C2=A0=20
> > > -	for (i =3D 0; i < num_pages; ++i) {
> > > -		if (PageHighMem(p))
> > > -			clear_highpage(p + i);
> > > -		else
> > > -			clear_page(page_address(p + i));
> > > +	if (!cleared) {
> > > +		for (i =3D 0; i < num_pages; ++i) {
> > > +			if (PageHighMem(p))
> > > +				clear_highpage(p + i);
> > > +			else
> > > +				clear_page(page_address(p + i));
> > > +		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&pt->lock);
> > > @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct
> > > ttm_pool
> > > *pool, struct ttm_tt *tt,
> > > =C2=A0=C2=A0				pgoff_t start_page, pgoff_t
> > > end_page)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct page **pages =3D &tt->pages[start_page];
> > > +	bool cleared =3D tt->page_flags &
> > > TTM_TT_FLAG_CLEARED_ON_FREE;
> > > =C2=A0=C2=A0	unsigned int order;
> > > =C2=A0=C2=A0	pgoff_t i, nr;
> > > =C2=A0=20
> > > @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct
> > > ttm_pool
> > > *pool, struct ttm_tt *tt,
> > > =C2=A0=20
> > > =C2=A0=C2=A0		pt =3D ttm_pool_select_type(pool, caching, order);
> > > =C2=A0=C2=A0		if (pt)
> > > -			ttm_pool_type_give(pt, *pages);
> > > +			ttm_pool_type_give(pt, *pages, cleared);
> > > =C2=A0=C2=A0		else
> > > =C2=A0=C2=A0			ttm_pool_free_page(pool, caching, order,
> > > *pages);
> > > =C2=A0=C2=A0	}
> > > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > > index 2b9d856ff388..cfaf49de2419 100644
> > > --- a/include/drm/ttm/ttm_tt.h
> > > +++ b/include/drm/ttm/ttm_tt.h
> > > @@ -85,6 +85,9 @@ struct ttm_tt {
> > > =C2=A0=C2=A0	 * fault handling abuses the DMA api a bit and
> > > dma_map_attrs
> > > can't be
> > > =C2=A0=C2=A0	 * used to assure pgprot always matches.
> > > =C2=A0=C2=A0	 *
> > > +	 * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
> > > handles
> > > +	 * clearing backing store
> > > +	 *
> > > =C2=A0=C2=A0	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
> > > USE. This is
> > > =C2=A0=C2=A0	 * set by TTM after ttm_tt_populate() has successfully
> > > returned, and is
> > > =C2=A0=C2=A0	 * then unset when TTM calls ttm_tt_unpopulate().
> > > @@ -94,8 +97,9 @@ struct ttm_tt {
> > > =C2=A0=C2=A0#define TTM_TT_FLAG_EXTERNAL		BIT(2)
> > > =C2=A0=C2=A0#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
> > > =C2=A0=C2=A0#define TTM_TT_FLAG_DECRYPTED		BIT(4)
> > > +#define TTM_TT_FLAG_CLEARED_ON_FREE	BIT(5)
> > > =C2=A0=20
> > > -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> > > +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
> > > =C2=A0=C2=A0	uint32_t page_flags;
> > > =C2=A0=C2=A0	/** @num_pages: Number of pages in the page array. */
> > > =C2=A0=C2=A0	uint32_t num_pages;
>=20

