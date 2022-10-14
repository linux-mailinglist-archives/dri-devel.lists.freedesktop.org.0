Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F185FF694
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 01:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5497310E18E;
	Fri, 14 Oct 2022 23:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6E110E142;
 Fri, 14 Oct 2022 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665788585; x=1697324585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TOKctJ5xKQXmSFbPctbOCzxXyQO98zLZebD6Nw0YJ2Q=;
 b=R1JjnQwuKR08PITCmTglMv9vhs0UOoO0uT29KGVttbI4dCuWrNa+iMzj
 wx1lSUD340xsYyPXAYblxoFtvk+86YMzTa6ZSQX7W02cJbtJFzy/5qXII
 IfbgDG6jJSGx7k37w37xHGlqDSJeOqiHjzqTcc7SeHEfXiDxeDPeXQfno
 MHsoI98pFLscAD6G+o330xV6juwnuy+YLMlFOytaQrejkUwcu+DfHM2TY
 eY7IU45vWe/4jSfpWulekbLVpNowdSYTEDV2IjMP85CDIwQt6OlFMNsN9
 0P6Ljt3G4vzmXYl/BlB6mLEV1mgTdAvWLzjfiY/aQpPS5C8Lj4+Asc+88 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="285216976"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="285216976"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="696471728"
X-IronPort-AV: E=Sophos;i="5.95,185,1661842800"; d="scan'208";a="696471728"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 16:03:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 13/14] drm/i915/xelpg: Add multicast steering
Date: Fri, 14 Oct 2022 16:02:38 -0700
Message-Id: <20221014230239.1023689-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014230239.1023689-1-matthew.d.roper@intel.com>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTL's graphics IP (Xe_LPG) once again changes the multicast register
types and steering details.  Key changes from past platforms:
 * The number of instances of some MCR types (NODE, OAAL2, and GAM) vary
   according to the MTL subplatform and cannot be read from fuse
   registers.  However steering to instance #0 will always provided a
   non-terminated value, so we can lump these all into a single
   "instance0" table.
 * The MCR steering register (and its bitfields) has changed.

Unlike past platforms, we will be explicitly steering all types of MCR
accesses, including those for "SLICE" and "DSS" ranges; we no longer
rely on implicit steering.  On previous platforms, various
hardware/firmware agents that needed to access registers typically had
their own steering control registers, allowing them to perform multicast
steering without clobbering the CPU/kernel steering.  Starting with MTL,
more of these agents now share a single steering register (0xFD4) and it
is no longer safe for us to assume that the value will remain unchanged
from how we initialized it during startup.  There is also a slight
chance of race conditions between the driver and a hardware/firmware
agent, so the hardware provides a semaphore register that can be used to
coordinate access to the steering register.  Support for the semaphore
register will be introduced in a future patch.

v2:
 - Use Xe_LPG terminology instead of "MTL 3D" since it's the IP version
   we're matching on now rather than the platform.
 - Don't combine l3bank and mslice masks into a union.  It's not related
   to the other changes here and we might still need both of them on
   some future platform.
 - Separate debug dumping of steering settings to a separate helper
   function.  (Tvrtko)
 - Update debug dumping to include DSS ranges (and future-proof it so
   that any new ranges added on future platforms will also be dumped).
 - Restore MULTICAST bit at the end of rw_with_mcr_steering_fw() if we
   cleared it.  Also force the MULTICAST bit to true at the beginning of
   multicast writes just to be safe.  (Bala)

Bspec: 67788, 67112
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 135 +++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |   5 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |   1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  33 ++++-
 drivers/gpu/drm/i915/i915_pci.c             |   1 +
 5 files changed, 154 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 349074bf365f..23a1ef9659bf 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -41,6 +41,7 @@ static const char * const intel_steering_types[] = {
 	"MSLICE",
 	"LNCF",
 	"GAM",
+	"DSS",
 	"INSTANCE 0",
 };
 
@@ -99,9 +100,40 @@ static const struct intel_mmio_range pvc_instance0_steering_table[] = {
 	{},
 };
 
+static const struct intel_mmio_range xelpg_instance0_steering_table[] = {
+	{ 0x000B00, 0x000BFF },         /* SQIDI */
+	{ 0x001000, 0x001FFF },         /* SQIDI */
+	{ 0x004000, 0x0048FF },         /* GAM */
+	{ 0x008700, 0x0087FF },         /* SQIDI */
+	{ 0x00B000, 0x00B0FF },         /* NODE */
+	{ 0x00C800, 0x00CFFF },         /* GAM */
+	{ 0x00D880, 0x00D8FF },         /* NODE */
+	{ 0x00DD00, 0x00DDFF },         /* OAAL2 */
+	{},
+};
+
+static const struct intel_mmio_range xelpg_l3bank_steering_table[] = {
+	{ 0x00B100, 0x00B3FF },
+	{},
+};
+
+/* DSS steering is used for SLICE ranges as well */
+static const struct intel_mmio_range xelpg_dss_steering_table[] = {
+	{ 0x005200, 0x0052FF },		/* SLICE */
+	{ 0x005500, 0x007FFF },		/* SLICE */
+	{ 0x008140, 0x00815F },		/* SLICE (0x8140-0x814F), DSS (0x8150-0x815F) */
+	{ 0x0094D0, 0x00955F },		/* SLICE (0x94D0-0x951F), DSS (0x9520-0x955F) */
+	{ 0x009680, 0x0096FF },		/* DSS */
+	{ 0x00D800, 0x00D87F },		/* SLICE */
+	{ 0x00DC00, 0x00DCFF },		/* SLICE */
+	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
+};
+
 void intel_gt_mcr_init(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
+	unsigned long fuse;
+	int i;
 
 	/*
 	 * An mslice is unavailable only if both the meml3 for the slice is
@@ -119,7 +151,22 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			drm_warn(&i915->drm, "mslice mask all zero!\n");
 	}
 
-	if (IS_PONTEVECCHIO(i915)) {
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
+	    gt->type == GT_PRIMARY) {
+		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
+				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
+
+		/*
+		 * Despite the register field being named "exclude mask" the
+		 * bits actually represent enabled banks (two banks per bit).
+		 */
+		for_each_set_bit(i, &fuse, 3)
+			gt->info.l3bank_mask |= 0x3 << 2 * i;
+
+		gt->steering_table[INSTANCE0] = xelpg_instance0_steering_table;
+		gt->steering_table[L3BANK] = xelpg_l3bank_steering_table;
+		gt->steering_table[DSS] = xelpg_dss_steering_table;
+	} else if (IS_PONTEVECCHIO(i915)) {
 		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
 	} else if (IS_DG2(i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
@@ -184,7 +231,19 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 
 	lockdep_assert_held(&uncore->lock);
 
-	if (GRAPHICS_VER(uncore->i915) >= 11) {
+	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
+		/*
+		 * Always leave the hardware in multicast mode when doing reads
+		 * (see comment about Wa_22013088509 below) and only change it
+		 * to unicast mode when doing writes of a specific instance.
+		 *
+		 * No need to save old steering reg value.
+		 */
+		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
+				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
+				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance) |
+				      (rw_flag == FW_REG_READ) ? GEN11_MCR_MULTICAST : 0);
+	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
 		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
 
@@ -202,26 +261,40 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 		 */
 		if (rw_flag == FW_REG_WRITE)
 			mcr_mask |= GEN11_MCR_MULTICAST;
+
+		mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
+		old_mcr = mcr;
+
+		mcr &= ~mcr_mask;
+		mcr |= mcr_ss;
+		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
 	} else {
 		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
-	}
 
-	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
+		mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
+		old_mcr = mcr;
 
-	mcr &= ~mcr_mask;
-	mcr |= mcr_ss;
-	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
+		mcr &= ~mcr_mask;
+		mcr |= mcr_ss;
+		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
+	}
 
 	if (rw_flag == FW_REG_READ)
 		val = intel_uncore_read_fw(uncore, mcr_reg_cast(reg));
 	else
 		intel_uncore_write_fw(uncore, mcr_reg_cast(reg), value);
 
-	mcr &= ~mcr_mask;
-	mcr |= old_mcr & mcr_mask;
-
-	intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
+	/*
+	 * For pre-MTL platforms, we need to restore the old value of the
+	 * steering control register to ensure that implicit steering continues
+	 * to behave as expected.  For MTL and beyond, we need only reinstate
+	 * the 'multicast' bit (and only if we did a write that cleared it).
+	 */
+	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70) && rw_flag == FW_REG_WRITE)
+		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
+	else if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 70))
+		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, old_mcr);
 
 	return val;
 }
@@ -296,6 +369,13 @@ void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 val
 void intel_gt_mcr_multicast_write(struct intel_gt *gt,
 				  i915_mcr_reg_t reg, u32 value)
 {
+	/*
+	 * Ensure we have multicast behavior, just in case some non-i915 agent
+	 * left the hardware in unicast mode.
+	 */
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
+		intel_uncore_write_fw(gt->uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
+
 	intel_uncore_write(gt->uncore, mcr_reg_cast(reg), value);
 }
 
@@ -312,6 +392,13 @@ void intel_gt_mcr_multicast_write(struct intel_gt *gt,
  */
 void intel_gt_mcr_multicast_write_fw(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value)
 {
+	/*
+	 * Ensure we have multicast behavior, just in case some non-i915 agent
+	 * left the hardware in unicast mode.
+	 */
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
+		intel_uncore_write_fw(gt->uncore, MTL_MCR_SELECTOR, GEN11_MCR_MULTICAST);
+
 	intel_uncore_write_fw(gt->uncore, mcr_reg_cast(reg), value);
 }
 
@@ -389,6 +476,8 @@ static void get_nonterminated_steering(struct intel_gt *gt,
 				       enum intel_steering_type type,
 				       u8 *group, u8 *instance)
 {
+	u32 dss;
+
 	switch (type) {
 	case L3BANK:
 		*group = 0;		/* unused */
@@ -412,6 +501,11 @@ static void get_nonterminated_steering(struct intel_gt *gt,
 		*group = IS_DG2(gt->i915) ? 1 : 0;
 		*instance = 0;
 		break;
+	case DSS:
+		dss = intel_sseu_find_first_xehp_dss(&gt->info.sseu, 0, 0);
+		*group = dss / GEN_DSS_PER_GSLICE;
+		*instance = dss % GEN_DSS_PER_GSLICE;
+		break;
 	case INSTANCE0:
 		/*
 		 * There are a lot of MCR types for which instance (0, 0)
@@ -544,11 +638,20 @@ static void report_steering_type(struct drm_printer *p,
 void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
 				  bool dump_table)
 {
-	drm_printf(p, "Default steering: group=0x%x, instance=0x%x\n",
-		   gt->default_steering.groupid,
-		   gt->default_steering.instanceid);
-
-	if (IS_PONTEVECCHIO(gt->i915)) {
+	/*
+	 * Starting with MTL we no longer have default steering;
+	 * all ranges are explicitly steered.
+	 */
+	if (GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 70))
+		drm_printf(p, "Default steering: group=0x%x, instance=0x%x\n",
+			   gt->default_steering.groupid,
+			   gt->default_steering.instanceid);
+
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70)) {
+		for (int i = 0; i < NUM_STEERING_TYPES; i++)
+			if (gt->steering_table[i])
+				report_steering_type(p, gt, i, dump_table);
+	} else if (IS_PONTEVECCHIO(gt->i915)) {
 		report_steering_type(p, gt, INSTANCE0, dump_table);
 	} else if (HAS_MSLICE_STEERING(gt->i915)) {
 		report_steering_type(p, gt, MSLICE, dump_table);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 754c27dd1e82..810283131f0a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -59,6 +59,7 @@
 #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
 
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
+#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
 #define SF_MCR_SELECTOR				_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
 #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
@@ -71,6 +72,8 @@
 #define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
 #define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
 #define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
+#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
+#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
 #define IPEIR_I965				_MMIO(0x2064)
 #define IPEHR_I965				_MMIO(0x2068)
@@ -531,6 +534,8 @@
 #define   GEN6_MBCTL_BOOT_FETCH_MECH		(1 << 0)
 
 /* Fuse readout registers for GT */
+#define XEHP_FUSE4				_MMIO(0x9114)
+#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 #define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
 #define   GEN10_L3BANK_PAIR_COUNT		4
 #define   GEN10_L3BANK_MASK			0x0F
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 30003d68fd51..0bb73d110a84 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -60,6 +60,7 @@ enum intel_steering_type {
 	MSLICE,
 	LNCF,
 	GAM,
+	DSS,
 
 	/*
 	 * On some platforms there are multiple types of MCR registers that
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index dadb60e6a58f..711a31935857 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1128,18 +1128,23 @@ static void __set_mcr_steering(struct i915_wa_list *wal,
 	wa_write_clr_set(wal, steering_reg, mcr_mask, mcr);
 }
 
-static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
-			 unsigned int slice, unsigned int subslice)
+static void debug_dump_steering(struct intel_gt *gt)
 {
 	struct drm_printer p = drm_debug_printer("MCR Steering:");
 
+	if (drm_debug_enabled(DRM_UT_DRIVER))
+		intel_gt_mcr_report_steering(&p, gt, false);
+}
+
+static void __add_mcr_wa(struct intel_gt *gt, struct i915_wa_list *wal,
+			 unsigned int slice, unsigned int subslice)
+{
 	__set_mcr_steering(wal, GEN8_MCR_SELECTOR, slice, subslice);
 
 	gt->default_steering.groupid = slice;
 	gt->default_steering.instanceid = subslice;
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
-		intel_gt_mcr_report_steering(&p, gt, false);
+	debug_dump_steering(gt);
 }
 
 static void
@@ -1581,12 +1586,30 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
 }
 
+static void
+xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	/* FIXME: Actual workarounds will be added in future patch(es) */
+
+	/*
+	 * Unlike older platforms, we no longer setup implicit steering here;
+	 * all MCR accesses are explicitly steered.
+	 */
+	debug_dump_steering(gt);
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
-	if (IS_PONTEVECCHIO(i915))
+	/* FIXME: Media GT handling will be added in an upcoming patch */
+	if (gt->type == GT_MEDIA)
+		return;
+
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		xelpg_gt_workarounds_init(gt, wal);
+	else if (IS_PONTEVECCHIO(i915))
 		pvc_gt_workarounds_init(gt, wal);
 	else if (IS_DG2(i915))
 		dg2_gt_workarounds_init(gt, wal);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 40bb06c5cdc0..496df0f547f4 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
 	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
+	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-- 
2.37.3

