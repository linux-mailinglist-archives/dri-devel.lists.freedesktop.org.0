Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612375BD778
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 00:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518C10E1DE;
	Mon, 19 Sep 2022 22:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3DA10E078;
 Mon, 19 Sep 2022 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663626790; x=1695162790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u36AePt6DR4rY5Gml/o9wYyYUFz6u/FU7etgRkvBvQo=;
 b=IBV3SOJD7HXTqTMHAU6lj7BfYM1CY2lHZ1wjfo2bC0wAwXIvj53Mg8uP
 11Ilel5RTx0stoUbQecCxYj5bXdaFmDxeLYvzJCzb5Idq6T4hr/hB3ioq
 skbvMcUUXmyr/j1MPqeuVaU9asmAp9GXWiyhndGYR42NaghYSafQOcrhQ
 ickJyZCi43R5xyhO32L+QC6Q6KQYVNHanTy06fuVzhGwX23YiFJMg/XnS
 zGqyXfQJQj/olO3CKHM6E+17wY8veNDskn/8ziJjAeoqudiR28jQ47Dh4
 7hPu+NvbX+1emk0aVB1uZtasfpsNOhzV4kgXCrSqMY7VTn3RtBuu52q/s g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279920541"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="279920541"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="794030789"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:33:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/i915/mtl: Add multicast steering for render GT
Date: Mon, 19 Sep 2022 15:32:58 -0700
Message-Id: <20220919223259.263525-12-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTL once again changes the multicast register types and steering
details.  Key changes from past platforms:
 * The number of instances of some MCR types (NODE, OAAL2, and GAM) vary
   according to the MTL subplatform and cannot be read from fuse
   registers.
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

Bspec: 67788, 67112
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 85 ++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  8 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 ++++-
 drivers/gpu/drm/i915/i915_pci.c             |  1 +
 5 files changed, 102 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 8f9009af3673..05f41f1cc88d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -40,6 +40,7 @@ static const char * const intel_steering_types[] = {
 	"L3BANK",
 	"MSLICE",
 	"LNCF",
+	"DSS",
 	"INSTANCE 0",
 };
 
@@ -89,9 +90,40 @@ static const struct intel_mmio_range pvc_instance0_steering_table[] = {
 	{},
 };
 
+static const struct intel_mmio_range mtl3d_instance0_steering_table[] = {
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
+static const struct intel_mmio_range mtl3d_l3bank_steering_table[] = {
+	{ 0x00B100, 0x00B3FF },
+	{},
+};
+
+/* DSS steering is used for SLICE ranges as well */
+static const struct intel_mmio_range mtl3d_dss_steering_table[] = {
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
@@ -109,7 +141,22 @@ void intel_gt_mcr_init(struct intel_gt *gt)
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
+			gt->info.l3bank_mask |= (0x3 << 2*i);
+
+		gt->steering_table[INSTANCE0] = mtl3d_instance0_steering_table;
+		gt->steering_table[L3BANK] = mtl3d_l3bank_steering_table;
+		gt->steering_table[DSS] = mtl3d_dss_steering_table;
+	} else if (IS_PONTEVECCHIO(i915)) {
 		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
 	} else if (IS_DG2(i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
@@ -168,7 +215,12 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 
 	lockdep_assert_held(&uncore->lock);
 
-	if (GRAPHICS_VER(uncore->i915) >= 11) {
+	if (GRAPHICS_VER_FULL(uncore->i915) >= IP_VER(12, 70)) {
+		/* No need to save old steering reg value */
+		intel_uncore_write_fw(uncore, MTL_MCR_SELECTOR,
+				      REG_FIELD_PREP(MTL_MCR_GROUPID, group) |
+				      REG_FIELD_PREP(MTL_MCR_INSTANCEID, instance));
+	} else if (GRAPHICS_VER(uncore->i915) >= 11) {
 		mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN11_MCR_SLICE(group) | GEN11_MCR_SUBSLICE(instance);
 
@@ -186,26 +238,30 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 		 */
 		if (rw_flag == FW_REG_WRITE)
 			mcr_mask |= GEN11_MCR_MULTICAST;
+
+		old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
+
+		mcr &= ~mcr_mask;
+		mcr |= mcr_ss;
+		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
 	} else {
 		mcr_mask = GEN8_MCR_SLICE_MASK | GEN8_MCR_SUBSLICE_MASK;
 		mcr_ss = GEN8_MCR_SLICE(group) | GEN8_MCR_SUBSLICE(instance);
-	}
 
-	old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
+		old_mcr = mcr = intel_uncore_read_fw(uncore, GEN8_MCR_SELECTOR);
 
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
+	if (GRAPHICS_VER_FULL(uncore->i915) < IP_VER(12, 70))
+		intel_uncore_write_fw(uncore, GEN8_MCR_SELECTOR, mcr);
 
 	return val;
 }
@@ -345,6 +401,8 @@ static void get_nonterminated_steering(struct intel_gt *gt,
 				       enum intel_steering_type type,
 				       u8 *group, u8 *instance)
 {
+	u32 dss;
+
 	switch (type) {
 	case L3BANK:
 		*group = 0;		/* unused */
@@ -364,6 +422,11 @@ static void get_nonterminated_steering(struct intel_gt *gt,
 		*group = __ffs(gt->info.mslice_mask) << 1;
 		*instance = 0;	/* unused */
 		break;
+	case DSS:
+		dss = intel_sseu_find_first_xehp_dss(&gt->info.sseu, 0, 0);
+		*group = dss / GEN_DSS_PER_GSLICE;
+		*instance = dss % GEN_DSS_PER_GSLICE;
+		break;
 	case INSTANCE0:
 		/*
 		 * There are a lot of MCR types for which instance (0, 0)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 4b5692d84858..6363b4038556 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -56,6 +56,7 @@
 #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
 
 #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
+#define MTL_MCR_SELECTOR			_MMIO(0xfd4)
 #define SF_MCR_SELECTOR				_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
 #define   GEN8_MCR_SLICE(slice)			(((slice) & 3) << 26)
@@ -67,6 +68,8 @@
 #define   GEN11_MCR_SLICE_MASK			GEN11_MCR_SLICE(0xf)
 #define   GEN11_MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
 #define   GEN11_MCR_SUBSLICE_MASK		GEN11_MCR_SUBSLICE(0x7)
+#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
+#define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
 #define IPEIR_I965				_MMIO(0x2064)
 #define IPEHR_I965				_MMIO(0x2068)
@@ -527,6 +530,8 @@
 #define   GEN6_MBCTL_BOOT_FETCH_MECH		(1 << 0)
 
 /* Fuse readout registers for GT */
+#define XEHP_FUSE4				_MMIO(0x9114)
+#define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 #define	GEN10_MIRROR_FUSE3			_MMIO(0x9118)
 #define   GEN10_L3BANK_PAIR_COUNT		4
 #define   GEN10_L3BANK_MASK			0x0F
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f19c2de77ff6..2a0441410ec7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -59,6 +59,7 @@ enum intel_steering_type {
 	L3BANK,
 	MSLICE,
 	LNCF,
+	DSS,
 
 	/*
 	 * On some platforms there are multiple types of MCR registers that
@@ -254,8 +255,6 @@ struct intel_gt {
 
 		intel_engine_mask_t engine_mask;
 
-		u32 l3bank_mask;
-
 		u8 num_engines;
 
 		/* General presence of SFC units */
@@ -267,7 +266,10 @@ struct intel_gt {
 		/* Slice/subslice/EU info */
 		struct sseu_dev_info sseu;
 
-		unsigned long mslice_mask;
+		union {
+			unsigned long mslice_mask;
+			unsigned long l3bank_mask;
+		};
 
 		/** @hwconfig: hardware configuration data */
 		struct intel_hwconfig hwconfig;
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 0f18872a7995..2562ad83966b 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1571,12 +1571,28 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_write_clr(wal, GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
 }
 
+static void
+mtl_3d_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	/*
+	 * Unlike older platforms, we no longer setup implicit steering here;
+	 * all MCR accesses are explicitly steered.
+	 */
+	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+		struct drm_printer p = drm_debug_printer("MCR Steering:");
+
+		intel_gt_mcr_report_steering(&p, gt, false);
+	}
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
-	if (IS_PONTEVECCHIO(i915))
+	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
+		mtl_3d_gt_workarounds_init(gt, wal);
+	else if (IS_PONTEVECCHIO(i915))
 		pvc_gt_workarounds_init(gt, wal);
 	else if (IS_DG2(i915))
 		dg2_gt_workarounds_init(gt, wal);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 77e7df21f539..3af94d8289df 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
 	.display.has_modular_fia = 1,
 	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
+	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-- 
2.37.3

