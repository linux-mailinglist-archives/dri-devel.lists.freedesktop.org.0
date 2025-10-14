Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572BBD7D1E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496C110E55E;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3eTuBZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5EA10E558;
 Tue, 14 Oct 2025 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426040; x=1791962040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZF3X5n2FzlNn2F5vM0ngy+Ho0TpDqPUMViAzvDQVV0s=;
 b=C3eTuBZF2JB3hX5b9NMKTQnPtTrDUuaqupl/JFOuebxsiZILycuYsHP2
 LJy6SObYHnIHEzfFfBRGTdj+AiRVZQJigTEDggeDJ70Ye1Un8VVxrcXIZ
 +6l3sFys0dj2AwHqt5aqh9yVN37YcI95PL3DNEWCqmpnkBEq6yNEipggt
 qLXiNW3xu1KLOanhaJ7nkilTd0akD5ah4775lwTLsXlsYN/SP3k25RIQB
 8kS4cM9902ubSn5JkVyDrHICRecd+cti84IIJOiDvn+4lTEaH4eN6wjFt
 LIpSIS0j99upIDi+kXN/nRHOYZcXbFWm8VeJZs/vFmHpyeselQr9Y/HJw A==;
X-CSE-ConnectionGUID: jln/b7qGQ2+e67HMQcgwLA==
X-CSE-MsgGUID: n1+w1nXpTvivg9FhSUP8Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257150"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257150"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:59 -0700
X-CSE-ConnectionGUID: s0v5UnaIRvqET5mcE+KEbA==
X-CSE-MsgGUID: R33pIPa2QPasPgcAMzulSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369874"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:58 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [RFC 7/8] drm/xe/bo: Create new dma_addr array for dmabuf BOs
 associated with VFs
Date: Tue, 14 Oct 2025 00:08:57 -0700
Message-ID: <20251014071243.811884-8-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
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

Note that, all the above is only done if we are able to map the
dmabuf via the IOV interconnect. If not, we fallback to the legacy
mapping route using the sg table.

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
 drivers/gpu/drm/xe/xe_bo.c             | 148 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h       |  12 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h |  19 ++++
 3 files changed, 167 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4410e28dee54..e05b7eace784 100644
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
@@ -34,6 +36,7 @@
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_sriov_pf_helpers.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -679,6 +682,99 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
+static void xe_bo_translate_io_xarray_to_dpa(struct xe_bo *bo,
+					     struct xarray *ranges,
+					     resource_size_t io_start,
+					     int vfid)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_bo *lmem_obj;
+	struct range *range;
+	phys_addr_t phys;
+	unsigned long i;
+	dma_addr_t addr;
+	u64 offset;
+	void *entry;
+
+	lmem_obj = xe_gt_sriov_pf_config_get_lmem_obj(gt, ++vfid);
+	bo->dma_data.lmem_obj = xe_bo_get(lmem_obj);
+
+	xa_for_each(ranges, i, entry) {
+		range = entry;
+		phys = range->start;
+		offset = phys - io_start;
+		addr = xe_bo_addr(lmem_obj, offset, range_len(range));
+
+		bo->dma_data.dma_addr[i] = drm_pagemap_addr_encode(addr,
+						DRM_INTERCONNECT_DRIVER,
+						get_order(range_len(range)),
+						DMA_BIDIRECTIONAL);
+	}
+}
+
+
+static int xe_bo_xarray_to_dma_addr(struct dma_buf_ranges *ranges,
+				    struct xe_bo *bo)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct drm_pagemap_addr *dma_addr;
+	resource_size_t io_start;
+	struct pci_dev *pdev;
+	struct range *range;
+	void *entry;
+	int vfid;
+
+	if (!IS_SRIOV_PF(xe))
+		return 0;
+
+	entry = xa_load(&ranges->ranges, 0);
+	range = entry;
+	if (page_is_ram(PFN_DOWN(range->start)))
+		return 0;
+
+	pdev = xe_find_vf_dev(xe, range->start);
+	if (!pdev)
+		return 0;
+
+	vfid = pci_iov_vf_id(pdev);
+	if (vfid < 0)
+		return 0;
+
+	dma_addr = kmalloc_array(ranges->nranges, sizeof(*dma_addr),
+				 GFP_KERNEL);
+	if (!dma_addr)
+		return -ENOMEM;
+
+	bo->is_devmem_external = true;
+	bo->dma_data.dma_addr = dma_addr;
+	io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe_bo_translate_io_xarray_to_dpa(bo, &ranges->ranges, io_start, vfid);
+
+	return 0;
+}
+
 /*
  * The dma-buf map_attachment() / unmap_attachment() is hooked up here.
  * Note that unmapping the attachment is deferred to the next
@@ -696,7 +792,10 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 					       ttm);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
-	struct sg_table *sg;
+	struct dma_buf_ranges *ranges;
+	struct sg_table *sg = NULL;
+	bool allow_ic = false;
+	int ret = 0;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
@@ -717,9 +816,27 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 		ttm_bo->sg = NULL;
 	}
 
-	sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
-	if (IS_ERR(sg))
-		return PTR_ERR(sg);
+	if (attach->allow_ic &&
+	    attach->interconnect.type == DMA_BUF_INTERCONNECT_IOV) {
+		allow_ic = true;
+
+		ranges = dma_buf_map_interconnect(attach);
+		if (IS_ERR(ranges)) {
+			allow_ic = false;
+		} else {
+			if (xe_bo_xarray_to_dma_addr(ranges,
+						     ttm_to_xe_bo(ttm_bo))) {
+				dma_buf_unmap_interconnect(attach, ranges);
+				allow_ic = false;
+			}
+		}
+		attach->allow_ic = allow_ic;
+	}
+	if (!allow_ic) {
+		sg = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+		if (IS_ERR(sg))
+			return PTR_ERR(sg);
+	}
 
 	ttm_bo->sg = sg;
 	xe_tt->sg = sg;
@@ -727,7 +844,7 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 out:
 	ttm_bo_move_null(ttm_bo, new_res);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -1548,14 +1665,21 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	 * Object is idle and about to be destroyed. Release the
 	 * dma-buf attachment.
 	 */
-	if (ttm_bo->type == ttm_bo_type_sg && ttm_bo->sg) {
-		struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm,
-						       struct xe_ttm_tt, ttm);
+	if (ttm_bo->type == ttm_bo_type_sg) {
+		if (ttm_bo->sg) {
+			struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm,
+							       struct xe_ttm_tt,
+							       ttm);
 
-		dma_buf_unmap_attachment(ttm_bo->base.import_attach, ttm_bo->sg,
-					 DMA_BIDIRECTIONAL);
-		ttm_bo->sg = NULL;
-		xe_tt->sg = NULL;
+			dma_buf_unmap_attachment(ttm_bo->base.import_attach,
+						 ttm_bo->sg, DMA_BIDIRECTIONAL);
+			ttm_bo->sg = NULL;
+			xe_tt->sg = NULL;
+		}
+		if (bo->is_devmem_external) {
+			xe_bo_put(bo->dma_data.lmem_obj);
+			kfree(bo->dma_data.dma_addr);
+		}
 	}
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

