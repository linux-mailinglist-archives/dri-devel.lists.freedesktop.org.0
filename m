Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A5B3F68B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157A410E1A0;
	Tue,  2 Sep 2025 07:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrncplV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A25610E1A0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756797791; x=1788333791;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7bPUgfH8kSawl0Tzr34y8rokN3j9Q/VzbQ2gWjwieV0=;
 b=JrncplV+s18uGeYHk3KrwcAdv/3U8sqru9tSHQweLFgd3u5F29JprOTi
 JChr+7csYScrdJUMEwaMn0F3MGmzoveJ1Goj3UvXBNB3GWXtZ/LdGq4ma
 kU81w3sM0s0f2NFmd9KG/KGfOSsfcUguqHXoHKmavVUwZpdTpsCiTxLkj
 uvcXEVhoQsSVr0p8C/7NqUhJ5mhPC8zjiNKzp7blHAlSX3jPkEqSZBSg7
 UPjSL0fOGutVO7JoyqqsqWxBX8Vt+pbzXuzEW0ia7kAufIH2304rpawUP
 znnwcBfi2XPTiyFHG4pvlyI3yqVhGk8kLmP1mCjbJDAO5Tvj2491OztLc Q==;
X-CSE-ConnectionGUID: HZMw1L+ZThyaBbpx4mujCQ==
X-CSE-MsgGUID: sfRjIFtGRnOarqGUdrqk2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59125265"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59125265"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:23:10 -0700
X-CSE-ConnectionGUID: UxxxT8mnTCGiqc0Fyz2U1Q==
X-CSE-MsgGUID: 5+w39c7LT9WhD350Qlek7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="170756985"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.33])
 ([10.245.245.33])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:23:08 -0700
Message-ID: <a3034a2d30616a4e3c53db23b0e98fe2fe9b458a.camel@linux.intel.com>
Subject: Re: [PATCH] amdgpu/ttm: make sure exported objects are populated (v2)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Christian Koenig
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Tue, 02 Sep 2025 09:23:01 +0200
In-Reply-To: <20250902041407.2040538-1-airlied@gmail.com>
References: <20250902041407.2040538-1-airlied@gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi, Dave,

On Tue, 2025-09-02 at 14:14 +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
>=20
> While discussing cgroups we noticed a problem where you could export
> a BO to a dma-buf without having it ever being backed or accounted
> for.
>=20
> This meant in low memory situations or eventually with cgroups, a
> lower privledged process might cause the compositor to try and
> allocate
> a lot of memory on it's behalf and this could fail. At least make
> sure the exporter has managed to allocate the RAM at least once
> before exporting the object.
>=20
> This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.
>=20
> TODO:
> other drivers?
> split this into two?
>=20
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
>=20
> ---
> v2: let the user choose interruptible (do we need the whole op ctx?)
> stop checking things outside the reservation, just populate always.
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |=C2=A0 5 +++++
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 23
> +++++++++++++++++++++
> =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
> =C2=A03 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index ce27cb5bb05e..c83289ea3e8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -343,11 +343,16 @@ struct dma_buf *amdgpu_gem_prime_export(struct
> drm_gem_object *gobj,
> =C2=A0{
> =C2=A0	struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> =C2=A0	struct dma_buf *buf;
> +	int ret;
> =C2=A0
> =C2=A0	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> =C2=A0		return ERR_PTR(-EPERM);
> =C2=A0
> +	ret =3D ttm_bo_setup_export(&bo->tbo, true);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> =C2=A0	buf =3D drm_gem_prime_export(gobj, flags);
> =C2=A0	if (!IS_ERR(buf))
> =C2=A0		buf->ops =3D &amdgpu_dmabuf_ops;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index 273757974b9f..3afb577cf327 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1284,3 +1284,26 @@ int ttm_bo_populate(struct ttm_buffer_object
> *bo,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(ttm_bo_populate);
> +
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo, bool
> interruptible)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D interruptible,
> +		.no_wait_gpu =3D true,
> +		/* We opt to avoid OOM on system pages allocations
> */
> +		.gfp_retry_mayfail =3D true,
> +		.allow_res_evict =3D false,
> +	};

I still think the ttm_operation_ctx needs to originate from the driver.
It's really the driver's way of telling TTM how backing store
allocation should be done.=20

Otherwise patch LGTM.

Thanks,
Thomas



> +
> +	int ret;
> +
> +	ret =3D ttm_bo_reserve(bo, false, false, NULL);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	ret =3D ttm_bo_populate(bo, bo->resource->placement &
> TTM_PL_FLAG_MEMCG, &ctx);
> + out:
> +	ttm_bo_unreserve(bo);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_setup_export);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index c33b3667ae76..91913cad879f 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -473,6 +473,8 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object
> *bo);
> =C2=A0int ttm_bo_populate(struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0 bool memcg_account,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo,
> +			bool interruptible);
> =C2=A0
> =C2=A0/* Driver LRU walk helpers initially targeted for shrinking. */
> =C2=A0

