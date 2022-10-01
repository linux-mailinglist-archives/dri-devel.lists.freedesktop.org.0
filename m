Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE695F1791
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 02:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF1A10EDFB;
	Sat,  1 Oct 2022 00:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC8410EDF0;
 Sat,  1 Oct 2022 00:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664585183; x=1696121183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GPdL2exlDBty4p4AMkfnE0rWzlUtuRhJ4DZcKwA7nBM=;
 b=Ruht+TXPuQWHniAoS3X0jg/9obk5/65+8a4y9PW8zNTnpBgMf+8VLKel
 bMqXwim/R6NEM3Fj+DPhJM9SyRnnxYXsqB1Jf7QgMFSzfo+abXOhe9Tqp
 c0rqNl4etZaQX4b6MS0DLcR3bvRDWU2pVnRCWB467b+CTpfTpflpHEB/B
 8iDz1rt563ErmnhhVt5avq3mwaTP0SynMRi45578ngmyqXriZUIQa3uWQ
 7fIdTsGbjAYoOh1QISZ8mPm3UNFbzPMS3Wr1Co8yc+cFVy1+LK3UHKqns
 juotYUZdUb4elkb5QGoVSjwUpuyn8JsYj21/7GKrs4EKqeM5kM+p4rBiw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="388607937"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="388607937"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685477649"
X-IronPort-AV: E=Sophos;i="5.93,359,1654585200"; d="scan'208";a="685477649"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 17:46:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 13/14] drm/i915/mtl: Add multicast steering for render GT
Date: Fri, 30 Sep 2022 17:45:49 -0700
Message-Id: <20221001004550.3031431-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001004550.3031431-1-matthew.d.roper@intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
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
Cc: ravi.kumar.vodapalli@intel.com, balasubramani.vivekanandan@intel.com,
 dri-devel@lists.freedesktop.org,
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
index 9e2caba64f19..a1fa71b47831 100644
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
+			gt->info.l3bank_mask |= (0x3 << 2*i);
+
+		gt->steering_table[INSTANCE0] = mtl3d_instance0_steering_table;
+		gt->steering_table[L3BANK] = mtl3d_l3bank_steering_table;
+		gt->steering_table[DSS] = mtl3d_dss_steering_table;
+	} else if (IS_PONTEVECCHIO(i915)) {
 		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
 	} else if (IS_DG2(i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
@@ -184,7 +231,12 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
 
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
 
@@ -202,26 +254,30 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
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
@@ -385,6 +441,8 @@ static void get_nonterminated_steering(struct intel_gt *gt,
 				       enum intel_steering_type type,
 				       u8 *group, u8 *instance)
 {
+	u32 dss;
+
 	switch (type) {
 	case L3BANK:
 		*group = 0;		/* unused */
@@ -408,6 +466,11 @@ static void get_nonterminated_steering(struct intel_gt *gt,
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
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index b7341f01ec9f..c5b9671097e3 100644
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
index 30003d68fd51..77ecbd6be331 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -60,6 +60,7 @@ enum intel_steering_type {
 	MSLICE,
 	LNCF,
 	GAM,
+	DSS,
 
 	/*
 	 * On some platforms there are multiple types of MCR registers that
@@ -255,8 +256,6 @@ struct intel_gt {
 
 		intel_engine_mask_t engine_mask;
 
-		u32 l3bank_mask;
-
 		u8 num_engines;
 
 		/* General presence of SFC units */
@@ -268,7 +267,10 @@ struct intel_gt {
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
index 174c74dcda99..9be048da7fb3 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1581,12 +1581,28 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_clr(wal, GEN8_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE);
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
index 38460a0bd7cb..bd1d8e0205a6 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1145,6 +1145,7 @@ static const struct intel_device_info mtl_info = {
 	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
 	.has_gmd_id = 1,
+	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-- 
2.37.3

