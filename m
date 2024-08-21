Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0ED95964A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 10:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63410E5B0;
	Wed, 21 Aug 2024 08:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IghNvxUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C8110E59C;
 Wed, 21 Aug 2024 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724227717; x=1755763717;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k6+X1Ch2iJiSK1z+TEsJriz+zi0FonJI6ZEv1reGfFg=;
 b=IghNvxUx5mkMoTLIRwWkwljjuNOTmTE2zeAK71+fMbfMTwQlnVzCykjN
 joxehiy0e3rPGPIhB//09CXseXdlletSHDc9ot6DI1xV549SoN2WF3X7i
 aXnuLINRvJsLvRZ3lqqI7+UkJX+TUqHZbyd2tC56c8d+xuvdOmTZ8RxW+
 IupsWh3rizkMrUCZOIsmC0Je2rDt6OLmFnR8ExtYpubL7jwCAcJ+TFtXv
 KJJSB+kDpqrJp8c/mhsttHgchOdZMkeXBWz3wXzZlzAveHsSefxoT/nxB
 7siiEugCNJCbHU9QAZ0AXCayUa9qyvvLah8JhAtj8jnrqVg7KTRVsDxlw w==;
X-CSE-ConnectionGUID: 2FbQy0ogQnOiw2xL7wWZwA==
X-CSE-MsgGUID: Ebnex1UqRUW5BJhuiqcltA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33956698"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33956698"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 01:08:33 -0700
X-CSE-ConnectionGUID: gH2qnUgxQ5mmOzTN2kEalw==
X-CSE-MsgGUID: tMItLpZyQwm9lt3JARyRqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60980521"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 01:08:30 -0700
Message-ID: <3f2c8223b92facfa99c760dacd116fa93afada53.camel@linux.intel.com>
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Nirmoy
 Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Date: Wed, 21 Aug 2024 10:08:28 +0200
In-Reply-To: <02a383c5-db18-47ef-9118-72effd83a252@amd.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
 <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
 <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
 <b94e2ea6-569d-47bc-8e01-199b543b2018@amd.com>
 <b37433a5-a3b5-439d-9ee6-6c6260a94f13@intel.com>
 <02a383c5-db18-47ef-9118-72effd83a252@amd.com>
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

On Wed, 2024-08-21 at 09:47 +0200, Christian K=C3=B6nig wrote:
> Am 20.08.24 um 18:46 schrieb Nirmoy Das:
> > Hi Thomas, Christian,
> >=20
> > On 8/20/2024 5:47 PM, Christian K=C3=B6nig wrote:
> > > Am 20.08.24 um 17:45 schrieb Thomas Hellstr=C3=B6m:
> > > > On Tue, 2024-08-20 at 17:30 +0200, Christian K=C3=B6nig wrote:
> > > > > Am 20.08.24 um 15:33 schrieb Thomas Hellstr=C3=B6m:
> > > > > > Hi, Nirmoy, Christian
> > > > > >=20
> > > > > > On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
> > > > > > > Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can
> > > > > > > set before
> > > > > > > releasing backing stores if they want to skip clear-on-
> > > > > > > free.
> > > > > > >=20
> > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > > > Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > What happens if two devices share the same global TTM pool
> > > > > > =C2=A0=C2=A0 type and one that does its own clearing. Wouldn't =
there
> > > > > > be a
> > > > > > pretty
> > > > > > high chance that the the device that doesn't clear its own
> > > > > > pages
> > > > > > allocate non-cleared memory from the pool?
> > > > > That's completely unproblematic. The flag indicates that the
> > > > > released
> > > > > pages are already cleared, if that isn't the case then the
> > > > > flag
> > > > > shouldn't be set on the TT object.
> > > > Yeah, this patch is OK, but the way the follow-up xe patch uses
> > > > it is
> > > > problematic since, AFAICT, xe dma clears on alloc, meaning the
> > > > pool
> > > > pages are not cleared after use.
> > >=20
> > > Yeah that is clearly invalid behavior.
> >=20
> >=20
> > I was only thinking about one device use-case which won't leak any=20
> > data though I am now miss-using the flag.
> >=20
> > If I skip dma clear for pooled BO then this flag=C2=A0 is not really=
=20
> > needed. Shall I revert the this and usage of
> > TTM_TT_FLAG_CLEARED_ON_FREE
> >=20
> > and re-introduce it after I get a working clear on free
> > implementation=20
> > for XE?
>=20
> Yes absolutely.
>=20
> I though that I made it clear that the handling should be that the=20
> driver clears the pages and *then* sets the
> TTM_TT_FLAG_CLEARED_ON_FREE=20
> flag.
>=20
> So if you don't have the handling implemented like that then that's=20
> clearly invalid behavior.
>=20
> Regards,
> Christian.

I agree.
Revert and re-introduce as needed, and obtain an ack from Christian to
merge through drm-xe-next before re-introduction so that it doesn't
clash with anything planned elsewhere.

Thanks,
Thomas



>=20
> >=20
> >=20
> > Regards,
> >=20
> > Nirmoy
> >=20
> >=20
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > >=20
> > > > /Thomas
> > > >=20
> > > > > If one device clear it's pages and another device doesn't
> > > > > clear it's
> > > > > pages then we would just clear the pages of the device which
> > > > > doesn't
> > > > > do
> > > > > it with a hardware DMA.
> > > > >=20
> > > > > Regards,
> > > > > Christian.
> > > > >=20
> > > > > > /Thomas
> > > > > >=20
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++=
++++-------
> > > > > > > =C2=A0=C2=A0=C2=A0include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-
> > > > > > > =C2=A0=C2=A0=C2=A02 files changed, 16 insertions(+), 8 deleti=
ons(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > > > index 8504dbe19c1a..935ab3cfd046 100644
> > > > > > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > > > > > @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct
> > > > > > > ttm_pool
> > > > > > > *pool, dma_addr_t dma_addr,
> > > > > > > =C2=A0=C2=A0=C2=A0}
> > > > > > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0/* Give pages into a specific =
pool_type */
> > > > > > > -static void ttm_pool_type_give(struct ttm_pool_type *pt,
> > > > > > > struct
> > > > > > > page
> > > > > > > *p)
> > > > > > > +static void ttm_pool_type_give(struct ttm_pool_type *pt,
> > > > > > > struct
> > > > > > > page
> > > > > > > *p,
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool cleared)
> > > > > > > =C2=A0=C2=A0=C2=A0{
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, num_page=
s =3D 1 << pt->order;
> > > > > > > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_pages;=
 ++i) {
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (PageHighMem(p=
))
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 clear_highpage(p + i);
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 clear_page(page_address(p + i));
> > > > > > > +=C2=A0=C2=A0=C2=A0 if (!cleared) {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i <=
 num_pages; ++i) {
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (PageHighMem(p))
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear_highpage(p + i);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 else
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear_page(page_address(p + i));
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&=
pt->lock);
> > > > > > > @@ -394,6 +397,7 @@ static void
> > > > > > > ttm_pool_free_range(struct
> > > > > > > ttm_pool
> > > > > > > *pool, struct ttm_tt *tt,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgoff_t start_page, pgoff_=
t
> > > > > > > end_page)
> > > > > > > =C2=A0=C2=A0=C2=A0{
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page **pages =3D =
&tt->pages[start_page];
> > > > > > > +=C2=A0=C2=A0=C2=A0 bool cleared =3D tt->page_flags &
> > > > > > > TTM_TT_FLAG_CLEARED_ON_FREE;
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order;
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgoff_t i, nr;
> > > > > > > =C2=A0=C2=A0 @@ -407,7 +411,7 @@ static void
> > > > > > > ttm_pool_free_range(struct
> > > > > > > ttm_pool
> > > > > > > *pool, struct ttm_tt *tt,
> > > > > > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pt =3D ttm_pool_select_type(pool, caching,
> > > > > > > order);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (pt)
> > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ttm_pool_type_give(pt, *pages);
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ttm_pool_type_give(pt, *pages, cleared);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
else
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ttm_pool_free_page(pool, caching, order,
> > > > > > > *pages);
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > diff --git a/include/drm/ttm/ttm_tt.h
> > > > > > > b/include/drm/ttm/ttm_tt.h
> > > > > > > index 2b9d856ff388..cfaf49de2419 100644
> > > > > > > --- a/include/drm/ttm/ttm_tt.h
> > > > > > > +++ b/include/drm/ttm/ttm_tt.h
> > > > > > > @@ -85,6 +85,9 @@ struct ttm_tt {
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * fault handling a=
buses the DMA api a bit and
> > > > > > > dma_map_attrs
> > > > > > > can't be
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * used to assure p=
gprot always matches.
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * TTM_TT_FLAG_CLEARED_ON_FREE: Set =
this if a drm
> > > > > > > driver
> > > > > > > handles
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * clearing backing store
> > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * TTM_TT_FLAG_PRIV=
_POPULATED: TTM internal only.
> > > > > > > DO NOT
> > > > > > > USE. This is
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * set by TTM after=
 ttm_tt_populate() has
> > > > > > > successfully
> > > > > > > returned, and is
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * then unset when =
TTM calls ttm_tt_unpopulate().
> > > > > > > @@ -94,8 +97,9 @@ struct ttm_tt {
> > > > > > > =C2=A0=C2=A0=C2=A0#define TTM_TT_FLAG_EXTERNAL=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
> > > > > > > =C2=A0=C2=A0=C2=A0#define TTM_TT_FLAG_EXTERNAL_MAPPABLE=C2=A0=
=C2=A0=C2=A0 BIT(3)
> > > > > > > =C2=A0=C2=A0=C2=A0#define TTM_TT_FLAG_DECRYPTED=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
> > > > > > > +#define TTM_TT_FLAG_CLEARED_ON_FREE=C2=A0=C2=A0=C2=A0 BIT(5)
> > > > > > > =C2=A0=C2=A0 -#define TTM_TT_FLAG_PRIV_POPULATED=C2=A0=C2=A0=
=C2=A0 BIT(5)
> > > > > > > +#define TTM_TT_FLAG_PRIV_POPULATED=C2=A0=C2=A0=C2=A0 BIT(6)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t page_flags;
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @num_pages: Number o=
f pages in the page array.
> > > > > > > */
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t num_pages;
> > >=20
>=20

