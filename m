Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A159666899
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E9F10E2E2;
	Thu, 12 Jan 2023 01:55:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A961B10E2D6;
 Thu, 12 Jan 2023 01:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673488520; x=1705024520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vtc0I0sZXJ9kJ1CrYUiuyTQE/Uc9X9aZlY5+4fPTiEY=;
 b=ZqwNE+mwBLy4wNZ5P1Xd2ZEIywP2xsYPhxzI/zN0gxkfP2oAIxLFFNv3
 F0FZfi1PLlfzsalzU351q5wkUhbE6fhtGwVn1R2BBwMYkI4IIFPwIMkFF
 QrABmsBwwywVh8Y/i63ZvCRnBvbKM30HfC+RPQoGhyhwWtDGp1JI99s4d
 cDSp7qbPKdwcv5aefosxNgDpelIKTzoWb5LiemSZ2dvSADiLrFX57pQQJ
 ZVctZquQvl9QcQDFT3e2DI3rzZ6Gf71k35MjW5vwupiP2nlTMjUdrP1v7
 nOVDkM0k6afAOhBRBbfNX8aSBPODJcfZn+Zu/MWPZTrUARxgAVNv4DzOm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303961745"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303961745"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 17:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635197351"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635197351"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 17:55:18 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Fix missing return code checks in
 submission init
Date: Wed, 11 Jan 2023 17:54:47 -0800
Message-Id: <20230112015447.2430224-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
References: <20230112015447.2430224-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The CI results for the 'fast request' patch set (enables error return
codes for fire-and-forget H2G messages) hit an issue with the KMD
sending context submission requests on an invalid context. That was
caused by a fault injection probe failing the context creation of a
kernel context. However, there was no return code checking on any of
the kernel context registration paths. So the driver kept going and
tried to use the kernel context for the record defaults process.

This would not cause any actual problems. The invalid requests would
be rejected by GuC and ultimately the start up sequence would
correctly wedge due to the context creation failure. But fixing the
issue correctly rather ignoring it means we won't get CI complaining
when the fast request patch lands and enables the extra error checking.

So fix it by checking for errors and aborting as appropriate when
creating kernel contexts. While at it, clean up some other submission
init related failure cleanup paths. Also, rename guc_init_lrc_mapping
to guc_init_submission as the former name hasn't been valid in a long
time.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 91 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
 3 files changed, 75 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 982364777d0c6..dd856fd92945b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1431,7 +1431,7 @@ static int guc_action_enable_usage_stats(struct intel_guc *guc)
 	return intel_guc_send(guc, action, ARRAY_SIZE(action));
 }
 
-static void guc_init_engine_stats(struct intel_guc *guc)
+static int guc_init_engine_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	intel_wakeref_t wakeref;
@@ -1447,6 +1447,8 @@ static void guc_init_engine_stats(struct intel_guc *guc)
 		cancel_delayed_work_sync(&guc->timestamp.work);
 		drm_err(&gt->i915->drm, "Failed to enable usage stats: %d!\n", ret);
 	}
+
+	return ret;
 }
 
 static void guc_park_engine_stats(struct intel_guc *guc)
@@ -4108,9 +4110,11 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
 	engine->submit_request = guc_submit_request;
 }
 
-static inline void guc_kernel_context_pin(struct intel_guc *guc,
-					  struct intel_context *ce)
+static inline int guc_kernel_context_pin(struct intel_guc *guc,
+					 struct intel_context *ce)
 {
+	int ret;
+
 	/*
 	 * Note: we purposefully do not check the returns below because
 	 * the registration can only fail if a reset is just starting.
@@ -4118,16 +4122,24 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
 	 * isn't happening and even it did this code would be run again.
 	 */
 
-	if (context_guc_id_invalid(ce))
-		pin_guc_id(guc, ce);
+	if (context_guc_id_invalid(ce)) {
+		int ret = pin_guc_id(guc, ce);
+
+		if (ret < 0)
+			return ret;
+	}
 
 	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
 		guc_context_init(ce);
 
-	try_context_registration(ce, true);
+	ret = try_context_registration(ce, true);
+	if (ret)
+		unpin_guc_id(guc, ce);
+
+	return ret;
 }
 
-static inline void guc_init_lrc_mapping(struct intel_guc *guc)
+static inline int guc_init_submission(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_engine_cs *engine;
@@ -4154,9 +4166,17 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
 		struct intel_context *ce;
 
 		list_for_each_entry(ce, &engine->pinned_contexts_list,
-				    pinned_contexts_link)
-			guc_kernel_context_pin(guc, ce);
+				    pinned_contexts_link) {
+			int ret = guc_kernel_context_pin(guc, ce);
+
+			if (ret) {
+				/* No point in trying to clean up as i915 will wedge on failure */
+				return ret;
+			}
+		}
 	}
+
+	return 0;
 }
 
 static void guc_release(struct intel_engine_cs *engine)
@@ -4400,30 +4420,57 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 	return ret;
 }
 
-void intel_guc_submission_enable(struct intel_guc *guc)
+static void guc_route_semaphores(struct intel_guc *guc, bool to_guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
+	u32 val;
 
-	/* Enable and route to GuC */
-	if (GRAPHICS_VER(gt->i915) >= 12)
-		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
-				   GUC_SEM_INTR_ROUTE_TO_GUC |
-				   GUC_SEM_INTR_ENABLE_ALL);
+	if (GRAPHICS_VER(gt->i915) < 12)
+		return;
 
-	guc_init_lrc_mapping(guc);
-	guc_init_engine_stats(guc);
-	guc_init_global_schedule_policy(guc);
+	if (to_guc)
+		val = GUC_SEM_INTR_ROUTE_TO_GUC | GUC_SEM_INTR_ENABLE_ALL;
+	else
+		val = 0;
+
+	intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, val);
+}
+
+int intel_guc_submission_enable(struct intel_guc *guc)
+{
+	int ret;
+
+	/* Semaphore interrupt enable and route to GuC */
+	guc_route_semaphores(guc, true);
+
+	ret = guc_init_submission(guc);
+	if (ret)
+		goto fail_sem;
+
+	ret = guc_init_engine_stats(guc);
+	if (ret)
+		goto fail_sem;
+
+	ret = guc_init_global_schedule_policy(guc);
+	if (ret)
+		goto fail_stats;
+
+	return 0;
+
+fail_stats:
+	guc_park_engine_stats(guc);
+fail_sem:
+	guc_route_semaphores(guc, false);
+	return ret;
 }
 
 /* Note: By the time we're here, GuC may have already been reset */
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
-	struct intel_gt *gt = guc_to_gt(guc);
 	guc_park_engine_stats(guc);
 
-	/* Disable and route to host */
-	if (GRAPHICS_VER(gt->i915) >= 12)
-		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 0x0);
+	/* Semaphore interrupt disable and route to host */
+	guc_route_semaphores(guc, false);
 }
 
 static bool __guc_submission_supported(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index 5a95a9f0a8e31..c57b29cdb1a64 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -15,7 +15,7 @@ struct intel_engine_cs;
 
 void intel_guc_submission_init_early(struct intel_guc *guc);
 int intel_guc_submission_init(struct intel_guc *guc);
-void intel_guc_submission_enable(struct intel_guc *guc);
+int intel_guc_submission_enable(struct intel_guc *guc);
 void intel_guc_submission_disable(struct intel_guc *guc);
 void intel_guc_submission_fini(struct intel_guc *guc);
 int intel_guc_preempt_work_create(struct intel_guc *guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 9a8a1abf71d7f..8e338b3321a93 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -537,8 +537,11 @@ static int __uc_init_hw(struct intel_uc *uc)
 	else
 		intel_huc_auth(huc);
 
-	if (intel_uc_uses_guc_submission(uc))
-		intel_guc_submission_enable(guc);
+	if (intel_uc_uses_guc_submission(uc)) {
+		ret = intel_guc_submission_enable(guc);
+		if (ret)
+			goto err_log_capture;
+	}
 
 	if (intel_uc_uses_guc_slpc(uc)) {
 		ret = intel_guc_slpc_enable(&guc->slpc);
-- 
2.39.0

