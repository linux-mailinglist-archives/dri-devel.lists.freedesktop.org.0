Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A876DBA6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 01:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06ED710E589;
	Wed,  2 Aug 2023 23:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED01010E155;
 Wed,  2 Aug 2023 23:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691019305; x=1722555305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQTC6RMOI5lhoMEhjHBSLbyPw3WZkzNwZXH2zYXyAj4=;
 b=GPoaxrheJ0dankt1KgfSBKMtRxg85tEWntoa5aMECnZKE2FGkmAMNhkM
 pffQqyeFVTazT8rd9BzXceO+pfcmE0A53G+P6iAO+Lvr+Wbe8TnSWhdBQ
 dLRO61Bg16Q9DeuigmS48FEjEPtADCy5XM6AO9DjjceRdBp7L+nYO1+i5
 6vIbsj0EBLsb1sGhHpuRm4CHpgcLRaVXWoo6sDg71VwfgjAkK0+qEzzWO
 ywTqRnfVJac0OkZv7jqqj8iQbPhajX+EsQ5QZekwVTXzXOL6jhhZAQE/M
 xiulbEBkWl7I8rCZBvB39hRpRSKZ/pRgqL42+k/qqyqxLgo06WtgKDtc4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367185058"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="367185058"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853030290"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="853030290"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 16:35:04 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 2/3] drm/i915/guc: Close deregister-context race against
 CT-loss
Date: Wed,  2 Aug 2023 16:35:00 -0700
Message-Id: <20230802233501.17074-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>
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
either very late in suspend or very early in resume).

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

While we fix this race condition, let's also ensure we
never allow the kernel to hang in intel_gt_pm_wait_for_idle
with a huge timeout and drm_warn.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index dc7735a19a5a..a7530ad7008d 100644
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
 	}
 
-	deregister_context(ce, ce->guc_id.id);
+	if (deregister_context(ce, ce->guc_id.id)) {
+		/* Seal race with concurrent suspend by unrolling */
+		spin_lock_irqsave(&ce->guc_state.lock, flags);
+		set_context_registered(ce);
+		clr_context_destroyed(ce);
+		intel_gt_pm_put(gt);
+		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static void __guc_context_destroy(struct intel_context *ce)
@@ -3270,7 +3287,20 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
 		if (!ce)
 			break;
 
-		guc_lrc_desc_unpin(ce);
+		if (guc_lrc_desc_unpin(ce)) {
+			/*
+			 * This means GuC's CT link severed mid-way which only happens
+			 * in suspend-resume corner cases. In this case, put the
+			 * context back into the destroyed_contexts list which will
+			 * get picked up on the next context deregistration event or
+			 * purged in a GuC sanitization event (reset/unload/wedged/...).
+			 */
+			spin_lock_irqsave(&guc->submission_state.lock, flags);
+			list_add_tail(&ce->destroyed_link,
+				      &guc->submission_state.destroyed_contexts);
+			spin_unlock_irqrestore(&guc->submission_state.lock, flags);
+		}
+
 	}
 }
 
-- 
2.39.0

