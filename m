Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B09CF375B4D
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 21:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479786EE32;
	Thu,  6 May 2021 18:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FD16EDAC;
 Thu,  6 May 2021 18:57:15 +0000 (UTC)
IronPort-SDR: txXZ9p44vCTjk7N5Qt5QSXJLjOzvAQvWmhsFW5xcTtqDMqs/coX6QufCFsnzFAd+Lh4C1Yj+Gx
 gjyltSCO+J/A==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="219439493"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="219439493"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:14 -0700
IronPort-SDR: i0UPM06gb9MAfB2LMDyAD3godethxTQ7Ifbq6IRtRKzAeKRKBGi0FJG5MGG7p/ruH45Bna2bra
 5bPLQUrhAH6w==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583642"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 86/97] drm/i915/guc: Add golden context to GuC ADS
Date: Thu,  6 May 2021 12:14:40 -0700
Message-Id: <20210506191451.77768-87-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The media watchdog mechanism involves GuC doing a silent reset and
continue of the hung context. This requires the i915 driver provide a
golden context to GuC in the ADS.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h     |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 213 ++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c      |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.h      |   1 +
 7 files changed, 199 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 1742a8561f69..0e4a5c4c883f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -641,6 +641,8 @@ int intel_gt_init(struct intel_gt *gt)
 	if (err)
 		goto err_gt;
 
+	intel_uc_init_late(&gt->uc);
+
 	err = i915_inject_probe_error(gt->i915, -EIO);
 	if (err)
 		goto err_gt;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index f3240037fb7c..918802712460 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -192,6 +192,11 @@ void intel_guc_init_early(struct intel_guc *guc)
 	}
 }
 
+void intel_guc_init_late(struct intel_guc *guc)
+{
+	intel_guc_ads_init_late(guc);
+}
+
 static u32 guc_ctl_debug_flags(struct intel_guc *guc)
 {
 	u32 level = intel_guc_log_get_level(&guc->log);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 904f3a941832..96849a256be8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -66,6 +66,7 @@ struct intel_guc {
 	struct i915_vma *ads_vma;
 	struct __guc_ads_blob *ads_blob;
 	u32 ads_regset_size;
+	u32 ads_golden_ctxt_size;
 
 	struct i915_vma *lrc_desc_pool;
 	void *lrc_desc_pool_vaddr;
@@ -183,6 +184,7 @@ static inline u32 intel_guc_ggtt_offset(struct intel_guc *guc,
 }
 
 void intel_guc_init_early(struct intel_guc *guc);
+void intel_guc_init_late(struct intel_guc *guc);
 void intel_guc_init_send_regs(struct intel_guc *guc);
 void intel_guc_write_params(struct intel_guc *guc);
 int intel_guc_init(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index bc2745f73a06..299aa580d90a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -7,6 +7,7 @@
 
 #include "gt/intel_gt.h"
 #include "gt/intel_lrc.h"
+#include "gt/shmem_utils.h"
 #include "intel_guc_ads.h"
 #include "intel_guc_fwif.h"
 #include "intel_uc.h"
@@ -35,6 +36,10 @@
  *      +---------------------------------------+ <== dynamic
  *      | padding                               |
  *      +---------------------------------------+ <== 4K aligned
+ *      | golden contexts                       |
+ *      +---------------------------------------+
+ *      | padding                               |
+ *      +---------------------------------------+ <== 4K aligned
  *      | private data                          |
  *      +---------------------------------------+
  *      | padding                               |
@@ -55,6 +60,11 @@ static u32 guc_ads_regset_size(struct intel_guc *guc)
 	return guc->ads_regset_size;
 }
 
+static u32 guc_ads_golden_ctxt_size(struct intel_guc *guc)
+{
+	return PAGE_ALIGN(guc->ads_golden_ctxt_size);
+}
+
 static u32 guc_ads_private_data_size(struct intel_guc *guc)
 {
 	return PAGE_ALIGN(guc->fw.private_data_size);
@@ -65,12 +75,23 @@ static u32 guc_ads_regset_offset(struct intel_guc *guc)
 	return offsetof(struct __guc_ads_blob, regset);
 }
 
-static u32 guc_ads_private_data_offset(struct intel_guc *guc)
+static u32 guc_ads_golden_ctxt_offset(struct intel_guc *guc)
 {
 	u32 offset;
 
 	offset = guc_ads_regset_offset(guc) +
 		 guc_ads_regset_size(guc);
+
+	return PAGE_ALIGN(offset);
+}
+
+static u32 guc_ads_private_data_offset(struct intel_guc *guc)
+{
+	u32 offset;
+
+	offset = guc_ads_golden_ctxt_offset(guc) +
+		 guc_ads_golden_ctxt_size(guc);
+
 	return PAGE_ALIGN(offset);
 }
 
@@ -321,53 +342,163 @@ static void guc_mmio_reg_state_init(struct intel_guc *guc,
 	GEM_BUG_ON(temp_set.size);
 }
 
-/*
- * The first 80 dwords of the register state context, containing the
- * execlists and ppgtt registers.
- */
-#define LR_HW_CONTEXT_SIZE	(80 * sizeof(u32))
+static void fill_engine_enable_masks(struct intel_gt *gt,
+				     struct guc_gt_system_info *info)
+{
+	info->engine_enabled_masks[GUC_RENDER_CLASS] = 1;
+	info->engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
+	info->engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
+	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
+}
 
-static void __guc_ads_init(struct intel_guc *guc)
+/* Skip execlist and PPGTT registers */
+#define LR_HW_CONTEXT_SIZE      (80 * sizeof(u32))
+#define SKIP_SIZE               (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
+
+static int guc_prep_golden_context(struct intel_guc *guc,
+				   struct __guc_ads_blob *blob)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = gt->i915;
+	u32 addr_ggtt, offset;
+	u32 total_size = 0, alloc_size, real_size;
+	u8 engine_class, guc_class;
+	struct guc_gt_system_info *info, local_info;
+
+	/*
+	 * Reserve the memory for the golden contexts and point GuC at it but
+	 * leave it empty for now. The context data will be filled in later
+	 * once there is something available to put there.
+	 *
+	 * Note that the HWSP and ring context are not included.
+	 *
+	 * Note also that the storage must be pinned in the GGTT, so that the
+	 * address won't change after GuC has been told where to find it. The
+	 * GuC will also validate that the LRC base + size fall within the
+	 * allowed GGTT range.
+	 */
+	if (blob) {
+		offset = guc_ads_golden_ctxt_offset(guc);
+		addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
+		info = &blob->system_info;
+	} else {
+		memset(&local_info, 0, sizeof(local_info));
+		info = &local_info;
+		fill_engine_enable_masks(gt, info);
+	}
+
+	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
+		if (engine_class == OTHER_CLASS)
+			continue;
+
+		guc_class = engine_class_to_guc_class(engine_class);
+
+		if (!info->engine_enabled_masks[guc_class])
+			continue;
+
+		real_size = intel_engine_context_size(gt, engine_class);
+		alloc_size = PAGE_ALIGN(real_size);
+		total_size += alloc_size;
+
+		if (!blob)
+			continue;
+
+		blob->ads.eng_state_size[guc_class] = real_size;
+		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
+		addr_ggtt += alloc_size;
+	}
+
+	if (!blob)
+		return total_size;
+
+	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
+	return total_size;
+}
+
+static struct intel_engine_cs *find_engine_state(struct intel_gt *gt, u8 engine_class)
+{
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+
+	for_each_engine(engine, gt, id) {
+		if (engine->class != engine_class)
+			continue;
+
+		if (!engine->default_state)
+			continue;
+
+		return engine;
+	}
+
+	return NULL;
+}
+
+static void guc_init_golden_context(struct intel_guc *guc)
+{
 	struct __guc_ads_blob *blob = guc->ads_blob;
-	const u32 skipped_size = LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE;
-	u32 base;
+	struct intel_engine_cs *engine;
+	struct intel_gt *gt = guc_to_gt(guc);
+	u32 addr_ggtt, offset;
+	u32 total_size = 0, alloc_size, real_size;
 	u8 engine_class, guc_class;
+	u8 *ptr;
 
-	/* GuC scheduling policies */
-	guc_policies_init(guc, &blob->policies);
+	if (!intel_uc_uses_guc_submission(&gt->uc))
+		return;
+
+	GEM_BUG_ON(!blob);
 
 	/*
-	 * GuC expects a per-engine-class context image and size
-	 * (minus hwsp and ring context). The context image will be
-	 * used to reinitialize engines after a reset. It must exist
-	 * and be pinned in the GGTT, so that the address won't change after
-	 * we have told GuC where to find it. The context size will be used
-	 * to validate that the LRC base + size fall within allowed GGTT.
+	 * Go back and fill in the golden context data now that it is
+	 * available.
 	 */
+	offset = guc_ads_golden_ctxt_offset(guc);
+	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
+	ptr = ((u8 *) blob) + offset;
+
 	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
 		if (engine_class == OTHER_CLASS)
 			continue;
 
 		guc_class = engine_class_to_guc_class(engine_class);
 
-		/*
-		 * TODO: Set context pointer to default state to allow
-		 * GuC to re-init guilty contexts after internal reset.
-		 */
-		blob->ads.golden_context_lrca[guc_class] = 0;
-		blob->ads.eng_state_size[guc_class] =
-			intel_engine_context_size(gt, engine_class) -
-			skipped_size;
+		if (!blob->system_info.engine_enabled_masks[guc_class])
+			continue;
+
+		real_size = intel_engine_context_size(gt, engine_class);
+		alloc_size = PAGE_ALIGN(real_size);
+		total_size += alloc_size;
+
+		engine = find_engine_state(gt, engine_class);
+		if (!engine) {
+			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n", engine_class);
+			blob->ads.eng_state_size[guc_class] = 0;
+			blob->ads.golden_context_lrca[guc_class] = 0;
+			continue;
+		}
+
+		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
+		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
+		addr_ggtt += alloc_size;
+
+		shmem_read(engine->default_state, SKIP_SIZE, ptr + SKIP_SIZE, real_size);
+		ptr += alloc_size;
 	}
 
+	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
+}
+
+static void __guc_ads_init(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
+	struct __guc_ads_blob *blob = guc->ads_blob;
+	u32 base;
+
+	/* GuC scheduling policies */
+	guc_policies_init(guc, &blob->policies);
+
 	/* System info */
-	blob->system_info.engine_enabled_masks[GUC_RENDER_CLASS] = 1;
-	blob->system_info.engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
-	blob->system_info.engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
-	blob->system_info.engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
+	fill_engine_enable_masks(gt, &blob->system_info);
 
 	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
 		hweight8(gt->info.sseu.slice_mask);
@@ -382,6 +513,9 @@ static void __guc_ads_init(struct intel_guc *guc)
 			 GEN12_DOORBELLS_PER_SQIDI) + 1;
 	}
 
+	/* Golden contexts for re-initialising after a watchdog reset */
+	guc_prep_golden_context(guc, blob);
+
 	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
 
 	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
@@ -423,6 +557,13 @@ int intel_guc_ads_create(struct intel_guc *guc)
 		return ret;
 	guc->ads_regset_size = ret;
 
+	/* Likewise the golden contexts: */
+	ret = guc_prep_golden_context(guc, NULL);
+	if (ret < 0)
+		return ret;
+	guc->ads_golden_ctxt_size = ret;
+
+	/* Now the total size can be determined: */
 	size = guc_ads_blob_size(guc);
 
 	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->ads_vma,
@@ -435,6 +576,18 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	return 0;
 }
 
+void intel_guc_ads_init_late(struct intel_guc *guc)
+{
+	/*
+	 * The golden context setup requires the saved engine state from
+	 * __engines_record_defaults(). However, that requires engines to be
+	 * operational which means the ADS must already have been configured.
+	 * Fortunately, the golden context state is not needed until a hang
+	 * occurs, so it can be filled in during this late init phase.
+	 */
+	guc_init_golden_context(guc);
+}
+
 void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
index 0fdcb3583601..dac0dc32da34 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
@@ -11,6 +11,7 @@ struct drm_printer;
 
 int intel_guc_ads_create(struct intel_guc *guc);
 void intel_guc_ads_destroy(struct intel_guc *guc);
+void intel_guc_ads_init_late(struct intel_guc *guc);
 void intel_guc_ads_reset(struct intel_guc *guc);
 void intel_guc_log_policy_info(struct intel_guc *guc, struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 8c681fc49638..4a79db4a739f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -120,6 +120,11 @@ void intel_uc_init_early(struct intel_uc *uc)
 		uc->ops = &uc_ops_off;
 }
 
+void intel_uc_init_late(struct intel_uc *uc)
+{
+	intel_guc_init_late(&uc->guc);
+}
+
 void intel_uc_driver_late_release(struct intel_uc *uc)
 {
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 91315e3f1c58..e2da2b6e76e1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -35,6 +35,7 @@ struct intel_uc {
 };
 
 void intel_uc_init_early(struct intel_uc *uc);
+void intel_uc_init_late(struct intel_uc *uc);
 void intel_uc_driver_late_release(struct intel_uc *uc);
 void intel_uc_driver_remove(struct intel_uc *uc);
 void intel_uc_init_mmio(struct intel_uc *uc);
-- 
2.28.0

