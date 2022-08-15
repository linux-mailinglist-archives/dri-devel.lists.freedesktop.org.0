Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27BB59FFA9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB25BBEC0;
	Wed, 24 Aug 2022 16:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E1EAEED0;
 Mon, 15 Aug 2022 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660550616; x=1692086616;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JlLyLQigQB2gh7Z0RA16HbP1Gz9PymOUgkhDRIw7aAE=;
 b=YITfLnCa1yZpMRrxICXLEoOJ4r8eL0ikTYk3tvcKjVMz6pdEjY1EVdJz
 l/zeexVl9Q68vC+PBCgkaZBvJ6FfEjSB/TcTtpCmnQNyw8xqF5ZJMZDHI
 GLvYLuKNz2dnO5YoglTb7dNn/oeeXLEvHMwBmWpK/MKfjyX68HcyC5+5z
 bU/u+jMy+oeQCrvuasZoCpgaoNupo3qTh1TQ+PS04JoBfoqkYc8dqonVl
 GMmxPyXMz6ZD7G5dfdVNMRzKfMwhmutJcOjgH6A0/Ou9JEV+O95+1kNge
 BwYEv/UzB1bii/k5/zsjcFVKOYhik961Ez+0bcMb5iZhG8bUyh2Pi5Ejb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="292710442"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="292710442"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:03:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; d="scan'208";a="666582418"
Received: from abelova-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.50.172])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 01:03:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 5/8] drm/i915: Check for integer truncation on the
 configuration of ttm place
In-Reply-To: <20220813010857.4043956-6-gwan-gyeong.mun@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220813010857.4043956-1-gwan-gyeong.mun@intel.com>
 <20220813010857.4043956-6-gwan-gyeong.mun@intel.com>
Date: Mon, 15 Aug 2022 11:03:29 +0300
Message-ID: <877d3arl0u.fsf@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 andrzej.hajda@intel.com, matthew.auld@intel.com, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Aug 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
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
> v4: Fix unhandled GEM_BUG_ON() macro call from safe_conversion_gem_bug_on=
()
> v6: Fix to follow general use case for GEM_BUG_ON(). (Jani)
>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> (v2)
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v3)
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> (v5)
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
>  drivers/gpu/drm/i915/intel_region_ttm.c | 22 +++++++++++++++++++---
>  2 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 9f2be1892b6c..30f488712abe 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -140,14 +140,14 @@ i915_ttm_place_from_region(const struct intel_memor=
y_region *mr,
>  	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>  		place->flags |=3D TTM_PL_FLAG_CONTIGUOUS;
>  	if (offset !=3D I915_BO_INVALID_OFFSET) {
> -		place->fpfn =3D offset >> PAGE_SHIFT;
> -		place->lpfn =3D place->fpfn + (size >> PAGE_SHIFT);
> +		GEM_BUG_ON(!safe_conversion(&place->fpfn, offset >> PAGE_SHIFT));
> +		GEM_BUG_ON(!safe_conversion(&place->lpfn, place->fpfn + (size >> PAGE_=
SHIFT)));

This would be the natural thing to do with BUG_ON/WARN_ON. And I'd like
it if we could use it like this. But, as I tried to say, GEM_BUG_ON is
nothing like BUG_ON/WARN_ON, and no code is generated for
CONFIG_DRM_I915_DEBUG_GEM=3Dn. And our CI will never catch it because it
always has CONFIG_DRM_I915_DEBUG_GEM=3Dy.

BR,
Jani.


>  	} else if (mr->io_size && mr->io_size < mr->total) {
>  		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>  			place->flags |=3D TTM_PL_FLAG_TOPDOWN;
>  		} else {
>  			place->fpfn =3D 0;
> -			place->lpfn =3D mr->io_size >> PAGE_SHIFT;
> +			GEM_BUG_ON(!safe_conversion(&place->lpfn, mr->io_size >> PAGE_SHIFT));
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i9=
15/intel_region_ttm.c
> index 575d67bc6ffe..c480b0b50bcc 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -209,14 +209,28 @@ intel_region_ttm_resource_alloc(struct intel_memory=
_region *mem,
>  	if (flags & I915_BO_ALLOC_CONTIGUOUS)
>  		place.flags |=3D TTM_PL_FLAG_CONTIGUOUS;
>  	if (offset !=3D I915_BO_INVALID_OFFSET) {
> -		place.fpfn =3D offset >> PAGE_SHIFT;
> -		place.lpfn =3D place.fpfn + (size >> PAGE_SHIFT);
> +		if (!safe_conversion(&place.fpfn, offset >> PAGE_SHIFT)) {
> +			GEM_BUG_ON(!safe_conversion(&place.fpfn,offset >> PAGE_SHIFT));
> +			ret =3D -E2BIG;
> +			goto out;
> +		}
> +		if (!safe_conversion(&place.lpfn, place.fpfn + (size >> PAGE_SHIFT))) {
> +			GEM_BUG_ON(!safe_conversion(&place.lpfn,
> +						    place.fpfn + (size >> PAGE_SHIFT)));
> +			ret =3D -E2BIG;
> +			goto out;
> +		}
>  	} else if (mem->io_size && mem->io_size < mem->total) {
>  		if (flags & I915_BO_ALLOC_GPU_ONLY) {
>  			place.flags |=3D TTM_PL_FLAG_TOPDOWN;
>  		} else {
>  			place.fpfn =3D 0;
> -			place.lpfn =3D mem->io_size >> PAGE_SHIFT;
> +			if (!safe_conversion(&place.lpfn, mem->io_size >> PAGE_SHIFT)) {
> +				GEM_BUG_ON(!safe_conversion(&place.lpfn,
> +							    mem->io_size >> PAGE_SHIFT));
> +				ret =3D -E2BIG;
> +				goto out;
> +			}
>  		}
>  	}
>=20=20
> @@ -224,6 +238,8 @@ intel_region_ttm_resource_alloc(struct intel_memory_r=
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
