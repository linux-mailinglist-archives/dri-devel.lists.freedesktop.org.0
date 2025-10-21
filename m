Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE993BF7026
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0393F10E608;
	Tue, 21 Oct 2025 14:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNNCX4Wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9910E60B;
 Tue, 21 Oct 2025 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761056213; x=1792592213;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=QwAfLZ33N8QzFdqZHnbdMXaPFbw3sn4bKWw5ce3CBzA=;
 b=eNNCX4WdPYPiMH4/4/3x/IsNQOG8S6/B1oEnhqnJ79iYLfrffawJnyUC
 YUHPbF6G1ctlKHFpKWmmNFvzUg9V/yyRyGDR2fsSsVEO2MwvmmGKrfQ7+
 AwfAIahm4LVzdX10WodTd4xO7UjB13cWonor3o8AA3saaoufCXm0AbpPh
 2xaCZ6ZAxfFSCr6IKfll0HdAG67slWBtKr6Ju+WwqQb7ZicDdBIkYVSpq
 2wtFlhi56DOwVYkgzH5pXK81VT8/YgY2lu7s1hWE44T6CrXuhZnh48Gti
 Y/nkbgOUAJkSR6HqZEpSzxgAiDZTC/W+6hT4hvwhDpNME9UJi3rqug4T0 g==;
X-CSE-ConnectionGUID: nfqqtQ5cTES97ZXYQucWFQ==
X-CSE-MsgGUID: jRl1KgsdQtue4iUqj3vP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63330833"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63330833"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:16:53 -0700
X-CSE-ConnectionGUID: QyTINulBSxWnAfkPKtGVUg==
X-CSE-MsgGUID: RWA20XU9RmOZNmVk6yBNEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="184378014"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.135])
 ([10.245.245.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:16:49 -0700
Message-ID: <b7b692e11e563355d9e16ce1a5e93ac166f1013d.camel@linux.intel.com>
Subject: Re: [PATCH v5 3/6] drm/ttm: Replace multiple booleans with flags in
 device init
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, Dave Airlie	 <airlied@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Lyude Paul <lyude@redhat.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Sui Jingfeng	
 <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>, Zack
 Rusin	 <zack.rusin@broadcom.com>
Date: Tue, 21 Oct 2025 16:16:47 +0200
In-Reply-To: <20251020115411.36818-4-tvrtko.ursulin@igalia.com>
References: <20251020115411.36818-1-tvrtko.ursulin@igalia.com>
 <20251020115411.36818-4-tvrtko.ursulin@igalia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Mon, 2025-10-20 at 12:54 +0100, Tvrtko Ursulin wrote:
> Multiple consecutive boolean function arguments are usually not very
> readable.
>=20
> Replace the ones in ttm_device_init() with flags with the additional
> benefit of soon being able to pass in more data with just a one off
> code base churning cost.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> # For th=
e
xe changes.

> ---
> v2:
> =C2=A0* Rebase for rename and move of flags to alloc_flags /
> TTM_ALLOCATION_.
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 +++--
> =C2=A0drivers/gpu/drm/drm_gem_vram_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/i915/intel_region_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/loongson/lsdc_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++--
> =C2=A0drivers/gpu/drm/qxl/qxl_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/radeon/radeon_ttm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++--
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_bo_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 +++++++-------
> =C2=A0.../gpu/drm/ttm/tests/ttm_bo_validate_test.c=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_device_test.c=C2=A0=C2=A0 | 12 +++++-=
----
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++++++--------=
-
> --
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |=C2=A0 7 ++----
> =C2=A0drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++-----
> =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0include/drm/ttm/ttm_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +=
+-
> =C2=A016 files changed, 50 insertions(+), 54 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 8f6d331e1ea2..7b144ddea268 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1930,8 +1930,10 @@ int amdgpu_ttm_init(struct amdgpu_device
> *adev)
> =C2=A0	r =3D ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver,
> adev->dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev_to_drm(adev)->anon_ino=
de-
> >i_mapping,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev_to_drm(adev)-
> >vma_offset_manager,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev->need_swiotlb,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addressing_limited(adev->dev=
));
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (adev->need_swiotlb ?
> +				TTM_ALLOCATION_POOL_USE_DMA_ALLOC :
> 0) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dma_addressing_limited(adev->de=
v) ?
> +				TTM_ALLOCATION_POOL_USE_DMA32 : 0));
> =C2=A0	if (r) {
> =C2=A0		dev_err(adev->dev,
> =C2=A0			"failed initializing buffer object
> driver(%d).\n", r);
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
> b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 0bec6f66682b..dd3292e57d64 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -859,7 +859,7 @@ static int drm_vram_mm_init(struct drm_vram_mm
> *vmm, struct drm_device *dev,
> =C2=A0	ret =3D ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
> =C2=A0				 dev->anon_inode->i_mapping,
> =C2=A0				 dev->vma_offset_manager,
> -				 false, true);
> +				 TTM_ALLOCATION_POOL_USE_DMA32);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
> b/drivers/gpu/drm/i915/intel_region_ttm.c
> index 04525d92bec5..47a69aad5c3f 100644
> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> @@ -34,7 +34,7 @@ int intel_region_ttm_device_init(struct
> drm_i915_private *dev_priv)
> =C2=A0
> =C2=A0	return ttm_device_init(&dev_priv->bdev, i915_ttm_driver(),
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm->dev, drm->anon_inode->=
i_mapping,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm->vma_offset_manager, false,
> false);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm->vma_offset_manager, 0);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c
> b/drivers/gpu/drm/loongson/lsdc_ttm.c
> index 2e42c6970c9f..dca0d33e2cf2 100644
> --- a/drivers/gpu/drm/loongson/lsdc_ttm.c
> +++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
> @@ -544,7 +544,8 @@ int lsdc_ttm_init(struct lsdc_device *ldev)
> =C2=A0
> =C2=A0	ret =3D ttm_device_init(&ldev->bdev, &lsdc_bo_driver, ddev-
> >dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ddev->anon_inode->i_mapping,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ddev->vma_offset_manager, false,
> true);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ddev->vma_offset_manager,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_ALLOCATION_POOL_USE_DMA32);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 7d2436e5d50d..47b20cf80388 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -302,8 +302,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
> =C2=A0	ret =3D ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
> drm->dev->dev,
> =C2=A0				=C2=A0 dev->anon_inode->i_mapping,
> =C2=A0				=C2=A0 dev->vma_offset_manager,
> -				=C2=A0 drm_need_swiotlb(drm-
> >client.mmu.dmabits),
> -				=C2=A0 drm->client.mmu.dmabits <=3D 32);
> +				=C2=A0 (drm_need_swiotlb(drm-
> >client.mmu.dmabits) ?
> +				=C2=A0=C2=A0 TTM_ALLOCATION_POOL_USE_DMA_ALLOC
> : 0 ) |
> +				=C2=A0 (drm->client.mmu.dmabits <=3D 32 ?
> +				=C2=A0=C2=A0 TTM_ALLOCATION_POOL_USE_DMA32 :
> 0));
> =C2=A0	if (ret) {
> =C2=A0		NV_ERROR(drm, "error initialising bo driver, %d\n",
> ret);
> =C2=A0		return ret;
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c
> b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 765a144cea14..85d9df48affa 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -196,7 +196,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
> =C2=A0	r =3D ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
> =C2=A0			=C2=A0=C2=A0=C2=A0 qdev->ddev.anon_inode->i_mapping,
> =C2=A0			=C2=A0=C2=A0=C2=A0 qdev->ddev.vma_offset_manager,
> -			=C2=A0=C2=A0=C2=A0 false, false);
> +			=C2=A0=C2=A0=C2=A0 0);
> =C2=A0	if (r) {
> =C2=A0		DRM_ERROR("failed initializing buffer object
> driver(%d).\n", r);
> =C2=A0		return r;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 616d25c8c2de..51dffe23c0fc 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -683,8 +683,10 @@ int radeon_ttm_init(struct radeon_device *rdev)
> =C2=A0	r =3D ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver,
> rdev->dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rdev_to_drm(rdev)->anon_ino=
de-
> >i_mapping,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rdev_to_drm(rdev)-
> >vma_offset_manager,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rdev->need_swiotlb,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addressing_limited(&rdev->pd=
ev-
> >dev));
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (rdev->need_swiotlb ?
> +				TTM_ALLOCATION_POOL_USE_DMA_ALLOC :
> 0 ) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dma_addressing_limited(&rdev->p=
dev-
> >dev) ?
> +				TTM_ALLOCATION_POOL_USE_DMA32 : 0));
> =C2=A0	if (r) {
> =C2=A0		DRM_ERROR("failed initializing buffer object
> driver(%d).\n", r);
> =C2=A0		return r;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 5426b435f702..d468f8322072 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -251,7 +251,7 @@ static void ttm_bo_unreserve_basic(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -290,7 +290,7 @@ static void ttm_bo_unreserve_pinned(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -342,7 +342,7 @@ static void ttm_bo_unreserve_bulk(struct kunit
> *test)
> =C2=A0	resv =3D kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, resv);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -394,7 +394,7 @@ static void ttm_bo_fini_basic(struct kunit *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -437,7 +437,7 @@ static void ttm_bo_fini_shared_resv(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -477,7 +477,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -512,7 +512,7 @@ static void ttm_bo_pin_unpin_resource(struct
> kunit *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> @@ -563,7 +563,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct
> kunit *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3a1eef83190c..17a570af296c 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -995,7 +995,7 @@ static void
> ttm_bo_validate_busy_domain_evict(struct kunit *test)
> =C2=A0	 */
> =C2=A0	ttm_device_fini(priv->ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init_bad_evict(test->priv, priv-
> >ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init_bad_evict(test->priv, priv-
> >ttm_dev);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> =C2=A0	ttm_mock_manager_init(priv->ttm_dev, mem_type,
> MANAGER_SIZE);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> index 98648d5f20e7..2d55ad34fe48 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
> @@ -25,7 +25,7 @@ static void ttm_device_init_basic(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> =C2=A0	KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
> @@ -55,7 +55,7 @@ static void ttm_device_init_multiple(struct kunit
> *test)
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
> =C2=A0
> =C2=A0	for (i =3D 0; i < num_dev; i++) {
> -		err =3D ttm_device_kunit_init(priv, &ttm_devs[i],
> false, false);
> +		err =3D ttm_device_kunit_init(priv, &ttm_devs[i], 0);
> =C2=A0		KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> =C2=A0		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
> @@ -81,7 +81,7 @@ static void ttm_device_fini_basic(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> =C2=A0	man =3D ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
> @@ -109,7 +109,7 @@ static void ttm_device_init_no_vma_man(struct
> kunit *test)
> =C2=A0	vma_man =3D drm->vma_offset_manager;
> =C2=A0	drm->vma_offset_manager =3D NULL;
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, 0);
> =C2=A0	KUNIT_EXPECT_EQ(test, err, -EINVAL);
> =C2=A0
> =C2=A0	/* Bring the manager back for a graceful cleanup */
> @@ -158,9 +158,7 @@ static void ttm_device_init_pools(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(priv, ttm_dev,
> -				=C2=A0=C2=A0=C2=A0 params->alloc_flags &
> TTM_ALLOCATION_POOL_USE_DMA_ALLOC,
> -				=C2=A0=C2=A0=C2=A0 params->alloc_flags &
> TTM_ALLOCATION_POOL_USE_DMA32);
> +	err =3D ttm_device_kunit_init(priv, ttm_dev, params-
> >alloc_flags);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> =C2=A0	pool =3D &ttm_dev->pool;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 7aaf0d1395ff..7b533e4e1e04 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -117,8 +117,7 @@ static void bad_evict_flags(struct
> ttm_buffer_object *bo,
> =C2=A0
> =C2=A0static int ttm_device_kunit_init_with_funcs(struct ttm_test_devices
> *priv,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_device *ttm,
> -					=C2=A0=C2=A0=C2=A0 bool use_dma_alloc,
> -					=C2=A0=C2=A0=C2=A0 bool use_dma32,
> +					=C2=A0=C2=A0=C2=A0 unsigned int
> alloc_flags,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_device_funcs
> *funcs)
> =C2=A0{
> =C2=A0	struct drm_device *drm =3D priv->drm;
> @@ -127,7 +126,7 @@ static int
> ttm_device_kunit_init_with_funcs(struct ttm_test_devices *priv,
> =C2=A0	err =3D ttm_device_init(ttm, funcs, drm->dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm->anon_inode->i_mapping,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm->vma_offset_manager,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 use_dma_alloc, use_dma32);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 alloc_flags);
> =C2=A0
> =C2=A0	return err;
> =C2=A0}
> @@ -143,11 +142,10 @@ EXPORT_SYMBOL_GPL(ttm_dev_funcs);
> =C2=A0
> =C2=A0int ttm_device_kunit_init(struct ttm_test_devices *priv,
> =C2=A0			=C2=A0 struct ttm_device *ttm,
> -			=C2=A0 bool use_dma_alloc,
> -			=C2=A0 bool use_dma32)
> +			=C2=A0 unsigned int alloc_flags)
> =C2=A0{
> -	return ttm_device_kunit_init_with_funcs(priv, ttm,
> use_dma_alloc,
> -						use_dma32,
> &ttm_dev_funcs);
> +	return ttm_device_kunit_init_with_funcs(priv, ttm,
> alloc_flags,
> +						&ttm_dev_funcs);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
> =C2=A0
> @@ -161,12 +159,10 @@ struct ttm_device_funcs ttm_dev_funcs_bad_evict
> =3D {
> =C2=A0EXPORT_SYMBOL_GPL(ttm_dev_funcs_bad_evict);
> =C2=A0
> =C2=A0int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
> -				=C2=A0=C2=A0=C2=A0 struct ttm_device *ttm,
> -				=C2=A0=C2=A0=C2=A0 bool use_dma_alloc,
> -				=C2=A0=C2=A0=C2=A0 bool use_dma32)
> +				=C2=A0=C2=A0=C2=A0 struct ttm_device *ttm)
> =C2=A0{
> -	return ttm_device_kunit_init_with_funcs(priv, ttm,
> use_dma_alloc,
> -						use_dma32,
> &ttm_dev_funcs_bad_evict);
> +	return ttm_device_kunit_init_with_funcs(priv, ttm, 0,
> +						&ttm_dev_funcs_bad_e
> vict);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ttm_device_kunit_init_bad_evict);
> =C2=A0
> @@ -252,7 +248,7 @@ struct ttm_test_devices
> *ttm_test_devices_all(struct kunit *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> -	err =3D ttm_device_kunit_init(devs, ttm_dev, false, false);
> +	err =3D ttm_device_kunit_init(devs, ttm_dev, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> =C2=A0	devs->ttm_dev =3D ttm_dev;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index c7da23232ffa..f8402b979d05 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -28,12 +28,9 @@ struct ttm_test_devices {
> =C2=A0/* Building blocks for test-specific init functions */
> =C2=A0int ttm_device_kunit_init(struct ttm_test_devices *priv,
> =C2=A0			=C2=A0 struct ttm_device *ttm,
> -			=C2=A0 bool use_dma_alloc,
> -			=C2=A0 bool use_dma32);
> +			=C2=A0 unsigned int alloc_flags);
> =C2=A0int ttm_device_kunit_init_bad_evict(struct ttm_test_devices *priv,
> -				=C2=A0=C2=A0=C2=A0 struct ttm_device *ttm,
> -				=C2=A0=C2=A0=C2=A0 bool use_dma_alloc,
> -				=C2=A0=C2=A0=C2=A0 bool use_dma32);
> +				=C2=A0=C2=A0=C2=A0 struct ttm_device *ttm);
> =C2=A0struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_test_devices
> *devs,
> =C2=A0					=C2=A0=C2=A0=C2=A0 size_t size,
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> b/drivers/gpu/drm/ttm/ttm_device.c
> index a97b1444536c..87c85ccb21ac 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -199,8 +199,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
> =C2=A0 * @dev: The core kernel device pointer for DMA mappings and
> allocations.
> =C2=A0 * @mapping: The address space to use for this bo.
> =C2=A0 * @vma_manager: A pointer to a vma manager.
> - * @use_dma_alloc: If coherent DMA allocation API should be used.
> - * @use_dma32: If we should use GFP_DMA32 for device memory
> allocations.
> + * @alloc_flags: TTM_ALLOCATION_ flags.
> =C2=A0 *
> =C2=A0 * Initializes a struct ttm_device:
> =C2=A0 * Returns:
> @@ -209,7 +208,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
> =C2=A0int ttm_device_init(struct ttm_device *bdev, const struct
> ttm_device_funcs *funcs,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct device *dev, struct address_space
> *mapping,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct drm_vma_offset_manager *vma_manager,
> -		=C2=A0=C2=A0=C2=A0 bool use_dma_alloc, bool use_dma32)
> +		=C2=A0=C2=A0=C2=A0 unsigned int alloc_flags)
> =C2=A0{
> =C2=A0	struct ttm_global *glob =3D &ttm_glob;
> =C2=A0	int ret, nid;
> @@ -237,9 +236,7 @@ int ttm_device_init(struct ttm_device *bdev,
> const struct ttm_device_funcs *func
> =C2=A0	else
> =C2=A0		nid =3D NUMA_NO_NODE;
> =C2=A0
> -	ttm_pool_init(&bdev->pool, dev, nid,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (use_dma_alloc ?
> TTM_ALLOCATION_POOL_USE_DMA_ALLOC : 0) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (use_dma32 ? TTM_ALLOCATION_POOL_USE_DM=
A32 :
> 0));
> +	ttm_pool_init(&bdev->pool, dev, nid, alloc_flags);
> =C2=A0
> =C2=A0	bdev->vma_manager =3D vma_manager;
> =C2=A0	spin_lock_init(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 8ff958d119be..599052d07ae8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1023,8 +1023,8 @@ static int vmw_driver_load(struct vmw_private
> *dev_priv, u32 pci_id)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_priv->drm.dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_priv->drm.anon_inode->i_mappi=
ng,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_priv->drm.vma_offset_manager,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_priv->map_mode =3D=3D
> vmw_dma_alloc_coherent,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dev_priv->map_mode =3D=3D
> vmw_dma_alloc_coherent) ?
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TTM_ALLOCATION_POOL_USE_DMA_ALLOC :
> 0);
> =C2=A0	if (unlikely(ret !=3D 0)) {
> =C2=A0		drm_err(&dev_priv->drm,
> =C2=A0			"Failed initializing TTM buffer object
> driver.\n");
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 5f6a412b571c..58e7996160a0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -437,7 +437,7 @@ struct xe_device *xe_device_create(struct pci_dev
> *pdev,
> =C2=A0
> =C2=A0	err =3D ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe->drm.anon_inode->i_mapping,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe->drm.vma_offset_manager, false,
> false);
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe->drm.vma_offset_manager, 0);
> =C2=A0	if (WARN_ON(err))
> =C2=A0		goto err;
> =C2=A0
> diff --git a/include/drm/ttm/ttm_device.h
> b/include/drm/ttm/ttm_device.h
> index 592b5f802859..074b98572275 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -27,6 +27,7 @@
> =C2=A0
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/workqueue.h>
> +#include <drm/ttm/ttm_allocation.h>
> =C2=A0#include <drm/ttm/ttm_resource.h>
> =C2=A0#include <drm/ttm/ttm_pool.h>
> =C2=A0
> @@ -292,7 +293,7 @@ static inline void ttm_set_driver_manager(struct
> ttm_device *bdev, int type,
> =C2=A0int ttm_device_init(struct ttm_device *bdev, const struct
> ttm_device_funcs *funcs,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct device *dev, struct address_space
> *mapping,
> =C2=A0		=C2=A0=C2=A0=C2=A0 struct drm_vma_offset_manager *vma_manager,
> -		=C2=A0=C2=A0=C2=A0 bool use_dma_alloc, bool use_dma32);
> +		=C2=A0=C2=A0=C2=A0 unsigned int alloc_flags);
> =C2=A0void ttm_device_fini(struct ttm_device *bdev);
> =C2=A0void ttm_device_clear_dma_mappings(struct ttm_device *bdev);
> =C2=A0

