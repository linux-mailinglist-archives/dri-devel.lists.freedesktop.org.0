Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71DB493029
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 22:50:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37F10E4E4;
	Tue, 18 Jan 2022 21:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6060F10E194;
 Tue, 18 Jan 2022 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642542589; x=1674078589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VBdynOarj2zNm9q+aYz7nX3S30j1HvHyx+6x2QM24nA=;
 b=DUclKqIBQnVg5MaWDOdHIK6/lcMlGxyUdoOAn7P4RAL775R/5JCffXx1
 jO0lPLu6y00/W9EY7V9TL5EqcVSmPZCueeevTw+cJshwX0XqonkqvgJIy
 FygEqM7ThcCbosrxF5SYLQDulqCE6THK+izcjGzfkxyHTH/dOCq0QIsWY
 8zqG4ZyZHDAlOaWMaPJyk9MW952c5AjimrlChXocYHdFR90Y1DqWeqPXk
 ZbZNASP+2bS9KpXPKUDXGnfB6LLPpZj7YK4FcmUbi+Rlo/0l9/xOXZDoF
 yLwUChsbw2A6sPpOmDO7cdNd/p2gxiFrSukE2tU5W0mR9xpJCA2Lg7cOu Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244716624"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="244716624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 13:49:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; d="scan'208";a="531968406"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 13:49:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Date: Tue, 18 Jan 2022 13:43:56 -0800
Message-Id: <20220118214357.33740-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118214357.33740-1-matthew.brost@intel.com>
References: <20220118214357.33740-1-matthew.brost@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The G2H handler needs to be flushed during a GT reset but a G2H
indicating engine reset failure can trigger a GT reset. Add a worker to
trigger the GT when a engine reset failure is received to break this
circular dependency.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 +++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 9d26a86fe557a..60ea8deef5392 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -119,6 +119,11 @@ struct intel_guc {
 		 * function as it might be in an atomic context (no sleeping)
 		 */
 		struct work_struct destroyed_worker;
+		/**
+		 * @reset_worker: worker to trigger a GT reset after an engine
+		 * reset fails
+		 */
+		struct work_struct reset_worker;
 	} submission_state;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 23a40f10d376d..cdd8d691251ff 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1746,6 +1746,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 }
 
 static void destroyed_worker_func(struct work_struct *w);
+static void reset_worker_func(struct work_struct *w);
 
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
@@ -1776,6 +1777,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
 	INIT_WORK(&guc->submission_state.destroyed_worker,
 		  destroyed_worker_func);
+	INIT_WORK(&guc->submission_state.reset_worker,
+		  reset_worker_func);
 
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
@@ -4052,6 +4055,17 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
 	return gt->engine_class[engine_class][instance];
 }
 
+static void reset_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc = container_of(w, struct intel_guc,
+					     submission_state.reset_worker);
+	struct intel_gt *gt = guc_to_gt(guc);
+
+	intel_gt_handle_error(gt, ALL_ENGINES,
+			      I915_ERROR_CAPTURE,
+			      "GuC failed to reset a engine\n");
+}
+
 int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len)
 {
@@ -4083,10 +4097,11 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
 		guc_class, instance, engine->name, reason);
 
-	intel_gt_handle_error(gt, engine->mask,
-			      I915_ERROR_CAPTURE,
-			      "GuC failed to reset %s (reason=0x%08x)\n",
-			      engine->name, reason);
+	/*
+	 * A GT reset flushes this worker queue (G2H handler) so we must use
+	 * another worker to trigger a GT reset.
+	 */
+	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
 
 	return 0;
 }
-- 
2.34.1

