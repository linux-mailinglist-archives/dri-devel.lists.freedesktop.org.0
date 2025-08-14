Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC9B264A1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F9B10E850;
	Thu, 14 Aug 2025 11:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdV1N+9y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766210E86C;
 Thu, 14 Aug 2025 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755172179; x=1786708179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o9Prqsx0PqCBRYGTpvxhmwg3buPNtdymRDW53f8s2Pw=;
 b=UdV1N+9y9zs+ZMg7vnJAGJe2PEi5PBB1dAK8HXNWAwYJAe0Tlvn6vmQF
 UZua3TtZMcemeFZzR28wxGVh1JjKsMMlxBy8b/TIiH1xmh93vdv1D3ClD
 89J3FggnBF2uEO6fHpieE7JqmNUgzyOQL6wWGfrCc3g/mAiVgh2QsfmUn
 7xi0QZ8DAhBSr4quD76NIoEMwypE1lWFnZZs2mgYtIZPDi9Wp8/TcEG1N
 hi2Y/WgQajfDUX7mt7nva+bT3Tmey0tU5jRdDmiMg/r0FiHsn5o5EgreT
 mStMKsUg17Jy2T2NUSKAca054PP7+fyJNphey/Q/1Ds4b1p94j2m+W2/H g==;
X-CSE-ConnectionGUID: 3EljgWZSQMG1g7my5KZTQw==
X-CSE-MsgGUID: aPUGmuIzQ6WWgnQHPAW/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57388462"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57388462"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:39 -0700
X-CSE-ConnectionGUID: uboxyRwaRFe1IVdViXo45A==
X-CSE-MsgGUID: 8ow6FsP0QZCzsuClddEVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171967157"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 03/10] drm/xe: Set GT as wedged before sending wedged uevent
Date: Thu, 14 Aug 2025 17:44:33 +0530
Message-ID: <20250814121448.3380784-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250814121448.3380784-1-riana.tauro@intel.com>
References: <20250814121448.3380784-1-riana.tauro@intel.com>
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
index 0ab0366c3a9d..23647e98eafa 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1171,8 +1171,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
@@ -1206,13 +1208,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
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

