Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7E7A27D9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9131210E687;
	Fri, 15 Sep 2023 20:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979EE10E67C;
 Fri, 15 Sep 2023 20:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694808917; x=1726344917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F6S33oxpNZL15b/FCsy04IQnVHw/gHFJ67IYhvjEVFY=;
 b=BFagW5sYeNvZ3T/E6j7w4CKWaK+6m6GeKeKayBAujeTKzSqzlkO6YZ7L
 NhjdWau4zkRJMgQ1AMQrp3q74yePgp/QXtkfXOMOB7Mj35FyNS90yCwb/
 N6DeU7h+XtmL/lX2pR0D1Q/9yY4EdJUXH3bhUKkb2DS7+vFoUioEh8YLR
 1t/vkkZtiRlcCwTa99CbHQiCCrKuxZTJdzOxsDrogvUaNcN980YOYyneg
 tdGwuuR2vEDjWByUiWD9vt2n3Z5XgpbOjBJBoXLR01KUhSWuz6pTJUe+O
 cTNZfeVjIKDRrf2T1p+UuwaU1ThsGRqxcjN9pCgaejMs69+/CXrgQfl/J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465693520"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="465693520"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 13:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="815305299"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; d="scan'208";a="815305299"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 15 Sep 2023 13:15:16 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Date: Fri, 15 Sep 2023 13:15:15 -0700
Message-Id: <20230915201515.1238771-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>, ,
	intel.com@freedesktop.org, dri-devel@lists.freedesktop.org,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debugging PXP issues can't even begin without understanding precedding
sequence of important events. Add drm_dbg into the most important PXP events.

 v3 : - move gt_dbg to after mutex block in function
        i915_gsc_proxy_component_bind. (Vivaik)
 v2 : - remove __func__ since drm_dbg covers that (Jani).
      - add timeout dbg of the restart from front-end (Alan).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c |  2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 15 ++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  1 +
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
index 5f138de3c14f..40817ebcca71 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -322,6 +322,7 @@ static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
 	gsc->proxy.component = data;
 	gsc->proxy.component->mei_dev = mei_kdev;
 	mutex_unlock(&gsc->proxy.mutex);
+	gt_dbg(gt, "GSC proxy mei component bound\n");
 
 	return 0;
 }
@@ -342,6 +343,7 @@ static void i915_gsc_proxy_component_unbind(struct device *i915_kdev,
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
 		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
 				 HECI_H_CSR_IE | HECI_H_CSR_RST, 0);
+	gt_dbg(gt, "GSC proxy mei component unbound\n");
 }
 
 static const struct component_ops i915_gsc_proxy_component_ops = {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index dc327cf40b5a..e11f562b1876 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -303,6 +303,8 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 
 	if (!pxp->arb_is_valid)
 		return 0;
+
+	drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: teardown for suspend/fini");
 	/*
 	 * To ensure synchronous and coherent session teardown completion
 	 * in response to suspend or shutdown triggers, don't use a worker.
@@ -324,6 +326,8 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
 
 	if (pxp->arb_is_valid)
 		return 0;
+
+	drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: teardown for restart");
 	/*
 	 * The arb-session is currently inactive and we are doing a reset and restart
 	 * due to a runtime event. Use the worker that was designed for this.
@@ -332,8 +336,11 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
 
 	timeout = intel_pxp_get_backend_timeout_ms(pxp);
 
-	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
+	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout))) {
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: restart backend timed out (%d ms)",
+			timeout);
 		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
@@ -414,10 +421,12 @@ int intel_pxp_start(struct intel_pxp *pxp)
 	int ret = 0;
 
 	ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
-	if (ret < 0)
+	if (ret < 0) {
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: tried but not-avail (%d)", ret);
 		return ret;
-	else if (ret > 1)
+	} else if (ret > 1) {
 		return -EIO; /* per UAPI spec, user may retry later */
+	}
 
 	mutex_lock(&pxp->arb_mutex);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index 91e9622c07d0..0637b1d36356 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -40,11 +40,11 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 		   GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT)) {
 		/* immediately mark PXP as inactive on termination */
 		intel_pxp_mark_termination_in_progress(pxp);
-		pxp->session_events |= PXP_TERMINATION_REQUEST | PXP_INVAL_REQUIRED;
+		pxp->session_events |= PXP_TERMINATION_REQUEST | PXP_INVAL_REQUIRED | PXP_EVENT_TYPE_IRQ;
 	}
 
 	if (iir & GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
-		pxp->session_events |= PXP_TERMINATION_COMPLETE;
+		pxp->session_events |= PXP_TERMINATION_COMPLETE | PXP_EVENT_TYPE_IRQ;
 
 	if (pxp->session_events)
 		queue_work(system_unbound_wq, &pxp->session_work);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 0a3e66b0265e..091c86e03d1a 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -137,8 +137,10 @@ void intel_pxp_terminate(struct intel_pxp *pxp, bool post_invalidation_needs_res
 static void pxp_terminate_complete(struct intel_pxp *pxp)
 {
 	/* Re-create the arb session after teardown handle complete */
-	if (fetch_and_zero(&pxp->hw_state_invalidated))
+	if (fetch_and_zero(&pxp->hw_state_invalidated)) {
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: creating arb_session after invalidation");
 		pxp_create_arb_session(pxp);
+	}
 
 	complete_all(&pxp->termination);
 }
@@ -157,6 +159,8 @@ static void pxp_session_work(struct work_struct *work)
 	if (!events)
 		return;
 
+	drm_dbg(&gt->i915->drm, "PXP: processing event-flags 0x%08x", events);
+
 	if (events & PXP_INVAL_REQUIRED)
 		intel_pxp_invalidate(pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7e11fa8034b2..07864b584cf4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -124,6 +124,7 @@ struct intel_pxp {
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
 #define PXP_INVAL_REQUIRED       BIT(2)
+#define PXP_EVENT_TYPE_IRQ       BIT(3)
 };
 
 #endif /* __INTEL_PXP_TYPES_H__ */

base-commit: cf1e91e884bb1113c653e654e9de1754fc1d4488
-- 
2.39.0

