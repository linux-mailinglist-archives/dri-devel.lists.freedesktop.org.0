Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2498D24C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6F10E1B1;
	Wed,  2 Oct 2024 11:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAR0p9z3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6224A10E1B1;
 Wed,  2 Oct 2024 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727869446; x=1759405446;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cTf9OKs9I3s5On8oTADSl9ecz7R4dFFsp5ICOX9L+PI=;
 b=XAR0p9z34fbCcchhzizi05FJO0KqwIinGGlzB1HTRq/oXmjccPw0z49C
 l+tY+9AZ+MvUddjB1ncEHDZr+MnudfmVXIoHRAUwl62AfHDhcSae1G4Qs
 11xw/2ez8Qcj8vPi9LJVj2iZxw8+RrhS/51b1OjQAQVGD4uK77FxSBZ/b
 oPqPHYtQMosEQKw+YdIMUQbbQFyO2P5QKzZW/LiGHS8zlT+yJeCDoJId6
 v2Vc20oPwdVWliUrGh3DKOc9JFwX2i62Ccexp/enE3Djwh9Dtjt8g6IUd
 EKZDzqY6/lK9XjwTGpDgMZJwBu3BsLd/wZzkt6HFFtniysziLkQuHBvyw g==;
X-CSE-ConnectionGUID: 1MPh+Z0WSUyfwybwErWIaQ==
X-CSE-MsgGUID: +x11f4A5SAaZr7oDLZP5wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30912999"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30912999"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:44:06 -0700
X-CSE-ConnectionGUID: Ng6vydCJTKack5zyKS7JiQ==
X-CSE-MsgGUID: VDWF6AFRR0GUaZr9ErNUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74090218"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.67])
 ([10.245.244.67])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:44:04 -0700
Message-ID: <d3dfe63c651b481ef2d56913660bdd2bd76123ff.camel@linux.intel.com>
Subject: Re: RESEND Re: [PATCH v4 1/2] drm/ttm: Move swapped objects off the
 manager's LRU list
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Wed, 02 Oct 2024 13:44:02 +0200
In-Reply-To: <a8d52d3f734f059c7a53461f3dfeccfac923d40c.camel@linux.intel.com>
References: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
 <20240904070808.95126-2-thomas.hellstrom@linux.intel.com>
 <91936a3d-b8c1-41f6-95e0-870fc1c2d007@amd.com>
 <e3c6ba4eb2349cb160996a913132e022af63abd8.camel@linux.intel.com>
 <78c687b5-2dd1-4d6f-a6c3-22769d75bbb6@amd.com>
 <954958e10350b5e1cd0a4197a4a0ea68f74b6470.camel@linux.intel.com>
 <a8d52d3f734f059c7a53461f3dfeccfac923d40c.camel@linux.intel.com>
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

Hi, Christian,

Gentle ping on this one as well.
Thanks,
Thomas


On Thu, 2024-09-19 at 17:24 +0200, Thomas Hellstr=C3=B6m wrote:
> Hi Christian,
>=20
> Ping?
>=20
> /Thomas
>=20
>=20
> On Thu, 2024-09-12 at 15:40 +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi, Christian,
> >=20
> > On Wed, 2024-09-04 at 12:47 +0200, Christian K=C3=B6nig wrote:
> > > Am 04.09.24 um 10:54 schrieb Thomas Hellstr=C3=B6m:
> > > > On Wed, 2024-09-04 at 10:50 +0200, Christian K=C3=B6nig wrote:
> > > > > Am 04.09.24 um 09:08 schrieb Thomas Hellstr=C3=B6m:
> > > > > > Resources of swapped objects remains on the TTM_PL_SYSTEM
> > > > > > manager's
> > > > > > LRU list, which is bad for the LRU walk efficiency.
> > > > > >=20
> > > > > > Rename the device-wide "pinned" list to "unevictable" and
> > > > > > move
> > > > > > also resources of swapped-out objects to that list.
> > > > > >=20
> > > > > > An alternative would be to create an "UNEVICTABLE" priority
> > > > > > to
> > > > > > be able to keep the pinned- and swapped objects on their
> > > > > > respective manager's LRU without affecting the LRU walk
> > > > > > efficiency.
> > > > > >=20
> > > > > > v2:
> > > > > > - Remove a bogus WARN_ON (Christian K=C3=B6nig)
> > > > > > - Update ttm_resource_[add|del] bulk move (Christian K=C3=B6nig=
)
> > > > > > - Fix TTM KUNIT tests (Intel CI)
> > > > > > v3:
> > > > > > - Check for non-NULL bo->resource in ttm_bo_populate().
> > > > > > v4:
> > > > > > - Don't move to LRU tail during swapout until the resource
> > > > > > =C2=A0=C2=A0=C2=A0 is properly swapped or there was a swapout f=
ailure.
> > > > > > =C2=A0=C2=A0=C2=A0 (Intel Ci)
> > > > > > - Add a newline after checkpatch check.
> > > > > >=20
> > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: <dri-devel@lists.freedesktop.org>
> > > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > I really wonder if having a SWAPPED wouldn't be cleaner in
> > > > > the
> > > > > long
> > > > > run.
> > > > >=20
> > > > > Anyway, that seems to work for now. So patch is Reviewed-by:
> > > > > Christian
> > > > > K=C3=B6nig <christian.koenig@amd.com>.
> > > > Thanks. Are you ok with the changes to the pinning patch that
> > > > happened
> > > > after yoour R-B as well?
> > >=20
> > > I was already wondering why the increment used to be separate
> > > while
> > > reviewing the initial version. So yes that looks better now.
> > >=20
> > > >=20
> > > > Ack to merge through drm-misc-next once CI is clean?
> > >=20
> > > Yeah, works for me.
> > >=20
> > > Christian.
> >=20
> > i915 & xe CI is clean now for this series but I had to change patch
> > 1
> > slightly to avoid putting *all* resources that were created for a
> > swapped bo on the unevictable list (Typically VRAM resources that
> > were
> > created for validation back to VRAM).
> >=20
> > So question is if your R-B still holds. Series is now at version 6.
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> > >=20
> > > >=20
> > > > /Thomas
> > > >=20
> > > >=20
> > > > > Regards,
> > > > > Christian.
> > > > >=20
> > > > > > ---
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/i915/gem/i915_gem_ttm.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c=C2=A0=
 |=C2=A0 2 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/tests/ttm_bo_test.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |=C2=
=A0 6 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 59
> > > > > > ++++++++++++++++++-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo_vm.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++--
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 3 +
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> > > > > > =C2=A0=C2=A0 include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> > > > > > =C2=A0=C2=A0 include/drm/ttm/ttm_device.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 5 +-
> > > > > > =C2=A0=C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
> > > > > > =C2=A0=C2=A0 15 files changed, 96 insertions(+), 27 deletions(-=
)
> > > > > >=20
> > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > index 5c72462d1f57..7de284766f82 100644
> > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > @@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct
> > > > > > drm_i915_gem_object *obj,
> > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)=
) {
> > > > > > -		ret =3D ttm_tt_populate(bo->bdev, bo->ttm,
> > > > > > &ctx);
> > > > > > +		ret =3D ttm_bo_populate(bo, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0			return ret;
> > > > > > =C2=A0=C2=A0=20
> > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > index 03b00a03a634..041dab543b78 100644
> > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> > > > > > @@ -624,7 +624,7 @@ int i915_ttm_move(struct
> > > > > > ttm_buffer_object
> > > > > > *bo,
> > > > > > bool evict,
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	/* Populate ttm with pages if needed. Typica=
lly
> > > > > > system
> > > > > > memory. */
> > > > > > =C2=A0=C2=A0=C2=A0	if (ttm && (dst_man->use_tt || (ttm->page_fl=
ags &
> > > > > > TTM_TT_FLAG_SWAPPED))) {
> > > > > > -		ret =3D ttm_tt_populate(bo->bdev, ttm, ctx);
> > > > > > +		ret =3D ttm_bo_populate(bo, ctx);
> > > > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0			return ret;
> > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > > > > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > > > > > index ad649523d5e0..61596cecce4d 100644
> > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> > > > > > @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct
> > > > > > i915_gem_apply_to_region *apply,
> > > > > > =C2=A0=C2=A0=C2=A0		goto out_no_lock;
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	backup_bo =3D i915_gem_to_ttm(backup);
> > > > > > -	err =3D ttm_tt_populate(backup_bo->bdev, backup_bo-
> > > > > > > ttm,
> > > > > > &ctx);
> > > > > > +	err =3D ttm_bo_populate(backup_bo, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0	if (err)
> > > > > > =C2=A0=C2=A0=C2=A0		goto out_no_populate;
> > > > > > =C2=A0=C2=A0=20
> > > > > > @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct
> > > > > > i915_gem_apply_to_region *apply,
> > > > > > =C2=A0=C2=A0=C2=A0	if (!backup_bo->resource)
> > > > > > =C2=A0=C2=A0=C2=A0		err =3D ttm_bo_validate(backup_bo,
> > > > > > i915_ttm_sys_placement(), &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0	if (!err)
> > > > > > -		err =3D ttm_tt_populate(backup_bo->bdev,
> > > > > > backup_bo-
> > > > > > > ttm, &ctx);
> > > > > > +		err =3D ttm_bo_populate(backup_bo, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0	if (!err) {
> > > > > > =C2=A0=C2=A0=C2=A0		err =3D i915_gem_obj_copy_ttm(obj, backup,
> > > > > > pm_apply-
> > > > > > > allow_gpu,
> > > > > > =C2=A0=C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 false);
> > > > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > > > b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > > > index f0a7eb62116c..3139fd9128d8 100644
> > > > > > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> > > > > > @@ -308,11 +308,11 @@ static void
> > > > > > ttm_bo_unreserve_pinned(struct
> > > > > > kunit *test)
> > > > > > =C2=A0=C2=A0=C2=A0	err =3D ttm_resource_alloc(bo, place, &res2)=
;
> > > > > > =C2=A0=C2=A0=C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> > > > > > =C2=A0=C2=A0=C2=A0	KUNIT_ASSERT_EQ(test,
> > > > > > -			list_is_last(&res2->lru.link,
> > > > > > &priv-
> > > > > > > ttm_dev->pinned), 1);
> > > > > > +			list_is_last(&res2->lru.link,
> > > > > > &priv-
> > > > > > > ttm_dev->unevictable), 1);
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_bo_unreserve(bo);
> > > > > > =C2=A0=C2=A0=C2=A0	KUNIT_ASSERT_EQ(test,
> > > > > > -			list_is_last(&res1->lru.link,
> > > > > > &priv-
> > > > > > > ttm_dev->pinned), 1);
> > > > > > +			list_is_last(&res1->lru.link,
> > > > > > &priv-
> > > > > > > ttm_dev->unevictable), 1);
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_resource_free(bo, &res1);
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_resource_free(bo, &res2);
> > > > > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> > > > > > b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> > > > > > index 22260e7aea58..a9f4b81921c3 100644
> > > > > > --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> > > > > > +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> > > > > > @@ -164,18 +164,18 @@ static void
> > > > > > ttm_resource_init_pinned(struct
> > > > > > kunit *test)
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	res =3D kunit_kzalloc(test, sizeof(*res),
> > > > > > GFP_KERNEL);
> > > > > > =C2=A0=C2=A0=C2=A0	KUNIT_ASSERT_NOT_NULL(test, res);
> > > > > > -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
> > > > > > > pinned));
> > > > > > +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
> > > > > > > unevictable));
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	dma_resv_lock(bo->base.resv, NULL);
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_bo_pin(bo);
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_resource_init(bo, place, res);
> > > > > > -	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo-
> > > > > > >bdev-
> > > > > > > pinned));
> > > > > > +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo-
> > > > > > >bdev-
> > > > > > > unevictable));
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_bo_unpin(bo);
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_resource_fini(man, res);
> > > > > > =C2=A0=C2=A0=C2=A0	dma_resv_unlock(bo->base.resv);
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
> > > > > > > pinned));
> > > > > > +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
> > > > > > > unevictable));
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 static void ttm_resource_fini_basic(struct kunit *=
test)
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > index 320592435252..875b024913a0 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > > @@ -139,7 +139,7 @@ static int
> > > > > > ttm_bo_handle_move_mem(struct
> > > > > > ttm_buffer_object *bo,
> > > > > > =C2=A0=C2=A0=C2=A0			goto out_err;
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0		if (mem->mem_type !=3D TTM_PL_SYSTEM) {
> > > > > > -			ret =3D ttm_tt_populate(bo->bdev,
> > > > > > bo-
> > > > > > > ttm,
> > > > > > ctx);
> > > > > > +			ret =3D ttm_bo_populate(bo, ctx);
> > > > > > =C2=A0=C2=A0=C2=A0			if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0				goto out_err;
> > > > > > =C2=A0=C2=A0=C2=A0		}
> > > > > > @@ -1128,9 +1128,20 @@ ttm_bo_swapout_cb(struct
> > > > > > ttm_lru_walk
> > > > > > *walk,
> > > > > > struct ttm_buffer_object *bo)
> > > > > > =C2=A0=C2=A0=C2=A0	if (bo->bdev->funcs->swap_notify)
> > > > > > =C2=A0=C2=A0=C2=A0		bo->bdev->funcs->swap_notify(bo);
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	if (ttm_tt_is_populated(bo->ttm))
> > > > > > +	if (ttm_tt_is_populated(bo->ttm)) {
> > > > > > +		spin_lock(&bo->bdev->lru_lock);
> > > > > > +		ttm_resource_del_bulk_move(bo->resource,
> > > > > > bo);
> > > > > > +		spin_unlock(&bo->bdev->lru_lock);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0		ret =3D ttm_tt_swapout(bo->bdev, bo->ttm,
> > > > > > swapout_walk->gfp_flags);
> > > > > > =C2=A0=C2=A0=20
> > > > > > +		spin_lock(&bo->bdev->lru_lock);
> > > > > > +		if (ret)
> > > > > > +			ttm_resource_add_bulk_move(bo-
> > > > > > > resource,
> > > > > > bo);
> > > > > > +		ttm_resource_move_to_lru_tail(bo-
> > > > > > >resource);
> > > > > > +		spin_unlock(&bo->bdev->lru_lock);
> > > > > > +	}
> > > > > > +
> > > > > > =C2=A0=C2=A0 out:
> > > > > > =C2=A0=C2=A0=C2=A0	/* Consider -ENOMEM and -ENOSPC non-fatal. *=
/
> > > > > > =C2=A0=C2=A0=C2=A0	if (ret =3D=3D -ENOMEM || ret =3D=3D -ENOSPC=
)
> > > > > > @@ -1180,3 +1191,47 @@ void ttm_bo_tt_destroy(struct
> > > > > > ttm_buffer_object *bo)
> > > > > > =C2=A0=C2=A0=C2=A0	ttm_tt_destroy(bo->bdev, bo->ttm);
> > > > > > =C2=A0=C2=A0=C2=A0	bo->ttm =3D NULL;
> > > > > > =C2=A0=C2=A0 }
> > > > > > +
> > > > > > +/**
> > > > > > + * ttm_bo_populate() - Ensure that a buffer object has
> > > > > > backing
> > > > > > pages
> > > > > > + * @bo: The buffer object
> > > > > > + * @ctx: The ttm_operation_ctx governing the operation.
> > > > > > + *
> > > > > > + * For buffer objects in a memory type whose manager uses
> > > > > > + * struct ttm_tt for backing pages, ensure those backing
> > > > > > pages
> > > > > > + * are present and with valid content. The bo's resource
> > > > > > is
> > > > > > also
> > > > > > + * placed on the correct LRU list if it was previously
> > > > > > swapped
> > > > > > + * out.
> > > > > > + *
> > > > > > + * Return: 0 if successful, negative error code on
> > > > > > failure.
> > > > > > + * Note: May return -EINTR or -ERESTARTSYS if
> > > > > > @ctx::interruptible
> > > > > > + * is set to true.
> > > > > > + */
> > > > > > +int ttm_bo_populate(struct ttm_buffer_object *bo,
> > > > > > +		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> > > > > > +{
> > > > > > +	struct ttm_tt *tt =3D bo->ttm;
> > > > > > +	bool swapped;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	dma_resv_assert_held(bo->base.resv);
> > > > > > +
> > > > > > +	if (!tt)
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	swapped =3D ttm_tt_is_swapped(tt);
> > > > > > +	ret =3D ttm_tt_populate(bo->bdev, tt, ctx);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	if (swapped && !ttm_tt_is_swapped(tt) && !bo-
> > > > > > > pin_count &&
> > > > > > +	=C2=A0=C2=A0=C2=A0 bo->resource) {
> > > > > > +		spin_lock(&bo->bdev->lru_lock);
> > > > > > +		ttm_resource_add_bulk_move(bo->resource,
> > > > > > bo);
> > > > > > +		ttm_resource_move_to_lru_tail(bo-
> > > > > > >resource);
> > > > > > +		spin_unlock(&bo->bdev->lru_lock);
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL(ttm_bo_populate);
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > index 3c07f4712d5c..d939925efa81 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct
> > > > > > ttm_buffer_object
> > > > > > *bo,
> > > > > > =C2=A0=C2=A0=C2=A0	src_man =3D ttm_manager_type(bdev, src_mem-
> > > > > > >mem_type);
> > > > > > =C2=A0=C2=A0=C2=A0	if (ttm && ((ttm->page_flags &
> > > > > > TTM_TT_FLAG_SWAPPED)
> > > > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0 dst_man->use_tt)) {
> > > > > > -		ret =3D ttm_tt_populate(bdev, ttm, ctx);
> > > > > > +		ret =3D ttm_bo_populate(bo, ctx);
> > > > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0			return ret;
> > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct
> > > > > > ttm_buffer_object *bo,
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	BUG_ON(!ttm);
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	ret =3D ttm_tt_populate(bo->bdev, ttm, &ctx);
> > > > > > +	ret =3D ttm_bo_populate(bo, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0	if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0		return ret;
> > > > > > =C2=A0=C2=A0=20
> > > > > > @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct
> > > > > > ttm_buffer_object
> > > > > > *bo,
> > > > > > struct iosys_map *map)
> > > > > > =C2=A0=C2=A0=C2=A0		pgprot_t prot;
> > > > > > =C2=A0=C2=A0=C2=A0		void *vaddr;
> > > > > > =C2=A0=C2=A0=20
> > > > > > -		ret =3D ttm_tt_populate(bo->bdev, ttm,
> > > > > > &ctx);
> > > > > > +		ret =3D ttm_bo_populate(bo, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0		if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0			return ret;
> > > > > > =C2=A0=C2=A0=20
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > index 4212b8c91dd4..2c699ed1963a 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > @@ -224,7 +224,7 @@ vm_fault_t
> > > > > > ttm_bo_vm_fault_reserved(struct
> > > > > > vm_fault *vmf,
> > > > > > =C2=A0=C2=A0=C2=A0		};
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0		ttm =3D bo->ttm;
> > > > > > -		err =3D ttm_tt_populate(bdev, bo->ttm,
> > > > > > &ctx);
> > > > > > +		err =3D ttm_bo_populate(bo, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0		if (err) {
> > > > > > =C2=A0=C2=A0=C2=A0			if (err =3D=3D -EINTR || err =3D=3D -
> > > > > > ERESTARTSYS
> > > > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 err =3D=3D -EAGAIN)
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_device.c
> > > > > > index e7cc4954c1bc..02e797fd1891 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > > > > > @@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device
> > > > > > *bdev,
> > > > > > const struct ttm_device_funcs *func
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	bdev->vma_manager =3D vma_manager;
> > > > > > =C2=A0=C2=A0=C2=A0	spin_lock_init(&bdev->lru_lock);
> > > > > > -	INIT_LIST_HEAD(&bdev->pinned);
> > > > > > +	INIT_LIST_HEAD(&bdev->unevictable);
> > > > > > =C2=A0=C2=A0=C2=A0	bdev->dev_mapping =3D mapping;
> > > > > > =C2=A0=C2=A0=C2=A0	mutex_lock(&ttm_global_mutex);
> > > > > > =C2=A0=C2=A0=C2=A0	list_add_tail(&bdev->device_list, &glob-
> > > > > > > device_list);
> > > > > > @@ -283,7 +283,7 @@ void
> > > > > > ttm_device_clear_dma_mappings(struct
> > > > > > ttm_device *bdev)
> > > > > > =C2=A0=C2=A0=C2=A0	struct ttm_resource_manager *man;
> > > > > > =C2=A0=C2=A0=C2=A0	unsigned int i, j;
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	ttm_device_clear_lru_dma_mappings(bdev, &bdev-
> > > > > > > pinned);
> > > > > > +	ttm_device_clear_lru_dma_mappings(bdev, &bdev-
> > > > > > > unevictable);
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	for (i =3D TTM_PL_SYSTEM; i < TTM_NUM_MEM_TY=
PES;
> > > > > > ++i)
> > > > > > {
> > > > > > =C2=A0=C2=A0=C2=A0		man =3D ttm_manager_type(bdev, i);
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_resource.c
> > > > > > index 6d764ba88aab..93b44043b428 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > > > > @@ -30,6 +30,7 @@
> > > > > > =C2=A0=C2=A0 #include <drm/ttm/ttm_bo.h>
> > > > > > =C2=A0=C2=A0 #include <drm/ttm/ttm_placement.h>
> > > > > > =C2=A0=C2=A0 #include <drm/ttm/ttm_resource.h>
> > > > > > +#include <drm/ttm/ttm_tt.h>
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 #include <drm/drm_util.h>
> > > > > > =C2=A0=C2=A0=20
> > > > > > @@ -239,7 +240,8 @@ static void
> > > > > > ttm_lru_bulk_move_del(struct
> > > > > > ttm_lru_bulk_move *bulk,
> > > > > > =C2=A0=C2=A0 void ttm_resource_add_bulk_move(struct ttm_resourc=
e
> > > > > > *res,
> > > > > > =C2=A0=C2=A0=C2=A0				struct ttm_buffer_object
> > > > > > *bo)
> > > > > > =C2=A0=C2=A0 {
> > > > > > -	if (bo->bulk_move && !bo->pin_count)
> > > > > > +	if (bo->bulk_move && !bo->pin_count &&
> > > > > > +	=C2=A0=C2=A0=C2=A0 (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
> > > > > > =C2=A0=C2=A0=C2=A0		ttm_lru_bulk_move_add(bo->bulk_move, res);
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=20
> > > > > > @@ -247,7 +249,8 @@ void ttm_resource_add_bulk_move(struct
> > > > > > ttm_resource *res,
> > > > > > =C2=A0=C2=A0 void ttm_resource_del_bulk_move(struct ttm_resourc=
e
> > > > > > *res,
> > > > > > =C2=A0=C2=A0=C2=A0				struct ttm_buffer_object
> > > > > > *bo)
> > > > > > =C2=A0=C2=A0 {
> > > > > > -	if (bo->bulk_move && !bo->pin_count)
> > > > > > +	if (bo->bulk_move && !bo->pin_count &&
> > > > > > +	=C2=A0=C2=A0=C2=A0 (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
> > > > > > =C2=A0=C2=A0=C2=A0		ttm_lru_bulk_move_del(bo->bulk_move, res);
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=20
> > > > > > @@ -259,8 +262,8 @@ void
> > > > > > ttm_resource_move_to_lru_tail(struct
> > > > > > ttm_resource *res)
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	lockdep_assert_held(&bo->bdev->lru_lock);
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	if (bo->pin_count) {
> > > > > > -		list_move_tail(&res->lru.link, &bdev-
> > > > > > > pinned);
> > > > > > +	if (bo->pin_count || (bo->ttm &&
> > > > > > ttm_tt_is_swapped(bo-
> > > > > > > ttm))) {
> > > > > > +		list_move_tail(&res->lru.link, &bdev-
> > > > > > > unevictable);
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	} else	if (bo->bulk_move) {
> > > > > > =C2=A0=C2=A0=C2=A0		struct ttm_lru_bulk_move_pos *pos =3D
> > > > > > @@ -301,8 +304,8 @@ void ttm_resource_init(struct
> > > > > > ttm_buffer_object
> > > > > > *bo,
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	man =3D ttm_manager_type(bo->bdev, place->me=
m_type);
> > > > > > =C2=A0=C2=A0=C2=A0	spin_lock(&bo->bdev->lru_lock);
> > > > > > -	if (bo->pin_count)
> > > > > > -		list_add_tail(&res->lru.link, &bo->bdev-
> > > > > > > pinned);
> > > > > > +	if (bo->pin_count || (bo->ttm &&
> > > > > > ttm_tt_is_swapped(bo-
> > > > > > > ttm)))
> > > > > > +		list_add_tail(&res->lru.link, &bo->bdev-
> > > > > > > unevictable);
> > > > > > =C2=A0=C2=A0=C2=A0	else
> > > > > > =C2=A0=C2=A0=C2=A0		list_add_tail(&res->lru.link, &man-
> > > > > > >lru[bo-
> > > > > > > priority]);
> > > > > > =C2=A0=C2=A0=C2=A0	man->usage +=3D res->size;
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > index 4b51b9023126..3baf215eca23 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > @@ -367,7 +367,10 @@ int ttm_tt_populate(struct ttm_device
> > > > > > *bdev,
> > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > =C2=A0=C2=A0=C2=A0	return ret;
> > > > > > =C2=A0=C2=A0 }
> > > > > > +
> > > > > > +#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)
> > > > > > =C2=A0=C2=A0 EXPORT_SYMBOL(ttm_tt_populate);
> > > > > > +#endif
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 void ttm_tt_unpopulate(struct ttm_device *bdev, st=
ruct
> > > > > > ttm_tt
> > > > > > *ttm)
> > > > > > =C2=A0=C2=A0 {
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > index a8e4d46d9123..f34daae2cf2b 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -892,7 +892,7 @@ int xe_bo_evict_pinned(struct xe_bo
> > > > > > *bo)
> > > > > > =C2=A0=C2=A0=C2=A0		}
> > > > > > =C2=A0=C2=A0=C2=A0	}
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	ret =3D ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm,
> > > > > > &ctx);
> > > > > > +	ret =3D ttm_bo_populate(&bo->ttm, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0	if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0		goto err_res_free;
> > > > > > =C2=A0=C2=A0=20
> > > > > > @@ -945,7 +945,7 @@ int xe_bo_restore_pinned(struct xe_bo
> > > > > > *bo)
> > > > > > =C2=A0=C2=A0=C2=A0	if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0		return ret;
> > > > > > =C2=A0=C2=A0=20
> > > > > > -	ret =3D ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm,
> > > > > > &ctx);
> > > > > > +	ret =3D ttm_bo_populate(&bo->ttm, &ctx);
> > > > > > =C2=A0=C2=A0=C2=A0	if (ret)
> > > > > > =C2=A0=C2=A0=C2=A0		goto err_res_free;
> > > > > > =C2=A0=C2=A0=20
> > > > > > diff --git a/include/drm/ttm/ttm_bo.h
> > > > > > b/include/drm/ttm/ttm_bo.h
> > > > > > index 7b56d1ca36d7..5804408815be 100644
> > > > > > --- a/include/drm/ttm/ttm_bo.h
> > > > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > > > @@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct
> > > > > > ttm_buffer_object *bo);
> > > > > > =C2=A0=C2=A0 pgprot_t ttm_io_prot(struct ttm_buffer_object *bo,
> > > > > > struct
> > > > > > ttm_resource *res,
> > > > > > =C2=A0=C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 pgprot_t tmp);
> > > > > > =C2=A0=C2=A0 void ttm_bo_tt_destroy(struct ttm_buffer_object *b=
o);
> > > > > > +int ttm_bo_populate(struct ttm_buffer_object *bo,
> > > > > > +		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 #endif
> > > > > > diff --git a/include/drm/ttm/ttm_device.h
> > > > > > b/include/drm/ttm/ttm_device.h
> > > > > > index c22f30535c84..438358f72716 100644
> > > > > > --- a/include/drm/ttm/ttm_device.h
> > > > > > +++ b/include/drm/ttm/ttm_device.h
> > > > > > @@ -252,9 +252,10 @@ struct ttm_device {
> > > > > > =C2=A0=C2=A0=C2=A0	spinlock_t lru_lock;
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	/**
> > > > > > -	 * @pinned: Buffer objects which are pinned and so
> > > > > > not
> > > > > > on
> > > > > > any LRU list.
> > > > > > +	 * @unevictable Buffer objects which are pinned or
> > > > > > swapped
> > > > > > and as such
> > > > > > +	 * not on an LRU list.
> > > > > > =C2=A0=C2=A0=C2=A0	 */
> > > > > > -	struct list_head pinned;
> > > > > > +	struct list_head unevictable;
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0	/**
> > > > > > =C2=A0=C2=A0=C2=A0	 * @dev_mapping: A pointer to the struct
> > > > > > address_space
> > > > > > for
> > > > > > invalidating
> > > > > > diff --git a/include/drm/ttm/ttm_tt.h
> > > > > > b/include/drm/ttm/ttm_tt.h
> > > > > > index 2b9d856ff388..991edafdb2dd 100644
> > > > > > --- a/include/drm/ttm/ttm_tt.h
> > > > > > +++ b/include/drm/ttm/ttm_tt.h
> > > > > > @@ -129,6 +129,11 @@ static inline bool
> > > > > > ttm_tt_is_populated(struct
> > > > > > ttm_tt *tt)
> > > > > > =C2=A0=C2=A0=C2=A0	return tt->page_flags &
> > > > > > TTM_TT_FLAG_PRIV_POPULATED;
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=20
> > > > > > +static inline bool ttm_tt_is_swapped(const struct ttm_tt
> > > > > > *tt)
> > > > > > +{
> > > > > > +	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
> > > > > > +}
> > > > > > +
> > > > > > =C2=A0=C2=A0 /**
> > > > > > =C2=A0=C2=A0=C2=A0 * ttm_tt_create
> > > > > > =C2=A0=C2=A0=C2=A0 *
> > >=20
> >=20
>=20

