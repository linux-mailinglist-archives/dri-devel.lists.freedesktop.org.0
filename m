Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7516D3CB163
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 06:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA7D6E8FB;
	Fri, 16 Jul 2021 04:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055E46E8F3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 04:12:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271783390"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271783390"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495788635"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:17 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/15] drm/i915/pxp: start the arb session on demand
Date: Thu, 15 Jul 2021 21:10:30 -0700
Message-Id: <20210716041034.382-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can handle destruction and re-creation of the arb session,
we can postpone the start of the session to the first submission that
requires it, to avoid keeping it running with no user.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 37 ++++++++++++-------
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  5 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  6 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 10 +----
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  2 +
 7 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index f8bf74a1a392..7de2c111ff9c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2981,9 +2981,11 @@ eb_select_engine(struct i915_execbuffer *eb)
 	intel_gt_pm_get(ce->engine->gt);
 
 	if (i915_gem_context_uses_protected_content(eb->gem_context)) {
-		err = intel_pxp_wait_for_arb_start(&ce->engine->gt->pxp);
-		if (err)
-			goto err;
+		if (!intel_pxp_is_active(&ce->engine->gt->pxp)) {
+			err = intel_pxp_start(&ce->engine->gt->pxp);
+			if (err)
+				goto err;
+		}
 
 		if (i915_gem_context_invalidated(eb->gem_context)) {
 			err = -EACCES;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index f418281e8c10..31c8835eebb4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -82,6 +82,7 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	init_completion(&pxp->termination);
 	complete_all(&pxp->termination);
 
+	mutex_init(&pxp->arb_mutex);
 	INIT_WORK(&pxp->session_work, intel_pxp_session_work);
 
 	ret = create_vcs_context(pxp);
@@ -118,7 +119,7 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
 	reinit_completion(&pxp->termination);
 }
 
-static void intel_pxp_queue_termination(struct intel_pxp *pxp)
+static void pxp_queue_termination(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = pxp_to_gt(pxp);
 
@@ -137,31 +138,41 @@ static void intel_pxp_queue_termination(struct intel_pxp *pxp)
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
index 4f7647f34153..382f7f069aca 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -34,7 +34,8 @@ void intel_pxp_init_hw(struct intel_pxp *pxp);
 void intel_pxp_fini_hw(struct intel_pxp *pxp);
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
-int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
+
+int intel_pxp_start(struct intel_pxp *pxp);
 
 int intel_pxp_object_add(struct drm_i915_gem_object *obj);
 void intel_pxp_object_remove(struct drm_i915_gem_object *obj);
@@ -49,7 +50,7 @@ static inline void intel_pxp_fini(struct intel_pxp *pxp)
 {
 }
 
-static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
+static inline int intel_pxp_start(struct intel_pxp *pxp)
 {
 	return 0;
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
index 0edd563a653d..1f13e58d47f9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -85,9 +85,6 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 	/* must mark termination in progress calling this function */
 	GEM_WARN_ON(pxp->arb_is_valid);
 
-	/* invalidate protected objects */
-	intel_pxp_invalidate(pxp);
-
 	/* terminate the hw sessions */
 	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
 	if (ret) {
@@ -144,6 +141,9 @@ void intel_pxp_session_work(struct work_struct *work)
 	if (!events)
 		return;
 
+	if (events & PXP_INVAL_REQUIRED)
+		intel_pxp_invalidate(pxp);
+
 	if (events & PXP_TERMINATION_REQUEST) {
 		events &= ~PXP_TERMINATION_COMPLETE;
 		pxp_terminate(pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 7693540dc1f9..c0998047c1b6 100644
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
index be2bed3a2e4e..42601e6f51ee 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -26,6 +26,7 @@ struct intel_pxp {
 	 * even if the keys are gone, so we can't rely on the HW state of the
 	 * session to know if it's valid and need to track the status in SW.
 	 */
+	struct mutex arb_mutex; /* protects arb session start */
 	bool arb_is_valid;
 
 	struct mutex tee_mutex; /* protects the tee channel binding */
@@ -45,6 +46,7 @@ struct intel_pxp {
 	u32 session_events; /* protected with gt->irq_lock */
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
+#define PXP_INVAL_REQUIRED       BIT(2)
 
 	spinlock_t lock; /* protects the objects list */
 	struct list_head protected_objects;
-- 
2.32.0

