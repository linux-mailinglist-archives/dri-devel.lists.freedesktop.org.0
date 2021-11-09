Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A332B44AD65
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 13:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E236E8E2;
	Tue,  9 Nov 2021 12:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303746E892;
 Tue,  9 Nov 2021 12:18:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232678112"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="232678112"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 04:18:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="503483050"
Received: from fmpluck-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.200.63])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 04:18:09 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Use per device iommu check
Date: Tue,  9 Nov 2021 12:17:59 +0000
Message-Id: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Lu Baolu <baolu.lu@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On igfx + dgfx setups, it appears that intel_iommu=igfx_off option only
disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
and probe presence of iommu domain per device to accurately reflect its
status.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
Baolu, is my understanding here correct? Maybe I am confused by both
intel_iommu_gfx_mapped and dmar_map_gfx being globals in the intel_iommu
driver. But it certainly appears the setup can assign some iommu ops (and
assign the discrete i915 to iommu group) when those two are set to off.
---
 drivers/gpu/drm/i915/display/intel_bw.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c     |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gemfs.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c         |  4 ++--
 drivers/gpu/drm/i915/i915_debugfs.c          |  1 +
 drivers/gpu/drm/i915/i915_drv.c              |  7 +++++++
 drivers/gpu/drm/i915/i915_drv.h              | 13 +++++++------
 drivers/gpu/drm/i915/i915_gpu_error.c        |  5 +----
 drivers/gpu/drm/i915/intel_device_info.c     | 14 +-------------
 drivers/gpu/drm/i915/intel_pm.c              |  2 +-
 12 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 8d9d888e9316..a4d8088e4f71 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -490,7 +490,7 @@ static unsigned int intel_bw_data_rate(struct drm_i915_private *dev_priv,
 	for_each_pipe(dev_priv, pipe)
 		data_rate += bw_state->data_rate[pipe];
 
-	if (DISPLAY_VER(dev_priv) >= 13 && intel_vtd_active())
+	if (DISPLAY_VER(dev_priv) >= 13 && intel_vtd_active(dev_priv))
 		data_rate = data_rate * 105 / 100;
 
 	return data_rate;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 29392dfc46c8..80d206f3e9da 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1315,7 +1315,7 @@ static bool needs_async_flip_vtd_wa(const struct intel_crtc_state *crtc_state)
 {
 	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
 
-	return crtc_state->uapi.async_flip && intel_vtd_active() &&
+	return crtc_state->uapi.async_flip && intel_vtd_active(i915) &&
 		(DISPLAY_VER(i915) == 9 || IS_BROADWELL(i915) || IS_HASWELL(i915));
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 834eb4cc7c10..0ccbfc9e4101 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1539,7 +1539,7 @@ static int intel_sanitize_fbc_option(struct drm_i915_private *dev_priv)
 static bool need_fbc_vtd_wa(struct drm_i915_private *dev_priv)
 {
 	/* WaFbcTurnOffFbcWhenHyperVisorIsUsed:skl,bxt */
-	if (intel_vtd_active() &&
+	if (intel_vtd_active(dev_priv) &&
 	    (IS_SKYLAKE(dev_priv) || IS_BROXTON(dev_priv))) {
 		drm_info(&dev_priv->drm,
 			 "Disabling framebuffer compression (FBC) to prevent screen flicker with VT-d enabled\n");
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index ddd37ccb1362..cf100c0ea3b7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -399,7 +399,7 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 		return 0;
 	}
 
-	if (intel_vtd_active() && GRAPHICS_VER(i915) < 8) {
+	if (intel_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
 		drm_notice(&i915->drm,
 			   "%s, disabling use of stolen memory\n",
 			   "DMAR active");
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index dbdbdc344d87..11cd66d183e6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -31,7 +31,7 @@ int i915_gemfs_init(struct drm_i915_private *i915)
 	 */
 
 	opts = NULL;
-	if (intel_vtd_active()) {
+	if (intel_vtd_active(i915)) {
 		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			static char huge_opt[] = "huge=within_size"; /* r/w */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 1fb4a03d7ac3..ddb4a9d039d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -104,7 +104,7 @@ static bool needs_idle_maps(struct drm_i915_private *i915)
 	 * Query intel_iommu to see if we need the workaround. Presumably that
 	 * was loaded first.
 	 */
-	if (!intel_vtd_active())
+	if (!intel_vtd_active(i915))
 		return false;
 
 	if (GRAPHICS_VER(i915) == 5 && IS_MOBILE(i915))
@@ -1231,7 +1231,7 @@ int i915_ggtt_probe_hw(struct drm_i915_private *i915)
 	if (ret)
 		return ret;
 
-	if (intel_vtd_active())
+	if (intel_vtd_active(i915))
 		drm_info(&i915->drm, "VT-d active for gfx access\n");
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index fe638b5da7c0..390d541f64ea 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -65,6 +65,7 @@ static int i915_capabilities(struct seq_file *m, void *data)
 
 	intel_device_info_print_static(INTEL_INFO(i915), &p);
 	intel_device_info_print_runtime(RUNTIME_INFO(i915), &p);
+	i915_print_iommu_status(i915, &p);
 	intel_gt_info_print(&i915->gt.info, &p);
 	intel_driver_caps_print(&i915->caps, &p);
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f184b44d05f2..8efd0ad5bef0 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -733,6 +733,12 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 	i915_gem_driver_unregister(dev_priv);
 }
 
+void
+i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printer *p)
+{
+	drm_printf(p, "iommu: %s\n", enableddisabled(intel_vtd_active(i915)));
+}
+
 static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 {
 	if (drm_debug_enabled(DRM_UT_DRIVER)) {
@@ -748,6 +754,7 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 
 		intel_device_info_print_static(INTEL_INFO(dev_priv), &p);
 		intel_device_info_print_runtime(RUNTIME_INFO(dev_priv), &p);
+		i915_print_iommu_status(dev_priv, &p);
 		intel_gt_info_print(&dev_priv->gt.info, &p);
 	}
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e967cd08f23e..9fb38a54f1fe 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1763,26 +1763,27 @@ static inline bool run_as_guest(void)
 #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
 					      IS_ALDERLAKE_S(dev_priv))
 
-static inline bool intel_vtd_active(void)
+static inline bool intel_vtd_active(struct drm_i915_private *i915)
 {
-#ifdef CONFIG_INTEL_IOMMU
-	if (intel_iommu_gfx_mapped)
+	if (iommu_get_domain_for_dev(i915->drm.dev))
 		return true;
-#endif
 
 	/* Running as a guest, we assume the host is enforcing VT'd */
 	return run_as_guest();
 }
 
+void
+i915_print_iommu_status(struct drm_i915_private *i915, struct drm_printer *p);
+
 static inline bool intel_scanout_needs_vtd_wa(struct drm_i915_private *dev_priv)
 {
-	return GRAPHICS_VER(dev_priv) >= 6 && intel_vtd_active();
+	return GRAPHICS_VER(dev_priv) >= 6 && intel_vtd_active(dev_priv);
 }
 
 static inline bool
 intel_ggtt_update_needs_vtd_wa(struct drm_i915_private *i915)
 {
-	return IS_BROXTON(i915) && intel_vtd_active();
+	return IS_BROXTON(i915) && intel_vtd_active(i915);
 }
 
 static inline bool
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index aa2b3aad9643..7672927ed10b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1750,10 +1750,7 @@ static void capture_gen(struct i915_gpu_coredump *error)
 	error->wakelock = atomic_read(&i915->runtime_pm.wakeref_count);
 	error->suspended = i915->runtime_pm.suspended;
 
-	error->iommu = -1;
-#ifdef CONFIG_INTEL_IOMMU
-	error->iommu = intel_iommu_gfx_mapped;
-#endif
+	error->iommu = intel_vtd_active(i915);
 	error->reset_count = i915_reset_count(&i915->gpu_error);
 	error->suspend_count = i915->suspend_count;
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 6e6b317bc33c..e6605b5181a5 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -83,17 +83,6 @@ const char *intel_platform_name(enum intel_platform platform)
 	return platform_names[platform];
 }
 
-static const char *iommu_name(void)
-{
-	const char *msg = "n/a";
-
-#ifdef CONFIG_INTEL_IOMMU
-	msg = enableddisabled(intel_iommu_gfx_mapped);
-#endif
-
-	return msg;
-}
-
 void intel_device_info_print_static(const struct intel_device_info *info,
 				    struct drm_printer *p)
 {
@@ -114,7 +103,6 @@ void intel_device_info_print_static(const struct intel_device_info *info,
 		drm_printf(p, "display version: %u\n", info->display.ver);
 
 	drm_printf(p, "gt: %d\n", info->gt);
-	drm_printf(p, "iommu: %s\n", iommu_name());
 	drm_printf(p, "memory-regions: %x\n", info->memory_regions);
 	drm_printf(p, "page-sizes: %x\n", info->page_sizes);
 	drm_printf(p, "platform: %s\n", intel_platform_name(info->platform));
@@ -374,7 +362,7 @@ void intel_device_info_runtime_init(struct drm_i915_private *dev_priv)
 			info->display.has_dsc = 0;
 	}
 
-	if (GRAPHICS_VER(dev_priv) == 6 && intel_vtd_active()) {
+	if (GRAPHICS_VER(dev_priv) == 6 && intel_vtd_active(dev_priv)) {
 		drm_info(&dev_priv->drm,
 			 "Disabling ppGTT for VT-d support\n");
 		info->ppgtt_type = INTEL_PPGTT_NONE;
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 59adf0ce6719..f5b567f87c24 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -98,7 +98,7 @@ static void gen9_init_clock_gating(struct drm_i915_private *dev_priv)
 		 * "Plane N strech max must be programmed to 11b (x1)
 		 *  when Async flips are enabled on that plane."
 		 */
-		if (!IS_GEMINILAKE(dev_priv) && intel_vtd_active())
+		if (!IS_GEMINILAKE(dev_priv) && intel_vtd_active(dev_priv))
 			intel_uncore_rmw(&dev_priv->uncore, CHICKEN_PIPESL_1(pipe),
 					 SKL_PLANE1_STRETCH_MAX_MASK, SKL_PLANE1_STRETCH_MAX_X1);
 	}
-- 
2.30.2

