Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36854ED024
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D3B89A08;
	Wed, 30 Mar 2022 23:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981110E20F;
 Wed, 30 Mar 2022 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682957; x=1680218957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EeT9nLMUruDD79FQZIhceVF2pcPEzcP6V2Gcqjv+eTE=;
 b=Y/zG6xM4010qQo/TpxSusWyvakYlEnuiPJKb8Pu3jnkFn8RM4LfzzwdS
 2awXLY/Q0ifAHkhslb8zvL+JaIaGyyveOcPia6JAhLuH5Ft36QzuAjkQW
 by6wBO1yB2PxM+r0tjKadmzdt2kV87UI9fMj9xwRyHauyFAHjWLSQimd4
 YDG5SwGhPBE3UIGHKwDvpwSUHSzhrf3vsbUigOgJfzXtro7/feg+QUP6l
 geWyJ0gLdMFV+/UYYHUV7o43Qn1X4nldaIlGWTtsh8A+YXnNANylGJKj9
 SQlU5SatXaSdMSccUUcSL/P9RH38ZlkCSC6+of2Po2y5gQeYmxIlRS5mW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582518"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582518"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052031"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/15] drm/i915: Define multicast registers as a new type
Date: Wed, 30 Mar 2022 16:28:57 -0700
Message-Id: <20220330232858.3204283-15-matthew.d.roper@intel.com>
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

Rather than treating multicast registers as 'i915_reg_t' let's define
them as a completely new type.  This will allow the compiler to help us
make sure we're using multicast-aware functions to operate on multicast
registers.

This plan does break down a bit in places where we're just maintaining
heterogeneous lists of registers (e.g., various MMIO whitelists used by
perf, GVT, etc.) rather than performing reads/writes.  We only really
care about the offset in those cases, so for now we can "cast" the
registers as non-MCR, leaving us with a list of i915_reg_t's, but we may
want to look for better ways to store mixed collections of i915_reg_t
and i915_mcr_reg_t in the future.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        | 49 ++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h        | 14 +++---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 27 +++++++---
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  6 +--
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 32 +++++++-----
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  4 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           | 17 ++++---
 drivers/gpu/drm/i915/gvt/mmio_context.c       | 14 +++---
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_reg_defs.h          |  9 ++++
 13 files changed, 113 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index c8e52d625f18..a9a9fa6881f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -103,6 +103,19 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 	}
 }
 
+/*
+ * Although the rest of the driver should use MCR-specific functions to
+ * read/write MCR registers, we still use the regular intel_uncore_* functions
+ * internally to implement those, so we need a way for the functions in this
+ * file to "cast" an i915_mcr_reg_t into an i915_reg_t.
+ */
+static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
+{
+	i915_reg_t r = { .reg = mcr.mmio };
+
+	return r;
+}
+
 /*
  * rw_with_mcr_steering_fw - Access a register with specific MCR steering
  * @uncore: pointer to struct intel_uncore
@@ -117,7 +130,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
  * Caller needs to make sure the relevant forcewake wells are up.
  */
 static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
-				   i915_reg_t reg, u8 rw_flag,
+				   i915_mcr_reg_t reg, u8 rw_flag,
 				   int group, int instance, u32 value)
 {
 	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
@@ -154,9 +167,9 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
 
 	if (rw_flag == FW_REG_READ)
-		val = intel_uncore_read_fw(uncore, reg);
+		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
 	else
-		intel_uncore_write_fw(uncore, reg, value);
+		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
 
 	mcr &= ~mcr_mask;
 	mcr |= old_mcr & mcr_mask;
@@ -167,14 +180,14 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 }
 
 static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
-				i915_reg_t reg, u8 rw_flag,
+				i915_mcr_reg_t reg, u8 rw_flag,
 				int group, int instance,
 				u32 value)
 {
 	enum forcewake_domains fw_domains;
 	u32 val;
 
-	fw_domains = intel_uncore_forcewake_for_reg(uncore, reg,
+	fw_domains = intel_uncore_forcewake_for_reg(uncore, mcr_reg_cast(reg),
 						    rw_flag);
 	fw_domains |= intel_uncore_forcewake_for_reg(uncore,
 						     GEN8_MCR_SELECTOR,
@@ -203,7 +216,7 @@ static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
  * group/instance.
  */
 u32 intel_gt_mcr_read(struct intel_gt *gt,
-		      i915_reg_t reg,
+		      i915_mcr_reg_t reg,
 		      int group, int instance)
 {
 	return rw_with_mcr_steering(gt->uncore, reg, FW_REG_READ,
@@ -222,7 +235,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
  * group/instance.
  */
 void intel_gt_mcr_unicast_write(struct intel_gt *gt,
-				i915_reg_t reg, u32 value,
+				i915_mcr_reg_t reg, u32 value,
 				int group, int instance)
 {
 	rw_with_mcr_steering(gt->uncore, reg, FW_REG_WRITE,
@@ -238,9 +251,9 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt,
  * Write an MCR register in multicast mode to update all instances.
  */
 void intel_gt_mcr_multicast_write(struct intel_gt *gt,
-				i915_reg_t reg, u32 value)
+				i915_mcr_reg_t reg, u32 value)
 {
-	intel_uncore_write(gt->uncore, reg, value);
+	intel_uncore_write(gt->uncore, mcr_reg_cast(reg), value);
 }
 
 /**
@@ -253,9 +266,9 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
  * must already be holding any required forcewake.
  */
 void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
-				i915_reg_t reg, u32 value)
+				     i915_mcr_reg_t reg, u32 value)
 {
-	intel_uncore_write_fw(gt->uncore, reg, value);
+	intel_uncore_write_fw(gt->uncore, mcr_reg_cast(reg), value);
 }
 
 /*
@@ -273,10 +286,10 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
  * for @type steering too.
  */
 static bool reg_needs_read_steering(struct intel_gt *gt,
-				    i915_reg_t reg,
+				    i915_mcr_reg_t reg,
 				    enum intel_steering_type type)
 {
-	const u32 offset = i915_mmio_reg_offset(reg);
+	const u32 offset = i915_mmio_reg_offset(mcr_reg_cast(reg));
 	const struct intel_mmio_range *entry;
 
 	if (likely(!gt->steering_table[type]))
@@ -348,7 +361,7 @@ static void get_valid_steering(struct intel_gt *gt,
  * steering.
  */
 void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
-					     i915_reg_t reg,
+					     i915_mcr_reg_t reg,
 					     u8 *group, u8 *instance)
 {
 	int type;
@@ -377,7 +390,7 @@ void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
  *
  * Returns the value from a valid instance of @reg.
  */
-u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
+u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
 {
 	int type;
 	u8 group, instance;
@@ -391,10 +404,10 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
 		}
 	}
 
-	return intel_uncore_read_fw(gt->uncore, reg);
+	return intel_uncore_read_fw(gt->uncore, mcr_reg_cast(reg));
 }
 
-u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
+u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
 {
 	int type;
 	u8 group, instance;
@@ -408,7 +421,7 @@ u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
 		}
 	}
 
-	return intel_uncore_read(gt->uncore, reg);
+	return intel_uncore_read(gt->uncore, mcr_reg_cast(reg));
 }
 
 static void report_steering_type(struct drm_printer *p,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 506b0cbc8db3..176501ea5926 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -11,21 +11,21 @@
 void intel_gt_mcr_init(struct intel_gt *gt);
 
 u32 intel_gt_mcr_read(struct intel_gt *gt,
-		      i915_reg_t reg,
+		      i915_mcr_reg_t reg,
 		      int group, int instance);
-u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg);
-u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg);
+u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg);
+u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg);
 
 void intel_gt_mcr_unicast_write(struct intel_gt *gt,
-				i915_reg_t reg, u32 value,
+				i915_mcr_reg_t reg, u32 value,
 				int group, int instance);
 void intel_gt_mcr_multicast_write(struct intel_gt *gt,
-				  i915_reg_t reg, u32 value);
+				  i915_mcr_reg_t reg, u32 value);
 void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt,
-				     i915_reg_t reg, u32 value);
+				     i915_mcr_reg_t reg, u32 value);
 
 void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
-					     i915_reg_t reg,
+					     i915_mcr_reg_t reg,
 					     u8 *group, u8 *instance);
 
 void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 3f5e01a48a17..926fb6a8558d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -8,7 +8,18 @@
 
 #include "i915_reg_defs.h"
 
-#define MCR_REG(offset)	_MMIO(offset)
+#define MCR_REG(offset)	((const i915_mcr_reg_t){ .mmio = (offset) })
+
+/*
+ * The perf control registers are technically multicast registers, but the
+ * driver never needs to read/write them directly; we only use them to build
+ * lists of registers (where they're mixed in with other non-MCR registers)
+ * and then operate on the offset directly.  For now we'll just define them
+ * as non-multicast so we can place them on the same list, but we may want
+ * to try to come up with a better way to handle heterogeneous lists of
+ * registers in the future.
+ */
+#define PERF_REG(offset)			_MMIO(offset)
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
@@ -1048,8 +1059,8 @@
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 #define   FLOAT_BLEND_OPTIMIZATION_ENABLE	REG_BIT(4)
 
-#define EU_PERF_CNTL0				MCR_REG(0xe458)
-#define EU_PERF_CNTL4				MCR_REG(0xe45c)
+#define EU_PERF_CNTL0				PERF_REG(0xe458)
+#define EU_PERF_CNTL4				PERF_REG(0xe45c)
 
 #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
 #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
@@ -1082,16 +1093,16 @@
 #define RT_CTRL					MCR_REG(0xe530)
 #define   DIS_NULL_QUERY			REG_BIT(10)
 
-#define EU_PERF_CNTL1				MCR_REG(0xe558)
-#define EU_PERF_CNTL5				MCR_REG(0xe55c)
+#define EU_PERF_CNTL1				PERF_REG(0xe558)
+#define EU_PERF_CNTL5				PERF_REG(0xe55c)
 
 #define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define ICL_HDC_MODE				MCR_REG(0xe5f4)
 
-#define EU_PERF_CNTL2				MCR_REG(0xe658)
-#define EU_PERF_CNTL6				MCR_REG(0xe65c)
-#define EU_PERF_CNTL3				MCR_REG(0xe758)
+#define EU_PERF_CNTL2				PERF_REG(0xe658)
+#define EU_PERF_CNTL6				PERF_REG(0xe65c)
+#define EU_PERF_CNTL3				PERF_REG(0xe758)
 
 #define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index dffef6ab4baf..c5fd17b6cf96 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1432,13 +1432,13 @@ gen8_emit_flush_coherentl3_wa(struct intel_engine_cs *engine, u32 *batch)
 {
 	/* NB no one else is allowed to scribble over scratch + 256! */
 	*batch++ = MI_STORE_REGISTER_MEM_GEN8 | MI_SRM_LRM_GLOBAL_GTT;
-	*batch++ = i915_mmio_reg_offset(GEN8_L3SQCREG4);
+	*batch++ = i915_mcr_reg_offset(GEN8_L3SQCREG4);
 	*batch++ = intel_gt_scratch_offset(engine->gt,
 					   INTEL_GT_SCRATCH_FIELD_COHERENTL3_WA);
 	*batch++ = 0;
 
 	*batch++ = MI_LOAD_REGISTER_IMM(1);
-	*batch++ = i915_mmio_reg_offset(GEN8_L3SQCREG4);
+	*batch++ = i915_mcr_reg_offset(GEN8_L3SQCREG4);
 	*batch++ = 0x40400000 | GEN8_LQSC_FLUSH_COHERENT_LINES;
 
 	batch = gen8_emit_pipe_control(batch,
@@ -1447,7 +1447,7 @@ gen8_emit_flush_coherentl3_wa(struct intel_engine_cs *engine, u32 *batch)
 				       0);
 
 	*batch++ = MI_LOAD_REGISTER_MEM_GEN8 | MI_SRM_LRM_GLOBAL_GTT;
-	*batch++ = i915_mmio_reg_offset(GEN8_L3SQCREG4);
+	*batch++ = i915_mcr_reg_offset(GEN8_L3SQCREG4);
 	*batch++ = intel_gt_scratch_offset(engine->gt,
 					   INTEL_GT_SCRATCH_FIELD_COHERENTL3_WA);
 	*batch++ = 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index d7e61c8a8c04..818ba71f4909 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -166,11 +166,11 @@ static void wa_add(struct i915_wa_list *wal, i915_reg_t reg,
 	_wa_add(wal, &wa);
 }
 
-static void wa_mcr_add(struct i915_wa_list *wal, i915_reg_t reg,
+static void wa_mcr_add(struct i915_wa_list *wal, i915_mcr_reg_t reg,
 		       u32 clear, u32 set, u32 read_mask, bool masked_reg)
 {
 	struct i915_wa wa = {
-		.reg  = reg,
+		.reg  = _MMIO(i915_mcr_reg_offset(reg)),
 		.clr  = clear,
 		.set  = set,
 		.read = read_mask,
@@ -187,7 +187,7 @@ wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
 }
 
 static void
-wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
+wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clear, u32 set)
 {
 	wa_mcr_add(wal, reg, clear, set, clear, false);
 }
@@ -205,7 +205,7 @@ wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
 }
 
 static void
-wa_mcr_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
+wa_mcr_write_or(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 set)
 {
 	wa_mcr_write_clr_set(wal, reg, set, set);
 }
@@ -217,7 +217,7 @@ wa_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
 }
 
 static void
-wa_mcr_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
+wa_mcr_write_clr(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clr)
 {
 	wa_mcr_write_clr_set(wal, reg, clr, 0);
 }
@@ -240,7 +240,7 @@ wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 }
 
 static void
-wa_mcr_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
+wa_mcr_masked_en(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 val)
 {
 	wa_mcr_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val, true);
 }
@@ -252,7 +252,7 @@ wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 }
 
 static void
-wa_mcr_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
+wa_mcr_masked_dis(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 val)
 {
 	wa_mcr_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val, true);
 }
@@ -1638,16 +1638,18 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
 	intel_uncore_forcewake_get__locked(uncore, fw);
 
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
+		/* To be safe, just assume all registers are MCR */
+		i915_mcr_reg_t mcr_reg = MCR_REG(i915_mmio_reg_offset(wa->reg));
 		u32 val, old = 0;
 
 		/* open-coded rmw due to steering */
-		old = wa->clr ? intel_gt_mcr_read_any_fw(gt, wa->reg) : 0;
+		old = wa->clr ? intel_gt_mcr_read_any_fw(gt, mcr_reg) : 0;
 		val = (old & ~wa->clr) | wa->set;
 		if (val != old || !wa->clr)
 			intel_uncore_write_fw(uncore, wa->reg, val);
 
 		if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
-			wa_verify(wa, intel_gt_mcr_read_any_fw(gt, wa->reg),
+			wa_verify(wa, intel_gt_mcr_read_any_fw(gt, mcr_reg),
 				  wal->name, "application");
 	}
 
@@ -1676,10 +1678,13 @@ static bool wa_list_verify(struct intel_gt *gt,
 	spin_lock_irqsave(&uncore->lock, flags);
 	intel_uncore_forcewake_get__locked(uncore, fw);
 
-	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
+	for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
+		i915_mcr_reg_t mcr_reg = MCR_REG(i915_mmio_reg_offset(wa->reg));
+
 		ok &= wa_verify(wa,
-				intel_gt_mcr_read_any_fw(gt, wa->reg),
+				intel_gt_mcr_read_any_fw(gt, mcr_reg),
 				wal->name, from);
+	}
 
 	intel_uncore_forcewake_put__locked(uncore, fw);
 	spin_unlock_irqrestore(&uncore->lock, flags);
@@ -1731,9 +1736,10 @@ whitelist_reg(struct i915_wa_list *wal, i915_reg_t reg)
 }
 
 static void
-whitelist_mcr_reg(struct i915_wa_list *wal, i915_reg_t reg)
+whitelist_mcr_reg(struct i915_wa_list *wal, i915_mcr_reg_t reg)
 {
-	whitelist_reg_ext(wal, reg, RING_FORCE_TO_NONPRIV_ACCESS_RW);
+	whitelist_reg_ext(wal, _MMIO(i915_mcr_reg_offset(reg)),
+			  RING_FORCE_TO_NONPRIV_ACCESS_RW);
 }
 
 static void gen9_whitelist_build(struct i915_wa_list *w)
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 67a9aab801dd..21b1edc052f8 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -991,7 +991,7 @@ static bool pardon_reg(struct drm_i915_private *i915, i915_reg_t reg)
 	/* Alas, we must pardon some whitelists. Mistakes already made */
 	static const struct regmask pardon[] = {
 		{ GEN9_CTX_PREEMPT_REG, 9 },
-		{ GEN8_L3SQCREG4, 9 },
+		{ _MMIO(0xb118), 9 }, /* GEN8_L3SQCREG4 */
 	};
 
 	return find_reg(i915, reg, pardon, ARRAY_SIZE(pardon));
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 389c5c0aad7a..0a2d50dbfe4b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -327,7 +327,7 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 
 static long __must_check guc_mcr_reg_add(struct intel_gt *gt,
 					 struct temp_regset *regset,
-					 i915_reg_t reg, u32 flags)
+					 i915_mcr_reg_t reg, u32 flags)
 {
 	u8 group, inst;
 
@@ -342,7 +342,7 @@ static long __must_check guc_mcr_reg_add(struct intel_gt *gt,
 	intel_gt_mcr_get_nonterminated_steering(gt, reg, &group, &inst);
 	flags |= GUC_REGSET_STEERING(group, inst);
 
-	return guc_mmio_reg_add(gt, regset, i915_mmio_reg_offset(reg), flags);
+	return guc_mmio_reg_add(gt, regset, i915_mcr_reg_offset(reg), flags);
 }
 
 #define GUC_MCR_REG_ADD(gt, regset, reg, masked) \
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 7f77e9cdaba4..8d1a85b06ff4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -239,7 +239,7 @@ static void guc_capture_free_extlists(struct __guc_mmio_reg_descr_group *reglist
 
 struct __ext_steer_reg {
 	const char *name;
-	i915_reg_t reg;
+	i915_mcr_reg_t reg;
 };
 
 static const struct __ext_steer_reg xe_extregs[] = {
@@ -251,7 +251,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
 			   const struct __ext_steer_reg *extlist,
 			   int slice_id, int subslice_id)
 {
-	ext->reg = extlist->reg;
+	ext->reg = _MMIO(i915_mcr_reg_offset(extlist->reg));
 	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
 	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
 	ext->regname = extlist->name;
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 2459213b6c87..8432f1fe25e6 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -918,7 +918,7 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 
 	if (!strncmp(cmd, "srm", 3) ||
 			!strncmp(cmd, "lrm", 3)) {
-		if (offset == i915_mmio_reg_offset(GEN8_L3SQCREG4) ||
+		if (offset == i915_mcr_reg_offset(GEN8_L3SQCREG4) ||
 		    offset == 0x21f0 ||
 		    (IS_BROADWELL(gvt->gt->i915) &&
 		     offset == i915_mmio_reg_offset(INSTPM)))
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index bad1065a99a7..84af773c5ebb 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -748,7 +748,7 @@ static i915_reg_t force_nonpriv_white_list[] = {
 	_MMIO(0x770c),
 	_MMIO(0x83a8),
 	_MMIO(0xb110),
-	GEN8_L3SQCREG4,//_MMIO(0xb118)
+	_MMIO(0xb118),
 	_MMIO(0xe100),
 	_MMIO(0xe18c),
 	_MMIO(0xe48c),
@@ -2157,6 +2157,9 @@ static int csfe_chicken1_mmio_write(struct intel_vgpu *vgpu,
 #define MMIO_DFH(reg, d, f, r, w) \
 	MMIO_F(reg, 4, f, 0, 0, d, r, w)
 
+#define MMIO_DFH_MCR(reg, d, f, r, w) \
+	MMIO_F(_MMIO(i915_mcr_reg_offset(reg)), 4, f, 0, 0, d, r, w)
+
 #define MMIO_GM(reg, d, r, w) \
 	MMIO_F(reg, 4, F_GMADR, 0xFFFFF000, 0, d, r, w)
 
@@ -3147,15 +3150,15 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GEN8_EU_DISABLE2, D_BDW_PLUS);
 
 	MMIO_D(_MMIO(0xfdc), D_BDW_PLUS);
-	MMIO_DFH(GEN8_ROW_CHICKEN, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
-		NULL, NULL);
+	MMIO_DFH_MCR(GEN8_ROW_CHICKEN, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
+		     NULL, NULL);
 	MMIO_DFH(GEN7_ROW_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS,
 		NULL, NULL);
 	MMIO_DFH(GEN8_UCGCTL6, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
 
 	MMIO_DFH(_MMIO(0xb1f0), D_BDW, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0xb1c0), D_BDW, F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(GEN8_L3SQCREG4, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(GEN8_L3SQCREG4, D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0xb100), D_BDW, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0xb10c), D_BDW, F_CMD_ACCESS, NULL, NULL);
 	MMIO_D(_MMIO(0xb110), D_BDW);
@@ -3181,7 +3184,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DFH(_MMIO(0xe194), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0xe188), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x2580), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 
 	MMIO_DFH(_MMIO(0x2248), D_BDW, F_CMD_ACCESS, NULL, NULL);
@@ -3372,7 +3375,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(DMC_HTP_SKL, D_SKL_PLUS);
 	MMIO_D(DMC_LAST_WRITE, D_SKL_PLUS);
 
-	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
 
 	MMIO_D(SKL_DFSM, D_SKL_PLUS);
 	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
@@ -3619,7 +3622,7 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 	MMIO_D(GEN8_PUSHBUS_ENABLE, D_BXT);
 	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
 	MMIO_D(GEN6_GFXPAUSE, D_BXT);
-	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
 	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 4be07d627941..bf10c3bf6ad8 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -44,6 +44,8 @@
 
 #define GEN9_MOCS_SIZE		64
 
+#define MCR_CAST(mcr)	_MMIO(i915_mcr_reg_offset(mcr))
+
 /* Raw offset is appened to each line for convenience. */
 static struct engine_mmio gen8_engine_mmio_list[] __cacheline_aligned = {
 	{RCS0, RING_MODE_GEN7(RENDER_RING_BASE), 0xffff, false}, /* 0x229c */
@@ -106,15 +108,15 @@ static struct engine_mmio gen9_engine_mmio_list[] __cacheline_aligned = {
 	{RCS0, GEN8_CS_CHICKEN1, 0xffff, true}, /* 0x2580 */
 	{RCS0, COMMON_SLICE_CHICKEN2, 0xffff, true}, /* 0x7014 */
 	{RCS0, GEN9_CS_DEBUG_MODE1, 0xffff, false}, /* 0x20ec */
-	{RCS0, GEN8_L3SQCREG4, 0, false}, /* 0xb118 */
-	{RCS0, GEN9_SCRATCH1, 0, false}, /* 0xb11c */
+	{RCS0, _MMIO(0xb118), 0, false}, /* GEN8_L3SQCREG4 */
+	{RCS0, _MMIO(0xb11c), 0, false}, /* GEN9_SCRATCH1 */
 	{RCS0, GEN9_SCRATCH_LNCF1, 0, false}, /* 0xb008 */
 	{RCS0, GEN7_HALF_SLICE_CHICKEN1, 0xffff, true}, /* 0xe100 */
-	{RCS0, HALF_SLICE_CHICKEN2, 0xffff, true}, /* 0xe180 */
+	{RCS0, _MMIO(0xe180), 0xffff, true}, /* HALF_SLICE_CHICKEN2 */
 	{RCS0, HSW_HALF_SLICE_CHICKEN3, 0xffff, true}, /* 0xe184 */
-	{RCS0, GEN9_HALF_SLICE_CHICKEN5, 0xffff, true}, /* 0xe188 */
-	{RCS0, GEN9_HALF_SLICE_CHICKEN7, 0xffff, true}, /* 0xe194 */
-	{RCS0, GEN8_ROW_CHICKEN, 0xffff, true}, /* 0xe4f0 */
+	{RCS0, _MMIO(0xe188), 0xffff, true}, /* GEN9_HALF_SLICE_CHICKEN5 */
+	{RCS0, _MMIO(0xe194), 0xffff, true}, /* GEN9_HALF_SLICE_CHICKEN7 */
+	{RCS0, _MMIO(0xe4f0), 0xffff, true}, /* GEN8_ROW_CHICKEN */
 	{RCS0, TRVATTL3PTRDW(0), 0, true}, /* 0x4de0 */
 	{RCS0, TRVATTL3PTRDW(1), 0, true}, /* 0x4de4 */
 	{RCS0, TRNULLDETCT, 0, true}, /* 0x4de8 */
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0a9c3fcc09b1..22c10c4a1cbb 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3986,7 +3986,7 @@ static u32 mask_reg_value(u32 reg, u32 val)
 	 * WaDisableSTUnitPowerOptimization workaround. Make sure the value
 	 * programmed by userspace doesn't change this.
 	 */
-	if (REG_EQUAL(reg, HALF_SLICE_CHICKEN2))
+	if (reg == i915_mcr_reg_offset(HALF_SLICE_CHICKEN2))
 		val = val & ~_MASKED_BIT_ENABLE(GEN8_ST_PO_DISABLE);
 
 	/* WAIT_FOR_RC6_EXIT has only one bit fullfilling the function
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index 8f486f77609f..34eca053fab9 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -104,6 +104,10 @@ typedef struct {
 
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
 
+typedef struct {
+	u32 mmio;
+} i915_mcr_reg_t;
+
 #define INVALID_MMIO_REG _MMIO(0)
 
 static __always_inline u32 i915_mmio_reg_offset(i915_reg_t reg)
@@ -111,6 +115,11 @@ static __always_inline u32 i915_mmio_reg_offset(i915_reg_t reg)
 	return reg.reg;
 }
 
+static __always_inline u32 i915_mcr_reg_offset(const i915_mcr_reg_t reg)
+{
+	return reg.mmio;
+}
+
 static inline bool i915_mmio_reg_equal(i915_reg_t a, i915_reg_t b)
 {
 	return i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b);
-- 
2.34.1

