Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4A9A59DF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 07:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376DF10E2CF;
	Mon, 21 Oct 2024 05:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6LoQN9b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1CD10E282;
 Mon, 21 Oct 2024 05:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729489568; x=1761025568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8XWLiBEU7K7TxvavInh4Ggaazz1BEyz1cNNbHNSVdNc=;
 b=X6LoQN9bSIAZ7+aBPkWqURVue3ew8g/y8wM+s/lTauqhQujtWkpDqqMe
 H0MEwWCiGtiJ3DtAcb9tZ0XwLQ2G6G0NL7ra5nzwG+pqsP7MZJFOT3R4b
 fTi+HTpiG3NWLOojxBT+by7wRSssseGC3ulTpd1I/vIdqPSRCSEzX4euR
 tuZL7a+WIq3NZFZrS0cqIzDxdxuFuuRcv9IMANR7ZcLpQZ++NDll+QOtC
 zlOMIhiP1HLVm8gbLysIhexb6LVbVbBnm4CfjWdpq9otLHJJus4k6lXc6
 QNI0DQNME8zOuoZbkvUonHriVuthZ31rORh9HcDRGvrUbIgsP14ubNMbg A==;
X-CSE-ConnectionGUID: JGEv9QK2Ro6U9wtFLio2AA==
X-CSE-MsgGUID: P57tTV8xTxOUBza8GL4kGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40345943"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40345943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:07 -0700
X-CSE-ConnectionGUID: XViG+FOZTGaQaPll6pP1pw==
X-CSE-MsgGUID: 3VhXmuujRxKnZ3+Mkf4nmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110180217"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:06 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 4/5] drm/xe/bo: Create new dma_addr array for dmabuf BOs
 associated with VFs
Date: Sun, 20 Oct 2024 22:21:32 -0700
Message-ID: <20241021052236.1820329-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
References: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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
to LMEM addresses to make the BOs usable by the PF. Otherwise, the BOs
(i.e, PCI BAR addresses) are only accessible by the CPU and not by
the GPU.

In order to do the above, we first need to identify if the DMA addresses
associated with an imported BO (type ttm_bo_type_sg) belong to System
RAM or a VF or other PCI devices. After we confirm that they belong to
a VF, we convert the DMA addresses (IOVAs in this case) to DPAs and
create a new dma_addr array (of type drm_pagemap_dma_addr) and populate
it with the new addresses along with the segment sizes.

v2:
- Use dma_addr array instead of sg table to store translated addresses
  (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 116 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h |  11 ++-
 2 files changed, 120 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5b232f2951b1..81a2f8c8031a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -6,6 +6,7 @@
 #include "xe_bo.h"
 
 #include <linux/dma-buf.h>
+#include <linux/iommu.h>
 
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -15,16 +16,19 @@
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 
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
 #include "xe_preempt_fence.h"
 #include "xe_res_cursor.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -543,6 +547,94 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
+static void xe_bo_translate_iova_to_dpa(struct iommu_domain *domain,
+					struct xe_bo *bo, struct sg_table *sg,
+					resource_size_t io_start, int vfid)
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
+		phys = iommu_iova_to_phys(domain, sg_dma_address(sgl));
+		offset = phys - io_start;
+		addr = xe_bo_addr(lmem_bo, offset, sg_dma_len(sgl));
+
+		bo->dma_addr[i] = drm_pagemap_dma_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,
+						get_order(sg_dma_len(sgl)),
+						DMA_BIDIRECTIONAL);
+	}
+}
+
+static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct iommu_domain *domain;
+	resource_size_t io_start;
+	struct pci_dev *pdev;
+	phys_addr_t phys;
+	int vfid;
+
+	if (!IS_SRIOV_PF(xe))
+		return 0;
+
+	domain = iommu_get_domain_for_dev(xe->drm.dev);
+	if (!domain)
+		return 0;
+
+	phys = iommu_iova_to_phys(domain, sg_dma_address(sg->sgl));
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
+	xe_bo_translate_iova_to_dpa(domain, bo, sg, io_start, vfid);
+
+	return 0;
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -560,12 +652,15 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 					       ttm);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct sg_table *sg;
+	int ret;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
 
-	if (new_res->mem_type == XE_PL_SYSTEM)
-		goto out;
+	if (new_res->mem_type == XE_PL_SYSTEM) {
+		ttm_bo_move_null(ttm_bo, new_res);
+		return 0;
+	}
 
 	if (ttm_bo->sg) {
 		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
@@ -576,13 +671,16 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
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
 
-out:
-	ttm_bo_move_null(ttm_bo, new_res);
-
-	return 0;
+	return ret;
 }
 
 /**
@@ -1066,6 +1164,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 {
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
 
@@ -1079,6 +1179,10 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 
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
index 13c6d8a69e91..f74876be3f8d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -66,7 +66,16 @@ struct xe_bo {
 
 	/** @ccs_cleared */
 	bool ccs_cleared;
-
+	/**
+	 * @is_devmem_external: Whether this BO is an imported dma-buf that
+	 * is LMEM based.
+	 */
+	bool is_devmem_external;
+	/**
+	 * @dma_addr: An array to store DMA addresses (DPAs) for imported
+	 * dmabuf BOs that are LMEM based.
+	 */
+	struct drm_pagemap_dma_addr *dma_addr;
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
-- 
2.45.1

