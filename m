Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6FB66E7AD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 21:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1910E352;
	Tue, 17 Jan 2023 20:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7898910E352;
 Tue, 17 Jan 2023 20:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673987194; x=1705523194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dStcdiVsxKAZTBnk9p0DjSglhoSY17VcKtVooA+ln6w=;
 b=Wl+YOFNZNE4jxaTd9FLkHAWlE6zA+QEMKEpFMU2tEQLxYN+5+VFE6xQ6
 NgIlCAzf+ryVv5mzCIm2e4V0DhT39h/OOpwCi7xEVMIlBoQojZ6q6t1xz
 7bGlny33lGV4LCLJSPxr4TeRjagNDPuCfJXOp8aVHq5JOqD3surNyAhYD
 Nqs7r+0ZKstp0I5vGXuhYOa1v0mgRHI5sOZ+q3BGU1fZIFjr5yzWEyIK1
 ePw9LmBQWb7JPgJLMdl5DV1iHr9MmL8b/g00eMA6tPmsS0WTxHwHpqQQA
 WMNfGjdnFm9DAKPJ9xefxlQ9aqbNGo8H9csulyLJTSb4xGG0a1aFFe51M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326883059"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326883059"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 12:26:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833300307"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="833300307"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 12:26:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Move/adjust register definitions related to
 Wa_22011450934
Date: Tue, 17 Jan 2023 12:26:27 -0800
Message-Id: <20230117202627.4134579-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.0
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

The implementation of Wa_22011450934 introduced three new register
definitions in i915_reg.h that didn't get moved to the GT/engine
register headers when all the other registers moved; let's move them to
the appropriate headers and tidy up their definitions now for
consistency:

 - STATE_ACK_DEBUG is moved to the engine register header and converted
   to a parameterized definition; the workaround only needs the RCS
   instance to be programmed, but there are instances on other engines
   that could be used by other workarounds in the future.

 - The two CULLBIT registers move to the GT register header.  Since
   they belong to MMIO ranges that became MCR starting with Xe_HP,
   their definitions should be defined as MCR_REG() and use an Xe_HP
   prefix to keep the register semantics clear.

Note that the MCR definition is just for consistency and to prevent
accidental misuse if other workarounds related to these registers show
up in the future.  There's no functional change to today's driver since
the workaround that references these registers only accesses them via
MI_LRR engine instructions.  Engine-initiated register accesses do not
utilize the same same steering controls as CPU-initiated accesses; they
use a different steering control register (0x20CC) which is initialized
to a non-terminated DSS target by pre-OS firmware and never changed
thereafter (i915 does not touch it and userspace does not have
permission to change that register).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_regs.h | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 4 ++++
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 6 +++---
 drivers/gpu/drm/i915/i915_reg.h             | 4 ----
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
index ee3efd06ee54..6b9d9f837669 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
@@ -81,6 +81,7 @@
 #define RING_EIR(base)				_MMIO((base) + 0xb0)
 #define RING_EMR(base)				_MMIO((base) + 0xb4)
 #define RING_ESR(base)				_MMIO((base) + 0xb8)
+#define GEN12_STATE_ACK_DEBUG(base)		_MMIO((base) + 0xbc)
 #define RING_INSTPM(base)			_MMIO((base) + 0xc0)
 #define RING_CMD_CCTL(base)			_MMIO((base) + 0xc4)
 #define ACTHD(base)				_MMIO((base) + 0xc8)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 4f5c06d60bcd..4a4bab261e66 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -407,6 +407,8 @@
 #define GEN9_WM_CHICKEN3			_MMIO(0x5588)
 #define   GEN9_FACTOR_IN_CLR_VAL_HIZ		(1 << 9)
 
+#define XEHP_CULLBIT1				MCR_REG(0x6100)
+
 #define CHICKEN_RASTER_1			MCR_REG(0x6204)
 #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
 
@@ -457,6 +459,8 @@
 #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
 #define   BDW_HIZ_POWER_COMPILER_CLOCK_GATING_DISABLE	REG_BIT(3)
 
+#define XEHP_CULLBIT2				MCR_REG(0x7030)
+
 #define GEN8_L3CNTLREG				_MMIO(0x7034)
 #define   GEN8_ERRDETBCTRL			(1 << 9)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7771a19008c6..1dffe392b95c 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1351,16 +1351,16 @@ static u32 *
 dg2_emit_rcs_hang_wabb(const struct intel_context *ce, u32 *cs)
 {
 	*cs++ = MI_LOAD_REGISTER_IMM(1);
-	*cs++ = i915_mmio_reg_offset(GEN12_STATE_ACK_DEBUG);
+	*cs++ = i915_mmio_reg_offset(GEN12_STATE_ACK_DEBUG(ce->engine->mmio_base));
 	*cs++ = 0x21;
 
 	*cs++ = MI_LOAD_REGISTER_REG;
 	*cs++ = i915_mmio_reg_offset(RING_NOPID(ce->engine->mmio_base));
-	*cs++ = i915_mmio_reg_offset(GEN12_CULLBIT1);
+	*cs++ = i915_mmio_reg_offset(XEHP_CULLBIT1);
 
 	*cs++ = MI_LOAD_REGISTER_REG;
 	*cs++ = i915_mmio_reg_offset(RING_NOPID(ce->engine->mmio_base));
-	*cs++ = i915_mmio_reg_offset(GEN12_CULLBIT2);
+	*cs++ = i915_mmio_reg_offset(XEHP_CULLBIT2);
 
 	return cs;
 }
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 8b2cf980f323..d30443f06bdd 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8113,10 +8113,6 @@ enum skl_power_gate {
 #define CLKGATE_DIS_MISC			_MMIO(0x46534)
 #define  CLKGATE_DIS_MISC_DMASC_GATING_DIS	REG_BIT(21)
 
-#define GEN12_CULLBIT1			_MMIO(0x6100)
-#define GEN12_CULLBIT2			_MMIO(0x7030)
-#define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
-
 #define _MTL_CLKGATE_DIS_TRANS_A			0x604E8
 #define _MTL_CLKGATE_DIS_TRANS_B			0x614E8
 #define MTL_CLKGATE_DIS_TRANS(trans)			_MMIO_TRANS2(trans, _MTL_CLKGATE_DIS_TRANS_A)
-- 
2.39.0

