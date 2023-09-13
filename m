Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFD79F53C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 00:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AC510E155;
	Wed, 13 Sep 2023 22:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1C10E155;
 Wed, 13 Sep 2023 22:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694645837; x=1726181837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AMczJul7pOSbCv5sk4wGDQzfsEhYOg9e29Sgn1lkJM4=;
 b=fSUrHkrNdaVn/x5af/okI/hJek20w5VQ6Az697UzUHaiMLEIi9ttTiOb
 tpwyO02SK8jTs5IXSE/mKws2ien4lv4UENF2CdHWnGdWtCOhePnxK9fch
 uH2hcIf7+7KRS4nOUsRHgEhwzvvoKq0B9Dw+cFeppE1gdjL0wmcJ1O/MW
 kxFv4WIlP1Y8l9Gdw/bdMmy+4y6DlTjj9zvHW+tbKtWEYRPxJgLEEcIVf
 ObYgLbMh3ctSPXsW+7OB5W/iAqu5zW8zhmbMTCUTCamBcQCYct3eJEtvv
 C8rn0YKntU1K1rXBzpON5lpzg3NROkMCW+8Zc8rcr/SpljtXna0lWWOwy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378729972"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="378729972"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="720974772"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="720974772"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 13 Sep 2023 15:57:15 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Date: Wed, 13 Sep 2023 15:57:14 -0700
Message-Id: <20230913225714.877627-1-alan.previn.teres.alexis@intel.com>
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
Cc: , intel.com@freedesktop.org, dri-devel@lists.freedesktop.org,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debugging PXP issues can't even begin without understanding precedding
sequence of events. Add drm_dbg into the most important PXP events.

 v2 : - remove __func__ since drm_dbg covers that (Jani).
      - add timeout of the restart from front-end (Alan).

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c |  2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 15 ++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  1 +
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
index 5f138de3c14f..61216c4abaec 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -321,6 +321,7 @@ static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
 	mutex_lock(&gsc->proxy.mutex);
 	gsc->proxy.component = data;
 	gsc->proxy.component->mei_dev = mei_kdev;
+	gt_dbg(gt, "GSC proxy mei component bound\n");
 	mutex_unlock(&gsc->proxy.mutex);
 
 	return 0;
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

base-commit: 45460a37f9be43072b509ca6044b215648f56221
-- 
2.39.0

