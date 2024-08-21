Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E85F959C28
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983EA10E8EB;
	Wed, 21 Aug 2024 12:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7FRJ9fr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2049010E8E9;
 Wed, 21 Aug 2024 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244266; x=1755780266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQO02+IaMgU5e/1DOI4Cdpxg4Wv0yNleSCLQLCvWwsE=;
 b=N7FRJ9frWVTG72xZioEdZuSvgpEt2EjODgppTYT2Ju1ac3nEcAobgjnH
 9ASaGYDPy0uiH+jxtxQi56JuMTs4/P4ZgJVWmgBdnkWvei33fNWF516De
 KmUzq+6E92JhwA3PsfBbxq38spW660ZTAVNVsKvcplprd6UvNVNtGkfSO
 2e80/TJsHonmkIH92RFVt5sZY4PTr8eKVbkEThRptQRO9G85Oc8ueuguM
 Hhr3xl81h044mHKpy8citFs/JApO8d5Ng3/HZ/0k+MkxmYg+GNpxMVp82
 y2XuOwmAEwR4nNIulixXe5dzlIX8rd+DQ280BAwJ1xqDJogN9yLOyw49Y Q==;
X-CSE-ConnectionGUID: oByRm9Q4S7q7/E7bBpI9FQ==
X-CSE-MsgGUID: Ul2Elu0mTyOC7P5AXuOvsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33754107"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33754107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:26 -0700
X-CSE-ConnectionGUID: F+dDxM3sRYCoXRvJfPRsoQ==
X-CSE-MsgGUID: wYVknkITQJCkdAmuT/qv1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="98554625"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:24 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 02/14] drm/i915/gt: Move the CCS mode variable to a global
 position
Date: Wed, 21 Aug 2024 14:43:37 +0200
Message-ID: <20240821124349.295259-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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

No functional changes intended.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          |  3 +++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 16 +++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h    | 11 +++++++++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  6 ++++--
 5 files changed, 30 insertions(+), 8 deletions(-)

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
index 3c62a44e9106..fcd07eb4728b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -8,15 +8,12 @@
 #include "intel_gt_ccs_mode.h"
 #include "intel_gt_regs.h"
 
-unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
+static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
 	int cslice;
 	u32 mode = 0;
 	int first_ccs = __ffs(CCS_MASK(gt));
 
-	if (!IS_DG2(gt->i915))
-		return 0;
-
 	/* Build the value for the fixed CCS load balancing */
 	for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
 		if (gt->ccs.cslices & BIT(cslice))
@@ -35,5 +32,14 @@ unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt)
 						     XEHP_CCS_MODE_CSLICE_MASK);
 	}
 
-	return mode;
+	gt->ccs.mode_reg_val = mode;
+}
+
+void intel_gt_ccs_mode_init(struct intel_gt *gt)
+{
+	if (!IS_DG2(gt->i915))
+		return;
+
+	/* Initialize the CCS mode setting */
+	intel_gt_apply_ccs_mode(gt);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 55547f2ff426..0f2506586a41 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -8,6 +8,6 @@
 
 struct intel_gt;
 
-unsigned int intel_gt_apply_ccs_mode(struct intel_gt *gt);
+void intel_gt_ccs_mode_init(struct intel_gt *gt);
 
 #endif /* __INTEL_GT_CCS_MODE_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index bcee084b1f27..9e257f34d05b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -207,12 +207,23 @@ struct intel_gt {
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
+		u32 mode_reg_val;
 	} ccs;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index f3082fad3f45..f6135be3cd86 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2727,7 +2727,7 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
 static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 {
 	struct intel_gt *gt = engine->gt;
-	u32 mode;
+	u32 mode = gt->ccs.mode_reg_val;
 
 	if (!IS_DG2(gt->i915))
 		return;
@@ -2743,8 +2743,10 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
 	/*
 	 * After having disabled automatic load balancing we need to
 	 * assign all slices to a single CCS. We will call it CCS mode 1
+	 *
+	 * The gt->ccs.mode_reg_val has already been set previously during
+	 * initialization.
 	 */
-	mode = intel_gt_apply_ccs_mode(gt);
 	wa_add(wal, XEHP_CCS_MODE, 0, mode, mode, false);
 }
 
-- 
2.45.2

