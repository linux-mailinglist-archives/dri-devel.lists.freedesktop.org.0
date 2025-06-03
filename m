Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01092ACC173
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724610E6BF;
	Tue,  3 Jun 2025 07:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVJOhIZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9742710E6BC;
 Tue,  3 Jun 2025 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748937016; x=1780473016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=saP4mHMcHmQf6mMLkHDuAPLOvYy8SKsuJCYVV/BlRIE=;
 b=cVJOhIZXmbOLgTgrkG71Nqm8CuOne50RIH3ZtyL13n4m2DFzE/z7P/dh
 lV+/19virf6UuExtS3FCXUnXAB99NpYsDm8Cd8yGmX2dygPl+FbFDiOy8
 sG99e5UnyRM3aATy+/309+4kKoOC0mf6aBPThKbA3el2AP/0vQBTW1yxz
 /Jj6oNRSLSnCP30gT0LVCIiafD2m0FYwGbhMalwLcsFEO1QHLbPffM+Kk
 2FI/CSZfQ7pnOaDyEuutfx1cpKnpHlHfFNZ0tOgQ6+6BrExtARFJ0PaAs
 rjBCRa5HQapyzd0Yyd7jNQhn1f+vDCPkpf5Xzn6Ku5KnddYWCM2d4SIzl Q==;
X-CSE-ConnectionGUID: 5zaJbXNnS1WnRbk+O7ShfQ==
X-CSE-MsgGUID: kQ/GEGKPR1KDYm1gU5O7gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76356195"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="76356195"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:16 -0700
X-CSE-ConnectionGUID: CtN0O2piR6awoBtmacCR7Q==
X-CSE-MsgGUID: lUe2wHPkRuClL3TH6eNIOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144671518"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:14 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, himal.prasad.ghimiray@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH 2/4] drm/xe: Add a helper function to set recovery method
Date: Tue,  3 Jun 2025 13:43:58 +0530
Message-ID: <20250603081409.1509709-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250603081409.1509709-1-riana.tauro@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
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
 drivers/gpu/drm/xe/xe_device.c       | 30 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 3 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..3fd604ebdc6e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1120,16 +1120,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 	xe_pm_runtime_put(xe);
 }
 
+/**
+ * xe_device_set_wedged_method - Set wedged recovery method
+ * @xe: xe device instance
+ *
+ * Set wedged recovery method to be sent using drm wedged uevent.
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
- * This is a final state that can only be cleared with a module
- * re-probe (unbind + bind).
- * In this state every IOCTL will be blocked so the GT cannot be used.
+ * This is a final state that can only be cleared with the method specified
+ * in the drm wedged uevent. The method needs to be set using xe_device_set_wedged_method
+ * before declaring the device as wedged or the default method of reprobe (unbind/re-bind)
+ * will be sent. In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure. Userspace will be notified of this state
- * through device wedged uevent.
+ * failure or guc loading failure or firmware failure.
+ * Userspace will be notified of this state through device wedged uevent.
  * If xe.wedged module parameter is set to 2, this function will be called
  * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
  * snapshot capture. In this mode, GT reset won't be attempted so the state of
@@ -1152,6 +1164,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
+	/* If no wedge recovery method is set, use default */
+	if (!xe->wedged.method)
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND
+					    | DRM_WEDGE_RECOVERY_BUS_RESET);
+
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		drm_err(&xe->drm,
@@ -1161,8 +1178,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			dev_name(xe->drm.dev));
 
 		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm,
-				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
+		drm_dev_wedged_event(&xe->drm, xe->wedged.method);
 	}
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..06350740aac5 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b93c04466637..fb3617956d63 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -559,6 +559,8 @@ struct xe_device {
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		int mode;
+		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
+		unsigned long method;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
-- 
2.47.1

