Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41E5B64BB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88B10E4B4;
	Tue, 13 Sep 2022 00:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DCB10E146;
 Tue, 13 Sep 2022 00:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030682; x=1694566682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0XPJ2+MMU0pENZs/D2vKN13TdPAytMUpdrynMO7T6w=;
 b=CujV0cbITxTr73vf3BB+fHzZ6kz/bcBJlB7eGDRfvTS7rDvOU+IpSVoG
 7tkr81PFZo5vuOCzMYPHLS43HjedtZQ7hIFIlhru7auiadgy+EFSjEf7w
 hP0QnnhVhIAjAxtKQNm0UQX8UDqLVqYShb1oAVBESYF9K6w8Klr3UaBKQ
 eCgkVLAyfflVax5hDSZXZ8GadjhMkpNc6FRsv831+SKR+ZJ4aRBZRGl/6
 qcnVpi08FjtNT1YPpJFFfui3rSO3dlkfCSYgdjgpcxJIuUCidq7GElehj
 kSj9etS5+7MIAGVI7gCss6dUzDnQtMsVOD5K9tsX11HA45oXheZ9EI2qc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281024406"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281024406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593549"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:58:02 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 07/15] drm/i915/pxp: load the pxp module when we have a
 gsc-loaded huc
Date: Mon, 12 Sep 2022 17:57:31 -0700
Message-Id: <20220913005739.798337-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mei_pxp module is required to send the command to load authenticate
the HuC to the GSC even if pxp is not in use for protected content
management.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Makefile                | 10 +++---
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 32 +++++++++++++-------
 drivers/gpu/drm/i915/pxp/intel_pxp.h         | 32 --------------------
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     |  8 +++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  8 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h | 11 +++++--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     | 10 ++++--
 7 files changed, 57 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a26edcdadc21..26fc2f23c4e0 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -309,15 +309,17 @@ i915-y += \
 
 i915-y += i915_perf.o
 
-# Protected execution platform (PXP) support
-i915-$(CONFIG_DRM_I915_PXP) += \
+# Protected execution platform (PXP) support. Base support is required for HuC
+i915-y += \
 	pxp/intel_pxp.o \
+	pxp/intel_pxp_tee.o
+
+i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp_cmd.o \
 	pxp/intel_pxp_debugfs.o \
 	pxp/intel_pxp_irq.o \
 	pxp/intel_pxp_pm.o \
-	pxp/intel_pxp_session.o \
-	pxp/intel_pxp_tee.o
+	pxp/intel_pxp_session.o
 
 # Post-mortem debug and GPU hang state capture
 i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 69cdaaddc4a9..5efe61f67546 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -103,19 +103,15 @@ static int create_vcs_context(struct intel_pxp *pxp)
 
 static void destroy_vcs_context(struct intel_pxp *pxp)
 {
-	intel_engine_destroy_pinned_context(fetch_and_zero(&pxp->ce));
+	if (pxp->ce)
+		intel_engine_destroy_pinned_context(fetch_and_zero(&pxp->ce));
 }
 
-void intel_pxp_init(struct intel_pxp *pxp)
+static void pxp_init_full(struct intel_pxp *pxp)
 {
 	struct intel_gt *gt = pxp_to_gt(pxp);
 	int ret;
 
-	if (!HAS_PXP(gt->i915))
-		return;
-
-	mutex_init(&pxp->tee_mutex);
-
 	/*
 	 * we'll use the completion to check if there is a termination pending,
 	 * so we start it as completed and we reinit it when a termination
@@ -124,8 +120,7 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	init_completion(&pxp->termination);
 	complete_all(&pxp->termination);
 
-	mutex_init(&pxp->arb_mutex);
-	INIT_WORK(&pxp->session_work, intel_pxp_session_work);
+	intel_pxp_session_management_init(pxp);
 
 	ret = create_vcs_context(pxp);
 	if (ret)
@@ -143,11 +138,26 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	destroy_vcs_context(pxp);
 }
 
-void intel_pxp_fini(struct intel_pxp *pxp)
+void intel_pxp_init(struct intel_pxp *pxp)
 {
-	if (!intel_pxp_is_enabled(pxp))
+	struct intel_gt *gt = pxp_to_gt(pxp);
+
+	/* we rely on the mei PXP module */
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP))
 		return;
 
+	/*
+	 * If HuC is loaded by GSC but PXP is disabled, we can skip the init of
+	 * the full PXP session/object management and just init the tee channel.
+	 */
+	if (HAS_PXP(gt->i915))
+		pxp_init_full(pxp);
+	else if (intel_huc_is_loaded_by_gsc(&gt->uc.huc) && intel_uc_uses_huc(&gt->uc))
+		intel_pxp_tee_component_init(pxp);
+}
+
+void intel_pxp_fini(struct intel_pxp *pxp)
+{
 	pxp->arb_is_valid = false;
 
 	intel_pxp_tee_component_fini(pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 73847e535cab..2da309088c6d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -12,7 +12,6 @@
 struct intel_pxp;
 struct drm_i915_gem_object;
 
-#ifdef CONFIG_DRM_I915_PXP
 struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp);
 bool intel_pxp_is_enabled(const struct intel_pxp *pxp);
 bool intel_pxp_is_active(const struct intel_pxp *pxp);
@@ -32,36 +31,5 @@ int intel_pxp_key_check(struct intel_pxp *pxp,
 			bool assign);
 
 void intel_pxp_invalidate(struct intel_pxp *pxp);
-#else
-static inline void intel_pxp_init(struct intel_pxp *pxp)
-{
-}
-
-static inline void intel_pxp_fini(struct intel_pxp *pxp)
-{
-}
-
-static inline int intel_pxp_start(struct intel_pxp *pxp)
-{
-	return -ENODEV;
-}
-
-static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
-{
-	return false;
-}
-
-static inline bool intel_pxp_is_active(const struct intel_pxp *pxp)
-{
-	return false;
-}
-
-static inline int intel_pxp_key_check(struct intel_pxp *pxp,
-				      struct drm_i915_gem_object *obj,
-				      bool assign)
-{
-	return -ENODEV;
-}
-#endif
 
 #endif /* __INTEL_PXP_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
index 8b5793654844..8c292dc86f68 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
@@ -27,6 +27,14 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir);
 static inline void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 {
 }
+
+static inline void intel_pxp_irq_enable(struct intel_pxp *pxp)
+{
+}
+
+static inline void intel_pxp_irq_disable(struct intel_pxp *pxp)
+{
+}
 #endif
 
 #endif /* __INTEL_PXP_IRQ_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 1bb5b5249157..ecff0935adbf 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -137,7 +137,7 @@ static void pxp_terminate_complete(struct intel_pxp *pxp)
 	complete_all(&pxp->termination);
 }
 
-void intel_pxp_session_work(struct work_struct *work)
+static void pxp_session_work(struct work_struct *work)
 {
 	struct intel_pxp *pxp = container_of(work, typeof(*pxp), session_work);
 	struct intel_gt *gt = pxp_to_gt(pxp);
@@ -172,3 +172,9 @@ void intel_pxp_session_work(struct work_struct *work)
 
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 }
+
+void intel_pxp_session_management_init(struct intel_pxp *pxp)
+{
+	mutex_init(&pxp->arb_mutex);
+	INIT_WORK(&pxp->session_work, pxp_session_work);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
index ba4c9d2b94b7..903ac52cffa1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
@@ -8,8 +8,13 @@
 
 #include <linux/types.h>
 
-struct work_struct;
-
-void intel_pxp_session_work(struct work_struct *work);
+struct intel_pxp;
 
+#ifdef CONFIG_DRM_I915_PXP
+void intel_pxp_session_management_init(struct intel_pxp *pxp);
+#else
+static inline void intel_pxp_session_management_init(struct intel_pxp *pxp)
+{
+}
+#endif
 #endif /* __INTEL_PXP_SESSION_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 4b6f5655fab5..2c1fc49ecec1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -97,7 +97,8 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 		return 0;
 
 	/* the component is required to fully start the PXP HW */
-	intel_pxp_init_hw(pxp);
+	if (intel_pxp_is_enabled(pxp))
+		intel_pxp_init_hw(pxp);
 
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 
@@ -111,8 +112,9 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
 	intel_wakeref_t wakeref;
 
-	with_intel_runtime_pm_if_in_use(&i915->runtime_pm, wakeref)
-		intel_pxp_fini_hw(pxp);
+	if (intel_pxp_is_enabled(pxp))
+		with_intel_runtime_pm_if_in_use(&i915->runtime_pm, wakeref)
+			intel_pxp_fini_hw(pxp);
 
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = NULL;
@@ -130,6 +132,8 @@ int intel_pxp_tee_component_init(struct intel_pxp *pxp)
 	struct intel_gt *gt = pxp_to_gt(pxp);
 	struct drm_i915_private *i915 = gt->i915;
 
+	mutex_init(&pxp->tee_mutex);
+
 	ret = component_add_typed(i915->drm.dev, &i915_pxp_tee_component_ops,
 				  I915_COMPONENT_PXP);
 	if (ret < 0) {
-- 
2.37.2

