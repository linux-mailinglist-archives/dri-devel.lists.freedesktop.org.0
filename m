Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F36B5715E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562E210E333;
	Mon, 15 Sep 2025 07:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN1E/XzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863A410E2DD;
 Mon, 15 Sep 2025 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757921147; x=1789457147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0HuR5bnzld2xPA+8xOvrEMpDt8rRdPpAK72NrpIHBA=;
 b=eN1E/XzSd6iipv/s0epHphlxhcbDYNQvziDqCNgARsG0O0xkf9zrbIFI
 GZ+cQOF/JjjZsDDDtLHRCc7y42dhuSQ/eZ+bowmYO2L3SUGmc02tFeJqz
 xDnxAVOpO+FzNc7LsoDiz8NkLgbXCetoocuhoL1oFSiO07gp2ah/jIK82
 91w0fd+gSndjijYkmai+bSSJeGiH3Qhl7sTbrW+bZL6rmmmNNE6+sqBpo
 ALFIp8Wg4m4vK6d53Uu81UhteyjF53ahkUbVv5T/mYHqQ8CETGPByFtyP
 N+ZLmNolgSYeJDUGP7GZy+NHexygbaVet/xtz/jgMhFXZozOlUfFPOr63 g==;
X-CSE-ConnectionGUID: kzR4cO3tTYOv7togyUdBVw==
X-CSE-MsgGUID: 1UyrRbFBSIO/TfLjOmHZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77619125"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77619125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:46 -0700
X-CSE-ConnectionGUID: DK9iTUXvSoq9i0HtAd71jg==
X-CSE-MsgGUID: KI/b+ODgQpWI4rr+EoKoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="211693876"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:47 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 4/5] drm/xe/bo: Create new dma_addr array for dmabuf BOs
 associated with VFs
Date: Mon, 15 Sep 2025 00:21:08 -0700
Message-ID: <20250915072428.1712837-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
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

v4:
- Take a reference on the VF's backing object in LMEM (Michal)
- Create a new type for storing dma data

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c             | 101 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h       |  12 +++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h |  19 +++++
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e6d16b34e5b5..a4e09fa88274 100644
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
@@ -679,6 +682,90 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
+	struct xe_bo *lmem_obj;
+	phys_addr_t phys;
+	dma_addr_t addr;
+	u64 offset, i;
+
+	lmem_obj = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
+	bo->dma_data.lmem_obj = xe_bo_get(lmem_obj);
+
+	for_each_sgtable_dma_sg(sg, sgl, i) {
+		phys = sg_dma_address(sgl);
+		offset = phys - io_start;
+		addr = xe_bo_addr(lmem_obj, offset, sg_dma_len(sgl));
+
+		bo->dma_data.dma_addr[i] = drm_pagemap_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,
+						get_order(sg_dma_len(sgl)),
+						DMA_BIDIRECTIONAL);
+	}
+}
+
+static int xe_bo_sg_to_dma_addr_array(struct sg_table *sg, struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct drm_pagemap_addr *dma_addr;
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
+	dma_addr = kmalloc_array(sg->nents, sizeof(*dma_addr), GFP_KERNEL);
+	if (!dma_addr)
+		return -ENOMEM;
+
+	bo->is_devmem_external = true;
+	bo->dma_data.dma_addr = dma_addr;
+	io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe_bo_translate_io_to_dpa(bo, sg, io_start, vfid);
+
+	return 0;
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -697,6 +784,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
 	struct sg_table *sg;
+	int ret = 0;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
@@ -721,13 +809,19 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
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
@@ -1554,6 +1648,11 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 
 		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
 					 DMA_BIDIRECTIONAL);
+
+		if (bo->is_devmem_external) {
+			xe_bo_put(bo->dma_data.lmem_obj);
+			kfree(bo->dma_data.dma_addr);
+		}
 		ttm_bo->sg = NULL;
 		xe_tt->sg = NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d4fe3c8dca5b..8e416c4ffbca 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -108,6 +108,18 @@ struct xe_bo {
 	 * from default
 	 */
 	u64 min_align;
+
+	/**
+	 * @is_devmem_external: Whether this BO is an imported dma-buf that
+	 * is LMEM based.
+	 */
+	bool is_devmem_external;
+
+	/**
+	 * @dma_data: DMA related data for an imported dmabuf BO that is LMEM
+	 * based.
+	 */
+	struct xe_sriov_dma_data dma_data;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
index 956a88f9f213..6d5f923f7fc4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
@@ -11,6 +11,8 @@
 
 #include "xe_sriov_pf_service_types.h"
 
+struct xe_bo;
+
 /**
  * struct xe_sriov_metadata - per-VF device level metadata
  */
@@ -42,4 +44,21 @@ struct xe_device_pf {
 	struct xe_sriov_metadata *vfs;
 };
 
+/**
+ * struct xe_sriov_dma_data - DMA related data for LMEM based imported dmabuf
+ * BOs that are associated with a sriov VF.
+ *
+ * The data in this structure is valid only if driver is running in the
+ * @XE_SRIOV_MODE_PF mode.
+ */
+struct xe_sriov_dma_data {
+	/**
+	 * @dma_addr: An array to store DMA addresses (DPAs) for imported
+	 * dmabuf BOs that are LMEM based.
+	 */
+	struct drm_pagemap_addr *dma_addr;
+
+	/** @lmem_obj: Ref taken on the LMEM obj that backs a VF's quota */
+	struct xe_bo *lmem_obj;
+};
 #endif
-- 
2.50.1

