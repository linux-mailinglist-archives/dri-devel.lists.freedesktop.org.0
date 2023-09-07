Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EFB796DF4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 02:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7A910E20C;
	Thu,  7 Sep 2023 00:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65B310E20C;
 Thu,  7 Sep 2023 00:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694046034; x=1725582034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UQp34hxGzm9t3ksorX30dU31mKbMRnWycgOvYxhsT7A=;
 b=KuN1BLyjKjIORUFq+bY42hm/npKU4/a3SnHk6wcZLnzSc8jsPGwfkMdH
 nITb2v1JXL6ktUvZRbzTjY8BQ8+E5EzyIXmvY/DQp8uA2xID6ljs7Is1e
 EZrblYDgkYgdKCWCvJ+wqw8dSMjergF+LodY5h27W5QRi/o0PJ1K5L2Rl
 3mGmoxlOnENYxyXGxo5qB3jE+pwDnQEBDHJ0ZyfSFBZU7ny5LsWj/TKAb
 zPptGSJUHIG3Knz5VJpBfwIDjpYZyiNgl0smTibgio/GrapzAhWJs8t01
 ssbn7eTZgZuOzYxihk7OcbbnlDZQYU73ip/USefSAB6IQdK6M9xbqnoDs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443606342"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="443606342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865376868"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="865376868"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 06 Sep 2023 17:20:33 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/i915/pxp: Add drm_dbgs for critical PXP events.
Date: Wed,  6 Sep 2023 17:20:32 -0700
Message-Id: <20230907002032.81587-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Debugging PXP issues can't even begin without understanding precedding
sequence of events. Add drm_dbg into the most important PXP events.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c |  2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 10 ++++++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 +++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  1 +
 5 files changed, 18 insertions(+), 5 deletions(-)

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
index dc327cf40b5a..d285f10bbacc 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -303,6 +303,8 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 
 	if (!pxp->arb_is_valid)
 		return 0;
+
+	drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: %s invoked", __func__);
 	/*
 	 * To ensure synchronous and coherent session teardown completion
 	 * in response to suspend or shutdown triggers, don't use a worker.
@@ -324,6 +326,8 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
 
 	if (pxp->arb_is_valid)
 		return 0;
+
+	drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: %s invoked", __func__);
 	/*
 	 * The arb-session is currently inactive and we are doing a reset and restart
 	 * due to a runtime event. Use the worker that was designed for this.
@@ -414,10 +418,12 @@ int intel_pxp_start(struct intel_pxp *pxp)
 	int ret = 0;
 
 	ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
-	if (ret < 0)
+	if (ret < 0) {
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: explicit %s failed on readiness with %d", __func__, ret);
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
index 0a3e66b0265e..2041dd5221e7 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -137,8 +137,10 @@ void intel_pxp_terminate(struct intel_pxp *pxp, bool post_invalidation_needs_res
 static void pxp_terminate_complete(struct intel_pxp *pxp)
 {
 	/* Re-create the arb session after teardown handle complete */
-	if (fetch_and_zero(&pxp->hw_state_invalidated))
+	if (fetch_and_zero(&pxp->hw_state_invalidated)) {
+		drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: %s to create arb_session after invalidation", __func__);
 		pxp_create_arb_session(pxp);
+	}
 
 	complete_all(&pxp->termination);
 }
@@ -157,6 +159,8 @@ static void pxp_session_work(struct work_struct *work)
 	if (!events)
 		return;
 
+	drm_dbg(&gt->i915->drm, "PXP: %s invoked with event-flags 0x%08x", __func__, events);
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

base-commit: 5008076127a9599704e98fb4de3761743d943dd0
-- 
2.39.0

