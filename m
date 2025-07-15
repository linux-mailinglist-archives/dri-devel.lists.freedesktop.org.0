Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C02CB057AF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 12:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11610E581;
	Tue, 15 Jul 2025 10:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M90dYPSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F2410E588;
 Tue, 15 Jul 2025 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752574981; x=1784110981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztw0valEznGrkacdGPmUGCsufJWaFaXeCzsG1sbAt/M=;
 b=M90dYPSlzgc4ORimKwlGwvAYdj8hPvnzD6SaNYA5E8QdEn1JpDCK8mFt
 9coztF2EyJtzJlvEZRl5HJUjbKsBsp3icAJ01UA7FjRbW5cEqyBk5PoE/
 Sf7jzKQ+pRuzJR+mc8un3izCLJ2h3M6QTIl7H/4978hAuSj/Ry5SU57vs
 Szey5muPOZJttGrsQ8Fa/f4ADkPCFLzQRd8ivVDBzOPxasWxsL7b/4t+y
 cqDl3rDBTaONEyRkZKm8l3B+bLK5ewwgEvXol162EAUcbJQPhvDRbdjNy
 bQNRfH9YCgu1t+ehUSXEjrZqH3JA/HeseDPjSWk/pGqrZOrDgMN1nZGR5 A==;
X-CSE-ConnectionGUID: /L4AVYN6RkGM83yJhoVrdg==
X-CSE-MsgGUID: SyXuqqOsTkiCAQ3CbMvvQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54496904"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54496904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:23:00 -0700
X-CSE-ConnectionGUID: Zc8pmfOWQB2RpZV5y5Ndaw==
X-CSE-MsgGUID: FOlVDmzfQzCHyoDGKUnx7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157543062"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:22:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com
Subject: [PATCH v5 3/9] drm/xe: Add a helper function to set recovery method
Date: Tue, 15 Jul 2025 16:17:23 +0530
Message-ID: <20250715104730.2109506-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250715104730.2109506-1-riana.tauro@intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
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
method has to be set before declaring the device wedged and sending the
drm wedged uevent. If no method is set, default unbind/re-bind method
will be set

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 26 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ab507e6cf2a4..5692bdfb8424 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1132,13 +1132,26 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
+ * specified in the drm wedged uevent. The method needs to be set using
+ * xe_device_set_wedged_method before declaring the device as wedged or the
+ * default method of reprobe (unbind/re-bind) will be sent
  *
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
@@ -1179,9 +1192,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
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
index f0eb8150f185..c2a67db3ab72 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -183,6 +183,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged.flag);
 }
 
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d4d2c6854790..94e25ff1db00 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -590,6 +590,8 @@ struct xe_device {
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		int mode;
+		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
+		unsigned long method;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
-- 
2.47.1

