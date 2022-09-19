Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938015BD771
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6810C10E1D6;
	Mon, 19 Sep 2022 22:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CE910E19A;
 Mon, 19 Sep 2022 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663626789; x=1695162789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYF1BhUp/yCq1FihKa4Bemy96kX9J1XNaWz+itOW3yo=;
 b=AEXJovwCyBKGGRqrVS/cdRKRF3fZollSYC5jxFwV2Y5XLtuR4Ytxrkud
 zC9dUaZMPN7hpR0KsFtqOEF+LUwoUDwr3O2kn/uXBpt/vSs4hvxoAIpes
 v8W++KYpoYxtLLDtQXZL4zKkhkI3/Z462VOiXdu6MaDpAeFShPhZJK73k
 pSusXwzt3tmwDNkLTBSBFLDET5MMqSrFFyfTiw5wSqUt4WC1ETAVf+gx/
 +vklPBgPWxHlvPpgO0reSMPQx9/AZxZFZbYQBo9UB93S4tsr2Gx6iz/p1
 Xs7RMlJwV9naVJOMT3Of1PjuGRbndVEstxHS0+5SCRjFqjplZRvGX7LIm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="286585481"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="286585481"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794030770"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/12] drm/i915/xehp: Check for faults on primary GAM
Date: Mon, 19 Sep 2022 15:32:52 -0700
Message-Id: <20220919223259.263525-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919223259.263525-1-matthew.d.roper@intel.com>
References: <20220919223259.263525-1-matthew.d.roper@intel.com>
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

On Xe_HP the fault registers are now in a multicast register range.
However as part of the GAM these registers follow special rules and we
need only read from the "primary" GAM's instance to get the information
we need.  So a single intel_gt_mcr_read_any() (which will automatically
steer to the primary GAM) is sufficient; we don't need to loop over each
instance of the MCR register.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c      | 40 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  3 ++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 5ddae95d4886..1cb7dd40ec47 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -304,6 +304,42 @@ static void gen6_check_faults(struct intel_gt *gt)
 	}
 }
 
+static void xehp_check_faults(struct intel_gt *gt)
+{
+	u32 fault;
+
+	/*
+	 * Although the fault register now lives in an MCR register range,
+	 * the GAM registers are special and we only truly need to read
+	 * the "primary" GAM instance rather than handling each instance
+	 * individually.  intel_gt_mcr_read_any() will automatically steer
+	 * toward the primary instance.
+	 */
+	fault = intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
+	if (fault & RING_FAULT_VALID) {
+		u32 fault_data0, fault_data1;
+		u64 fault_addr;
+
+		fault_data0 = intel_gt_mcr_read_any(gt, XEHP_FAULT_TLB_DATA0);
+		fault_data1 = intel_gt_mcr_read_any(gt, XEHP_FAULT_TLB_DATA1);
+
+		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
+			     ((u64)fault_data0 << 12);
+
+		drm_dbg(&gt->i915->drm, "Unexpected fault\n"
+			"\tAddr: 0x%08x_%08x\n"
+			"\tAddress space: %s\n"
+			"\tEngine ID: %d\n"
+			"\tSource ID: %d\n"
+			"\tType: %d\n",
+			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
+			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
+			GEN8_RING_FAULT_ENGINE_ID(fault),
+			RING_FAULT_SRCID(fault),
+			RING_FAULT_FAULT_TYPE(fault));
+	}
+}
+
 static void gen8_check_faults(struct intel_gt *gt)
 {
 	struct intel_uncore *uncore = gt->uncore;
@@ -350,7 +386,9 @@ void intel_gt_check_and_clear_faults(struct intel_gt *gt)
 	struct drm_i915_private *i915 = gt->i915;
 
 	/* From GEN8 onwards we only have one 'All Engine Fault Register' */
-	if (GRAPHICS_VER(i915) >= 8)
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+		xehp_check_faults(gt);
+	else if (GRAPHICS_VER(i915) >= 8)
 		gen8_check_faults(gt);
 	else if (GRAPHICS_VER(i915) >= 6)
 		gen6_check_faults(gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index cf87a1b36a21..dff38b0c4430 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1024,11 +1024,14 @@
 #define GEN9_BLT_MOCS(i)			_MMIO(__GEN9_BCS0_MOCS0 + (i) * 4)
 
 #define GEN12_FAULT_TLB_DATA0			_MMIO(0xceb8)
+#define XEHP_FAULT_TLB_DATA0			_MMIO(0xceb8)
 #define GEN12_FAULT_TLB_DATA1			_MMIO(0xcebc)
+#define XEHP_FAULT_TLB_DATA1			_MMIO(0xcebc)
 #define   FAULT_VA_HIGH_BITS			(0xf << 0)
 #define   FAULT_GTT_SEL				(1 << 4)
 
 #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
+#define XEHP_RING_FAULT_REG			_MMIO(0xcec4)
 #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
 #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
 #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
-- 
2.37.3

