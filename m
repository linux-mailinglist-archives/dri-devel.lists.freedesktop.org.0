Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362798A61E3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 05:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210E31129C2;
	Tue, 16 Apr 2024 03:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaYbIhxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E7A1129C2;
 Tue, 16 Apr 2024 03:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713239709; x=1744775709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mn0gisJNrsD7GRbKuZiSaG2WypB8+MdvqgCCZc6EMbs=;
 b=SaYbIhxSSogN6EVbu98tcTcnG2qi+RgQAfYcyYG8LIKPAMK9Wjwi8d/e
 jQPwuCwlVDiDaEOXhOG4/iJ0y8u024EnNtoJthAI++rW/zqopF20ecifx
 7zKb7ri9FOjKwrad0Lz92G0gMKJayvSvTuQAMA4ezqeByRhhUsmf1ig6l
 GVz90MMl0lMZ2lZqlRPzfhKX82nl5rPnBzFB0c4rhcxe6km1gO0AkVxY+
 E89kcaGzXTCyfs2RP9VoLiDTztEC5qNrmBmMf6Xydp/d1W3r6fHElh///
 dqzcGcEU2OGbGsrF/rnwq7nyZhOliFQSvwIYy27RNaFfdzPSK3LC9k2bl g==;
X-CSE-ConnectionGUID: tFOlcROnRGmVGvnX53/3Lg==
X-CSE-MsgGUID: rjvdu+AjS6e+mH9OY6r1kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19260319"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="19260319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:55:08 -0700
X-CSE-ConnectionGUID: tMW3Qk2KRWmjrlIyQCAXjw==
X-CSE-MsgGUID: 4CMleALOTWyOBrpC+HkLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="26917438"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 20:55:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Get rid of devm
Date: Mon, 15 Apr 2024 20:55:01 -0700
Message-ID: <20240416035501.755728-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

When both hwmon and hwmon drvdata (on which hwmon depends) are device
managed resources, the expectation, on device unbind, is that hwmon will be
released before drvdata. However, in i915 there are two separate code
paths, which both release either drvdata or hwmon and either can be
released before the other. These code paths (for device unbind) are as
follows (see also the bug referenced below):

Call Trace:
release_nodes+0x11/0x70
devres_release_group+0xb2/0x110
component_unbind_all+0x8d/0xa0
component_del+0xa5/0x140
intel_pxp_tee_component_fini+0x29/0x40 [i915]
intel_pxp_fini+0x33/0x80 [i915]
i915_driver_remove+0x4c/0x120 [i915]
i915_pci_remove+0x19/0x30 [i915]
pci_device_remove+0x32/0xa0
device_release_driver_internal+0x19c/0x200
unbind_store+0x9c/0xb0

and

Call Trace:
release_nodes+0x11/0x70
devres_release_all+0x8a/0xc0
device_unbind_cleanup+0x9/0x70
device_release_driver_internal+0x1c1/0x200
unbind_store+0x9c/0xb0

This means that in i915, if use devm, we cannot gurantee that hwmon will
always be released before drvdata. Which means that we have a uaf if hwmon
sysfs is accessed when drvdata has been released but hwmon hasn't.

The only way out of this seems to be do get rid of devm_ and release/free
everything explicitly during device unbind.

v2: Change commit message and other minor code changes
v3: Cleanup from i915_hwmon_register on error (Armin Wolf)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 54 ++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index b758fd110c20..8cebf6f5b101 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -793,7 +793,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	if (!IS_DGFX(i915))
 		return;
 
-	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
 	if (!hwmon)
 		return;
 
@@ -819,14 +819,12 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	hwm_get_preregistration_info(i915);
 
 	/*  hwmon_dev points to device hwmon<i> */
-	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
-							 ddat,
-							 &hwm_chip_info,
-							 hwm_groups);
-	if (IS_ERR(hwmon_dev)) {
-		i915->hwmon = NULL;
-		return;
-	}
+	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
+						    ddat,
+						    &hwm_chip_info,
+						    hwm_groups);
+	if (IS_ERR(hwmon_dev))
+		goto err;
 
 	ddat->hwmon_dev = hwmon_dev;
 
@@ -839,16 +837,40 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
 			continue;
 
-		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
-								 ddat_gt,
-								 &hwm_gt_chip_info,
-								 NULL);
-		if (!IS_ERR(hwmon_dev))
-			ddat_gt->hwmon_dev = hwmon_dev;
+		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
+							    ddat_gt,
+							    &hwm_gt_chip_info,
+							    NULL);
+		if (IS_ERR(hwmon_dev))
+			goto err;
+
+		ddat_gt->hwmon_dev = hwmon_dev;
 	}
+	return;
+err:
+	i915_hwmon_unregister(i915);
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
-	fetch_and_zero(&i915->hwmon);
+	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
+	struct hwm_drvdata *ddat = &hwmon->ddat;
+	struct intel_gt *gt;
+	int i;
+
+	if (!hwmon)
+		return;
+
+	for_each_gt(gt, i915, i) {
+		struct hwm_drvdata *ddat_gt = hwmon->ddat_gt + i;
+
+		if (ddat_gt->hwmon_dev)
+			hwmon_device_unregister(ddat_gt->hwmon_dev);
+	}
+
+	if (ddat->hwmon_dev)
+		hwmon_device_unregister(ddat->hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+	kfree(hwmon);
 }
-- 
2.41.0

