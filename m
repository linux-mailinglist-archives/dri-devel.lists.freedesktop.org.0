Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E84962205
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 10:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45E110E4CF;
	Wed, 28 Aug 2024 08:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuSlpAGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78BA10E4CC;
 Wed, 28 Aug 2024 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724832584; x=1756368584;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Gy52WBjZtVud3/gg9Uq2gVUg2ehwE8RinFpcnmW1FoU=;
 b=HuSlpAGBn66oTElTx3HfhhB5Ubj6VDIe88pR869Lc7lT+oINX0dTnHAo
 gklDdHwQ6zqgXWXGwzffmZ7kgA5N8pit+dhpdWzYgXh99DSzk4mkH9VGI
 W8CA29dGMij+zPaSwX3/Y7e/MxTpAi6cgnbzUn4NN0TWsYckiOSifiAdD
 tnLZcWcVMXN8tqIpH03hj5HvYNBtBJ66eos6OQsUhGRpnJFBeyJUi5OG0
 vBQTo04zvWr/9oDR+2dE6KpQfh87I8OSuEaEgcGCU1rUBZOGdsa++gbKE
 eSFfQiGTq1Ql76vjeLfk3Z0Chp80TVz8nSOy2a+1Pd1wGt1JI52eHDl4V w==;
X-CSE-ConnectionGUID: x2Z6Sz0rRBimEdBS5DSxaQ==
X-CSE-MsgGUID: APor3DB4RKW5pdcMOrURrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27144121"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="27144121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:09:44 -0700
X-CSE-ConnectionGUID: XXbKLm53SJ22gn0xrGpygg==
X-CSE-MsgGUID: DReGHVWZS5a/kFb2Jqmn9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="68001405"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.168])
 ([10.245.244.168])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:09:42 -0700
Message-ID: <0ce411f42af6e94514810825f3b4626c5d06fae9.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Only do gpu sys page clear for
 non-pooled BOs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Date: Wed, 28 Aug 2024 10:09:11 +0200
In-Reply-To: <20240821095035.29083-1-nirmoy.das@intel.com>
References: <20240821095035.29083-1-nirmoy.das@intel.com>
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

On Wed, 2024-08-21 at 11:50 +0200, Nirmoy Das wrote:
> Currently XE lacks clean-on-free implementation so using
> TTM_TT_FLAG_CLEARED_ON_FREE is invalid. Remove usage of
> TTM_TT_FLAG_CLEARED_ON_FREE and limit gpu system page clearing
> only for WB cached BOs which are not pooled so there is no need to
> return a zeroed pages to a pool.
>=20
> Without the patch:
> api_overhead_benchmark_l0 --testFilter=3DUsmMemoryAllocation:
> UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D4KB) 79.439 us
> UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D1GB) 98677.75 us
> Perf tool top 5 entries:
> 11.16%=C2=A0 api_overhead_be [kernel.kallsyms] [k] __pageblock_pfn_to_pag=
e
> 7.85%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] cpa_flush
> 7.59%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] find_next_iomem_r=
es
> 7.24%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] pages_are_mergeab=
le
> 5.53%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k]
> lookup_address_in_pgd_attr
>=20
> With the patch:
> UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D4KB) 78.164 us
> UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D1GB) 98880.39 us
> Perf tool top 5 entries:
> 25.40% api_overhead_be=C2=A0 [kernel.kallsyms] [k] clear_page_erms
> 9.89%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] pages_are_mergeab=
le
> 4.64%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] cpa_flush
> 4.04%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] find_next_iomem_r=
es
> 3.96%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms] [k] mod_find
>=20
> This is still better than the base case where there was no
> page clearing offloading.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Nirmoy, is it possible to split this up into a revert and then added
functionality so that we could quickly revert the security issue end
then add a separate patch that is an optimization?

/Thomas

> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 27 +++++++++++++++++++--------
> =C2=A01 file changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6ed0e1955215..a18408d5d185 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
> =C2=A0	struct device *dev;
> =C2=A0	struct sg_table sgt;
> =C2=A0	struct sg_table *sg;
> +	bool clear_system_pages;
> =C2=A0};
> =C2=A0
> =C2=A0static int xe_tt_map_sg(struct ttm_tt *tt)
> @@ -397,12 +398,17 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0	}
> =C2=A0
> =C2=A0	/*
> -	 * If the device can support gpu clear system pages then set
> proper ttm
> +	 * If the device can support gpu clear system pages then set
> proper
> =C2=A0	 * flag. Zeroed pages are only required for
> ttm_bo_type_device so
> =C2=A0	 * unwanted data is not leaked to userspace.
> +	 *
> +	 * XE currently does clear-on-alloc so gpu clear will only
> work on
> +	 * non-pooled BO, DRM_XE_GEM_CPU_CACHING_WB otherwise global
> pool will
> +	 * get poisoned ono-zeroed pages.
> =C2=A0	 */
> -	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe-
> >mem.gpu_page_clear_sys)
> -		page_flags |=3D TTM_TT_FLAG_CLEARED_ON_FREE;
> +	if (ttm_bo->type =3D=3D ttm_bo_type_device && xe-
> >mem.gpu_page_clear_sys &&
> +	=C2=A0=C2=A0=C2=A0 bo->cpu_caching =3D=3D DRM_XE_GEM_CPU_CACHING_WB)
> +		tt->clear_system_pages =3D true;
> =C2=A0
> =C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> extra_pages);
> =C2=A0	if (err) {
> @@ -416,8 +422,11 @@ static struct ttm_tt *xe_ttm_tt_create(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct
> ttm_tt *tt,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> =C2=A0{
> +	struct xe_ttm_tt *xe_tt;
> =C2=A0	int err;
> =C2=A0
> +	xe_tt =3D container_of(tt, struct xe_ttm_tt, ttm);
> +
> =C2=A0	/*
> =C2=A0	 * dma-bufs are not populated with pages, and the dma-
> =C2=A0	 * addresses are set up when moved to XE_PL_TT.
> @@ -426,7 +435,7 @@ static int xe_ttm_tt_populate(struct ttm_device
> *ttm_dev, struct ttm_tt *tt,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
> system pages */
> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> +	if (xe_tt->clear_system_pages)
> =C2=A0		tt->page_flags &=3D ~TTM_TT_FLAG_ZERO_ALLOC;
> =C2=A0
> =C2=A0	err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> @@ -664,6 +673,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	struct ttm_resource *old_mem =3D ttm_bo->resource;
> =C2=A0	u32 old_mem_type =3D old_mem ? old_mem->mem_type :
> XE_PL_SYSTEM;
> =C2=A0	struct ttm_tt *ttm =3D ttm_bo->ttm;
> +	struct xe_ttm_tt *xe_tt =3D container_of(ttm, struct
> xe_ttm_tt, ttm);
> =C2=A0	struct xe_migrate *migrate =3D NULL;
> =C2=A0	struct dma_fence *fence;
> =C2=A0	bool move_lacks_source;
> @@ -671,15 +681,16 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	bool needs_clear;
> =C2=A0	bool handle_system_ccs =3D (!IS_DGFX(xe) &&
> xe_bo_needs_ccs_pages(bo) &&
> =C2=A0				=C2=A0 ttm && ttm_tt_is_populated(ttm)) ?
> true : false;
> -	bool clear_system_pages;
> +	bool clear_system_pages =3D false;
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
> when
> =C2=A0	 * moving to system as the bo doesn't have dma_mapping.
> =C2=A0	 */
> -	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> -		ttm->page_flags &=3D ~TTM_TT_FLAG_CLEARED_ON_FREE;
> +	if (!old_mem && ttm && !ttm_tt_is_populated(ttm) &&
> +	=C2=A0=C2=A0=C2=A0 xe_tt->clear_system_pages)
> +		xe_tt->clear_system_pages =3D false;
> =C2=A0
> =C2=A0	/* Bo creation path, moving to system or TT. */
> =C2=A0	if ((!old_mem && ttm) && !handle_system_ccs) {
> @@ -703,7 +714,7 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	move_lacks_source =3D handle_system_ccs ? (!bo->ccs_cleared)=C2=A0
> :
> =C2=A0						(!mem_type_is_vram(o
> ld_mem_type) && !tt_has_data);
> =C2=A0
> -	clear_system_pages =3D ttm && (ttm->page_flags &
> TTM_TT_FLAG_CLEARED_ON_FREE);
> +	clear_system_pages =3D ttm && xe_tt->clear_system_pages;
> =C2=A0	needs_clear =3D (ttm && ttm->page_flags &
> TTM_TT_FLAG_ZERO_ALLOC) ||
> =C2=A0		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device) ||
> =C2=A0		clear_system_pages;

