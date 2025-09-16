Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A74B5A257
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 22:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B838610E792;
	Tue, 16 Sep 2025 20:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPZgEBtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9C710E170;
 Tue, 16 Sep 2025 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758054334; x=1789590334;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=249xbnYmyRUMGnlnniH2B7aG91WTmw643zE8GihvaRk=;
 b=jPZgEBtphmooDKD68oRhCyFzXK927NGIh4dEJiRF0AnB6IVNit5LQKXk
 RtNINhJ0SiIYf9twIZV4P5T+b0VYnMygmlGWV2tx75hSd6rd1pHpK0A2Z
 ZUhQlyrykOnXN9bd1qqQeX557TPmqDlpCiFtPulxoLPeiNGD9pJzpqWbv
 97HEbHXOoiYu2Mm5ChChW1ZrJd+UkoAzngnH9LD5+pCIkJxyf4vzejAYh
 p7CBzbXq1jHVLJoZqSYBssSJ5OfKWdcrpZoE1vEjl/boRsD+JHKeDZfjZ
 x4Tv1mz/5uJ1kReA1/nz0K/ab+oDXROwlxE+gfvL1ypa8/3ofsiKiaLhB Q==;
X-CSE-ConnectionGUID: Uy8SVucSTNS8iNiFGH3VlQ==
X-CSE-MsgGUID: ZDXDhANsTE+P9OkkznjEOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60406592"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60406592"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:25:34 -0700
X-CSE-ConnectionGUID: iZ8OmV9/RbKsU038MrW7sA==
X-CSE-MsgGUID: NJiPox6bQeqF6NQEp0Nvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="180306042"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.245.248])
 ([10.245.245.248])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:25:32 -0700
Message-ID: <59cf1b78607dddd6b394f023d786d0123f9195b0.camel@linux.intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe/bo: Create new dma_addr array for dmabuf
 BOs associated with VFs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Tue, 16 Sep 2025 22:25:29 +0200
In-Reply-To: <20250903223403.1261824-5-vivek.kasireddy@intel.com>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
 <20250903223403.1261824-5-vivek.kasireddy@intel.com>
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

On Wed, 2025-09-03 at 15:30 -0700, Vivek Kasireddy wrote:
> For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
> associated with a VF, we need to adjust and translate these addresses
> to LMEM addresses to make the BOs usable by the PF. Otherwise, the
> BOs (i.e, PCI BAR addresses) are only accessible by the CPU and not
> by the GPU.
>=20
> In order to do the above, we first need to identify if the addresses
> associated with an imported BO (type ttm_bo_type_sg) belong to System
> RAM or a VF or other PCI devices. After we confirm that they belong
> to
> a VF, we convert the BAR addresses to DPAs and create a new dma_addr
> array (of type drm_pagemap_dma_addr) and populate it with the new
> addresses along with the segment sizes.
>=20
> v2:
> - Use dma_addr array instead of sg table to store translated
> addresses
> =C2=A0 (Matt)
>=20
> v3:
> - Remove the usage of iommu_iova_to_phys() as the imported BO would
> no
> =C2=A0 longer contain IOVAs and would instead have BAR addresses.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 98
> +++++++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_bo_types.h | 12 ++++
> =C2=A02 files changed, 109 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4faf15d5fa6d..6987bffb7aa7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -21,11 +21,13 @@
> =C2=A0
> =C2=A0#include <trace/events/gpu_mem.h>
> =C2=A0
> +#include "regs/xe_bars.h"
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_dma_buf.h"
> =C2=A0#include "xe_drm_client.h"
> =C2=A0#include "xe_ggtt.h"
> =C2=A0#include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
> =C2=A0#include "xe_map.h"
> =C2=A0#include "xe_migrate.h"
> =C2=A0#include "xe_pm.h"
> @@ -33,6 +35,7 @@
> =C2=A0#include "xe_pxp.h"
> =C2=A0#include "xe_res_cursor.h"
> =C2=A0#include "xe_shrinker.h"
> +#include "xe_sriov_pf_helpers.h"
> =C2=A0#include "xe_sriov_vf_ccs.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> @@ -677,6 +680,88 @@ static int xe_bo_trigger_rebind(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_addr_t phys)
> +{
> +	struct pci_dev *pdev, *pf_pdev =3D to_pci_dev(xe->drm.dev);
> +	resource_size_t io_start, io_size;
> +
> +	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list)
> {
> +		if (pdev->is_physfn)
> +			continue;
> +
> +		io_start =3D pci_resource_start(pdev, LMEM_BAR);
> +		io_size =3D pci_resource_len(pdev, LMEM_BAR);
> +
> +		if (phys >=3D io_start &&
> +		=C2=A0=C2=A0=C2=A0 phys < (io_start + io_size - PAGE_SIZE))
> +			return pdev;
> +	}
> +
> +	return NULL;
> +}
> +
> +
> +static void xe_bo_translate_io_to_dpa(struct xe_bo *bo, struct
> sg_table *sg,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 resource_size_t io_start, int
> vfid)
> +{
> +	struct xe_device *xe =3D xe_bo_device(bo);
> +	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> +	struct scatterlist *sgl;
> +	struct xe_bo *lmem_bo;
> +	phys_addr_t phys;
> +	dma_addr_t addr;
> +	u64 offset, i;
> +
> +	lmem_bo =3D xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
> +
> +	for_each_sgtable_dma_sg(sg, sgl, i) {
> +		phys =3D sg_dma_address(sgl);
> +		offset =3D phys - io_start;
> +		addr =3D xe_bo_addr(lmem_bo, offset, sg_dma_len(sgl));

Umm, isn't this O(npages=C2=B2) complexity? Should be using a resource
cursor for this rather than xe_bo_addr().

Also as mentioned separately for malicious guest KMDs, the resulting
address must be sanity checked?

> +
> +		bo->dma_addr[i] =3D drm_pagemap_addr_encode(addr,
> +						DRM_INTERCONNECT_DRI
> VER,

Please use the XE variant here, XE_INTERCONNECT_VRAM, The DRM define
just says that it's the first free enum that drivers can use for their
private interconnects.

> +						get_order(sg_dma_len
> (sgl)),
> +						DMA_BIDIRECTIONAL);
> +	}
> +}
> +
> +static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct
> xe_bo *bo)
> +{
> +	struct xe_device *xe =3D xe_bo_device(bo);
> +	resource_size_t io_start;
> +	struct pci_dev *pdev;
> +	phys_addr_t phys;
> +	int vfid;
> +
> +	if (!IS_SRIOV_PF(xe))
> +		return 0;
> +
> +	phys =3D sg_dma_address(sg->sgl);
> +	if (page_is_ram(PFN_DOWN(phys)))
> +		return 0;
> +
> +	pdev =3D xe_find_vf_dev(xe, phys);
> +	if (!pdev)
> +		return 0;
> +
> +	vfid =3D pci_iov_vf_id(pdev);
> +	if (vfid < 0)
> +		return 0;
> +
> +	bo->dma_addr =3D kmalloc_array(sg->nents, sizeof(*bo-
> >dma_addr),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> +	if (!bo->dma_addr)
> +		return -ENOMEM;
> +
> +	bo->is_devmem_external =3D true;
> +	io_start =3D pci_resource_start(pdev, LMEM_BAR);
> +	xe_bo_translate_io_to_dpa(bo, sg, io_start, vfid);
> +
> +	return 0;
> +}
> +
> =C2=A0/*
> =C2=A0 * The dma-buf map_attachment() / unmap_attachment() is hooked up
> here.
> =C2=A0 * Note that unmapping the attachment is deferred to the next
> @@ -695,6 +780,7 @@ static int xe_bo_move_dmabuf(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> =C2=A0	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> =C2=A0	struct sg_table *sg;
> +	int ret =3D 0;
> =C2=A0
> =C2=A0	xe_assert(xe, attach);
> =C2=A0	xe_assert(xe, ttm_bo->ttm);
> @@ -719,13 +805,19 @@ static int xe_bo_move_dmabuf(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0	if (IS_ERR(sg))
> =C2=A0		return PTR_ERR(sg);
> =C2=A0
> +	ret =3D xe_bo_sg_to_dma_addr_array(sg, ttm_to_xe_bo(ttm_bo));

It looks like this is called for *all* imported dma-bufs,=20
Shouldn't this be checked for is_devmem_external?

> +	if (ret < 0) {
> +		dma_buf_unmap_attachment(attach, sg,
> DMA_BIDIRECTIONAL);
> +		return ret;
> +	}
> +
> =C2=A0	ttm_bo->sg =3D sg;
> =C2=A0	xe_tt->sg =3D sg;
> =C2=A0
> =C2=A0out:
> =C2=A0	ttm_bo_move_null(ttm_bo, new_res);
> =C2=A0
> -	return 0;
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -1540,6 +1632,10 @@ static void xe_ttm_bo_delete_mem_notify(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0
> =C2=A0		dma_buf_unmap_attachment(ttm_bo->base.import_attach,
> ttm_bo->sg,
> =C2=A0					 DMA_BIDIRECTIONAL);
> +
> +		if (bo->is_devmem_external) {
> +			kfree(bo->dma_addr);
> +		}
> =C2=A0		ttm_bo->sg =3D NULL;
> =C2=A0		xe_tt->sg =3D NULL;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> index 314652afdca7..371eee3f975f 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -88,6 +88,18 @@ struct xe_bo {
> =C2=A0	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid
> only for VF */
> =C2=A0	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> =C2=A0
> +	/**
> +	 * @is_devmem_external: Whether this BO is an imported dma-
> buf that
> +	 * is LMEM based.
> +	 */
> +	bool is_devmem_external;
> +
> +	/**
> +	 * @dma_addr: An array to store DMA addresses (DPAs) for
> imported
> +	 * dmabuf BOs that are LMEM based.
> +	 */
> +	struct drm_pagemap_addr *dma_addr;
> +
> =C2=A0	/**
> =C2=A0	 * @cpu_caching: CPU caching mode. Currently only used for
> userspace
> =C2=A0	 * objects. Exceptions are system memory on DGFX, which is
> always

