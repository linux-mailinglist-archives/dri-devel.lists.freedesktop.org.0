Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B841E77C4E7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 03:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2628810E238;
	Tue, 15 Aug 2023 01:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9418110E132;
 Tue, 15 Aug 2023 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692061933; x=1723597933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GVoOGnr99B/RxwUSdbJ3/RkHljCesuxF5pPCXVGEM50=;
 b=fvkH55prvYX5IOvqadXLSt/vxBTiILsqPJjNNnVnShyXwjfjnlSrt5Dx
 irDir0cnb8vh0vdn2aGzSlhWu42aLnooZxZBOlze3Nit33zYuBN/72NxZ
 XCr3w827zKcBwkgZbP4tQkGIgYOzlTV2KO/KD6y35gzLcIUTpgM4Z7+qZ
 6DhMZ1Qx190mkl3qB+PYrDLXntfvah7kRP8z3jrmwUXOGXU0lEI9ryOGk
 P6pXgDWiSSUovRweZ6P+lg2s7WuP9F7Glragn2V/5WmRIUqZHJSt9WnTo
 QEniP6PXzTTvwR6COdx5CjCDOKbkX0JjKV4idPHZOoixU8k5uiphp7IJf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403155168"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403155168"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 18:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="803637043"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="803637043"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 14 Aug 2023 18:12:12 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race against
 CT-loss
Date: Mon, 14 Aug 2023 18:12:09 -0700
Message-Id: <20230815011210.1188379-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 050572bb8dbe..ddb4ee4c4e51 100644
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
@@ -3175,7 +3182,7 @@ static void guc_context_close(struct intel_context *ce)
 	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 }
 
-static inline void guc_lrc_desc_unpin(struct intel_context *ce)
+static inline int guc_lrc_desc_unpin(struct intel_context *ce)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
 	struct intel_gt *gt = guc_to_gt(guc);
@@ -3199,10 +3206,20 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
 	if (unlikely(disabled)) {
 		release_guc_id(guc, ce);
 		__guc_context_destroy(ce);
-		return;
+		return 0;
+	}
+
+	if (deregister_context(ce, ce->guc_id.id)) {
+		/* Seal race with concurrent suspend by unrolling */
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		set_context_registered(ce);
+		clr_context_destroyed(ce);
+		intel_gt_pm_put(gt);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		return -ENODEV;
 	}
 
-	deregister_context(ce, ce->guc_id.id);
+	return 0;
 }
 
 static void __guc_context_destroy(struct intel_context *ce)
@@ -3270,7 +3287,22 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
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
 
-- 
2.39.0

