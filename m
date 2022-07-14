Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC01574BF0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8A3112809;
	Thu, 14 Jul 2022 11:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876A7112809;
 Thu, 14 Jul 2022 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657798000; x=1689334000;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VtKndIGNUa8ynKlVsG0vSAkkilZp/qX+TWGoTdlMnw0=;
 b=iIJDCAN+bEBRKvrqwNK1r1NRTxH6Fdx3L7c09DImxxYmvX168LlMXsGk
 5ZCxTNzrZNicahEDjF4005OeqH5Z6abkEDEDocqio3XQMt2mAy4G/b2FI
 O4CXPAnPPOeqz32MMcNdySBWlkAYl5oVU6ADa3sQqc7Jw7jFOUPzLrTIp
 bcbJPwO4ByA7Xg5W8VSpDBOO1l5hEweeGOlW9Ecw9icY9jYRwe3MqH81W
 A5erndrQlBreTHgVOK7dmUdHUPh5tO7/aPCj+nj+m2GUpY6GPbOOCOk8N
 Uo0zjIDVIwWXlX3TgyNpIvXbJt4vjOJaICXLAWiHiW+5NY015Z00ts6QR g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="284243546"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="284243546"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 04:26:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="653837435"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.37.128])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 04:26:31 -0700
Date: Thu, 14 Jul 2022 13:26:28 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v3 4/7] drm/i915: Check for integer truncation on the
 configuration of ttm place
Message-ID: <20220714132628.4dda3b64@maurocar-mobl2>
In-Reply-To: <20220714090807.2340818-5-gwan-gyeong.mun@intel.com>
References: <20220714090807.2340818-1-gwan-gyeong.mun@intel.com>
 <20220714090807.2340818-5-gwan-gyeong.mun@intel.com>
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
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jul 2022 12:08:04 +0300
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
> v3: Not to change execution inside a macro. (Mauro)
>     Add safe_conversion_gem_bug_on() macro and remove temporal
>     SAFE_CONVERSION() macro.
>=20
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
>  drivers/gpu/drm/i915/i915_gem.h         |  4 ++++
>  drivers/gpu/drm/i915/intel_region_ttm.c | 20 +++++++++++++++++---
>  3 files changed, 24 insertions(+), 6 deletions(-)
>=20
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
> index 68d8d52bd541..6b673607abee 100644
> --- a/drivers/gpu/drm/i915/i915_gem.h
> +++ b/drivers/gpu/drm/i915/i915_gem.h
> @@ -83,5 +83,9 @@ struct drm_i915_private;
>  #endif
> =20
>  #define I915_GEM_IDLE_TIMEOUT (HZ / 5)
> +#define safe_conversion_gem_bug_on(ptr, value) ({ \
> +	safe_conversion(ptr, value) ? 1 \
> +		: (({ GEM_BUG_ON(overflows_type(value, *ptr)); }), 0); \
> +})
> =20
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
> =20
> @@ -224,6 +236,8 @@ intel_region_ttm_resource_alloc(struct intel_memory_r=
egion *mem,
>  	mock_bo.bdev =3D &mem->i915->bdev;
> =20
>  	ret =3D man->func->alloc(man, &mock_bo, &place, &res);
> +
> +out:
>  	if (ret =3D=3D -ENOSPC)
>  		ret =3D -ENXIO;
>  	if (!ret)
