Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A184D9084
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 00:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A7210E1D7;
	Mon, 14 Mar 2022 23:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8142789F8B;
 Mon, 14 Mar 2022 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647301330; x=1678837330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OizfX+XKo6M/lAi36LbJP+jiDe/BkdnpLNiwldVZxEs=;
 b=FEGQjle5o46PlnQ5l6HS4oSoAl3FBTYJB+zCC3susvI24NpVjTK0WtdN
 zq1I9SL7/ybFHDcEzqBkU3UTzB6ZR4FBOssLeWf1Bjrx/PEqKwUHR36rT
 MNaeCtN4oXqmistxCx+wZJBd3EomU5UGHiENoPurfTL5DBOxIreamFsgV
 uyzxBzVtKP/7NPCdBM4jyvianzevWa5d9c9kzdMihfSQ5PdlEuCkC6pqM
 ZGmFpccBLYJcR9XZ9kinyT2aBdfLjzTDURKJzRbDTPXad0V2HkZ6R1mbj
 Cb1eCUJVRcazppJaDh1hFtv8u1sQMiRLpVD5XX0TJygT1ncsNP2qOCT9y w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256359969"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="256359969"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:42:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="549403066"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 16:42:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Add support for steered register writes
Date: Mon, 14 Mar 2022 16:42:03 -0700
Message-Id: <20220314234203.799268-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314234203.799268-1-matthew.d.roper@intel.com>
References: <20220314234203.799268-1-matthew.d.roper@intel.com>
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
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcoming patches will need to steer writes to multicast registers as
well as reading them.

Although the setting of the 'multicast' bit should only really matter
for write operations (reads always operate in a unicast manner and give
us the result from one specific instance), Wa_22013088509 suggests that
we leave the multicast bit enabled when performing read operations, so
we follow suit here.

Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 drivers/gpu/drm/i915/intel_uncore.c     | 75 ++++++++++++++++++++++---
 drivers/gpu/drm/i915/intel_uncore.h     |  4 +-
 3 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 19cd34f24263..62e0f075b1de 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -46,6 +46,7 @@
 #define   GEN8_MCR_SLICE_MASK			GEN8_MCR_SLICE(3)
 #define   GEN8_MCR_SUBSLICE(subslice)		(((subslice) & 3) << 24)
 #define   GEN8_MCR_SUBSLICE_MASK		GEN8_MCR_SUBSLICE(3)
+#define   GEN11_MCR_MULTICAST			REG_BIT(31)
 #define   GEN11_MCR_SLICE(slice)		(((slice) & 0xf) << 27)
 #define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
 #define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index dd8fdd5863de..ef8ffc01ad19 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2464,17 +2464,46 @@ intel_uncore_forcewake_for_reg(struct intel_uncore *uncore,
 	return fw_domains;
 }
 
-u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
-					   i915_reg_t reg,
-					   int slice, int subslice)
+/**
+ * uncore_rw_with_mcr_steering_fw - Access a register after programming
+ *				    the MCR selector register.
+ * @uncore: pointer to struct intel_uncore
+ * @reg: register being accessed
+ * @rw_flag: FW_REG_READ for read access or FW_REG_WRITE for write access
+ * @slice: slice number (ignored for multi-cast write)
+ * @subslice: sub-slice number (ignored for multi-cast write)
+ * @value: register value to be written (ignored for read)
+ *
+ * Return: 0 for write access. register value for read access.
+ *
+ * Caller needs to make sure the relevant forcewake wells are up.
+ */
+static u32 uncore_rw_with_mcr_steering_fw(struct intel_uncore *uncore,
+					  i915_reg_t reg, u8 rw_flag,
+					  int slice, int subslice, u32 value)
 {
-	u32 mcr_mask, mcr_ss, mcr, old_mcr, val;
+	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
 
 	lockdep_assert_held(&uncore->lock);
 
 	if (GRAPHICS_VER(uncore->i915) >= 11) {
 		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN11_MCR_SLICE(slice) | GEN11_MCR_SUBSLICE(subslice);
+
+		/*
+		 * Wa_22013088509
+		 *
+		 * The setting of the multicast/unicast bit usually wouldn't
+		 * matter for read operations (which always return the value
+		 * from a single register instance regardless of how that bit
+		 * is set), but some platforms have a workaround requiring us
+		 * to remain in multicast mode for reads.  There's no real
+		 * downside to this, so we'll just go ahead and do so on all
+		 * platforms; we'll only clear the multicast bit from the mask
+		 * when exlicitly doing a write operation.
+		 */
+		if (rw_flag == FW_REG_WRITE)
+			mcr_mask |= GEN11_MCR_MULTICAST;
 	} else {
 		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN8_MCR_SLICE(slice) | GEN8_MCR_SUBSLICE(subslice);
@@ -2486,7 +2515,10 @@ u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
 	mcr |= mcr_ss;
 	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
 
-	val = intel_uncore_read_fw(uncore, reg);
+	if (rw_flag == FW_REG_READ)
+		val = intel_uncore_read_fw(uncore, reg);
+	else
+		intel_uncore_write_fw(uncore, reg, value);
 
 	mcr &= ~mcr_mask;
 	mcr |= old_mcr & mcr_mask;
@@ -2496,14 +2528,16 @@ u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
 	return val;
 }
 
-u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
-					i915_reg_t reg, int slice, int subslice)
+static u32 uncore_rw_with_mcr_steering(struct intel_uncore *uncore,
+				       i915_reg_t reg, u8 rw_flag,
+				       int slice, int subslice,
+				       u32 value)
 {
 	enum forcewake_domains fw_domains;
 	u32 val;
 
 	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg,
-						    FW_REG_READ);
+						    rw_flag);
 	fw_domains |= intel_uncore_forcewake_for_reg(uncore,
 						     GEN8_MCR_SELECTOR,
 						     FW_REG_READ | FW_REG_WRITE);
@@ -2511,7 +2545,8 @@ u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
 	spin_lock_irq(&uncore->lock);
 	intel_uncore_forcewake_get__locked(uncore, fw_domains);
 
-	val = intel_uncore_read_with_mcr_steering_fw(uncore, reg, slice, subslice);
+	val = uncore_rw_with_mcr_steering_fw(uncore, reg, rw_flag,
+					     slice, subslice, value);
 
 	intel_uncore_forcewake_put__locked(uncore, fw_domains);
 	spin_unlock_irq(&uncore->lock);
@@ -2519,6 +2554,28 @@ u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
 	return val;
 }
 
+u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
+					   i915_reg_t reg, int slice, int subslice)
+{
+	return uncore_rw_with_mcr_steering_fw(uncore, reg, FW_REG_READ,
+					      slice, subslice, 0);
+}
+
+u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
+					i915_reg_t reg, int slice, int subslice)
+{
+	return uncore_rw_with_mcr_steering(uncore, reg, FW_REG_READ,
+					   slice, subslice, 0);
+}
+
+void intel_uncore_write_with_mcr_steering(struct intel_uncore *uncore,
+					  i915_reg_t reg, u32 value,
+					  int slice, int subslice)
+{
+	uncore_rw_with_mcr_steering(uncore, reg, FW_REG_WRITE,
+				    slice, subslice, value);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/mock_uncore.c"
 #include "selftests/intel_uncore.c"
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 6ff56d673e2b..9a760952d46a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -214,7 +214,9 @@ u32 intel_uncore_read_with_mcr_steering_fw(struct intel_uncore *uncore,
 					   int slice, int subslice);
 u32 intel_uncore_read_with_mcr_steering(struct intel_uncore *uncore,
 					i915_reg_t reg,	int slice, int subslice);
-
+void intel_uncore_write_with_mcr_steering(struct intel_uncore *uncore,
+					  i915_reg_t reg, u32 value,
+					  int slice, int subslice);
 void
 intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug);
 void intel_uncore_init_early(struct intel_uncore *uncore,
-- 
2.34.1

