Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBE99B058
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 05:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF4010EB5D;
	Sat, 12 Oct 2024 03:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNOGValn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6AA10E03B;
 Sat, 12 Oct 2024 03:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728702576; x=1760238576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PFza0TtHaC3abrubGqSXztrJzNM2pxqj1Fc30IEbi90=;
 b=WNOGValnMv6fCStvePHFjYZIy4S7DU7CtKrfnzc5ni5I90b1P210QI4m
 Ggqzty/bdE+zqqY+aDfpocDkq5jrnvRchJdDs0Lmdixlk5Q7dqocvk80j
 ldvGng2n8K+1jRDMphr9icwHdnwSwWPJcXcvQ9sMa+ABbkpC1gMYurTPQ
 VPasj/rCc4AMHFGoq+xsT13aZSLzk8tPoorocJpRZ6+fx9gNgEsHz2ty6
 cXC7BOflkI0jfaUsYsqesonxHZd/ZWcpo+p811duRqL0+aE6MHaXTEkXa
 kWHx51ph68XYEEjJmKGMrwislbvvh+OqM8oBzaL1znTZ0XTn1JFLzaV42 w==;
X-CSE-ConnectionGUID: mLT5thl6TFmZZXKDRAIIog==
X-CSE-MsgGUID: zk/MUiJmQKaiG5Kb2KaE0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38687322"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38687322"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
X-CSE-ConnectionGUID: O2U/C1z7QdOBev1tClqUlw==
X-CSE-MsgGUID: yRUn/J0MRwKXWMvKIUpxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77278467"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v1 4/5] drm/xe/bo: Create a new sg for dmabuf BOs that are
 associated with a VF
Date: Fri, 11 Oct 2024 19:40:26 -0700
Message-ID: <20241012024524.1377836-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
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
RAM or a VF or other PCI device. After we confirm that they belong to
a VF, we convert the DMA addresses (IOVAs in this case) to DPAs and
create a new sg and populate it with the new addresses.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 108 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h |   6 ++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c74c121ea7bb..64efe1b21f19 100644
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
@@ -543,6 +547,102 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
+	return NULL;
+}
+
+
+static void xe_bo_translate_iova_to_dpa(struct xe_device *xe,
+					struct sg_table *sg,
+					struct sg_table *new_sg,
+					struct pci_dev *pdev)
+{
+	resource_size_t io_start = pci_resource_start(pdev, LMEM_BAR);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct scatterlist *sgl, *new_sgl;
+	int i, vfid = pci_iov_vf_id(pdev);
+	dma_addr_t new_addr, bo_addr;
+	struct iommu_domain *domain;
+	phys_addr_t phys;
+	u64 offset;
+
+	bo_addr = xe_gt_sriov_pf_config_get_lmem_addr(gt, ++vfid);
+	domain = iommu_get_domain_for_dev(xe->drm.dev);
+
+	new_sgl = new_sg->sgl;
+	for_each_sgtable_dma_sg(sg, sgl, i) {
+		phys = domain ? iommu_iova_to_phys(domain, sg_dma_address(sgl)) :
+			sg_dma_address(sgl);
+		offset = phys - io_start;
+		new_addr = bo_addr + offset;
+
+		sg_set_page(new_sgl, NULL, sg_dma_len(sgl), 0);
+		sg_dma_address(new_sgl) = new_addr;
+		sg_dma_len(new_sgl) = sg_dma_len(sgl);
+
+		new_sgl = sg_next(new_sgl);
+	}
+}
+
+static struct sg_table *xe_bo_create_new_sg(struct sg_table *sg,
+					    struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct iommu_domain *domain;
+	struct sg_table *new_sg;
+	struct pci_dev *pdev;
+	phys_addr_t phys;
+	int vfid;
+
+	if (!IS_SRIOV_PF(xe))
+		return sg;
+
+	domain = iommu_get_domain_for_dev(xe->drm.dev);
+	phys = domain ? iommu_iova_to_phys(domain, sg_dma_address(sg->sgl)) :
+		sg_dma_address(sg->sgl);
+
+	if (page_is_ram(PFN_DOWN(phys)))
+		return sg;
+
+	pdev = xe_find_vf_dev(xe, phys);
+	if (!pdev)
+		return sg;
+
+	vfid = pci_iov_vf_id(pdev);
+	if (vfid < 0)
+		return sg;
+
+	new_sg = kzalloc(sizeof(*new_sg), GFP_KERNEL);
+	if (!new_sg)
+		return sg;
+
+	if (sg_alloc_table(new_sg, sg->nents, GFP_KERNEL)) {
+		kfree(new_sg);
+		return sg;
+	}
+
+	bo->is_devmem_external = true;
+	xe_bo_translate_iova_to_dpa(xe, sg, new_sg, pdev);
+
+	return new_sg;
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -577,7 +677,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 		return PTR_ERR(sg);
 
 	ttm_bo->sg = sg;
-	xe_tt->sg = sg;
+	xe_tt->sg = xe_bo_create_new_sg(sg, ttm_to_xe_bo(ttm_bo));
 
 out:
 	ttm_bo_move_null(ttm_bo, new_res);
@@ -1066,6 +1166,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 
 static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 {
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
 	if (!xe_bo_is_xe_bo(ttm_bo))
 		return;
 
@@ -1079,6 +1181,10 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 
 		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
 					 DMA_BIDIRECTIONAL);
+		if (bo->is_devmem_external && xe_tt->sg != ttm_bo->sg) {
+			sg_free_table(xe_tt->sg);
+			kfree(xe_tt->sg);
+		}
 		ttm_bo->sg = NULL;
 		xe_tt->sg = NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 8b9201775081..0fe619bc436d 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -67,6 +67,12 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared;
 
+	/**
+	 * @is_devmem_external: Whether this BO is an imported dma-buf that
+	 * has a backing store in VRAM.
+	 */
+	bool is_devmem_external;
+
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
 	 * objects. Exceptions are system memory on DGFX, which is always
-- 
2.45.1

