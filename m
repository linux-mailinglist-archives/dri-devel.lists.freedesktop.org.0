Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A9B1387C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3A710E4BC;
	Mon, 28 Jul 2025 10:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENlSCqAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465F510E4B4;
 Mon, 28 Jul 2025 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753696997; x=1785232997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jizbHEuLqMUczGWYAq8vjSG3GXso5BjphYvosL5BJIU=;
 b=ENlSCqAJZZy8nyozh/SEgRqemQyu37AoNgr6E7MEQpuxRCRbMcdPzavK
 56tjmbmgiShK5h3FUI/rp6UZ9JhYRvChM37DVaa8eXZtgEIjRRjXPzN3U
 E7uaS9JGQnA4l1OxDUqiwvpVyAG60CxoXWDzvaXZi/bhNRsb2kQQ/w5pH
 RgOIYh17rEeoV/AW3v0T3NrDjYdFM2mPHUC+OZFdZ6rmxwyz8KeR/qgfz
 gZVxHrgiHOfz6z+3OC3n8Tg0O9Nk++Cg7LagtZhbGuHVB4sswrpRFYJqy
 xTcN+b5GqCAtSMP9rvVubHCXO7SkSrfOHd3RJdPm7jscKRIuTKg+Kpuko w==;
X-CSE-ConnectionGUID: zkvhXcVfQcGo8S1dVj4t2Q==
X-CSE-MsgGUID: rf0zSPL6SC2dN3H4MktwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55641650"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55641650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:17 -0700
X-CSE-ConnectionGUID: h/vKyWljR/GCerA1NPdNWg==
X-CSE-MsgGUID: TjfJO1frQN+XX8E0KrFODg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162739481"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:03:13 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 2/9] drm/xe: Set GT as wedged before sending wedged uevent
Date: Mon, 28 Jul 2025 15:57:52 +0530
Message-ID: <20250728102809.502324-3-riana.tauro@intel.com>
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

Userspace should be notified after setting the device as wedged.
Re-order function calls to set gt wedged before sending uevent.

Cc: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d04a0ae018e6..259fa14cdebe 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1160,8 +1160,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a module
+ * This is a final state that can only be cleared with the recovery method
+ * specified in the drm wedged uevent. The default recovery method is
  * re-probe (unbind + bind).
+ *
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
  * failure or guc loading failure. Userspace will be notified of this state
@@ -1195,13 +1197,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
+	}
+
+	for_each_gt(gt, xe, id)
+		xe_gt_declare_wedged(gt);
 
+	if (xe_device_wedged(xe)) {
 		/* Notify userspace of wedged device */
 		drm_dev_wedged_event(&xe->drm,
 				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
 				     NULL);
 	}
-
-	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
 }
-- 
2.47.1

