Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48FA2C5DF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC1B10EB29;
	Fri,  7 Feb 2025 14:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0f1x8xn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1FD10EB28;
 Fri,  7 Feb 2025 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738939557; x=1770475557;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uRNpFUCTH2jC62GE/KroqcPqS0+AvdXhYoax0A6qehg=;
 b=K0f1x8xn+TnQmnGtXFOHma/1E/9fy5lFze7sp2H3E3uOGc/GqqdiiaVk
 l/DLpn0GhGt0hNv7xpQlG3NjKbzIb156g+8OAc/G72Z6v9occKg0/wRqG
 sry2ZcCBOppTww0FsvNm3VPwoyOvqT8BlYtp3AaqJmECcxl7wmjtU3aQx
 Bjtqn0wCeCs1/lv5Mv8SYC/2WoFsc2+bW7cHfDlX2iQZIIglgiE1UCukA
 RYZWkgncLTxeBksQYCOdmrdmsdOPM0M3GPiYRm1VwOMY+FFrMbb1dF8u+
 xuY3Rrl5pmvF76Azs6Qq9qzt1JIhV1RbKIpfvmdawkSKHi/JCTEfVpSLC w==;
X-CSE-ConnectionGUID: efUnhetyT3u2k78/C/dH5w==
X-CSE-MsgGUID: eXGn1twPQBKtLk+lbPzIYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50201641"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="50201641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:45:57 -0800
X-CSE-ConnectionGUID: mmAsFUINS8+NCbKprzWb6g==
X-CSE-MsgGUID: ZrcKFDYITxOcAubTn2xC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112053060"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:45:54 -0800
Message-ID: <ec4bcb3b178a3de6e605216e588e2eba9cc3217a.camel@linux.intel.com>
Subject: Re: [PATCH v4 29/33] drm/xe: Basic SVM BO eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 15:45:51 +0100
In-Reply-To: <20250129195212.745731-30-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-30-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:52 -0800, Matthew Brost wrote:
> Wire xe_bo_move to GPU SVM migration via new helper xe_svm_bo_evict.
>=20
> v2:
> =C2=A0- Use xe_svm_bo_evict
> =C2=A0- Drop bo->range
> v3:
> =C2=A0- Kernel doc (Thomas)
> v4:
> =C2=A0- Add missing xe_bo.c code
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I think in the long run, we'd want to do the svm eviction / unbind in
move_notify(), since that's where we're supposed to unbind other
subsystems. And then just purge the bo using a NULL placement, but
since this is equivalent let's postpone that to a more general
xe_bo_move() cleanup. It's getting pretty hard to follow.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0 | 19 +++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 15 ++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 3 +++
> =C2=A03 files changed, 36 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 20c96709e267..657687ee70d0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -255,6 +255,8 @@ int xe_bo_placement_for_flags(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0static void xe_evict_flags(struct ttm_buffer_object *tbo,
> =C2=A0			=C2=A0=C2=A0 struct ttm_placement *placement)
> =C2=A0{
> +	struct xe_bo *bo;
> +
> =C2=A0	if (!xe_bo_is_xe_bo(tbo)) {
> =C2=A0		/* Don't handle scatter gather BOs */
> =C2=A0		if (tbo->type =3D=3D ttm_bo_type_sg) {
> @@ -266,6 +268,12 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	bo =3D ttm_to_xe_bo(tbo);
> +	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
> +		*placement =3D sys_placement;
> +		return;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * For xe, sg bos that are evicted to system just triggers a
> =C2=A0	 * rebind of the sg list upon subsequent validation to
> XE_PL_TT.
> @@ -710,6 +718,17 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> +	if (!move_lacks_source && (bo->flags &
> XE_BO_FLAG_CPU_ADDR_MIRROR) &&
> +	=C2=A0=C2=A0=C2=A0 new_mem->mem_type =3D=3D XE_PL_SYSTEM) {
> +		ret =3D xe_svm_bo_evict(bo);
> +		if (!ret) {
> +			drm_dbg(&xe->drm, "Evict system allocator BO
> success\n");
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +		}
> +
> +		goto out;
> +	}
> +
> =C2=A0	if (old_mem_type =3D=3D XE_PL_SYSTEM && new_mem->mem_type =3D=3D
> XE_PL_TT && !handle_system_ccs) {
> =C2=A0		ttm_bo_move_null(ttm_bo, new_mem);
> =C2=A0		goto out;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index fc030855d078..dafc5061eb42 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -768,6 +768,20 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> start, u64 end)
> =C2=A0	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_svm_bo_evict() - SVM evict BO to system memory
> + * @bo: BO to evict
> + *
> + * SVM evict BO to system memory. GPU SVM layer ensures all device
> pages
> + * are evicted before returning.
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_svm_bo_evict(struct xe_bo *bo)
> +{
> +	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> +}
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> =C2=A0static struct drm_pagemap_dma_addr
> =C2=A0xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
> @@ -795,7 +809,6 @@ static const struct drm_pagemap_ops
> xe_drm_pagemap_ops =3D {
> =C2=A0	.map_dma =3D xe_drm_pagemap_map_dma,
> =C2=A0};
> =C2=A0
> ->>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
> =C2=A0/**
> =C2=A0 * xe_devm_add: Remap and provide memmap backing for device memory
> =C2=A0 * @tile: tile that the memory region belongs to
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 4c2576162c39..77dec5aae0ee 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,7 @@
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> =C2=A0
> +struct xe_bo;
> =C2=A0struct xe_mem_region;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> @@ -56,6 +57,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0
> =C2=A0bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> =C2=A0
> +int xe_svm_bo_evict(struct xe_bo *bo);
> +
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> =C2=A0{
> =C2=A0	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> &range->base);

