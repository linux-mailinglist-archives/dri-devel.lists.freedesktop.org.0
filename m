Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C7E49427E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74BE10E24B;
	Wed, 19 Jan 2022 21:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7210E1FD;
 Wed, 19 Jan 2022 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642627809; x=1674163809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f16IU/o5zqgUuIvf3I0ozsc/AHeUysQeJpaeGF8JDpw=;
 b=helZqWhLuhpXrywDH++sjHrmImsRZhszIl4hATY+801PYllzwYY9ZgN4
 ejI366emHf0pkEKjMEfNpjwcEWICU9Rw+KUZ0t7fVxKrlXWnZ+eQCxxUS
 YpkLQy5BAMsAujt5skdsnakpdnEAmewFjiZUegQHb0GAWBJ7vAXTYqR24
 coAFwde9vR1BkkVKzGNzmZV0dSynBaxMtfywm+MQb2jt6BTdSWyDn/J4R
 qgqx8vmvPCI+cJRqr/lpuApwV2xZboR7oiW/mleX+d63+vsyDZKMs/4Et
 s/hiL54m8A8qHFgtUjdjAQrZmc6vg2eLh5PKbZzzal2QqqpTtSYw36nkv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331548315"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="331548315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="475289717"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/i915/guc: Add work queue to trigger a GT reset
Date: Wed, 19 Jan 2022 13:24:18 -0800
Message-Id: <20220119212419.23068-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119212419.23068-1-matthew.brost@intel.com>
References: <20220119212419.23068-1-matthew.brost@intel.com>
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
trigger the GT when an engine reset failure is received to break this
circular dependency.

v2:
 (John Harrison)
  - Store engine reset mask
  - Fix typo in commit message

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  9 +++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 37 +++++++++++++++++--
 2 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 9d26a86fe557..c4a9fc7dd246 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -119,6 +119,15 @@ struct intel_guc {
 		 * function as it might be in an atomic context (no sleeping)
 		 */
 		struct work_struct destroyed_worker;
+		/**
+		 * @reset_worker: worker to trigger a GT reset after an engine
+		 * reset fails
+		 */
+		struct work_struct reset_worker;
+		/**
+		 * @reset_mask: mask of engines that failed to reset
+		 */
+		intel_engine_mask_t reset_mask;
 	} submission_state;
 
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3918f1be114f..514b3060b141 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1731,6 +1731,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 }
 
 static void destroyed_worker_func(struct work_struct *w);
+static void reset_worker_func(struct work_struct *w);
 
 /*
  * Set up the memory resources to be shared with the GuC (via the GGTT)
@@ -1761,6 +1762,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
 	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
 	INIT_WORK(&guc->submission_state.destroyed_worker,
 		  destroyed_worker_func);
+	INIT_WORK(&guc->submission_state.reset_worker,
+		  reset_worker_func);
 
 	guc->submission_state.guc_ids_bitmap =
 		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
@@ -4026,6 +4029,26 @@ guc_lookup_engine(struct intel_guc *guc, u8 guc_class, u8 instance)
 	return gt->engine_class[engine_class][instance];
 }
 
+static void reset_worker_func(struct work_struct *w)
+{
+	struct intel_guc *guc = container_of(w, struct intel_guc,
+					     submission_state.reset_worker);
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_engine_mask_t reset_mask;
+	unsigned long flags;
+
+	spin_lock_irqsave(&guc->submission_state.lock, flags);
+	reset_mask = guc->submission_state.reset_mask;
+	guc->submission_state.reset_mask = 0;
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+	if (likely(reset_mask))
+		intel_gt_handle_error(gt, reset_mask,
+				      I915_ERROR_CAPTURE,
+				      "GuC failed to reset engine mask=0x%x\n",
+				      reset_mask);
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
+	guc->submission_state.reset_mask |= engine->mask;
+	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+
+	/*
+	 * A GT reset flushes this worker queue (G2H handler) so we must use
+	 * another worker to trigger a GT reset.
+	 */
+	queue_work(system_unbound_wq, &guc->submission_state.reset_worker);
 
 	return 0;
 }
-- 
2.34.1

