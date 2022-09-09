Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC95B2B0C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5F310E877;
	Fri,  9 Sep 2022 00:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1393D10E87D;
 Fri,  9 Sep 2022 00:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682606; x=1694218606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48kKvaGp9z155oiGP2h4coKGD6Gr1fRe+xHJ7gREimk=;
 b=FnbOcIzgq2lNDfji+0xOr1dnYPwiUjd+ajrSf6hL+iKgy1hqyK+04Vwj
 +Rpb0LlN3At8hI2XKWYE26mTaLgs+dG+7HcyjhnDWXGfg93BiSndFyQrg
 5O5WFHMiatOIo9ad4DJwfoAstZ5qKhi/DsNhk3fOImhwLg5NJJUar0GVP
 drrIrypgWL7ttetbg9GdPYyupS4X/rDVee+fKTMSPnkpHHt74jnEexwnj
 Q10eTn9L0M5KchN4F9Prvva4Y+ERJhbbzlW5dXKD4fCJ4jbxpMpJ9waYP
 Eo//wnisTbZl9lws9lDLdmvMDmPcMbgtLxDGaBgKec/MYI9FYDXcy90WY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294938853"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294938853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="676933220"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 07/15] drm/i915/pxp: load the pxp module when we have a
 gsc-loaded huc
Date: Thu,  8 Sep 2022 17:16:04 -0700
Message-Id: <20220909001612.728451-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
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
index 522ef9b4aff3..589823ad62ed 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -307,15 +307,17 @@ i915-y += \
 
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
index 17109c513259..b0bcc25bf1ce 100644
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
index 92b00b4de240..8453e13e9120 100644
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

