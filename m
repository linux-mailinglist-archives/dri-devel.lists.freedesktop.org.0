Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC892B1387D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4774110E4BD;
	Mon, 28 Jul 2025 10:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhKU0iKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4776410E4BE;
 Mon, 28 Jul 2025 10:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753697005; x=1785233005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rfe14GoGpl3dSPQkHzxPsPjv+OXSfeVdoKcGIhOh7D0=;
 b=JhKU0iKkCm7mJdwMq4E+deee/AzDhxtba44GkjqFU97fi//oWwY9zmmE
 ZPtEeckcrjKr+3Ho9PsOcWmFP7vWDR7YwifvDXV6Bp7v2qaxcvPJV53Sh
 5/gZeufGogrxHh6bVer8xPIx4IcROJsOBpGpfzcDkKL73HqtSi2jE63YT
 BB06LMBwHdEn83yT0BuQU/rXI7WRmRmeIwSEqOlJggs4MMNSEhqLXWBnJ
 UzOOMvlV8pG00sju+KlSoyhovJT+3N5TTL4mzwUbYEWTpCVNWWEXgG16c
 hQoUD++FOfoO/eraTu4vFD5IJUANCSY2UxXCQpSM2OIjBa5jLIlTYA8LT A==;
X-CSE-ConnectionGUID: M/AHIxq/QuasiFJw+rpSew==
X-CSE-MsgGUID: E2DDUuhDQ32iE0dc/q/xnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55641659"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55641659"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:25 -0700
X-CSE-ConnectionGUID: xHfVUCxsSfmUzCJebyGVbQ==
X-CSE-MsgGUID: KyKuQ3ilRkKmjumDZm++YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162739491"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch
Subject: [PATCH v7 3/9] drm/xe: Add a helper function to set recovery method
Date: Mon, 28 Jul 2025 15:57:53 +0530
Message-ID: <20250728102809.502324-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250728102809.502324-1-riana.tauro@intel.com>
References: <20250728102809.502324-1-riana.tauro@intel.com>
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

Add a helper function to set recovery method. The recovery
method can be set before declaring the device wedged and sending the
drm wedged uevent. If no method is set, default unbind/re-bind method
will be set.

v2: fix documentation (Raag)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 26 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 259fa14cdebe..a8827b46a83a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1156,13 +1156,26 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 	xe_pm_runtime_put(xe);
 }
 
+/**
+ * xe_device_set_wedged_method - Set wedged recovery method
+ * @xe: xe device instance
+ * @method: recovery method to set
+ *
+ * Set wedged recovery method to be sent in drm wedged uevent.
+ */
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
+{
+	xe->wedged.method = method;
+}
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
  * This is a final state that can only be cleared with the recovery method
- * specified in the drm wedged uevent. The default recovery method is
- * re-probe (unbind + bind).
+ * specified in the drm wedged uevent. The method can be set using
+ * xe_device_set_wedged_method before declaring the device as wedged. If no method
+ * is set, reprobe (unbind/re-bind) will be sent by default.
  *
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
@@ -1203,9 +1216,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		xe_gt_declare_wedged(gt);
 
 	if (xe_device_wedged(xe)) {
+		/* If no wedge recovery method is set, use default */
+		if (!xe->wedged.method)
+			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
+						    DRM_WEDGE_RECOVERY_BUS_RESET);
+
 		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm,
-				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
-				     NULL);
+		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index bc802e066a7d..32cc6323b7f6 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -187,6 +187,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 38c8329b4d2c..af6b38458b78 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -541,6 +541,8 @@ struct xe_device {
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		int mode;
+		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
+		unsigned long method;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
-- 
2.47.1

