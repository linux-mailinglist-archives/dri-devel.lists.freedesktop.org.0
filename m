Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9379559B2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C7510E119;
	Sat, 17 Aug 2024 21:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIktokVV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1731510E111;
 Sat, 17 Aug 2024 21:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928451; x=1755464451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=27Dy3QHgbxGK5t8zCgoF+EsYEVf6jHP8Qa4lYzM5n2s=;
 b=hIktokVV3S/0kKXgZdysxJPHFKpjvFPDOQu+Kdlby6EN2EhMvIz9rPGv
 ZQecHUxZ3Icz9nCRP08AHKRjUX3zVutmVeBKDwF9tPenp5HO6Ph/WC02V
 YB5T6u8SyVdfTXZVu7gqYTrtNwHfeyEK6lgk2XvFMvDgm+hMFh/YaJa2c
 Rh9DzLDALkSC6EHevR+T4HYKFN4lcSH7XbteUbEG8Bk7uASd2X6IQABpA
 aZH3hyuEDCcEfn419KMfEg5UVm3DISTris+bKry92DrLaIWOhHyifCm94
 tr0nb6oK4282PRz+XsYlW6L7FGlIi7Txswl3ogrdZGN1Gv3UKwM9BZlcI A==;
X-CSE-ConnectionGUID: eRZFoXRASdebbvzKHA7IHA==
X-CSE-MsgGUID: 7VOJ3hT+RISWcDXrqQ8B/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="44725420"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="44725420"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:00:51 -0700
X-CSE-ConnectionGUID: AU3/WUcLTxWGQBHCrLvELw==
X-CSE-MsgGUID: uRDi0srsQwCZei9KkMl+Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="59635906"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:00:48 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 01/11] drm/i915/gt: Move the CCS mode variable to a
 global position
Date: Sat, 17 Aug 2024 23:00:16 +0200
Message-ID: <20240817210026.310645-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the CCS mode value in the intel_gt->ccs structure to make
it available for future instances that may need to change its
value.

Name it mode_reg_val because it holds the value that will
be written into the CCS_MODE register, determining the CCS
balancing and, consequently, the number of engines generated.

Create a mutex to control access to the mode_reg_val variable.

No functional changes intended.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          |  3 +++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 13 ++++++++++---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  3 ++-
 drivers/gpu/drm/i915/gt/intel_gt_types.h    | 12 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  7 ++++---
 5 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index a6c69a706fd7..5af0527d822d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -18,6 +18,7 @@
 #include "intel_ggtt_gmch.h"
 #include "intel_gt.h"
 #include "intel_gt_buffer_pool.h"
+#include "intel_gt_ccs_mode.h"
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_mcr.h"
@@ -136,6 +137,8 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 	intel_sseu_info_init(gt);
 	intel_gt_mcr_init(gt);
 
+	intel_gt_ccs_mode_init(gt);
+
 	return intel_engines_init_mmio(gt);
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 3c62a44e9106..19e0bc359861 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -8,14 +8,16 @@
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_regs.h"
 
-unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
+void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
 	int cslice;
 	u32 mode = 0;
 	int first_ccs = __ffs(CCS_MASK(gt));
 
+	lockdep_assert_held(&gt->ccs.mutex);
+
 	if (!IS_DG2(gt->i915))
-		return 0;
+		return;
 
 	/* Build the value for the fixed CCS load balancing */
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
@@ -35,5 +37,10 @@ unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
 						     XEHP_CCS_MODE_CSLICE_MASK);
 	}
 
-	return mode;
+	gt->ccs.mode_reg_val = mode;
+}
+
+void intel_gt_ccs_mode_init(struct intel_gt *gt)
+{
+	mutex_init(&gt->ccs.mutex);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 55547f2ff426..e646ab595ded 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -8,6 +8,7 @@
 
 struct intel_gt;
 
-unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt);
+void intel_gt_apply_ccs_mode(struct intel_gt *gt);
+void intel_gt_ccs_mode_init(struct intel_gt *gt);
 
 #endif /* __INTEL_GT_CCS_MODE_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index bcee084b1f27..8df8fac066c0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -207,12 +207,24 @@ struct intel_gt {
 					    [MAX_ENGINE_INSTANCE + 1];
 	enum intel_submission_method submission_method;
 
+	/*
+	 * Track fixed mapping between CCS engines and compute slices.
+	 *
+	 * In order to w/a HW that has the inability to dynamically load
+	 * balance between CCS engines and EU in the compute slices, we have to
+	 * reconfigure a static mapping on the fly.
+	 *
+	 * The mode variable is set by the user and sets the balancing mode,
+	 * i.e. how the CCS streams are distributed amongs the slices.
+	 */
 	struct {
 		/*
 		 * Mask of the non fused CCS slices
 		 * to be used for the load balancing
 		 */
 		intel_engine_mask_t cslices;
+		struct mutex mutex;
+		u32 mode_reg_val;
 	} ccs;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index bfe6d8fc820f..daa11e11d68f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2727,7 +2727,6 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
 static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 {
 	struct intel_gt *gt = engine->gt;
-	u32 mode;
 
 	if (!IS_DG2(gt->i915))
 		return;
@@ -2744,8 +2743,10 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
 	 * After having disabled automatic load balancing we need to
 	 * assign all slices to a single CCS. We will call it CCS mode 1
 	 */
-	mode = intel_gt_apply_ccs_mode(gt);
-	wa_masked_en(wal, XEHP_CCS_MODE, mode);
+	mutex_lock(&gt->ccs.mutex);
+	intel_gt_apply_ccs_mode(gt);
+	wa_masked_en(wal, XEHP_CCS_MODE, gt->ccs.mode_reg_val);
+	mutex_unlock(&gt->ccs.mutex);
 }
 
 /*
-- 
2.45.2

