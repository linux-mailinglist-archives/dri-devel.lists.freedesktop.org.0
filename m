Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB875BD770
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289310E1CB;
	Mon, 19 Sep 2022 22:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A7A10E19C;
 Mon, 19 Sep 2022 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663626790; x=1695162790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZwuHeTRKcQLtE1d1nsrHy4uluuUi14afrIVYiA3RLk=;
 b=QXbhc9UblkBGcxcyaN6NjDY6fKQFM0AbDi4KfgxsmrQ8boQdRXz1chUI
 SID27Ffd3i+bZ5bB5vUFqI/LeEq2CEUnseddc2bDUwpcFZk11QMOnJVt8
 SSYG9N1F477kvQ+/gf4BjEz2aByDrgw4fq2yc2NI9NL3tO+pT5P/VM/Zt
 ho/eOO8HM7fWECHH3kjmNJrNJwYybMa7MtyLqmhNZWTNlliivkwEtoi4h
 r6P7SGgiifgbjBNP8dKYxC58r5bXwhGc9TaFxdsyoO1szuKwCDj9A6agL
 lCkUkqPpnWdwne9d7CsrNlZ/iN4sBaTE5IZhAElMG0Y1jRKOqUSEfRql5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279920540"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="279920540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794030785"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/12] drm/i915: Define multicast registers as a new type
Date: Mon, 19 Sep 2022 15:32:57 -0700
Message-Id: <20220919223259.263525-11-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 32 ++++++------
 .../gpu/drm/i915/gt/intel_workarounds_types.h |  5 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  4 +-
 drivers/gpu/drm/i915/gvt/handlers.c           | 17 ++++---
 drivers/gpu/drm/i915/gvt/mmio_context.c       | 14 +++---
 drivers/gpu/drm/i915/i915_reg_defs.h          | 22 +++------
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   | 10 ++--
 12 files changed, 112 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index e79405a45312..8f9009af3673 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -134,6 +134,19 @@ void intel_gt_mcr_init(struct intel_gt *gt)
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
+	i915_reg_t r = { .reg = mcr.reg };
+
+	return r;
+}
+
 /*
  * rw_with_mcr_steering_fw - Access a register with specific MCR steering
  * @uncore: pointer to struct intel_uncore
@@ -148,7 +161,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
  * Caller needs to make sure the relevant forcewake wells are up.
  */
 static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
-				   i915_reg_t reg, u8 rw_flag,
+				   i915_mcr_reg_t reg, u8 rw_flag,
 				   int group, int instance, u32 value)
 {
 	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
@@ -185,9 +198,9 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
 
 	if (rw_flag == FW_REG_READ)
-		val = intel_uncore_read_fw(uncore, reg);
+		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
 	else
-		intel_uncore_write_fw(uncore, reg, value);
+		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
 
 	mcr &= ~mcr_mask;
 	mcr |= old_mcr & mcr_mask;
@@ -198,14 +211,14 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
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
@@ -233,7 +246,7 @@ static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
  * group/instance.
  */
 u32 intel_gt_mcr_read(struct intel_gt *gt,
-		      i915_reg_t reg,
+		      i915_mcr_reg_t reg,
 		      int group, int instance)
 {
 	return rw_with_mcr_steering(gt->uncore, reg, FW_REG_READ, group, instance, 0);
@@ -250,7 +263,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
  * Write an MCR register in unicast mode after steering toward a specific
  * group/instance.
  */
-void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_reg_t reg, u32 value,
+void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value,
 				int group, int instance)
 {
 	rw_with_mcr_steering(gt->uncore, reg, FW_REG_WRITE, group, instance, value);
@@ -265,9 +278,9 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_reg_t reg, u32 value,
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
@@ -281,9 +294,9 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
  * domains; use intel_gt_mcr_multicast_write() in cases where forcewake should
  * be obtained automatically.
  */
-void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 value)
+void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value)
 {
-	intel_uncore_write_fw(gt->uncore, reg, value);
+	intel_uncore_write_fw(gt->uncore, mcr_reg_cast(reg), value);
 }
 
 /*
@@ -301,10 +314,10 @@ void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_reg_t reg, u32 va
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
@@ -380,7 +393,7 @@ static void get_nonterminated_steering(struct intel_gt *gt,
  * steering.
  */
 void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
-					     i915_reg_t reg,
+					     i915_mcr_reg_t reg,
 					     u8 *group, u8 *instance)
 {
 	int type;
@@ -409,7 +422,7 @@ void intel_gt_mcr_get_nonterminated_steering(struct intel_gt *gt,
  *
  * Returns the value from a non-terminated instance of @reg.
  */
-u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
+u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
 {
 	int type;
 	u8 group, instance;
@@ -423,7 +436,7 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
 		}
 	}
 
-	return intel_uncore_read_fw(gt->uncore, reg);
+	return intel_uncore_read_fw(gt->uncore, mcr_reg_cast(reg));
 }
 
 /**
@@ -436,7 +449,7 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_reg_t reg)
  *
  * Returns the value from a non-terminated instance of @reg.
  */
-u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
+u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
 {
 	int type;
 	u8 group, instance;
@@ -450,7 +463,7 @@ u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_reg_t reg)
 		}
 	}
 
-	return intel_uncore_read(gt->uncore, reg);
+	return intel_uncore_read(gt->uncore, mcr_reg_cast(reg));
 }
 
 static void report_steering_type(struct drm_printer *p,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 77a8b11c287d..907e751fa9f7 100644
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
index f96cf08cd31e..4b5692d84858 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -8,7 +8,18 @@
 
 #include "i915_reg_defs.h"
 
-#define MCR_REG(offset)	_MMIO(offset)
+#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
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
@@ -1107,8 +1118,8 @@
 #define   FLOAT_BLEND_OPTIMIZATION_ENABLE	REG_BIT(4)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 
-#define EU_PERF_CNTL0				MCR_REG(0xe458)
-#define EU_PERF_CNTL4				MCR_REG(0xe45c)
+#define EU_PERF_CNTL0				PERF_REG(0xe458)
+#define EU_PERF_CNTL4				PERF_REG(0xe45c)
 
 #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
 #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
@@ -1145,16 +1156,16 @@
 #define   STACKID_CTRL				REG_GENMASK(6, 5)
 #define   STACKID_CTRL_512			REG_FIELD_PREP(STACKID_CTRL, 0x2)
 
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
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index f98213b7c61d..0f18872a7995 100644
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
+		.mcr_reg = reg,
 		.clr  = clear,
 		.set  = set,
 		.read = read_mask,
@@ -188,7 +188,7 @@ wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
 }
 
 static void
-wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
+wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clear, u32 set)
 {
 	wa_mcr_add(wal, reg, clear, set, clear, false);
 }
@@ -206,7 +206,7 @@ wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
 }
 
 static void
-wa_mcr_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
+wa_mcr_write_or(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 set)
 {
 	wa_mcr_write_clr_set(wal, reg, set, set);
 }
@@ -218,7 +218,7 @@ wa_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
 }
 
 static void
-wa_mcr_write_clr(struct i915_wa_list *wal, i915_reg_t reg, u32 clr)
+wa_mcr_write_clr(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clr)
 {
 	wa_mcr_write_clr_set(wal, reg, clr, 0);
 }
@@ -241,7 +241,7 @@ wa_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 }
 
 static void
-wa_mcr_masked_en(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
+wa_mcr_masked_en(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 val)
 {
 	wa_mcr_add(wal, reg, 0, _MASKED_BIT_ENABLE(val), val, true);
 }
@@ -253,7 +253,7 @@ wa_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
 }
 
 static void
-wa_mcr_masked_dis(struct i915_wa_list *wal, i915_reg_t reg, u32 val)
+wa_mcr_masked_dis(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 val)
 {
 	wa_mcr_add(wal, reg, 0, _MASKED_BIT_DISABLE(val), val, true);
 }
@@ -266,7 +266,7 @@ wa_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
 }
 
 static void
-wa_mcr_masked_field_set(struct i915_wa_list *wal, i915_reg_t reg,
+wa_mcr_masked_field_set(struct i915_wa_list *wal, i915_mcr_reg_t reg,
 			u32 mask, u32 val)
 {
 	wa_mcr_add(wal, reg, 0, _MASKED_FIELD(mask, val), mask, true);
@@ -1682,19 +1682,19 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
 		/* open-coded rmw due to steering */
 		if (wa->clr)
 			old = wa->is_mcr ?
-				intel_gt_mcr_read_any_fw(gt, wa->reg) :
+				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
 				intel_uncore_read_fw(uncore, wa->reg);
 		val = (old & ~wa->clr) | wa->set;
 		if (val != old || !wa->clr) {
 			if (wa->is_mcr)
-				intel_gt_mcr_multicast_write_fw(gt, wa->reg, val);
+				intel_gt_mcr_multicast_write_fw(gt, wa->mcr_reg, val);
 			else
 				intel_uncore_write_fw(uncore, wa->reg, val);
 		}
 
 		if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
 			u32 val = wa->is_mcr ?
-				intel_gt_mcr_read_any_fw(gt, wa->reg) :
+				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
 				intel_uncore_read_fw(uncore, wa->reg);
 
 			wa_verify(wa, val, wal->name, "application");
@@ -1728,7 +1728,7 @@ static bool wa_list_verify(struct intel_gt *gt,
 
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
 		ok &= wa_verify(wa, wa->is_mcr ?
-				intel_gt_mcr_read_any_fw(gt, wa->reg) :
+				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
 				intel_uncore_read_fw(uncore, wa->reg),
 				wal->name, from);
 
@@ -1776,10 +1776,10 @@ whitelist_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
 }
 
 static void
-whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
+whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 flags)
 {
 	struct i915_wa wa = {
-		.reg = reg,
+		.mcr_reg = reg,
 		.is_mcr = 1,
 	};
 
@@ -1789,7 +1789,7 @@ whitelist_mcr_reg_ext(struct i915_wa_list *wal, i915_reg_t reg, u32 flags)
 	if (GEM_DEBUG_WARN_ON(!is_nonpriv_flags_valid(flags)))
 		return;
 
-	wa.reg.reg |= flags;
+	wa.mcr_reg.reg |= flags;
 	_wa_add(wal, &wa);
 }
 
@@ -1800,7 +1800,7 @@ whitelist_reg(struct i915_wa_list *wal, i915_reg_t reg)
 }
 
 static void
-whitelist_mcr_reg(struct i915_wa_list *wal, i915_reg_t reg)
+whitelist_mcr_reg(struct i915_wa_list *wal, i915_mcr_reg_t reg)
 {
 	whitelist_mcr_reg_ext(wal, reg, RING_FORCE_TO_NONPRIV_ACCESS_RW);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
index f05b37e56fa9..7c8b01d00043 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
@@ -11,7 +11,10 @@
 #include "i915_reg_defs.h"
 
 struct i915_wa {
-	i915_reg_t	reg;
+	union {
+		i915_reg_t	reg;
+		i915_mcr_reg_t	mcr_reg;
+	};
 	u32		clr;
 	u32		set;
 	u32		read;
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
index b5d3e3ef1787..31eee994e91c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -327,7 +327,7 @@ static long __must_check guc_mmio_reg_add(struct intel_gt *gt,
 
 static long __must_check guc_mcr_reg_add(struct intel_gt *gt,
 					 struct temp_regset *regset,
-					 i915_reg_t reg, u32 flags)
+					 i915_mcr_reg_t reg, u32 flags)
 {
 	u8 group, inst;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 9495a7928bc8..d5c03e7a7843 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -240,7 +240,7 @@ static void guc_capture_free_extlists(struct __guc_mmio_reg_descr_group *reglist
 
 struct __ext_steer_reg {
 	const char *name;
-	i915_reg_t reg;
+	i915_mcr_reg_t reg;
 };
 
 static const struct __ext_steer_reg xe_extregs[] = {
@@ -252,7 +252,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
 			   const struct __ext_steer_reg *extlist,
 			   int slice_id, int subslice_id)
 {
-	ext->reg = extlist->reg;
+	ext->reg = _MMIO(i915_mmio_reg_offset(extlist->reg));
 	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
 	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
 	ext->regname = extlist->name;
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 700cc9688f47..a52c4645cdbe 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -734,7 +734,7 @@ static i915_reg_t force_nonpriv_white_list[] = {
 	_MMIO(0x770c),
 	_MMIO(0x83a8),
 	_MMIO(0xb110),
-	GEN8_L3SQCREG4,//_MMIO(0xb118)
+	_MMIO(0xb118),
 	_MMIO(0xe100),
 	_MMIO(0xe18c),
 	_MMIO(0xe48c),
@@ -2140,6 +2140,9 @@ static int csfe_chicken1_mmio_write(struct intel_vgpu *vgpu,
 #define MMIO_DFH(reg, d, f, r, w) \
 	MMIO_F(reg, 4, f, 0, 0, d, r, w)
 
+#define MMIO_DFH_MCR(reg, d, f, r, w) \
+	MMIO_F(_MMIO(i915_mmio_reg_offset(reg)), 4, f, 0, 0, d, r, w)
+
 #define MMIO_GM(reg, d, r, w) \
 	MMIO_F(reg, 4, F_GMADR, 0xFFFFF000, 0, d, r, w)
 
@@ -2529,15 +2532,15 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DFH(HDC_CHICKEN0, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 
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
 
@@ -2550,7 +2553,7 @@ static int init_bdw_mmio_info(struct intel_gvt *gvt)
 
 	MMIO_DFH(_MMIO(0xe194), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0xe188), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
-	MMIO_DFH(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(HALF_SLICE_CHICKEN2, D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x2580), D_BDW_PLUS, F_MODE_MASK | F_CMD_ACCESS, NULL, NULL);
 
 	MMIO_DFH(_MMIO(0x2248), D_BDW, F_CMD_ACCESS, NULL, NULL);
@@ -2699,7 +2702,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
 	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
 	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
 
-	MMIO_DFH(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(BDW_SCRATCH1, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
 
 	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
 		NULL, NULL);
@@ -2769,7 +2772,7 @@ static int init_bxt_mmio_info(struct intel_gvt *gvt)
 	MMIO_DH(BXT_PORT_TX_DW3_LN0(DPIO_PHY1, DPIO_CH0), D_BXT,
 		bxt_port_tx_dw3_read, NULL);
 	MMIO_DH(BXT_DE_PLL_ENABLE, D_BXT, NULL, bxt_de_pll_enable_write);
-	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH_MCR(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
 	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40, F_CMD_ACCESS,
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index ac58460fb305..b5b51e4f28da 100644
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
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index 8f486f77609f..e823869b9afd 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -104,22 +104,16 @@ typedef struct {
 
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
 
-#define INVALID_MMIO_REG _MMIO(0)
-
-static __always_inline u32 i915_mmio_reg_offset(i915_reg_t reg)
-{
-	return reg.reg;
-}
+typedef struct {
+	u32 reg;
+} i915_mcr_reg_t;
 
-static inline bool i915_mmio_reg_equal(i915_reg_t a, i915_reg_t b)
-{
-	return i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b);
-}
+#define INVALID_MMIO_REG _MMIO(0)
 
-static inline bool i915_mmio_reg_valid(i915_reg_t reg)
-{
-	return !i915_mmio_reg_equal(reg, INVALID_MMIO_REG);
-}
+/* These macros can be used on either i915_reg_t or i915_mcr_reg_t */
+#define i915_mmio_reg_offset(r) (r.reg)
+#define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
+#define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
 
 #define VLV_DISPLAY_BASE		0x180000
 
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 638b77d64bf4..8c1515f5c04c 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -816,10 +816,10 @@ static int iterate_bdw_plus_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(GEN8_EU_DISABLE1);
 	MMIO_D(GEN8_EU_DISABLE2);
 	MMIO_D(_MMIO(0xfdc));
-	MMIO_D(GEN8_ROW_CHICKEN);
+	MMIO_D(_MMIO(0xe4f0));	/* GEN8_ROW_CHICKEN */
 	MMIO_D(GEN7_ROW_CHICKEN2);
 	MMIO_D(GEN8_UCGCTL6);
-	MMIO_D(GEN8_L3SQCREG4);
+	MMIO_D(_MMIO(0xb118));	/* GEN8_L3SQCREG4 */
 	MMIO_D(GEN9_SCRATCH_LNCF1);
 	MMIO_F(_MMIO(0x24d0), 48);
 	MMIO_D(_MMIO(0x44484));
@@ -831,7 +831,7 @@ static int iterate_bdw_plus_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(_MMIO(0x65f10));
 	MMIO_D(_MMIO(0xe194));
 	MMIO_D(_MMIO(0xe188));
-	MMIO_D(HALF_SLICE_CHICKEN2);
+	MMIO_D(_MMIO(0xe180));	/* HALF_SLICE_CHICKEN2 */
 	MMIO_D(_MMIO(0x2580));
 	MMIO_D(_MMIO(0xe220));
 	MMIO_D(_MMIO(0xe230));
@@ -1025,7 +1025,7 @@ static int iterate_skl_plus_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(DMC_SSP_BASE);
 	MMIO_D(DMC_HTP_SKL);
 	MMIO_D(DMC_LAST_WRITE);
-	MMIO_D(BDW_SCRATCH1);
+	MMIO_D(_MMIO(0xb11c));	/* BDW_SCRATCH1 */
 	MMIO_D(SKL_DFSM);
 	MMIO_D(DISPIO_CR_TX_BMU_CR0);
 	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8);
@@ -1228,7 +1228,7 @@ static int iterate_bxt_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(GEN8_PUSHBUS_ENABLE);
 	MMIO_D(GEN8_PUSHBUS_SHIFT);
 	MMIO_D(GEN6_GFXPAUSE);
-	MMIO_D(GEN8_L3SQCREG1);
+	MMIO_D(_MMIO(0xb100));	/* GEN8_L3SQCREG1 */
 	MMIO_D(GEN8_L3CNTLREG);
 	MMIO_D(_MMIO(0x20D8));
 	MMIO_F(GEN8_RING_CS_GPR(RENDER_RING_BASE, 0), 0x40);
-- 
2.37.3

