Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16876518E8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 03:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9BC10E340;
	Tue, 20 Dec 2022 02:41:24 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5517B10E338;
 Tue, 20 Dec 2022 02:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671504070; x=1703040070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kq9l5+8ydFNSntDp7jGVkfiszjk0zXAHdtqLTcyLSiI=;
 b=kbeFyoinKnriSz1rJhJPCEIAknuYxI1WEj+SehcCJxT8oxFLhy1EIYYq
 4tGevLk314PFpIpU39mLW/NqKj0ep/quSKT1eZWeAUfG+w/4HF3MIwoaw
 et3SA3v9ZXnG3hQa6M7cEYDlDgjDeLiS3wy0nmD3LU3ziBL2AMzIJAl/f
 QnzaH7E4ZfWuezBkk677/8OZN0BJP2cLv4lJa2rphnBXkDw48vmpv1cBm
 T/LVoLTQK21U0YAPvdI66gYVhhwhISXZOdncbdu3/BOxWILnS1lUCfAwi
 66lA2nzj8P5aPdwn1Saz6NCfzkxXB9HugFhE9NB0nxL8wO4gySrUC1cmZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="405761788"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="405761788"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 18:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="825062144"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="825062144"
Received: from relo-linux-5.jf.intel.com ([10.165.21.201])
 by orsmga005.jf.intel.com with ESMTP; 19 Dec 2022 18:41:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/3] drm/i915/guc: Fix missing return code checks in
 submission init
Date: Mon, 19 Dec 2022 18:41:45 -0800
Message-Id: <20221220024147.4118685-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220024147.4118685-1-John.C.Harrison@Intel.com>
References: <20221220024147.4118685-1-John.C.Harrison@Intel.com>
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

Fix that by checking for errors and aborting as appropriate when
creating kernel contexts. While at it, clean up some other submission
init related failure cleanup paths. Also, rename guc_init_lrc_mapping
to guc_init_submission as the former name hasn't been valid in a long
time.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 74 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  7 +-
 3 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 53f7f599cde3a..4682ec1dbd9c0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1431,21 +1431,25 @@ static int guc_action_enable_usage_stats(struct intel_guc *guc)
 	return intel_guc_send(guc, action, ARRAY_SIZE(action));
 }
 
-static void guc_init_engine_stats(struct intel_guc *guc)
+static int guc_init_engine_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	intel_wakeref_t wakeref;
+	int ret;
 
 	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
 			 guc->timestamp.ping_delay);
 
 	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
-		int ret = guc_action_enable_usage_stats(guc);
+		ret = guc_action_enable_usage_stats(guc);
 
-		if (ret)
-			drm_err(&gt->i915->drm,
-				"Failed to enable usage stats: %d!\n", ret);
+		if (ret) {
+			cancel_delayed_work_sync(&guc->timestamp.work);
+			drm_err(&gt->i915->drm, "Failed to enable usage stats: %d!\n", ret);
+		}
 	}
+
+	return ret;
 }
 
 void intel_guc_busyness_park(struct intel_gt *gt)
@@ -4101,9 +4105,11 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
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
@@ -4111,16 +4117,24 @@ static inline void guc_kernel_context_pin(struct intel_guc *guc,
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
@@ -4147,9 +4161,17 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
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
@@ -4391,9 +4413,10 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 	return ret;
 }
 
-void intel_guc_submission_enable(struct intel_guc *guc)
+int intel_guc_submission_enable(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
+	int ret;
 
 	/* Enable and route to GuC */
 	if (GRAPHICS_VER(gt->i915) >= 12)
@@ -4401,16 +4424,31 @@ void intel_guc_submission_enable(struct intel_guc *guc)
 				   GUC_SEM_INTR_ROUTE_TO_GUC |
 				   GUC_SEM_INTR_ENABLE_ALL);
 
-	guc_init_lrc_mapping(guc);
-	guc_init_engine_stats(guc);
-	guc_init_global_schedule_policy(guc);
+	ret = guc_init_submission(guc);
+	if (ret)
+		goto fail;
+
+	ret = guc_init_engine_stats(guc);
+	if (ret)
+		goto fail;
+
+	ret = guc_init_global_schedule_policy(guc);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	intel_guc_submission_disable(guc);
+	return ret;
 }
 
+/* Note: By the time we're here, GuC may have already been reset */
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 
-	/* Note: By the time we're here, GuC may have already been reset */
+	cancel_delayed_work_sync(&guc->timestamp.work);
 
 	/* Disable and route to host */
 	if (GRAPHICS_VER(gt->i915) >= 12)
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

