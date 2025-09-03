Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03827B42CDA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B4F10E962;
	Wed,  3 Sep 2025 22:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+NkGpYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADD410E953;
 Wed,  3 Sep 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756938969; x=1788474969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hgd9pJHgkYI/axnE8dpfO78zHLvzIXR9Qh60pB1JQgo=;
 b=e+NkGpYvNon//Z6DXazILRdU2Lqat8C9hqyFbMpx64n0bQA+rEOBXHem
 fKry1+9ys6rMvtT+S5ten5UE7lhBJpO/Jk4RFCfVmMZOqcZNLRz759TLp
 OlGR4wCG8cOzrH9XoYTNdAKxnD+1HgcFjzeqsFnCeKIQ1hJK5BOHY75Cc
 misFVXuS1xsec55zxG5J3nTfnlQO0hLKmN2fgLN56zqId7o3e4u57LsCG
 KSwAsoY7AYaV8aLFo8Zdtbk6alh0JbsT0KQspsiwedpZgHVz29PjbYsEb
 2hhULH7++WBJsxZB4AzALubim91P+rPkGNFO3ymkf04kAHex/CDXAxVId A==;
X-CSE-ConnectionGUID: sPoUnIVWTM+mnxvtki0b4w==
X-CSE-MsgGUID: 9QV7IikuRkePwscYgxwx6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76715638"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76715638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:08 -0700
X-CSE-ConnectionGUID: pICbsCPbR2Oq/s03IP03oQ==
X-CSE-MsgGUID: Zyu1FQfhSAi1bUwF2dRMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202570679"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 4/5] drm/xe/bo: Create new dma_addr array for dmabuf BOs
 associated with VFs
Date: Wed,  3 Sep 2025 15:30:57 -0700
Message-ID: <20250903223403.1261824-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
References: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
associated with a VF, we need to adjust and translate these addresses
to LMEM addresses to make the BOs usable by the PF. Otherwise, the
BOs (i.e, PCI BAR addresses) are only accessible by the CPU and not
by the GPU.

In order to do the above, we first need to identify if the addresses
associated with an imported BO (type ttm_bo_type_sg) belong to System
RAM or a VF or other PCI devices. After we confirm that they belong to
a VF, we convert the BAR addresses to DPAs and create a new dma_addr
array (of type drm_pagemap_dma_addr) and populate it with the new
addresses along with the segment sizes.

v2:
- Use dma_addr array instead of sg table to store translated addresses
  (Matt)

v3:
- Remove the usage of iommu_iova_to_phys() as the imported BO would no
  longer contain IOVAs and would instead have BAR addresses.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 98 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h | 12 ++++
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4faf15d5fa6d..6987bffb7aa7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -21,11 +21,13 @@
 
 #include <trace/events/gpu_mem.h>
 
+#include "regs/xe_bars.h"
 #include "xe_device.h"
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_map.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
@@ -33,6 +35,7 @@
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -677,6 +680,88 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	return ret;
 }
 
+static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
+				      phys_addr_t phys)
+{
+	struct pci_dev *pdev, *pf_pdev = to_pci_dev(xe->drm.dev);
+	resource_size_t io_start, io_size;
+
+	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list) {
+		if (pdev->is_physfn)
+			continue;
+
+		io_start = pci_resource_start(pdev, LMEM_BAR);
+		io_size = pci_resource_len(pdev, LMEM_BAR);
+
+		if (phys >= io_start &&
+		    phys < (io_start + io_size - PAGE_SIZE))
+			return pdev;
+	}
+
+	return NULL;
+}
+
+
+static void xe_bo_translate_io_to_dpa(struct xe_bo *bo, struct sg_table *sg,
+				      resource_size_t io_start, int vfid)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct scatterlist *sgl;
+	struct xe_bo *lmem_bo;
+	phys_addr_t phys;
+	dma_addr_t addr;
+	u64 offset, i;
+
+	lmem_bo = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
+
+	for_each_sgtable_dma_sg(sg, sgl, i) {
+		phys = sg_dma_address(sgl);
+		offset = phys - io_start;
+		addr = xe_bo_addr(lmem_bo, offset, sg_dma_len(sgl));
+
+		bo->dma_addr[i] = drm_pagemap_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,
+						get_order(sg_dma_len(sgl)),
+						DMA_BIDIRECTIONAL);
+	}
+}
+
+static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	resource_size_t io_start;
+	struct pci_dev *pdev;
+	phys_addr_t phys;
+	int vfid;
+
+	if (!IS_SRIOV_PF(xe))
+		return 0;
+
+	phys = sg_dma_address(sg->sgl);
+	if (page_is_ram(PFN_DOWN(phys)))
+		return 0;
+
+	pdev = xe_find_vf_dev(xe, phys);
+	if (!pdev)
+		return 0;
+
+	vfid = pci_iov_vf_id(pdev);
+	if (vfid < 0)
+		return 0;
+
+	bo->dma_addr = kmalloc_array(sg->nents, sizeof(*bo->dma_addr),
+				     GFP_KERNEL);
+	if (!bo->dma_addr)
+		return -ENOMEM;
+
+	bo->is_devmem_external = true;
+	io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe_bo_translate_io_to_dpa(bo, sg, io_start, vfid);
+
+	return 0;
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -695,6 +780,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
 	struct sg_table *sg;
+	int ret = 0;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
@@ -719,13 +805,19 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
+	ret = xe_bo_sg_to_dma_addr_array(sg, ttm_to_xe_bo(ttm_bo));
+	if (ret < 0) {
+		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
+		return ret;
+	}
+
 	ttm_bo->sg = sg;
 	xe_tt->sg = sg;
 
 out:
 	ttm_bo_move_null(ttm_bo, new_res);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -1540,6 +1632,10 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 
 		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
 					 DMA_BIDIRECTIONAL);
+
+		if (bo->is_devmem_external) {
+			kfree(bo->dma_addr);
+		}
 		ttm_bo->sg = NULL;
 		xe_tt->sg = NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 314652afdca7..371eee3f975f 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -88,6 +88,18 @@ struct xe_bo {
 	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
 	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 
+	/**
+	 * @is_devmem_external: Whether this BO is an imported dma-buf that
+	 * is LMEM based.
+	 */
+	bool is_devmem_external;
+
+	/**
+	 * @dma_addr: An array to store DMA addresses (DPAs) for imported
+	 * dmabuf BOs that are LMEM based.
+	 */
+	struct drm_pagemap_addr *dma_addr;
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
-- 
2.50.1

