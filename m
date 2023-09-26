Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12627AF3BD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FD310E16B;
	Tue, 26 Sep 2023 19:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4838920D;
 Tue, 26 Sep 2023 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695755121; x=1727291121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F+gEMX3R5obvLjWgcz+YdVyybtLP39gJApRETU6QBkU=;
 b=PQgGCuEgPZIfkJqiJlDQxAtIMHnwNPiVNWIJlwXef7dKk/3/XaHYy/Uo
 NRzsrATmNnhau/YBOUt/Ttbs/o6uVNn+mRHHuaMX170fA3fkvQGziUrJY
 YHL+GxgD6WRCDmOX7gX4+1gfgYuCoDZSgy/2kAf3Pvt0zYYlTFKn6txZR
 jn1w2I8HWadxVEkN9iLefrjlEeoRBnNV0kTMec+0qsH8oQRGpt2TBKh5+
 b/qDHg9IhCWUNwgiRT8Y7EgSPwTvme1Y3rLnn8mvwlJLo2ppuOUMRI02J
 qddqRG3Rh197KdWS+G5qefKOuJcGuYrbtcYb3K/diBhkq+eg7+zvtUAXC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448141896"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="448141896"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819142181"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="819142181"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 12:05:19 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/3] drm/i915/guc: Close deregister-context race against
 CT-loss
Date: Tue, 26 Sep 2023 12:05:17 -0700
Message-Id: <20230926190518.105393-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
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
Cc: , Alan Previn <alan.previn.teres.alexis@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, intel.com@freedesktop.org,
	Mousumi Jana <mousumi.jana@intel.com>,
	John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we are at the end of suspend or very early in resume
its possible an async fence signal (via rcu_call) is triggered
to free_engines which could lead us to the execution of
the context destruction worker (after a prior worker flush).

Thus, when suspending, insert an rcu_barrier at the start
of wait_for_suspend so that all such cases have completed
and context destruction list isn't missing anything.

In destroyed_worker_func, close the race against CT-loss
by checking that CT is enabled before calling into
deregister_destroyed_contexts.

Based on testing, guc_lrc_desc_unpin may still race and fail
as we traverse the GuC's context-destroy list because the
CT could be disabled right before calling GuC's CT send function.

We've witnessed this race condition once every ~6000-8000
suspend-resume cycles while ensuring workloads that render
something onscreen is continuously started just before
we suspend (and the workload is small enough to complete
and trigger the queued engine/context free-up either very
late in suspend or very early in resume).

In such a case, we need to unroll the entire process because
guc-lrc-unpin takes a gt wakeref which only gets released in
the G2H IRQ reply that never comes through in this corner
case. Without the unroll, the taken wakeref is leaked and will
cascade into a kernel hang later at the tail end of suspend in
this function:

   intel_wakeref_wait_for_idle(&gt->wakeref)
   (called by) - intel_gt_pm_wait_for_idle
   (called by) - wait_for_suspend

Thus, do an unroll in guc_lrc_desc_unpin and deregister_destroyed_-
contexts if guc_lrc_desc_unpin fails due to CT send falure.
When unrolling, keep the context in the GuC's destroy-list so
it can get picked up on the next destroy worker invocation
(if suspend aborted) or get fully purged as part of a GuC
sanitization (end of suspend) or a reset flow.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Tested-by: Mousumi Jana <mousumi.jana@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  7 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 81 ++++++++++++++++---
 2 files changed, 77 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 5a942af0a14e..59b5658a17fb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -289,6 +289,13 @@ int intel_gt_resume(struct intel_gt *gt)
 
 static void wait_for_suspend(struct intel_gt *gt)
 {
+	/*
+	 * On rare occasions, we've observed the fence completion trigger
+	 * free_engines asynchronously via rcu_call. Ensure those are done.
+	 * This path is only called on suspend, so it's an acceptable cost.
+	 */
+	rcu_barrier();
+
 	if (!intel_gt_pm_is_awake(gt))
 		return;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index fdd7179f502a..465baf7660d7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -235,6 +235,13 @@ set_context_destroyed(struct intel_context *ce)
 	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
 }
 
+static inline void
+clr_context_destroyed(struct intel_context *ce)
+{
+	lockdep_assert_held(&ce->guc_state.lock);
+	ce->guc_state.sched_state &= ~SCHED_STATE_DESTROYED;
+}
+
 static inline bool context_pending_disable(struct intel_context *ce)
 {
 	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
@@ -612,6 +619,8 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 					 u32 g2h_len_dw,
 					 bool loop)
 {
+	int ret;
+
 	/*
 	 * We always loop when a send requires a reply (i.e. g2h_len_dw > 0),
 	 * so we don't handle the case where we don't get a reply because we
@@ -622,7 +631,11 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
 	if (g2h_len_dw)
 		atomic_inc(&guc->outstanding_submission_g2h);
 
-	return intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+	ret = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
+	if (ret)
+		atomic_dec(&guc->outstanding_submission_g2h);
+
+	return ret;
 }
 
 int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
@@ -3205,12 +3218,13 @@ static void guc_context_close(struct intel_context *ce)
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 }
 
-static inline void guc_lrc_desc_unpin(struct intel_context *ce)
+static inline int guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 	struct intel_gt *gt = guc_to_gt(guc);
 	unsigned long flags;
 	bool disabled;
+	int ret;
 
 	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
 	GEM_BUG_ON(!ctx_id_mapped(guc, ce->guc_id.id));
@@ -3220,19 +3234,38 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	/* Seal race with Reset */
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	disabled = submission_disabled(guc);
-	if (likely(!disabled)) {
-		__intel_gt_pm_get(gt);
-		set_context_destroyed(ce);
-		clr_context_registered(ce);
-	}
-	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 	if (unlikely(disabled)) {
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
-		return;
+		return 0;
 	}
 
-	deregister_context(ce, ce->guc_id.id);
+	/* GuC is active, lets destroy this context,
+	 * but at this point we can still be racing with
+	 * suspend, so we undo everything if the H2G fails
+	 */
+
+	/* Change context state to destroyed and get gt-pm */
+	__intel_gt_pm_get(gt);
+	set_context_destroyed(ce);
+	clr_context_registered(ce);
+
+	ret = deregister_context(ce, ce->guc_id.id);
+	if (ret) {
+		/* Undo the state change and put gt-pm if that failed */
+		set_context_registered(ce);
+		clr_context_destroyed(ce);
+		/*
+		 * Dont use might_sleep / ASYNC verion of put because
+		 * CT loss in deregister_context could mean an ongoing
+		 * reset or suspend flow. Immediately put before the unlock
+		 */
+		__intel_wakeref_put(&gt->wakeref, 0);
+	}
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	return ret;
 }
 
 static void __guc_context_destroy(struct intel_context *ce)
@@ -3300,7 +3333,22 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
 		if (!ce)
 			break;
 
-		guc_lrc_desc_unpin(ce);
+		if (guc_lrc_desc_unpin(ce)) {
+			/*
+			 * This means GuC's CT link severed mid-way which could happen
+			 * in suspend-resume corner cases. In this case, put the
+			 * context back into the destroyed_contexts list which will
+			 * get picked up on the next context deregistration event or
+			 * purged in a GuC sanitization event (reset/unload/wedged/...).
+			 */
+			spin_lock_irqsave(&guc->submission_state.lock, flags);
+			list_add_tail(&ce->destroyed_link,
+				      &guc->submission_state.destroyed_contexts);
+			spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+			/* Bail now since the list might never be emptied if h2gs fail */
+			break;
+		}
+
 	}
 }
 
@@ -3311,6 +3359,17 @@ static void destroyed_worker_func(struct work_struct *w)
 	struct intel_gt *gt = guc_to_gt(guc);
 	int tmp;
 
+	/*
+	 * In rare cases we can get here via async context-free fence-signals that
+	 * come very late in suspend flow or very early in resume flows. In these
+	 * cases, GuC won't be ready but just skipping it here is fine as these
+	 * pending-destroy-contexts get destroyed totally at GuC reset time at the
+	 * end of suspend.. OR.. this worker can be picked up later on the next
+	 * context destruction trigger after resume-completes
+	 */
+	if (!intel_guc_is_ready(guc))
+		return;
+
 	with_intel_gt_pm(gt, tmp)
 		deregister_destroyed_contexts(guc);
 }
-- 
2.39.0

