Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998B429448
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BAF6E8F2;
	Mon, 11 Oct 2021 16:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A166E8F4;
 Mon, 11 Oct 2021 16:09:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="214056793"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="214056793"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:09:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="441477984"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 09:09:44 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH 11/14] drm/i915/lmem: Enable lmem for platforms with Flat CCS
Date: Mon, 11 Oct 2021 21:41:52 +0530
Message-Id: <20211011161155.6397-12-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011161155.6397-1-ramalingam.c@intel.com>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
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

From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

A portion of device memory is reserved for Flat CCS so usable
device memory will be reduced by size of Flat CCS. Size of
Flat CCS is specified in “XEHPSDV_FLAT_CCS_BASE_ADDR”.
So to get effective device memory we need to subtract
total device memory by Flat CCS memory size.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 22 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h             |  3 +++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 1cb1948ac959..fd82ebee8724 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -900,6 +900,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
 	return intel_uncore_read_fw(gt->uncore, reg);
 }
 
+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
+{
+	int type;
+	u8 sliceid, subsliceid;
+
+	for (type = 0; type < NUM_STEERING_TYPES; type++) {
+		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
+			intel_gt_get_valid_steering(gt, type, &sliceid,
+						    &subsliceid);
+			return intel_uncore_read_with_mcr_steering(gt->uncore,
+								   reg,
+								   sliceid,
+								   subsliceid);
+		}
+	}
+
+	return intel_uncore_read(gt->uncore, reg);
+}
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 74e771871a9b..24b78398a587 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -84,6 +84,7 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 }
 
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
 
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 073d28d96669..d1f88beb26fe 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -201,8 +201,26 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (!IS_DGFX(i915))
 		return ERR_PTR(-ENODEV);
 
-	/* Stolen starts from GSMBASE on DG1 */
-	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
+	if (HAS_FLAT_CCS(i915)) {
+		u64 tile_stolen, flat_ccs_base_addr_reg, flat_ccs_base;
+
+		lmem_size = pci_resource_len(pdev, 2);
+		flat_ccs_base_addr_reg = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
+		flat_ccs_base = (flat_ccs_base_addr_reg >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
+		tile_stolen = lmem_size - flat_ccs_base;
+
+		/* If the FLAT_CCS_BASE_ADDR register is not populated, flag an error */
+		if (tile_stolen == lmem_size)
+			DRM_ERROR("CCS_BASE_ADDR register did not have expected value\n");
+
+		lmem_size -= tile_stolen;
+	} else {
+		/* Stolen starts from GSMBASE without CCS */
+		lmem_size = intel_uncore_read64(&i915->uncore, GEN12_GSMBASE);
+		if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
+			return ERR_PTR(-ENODEV);
+	}
+
 
 	io_start = pci_resource_start(pdev, 2);
 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index a897f4abea0c..5a14e0ca9d4f 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12480,6 +12480,9 @@ enum skl_power_gate {
 #define GEN12_GSMBASE			_MMIO(0x108100)
 #define GEN12_DSMBASE			_MMIO(0x1080C0)
 
+#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
+#define   XEHPSDV_CCS_BASE_SHIFT               8
+
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
 #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
-- 
2.20.1

