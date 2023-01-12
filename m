Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC166689A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 02:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D83810E84F;
	Thu, 12 Jan 2023 01:55:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B54610E2DE;
 Thu, 12 Jan 2023 01:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673488520; x=1705024520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2ximlsbPgWhCgRQAaUiuNVtAcyVbUdyhkEPaGxz/3Q=;
 b=iAQNgCT7TzAwwRM7BgdeljOZ7yzUt/0CjS6pRwifxNHF1HW2XRcW3Fgc
 Okyi38aewQg4czO6HX7tAwzrF72J1AFVc5BBltes0XtlKuiZNxNnVbMex
 m6VzsDTuhb4Nm0RK2VSMmIUhoko5lMaJkL5RfTuEGFZcFauXWLz5NzXRt
 CfFe/bT488l3cCjbUha/YoxWIV37KY6sp9L1zi6WA2A3fwF6UZqz5MtFb
 0VM7A5C6+zkiP5izBJ1GEX9E4jaur8pRik5WPNjuQ6gnU48YgoIMi2MGx
 P1aMgYSbF0gONd+2/zGlG7G2vyLX1JJSv8FSzRWTZ5NxV73MCgpt5x2SN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303961744"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303961744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 17:55:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635197347"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635197347"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 17:55:18 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] drm/i915/guc: Improve clean up of busyness stats worker
Date: Wed, 11 Jan 2023 17:54:46 -0800
Message-Id: <20230112015447.2430224-2-John.C.Harrison@Intel.com>
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

The stats worker thread management was mis-matched between
enable/disable call sites. Fix those up. Also, abstract the cancel
code into a helper function rather than replicating in multiple places.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e42..982364777d0c6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1435,19 +1435,25 @@ static void guc_init_engine_stats(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	intel_wakeref_t wakeref;
+	int ret;
 
 	mod_delayed_work(system_highpri_wq, &guc->timestamp.work,
 			 guc->timestamp.ping_delay);
 
-	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
-		int ret = guc_action_enable_usage_stats(guc);
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		ret = guc_action_enable_usage_stats(guc);
 
-		if (ret)
-			drm_err(&gt->i915->drm,
-				"Failed to enable usage stats: %d!\n", ret);
+	if (ret) {
+		cancel_delayed_work_sync(&guc->timestamp.work);
+		drm_err(&gt->i915->drm, "Failed to enable usage stats: %d!\n", ret);
 	}
 }
 
+static void guc_park_engine_stats(struct intel_guc *guc)
+{
+	cancel_delayed_work_sync(&guc->timestamp.work);
+}
+
 void intel_guc_busyness_park(struct intel_gt *gt)
 {
 	struct intel_guc *guc = &gt->uc.guc;
@@ -1460,7 +1466,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
 	 * and causes an unclaimed register access warning. Cancel the worker
 	 * synchronously here.
 	 */
-	cancel_delayed_work_sync(&guc->timestamp.work);
+	guc_park_engine_stats(guc);
 
 	/*
 	 * Before parking, we should sample engine busyness stats if we need to.
@@ -4409,11 +4415,11 @@ void intel_guc_submission_enable(struct intel_guc *guc)
 	guc_init_global_schedule_policy(guc);
 }
 
+/* Note: By the time we're here, GuC may have already been reset */
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-
-	/* Note: By the time we're here, GuC may have already been reset */
+	guc_park_engine_stats(guc);
 
 	/* Disable and route to host */
 	if (GRAPHICS_VER(gt->i915) >= 12)
-- 
2.39.0

