Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5685F307
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05D410E8C2;
	Thu, 22 Feb 2024 08:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjFrcyo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A536710E8C0;
 Thu, 22 Feb 2024 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708590788; x=1740126788;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=adkD97HzbwR4kIQ/o02/tQek3YPzfq+8AwMRSDX9UW0=;
 b=LjFrcyo+Sa19dAoDt/bmeJ6VWDR+tlAtDsvow0asVN3H6NomwbxpjorB
 u7QJsnOeDuaQ6BgxV4GxlOPoBUiK0DO7V9/FbS5mbBvW54XhLHn1/skcd
 8d3rrBZQSbUB84QKhPgeUefnsNrsXF8q1VPdsn4JvcvYqiS4C2s8vfxyg
 siWdOmQt3oz2+R/5HgHahuv38Y24mfI3CwvL3TMwVOqY/pFuYnDja6VQu
 GCX52MMkEdahUcz01mQkXmtFvfaqU6mnNIdnOjGy5KpMzFKvDDhTuygkV
 kpn2OHn/RtOdQPWiJPw1na15tl8ubWfxl1un7Uktush0OiqhGxp7sC/aN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6579363"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6579363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 00:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10004721"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO [10.249.254.168])
 ([10.249.254.168])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 00:33:04 -0800
Message-ID: <1b76a3adb4e11c57fd07eada3716972bb15e47ef.camel@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: Fix an invalid freeing on already freed page
 in error path
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>, 
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date: Thu, 22 Feb 2024 09:33:02 +0100
In-Reply-To: <12471d185a3c90e53d665878db321c36e3fd2e53.camel@linux.intel.com>
References: <20240221073324.3303-1-thomas.hellstrom@linux.intel.com>
 <6733f48a-4fb2-446c-91a8-e631937fbfcb@amd.com>
 <12471d185a3c90e53d665878db321c36e3fd2e53.camel@linux.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Thu, 2024-02-22 at 08:34 +0100, Thomas Hellstr=C3=B6m wrote:
> On Wed, 2024-02-21 at 11:26 +0100, Christian K=C3=B6nig wrote:
> > Am 21.02.24 um 08:33 schrieb Thomas Hellstr=C3=B6m:
> > > If caching mode change fails due to, for example, OOM we
> > > free the allocated pages in a two-step process. First the pages
> > > for which the caching change has already succeeded. Secondly
> > > the pages for which a caching change did not succeed.
> > >=20
> > > However the second step was incorrectly freeing the pages already
> > > freed in the first step.
> > >=20
> > > Fix.
> > >=20
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error
> > > path")
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Christian Koenig <christian.koenig@amd.com>
> > > Cc: Huang Rui <ray.huang@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: <stable@vger.kernel.org> # v6.4+
> >=20
> > You don't know how much time I've spend staring at this line to
> > find
> > the=20
> > bug in it and haven't seen it. Got bug reports about that for month
> > as well.
>=20
>=20
> Yeah, sorry about that. We should probably have Kunit tests
> exercising
> OOM in the pool code involving WC pages.
>=20
> I'll push this to drm-misc-next.

drm-misc-fixes..
/Thomas


>=20
> /Thomas
>=20
> >=20
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >=20
> > > ---
> > > =C2=A0 drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index b62f420a9f96..112438d965ff 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -387,7 +387,7 @@ static void ttm_pool_free_range(struct
> > > ttm_pool
> > > *pool, struct ttm_tt *tt,
> > > =C2=A0=C2=A0				enum ttm_caching caching,
> > > =C2=A0=C2=A0				pgoff_t start_page, pgoff_t
> > > end_page)
> > > =C2=A0 {
> > > -	struct page **pages =3D tt->pages;
> > > +	struct page **pages =3D &tt->pages[start_page];
> > > =C2=A0=C2=A0	unsigned int order;
> > > =C2=A0=C2=A0	pgoff_t i, nr;
> > > =C2=A0=20
> >=20
>=20

