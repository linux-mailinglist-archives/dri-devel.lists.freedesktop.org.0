Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA885AF89D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756F910E0AD;
	Tue,  6 Sep 2022 23:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B29E10E0A8;
 Tue,  6 Sep 2022 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508187; x=1694044187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4OQRzc6xPo93TjDpMhjkckerWuBRYQrx3ZB+xUWQw5I=;
 b=ba9xyPlThsGOA2FwaKO2CeWqzTwGULWaV8E8Qxz+yok2kNwXOrsWySrn
 d41WFni64LrdkdT7k39zNIqI3fbQngGv45NXrCLYHAkWn5MHrkKBR8xc8
 pLKCkEetNJqaa7jvUGdN78HTcPQAiVQdHbEe4a0mY4gzk3ZQ/Q527DkvD
 NotKhRNtEX1QZVSVeGNXf+sNCpTOXK3vh1uOSzDVvjb6ZbRofu1ehqIj2
 NqLNitR8FZRmDMmmNJS0yqqfzJY8pJeOcqyOlOgA3jqSZU2naEA3zCmkT
 iHJIqwQtd1ZQuE8KPO/w+7T9leLRp1v9IYYSfrMlfIT7OkFf0WaTeSlF0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276477212"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="276477212"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920328"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 08/14] drm/i915: Initialize MMIO access for each GT
Date: Tue,  6 Sep 2022 16:49:28 -0700
Message-Id: <20220906234934.3655440-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906234934.3655440-1-matthew.d.roper@intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
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

In a multi-GT system we need to initialize MMIO access for each GT, not
just the primary GT.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c  | 27 ++++++++++++++++++---------
 drivers/gpu/drm/i915/intel_uncore.c |  5 ++++-
 drivers/gpu/drm/i915/intel_uncore.h |  3 ++-
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 1f46dd1ffaf7..bb9ba1aed1bb 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -431,7 +431,8 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
  */
 static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 {
-	int ret;
+	struct intel_gt *gt;
+	int ret, i;
 
 	if (i915_inject_probe_failure(dev_priv))
 		return -ENODEV;
@@ -440,17 +441,27 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 	if (ret < 0)
 		return ret;
 
-	ret = intel_uncore_init_mmio(&dev_priv->uncore);
-	if (ret)
-		return ret;
+	for_each_gt(gt, dev_priv, i) {
+		ret = intel_uncore_init_mmio(gt->uncore);
+		if (ret)
+			return ret;
+
+		ret = drmm_add_action_or_reset(&dev_priv->drm,
+					       intel_uncore_fini_mmio,
+					       gt->uncore);
+		if (ret)
+			return ret;
+	}
 
 	/* Try to make sure MCHBAR is enabled before poking at it */
 	intel_setup_mchbar(dev_priv);
 	intel_device_info_runtime_init(dev_priv);
 
-	ret = intel_gt_init_mmio(to_gt(dev_priv));
-	if (ret)
-		goto err_uncore;
+	for_each_gt(gt, dev_priv, i) {
+		ret = intel_gt_init_mmio(gt);
+		if (ret)
+			goto err_uncore;
+	}
 
 	/* As early as possible, scrub existing GPU state before clobbering */
 	sanitize_gpu(dev_priv);
@@ -459,7 +470,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 
 err_uncore:
 	intel_teardown_mchbar(dev_priv);
-	intel_uncore_fini_mmio(&dev_priv->uncore);
 
 	return ret;
 }
@@ -471,7 +481,6 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
 {
 	intel_teardown_mchbar(dev_priv);
-	intel_uncore_fini_mmio(&dev_priv->uncore);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 2a32f8a65f34..452b3a31e965 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2455,8 +2455,11 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 	}
 }
 
-void intel_uncore_fini_mmio(struct intel_uncore *uncore)
+/* Called via drm-managed action */
+void intel_uncore_fini_mmio(struct drm_device *dev, void *data)
 {
+	struct intel_uncore *uncore = data;
+
 	if (intel_uncore_has_forcewake(uncore)) {
 		iosf_mbi_punit_acquire();
 		iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 6100d0f4498a..4acb78a03233 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -33,6 +33,7 @@
 
 #include "i915_reg_defs.h"
 
+struct drm_device;
 struct drm_i915_private;
 struct intel_runtime_pm;
 struct intel_uncore;
@@ -220,7 +221,7 @@ void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 bool intel_uncore_unclaimed_mmio(struct intel_uncore *uncore);
 bool intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore);
 void intel_uncore_cleanup_mmio(struct intel_uncore *uncore);
-void intel_uncore_fini_mmio(struct intel_uncore *uncore);
+void intel_uncore_fini_mmio(struct drm_device *dev, void *data);
 void intel_uncore_suspend(struct intel_uncore *uncore);
 void intel_uncore_resume_early(struct intel_uncore *uncore);
 void intel_uncore_runtime_resume(struct intel_uncore *uncore);
-- 
2.37.2

