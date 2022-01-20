Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC1E4955FB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 22:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785410E406;
	Thu, 20 Jan 2022 21:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C622710E406;
 Thu, 20 Jan 2022 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642714316; x=1674250316;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=frYaEpMqMtnKGrUSSPSsms9Qfvkpso1hlDm++zhGSac=;
 b=R37q8TYJ/VTc+oftA7em8YA4Qw5Lofhygx54D+SySjv1PRjPisLx3gbX
 kdao8krWWwPHTzpdyo1y8Oencqw+n33g1CUP4LpMO+ZhDZsM0OJrHnCOS
 01rOuUY+3BkAQT4ByPFcGcYNaYMlk8A1aA6WQN0m7VRREjGZCWcc/lGpD
 388DWmsIh54kJWKOTDIbxG16rrSxibbEBfK7Sk5y0vQqd1ecns200qpuk
 1eKJ+83h1fbzKHkfq2W9KEEnLME+RCRoFgTiqFq03w6B/3xbjhp9CO6uM
 e+RAFKO2nVle5M9fEGBJaTfM2cd5zabAZIE3vnpw+v7pai5GHMmbWVuxE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245428320"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245428320"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 13:31:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="477963251"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 13:31:53 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI] drm/i915/wopcm: Handle pre-programmed WOPCM registers
Date: Thu, 20 Jan 2022 13:29:47 -0800
Message-Id: <20220120212947.3440448-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from DG2, some of the programming previously done by i915 and
the GuC has been moved to the GSC and the relevant registers are no
longer writable by either CPU or GuC. This is also referred to as GuC
deprivilege.
On the i915 side, this affects the WOPCM registers: these are no longer
programmed by the driver and we do instead expect to find them already
set. This can lead to verification failures because in i915 we cheat a bit
with the WOPCM size defines, to keep the code common across platforms, by
sometimes using a smaller WOPCM size that the actual HW support (which isn't
a problem because the extra size is not needed if the FW fits in the smaller
chunk), while the pre-programmed values can use the actual size.
Given tha the new programming entity is trusted, relax the amount of the
checks done on the pre-programmed values by not limiting the max
programmed size. In the extremely unlikely scenario that the registers
have been misprogrammed, we will still fail later at DMA time.

v2: drop special case for DG2 G10 A0 (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  3 ++
 drivers/gpu/drm/i915/i915_drv.h            |  3 ++
 drivers/gpu/drm/i915/i915_pci.c            |  1 +
 drivers/gpu/drm/i915/intel_device_info.h   |  1 +
 drivers/gpu/drm/i915/intel_wopcm.c         | 42 ++++++++++++++++++----
 5 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index e6bd66d6ce5a..cdb47c2291c8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -94,6 +94,9 @@
 #define   GUC_ENABLE_MIA_CLOCK_GATING		(1<<15)
 #define   GUC_GEN10_SHIM_WC_ENABLE		(1<<21)
 
+#define GUC_SHIM_CONTROL2		_MMIO(0xc068)
+#define   GUC_IS_PRIVILEGED		(1<<29)
+
 #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
 #define   GUC_SEND_TRIGGER		  (1<<0)
 #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 890f1f6fbc49..0ba820ec4e49 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1557,6 +1557,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define INTEL_DISPLAY_ENABLED(dev_priv) \
 	(drm_WARN_ON(&(dev_priv)->drm, !HAS_DISPLAY(dev_priv)), !(dev_priv)->params.disable_display)
 
+#define HAS_GUC_DEPRIVILEGE(dev_priv) \
+	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
+
 static inline bool run_as_guest(void)
 {
 	return !hypervisor_is_type(X86_HYPER_NATIVE);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 8261b6455747..983546d5f415 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1045,6 +1045,7 @@ static const struct intel_device_info dg2_info = {
 	.graphics.rel = 55,
 	.media.rel = 55,
 	PLATFORM(INTEL_DG2),
+	.has_guc_deprivilege = 1,
 	.has_64k_pages = 1,
 	.platform_engine_mask =
 		BIT(RCS0) | BIT(BCS0) |
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 3699b1c539ea..abf1e103c558 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -134,6 +134,7 @@ enum intel_ppgtt_type {
 	func(has_reset_engine); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
+	func(has_guc_deprivilege); \
 	func(has_l3_dpf); \
 	func(has_llc); \
 	func(has_logical_ring_contexts); \
diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/intel_wopcm.c
index f06d21005106..322fb9eeb880 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/intel_wopcm.c
@@ -43,6 +43,7 @@
 /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
 #define GEN11_WOPCM_SIZE		SZ_2M
 #define GEN9_WOPCM_SIZE			SZ_1M
+#define MAX_WOPCM_SIZE			SZ_8M
 /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
 #define WOPCM_RESERVED_SIZE		SZ_16K
 
@@ -207,6 +208,14 @@ static bool __wopcm_regs_locked(struct intel_uncore *uncore,
 	return true;
 }
 
+static bool __wopcm_regs_writable(struct intel_uncore *uncore)
+{
+	if (!HAS_GUC_DEPRIVILEGE(uncore->i915))
+		return true;
+
+	return intel_uncore_read(uncore, GUC_SHIM_CONTROL2) & GUC_IS_PRIVILEGED;
+}
+
 /**
  * intel_wopcm_init() - Initialize the WOPCM structure.
  * @wopcm: pointer to intel_wopcm.
@@ -224,18 +233,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
 	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
 	u32 ctx_rsvd = context_reserved_size(i915);
+	u32 wopcm_size = wopcm->size;
 	u32 guc_wopcm_base;
 	u32 guc_wopcm_size;
 
 	if (!guc_fw_size)
 		return;
 
-	GEM_BUG_ON(!wopcm->size);
+	GEM_BUG_ON(!wopcm_size);
 	GEM_BUG_ON(wopcm->guc.base);
 	GEM_BUG_ON(wopcm->guc.size);
-	GEM_BUG_ON(guc_fw_size >= wopcm->size);
-	GEM_BUG_ON(huc_fw_size >= wopcm->size);
-	GEM_BUG_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
+	GEM_BUG_ON(guc_fw_size >= wopcm_size);
+	GEM_BUG_ON(huc_fw_size >= wopcm_size);
+	GEM_BUG_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm_size);
 
 	if (i915_inject_probe_failure(i915))
 		return;
@@ -243,6 +253,24 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 	if (__wopcm_regs_locked(gt->uncore, &guc_wopcm_base, &guc_wopcm_size)) {
 		drm_dbg(&i915->drm, "GuC WOPCM is already locked [%uK, %uK)\n",
 			guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
+		/*
+		 * Note that to keep things simple (i.e. avoid different
+		 * defines per platform) our WOPCM math doesn't always use the
+		 * actual WOPCM size, but a value that is less or equal to it.
+		 * This is perfectly fine when i915 programs the registers, but
+		 * on platforms with GuC deprivilege the registers are not
+		 * writable from i915 and are instead pre-programmed by the
+		 * bios/IFWI, so there might be a mismatch of sizes.
+		 * Instead of handling the size difference, we trust that the
+		 * programmed values make sense and disable the relevant check
+		 * by using the maximum possible WOPCM size in the verification
+		 * math. In the extremely unlikely case that the registers
+		 * were pre-programmed with an invalid value, we will still
+		 * gracefully fail later during the GuC/HuC dma.
+		 */
+		if (!__wopcm_regs_writable(gt->uncore))
+			wopcm_size = MAX_WOPCM_SIZE;
+
 		goto check;
 	}
 
@@ -257,17 +285,17 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 	 * Need to clamp guc_wopcm_base now to make sure the following math is
 	 * correct. Formal check of whole WOPCM layout will be done below.
 	 */
-	guc_wopcm_base = min(guc_wopcm_base, wopcm->size - ctx_rsvd);
+	guc_wopcm_base = min(guc_wopcm_base, wopcm_size - ctx_rsvd);
 
 	/* Aligned remainings of usable WOPCM space can be assigned to GuC. */
-	guc_wopcm_size = wopcm->size - ctx_rsvd - guc_wopcm_base;
+	guc_wopcm_size = wopcm_size - ctx_rsvd - guc_wopcm_base;
 	guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
 
 	drm_dbg(&i915->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
 		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
 
 check:
-	if (__check_layout(i915, wopcm->size, guc_wopcm_base, guc_wopcm_size,
+	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
 			   guc_fw_size, huc_fw_size)) {
 		wopcm->guc.base = guc_wopcm_base;
 		wopcm->guc.size = guc_wopcm_size;
-- 
2.25.1

