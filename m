Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D538FA39
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 07:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619036E896;
	Tue, 25 May 2021 05:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5506E832;
 Tue, 25 May 2021 05:48:37 +0000 (UTC)
IronPort-SDR: Jm7gX/uO8lKAChzInOLOpCAoCWqe10suXsOtDUv1EBnnLHvLjxT5ZZKcRy9Q6cog22XdvyR7aT
 gPePff8fEM1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="266005447"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="266005447"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:37 -0700
IronPort-SDR: HfBaQBQTFG4lXCxh1qWBv0UBZZ7gJiXSrDKdGv2aL5AhhX9k//NE0memS9eP+GA80n17FDIUka
 Dit4mioNu1dA==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397231770"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 22:48:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 12/17] drm/i915/pxp: start the arb session on demand
Date: Mon, 24 May 2021 22:47:58 -0700
Message-Id: <20210525054803.7387-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
References: <20210525054803.7387-1-daniele.ceraolospurio@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can handle destruction and re-creation of the arb session,
we can postpone the start of the session to the first submission that
requires it, to avoid keeping it running with no user.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 37 ++++++++++++-------
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  6 +--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 10 +----
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  3 ++
 7 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index a11e9d5767bf..c08e28847064 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2948,9 +2948,11 @@ eb_select_engine(struct i915_execbuffer *eb)
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
index f713d3423cea..2291c68fd3a0 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -77,6 +77,7 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	init_completion(&pxp->termination);
 	complete_all(&pxp->termination);
 
+	mutex_init(&pxp->arb_mutex);
 	INIT_WORK(&pxp->session_work, intel_pxp_session_work);
 
 	ret = create_vcs_context(pxp);
@@ -113,7 +114,7 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
 	reinit_completion(&pxp->termination);
 }
 
-static void intel_pxp_queue_termination(struct intel_pxp *pxp)
+static void pxp_queue_termination(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = pxp_to_gt(pxp);
 
@@ -132,31 +133,41 @@ static void intel_pxp_queue_termination(struct intel_pxp *pxp)
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
index 91c1a2056309..1f9871e64096 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -32,7 +32,7 @@ void intel_pxp_init_hw(struct intel_pxp *pxp);
 void intel_pxp_fini_hw(struct intel_pxp *pxp);
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
-int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
+int intel_pxp_start(struct intel_pxp *pxp);
 void intel_pxp_invalidate(struct intel_pxp *pxp);
 #else
 static inline void intel_pxp_init(struct intel_pxp *pxp)
@@ -43,7 +43,7 @@ static inline void intel_pxp_fini(struct intel_pxp *pxp)
 {
 }
 
-static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
+static inline int intel_pxp_start(struct intel_pxp *pxp)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index 196449243515..a230d0034e50 100644
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
index e9fe757e368a..c21620916710 100644
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
index e3d178c44e51..35b3fed4ca2f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -63,23 +63,15 @@ static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
 static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 				       struct device *tee_kdev, void *data)
 {
-	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
-	int ret;
 
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
 
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
index c059a17cbcfe..b3ae49dd73a8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -7,6 +7,7 @@
 #define __INTEL_PXP_TYPES_H__
 
 #include <linux/completion.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -23,6 +24,7 @@ struct intel_pxp {
 	 * even if the keys are gone, so we can't rely on the HW state of the
 	 * session to know if it's valid and need to track the status in SW.
 	 */
+	struct mutex arb_mutex; /* protects arb session start */
 	bool arb_is_valid;
 
 	/*
@@ -40,6 +42,7 @@ struct intel_pxp {
 	u32 session_events; /* protected with gt->irq_lock */
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
+#define PXP_INVAL_REQUIRED       BIT(2)
 };
 
 #endif /* __INTEL_PXP_TYPES_H__ */
-- 
2.29.2

