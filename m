Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C8753C181
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 02:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A40010E317;
	Fri,  3 Jun 2022 00:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776A10E317;
 Fri,  3 Jun 2022 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654217617; x=1685753617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B4EuO1WJ7OZI/BH26jKKwClk9dz/pK7O0qEwdgsL600=;
 b=k53q8O03q+TTl37ULxKdVrxOa6jAnxQ6WHfD9gpjkQaMG2h3UR6PAczY
 oR1fbpGOJfhfPdRIdBUu5oTNt3shIDnMOPSkpgNOz1YF0DQkicrmNWd3t
 0fN66CGqTFrzprYnC8Sdcv63DsxD4yixZ2C+pNFx62Hnijk/RJ/ZEdaYs
 sEOaOCv67/sPJ+Sx4n4UbltiPv+FBV8Rx8E5y+f59RsdroiGtWCn2hFcU
 jdce8vb88HTWivIPWwfnOCy+X9pCb1TfzcMBg3Xbk1yDxJj7UsF2TUVB+
 O2Vhx/HQ5JTashGH3KnwPNP/u2PyHnU7/9zC4lnEiSVXURMljv2GcGjHQ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="301499301"
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; d="scan'208";a="301499301"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 17:53:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; d="scan'208";a="757260382"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 17:53:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pvc: Add register steering
Date: Thu,  2 Jun 2022 17:53:35 -0700
Message-Id: <20220603005335.1733129-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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

Ponte Vecchio no longer has MSLICE or LNCF steering, but the bspec does
document several new types of multicast register ranges.  Fortunately,
most of the different MCR types all provide valid values at instance
(0,0) so there's no need to read fuse registers and calculate a valid
instance.  We'll lump all of those range types (BSLICE, HALFBSLICE,
TILEPSMI, CC, and L3BANK) into a single category called "INSTANCE0" to
keep things simple.  We'll also perform explicit steering for each of
these multicast register types, even if the implicit steering setup for
COMPUTE/DSS ranges would have worked too; this is based on guidance from
our hardware architects who suggested that we move away from implicit
steering and start explicitly steer all MCR register accesses on modern
platforms (we'll work on transitioning COMPUTE/DSS to explicit steering
in the future).

Note that there's one additional MCR range type defined in the bspec
(SQIDI) that we don't handle here.  Those ranges use a different
steering control register that we never touch; since instance 0 is also
always a valid setting there, we can just ignore those ranges.

Finally, we'll rename the HAS_MSLICES() macro to HAS_MSLICE_STEERING().
PVC hardware still has units referred to as mslices, but there's no
register steering based on mslice for this platform.

Bspec: 67609
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 50 ++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  7 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 22 ++++++++-
 drivers/gpu/drm/i915/i915_drv.h             |  3 +-
 drivers/gpu/drm/i915/i915_pci.c             |  3 +-
 drivers/gpu/drm/i915/intel_device_info.h    |  2 +-
 6 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index ddfb98f70489..b335eacd7a6c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -106,6 +106,7 @@ static const char * const intel_steering_types[] = {
 	"L3BANK",
 	"MSLICE",
 	"LNCF",
+	"INSTANCE 0",
 };
 
 static const struct intel_mmio_range icl_l3bank_steering_table[] = {
@@ -133,6 +134,27 @@ static const struct intel_mmio_range dg2_lncf_steering_table[] = {
 	{},
 };
 
+/*
+ * We have several types of MCR registers on PVC where steering to (0,0)
+ * will always provide us with a non-terminated value.  We'll stick them
+ * all in the same table for simplicity.
+ */
+static const struct intel_mmio_range pvc_instance0_steering_table[] = {
+	{ 0x004000, 0x004AFF },		/* HALF-BSLICE */
+	{ 0x008A80, 0x008AFF },		/* TILEPSMI */
+	{ 0x008800, 0x00887F },		/* CC */
+	{ 0x00B000, 0x00B0FF },		/* HALF-BSLICE */
+	{ 0x00B100, 0x00B3FF },		/* L3BANK */
+	{ 0x00C800, 0x00CFFF },		/* HALF-BSLICE */
+	{ 0x00D800, 0x00D8FF },		/* HALF-BSLICE */
+	{ 0x00DD00, 0x00DDFF },		/* BSLICE */
+	{ 0x00E900, 0x00E9FF },		/* HALF-BSLICE */
+	{ 0x00EC00, 0x00EEFF },		/* HALF-BSLICE */
+	{ 0x00F000, 0x00FFFF },		/* HALF-BSLICE */
+	{ 0x024180, 0x0241FF },		/* HALF-BSLICE */
+	{},
+};
+
 int intel_gt_init_mmio(struct intel_gt *gt)
 {
 	struct drm_i915_private *i915 = gt->i915;
@@ -146,7 +168,7 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 	 * An mslice is unavailable only if both the meml3 for the slice is
 	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
 	 */
-	if (HAS_MSLICES(i915)) {
+	if (HAS_MSLICE_STEERING(i915)) {
 		gt->info.mslice_mask =
 			intel_slicemask_from_xehp_dssmask(gt->info.sseu.subslice_mask,
 							  GEN_DSS_PER_MSLICE);
@@ -158,7 +180,9 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 			drm_warn(&i915->drm, "mslice mask all zero!\n");
 	}
 
-	if (IS_DG2(i915)) {
+	if (IS_PONTEVECCHIO(i915)) {
+		gt->steering_table[INSTANCE0] = pvc_instance0_steering_table;
+	} else if (IS_DG2(i915)) {
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
 		gt->steering_table[LNCF] = dg2_lncf_steering_table;
 	} else if (IS_XEHPSDV(i915)) {
@@ -172,7 +196,11 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 			GEN10_L3BANK_MASK;
 		if (!gt->info.l3bank_mask) /* should be impossible! */
 			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
-	} else if (HAS_MSLICES(i915)) {
+	} else if (GRAPHICS_VER(i915) >= 11) {
+		/*
+		 * We expect all modern platforms to have at least some
+		 * type of steering that needs to be initialized.
+		 */
 		MISSING_CASE(INTEL_INFO(i915)->platform);
 	}
 
@@ -888,7 +916,7 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
 		*subsliceid = __ffs(gt->info.l3bank_mask);
 		break;
 	case MSLICE:
-		GEM_WARN_ON(!HAS_MSLICES(gt->i915));
+		GEM_WARN_ON(!HAS_MSLICE_STEERING(gt->i915));
 		*sliceid = __ffs(gt->info.mslice_mask);
 		*subsliceid = 0;	/* unused */
 		break;
@@ -897,10 +925,18 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
 		 * An LNCF is always present if its mslice is present, so we
 		 * can safely just steer to LNCF 0 in all cases.
 		 */
-		GEM_WARN_ON(!HAS_MSLICES(gt->i915));
+		GEM_WARN_ON(!HAS_MSLICE_STEERING(gt->i915));
 		*sliceid = __ffs(gt->info.mslice_mask) << 1;
 		*subsliceid = 0;	/* unused */
 		break;
+	case INSTANCE0:
+		/*
+		 * There are a lot of MCR types for which instance (0, 0)
+		 * will always provide a non-terminated value.
+		 */
+		*sliceid = 0;
+		*subsliceid = 0;
+		break;
 	default:
 		MISSING_CASE(type);
 		*sliceid = 0;
@@ -1020,7 +1056,9 @@ void intel_gt_report_steering(struct drm_printer *p, struct intel_gt *gt,
 		   gt->default_steering.groupid,
 		   gt->default_steering.instanceid);
 
-	if (HAS_MSLICES(gt->i915)) {
+	if (IS_PONTEVECCHIO(gt->i915)) {
+		report_steering_type(p, gt, INSTANCE0, dump_table);
+	} else if (HAS_MSLICE_STEERING(gt->i915)) {
 		report_steering_type(p, gt, MSLICE, dump_table);
 		report_steering_type(p, gt, LNCF, dump_table);
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 993f003dad1d..df708802889d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -59,6 +59,13 @@ enum intel_steering_type {
 	MSLICE,
 	LNCF,
 
+	/*
+	 * On some platforms there are multiple types of MCR registers that
+	 * will always return a non-terminated value at instance (0, 0).  We'll
+	 * lump those all into a single category to keep things simple.
+	 */
+	INSTANCE0,
+
 	NUM_STEERING_TYPES
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index eb0598593724..1b191b234160 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1195,6 +1195,20 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
 }
 
+static void
+pvc_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	unsigned int dss;
+
+	/*
+	 * Setup implicit steering for COMPUTE and DSS ranges to the first
+	 * non-fused-off DSS.  All other types of MCR registers will be
+	 * explicitly steered.
+	 */
+	dss = intel_sseu_find_first_xehp_dss(&gt->info.sseu, 0, 0);
+	__add_mcr_wa(gt, wal, dss / GEN_DSS_PER_CSLICE, dss % GEN_DSS_PER_CSLICE);
+}
+
 static void
 icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
@@ -1488,13 +1502,19 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_write_or(wal, GEN12_SQCM, EN_32B_ACCESS);
 }
 
+static void
+pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
+{
+	pvc_init_mcr(gt, wal);
+}
+
 static void
 gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
 
 	if (IS_PONTEVECCHIO(i915))
-		; /* none yet */
+		pvc_gt_workarounds_init(gt, wal);
 	else if (IS_DG2(i915))
 		dg2_gt_workarounds_init(gt, wal);
 	else if (IS_XEHPSDV(i915))
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index c3854b8a014f..5870cf9eb0b4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1283,8 +1283,7 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_RUNTIME_PM(dev_priv) (INTEL_INFO(dev_priv)->has_runtime_pm)
 #define HAS_64BIT_RELOC(dev_priv) (INTEL_INFO(dev_priv)->has_64bit_reloc)
 
-#define HAS_MSLICES(dev_priv) \
-	(INTEL_INFO(dev_priv)->has_mslices)
+#define HAS_MSLICE_STEERING(dev_priv)	(INTEL_INFO(dev_priv)->has_mslice_steering)
 
 /*
  * Set this flag, when platform requires 64K GTT page sizes or larger for
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index a5a1a7647320..5e51fc29bb8b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1021,7 +1021,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_llc = 1, \
 	.has_logical_ring_contexts = 1, \
 	.has_logical_ring_elsq = 1, \
-	.has_mslices = 1, \
+	.has_mslice_steering = 1, \
 	.has_rc6 = 1, \
 	.has_reset_engine = 1, \
 	.has_rps = 1, \
@@ -1091,6 +1091,7 @@ static const struct intel_device_info ats_m_info = {
 	.has_3d_pipeline = 0, \
 	.has_guc_deprivilege = 1, \
 	.has_l3_ccs_read = 1, \
+	.has_mslice_steering = 0, \
 	.has_one_eu_per_fuse_bit = 1
 
 __maybe_unused
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 346f17f2dce8..08341174ee0a 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -157,7 +157,7 @@ enum intel_ppgtt_type {
 	func(has_logical_ring_contexts); \
 	func(has_logical_ring_elsq); \
 	func(has_media_ratio_mode); \
-	func(has_mslices); \
+	func(has_mslice_steering); \
 	func(has_one_eu_per_fuse_bit); \
 	func(has_pooled_eu); \
 	func(has_pxp); \
-- 
2.35.3

