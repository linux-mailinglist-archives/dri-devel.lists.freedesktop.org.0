Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F26082B9
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEE310E42F;
	Sat, 22 Oct 2022 00:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B1310E27E;
 Sat, 22 Oct 2022 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397270; x=1697933270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SIaycq9OCCLKZAyU1UsRjqMBrzDthVCRo2noVHAM2YE=;
 b=mvfX3ISXwMWqPHBB8lbZPleET6yh5l6rF1JBioTg4e43228lMY+zyifm
 HJE1Kf8hP1kq2KrmNeHUzDYa9XltvnrHQ7BZfhaTuzzzE9/n1M0gN+Mcy
 wNDaeBsa28/59B2ubgbQ5+9v75bA5WWUJFEiCk2c1e5IVxMJnX9Jr3Mmc
 4wtsGyu3/0JAC3M3Nvv6nn7wKGfEz7P7bRPJkFp7WP9hk5ficdJA9ravG
 1OVh3KHpRizJk/SlsbLI/J4w8L3JWkiC+RAvuSZMegpqWpnTEGlJ+Vvzf
 2HDROuXoABEkaAKomLokKLaebPwmbJpH+rcV27h1589GpHgZd+EGQpbyX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354929"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917242"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917242"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Date: Fri, 21 Oct 2022 17:10:06 -0700
Message-Id: <20221022001008.2340224-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

With MTL standalone media architecture the wopcm layout has changed with
separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.

    +=====+===> +====================+ <== WOPCM TOP
    ^     ^     |                    |
    |     |     |                    |
    |    GCD    |   GCD RC6 Image    |
    |    GuC    |    Power Context   |
    |    WOPCM  |                    |
    |    Size   +--------------------+
    |     |     |   GCD GuC Image    |
    |     |     |                    |
    |     v     |                    |
    |     +===> +====================+ <== SA Media GuC WOPCM Top
    |     ^     |                    |
    |   SA Media|                    |
    |    GuC    | SA Media RC6 Image |
    |   WOPCM   |    Power Context   |
    |    Size   |                    |
  WOPCM   |     +--------------------+
    |     |     |                    |
    |     |     | SA Media GuC Image |
    |     v     |                    |
    |     +===> +====================+ <== GuC WOPCM base
    |           |     WOPCM RSVD     |
    |           +------------------- + <== HuC Firmware Top
    v           |      HuC FW        |
    +=========> +====================+ <== WOPCM Base

Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
by the bios. Therefore, we can skip all the math for the partitioning
and just limit ourselves to sanity checking the values.

v2: fix makefile file ordering (Jani)
v3: drop XELPM_SAMEDIA_WOPCM_SIZE, check huc instead of VDBOX (John)

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 Documentation/gpu/i915.rst                  |  2 +-
 drivers/gpu/drm/i915/Makefile               |  5 ++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 44 +++++++++++++++------
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 ++++---
 drivers/gpu/drm/i915/i915_driver.c          |  2 -
 drivers/gpu/drm/i915/i915_drv.h             |  3 --
 drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
 12 files changed, 52 insertions(+), 32 deletions(-)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 4e59db1cfb00..60ea21734902 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -494,7 +494,7 @@ WOPCM
 WOPCM Layout
 ~~~~~~~~~~~~
 
-.. kernel-doc:: drivers/gpu/drm/i915/intel_wopcm.c
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_wopcm.c
    :doc: WOPCM Layout
 
 GuC
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 2535593ab379..cf3a96b3cd58 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -127,9 +127,11 @@ gt-y += \
 	gt/intel_sseu.o \
 	gt/intel_sseu_debugfs.o \
 	gt/intel_timeline.o \
+	gt/intel_wopcm.o \
 	gt/intel_workarounds.o \
 	gt/shmem_utils.o \
 	gt/sysfs_engines.o
+
 # x86 intel-gtt module support
 gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
 # autogenerated null render state
@@ -183,8 +185,7 @@ i915-y += \
 	  i915_trace_points.o \
 	  i915_ttm_buddy_manager.o \
 	  i915_vma.o \
-	  i915_vma_resource.o \
-	  intel_wopcm.o
+	  i915_vma_resource.o
 
 # general-purpose microcontroller (GuC) support
 i915-y += gt/uc/intel_uc.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 6b58c95ad6a0..9263f10ecd28 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
 	 * why.
 	 */
 	ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
-			       intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
+			       intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
 
 	ret = intel_vgt_balloon(ggtt);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 27dbb9e4bd6c..8c751314df3d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
 	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
 	intel_gt_pm_init_early(gt);
 
+	intel_wopcm_init_early(&gt->wopcm);
 	intel_uc_init_early(&gt->uc);
 	intel_rps_init_early(&gt->rps);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 64aa2ba624fc..2d18fd9ab11f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -30,6 +30,7 @@
 #include "intel_migrate_types.h"
 #include "intel_wakeref.h"
 #include "pxp/intel_pxp_types.h"
+#include "intel_wopcm.h"
 
 struct drm_i915_private;
 struct i915_ggtt;
@@ -100,6 +101,7 @@ struct intel_gt {
 
 	struct intel_uc uc;
 	struct intel_gsc gsc;
+	struct intel_wopcm wopcm;
 
 	struct {
 		/* Serialize global tlb invalidations */
diff --git a/drivers/gpu/drm/i915/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
similarity index 87%
rename from drivers/gpu/drm/i915/intel_wopcm.c
rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
index 322fb9eeb880..c91f234adc55 100644
--- a/drivers/gpu/drm/i915/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
@@ -64,9 +64,9 @@
 #define GEN9_GUC_FW_RESERVED	SZ_128K
 #define GEN9_GUC_WOPCM_OFFSET	(GUC_WOPCM_RESERVED + GEN9_GUC_FW_RESERVED)
 
-static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
+static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
 {
-	return container_of(wopcm, struct drm_i915_private, wopcm);
+	return container_of(wopcm, struct intel_gt, wopcm);
 }
 
 /**
@@ -77,7 +77,8 @@ static inline struct drm_i915_private *wopcm_to_i915(struct intel_wopcm *wopcm)
  */
 void intel_wopcm_init_early(struct intel_wopcm *wopcm)
 {
-	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
+	struct intel_gt *gt = wopcm_to_gt(wopcm);
+	struct drm_i915_private *i915 = gt->i915;
 
 	if (!HAS_GT_UC(i915))
 		return;
@@ -157,14 +158,16 @@ static bool check_hw_restrictions(struct drm_i915_private *i915,
 	return true;
 }
 
-static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
+static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
 			   u32 guc_wopcm_base, u32 guc_wopcm_size,
 			   u32 guc_fw_size, u32 huc_fw_size)
 {
+	struct drm_i915_private *i915 = gt->i915;
 	const u32 ctx_rsvd = context_reserved_size(i915);
 	u32 size;
 
 	size = wopcm_size - ctx_rsvd;
+
 	if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, size))) {
 		drm_err(&i915->drm,
 			"WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
@@ -181,12 +184,14 @@ static bool __check_layout(struct drm_i915_private *i915, u32 wopcm_size,
 		return false;
 	}
 
-	size = huc_fw_size + WOPCM_RESERVED_SIZE;
-	if (unlikely(guc_wopcm_base < size)) {
-		drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
-			intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
-			guc_wopcm_base / SZ_1K, size / SZ_1K);
-		return false;
+	if (intel_uc_supports_huc(&gt->uc)) {
+		size = huc_fw_size + WOPCM_RESERVED_SIZE;
+		if (unlikely(guc_wopcm_base < size)) {
+			drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
+				intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
+				guc_wopcm_base / SZ_1K, size / SZ_1K);
+			return false;
+		}
 	}
 
 	return check_hw_restrictions(i915, guc_wopcm_base, guc_wopcm_size,
@@ -228,8 +233,8 @@ static bool __wopcm_regs_writable(struct intel_uncore *uncore)
  */
 void intel_wopcm_init(struct intel_wopcm *wopcm)
 {
-	struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
-	struct intel_gt *gt = to_gt(i915);
+	struct intel_gt *gt = wopcm_to_gt(wopcm);
+	struct drm_i915_private *i915 = gt->i915;
 	u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
 	u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
 	u32 ctx_rsvd = context_reserved_size(i915);
@@ -274,6 +279,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 		goto check;
 	}
 
+	/*
+	 * On platforms with a media GT, the WOPCM is partitioned between the
+	 * two GTs, so we would have to take that into account when doing the
+	 * math below. There is also a new section reserved for the GSC context
+	 * that would have to be factored in. However, all platforms with a
+	 * media GT also have GuC depriv enabled, so the WOPCM regs are
+	 * pre-locked and therefore we don't have to do the math ourselves.
+	 */
+	if (unlikely(i915->media_gt)) {
+		drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
+		return;
+	}
+
 	/*
 	 * Aligned value of guc_wopcm_base will determine available WOPCM space
 	 * for HuC firmware and mandatory reserved area.
@@ -295,7 +313,7 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
 		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
 
 check:
-	if (__check_layout(i915, wopcm_size, guc_wopcm_base, guc_wopcm_size,
+	if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
 			   guc_fw_size, huc_fw_size)) {
 		wopcm->guc.base = guc_wopcm_base;
 		wopcm->guc.size = guc_wopcm_size;
diff --git a/drivers/gpu/drm/i915/intel_wopcm.h b/drivers/gpu/drm/i915/gt/intel_wopcm.h
similarity index 100%
rename from drivers/gpu/drm/i915/intel_wopcm.h
rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index dbd048b77e19..4cd8a787f9e5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
 {
 	struct intel_gt *gt = uc_to_gt(uc);
 	struct intel_uncore *uncore = gt->uncore;
-	u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
-	u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
+	u32 base = intel_wopcm_guc_base(&gt->wopcm);
+	u32 size = intel_wopcm_guc_size(&gt->wopcm);
 	u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
 	u32 mask;
 	int err;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 81e06d71c1a8..0c80ba51a4bd 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct firmware *fw,
 	return 0;
 }
 
-static int check_ccs_header(struct drm_i915_private *i915,
+static int check_ccs_header(struct intel_gt *gt,
 			    const struct firmware *fw,
 			    struct intel_uc_fw *uc_fw)
 {
+	struct drm_i915_private *i915 = gt->i915;
 	struct uc_css_header *css;
 	size_t size;
 
@@ -523,10 +524,10 @@ static int check_ccs_header(struct drm_i915_private *i915,
 
 	/* Sanity check whether this fw is not larger than whole WOPCM memory */
 	size = __intel_uc_fw_get_upload_size(uc_fw);
-	if (unlikely(size >= i915->wopcm.size)) {
+	if (unlikely(size >= gt->wopcm.size)) {
 		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path,
-			 size, (size_t)i915->wopcm.size);
+			 size, (size_t)gt->wopcm.size);
 		return -E2BIG;
 	}
 
@@ -554,7 +555,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
  */
 int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 {
-	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
+	struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
+	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uc_fw_file file_ideal;
 	struct device *dev = i915->drm.dev;
 	struct drm_i915_gem_object *obj;
@@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	bool old_ver = false;
 	int err;
 
-	GEM_BUG_ON(!i915->wopcm.size);
+	GEM_BUG_ON(!gt->wopcm.size);
 	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
 
 	err = i915_inject_probe_error(i915, -ENXIO);
@@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (uc_fw->loaded_via_gsc)
 		err = check_gsc_manifest(fw, uc_fw);
 	else
-		err = check_ccs_header(i915, fw, uc_fw);
+		err = check_ccs_header(gt, fw, uc_fw);
 	if (err)
 		goto fail;
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ffff49868dc5..ba4b71aedc40 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -371,8 +371,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_ttm;
 
-	intel_wopcm_init_early(&dev_priv->wopcm);
-
 	ret = intel_root_gt_init_early(dev_priv);
 	if (ret < 0)
 		goto err_rootgt;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 9453fdd4205f..66aa2cd9aefe 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -62,7 +62,6 @@
 #include "intel_runtime_pm.h"
 #include "intel_step.h"
 #include "intel_uncore.h"
-#include "intel_wopcm.h"
 
 struct drm_i915_clock_gating_funcs;
 struct drm_i915_gem_object;
@@ -235,8 +234,6 @@ struct drm_i915_private {
 
 	struct intel_gvt *gvt;
 
-	struct intel_wopcm wopcm;
-
 	struct pci_dev *bridge_dev;
 
 	struct rb_root uabi_engines;
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 9093d2be9e1c..7a9ce81600a0 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	if (ret)
 		return ret;
 
-	for_each_gt(gt, dev_priv, i)
+	for_each_gt(gt, dev_priv, i) {
 		intel_uc_fetch_firmwares(&gt->uc);
-	intel_wopcm_init(&dev_priv->wopcm);
+		intel_wopcm_init(&gt->wopcm);
+	}
 
 	ret = i915_init_ggtt(dev_priv);
 	if (ret) {
-- 
2.37.3

