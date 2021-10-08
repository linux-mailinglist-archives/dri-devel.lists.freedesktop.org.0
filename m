Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07DF427349
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057D389624;
	Fri,  8 Oct 2021 21:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED546E87E;
 Fri,  8 Oct 2021 21:57:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="206715326"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="206715326"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="489625446"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 14:57:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 02/11] drm/i915: split general MMIO setup from per-GT uncore
 init
Date: Fri,  8 Oct 2021 14:56:26 -0700
Message-Id: <20211008215635.2026385-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008215635.2026385-1-matthew.d.roper@intel.com>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

In coming patches we'll be doing the actual tile initialization between
these two uncore init phases.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c     |  9 ++++++++-
 drivers/gpu/drm/i915/intel_uncore.c | 17 +++--------------
 drivers/gpu/drm/i915/intel_uncore.h |  2 ++
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index c65c3742887a..7f96d26c012a 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -415,10 +415,14 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 	if (ret < 0)
 		return ret;
 
-	ret = intel_uncore_init_mmio(&dev_priv->uncore);
+	ret = intel_uncore_setup_mmio(&dev_priv->uncore);
 	if (ret < 0)
 		goto err_bridge;
 
+	ret = intel_uncore_init_mmio(&dev_priv->uncore);
+	if (ret)
+		goto err_mmio;
+
 	/* Try to make sure MCHBAR is enabled before poking at it */
 	intel_setup_mchbar(dev_priv);
 	intel_device_info_runtime_init(dev_priv);
@@ -435,6 +439,8 @@ static int i915_driver_mmio_probe(struct drm_i915_private *dev_priv)
 err_uncore:
 	intel_teardown_mchbar(dev_priv);
 	intel_uncore_fini_mmio(&dev_priv->uncore);
+err_mmio:
+	intel_uncore_cleanup_mmio(&dev_priv->uncore);
 err_bridge:
 	pci_dev_put(dev_priv->bridge_dev);
 
@@ -449,6 +455,7 @@ static void i915_driver_mmio_release(struct drm_i915_private *dev_priv)
 {
 	intel_teardown_mchbar(dev_priv);
 	intel_uncore_fini_mmio(&dev_priv->uncore);
+	intel_uncore_cleanup_mmio(&dev_priv->uncore);
 	pci_dev_put(dev_priv->bridge_dev);
 }
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index e072054adac5..a308e86c9d9f 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -2020,7 +2020,7 @@ static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int uncore_mmio_setup(struct intel_uncore *uncore)
+int intel_uncore_setup_mmio(struct intel_uncore *uncore)
 {
 	struct drm_i915_private *i915 = uncore->i915;
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -2053,7 +2053,7 @@ static int uncore_mmio_setup(struct intel_uncore *uncore)
 	return 0;
 }
 
-static void uncore_mmio_cleanup(struct intel_uncore *uncore)
+void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
 {
 	struct pci_dev *pdev = to_pci_dev(uncore->i915->drm.dev);
 
@@ -2146,10 +2146,6 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
 	struct drm_i915_private *i915 = uncore->i915;
 	int ret;
 
-	ret = uncore_mmio_setup(uncore);
-	if (ret)
-		return ret;
-
 	/*
 	 * The boot firmware initializes local memory and assesses its health.
 	 * If memory training fails, the punit will have been instructed to
@@ -2170,7 +2166,7 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
 	} else {
 		ret = uncore_forcewake_init(uncore);
 		if (ret)
-			goto out_mmio_cleanup;
+			return ret;
 	}
 
 	/* make sure fw funcs are set if and only if we have fw*/
@@ -2192,11 +2188,6 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
 		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\n");
 
 	return 0;
-
-out_mmio_cleanup:
-	uncore_mmio_cleanup(uncore);
-
-	return ret;
 }
 
 /*
@@ -2261,8 +2252,6 @@ void intel_uncore_fini_mmio(struct intel_uncore *uncore)
 		intel_uncore_fw_domains_fini(uncore);
 		iosf_mbi_punit_release();
 	}
-
-	uncore_mmio_cleanup(uncore);
 }
 
 static const struct reg_whitelist {
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 3248e4e2c540..d1d17b04e29f 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -218,11 +218,13 @@ void
 intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug *mmio_debug);
 void intel_uncore_init_early(struct intel_uncore *uncore,
 			     struct drm_i915_private *i915);
+int intel_uncore_setup_mmio(struct intel_uncore *uncore);
 int intel_uncore_init_mmio(struct intel_uncore *uncore);
 void intel_uncore_prune_engine_fw_domains(struct intel_uncore *uncore,
 					  struct intel_gt *gt);
 bool intel_uncore_unclaimed_mmio(struct intel_uncore *uncore);
 bool intel_uncore_arm_unclaimed_mmio_detection(struct intel_uncore *uncore);
+void intel_uncore_cleanup_mmio(struct intel_uncore *uncore);
 void intel_uncore_fini_mmio(struct intel_uncore *uncore);
 void intel_uncore_suspend(struct intel_uncore *uncore);
 void intel_uncore_resume_early(struct intel_uncore *uncore);
-- 
2.33.0

