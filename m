Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF14A5A49
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E354310EBF7;
	Tue,  1 Feb 2022 10:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D089010EC05;
 Tue,  1 Feb 2022 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712124; x=1675248124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PlrjSypRxZ548k4SP0ekudu1X4dlIQEvgQtB2LE6+7Q=;
 b=YuU8Mxihy6wgjHVQzx7fSsxAiVQv6yc6QEREV8Bq089y66hJMJs9Xo8R
 jgg4l2a9s2pQ4AiD25km09VSVqt2JDBBTfdcPo03s6a/vd8om0ujn4kb0
 CbxL/pCbPmWxRVOdfzNe+RjXUT0M0dwBi7px7zSfl8Oxmw2UrtOSLFEhw
 6rfS+v6NwNBzDP3ab+z/rx4ub7EooIj7Fh4rKFppmm3GJNIwlw0osyu2N
 zn4jHoJw3awxQuvnyCbDdKjTWIHbNcGjXikTgXcQPFDMCvgX7M+Y9MXYG
 OmSZeZJtGbMTufZYyhv+LHT4Ortb30KXV7VHgoOtuzEAPbnrIDsceG4Qp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020626"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020626"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011252"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:02 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 11/19] drm/i915/lmem: Enable lmem for platforms with Flat
 CCS
Date: Tue,  1 Feb 2022 16:11:24 +0530
Message-Id: <20220201104132.3050-12-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
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

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 24 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h             |  3 +++
 4 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f59933abbb3a..e40d98cb3a2d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -911,6 +911,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
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
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 21215a080088..f1d37b46b505 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -205,8 +205,28 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
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
+
+		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
+			return ERR_PTR(-ENODEV);
+
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
+	}
+
 
 	io_start = pci_resource_start(pdev, 2);
 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0f36af8dc3a1..9b5423572fe9 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -11651,6 +11651,9 @@ enum skl_power_gate {
 #define   SGGI_DIS			REG_BIT(15)
 #define   SGR_DIS			REG_BIT(13)
 
+#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
+#define   XEHPSDV_CCS_BASE_SHIFT               8
+
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
 #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
-- 
2.20.1

