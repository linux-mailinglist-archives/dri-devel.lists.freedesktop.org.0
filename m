Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A78B057AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 12:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86D410E58B;
	Tue, 15 Jul 2025 10:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d13syRJk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CFE10E587;
 Tue, 15 Jul 2025 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752574975; x=1784110975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vxu3gIrH+4XqKsLLVqMiurGuMca7uzbL8dT5L6j/e1o=;
 b=d13syRJkGcFE3C5jJtUsIAZeYHfMjASeDwC/izePcKnQSsktiouQFcJ7
 4JJu+i9rjobdFi/7u2MfXfPECHFjI9B63ajxymkvzxeinpOnm5dCcRHrO
 LAe1KX3miraIYl10i6odXpoDcTeBXDCqv1k/JHtXtGWVajVtRGkeEnaXW
 laBWeCNJx1BDUdU2u6zMZ5PvrrSoIY+0K/4Lc/vYqz+aO7gn6sh/MZ6Ds
 SarxHd0ufSL90EMg82iRmA8gFSpvHRE2NWCHkxwdkTFgwR9ubtA8REhWe
 33W2fRyGKn6yxZ+rAZ5v9WjflIHEFkhI4CLXds3M9EGr7VVN2U16vN/zB A==;
X-CSE-ConnectionGUID: w8Y4VUgTSACzDVaDaKutRw==
X-CSE-MsgGUID: xkdiLqqMQGi5HSqwz2pyEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54496879"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54496879"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:22:54 -0700
X-CSE-ConnectionGUID: LA3+Ns5+SYCkmci00Zo7ug==
X-CSE-MsgGUID: cohjeOhFTnaNAH/lYhIzVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157543049"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:22:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 airlied@gmail.com, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 2/9] drm/xe: Set GT as wedged before sending wedged uevent
Date: Tue, 15 Jul 2025 16:17:22 +0530
Message-ID: <20250715104730.2109506-3-riana.tauro@intel.com>
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
index 6dc84e4ed281..ab507e6cf2a4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1136,8 +1136,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
@@ -1171,13 +1173,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

