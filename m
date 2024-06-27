Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6091A0F0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D95610E12B;
	Thu, 27 Jun 2024 07:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWzdpQdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6A410E12B;
 Thu, 27 Jun 2024 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719474954; x=1751010954;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=maFTFil7efysC6EQ3GAREvWBjNl0vaOYJ4yx49Dy+tY=;
 b=GWzdpQdY0+fTfcfSl0yWKUbHzLxLVzIt8uB2vp/2KZZVWmbBftlEmdi3
 gvYWS+5ZYeDeDAj5+mubRciGS43tJ0PUi4TkqJHn6cgQ9otC7vE5b2xY4
 H7BOY3jmmOztu8vYrbHq4uYbCVOXPFquGprPmhU/2fMUshYS7Kx1yHenf
 DQ8VVBhnposzQtkiN2ywTS+lrse9kxfzt5pyL3wjxbzH2A0++MIdqZCa8
 31uO1wahdP5JIolyH5/QHB9iIMA3D9bkm9HMCLyRBFqmirYBbeXASD7ET
 A5MaZeUmooGcR2/OFX/CTRYaJCoUOYvPQIKTUCjUzh0BDb8dHntzW/whe Q==;
X-CSE-ConnectionGUID: 7fM07jKyQcymKDtEpnqmcw==
X-CSE-MsgGUID: 9mPYOhTJRBmKTLq7UajmDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16714983"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16714983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:55:54 -0700
X-CSE-ConnectionGUID: wNIgmHwVS3iCI9e38gxQWw==
X-CSE-MsgGUID: dKSfUaOQS22vFV+p2Hztww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49462800"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.82])
 ([10.245.245.82])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:55:52 -0700
Message-ID: <d5059ec319b09ad76e160870ec9735009d17f1f3.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/lnl: Offload system clear page activity
 to GPU
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Thu, 27 Jun 2024 09:55:49 +0200
In-Reply-To: <20240624141456.23195-2-nirmoy.das@intel.com>
References: <20240624141456.23195-1-nirmoy.das@intel.com>
 <20240624141456.23195-2-nirmoy.das@intel.com>
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

Hi Nirmoy

On Mon, 2024-06-24 at 16:14 +0200, Nirmoy Das wrote:
> On LNL because of flat CCS, driver creates a migrate job to clear
> CCS meta data. Extend that to also clear system pages using GPU.
> Inform TTM to allocate pages without __GFP_ZERO to avoid double page
> clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
> TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
> clearn-on-free as XE now takes care of clearing pages.
>=20
> To test the patch, I created a small test that tries to submit a job
> after binding various sizes of buffer which shows good gains for
> larger
> buffer. For lower buffer sizes, the result is not very reliable as
> the
> results vary a lot.

Some concerns below,

also a big security concern.=20

The CCS clearing occurs when the bo is moved to TT. But there are
situations in which the bo is created and populated in system. For
example if the bo is created using
DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING, and then mmap'd Then it won't get
cleared. Since we don't have a dma_mapping of the bo at that time we
must revert to cpu clear when / that happens.

>=20
> With the patch
> sudo=C2=A0 ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-
> benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
> Using IGT_SRANDOM=3D1719237905 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 9493 us
> Time taken for size SZ_2M: 5503 us
> Time taken for size SZ_64M: 13016 us
> Time taken for size SZ_128M: 29464 us
> Time taken for size SZ_256M: 38408 us
> Time taken for size SZ_1G: 148758 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 3889 us
> Time taken for size SZ_2M: 6091 us
> Time taken for size SZ_64M: 20920 us
> Time taken for size SZ_128M: 32394 us
> Time taken for size SZ_256M: 61710 us
> Time taken for size SZ_1G: 215437 us
> Subtest basic-store-benchmark: SUCCESS (0.589s)
>=20
> With the patch:
> sudo=C2=A0 ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-
> benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
> Using IGT_SRANDOM=3D1719238062 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 11803 us
> Time taken for size SZ_2M: 4237 us
> Time taken for size SZ_64M: 8649 us
> Time taken for size SZ_128M: 14682 us
> Time taken for size SZ_256M: 22156 us
> Time taken for size SZ_1G: 74457 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 5129 us
> Time taken for size SZ_2M: 12563 us
> Time taken for size SZ_64M: 14860 us
> Time taken for size SZ_128M: 26064 us
> Time taken for size SZ_256M: 47167 us
> Time taken for size SZ_1G: 170304 us
> Subtest basic-store-benchmark: SUCCESS (0.417s)
>=20
> With the patch and init_on_alloc=3D0
> sudo=C2=A0 ~/igt-gpu-tools/build/tests/xe_exec_store --run basic-store-
> benchmark
> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
> Using IGT_SRANDOM=3D1719238219 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: basic-store-benchmark
> Starting dynamic subtest: WC
> Dynamic subtest WC: SUCCESS (0.000s)
> Time taken for size SZ_4K: 4803 us
> Time taken for size SZ_2M: 9212 us
> Time taken for size SZ_64M: 9643 us
> Time taken for size SZ_128M: 13479 us
> Time taken for size SZ_256M: 22429 us
> Time taken for size SZ_1G: 83110 us
> Starting dynamic subtest: WB
> Dynamic subtest WB: SUCCESS (0.000s)
> Time taken for size SZ_4K: 4003 us
> Time taken for size SZ_2M: 4443 us
> Time taken for size SZ_64M: 12960 us
> Time taken for size SZ_128M: 13741 us
> Time taken for size SZ_256M: 26841 us
> Time taken for size SZ_1G: 84746 us
> Subtest basic-store-benchmark: SUCCESS (0.290s)
>=20
> v2: Handle regression on dgfx(Himal)
> =C2=A0=C2=A0=C2=A0 Update commit message as no ttm API changes needed.
> v3: Fix Kunit test.
>=20
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 7 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 +++--
> =C2=A04 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 65c696966e96..a9ce4347a7d7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -399,6 +399,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct
> ttm_tt *tt,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> =C2=A0{
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	/*
> @@ -408,6 +409,10 @@ static int xe_ttm_tt_populate(struct ttm_device
> *ttm_dev, struct ttm_tt *tt,
> =C2=A0	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> =C2=A0		return 0;
> =C2=A0
> +	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
> pages */
> +	if (xe->mem.gpu_page_clear)
> +		tt->page_flags &=3D ~TTM_TT_FLAG_ZERO_ALLOC;
> +
> =C2=A0	err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> =C2=A0	if (err)
> =C2=A0		return err;
> @@ -417,9 +422,15 @@ static int xe_ttm_tt_populate(struct ttm_device
> *ttm_dev, struct ttm_tt *tt,
> =C2=A0
> =C2=A0static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct
> ttm_tt *tt)
> =C2=A0{
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
> +
> =C2=A0	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> =C2=A0		return;
> =C2=A0
> +	/* Add TTM_TT_FLAG_CLEARED_ON_FREE when GPU is set to clear
> pages */
> +	if (xe->mem.gpu_page_clear)
> +		tt->page_flags |=3D TTM_TT_FLAG_CLEARED_ON_FREE;
> +
> =C2=A0	xe_tt_unmap_sg(tt);
> =C2=A0
> =C2=A0	return ttm_pool_free(&ttm_dev->pool, tt);
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index ca5e8435485a..c9afff1d0734 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -636,6 +636,13 @@ int xe_device_probe(struct xe_device *xe)
> =C2=A0	if (err)
> =C2=A0		goto err_irq_shutdown;
> =C2=A0
> +	/**
> +	 * On iGFX device with flat CCS, we clear CCS metadata,
> let's extend that
> +	 * and use GPU to clear pages as well.
> +	 */
> +	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
> +		xe->mem.gpu_page_clear =3D true;
> +
> =C2=A0	err =3D xe_vram_probe(xe);
> =C2=A0	if (err)
> =C2=A0		goto err_irq_shutdown;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index c37be471d11c..ece68c6f3668 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -325,6 +325,8 @@ struct xe_device {
> =C2=A0		struct xe_mem_region vram;
> =C2=A0		/** @mem.sys_mgr: system TTM manager */
> =C2=A0		struct ttm_resource_manager sys_mgr;
> +		/** @gpu_page_clear: clear pages offloaded to GPU */
> +		bool gpu_page_clear;
> =C2=A0	} mem;
> =C2=A0
> =C2=A0	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 05f933787860..61bf3d80e896 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1003,6 +1003,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0	struct xe_gt *gt =3D m->tile->primary_gt;
> =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> =C2=A0	bool clear_system_ccs =3D (xe_bo_needs_ccs_pages(bo) &&
> !IS_DGFX(xe)) ? true : false;
> +	bool clear_on_create =3D xe->mem.gpu_page_clear ||
> !clear_system_ccs;

Hm. In what situation is clear_on_create false?=C2=A0

Previously we had clear_system_ccs to clear *only* ccs, but now that
situation has changed to clear_also_ccs?

I think the xe_migrate_clear should not bother whether this is an
initial clearing or a clearing for other reasons, but rather be passed
two flags

"clear_bo_data" and "clear_ccs" or something similar, and also we
should avoid variable names that refer to usage by higher layers of
which the migrate code should have no knowledge.

/Thomas


> =C2=A0	struct dma_fence *fence =3D NULL;
> =C2=A0	u64 size =3D bo->size;
> =C2=A0	struct xe_res_cursor src_it;
> @@ -1032,7 +1033,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		batch_size =3D 2 +
> =C2=A0			pte_update_size(m, clear_vram, src, &src_it,
> =C2=A0					&clear_L0, &clear_L0_ofs,
> &clear_L0_pt,
> -					clear_system_ccs ? 0 :
> emit_clear_cmd_len(gt), 0,
> +					!clear_on_create ? 0 :
> emit_clear_cmd_len(gt), 0,
> =C2=A0					avail_pts);
> =C2=A0
> =C2=A0		if (xe_device_has_flat_ccs(xe))
> @@ -1060,7 +1061,7 @@ struct dma_fence *xe_migrate_clear(struct
> xe_migrate *m,
> =C2=A0		bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> =C2=A0		update_idx =3D bb->len;
> =C2=A0
> -		if (!clear_system_ccs)
> +		if (clear_on_create)
> =C2=A0			emit_clear(gt, bb, clear_L0_ofs, clear_L0,
> XE_PAGE_SIZE, clear_vram);
> =C2=A0
> =C2=A0		if (xe_device_has_flat_ccs(xe)) {

