Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5694BBFEA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AA410E685;
	Fri, 18 Feb 2022 18:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF0C10E911;
 Fri, 18 Feb 2022 18:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210101; x=1676746101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QPwPhXlY6E60GxXCmIPmPxpHMmRfjfanJdvrFi/OmMg=;
 b=Wve9lVZgV6f4ACXZTqDQdmJXAxxvym/f/1glI7tVmRT1+AvvPWdg8Guk
 wLVtFYZhBeB5kiACsGEAj1fPP1e4B45D3z17hrjGUnW7QRw6b/kMN8ll8
 8K0oLY2Ggi5qVjOdtorwAo4WlfgaocuCiduv4/PFlRnYz2+n9f3rBunBj
 fa4CdzYhRRU+OghzeDyJDgkDsKwqQioJoE79HOXjjkQs4dfS/VPQ3XE9C
 G/F3wU+aq/QsHd9pehuVd2sLy/fn93SmQL+pLJC951/c03ZbhSWOHGtYE
 kDmoYBRtZ54aV9i+EyxbsUfhehCCRF35enP9PklakT4E6jDNcoWq5uWGU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="251388829"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="251388829"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642465"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:18 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/15] drm/i915/lmem: Enable lmem for platforms with Flat CCS
Date: Sat, 19 Feb 2022 00:17:51 +0530
Message-Id: <20220218184752.7524-15-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>, lucas.demarchi@intel.com,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

A portion of device memory is reserved for Flat CCS so usable
device memory will be reduced by size of Flat CCS. Size of
Flat CCS is specified in “XEHPSDV_FLAT_CCS_BASE_ADDR”.
So to get effective device memory we need to subtract
total device memory by Flat CCS memory size.

v2:
  Addressed the small bar related issue [Matt]
  Removed a reduntant check [Matt]
v3:
  reg addr def is moved to intel_gt_regs.h [Lucas]
  removed a variable
  s/DRM_ERROR/drm_err [Lucas]

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 19 +++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  3 +++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 26 +++++++++++++++++++--
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index e8403fa53909..2da7dd0f66d7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -913,6 +913,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
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
index 2dad46c3eff2..0f571c8ee22b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -85,6 +85,7 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 }
 
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
 
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index bf4b942c62ee..935ba793a13b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -906,6 +906,9 @@
 #define XEHP_L3NODEARBCFG			_MMIO(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define XEHPSDV_FLAT_CCS_BASE_ADDR		_MMIO(0x4910)
+#define   XEHPSDV_CCS_BASE_SHIFT		8
+
 #define GEN8_L3SQCREG1				_MMIO(0xb100)
 /*
  * Note that on CHV the following has an off-by-one error wrt. to BSpec.
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index cb3f66707b21..f3f0ce2c553a 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -12,6 +12,7 @@
 #include "gem/i915_gem_region.h"
 #include "gem/i915_gem_ttm.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_regs.h"
 
 static int init_fake_lmem_bar(struct intel_memory_region *mem)
 {
@@ -206,8 +207,29 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (!IS_DGFX(i915))
 		return ERR_PTR(-ENODEV);
 
-	/* Stolen starts from GSMBASE on DG1 */
-	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
+	if (HAS_FLAT_CCS(i915)) {
+		u64 tile_stolen, flat_ccs_base;
+
+		lmem_size = pci_resource_len(pdev, 2);
+		flat_ccs_base = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
+		flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
+
+		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
+			return ERR_PTR(-ENODEV);
+
+		tile_stolen = lmem_size - flat_ccs_base;
+
+		/* If the FLAT_CCS_BASE_ADDR register is not populated, flag an error */
+		if (tile_stolen == lmem_size)
+			drm_err(&i915->drm,
+				"CCS_BASE_ADDR register did not have expected value\n");
+
+		lmem_size -= tile_stolen;
+	} else {
+		/* Stolen starts from GSMBASE without CCS */
+		lmem_size = intel_uncore_read64(&i915->uncore, GEN12_GSMBASE);
+	}
+
 
 	io_start = pci_resource_start(pdev, 2);
 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
-- 
2.20.1

