Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7FC405035
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36576E898;
	Thu,  9 Sep 2021 12:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584E96E87E;
 Thu,  9 Sep 2021 12:32:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="208005447"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="208005447"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="470057767"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 05:32:05 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 11/17] drm/i915/pxp: start the arb session on demand
Date: Thu,  9 Sep 2021 05:29:09 -0700
Message-Id: <20210909122915.971652-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
References: <20210909122915.971652-1-daniele.ceraolospurio@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can handle destruction and re-creation of the arb session,
we can postpone the start of the session to the first submission that
requires it, to avoid keeping it running with no user.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c  |  4 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 37 +++++++++++++-------
 drivers/gpu/drm/i915/pxp/intel_pxp.h         |  5 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  6 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     | 10 +-----
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  2 ++
 7 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8d2d4dbdab7c..eef3acd99467 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -267,7 +267,9 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
 		 * which in turn requires the device to be active.
 		 */
 		pc->pxp_wakeref = intel_runtime_pm_get(&i915->runtime_pm);
-		ret = intel_pxp_wait_for_arb_start(&i915->gt.pxp);
+
+		if (!intel_pxp_is_active(&i915->gt.pxp))
+			ret = intel_pxp_start(&i915->gt.pxp);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 08fd440a4622..c4d17e22e9cd 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -79,6 +79,7 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	init_completion(&pxp->termination);
 	complete_all(&pxp->termination);
 
+	mutex_init(&pxp->arb_mutex);
 	INIT_WORK(&pxp->session_work, intel_pxp_session_work);
 
 	ret = create_vcs_context(pxp);
@@ -115,7 +116,7 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
 	reinit_completion(&pxp->termination);
 }
 
-static void intel_pxp_queue_termination(struct intel_pxp *pxp)
+static void pxp_queue_termination(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = pxp_to_gt(pxp);
 
@@ -134,31 +135,41 @@ static void intel_pxp_queue_termination(struct intel_pxp *pxp)
  * the arb session is restarted from the irq work when we receive the
  * termination completion interrupt
  */
-int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
+int intel_pxp_start(struct intel_pxp *pxp)
 {
+	int ret = 0;
+
 	if (!intel_pxp_is_enabled(pxp))
-		return 0;
+		return -ENODEV;
+
+	mutex_lock(&pxp->arb_mutex);
+
+	if (pxp->arb_is_valid)
+		goto unlock;
+
+	pxp_queue_termination(pxp);
 
 	if (!wait_for_completion_timeout(&pxp->termination,
-					 msecs_to_jiffies(100)))
-		return -ETIMEDOUT;
+					msecs_to_jiffies(100))) {
+		ret = -ETIMEDOUT;
+		goto unlock;
+	}
+
+	/* make sure the compiler doesn't optimize the double access */
+	barrier();
 
 	if (!pxp->arb_is_valid)
-		return -EIO;
+		ret = -EIO;
 
-	return 0;
+unlock:
+	mutex_unlock(&pxp->arb_mutex);
+	return ret;
 }
 
 void intel_pxp_init_hw(struct intel_pxp *pxp)
 {
 	kcr_pxp_enable(pxp_to_gt(pxp));
 	intel_pxp_irq_enable(pxp);
-
-	/*
-	 * the session could've been attacked while we weren't loaded, so
-	 * handle it as if it was and re-create it.
-	 */
-	intel_pxp_queue_termination(pxp);
 }
 
 void intel_pxp_fini_hw(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index f942bdd2af0c..424fe00a91fb 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -34,7 +34,8 @@ void intel_pxp_init_hw(struct intel_pxp *pxp);
 void intel_pxp_fini_hw(struct intel_pxp *pxp);
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
-int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
+
+int intel_pxp_start(struct intel_pxp *pxp);
 
 int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj);
 
@@ -48,7 +49,7 @@ static inline void intel_pxp_fini(struct intel_pxp *pxp)
 {
 }
 
-static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
+static inline int intel_pxp_start(struct intel_pxp *pxp)
 {
 	return -ENODEV;
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index 46eca1e81b9b..340f20d130a8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -31,7 +31,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 		   GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT)) {
 		/* immediately mark PXP as inactive on termination */
 		intel_pxp_mark_termination_in_progress(pxp);
-		pxp->session_events |= PXP_TERMINATION_REQUEST;
+		pxp->session_events |= PXP_TERMINATION_REQUEST | PXP_INVAL_REQUIRED;
 	}
 
 	if (iir & GEN12_DISPLAY_STATE_RESET_COMPLETE_INTERRUPT)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index c6a5e4197e40..a95cc443a48d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -88,9 +88,6 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 	/* must mark termination in progress calling this function */
 	GEM_WARN_ON(pxp->arb_is_valid);
 
-	/* invalidate protected objects */
-	intel_pxp_invalidate(pxp);
-
 	/* terminate the hw sessions */
 	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
 	if (ret) {
@@ -147,6 +144,9 @@ void intel_pxp_session_work(struct work_struct *work)
 	if (!events)
 		return;
 
+	if (events & PXP_INVAL_REQUIRED)
+		intel_pxp_invalidate(pxp);
+
 	if (events & PXP_TERMINATION_REQUEST) {
 		events &= ~PXP_TERMINATION_COMPLETE;
 		pxp_terminate(pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 494bd6b48514..3fc3ddfd02b3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -78,9 +78,7 @@ static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
 static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 				       struct device *tee_kdev, void *data)
 {
-	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
-	int ret;
 
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = data;
@@ -89,14 +87,8 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 
 	/* the component is required to fully start the PXP HW */
 	intel_pxp_init_hw(pxp);
-	ret = intel_pxp_wait_for_arb_start(pxp);
-	if (ret) {
-		drm_err(&i915->drm, "Failed to create arb session during bind\n");
-		intel_pxp_fini_hw(pxp);
-		pxp->pxp_component = NULL;
-	}
 
-	return ret;
+	return 0;
 }
 
 static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index c394ab2e452b..ae24064bb57e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -27,6 +27,7 @@ struct intel_pxp {
 	 * even if the keys are gone, so we can't rely on the HW state of the
 	 * session to know if it's valid and need to track the status in SW.
 	 */
+	struct mutex arb_mutex; /* protects arb session start */
 	bool arb_is_valid;
 
 	/*
@@ -53,6 +54,7 @@ struct intel_pxp {
 	u32 session_events; /* protected with gt->irq_lock */
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
+#define PXP_INVAL_REQUIRED       BIT(2)
 };
 
 #endif /* __INTEL_PXP_TYPES_H__ */
-- 
2.25.1

