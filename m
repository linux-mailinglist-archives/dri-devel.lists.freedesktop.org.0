Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7209588E54
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 16:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488F82B592;
	Wed,  3 Aug 2022 14:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6314BB41;
 Wed,  3 Aug 2022 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659536031; x=1691072031;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BsKJWJU6OZj2+68nG5xGQnbTAWykYOp6ZiGKI8pwOXQ=;
 b=YkmaxmEaNO8656A7WDqseWA9/I774sWuf1+ZdyMu6DW693L3QS2cCsx8
 T2kxbfJCqPoofWFHeSI7pZnfoGcAVqrF9ipj3M2r7v+G3qGQdUGmG8Bsw
 o1EU0MkEJiIY72MBD75jwnn5uvsEQfI7Ohg7XYOpf6ddvJIuQB79pHnFf
 uzNToolN2p3/ZO5dILu4OnNqePy/fJCxNrlIt9jUIBkk4rZB65dUi6GcS
 fvtwDp6cVT6a2d0Dp7tHlQsJfCDPg5i94RzqpDst5fiwuZLSnV20qviGh
 N7Fn+n/OlY3DPpz1SS+db3SlvoqtL8sdhPNbSg71zJGBJ4IpTsKVTlt4X g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="288436920"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="288436920"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 07:13:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="631163538"
Received: from ns1-mobl.gar.corp.intel.com (HELO localhost) ([10.252.59.244])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:13:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 4/7] drm/i915: Check for integer truncation on the
 configuration of ttm place
In-Reply-To: <20220725092528.1281487-5-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-5-gwan-gyeong.mun@intel.com>
Date: Wed, 03 Aug 2022 17:13:43 +0300
Message-ID: <8735edquso.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Jul 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> There is an impedance mismatch between the first/last valid page
> frame number of ttm place in unsigned and our memory/page accounting in
> unsigned long.
> As the object size is under the control of userspace, we have to be prude=
nt
> and catch the conversion errors.
> To catch the implicit truncation as we switch from unsigned long to
> unsigned, we use overflows_type check and report E2BIG or overflow_type
> prior to the operation.
>
> v3: Not to change execution inside a macro. (Mauro)
>     Add safe_conversion_gem_bug_on() macro and remove temporal
>     SAFE_CONVERSION() macro.
>
> v4: Fix unhandled GEM_BUG_ON() macro call from safe_conversion_gem_bug_on=
()
>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
>  drivers/gpu/drm/i915/i915_gem.h         |  4 ++++
>  drivers/gpu/drm/i915/intel_region_ttm.c | 20 +++++++++++++++++---
>  3 files changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 9f2be1892b6c..88f2887627dc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -140,14 +140,14 @@ i915_ttm_place_from_region(const struct intel_memor=
y_region *mr,
>  	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>  		place->flags |=3D TTM_PL_FLAG_CONTIGUOUS;
>  	if (offset !=3D I915_BO_INVALID_OFFSET) {
> -		place->fpfn =3D offset >> PAGE_SHIFT;
> -		place->lpfn =3D place->fpfn + (size >> PAGE_SHIFT);
> +		safe_conversion_gem_bug_on(&place->fpfn, offset >> PAGE_SHIFT);
> +		safe_conversion_gem_bug_on(&place->lpfn, place->fpfn + (size >> PAGE_S=
HIFT));

So the natural thing would be to have and use two orthogonal helpers, a
safe_conversion predicate and a warn:

	GEM_BUG_ON(!safe_conversion(...));

or even:

	if (GEM_BUG_ON(!safe_conversion(...)))
		/* ... */

But GEM_BUG_ON() is surprising and does not follow the same pattern as
WARN_ON/BUG_ON. *sigh*

BR,
Jani.


>  	} else if (mr->io_size && mr->io_size < mr->total) {
>  		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>  			place->flags |=3D TTM_PL_FLAG_TOPDOWN;
>  		} else {
>  			place->fpfn =3D 0;
> -			place->lpfn =3D mr->io_size >> PAGE_SHIFT;
> +			safe_conversion_gem_bug_on(&place->lpfn, mr->io_size >> PAGE_SHIFT);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_=
gem.h
> index 68d8d52bd541..327dacedd5d1 100644
> --- a/drivers/gpu/drm/i915/i915_gem.h
> +++ b/drivers/gpu/drm/i915/i915_gem.h
> @@ -83,5 +83,9 @@ struct drm_i915_private;
>  #endif
>=20=20
>  #define I915_GEM_IDLE_TIMEOUT (HZ / 5)
> +#define safe_conversion_gem_bug_on(ptr, value) !({ \
> +	safe_conversion(ptr, value) ? 0 \
> +		: (({ GEM_BUG_ON(overflows_type(value, *ptr)); }), 1); \
> +})
>=20=20
>  #endif /* __I915_GEM_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i9=
15/intel_region_ttm.c
> index 575d67bc6ffe..f0d143948725 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -209,14 +209,26 @@ intel_region_ttm_resource_alloc(struct intel_memory=
_region *mem,
>  	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>  		place.flags |=3D TTM_PL_FLAG_CONTIGUOUS;
>  	if (offset !=3D I915_BO_INVALID_OFFSET) {
> -		place.fpfn =3D offset >> PAGE_SHIFT;
> -		place.lpfn =3D place.fpfn + (size >> PAGE_SHIFT);
> +		if (!safe_conversion_gem_bug_on(&place.fpfn,
> +						offset >> PAGE_SHIFT)) {
> +			ret =3D -E2BIG;
> +			goto out;
> +		}
> +		if (!safe_conversion_gem_bug_on(&place.lpfn,
> +						place.fpfn + (size >> PAGE_SHIFT))) {
> +			ret =3D -E2BIG;
> +			goto out;
> +		}
>  	} else if (mem->io_size && mem->io_size < mem->total) {
>  		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>  			place.flags |=3D TTM_PL_FLAG_TOPDOWN;
>  		} else {
>  			place.fpfn =3D 0;
> -			place.lpfn =3D mem->io_size >> PAGE_SHIFT;
> +			if (!safe_conversion_gem_bug_on(&place.lpfn,
> +							mem->io_size >> PAGE_SHIFT)) {
> +				ret =3D -E2BIG;
> +				goto out;
> +			}
>  		}
>  	}
>=20=20
> @@ -224,6 +236,8 @@ intel_region_ttm_resource_alloc(struct intel_memory_r=
egion *mem,
>  	mock_bo.bdev =3D &mem->i915->bdev;
>=20=20
>  	ret =3D man->func->alloc(man, &mock_bo, &place, &res);
> +
> +out:
>  	if (ret =3D=3D -ENOSPC)
>  		ret =3D -ENXIO;
>  	if (!ret)

--=20
Jani Nikula, Intel Open Source Graphics Center
