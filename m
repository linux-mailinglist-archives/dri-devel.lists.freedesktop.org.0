Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 547834ED00F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226D10E374;
	Wed, 30 Mar 2022 23:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47810E1EC;
 Wed, 30 Mar 2022 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682956; x=1680218956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNEqjMxA/kCyHCRBOd8ObGI5nL36g7RNu+QLzo873N0=;
 b=bUSMRWxdi51ZfKMj2NugyjKtqNEJ+e7OpBkXpTnNKpWGTorlD/SNY2JH
 D+QYHhSsepfPumunRz3zuXdgPR1UYVrcMrsLS7YeYQZiGViKi2KQSeYV1
 bgDXL5dmFU9XYLREdOi0SiHEE0I374mhD9uOvjpS1godgintcujwEx5yg
 2rTmH925miGGeNResf/2yZ3814xr+MUwYlv1q5OkV+u+CcHb/dQTCWj21
 C8Ys/lA1wwdWySE7jTkwHXveXRF9fzpWvnlRBgFDjgd84RVdmGqYp2PTp
 CLFr6RqliBwy7vBc+1Wc8DPvfpWgYmPI2dLcWeggI1pl02KZjP3KRpWZV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582508"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052000"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/15] drm/i915/xehp: Check for faults on all mslices
Date: Wed, 30 Mar 2022 16:28:48 -0700
Message-Id: <20220330232858.3204283-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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

The fault registers are multicast registers, replicated per-mslice
starting on Xe_HP.  When checking for faults, we should check each
mslice's instance of the register rather than just one of the instances.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c      | 44 ++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  3 ++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 5001a6168d56..1992325c2895 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -350,6 +350,46 @@ static void gen6_check_faults(struct intel_gt *gt)
 	}
 }
 
+static void xehp_check_faults(struct intel_gt *gt)
+{
+	struct intel_uncore *uncore = gt->uncore;
+	u32 fault;
+	int mslice;
+
+	/* Check each mslice's fault register */
+	for (mslice = 0; mslice < 4; mslice++) {
+		fault = intel_uncore_read_with_mcr_steering(uncore,
+							    XEHP_RING_FAULT_REG,
+							    mslice, 0);
+		if (fault & RING_FAULT_VALID) {
+			u32 fault_data0, fault_data1;
+			u64 fault_addr;
+
+			fault_data0 = intel_uncore_read_with_mcr_steering(uncore,
+									  XEHP_FAULT_TLB_DATA0,
+									  mslice, 0);
+			fault_data1 = intel_uncore_read_with_mcr_steering(uncore,
+									  XEHP_FAULT_TLB_DATA1,
+									  mslice, 0);
+
+			fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
+				     ((u64)fault_data0 << 12);
+
+			drm_dbg(&uncore->i915->drm, "Unexpected fault\n"
+				"\tAddr: 0x%08x_%08x\n"
+				"\tAddress space: %s\n"
+				"\tEngine ID: %d\n"
+				"\tSource ID: %d\n"
+				"\tType: %d\n",
+				upper_32_bits(fault_addr), lower_32_bits(fault_addr),
+				fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
+				GEN8_RING_FAULT_ENGINE_ID(fault),
+				RING_FAULT_SRCID(fault),
+				RING_FAULT_FAULT_TYPE(fault));
+		}
+	}
+}
+
 static void gen8_check_faults(struct intel_gt *gt)
 {
 	struct intel_uncore *uncore = gt->uncore;
@@ -396,7 +436,9 @@ void intel_gt_check_and_clear_faults(struct intel_gt *gt)
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
index 0f05bbda773e..a060de66126a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -966,11 +966,14 @@
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
2.34.1

