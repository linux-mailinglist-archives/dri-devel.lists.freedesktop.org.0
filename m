Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8788A86CD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 16:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EDD1135E9;
	Wed, 17 Apr 2024 14:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXKaY1X4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCDB1135E0;
 Wed, 17 Apr 2024 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713365818; x=1744901818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8BRT7hTgisDDTL7pOfQtyyDPYIkpSERJOh3aEbL+wdo=;
 b=UXKaY1X43JYptgs6iajtVTBqmCRpDv+uW2jn9WwqHJlQm9EbX8h75mPk
 gmTXC44/bOMLHMPGcqlOAYBXEFFlH+XP8o/AotcneVy+4ogxyAIvnsmbx
 xzCVuYwRYq5b1ZQxizvvVz2dS6Q1CShdS7sWWX//unzkFO/wA4rbT//Dq
 nrFNOXIGvSEScTBhM91u439hSXt1Kh2ypdIP1K9aYKi0joT68XvKLX66A
 AggCJyzvli4uYlzhpl8kW0JIH3/HUUpCSfZgXYZuNRJjIK2+tHRfDrVGF
 t76/cfdGis+0WQCrVxXN3si7224BJ1ol2fdaJCzL8DGm60EhRwVckQ3Jd g==;
X-CSE-ConnectionGUID: CP73YxHMSpebh8E01r5ROw==
X-CSE-MsgGUID: 8NIyjIcSS+mMDoPYY+b0Gg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20010177"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="20010177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:56:55 -0700
X-CSE-ConnectionGUID: JZSHScUcRe6tgbaRGDc7ZA==
X-CSE-MsgGUID: RlQMDcGcRGGGr5E5wPSQOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53863120"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:56:51 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Get rid of devm
Date: Wed, 17 Apr 2024 07:56:46 -0700
Message-ID: <20240417145646.793223-1-ashutosh.dixit@intel.com>
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
v4: Eliminate potential static analyzer warning (Rodrigo)
    Eliminate fetch_and_zero (Jani)
v5: Restore previous logic for ddat_gt->hwmon_dev error return (Andi)

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 46 +++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index b758fd110c20..c0662a022f59 100644
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
 
@@ -839,16 +837,36 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
 			continue;
 
-		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
-								 ddat_gt,
-								 &hwm_gt_chip_info,
-								 NULL);
+		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
+							    ddat_gt,
+							    &hwm_gt_chip_info,
+							    NULL);
 		if (!IS_ERR(hwmon_dev))
 			ddat_gt->hwmon_dev = hwmon_dev;
 	}
+	return;
+err:
+	i915_hwmon_unregister(i915);
 }
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
-	fetch_and_zero(&i915->hwmon);
+	struct i915_hwmon *hwmon = i915->hwmon;
+	struct intel_gt *gt;
+	int i;
+
+	if (!hwmon)
+		return;
+
+	for_each_gt(gt, i915, i)
+		if (hwmon->ddat_gt[i].hwmon_dev)
+			hwmon_device_unregister(hwmon->ddat_gt[i].hwmon_dev);
+
+	if (hwmon->ddat.hwmon_dev)
+		hwmon_device_unregister(hwmon->ddat.hwmon_dev);
+
+	mutex_destroy(&hwmon->hwmon_lock);
+
+	kfree(i915->hwmon);
+	i915->hwmon = NULL;
 }
-- 
2.41.0

