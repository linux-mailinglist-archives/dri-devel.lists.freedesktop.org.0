Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F76B3DBA7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA710E39E;
	Mon,  1 Sep 2025 08:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NnktJ6BX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1910E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756713656; x=1788249656;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=g5rUmTuezgYyFz7mD+PkUM2h+ED4WZI0WlduoWGjqu8=;
 b=NnktJ6BXLX56Ag0YPsBZhO1EyVctiS9kRvFfVY8SVrcKmJukwpaJfkeL
 jAKUjBW878IuMUHT8tIql2sI888SS6ijN+/pU691Nh/GPxud0pkRJ73HT
 g/Yzm51Kn+zdVkkqjgikUnFzbiDFuNrJA9zoACCNcV08/OEsCCeEesfay
 4m1NyWZ0P4l8mdIrCWqpAHCTzySKcKwpKAdaKaMQX1qjuSxEUYWF5jU4E
 TqvupDD2anPvPMHJa1oGl9ctIsT0rsz89m0vOsG7i6bk+30kNdZF9kBqj
 PhUiiviAyUtoAyfyTomVC+dKNrNiNlMyd2i7UqunWjqwz8jCY2TDN7vpI Q==;
X-CSE-ConnectionGUID: P4xV72j6Q12ICJXu30zCuQ==
X-CSE-MsgGUID: V4XTtt6/QQmD6zGqLAdOyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="69534605"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="69534605"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 00:41:12 -0700
X-CSE-ConnectionGUID: UDPZUt3gQTqNvVDWlwGHpA==
X-CSE-MsgGUID: IE+Tp6zTSvmIiumJ3y83Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="171714894"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.244.171])
 ([10.245.244.171])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 00:41:10 -0700
Message-ID: <700e88048fd7dc58c3d5a3d91f80595a2f8c3353.camel@linux.intel.com>
Subject: Re: [PATCH] amdgpu/ttm: make sure exported objects are populated
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Christian Koenig
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Mon, 01 Sep 2025 09:40:51 +0200
In-Reply-To: <20250901045618.1853752-1-airlied@gmail.com>
References: <20250901045618.1853752-1-airlied@gmail.com>
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

Hi Dave,

On Mon, 2025-09-01 at 14:56 +1000, Dave Airlie wrote:
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

With a shmem analogy, let's say process A creates a shmem object and
doesn't populate it. It's then shared with process B which faults in
the pages or otherwise causes it to be populated. Will this patch
ensure we behave the same WRT memory usage accounting?

Also some concerns below.

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
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |=C2=A0 5 ++++
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28
> +++++++++++++++++++++
> =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A03 files changed, 34 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index ce27cb5bb05e..d0f578d0ae6c 100644
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
> +	ret =3D ttm_bo_setup_export(&bo->tbo);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> =C2=A0	buf =3D drm_gem_prime_export(gobj, flags);
> =C2=A0	if (!IS_ERR(buf))
> =C2=A0		buf->ops =3D &amdgpu_dmabuf_ops;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index 273757974b9f..bf98e28a8bda 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1284,3 +1284,31 @@ int ttm_bo_populate(struct ttm_buffer_object
> *bo,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(ttm_bo_populate);
> +
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo)
> +{
> +	struct ttm_operation_ctx ctx =3D {
> +		.interruptible =3D false,
> +		.no_wait_gpu =3D true,
> +		/* We opt to avoid OOM on system pages allocations
> */
> +		.gfp_retry_mayfail =3D true,
> +		.allow_res_evict =3D false,
> +	};

I think we'd want to have the caller (driver) provide the
ttm_operation_ctx. The driver may want to subclass or call
interruptible.


> +
> +	int ret;
> +
> +	if (!bo->ttm)
> +		return 0;
> +
> +	if (bo->ttm && ttm_tt_is_populated(bo->ttm))
> +		return 0;
> +

bo->ttm is not safe to reference without the bo lock. Nor is the
ttm_tt_is_populated stable without the bo lock since you may race with
a swapout / shrink.

Thanks,
Thomas


> +	ret =3D ttm_bo_reserve(bo, false, false, NULL);
> +	if (ret !=3D 0)
> +		return ret;
> +
> +	ret =3D ttm_bo_populate(bo, bo->resource->placement &
> TTM_PL_FLAG_MEMCG, &ctx);
> +	ttm_bo_unreserve(bo);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_setup_export);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index c33b3667ae76..5cdd89da9ef5 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -473,6 +473,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object
> *bo);
> =C2=A0int ttm_bo_populate(struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0=C2=A0=C2=A0 bool memcg_account,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx);
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo);
> =C2=A0
> =C2=A0/* Driver LRU walk helpers initially targeted for shrinking. */
> =C2=A0

