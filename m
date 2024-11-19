Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55C59D2BA8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9851110E68C;
	Tue, 19 Nov 2024 16:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ICnFk6tC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DF710E699;
 Tue, 19 Nov 2024 16:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732035038; x=1763571038;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5fiKpJYG7vzZHmFBy+SJe0bx4WoPZwIxMsAbSvv8G7w=;
 b=ICnFk6tCSxHI05XahM/v75veJpWzM4pLHhVwAXX+t9cfop5ynCnc74UC
 8rHKQ+LM9xpO7I1BdX8Eq4LdcsS459KA7TrX+BodKIl78NlmIDx0zXC1s
 FVageno2lh8RqDDUrexS0vy/l6KJyPhsOkrr9/Fe2m8LCv4gdjwmXkt28
 7HQ69qtQrmUvYtGB8O4bcl3QRxJt/PJoJxXzp/4C1v1pgRqvcRygxvWRM
 X7eSCOErc8wPO+FKSXsm/voiFYUBeCDE06Auk3UiQr6VEh1vBqDe3danL
 eNatBBZ0M5ptpnSi/fA6VvCKBGobr5JLI0wlKyC0VCHgu1V5mPl499qqf w==;
X-CSE-ConnectionGUID: JH90A+3iQFSwIG2QqvlGEQ==
X-CSE-MsgGUID: j8qXQnXRSEi0iahJ486yQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49586558"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="49586558"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:50:26 -0800
X-CSE-ConnectionGUID: 7CAquBwBTD22HWOyvQGdkA==
X-CSE-MsgGUID: vp4jDnRLSDm5i/at4jk1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94688967"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:50:19 -0800
Message-ID: <eb5c4edbffcdfd49ea9e43decdcafa8bf907b10b.camel@linux.intel.com>
Subject: Re: [PATCH v2 17/29] drm/xe: Add SVM device memory mirroring
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 17:50:16 +0100
In-Reply-To: <20241016032518.539495-18-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-18-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Add SVM device memory mirroring which enables device pages for
> migration.
>=20
> TODO: Hide this behind Kconfig
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 56
> +++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ++
> =C2=A0drivers/gpu/drm/xe/xe_tile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++
> =C2=A04 files changed, 70 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 85bede4dd646..2ac5de7751c9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -104,6 +104,14 @@ struct xe_mem_region {
> =C2=A0	resource_size_t actual_physical_size;
> =C2=A0	/** @mapping: pointer to VRAM mappable space */
> =C2=A0	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 1d8021b4e2f0..22e6341117bd 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -21,6 +21,11 @@ static struct xe_vm *range_to_vm(struct
> drm_gpusvm_range *r)
> =C2=A0	return gpusvm_to_vm(r->gpusvm);
> =C2=A0}
> =C2=A0
> +static void *xe_svm_devm_owner(struct xe_device *xe)
> +{
> +	return xe;
> +}
> +
> =C2=A0static struct drm_gpusvm_range *
> =C2=A0xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> =C2=A0{
> @@ -284,8 +289,9 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0		=C2=A0 xe_svm_garbage_collector_work_func);
> =C2=A0
> =C2=A0	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, NULL, 0, vm->size,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, xe_svm_devm_owner(v=
m-
> >xe), 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size, SZ_512M, &gpusvm_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fault_chunk_sizes,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_size=
s));
> =C2=A0}
> =C2=A0
> @@ -383,3 +389,49 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> start, u64 end)
> =C2=A0{
> =C2=A0	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> =C2=A0}
> +
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
xe_devm_add():

Otherwise LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com<


> + * @tile: tile that the memory region belongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and
> create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)

> +{
> +	struct xe_device *xe =3D tile_to_xe(tile);
> +	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res =3D devm_request_free_mem_region(dev, &iomem_resource,
> +					=C2=A0=C2=A0 mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret =3D PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start =3D res->start;
> +	mr->pagemap.range.end =3D res->end;
> +	mr->pagemap.nr_range =3D 1;
> +	mr->pagemap.ops =3D drm_gpusvm_pagemap_ops_get();
> +	mr->pagemap.owner =3D xe_svm_devm_owner(xe);
> +	addr =3D devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start,
> resource_size(res));
> +		ret =3D PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory,
> errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base =3D res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to
> devm, remapped to %pr\n",
> +		 tile->id, mr->io_start, mr->io_start + mr-
> >usable_size, res);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 472fbc51f30e..760d22cefb1e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,7 @@
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> =C2=A0
> +struct xe_mem_region;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> =C2=A0struct xe_vma;
> @@ -22,6 +23,8 @@ struct xe_svm_range {
> =C2=A0	u8 tile_invalidated;
> =C2=A0};
> =C2=A0
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> +
> =C2=A0int xe_svm_init(struct xe_vm *vm);
> =C2=A0void xe_svm_fini(struct xe_vm *vm);
> =C2=A0void xe_svm_close(struct xe_vm *vm);
> diff --git a/drivers/gpu/drm/xe/xe_tile.c
> b/drivers/gpu/drm/xe/xe_tile.c
> index 07cf7cfe4abd..bbb430392dfb 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -13,6 +13,7 @@
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pcode.h"
> =C2=A0#include "xe_sa.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_tile.h"
> =C2=A0#include "xe_tile_sysfs.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> @@ -164,6 +165,7 @@ static int tile_ttm_mgr_init(struct xe_tile
> *tile)
> =C2=A0 */
> =C2=A0int xe_tile_init_noalloc(struct xe_tile *tile)
> =C2=A0{
> +	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	err =3D tile_ttm_mgr_init(tile);
> @@ -176,6 +178,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> =C2=A0
> =C2=A0	xe_wa_apply_tile_workarounds(tile);
> =C2=A0
> +	if (xe->info.has_usm && IS_DGFX(xe))
> +		xe_devm_add(tile, &tile->mem.vram);
> +
> =C2=A0	err =3D xe_tile_sysfs_init(tile);
> =C2=A0
> =C2=A0	return 0;

