Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE1567161
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC1E11ADCB;
	Tue,  5 Jul 2022 14:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEEC11AAF3;
 Tue,  5 Jul 2022 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657032293; x=1688568293;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UVtqlULTfhLZAuHz5vwZfO2/Uzzy0fT9xR0jTTa0oJ8=;
 b=mxRwvjgDskZtA3Dch6UuTgDQc7uhQoQMZaIHjfVpU4fx+TF5Q/eEM2B6
 IC1qJzO59bRyR00k8uoEDX36xhg1gdXP6nQghc9wmOMf0CkzOd3w40tvy
 jdqhJFjx3V2vTIP3WvcTGXisChJ/FsxJfihJECXJIADvbMJOq1D3PPl+K
 k3dhM8Sn9JGQ541q9vzM+0QSfBJCwj/RkFc3CWxhiPvodiqFYm7+pmw48
 NLxnzdrOr/a1NwkbJW8nEQYWV/rZ2hr8R9IKgeZSWEwORch39S5O+puvn
 151NXMJhiQjDxTkBUsr6UnLmtPK+w8Hn2XzxezQx0lpkI2ke6RhexYhVE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="272150940"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="272150940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:44:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="650180384"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.206])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:44:50 -0700
Date: Tue, 5 Jul 2022 16:44:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 4/7] drm/i915: Check for integer truncation on the
 configuration of ttm place
Message-ID: <20220705164447.4ff15ab6@maurocar-mobl2>
In-Reply-To: <20220705122455.3866745-5-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-5-gwan-gyeong.mun@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  5 Jul 2022 15:24:52 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> There is an impedance mismatch between the first/last valid page
> frame number of ttm place in unsigned and our memory/page accounting in
> unsigned long.
> As the object size is under the control of userspace, we have to be prude=
nt
> and catch the conversion errors.
> To catch the implicit truncation as we switch from unsigned long to
> unsigned, we use overflows_type check and report E2BIG or overflow_type
> prior to the operation.
>=20
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 12 +++++++++---
>  drivers/gpu/drm/i915/intel_region_ttm.c | 16 +++++++++++++---
>  2 files changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index cdcb3ee0c433..d579524663b3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -137,19 +137,25 @@ i915_ttm_place_from_region(const struct intel_memor=
y_region *mr,
>  	if (mr->type =3D=3D INTEL_MEMORY_SYSTEM)
>  		return;
> =20
> +#define SAFE_CONVERSION(ptr, value) ({ \
> +	if (!safe_conversion(ptr, value)) { \
> +		GEM_BUG_ON(overflows_type(value, *ptr)); \
> +	} \
> +})
>  	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>  		place->flags |=3D TTM_PL_FLAG_CONTIGUOUS;
>  	if (offset !=3D I915_BO_INVALID_OFFSET) {
> -		place->fpfn =3D offset >> PAGE_SHIFT;
> -		place->lpfn =3D place->fpfn + (size >> PAGE_SHIFT);
> +		SAFE_CONVERSION(&place->fpfn, offset >> PAGE_SHIFT);
> +		SAFE_CONVERSION(&place->lpfn, place->fpfn + (size >> PAGE_SHIFT));
>  	} else if (mr->io_size && mr->io_size < mr->total) {
>  		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>  			place->flags |=3D TTM_PL_FLAG_TOPDOWN;
>  		} else {
>  			place->fpfn =3D 0;
> -			place->lpfn =3D mr->io_size >> PAGE_SHIFT;
> +			SAFE_CONVERSION(&place->lpfn, mr->io_size >> PAGE_SHIFT);
>  		}
>  	}

> +#undef SAFE_CONVERSION
Why?

>  }
> =20
>  static void
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i9=
15/intel_region_ttm.c
> index 62ff77445b01..8fcb8654b978 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -202,24 +202,34 @@ intel_region_ttm_resource_alloc(struct intel_memory=
_region *mem,
>  	struct ttm_resource *res;
>  	int ret;
> =20
> +#define SAFE_CONVERSION(ptr, value) ({ \
> +	if (!safe_conversion(ptr, value)) { \
> +		GEM_BUG_ON(overflows_type(value, *ptr)); \
> +		ret =3D -E2BIG; \
> +		goto out; \
> +	} \
> +})

It is a bad practice to change execution inside a macro.
See "12) Macros, Enums and RTL" at Documentation/process/coding-style.rst.

>  	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>  		place.flags |=3D TTM_PL_FLAG_CONTIGUOUS;
>  	if (offset !=3D I915_BO_INVALID_OFFSET) {
> -		place.fpfn =3D offset >> PAGE_SHIFT;
> -		place.lpfn =3D place.fpfn + (size >> PAGE_SHIFT);
> +		SAFE_CONVERSION(&place.fpfn, offset >> PAGE_SHIFT);
> +		SAFE_CONVERSION(&place.lpfn, place.fpfn + (size >> PAGE_SHIFT));
>  	} else if (mem->io_size && mem->io_size < mem->total) {
>  		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>  			place.flags |=3D TTM_PL_FLAG_TOPDOWN;
>  		} else {
>  			place.fpfn =3D 0;
> -			place.lpfn =3D mem->io_size >> PAGE_SHIFT;
> +			SAFE_CONVERSION(&place.lpfn, mem->io_size >> PAGE_SHIFT);
>  		}
>  	}

> +#undef SAFE_CONVERSION
Why?

> =20
>  	mock_bo.base.size =3D size;
>  	mock_bo.bdev =3D &mem->i915->bdev;
> =20
>  	ret =3D man->func->alloc(man, &mock_bo, &place, &res);
> +
> +out:
>  	if (ret =3D=3D -ENOSPC)
>  		ret =3D -ENXIO;
>  	if (!ret)
