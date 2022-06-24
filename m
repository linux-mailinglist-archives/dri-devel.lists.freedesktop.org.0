Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13C55A33C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939FE89AAD;
	Fri, 24 Jun 2022 21:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2AE899B7;
 Fri, 24 Jun 2022 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656104633; x=1687640633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5LgnosP1tpB9AxMJ/rgUsLegY9QeXjOAsfsrE5tGjg=;
 b=czaezzj5XkVaZuZXHONnWApR7ZvUTEDm8kl+jCWmnc6MqyUY51t1+14r
 TGA0t5Bro3XrUS9Wj5DVospWM65JqSYF4WiCGrZ8UKklm5+1G/B4GYwhF
 bG+5YOrYAF1B/FiVDIIj0Og/TU1B5LwUsUYEoIUhLNQmk5Su8m/Tqq6lV
 U+GvfNaIFtvqP/Ixgh9+WowvYCcCKBr9tTGa2WjegqdFkfHL7NI/25snI
 T9U56zri7LLY5cWywEvMNQiVFEDy7Ze2FR1vqPDcgqQrTeopI0d6J6r+P
 Zya87W6YIHlA/wo+rv0uFxorlo5m0F0FAgqTDv1tAx0QZvZA1lJ3AFefZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="367411086"
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="367411086"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 14:03:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,220,1650956400"; d="scan'208";a="593387305"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 14:03:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Prefer "XEHP_" prefix for registers
Date: Fri, 24 Jun 2022 14:03:28 -0700
Message-Id: <20220624210328.308630-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624210328.308630-1-matthew.d.roper@intel.com>
References: <20220624210328.308630-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've been introducing new registers with a mix of "XEHP_"
(architecture) and "XEHPSDV_" (platform) prefixes.  For consistency,
let's settle on "XEHP_" as the preferred form.

XEHPSDV_RP_STATE_CAP stays with its current name since that's truly a
platform-specific register and not something that applies to the Xe_HP
architecture as a whole.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  | 4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 8 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 4 ++--
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 8 ++++----
 drivers/gpu/drm/i915/i915_reg.h             | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index e63de9c06596..166d0a4b9e8c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -836,8 +836,8 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	} else {
 		resource_size_t lmem_range;
 
-		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
-		lmem_size = lmem_range >> XEHPSDV_TILE_LMEM_RANGE_SHIFT;
+		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
+		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
 		lmem_size *= SZ_1G;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 61815b6e87de..37c1095d8603 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -324,11 +324,11 @@
 
 #define GEN12_PAT_INDEX(index)			_MMIO(0x4800 + (index) * 4)
 
-#define XEHPSDV_TILE0_ADDR_RANGE		_MMIO(0x4900)
-#define   XEHPSDV_TILE_LMEM_RANGE_SHIFT		8
+#define XEHP_TILE0_ADDR_RANGE			_MMIO(0x4900)
+#define   XEHP_TILE_LMEM_RANGE_SHIFT		8
 
-#define XEHPSDV_FLAT_CCS_BASE_ADDR		_MMIO(0x4910)
-#define   XEHPSDV_CCS_BASE_SHIFT		8
+#define XEHP_FLAT_CCS_BASE_ADDR			_MMIO(0x4910)
+#define   XEHP_CCS_BASE_SHIFT			8
 
 #define GAMTARBMODE				_MMIO(0x4a08)
 #define   ARB_MODE_BWGTLB_DISABLE		(1 << 9)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index ae8a8f725f01..73a8b46e0234 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -679,7 +679,7 @@ static ssize_t media_RP0_freq_mhz_show(struct device *dev,
 	u32 val;
 	int err;
 
-	err = snb_pcode_read_p(gt->uncore, XEHPSDV_PCODE_FREQUENCY_CONFIG,
+	err = snb_pcode_read_p(gt->uncore, XEHP_PCODE_FREQUENCY_CONFIG,
 			       PCODE_MBOX_FC_SC_READ_FUSED_P0,
 			       PCODE_MBOX_DOMAIN_MEDIAFF, &val);
 
@@ -700,7 +700,7 @@ static ssize_t media_RPn_freq_mhz_show(struct device *dev,
 	u32 val;
 	int err;
 
-	err = snb_pcode_read_p(gt->uncore, XEHPSDV_PCODE_FREQUENCY_CONFIG,
+	err = snb_pcode_read_p(gt->uncore, XEHP_PCODE_FREQUENCY_CONFIG,
 			       PCODE_MBOX_FC_SC_READ_FUSED_PN,
 			       PCODE_MBOX_DOMAIN_MEDIAFF, &val);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 2ff448047020..d09b996a9759 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -105,12 +105,12 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 		resource_size_t lmem_range;
 		u64 tile_stolen, flat_ccs_base;
 
-		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHPSDV_TILE0_ADDR_RANGE) & 0xFFFF;
-		lmem_size = lmem_range >> XEHPSDV_TILE_LMEM_RANGE_SHIFT;
+		lmem_range = intel_gt_mcr_read_any(&i915->gt0, XEHP_TILE0_ADDR_RANGE) & 0xFFFF;
+		lmem_size = lmem_range >> XEHP_TILE_LMEM_RANGE_SHIFT;
 		lmem_size *= SZ_1G;
 
-		flat_ccs_base = intel_gt_mcr_read_any(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
-		flat_ccs_base = (flat_ccs_base >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
+		flat_ccs_base = intel_gt_mcr_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
+		flat_ccs_base = (flat_ccs_base >> XEHP_CCS_BASE_SHIFT) * SZ_64K;
 
 		/* FIXME: Remove this when we have small-bar enabled */
 		if (pci_resource_len(pdev, 2) < lmem_size) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index cf5e16abf6c7..643d7f020a4a 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6767,12 +6767,12 @@
 #define     DG1_UNCORE_GET_INIT_STATUS		0x0
 #define     DG1_UNCORE_INIT_STATUS_COMPLETE	0x1
 #define GEN12_PCODE_READ_SAGV_BLOCK_TIME_US	0x23
-#define   XEHPSDV_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
-/* XEHPSDV_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define   XEHP_PCODE_FREQUENCY_CONFIG		0x6e	/* xehpsdv, pvc */
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
 #define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
 /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
-/*   XEHPSDV_PCODE_FREQUENCY_CONFIG param2 */
+/*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
 #define     PCODE_MBOX_DOMAIN_NONE		0x0
 #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
 #define GEN6_PCODE_DATA				_MMIO(0x138128)
-- 
2.36.1

