Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D463CD10
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 03:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1090110E409;
	Wed, 30 Nov 2022 02:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBFF10E407;
 Wed, 30 Nov 2022 02:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669773618; x=1701309618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EKAjMGzrFve4u7vxw2+Okhbm/oJIPARLXbAsUEhE+Qw=;
 b=oKGGQWtWPgBHDVNPKvZgkWp3Vf1e+U02xJCKHYBP2XgzhapSsiQypD2F
 gCrAsQu1a4FnuJa4f0wqnRS/79S1qKJ368E3MRNagi/sESIGodAvSRpwp
 S2/SQeNYUS94Re3WBnqRvq5X7nnYEjeLAyMxJeRRP6CP6T1i40fanTTAc
 uPe9pH6QsEhdzTU/8vnEnBj18866QWVkEPQ89U/8dWN/ql4LSqey43EGz
 Yma5p5Gq2oxbLmtU4n20a8UA8DMNd4eVFuFPz/K1fO1FDBI81Y3mqiI8P
 MNlRv9eMZYgOlGtrTz3CKuFt9U/Az3CIxmuxzmeXy/ETP7wOq/Ydnp/GG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="302885609"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="302885609"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 18:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="646143250"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="646143250"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2022 18:00:16 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/1] drm/i915/pxp: Promote pxp subsystem to top-level of
 i915
Date: Tue, 29 Nov 2022 18:02:45 -0800
Message-Id: <20221130020245.3909555-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org, dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo <rodrigo.vivi@intel.com>,
	John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting with MTL, there will be two GT-tiles, a render and media
tile. PXP as a service for supporting workloads with protected
contexts and protected buffers can be subscribed by process
workloads on any tile. However, depending on the platform,
only one of the tiles is used for control events pertaining to PXP
operation (such as creating the arbitration session and session
tear-down).

PXP as a global feature is accessible via batch buffer instructions
on any engine/tile and the coherency across tiles is handled implicitly
by the HW. In fact, for the foreseeable future, we are expecting this
single-control-tile for the PXP subsystem.

In MTL, it's the standalone media tile (not the root tile) because
it contains the VDBOX and KCR engine (among the assets PXP relies on
for those events).

Looking at the current code design, each tile is represented by the
intel_gt structure while the intel_pxp structure currently hangs off the
intel_gt structure.

Keeping the intel_pxp structure within the intel_gt structure makes some
internal functionalities more straight forward but adds code complexity to
code readibility and maintainibility to many external-to-pxp subsystems
which may need to pick the correct intel_gt structure. An example of this
would be the intel_pxp_is_active or intel_pxp_is_enabled functionality
which should be viewed as a global level inquiry, not a per-gt inquiry.

That said, this series promotes the intel_pxp structure into the
drm_i915_private structure making it a top-level subsystem and the PXP
subsystem will select the control gt internally and keep a pointer to
it for internal reference.

Changes from prior revs:
   v5: - Switch from series to single patch (Rodrigo).
       - change function name from pxp_get_kcr_owner_gt to
         pxp_get_ctrl_gt.
       - Fix CI BAT failure by removing redundant call to intel_pxp_fini
         from driver-remove.
       - NOTE: remaining open still persists on using ptr-to-ptr
         and back-ptr.
   v4: - Instead of maintaining intel_pxp as an intel_gt structure member
         and creating a number of convoluted helpers that takes in i915 as
         input and redirects to the correct intel_gt or takes any intel_gt
         and internally replaces with the correct intel_gt, promote it to
         be a top-level i915 structure.
   v3: - Rename gt level helper functions to "intel_pxp_is_enabled/
         supported/ active_on_gt" (Daniele)
       - Upgrade _gt_supports_pxp to replace what was intel_gtpxp_is
         supported as the new intel_pxp_is_supported_on_gt to check for
         PXP feature support vs the tee support for huc authentication.
         Fix pxp-debugfs-registration to use only the former to decide
         support. (Daniele)
       - Couple minor optimizations.
   v2: - Avoid introduction of new device info or gt variables and use
         existing checks / macros to differentiate the correct GT->PXP
         control ownership (Daniele Ceraolo Spurio)
       - Don't reuse the updated global-checkers for per-GT callers (such
         as other files within PXP) to avoid unnecessary GT-reparsing,
         expose a replacement helper like the prior ones. (Daniele).
   v1: - Add one more patch to the series for the intel_pxp suspend/resume
         for similar refactoring

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../drm/i915/display/skl_universal_plane.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  5 --
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c    |  1 -
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  8 ---
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  3 -
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  2 +-
 drivers/gpu/drm/i915/i915_driver.c            | 18 +++++
 drivers/gpu/drm/i915/i915_drv.h               |  3 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 72 ++++++++++++++-----
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c      |  8 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  | 41 +++++++----
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h  |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      | 10 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |  4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |  8 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    | 11 +++
 21 files changed, 148 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 76490cc59d8f..4b79c2d2d617 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1848,7 +1848,7 @@ static bool bo_has_valid_encryption(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 
-	return intel_pxp_key_check(&to_gt(i915)->pxp, obj, false) == 0;
+	return intel_pxp_key_check(i915->pxp, obj, false) == 0;
 }
 
 static bool pxp_is_borked(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7f2831efc798..46e71f62fcec 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -257,7 +257,7 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
 
 	if (!protected) {
 		pc->uses_protected_content = false;
-	} else if (!intel_pxp_is_enabled(&to_gt(i915)->pxp)) {
+	} else if (!intel_pxp_is_enabled(i915->pxp)) {
 		ret = -ENODEV;
 	} else if ((pc->user_flags & BIT(UCONTEXT_RECOVERABLE)) ||
 		   !(pc->user_flags & BIT(UCONTEXT_BANNABLE))) {
@@ -271,8 +271,8 @@ static int proto_context_set_protected(struct drm_i915_private *i915,
 		 */
 		pc->pxp_wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
-		if (!intel_pxp_is_active(&to_gt(i915)->pxp))
-			ret = intel_pxp_start(&to_gt(i915)->pxp);
+		if (!intel_pxp_is_active(i915->pxp))
+			ret = intel_pxp_start(i915->pxp);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 33673fe7ee0a..005a7f842784 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -384,7 +384,7 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
 	if (ext.flags)
 		return -EINVAL;
 
-	if (!intel_pxp_is_enabled(&to_gt(ext_data->i915)->pxp))
+	if (!intel_pxp_is_enabled(ext_data->i915->pxp))
 		return -ENODEV;
 
 	ext_data->flags |= I915_BO_PROTECTED;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 29e9e8d5b6fe..ed74d173a092 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -869,7 +869,7 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
 		 */
 		if (i915_gem_context_uses_protected_content(eb->gem_context) &&
 		    i915_gem_object_is_protected(obj)) {
-			err = intel_pxp_key_check(&vm->gt->pxp, obj, true);
+			err = intel_pxp_key_check(vm->gt->i915->pxp, obj, true);
 			if (err) {
 				i915_gem_object_put(obj);
 				return ERR_PTR(err);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 7ef0edb2e37c..1fd6b34ecda3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -8,7 +8,6 @@
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
-#include "pxp/intel_pxp.h"
 
 #include "i915_drv.h"
 #include "i915_perf_oa_regs.h"
@@ -753,8 +752,6 @@ int intel_gt_init(struct intel_gt *gt)
 
 	intel_migrate_init(&gt->migrate, gt);
 
-	intel_pxp_init(&gt->pxp);
-
 	goto out_fw;
 err_gt:
 	__intel_gt_disable(gt);
@@ -794,8 +791,6 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 	intel_rps_driver_unregister(&gt->rps);
 	intel_gsc_fini(&gt->gsc);
 
-	intel_pxp_fini(&gt->pxp);
-
 	/*
 	 * Upon unregistering the device to prevent any new users, cancel
 	 * all in-flight requests so that we can quickly unbind the active
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index dd53641f3637..7876f4c3d0f1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -99,7 +99,6 @@ void intel_gt_debugfs_register(struct intel_gt *gt)
 	intel_sseu_debugfs_register(gt, root);
 
 	intel_uc_debugfs_register(&gt->uc, root);
-	intel_pxp_debugfs_register(&gt->pxp, root);
 }
 
 void intel_gt_debugfs_register_files(struct dentry *root,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 6f6b9e04d916..8fac2660e16b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -76,7 +76,7 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 		return gen11_rps_irq_handler(&media_gt->rps, iir);
 
 	if (instance == OTHER_KCR_INSTANCE)
-		return intel_pxp_irq_handler(&gt->pxp, iir);
+		return intel_pxp_irq_handler(gt->i915->pxp, iir);
 
 	if (instance == OTHER_GSC_INSTANCE)
 		return intel_gsc_irq_handler(gt, iir);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 16db85fab0b1..c065950d0bad 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -304,8 +304,6 @@ int intel_gt_resume(struct intel_gt *gt)
 
 	intel_uc_resume(&gt->uc);
 
-	intel_pxp_resume(&gt->pxp);
-
 	user_forcewake(gt, false);
 
 out_fw:
@@ -339,8 +337,6 @@ void intel_gt_suspend_prepare(struct intel_gt *gt)
 {
 	user_forcewake(gt, true);
 	wait_for_suspend(gt);
-
-	intel_pxp_suspend_prepare(&gt->pxp);
 }
 
 static suspend_state_t pm_suspend_target(void)
@@ -365,7 +361,6 @@ void intel_gt_suspend_late(struct intel_gt *gt)
 	GEM_BUG_ON(gt->awake);
 
 	intel_uc_suspend(&gt->uc);
-	intel_pxp_suspend(&gt->pxp);
 
 	/*
 	 * On disabling the device, we want to turn off HW access to memory
@@ -393,7 +388,6 @@ void intel_gt_suspend_late(struct intel_gt *gt)
 
 void intel_gt_runtime_suspend(struct intel_gt *gt)
 {
-	intel_pxp_runtime_suspend(&gt->pxp);
 	intel_uc_runtime_suspend(&gt->uc);
 
 	GT_TRACE(gt, "\n");
@@ -411,8 +405,6 @@ int intel_gt_runtime_resume(struct intel_gt *gt)
 	if (ret)
 		return ret;
 
-	intel_pxp_runtime_resume(&gt->pxp);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index c1d9cd255e06..07ebeffbc8bd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -30,7 +30,6 @@
 #include "intel_rps_types.h"
 #include "intel_migrate_types.h"
 #include "intel_wakeref.h"
-#include "pxp/intel_pxp_types.h"
 #include "intel_wopcm.h"
 
 struct drm_i915_private;
@@ -267,8 +266,6 @@ struct intel_gt {
 		u8 wb_index; /* Only used on HAS_L3_CCS_READ() platforms */
 	} mocs;
 
-	struct intel_pxp pxp;
-
 	/* gt/gtN sysfs */
 	struct kobject sysfs_gt;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
index 4f246416db17..534b0aa43316 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
@@ -32,7 +32,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
 
 	GEM_WARN_ON(intel_uc_fw_is_loaded(&huc->fw));
 
-	ret = intel_pxp_huc_load_and_auth(&huc_to_gt(huc)->pxp);
+	ret = intel_pxp_huc_load_and_auth(huc_to_gt(huc)->i915->pxp);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 69103ae37779..f9d52133ee06 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -73,6 +73,8 @@
 #include "gt/intel_gt_pm.h"
 #include "gt/intel_rc6.h"
 
+#include "pxp/intel_pxp.h"
+#include "pxp/intel_pxp_debugfs.h"
 #include "pxp/intel_pxp_pm.h"
 
 #include "i915_file_private.h"
@@ -763,6 +765,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_register(gt);
 
+	intel_pxp_debugfs_register(dev_priv->pxp);
+
 	i915_hwmon_register(dev_priv);
 
 	intel_display_driver_register(dev_priv);
@@ -794,6 +798,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_unregister(dev_priv);
 
+	intel_pxp_fini(&dev_priv->pxp);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_driver_unregister(gt);
 
@@ -937,6 +943,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		goto out_cleanup_modeset2;
 
+	intel_pxp_init(&i915->pxp);
+
 	ret = intel_modeset_init(i915);
 	if (ret)
 		goto out_cleanup_gem;
@@ -1172,6 +1180,8 @@ static int i915_drm_prepare(struct drm_device *dev)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 
+	intel_pxp_suspend_prepare(i915->pxp);
+
 	/*
 	 * NB intel_display_suspend() may issue new requests after we've
 	 * ostensibly marked the GPU as ready-to-sleep here. We need to
@@ -1252,6 +1262,8 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
 
 	disable_rpm_wakeref_asserts(rpm);
 
+	intel_pxp_suspend(dev_priv->pxp);
+
 	i915_gem_suspend_late(dev_priv);
 
 	for_each_gt(gt, dev_priv, i)
@@ -1358,6 +1370,8 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	i915_gem_resume(dev_priv);
 
+	intel_pxp_resume(dev_priv->pxp);
+
 	intel_modeset_init_hw(dev_priv);
 	intel_init_clock_gating(dev_priv);
 	intel_hpd_init(dev_priv);
@@ -1641,6 +1655,8 @@ static int intel_runtime_suspend(struct device *kdev)
 	 */
 	i915_gem_runtime_suspend(dev_priv);
 
+	intel_pxp_runtime_suspend(dev_priv->pxp);
+
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_runtime_suspend(gt);
 
@@ -1745,6 +1761,8 @@ static int intel_runtime_resume(struct device *kdev)
 	for_each_gt(gt, dev_priv, i)
 		intel_gt_runtime_resume(gt);
 
+	intel_pxp_runtime_resume(dev_priv->pxp);
+
 	/*
 	 * On VLV/CHV display interrupts are part of the display
 	 * power well, so hpd is reinitialized from there. For
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index a380db36d52c..679fa8a424d5 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -72,6 +72,7 @@ struct intel_encoder;
 struct intel_limit;
 struct intel_overlay_error_state;
 struct vlv_s0ix_state;
+struct intel_pxp;
 
 #define I915_GEM_GPU_DOMAINS \
 	(I915_GEM_DOMAIN_RENDER | \
@@ -364,6 +365,8 @@ struct drm_i915_private {
 		struct file *mmap_singleton;
 	} gem;
 
+	struct intel_pxp *pxp;
+
 	u8 pch_ssc_use;
 
 	/* For i915gm/i945gm vblank irq workaround */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 5efe61f67546..9cc01ecb7179 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -3,13 +3,19 @@
  * Copyright(c) 2020 Intel Corporation.
  */
 #include <linux/workqueue.h>
+
+#include "gem/i915_gem_context.h"
+
+#include "gt/intel_context.h"
+#include "gt/intel_gt.h"
+
+#include "i915_drv.h"
+
 #include "intel_pxp.h"
 #include "intel_pxp_irq.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
-#include "gem/i915_gem_context.h"
-#include "gt/intel_context.h"
-#include "i915_drv.h"
+#include "intel_pxp_types.h"
 
 /**
  * DOC: PXP
@@ -39,9 +45,9 @@
  * performed via the mei_pxp component module.
  */
 
-struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
+struct intel_gt *pxp_to_gt(struct intel_pxp *pxp)
 {
-	return container_of(pxp, struct intel_gt, pxp);
+	return pxp->ctrl_gt;
 }
 
 bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
@@ -138,31 +144,63 @@ static void pxp_init_full(struct intel_pxp *pxp)
 	destroy_vcs_context(pxp);
 }
 
-void intel_pxp_init(struct intel_pxp *pxp)
+static struct intel_gt *pxp_get_ctrl_gt(struct drm_i915_private *i915)
 {
-	struct intel_gt *gt = pxp_to_gt(pxp);
+	struct intel_gt *gt = NULL;
+	int i = 0;
+
+	for_each_gt(gt, i915, i) {
+		/* There can be only one GT that supports PXP */
+		if (HAS_ENGINE(gt, GSC0))
+			return gt;
+	}
 
 	/* we rely on the mei PXP module */
-	if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP))
-		return;
+	if (IS_ENABLED(CONFIG_INTEL_MEI_PXP))
+		return &i915->gt0;
+
+	return NULL;
+}
+
+int intel_pxp_init(struct intel_pxp **pxp_store_ptr)
+{
+	struct intel_pxp *newpxp;
+
+	newpxp = kzalloc(sizeof(*newpxp), GFP_KERNEL);
+	if (!newpxp)
+		return -ENOMEM;
+
+	*pxp_store_ptr = newpxp;
+
+	newpxp->i915 = container_of(pxp_store_ptr, struct drm_i915_private, pxp);
+	newpxp->ctrl_gt = pxp_get_ctrl_gt(newpxp->i915);
+
+	if (!newpxp->ctrl_gt)
+		return -ENODEV;
 
 	/*
 	 * If HuC is loaded by GSC but PXP is disabled, we can skip the init of
 	 * the full PXP session/object management and just init the tee channel.
 	 */
-	if (HAS_PXP(gt->i915))
-		pxp_init_full(pxp);
-	else if (intel_huc_is_loaded_by_gsc(&gt->uc.huc) && intel_uc_uses_huc(&gt->uc))
-		intel_pxp_tee_component_init(pxp);
+	if (HAS_PXP(newpxp->i915))
+		pxp_init_full(newpxp);
+	else if (intel_huc_is_loaded_by_gsc(&newpxp->ctrl_gt->uc.huc) &&
+		 intel_uc_uses_huc(&newpxp->ctrl_gt->uc))
+		intel_pxp_tee_component_init(newpxp);
+
+	return 0;
 }
 
-void intel_pxp_fini(struct intel_pxp *pxp)
+void intel_pxp_fini(struct intel_pxp **pxp)
 {
-	pxp->arb_is_valid = false;
+	(*pxp)->arb_is_valid = false;
 
-	intel_pxp_tee_component_fini(pxp);
+	intel_pxp_tee_component_fini(*pxp);
 
-	destroy_vcs_context(pxp);
+	destroy_vcs_context(*pxp);
+
+	kfree(*pxp);
+	pxp = NULL;
 }
 
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 2da309088c6d..424e52bbd4f9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -12,12 +12,12 @@
 struct intel_pxp;
 struct drm_i915_gem_object;
 
-struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp);
+struct intel_gt *pxp_to_gt(struct intel_pxp *pxp);
 bool intel_pxp_is_enabled(const struct intel_pxp *pxp);
 bool intel_pxp_is_active(const struct intel_pxp *pxp);
 
-void intel_pxp_init(struct intel_pxp *pxp);
-void intel_pxp_fini(struct intel_pxp *pxp);
+int intel_pxp_init(struct intel_pxp **pxp);
+void intel_pxp_fini(struct intel_pxp **pxp);
 
 void intel_pxp_init_hw(struct intel_pxp *pxp);
 void intel_pxp_fini_hw(struct intel_pxp *pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
index f41e45763d0d..0eee51c4a772 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd.c
@@ -3,9 +3,6 @@
  * Copyright(c) 2020, Intel Corporation. All rights reserved.
  */
 
-#include "intel_pxp.h"
-#include "intel_pxp_cmd.h"
-#include "intel_pxp_session.h"
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
@@ -13,6 +10,11 @@
 
 #include "i915_trace.h"
 
+#include "intel_pxp.h"
+#include "intel_pxp_cmd.h"
+#include "intel_pxp_session.h"
+#include "intel_pxp_types.h"
+
 /* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
 #define MFX_WAIT_PXP (MFX_WAIT | \
 		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
index 4359e8be4101..652c00aefe3f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
@@ -9,10 +9,13 @@
 #include <drm/drm_print.h>
 
 #include "gt/intel_gt_debugfs.h"
+
 #include "i915_drv.h"
+
 #include "intel_pxp.h"
 #include "intel_pxp_debugfs.h"
 #include "intel_pxp_irq.h"
+#include "intel_pxp_types.h"
 
 static int pxp_info_show(struct seq_file *m, void *data)
 {
@@ -30,7 +33,19 @@ static int pxp_info_show(struct seq_file *m, void *data)
 
 	return 0;
 }
-DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(pxp_info);
+
+static int pxp_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pxp_info_show, inode->i_private);
+}
+
+static const struct file_operations pxp_info_fops = {
+	.owner = THIS_MODULE,
+	.open = pxp_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
 
 static int pxp_terminate_get(void *data, u64 *val)
 {
@@ -59,23 +74,23 @@ static int pxp_terminate_set(void *data, u64 val)
 }
 
 DEFINE_SIMPLE_ATTRIBUTE(pxp_terminate_fops, pxp_terminate_get, pxp_terminate_set, "%llx\n");
-void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *gt_root)
+
+void intel_pxp_debugfs_register(struct intel_pxp *pxp)
 {
-	static const struct intel_gt_debugfs_file files[] = {
-		{ "info", &pxp_info_fops, NULL },
-		{ "terminate_state", &pxp_terminate_fops, NULL },
-	};
-	struct dentry *root;
+	struct drm_minor *minor = pxp->i915->drm.primary;
+	struct dentry *pxproot;
 
-	if (!gt_root)
+	if (!HAS_PXP(pxp->i915))
 		return;
 
-	if (!HAS_PXP((pxp_to_gt(pxp)->i915)))
+	pxproot = debugfs_create_dir("pxp", minor->debugfs_root);
+	if (IS_ERR(pxproot))
 		return;
 
-	root = debugfs_create_dir("pxp", gt_root);
-	if (IS_ERR(root))
-		return;
+	debugfs_create_file("info", 0444, pxproot,
+			    pxp, &pxp_info_fops);
+
+	debugfs_create_file("terminate_state", 0644, pxproot,
+			    pxp, &pxp_terminate_fops);
 
-	intel_gt_debugfs_register_files(root, files, ARRAY_SIZE(files), pxp);
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
index 7e0c3d2f5d7e..299382b59e66 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.h
@@ -10,10 +10,10 @@ struct intel_pxp;
 struct dentry;
 
 #ifdef CONFIG_DRM_I915_PXP
-void intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root);
+void intel_pxp_debugfs_register(struct intel_pxp *pxp);
 #else
 static inline void
-intel_pxp_debugfs_register(struct intel_pxp *pxp, struct dentry *root)
+intel_pxp_debugfs_register(struct intel_pxp *pxp)
 {
 }
 #endif
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index c28be430718a..fd30befbf784 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -3,14 +3,18 @@
  * Copyright(c) 2020 Intel Corporation.
  */
 #include <linux/workqueue.h>
-#include "intel_pxp.h"
-#include "intel_pxp_irq.h"
-#include "intel_pxp_session.h"
+
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_gt_types.h"
+
 #include "i915_irq.h"
 #include "i915_reg.h"
+
+#include "intel_pxp.h"
+#include "intel_pxp_irq.h"
+#include "intel_pxp_session.h"
+#include "intel_pxp_types.h"
 #include "intel_runtime_pm.h"
 
 /**
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
index 6a7d4e2ee138..37371f44a550 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -3,11 +3,13 @@
  * Copyright(c) 2020 Intel Corporation.
  */
 
+#include "i915_drv.h"
+
 #include "intel_pxp.h"
 #include "intel_pxp_irq.h"
 #include "intel_pxp_pm.h"
 #include "intel_pxp_session.h"
-#include "i915_drv.h"
+#include "intel_pxp_types.h"
 
 void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
 {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index b0c9170b1395..16782d119bfd 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -11,17 +11,19 @@
 #include "gem/i915_gem_lmem.h"
 
 #include "i915_drv.h"
+
 #include "intel_pxp.h"
-#include "intel_pxp_session.h"
-#include "intel_pxp_tee.h"
 #include "intel_pxp_cmd_interface_42.h"
 #include "intel_pxp_huc.h"
+#include "intel_pxp_session.h"
+#include "intel_pxp_tee.h"
+#include "intel_pxp_types.h"
 
 static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
 {
 	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
 
-	return &to_gt(i915)->pxp;
+	return i915->pxp;
 }
 
 static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index f74b1e11a505..d550cdba3399 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -12,12 +12,23 @@
 #include <linux/workqueue.h>
 
 struct intel_context;
+struct intel_gt;
 struct i915_pxp_component;
+struct drm_i915_private;
 
 /**
  * struct intel_pxp - pxp state
  */
 struct intel_pxp {
+	/** @i915: back poiner to i915*/
+	struct drm_i915_private *i915;
+
+	/**
+	 * @ctrl_gt: poiner to the tile that owns the controls for PXP subsystem assets that
+	 * the VDBOX, the KCR engine (and GSC CS depending on the platform)
+	 */
+	struct intel_gt *ctrl_gt;
+
 	/**
 	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
 	 * module. Only set and cleared inside component bind/unbind functions,

base-commit: d21d6474a37e5d43075a24668807ea40a7ee9fc1
-- 
2.34.1

