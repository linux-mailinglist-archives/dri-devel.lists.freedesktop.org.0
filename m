Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E64958F6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 05:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED1D10E5AF;
	Fri, 21 Jan 2022 04:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184CF10E476;
 Fri, 21 Jan 2022 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642739829; x=1674275829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQJmTuFtBOWS08HDnQKlaBhRYLlRMeytrOgFbVMrY9I=;
 b=fF4ZCg1sPd3+hBQM4wqSK22kwMyBRHTRkdgwFnrIIXm22UJszDq4zbma
 deg6g2mHtrkLPEy6reKLu/lyANTgfYRWiRT4KdWFoBXG4snaeN398ZDUi
 CQxGhLY2KURtyrxYsO6ivdxDz0uOATHMd2/4ry5wYqEOrku63S9yveUZZ
 cYhu5rJIM4qhEENcHesj3B7rd1Nio0xb6bjJT4H00Fp8esVH2qfR2fRFf
 7NvoSTM3W5k5x15AOKYAqi/fptUjPRtYuN8hv4+K7Z4ngKN3aZrPUIYK5
 S47pZpXO0iO1ViDqa31QzIT8JXvgXvkQojAdHSOxSiDZGvZCMjLwEmRua w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244384011"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="244384011"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="626596554"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Date: Thu, 20 Jan 2022 20:31:17 -0800
Message-Id: <20220121043118.24886-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121043118.24886-1-matthew.brost@intel.com>
References: <20220121043118.24886-1-matthew.brost@intel.com>
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The G2H handler needs to be flushed during a GT reset but a G2H
indicating engine reset failure can trigger a GT reset. Add a worker to
trigger the GT rest when an engine reset failure is received to break
this circular dependency.

v2:
 (John Harrison)
  - Store engine reset mask
  - Fix typo in commit message
v3:
 (John Harrison)
  - Fix another typo in commit message
  - s/reset_*/reset_fail_*/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++++--
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 9d26a86fe557a..d59bbf49d1c2b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -119,6 +119,15 @@ struct intel_guc {
 		 * function as it might be in an atomic context (no sleeping)
 		 */
 		struct work_struct destroyed_worker;
+		/**
+		 * @reset_fail_worker: worker to trigger a GT reset after an
+		 * engine reset fails
+		 */
+		struct work_struct reset_fail_worker;
+		/**
+		 * @reset_fail_mask: mask of engines that failed to reset
+		 */
+		intel_engine_mask_t reset_fail_mask;
 	} submission_state;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3918f1be114fa..9a3f503d201aa 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1731,6 +1731,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 }
 
 static void destroyed_worker_func(struct work_struct *w);
+static void reset_fail_worker_func(struct work_struct *w);
 
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
@@ -1761,6 +1762,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
 	INIT_WORK(&guc->submission_state.destroyed_worker,
 		  destroyed_worker_func);
+	INIT_WORK(&guc->submission_state.reset_fail_worker,
+		  reset_fail_worker_func);
 
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
@@ -4026,6 +4029,26 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
 	return gt->engine_class[engine_class][instance];
 }
 
+static void reset_fail_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc = container_of(w, struct intel_guc,
+					     submission_state.reset_fail_worker);
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_engine_mask_t reset_fail_mask;
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	reset_fail_mask = guc->submission_state.reset_fail_mask;
+	guc->submission_state.reset_fail_mask = 0;
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+	if (likely(reset_fail_mask))
+		intel_gt_handle_error(gt, reset_fail_mask,
+				      I915_ERROR_CAPTURE,
+				      "GuC failed to reset engine mask=0x%x\n",
+				      reset_fail_mask);
+}
+
 int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len)
 {
@@ -4033,6 +4056,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	struct intel_gt *gt = guc_to_gt(guc);
 	u8 guc_class, instance;
 	u32 reason;
+	unsigned long flags;
 
 	if (unlikely(len != 3)) {
 		drm_err(&gt->i915->drm, "Invalid length %u", len);
@@ -4057,10 +4081,15 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
 		guc_class, instance, engine->name, reason);
 
-	intel_gt_handle_error(gt, engine->mask,
-			      I915_ERROR_CAPTURE,
-			      "GuC failed to reset %s (reason=0x%08x)\n",
-			      engine->name, reason);
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	guc->submission_state.reset_fail_mask |= engine->mask;
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+	/*
+	 * A GT reset flushes this worker queue (G2H handler) so we must use
+	 * another worker to trigger a GT reset.
+	 */
+	queue_work(system_unbound_wq, &guc->submission_state.reset_fail_worker);
 
 	return 0;
 }
-- 
2.34.1

