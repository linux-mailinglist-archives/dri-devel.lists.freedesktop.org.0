Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB43799C7B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 05:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1981210E075;
	Sun, 10 Sep 2023 03:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E6910E05F;
 Sun, 10 Sep 2023 03:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694318329; x=1725854329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKE8uSxct1Hx8LSGCmMYLWpkbQDDqWrF7kXyidNA0/s=;
 b=ZOoghJ7MKpKXYlrd5AClqaidzaa9ZyFL2dlvLpsmk47saEiIkz8R21oV
 kx3flKsXI16jSqw4vsBucy4K7qku0NZeBheFymeoHLXbd3VlmhjbNBfMk
 foxCzvUWFGx+zVWlx4GDgE1fAjMK85kJJuKBos8GwBSuF78zb2nz//unv
 6IKqRCvcmbVpkbyQCDBGeW7L593ECkmyTkIPXWsXedEbGomT/8TlMD757
 gPOxuiPq0xXEE0P+s/+1WHaoiTq+bl5ZEIiVpJvX8SZVqHq6fO+uDLyyR
 4BaumVvweU1egNUp+/30YT8YntGExTxvYaUizXM8gHzHc8bgDT/VIry2e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381684303"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; d="scan'208";a="381684303"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 20:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="736377114"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; d="scan'208";a="736377114"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 09 Sep 2023 20:58:48 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915/guc: Close deregister-context race against
 CT-loss
Date: Sat,  9 Sep 2023 20:58:45 -0700
Message-Id: <20230910035846.493766-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230910035846.493766-1-alan.previn.teres.alexis@intel.com>
References: <20230910035846.493766-1-alan.previn.teres.alexis@intel.com>
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
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, intel.com@freedesktop.org,
	Mousumi Jana <mousumi.jana@intel.com>,
	John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we are at the end of suspend or very early in resume
its possible an async fence signal could lead us to the
execution of the context destruction worker (after the
prior worker flush).

Even if checking that the CT is enabled before calling
destroyed_worker_func, guc_lrc_desc_unpin may still fail
because in corner cases, as we traverse the GuC's
context-destroy list, the CT could get disabled in the mid
of it right before calling the GuC's CT send function.

We've witnessed this race condition once every ~6000-8000
suspend-resume cycles while ensuring workloads that render
something onscreen is continuously started just before
we suspend (and the workload is small enough to complete
and trigger the queued engine/context free-up either very
late in suspend or very early in resume).

In such a case, we need to unroll the unpin process because
guc-lrc-unpin takes a gt wakeref which only gets released in
the G2H IRQ reply that never comes through in this corner
case. That will cascade into a kernel hang later at the tail
end of suspend in this function:

   intel_wakeref_wait_for_idle(&gt->wakeref)
   (called by) - intel_gt_pm_wait_for_idle
   (called by) - wait_for_suspend

Doing this unroll and keeping the context in the GuC's
destroy-list will allow the context to get picked up on
the next destroy worker invocation or purged as part of a
major GuC sanitization or reset flow.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Tested-by: Mousumi Jana <mousumi.jana@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 76 ++++++++++++++++---
 1 file changed, 65 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0ed44637bca0..db7df1217350 100644
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
@@ -3173,12 +3186,13 @@ static void guc_context_close(struct intel_context *ce)
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
@@ -3188,19 +3202,33 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
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
+		intel_gt_pm_put(gt);
+	}
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+
+	return 0;
 }
 
 static void __guc_context_destroy(struct intel_context *ce)
@@ -3268,7 +3296,22 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
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
 
@@ -3279,6 +3322,17 @@ static void destroyed_worker_func(struct work_struct *w)
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

