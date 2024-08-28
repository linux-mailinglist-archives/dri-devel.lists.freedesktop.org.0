Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC8962314
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF95210E10C;
	Wed, 28 Aug 2024 09:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DOdQF6DO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D110E105;
 Wed, 28 Aug 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724836283; x=1756372283;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IFSs4luRsD8PMeS99gRKxbA6KPVmiICQt0ggLvMq7qk=;
 b=DOdQF6DOOfPxysBIGsqkuBT09Qvr/Iefgt8OldzwtVNkGeovnqLe5Xva
 qubToU0QQupxrQY4JSvp8GWRY6Zr09PE9ry8rtnkTNJt5i+2AsQci+fvh
 7Bg1N6dg+3L0c635RIl07ZnYzSNHP9uogAgBqd1lXqeIqI0wJs6BB391a
 G9X6WyGpHrH+TRpN8133FizH3KdK7q+KGwECFa2It135qoPVjiLZ4GuE7
 tMGGtMyU5ry8d13Wh7MO4mmDWxd152/Dc97ykllHU4nV5N7UhciUGRsv+
 VZVDwIPVFIyv0mVxYsEQEr8gjxVM2y/EXPJSLTAe8A+vzK7ZvOnwNJhOF g==;
X-CSE-ConnectionGUID: +C7Fog6HTWuQLK01R9b05A==
X-CSE-MsgGUID: HEFoAPLkTAay8ZXc/nTfvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22936616"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="22936616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:11:23 -0700
X-CSE-ConnectionGUID: HZBHTfTlRtGk2RBMdVq+Aw==
X-CSE-MsgGUID: 4tHIOk0rT/WAGiq+N7IOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68015929"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.168])
 ([10.245.244.168])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 02:11:22 -0700
Message-ID: <ddb6aea9022b21b92e35deb8647697d4ea05159c.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] Revert "drm/xe/lnl: Offload system clear page
 activity to GPU"
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>,  Matthew Auld <matthew.auld@intel.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Wed, 28 Aug 2024 11:11:18 +0200
In-Reply-To: <20240828083635.23601-1-nirmoy.das@intel.com>
References: <20240828083635.23601-1-nirmoy.das@intel.com>
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

Hi,

On Wed, 2024-08-28 at 10:36 +0200, Nirmoy Das wrote:
> This optimization relied on having to clear CCS on allocations.
> If there is no need to clear CCS on allocations then this would
> mostly
> help in reducing CPU utilization.
>=20
> Revert this patch at this moment because of:
> 1 Currently Xe can't do clear on free and using a invalid ttm flag,
> TTM_TT_FLAG_CLEARED_ON_FREE which could poison global ttm pool on
> multi-device setup.
>=20
> 2 Also for LNL CPU:WB doesn't require clearing CCS as such BO will
> not be allowed to bind with compression PTE. Subsequent patch will
> disable clearing CCS for CPU:WB BOs for LNL.
>=20
> This reverts commit 23683061805be368c8d1c7e7ff52abc470cac275.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

You'd need an Signed-off-by:

With that,=20
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 26 ++------------------------
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 2 --
> =C2=A0drivers/gpu/drm/xe/xe_ttm_sys_mgr.c=C2=A0 | 12 ------------
> =C2=A03 files changed, 2 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9d6632f92fa9..25d0c939ba31 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -396,14 +396,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0		caching =3D ttm_uncached;
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * If the device can support gpu clear system pages then set
> proper ttm
> -	 * flag. Zeroed pages are only required for
> ttm_bo_type_device so
> -	 * unwanted data is not leaked to userspace.
> -	 */
> -	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe-
> >mem.gpu_page_clear_sys)
> -		page_flags |=3D TTM_TT_FLAG_CLEARED_ON_FREE;
> -
> =C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> extra_pages);
> =C2=A0	if (err) {
> =C2=A0		kfree(tt);
> @@ -425,10 +417,6 @@ static int xe_ttm_tt_populate(struct ttm_device
> *ttm_dev, struct ttm_tt *tt,
> =C2=A0	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> =C2=A0		return 0;
> =C2=A0
> -	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
> system pages */
> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> -		tt->page_flags &=3D ~TTM_TT_FLAG_ZERO_ALLOC;
> -
> =C2=A0	err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> =C2=A0	if (err)
> =C2=A0		return err;
> @@ -671,16 +659,8 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	bool needs_clear;
> =C2=A0	bool handle_system_ccs =3D (!IS_DGFX(xe) &&
> xe_bo_needs_ccs_pages(bo) &&
> =C2=A0				=C2=A0 ttm && ttm_tt_is_populated(ttm)) ?
> true : false;
> -	bool clear_system_pages;
> =C2=A0	int ret =3D 0;
> =C2=A0
> -	/*
> -	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
> when
> -	 * moving to system as the bo doesn't have dma_mapping.
> -	 */
> -	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> -		ttm->page_flags &=3D ~TTM_TT_FLAG_CLEARED_ON_FREE;
> -
> =C2=A0	/* Bo creation path, moving to system or TT. */
> =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> =C2=A0		if (new_mem->mem_type =3D=3D XE_PL_TT)
> @@ -703,10 +683,8 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	move_lacks_source =3D handle_system_ccs ? (!bo->ccs_cleared)=C2=A0
> :
> =C2=A0						(!mem_type_is_vram(o
> ld_mem_type) && !tt_has_data);
> =C2=A0
> -	clear_system_pages =3D ttm && (ttm->page_flags &
> TTM_TT_FLAG_CLEARED_ON_FREE);
> =C2=A0	needs_clear =3D (ttm && ttm->page_flags &
> TTM_TT_FLAG_ZERO_ALLOC) ||
> -		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device) ||
> -		clear_system_pages;
> +		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);
> =C2=A0
> =C2=A0	if (new_mem->mem_type =3D=3D XE_PL_TT) {
> =C2=A0		ret =3D xe_tt_map_sg(ttm);
> @@ -818,7 +796,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		if (move_lacks_source) {
> =C2=A0			u32 flags =3D 0;
> =C2=A0
> -			if (mem_type_is_vram(new_mem->mem_type) ||
> clear_system_pages)
> +			if (mem_type_is_vram(new_mem->mem_type))
> =C2=A0				flags |=3D XE_MIGRATE_CLEAR_FLAG_FULL;
> =C2=A0			else if (handle_system_ccs)
> =C2=A0				flags |=3D
> XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 4ecd620921a3..e73fb0c23932 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -333,8 +333,6 @@ struct xe_device {
> =C2=A0		struct xe_mem_region vram;
> =C2=A0		/** @mem.sys_mgr: system TTM manager */
> =C2=A0		struct ttm_resource_manager sys_mgr;
> -		/** @mem.gpu_page_clear_sys: clear system pages
> offloaded to GPU */
> -		bool gpu_page_clear_sys;
> =C2=A0	} mem;
> =C2=A0
> =C2=A0	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index e0ac20f20758..9844a8edbfe1 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -117,17 +117,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
> =C2=A0	ttm_resource_manager_init(man, &xe->ttm, gtt_size >>
> PAGE_SHIFT);
> =C2=A0	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
> =C2=A0	ttm_resource_manager_set_used(man, true);
> -
> -	/*
> -	 * On iGFX device with flat CCS, we clear CCS metadata,
> let's extend that
> -	 * and use GPU to clear pages as well.
> -	 *
> -	 * Disable this when init_on_free and/or init_on_alloc is on
> to avoid double
> -	 * zeroing pages with CPU and GPU.
> -	 */
> -	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe) &&
> -	=C2=A0=C2=A0=C2=A0 !want_init_on_alloc(GFP_USER) && !want_init_on_free(=
))
> -		xe->mem.gpu_page_clear_sys =3D true;
> -
> =C2=A0	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini,
> xe);
> =C2=A0}

