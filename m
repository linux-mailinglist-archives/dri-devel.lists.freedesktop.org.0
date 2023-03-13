Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F6B6B848D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 23:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8B510E666;
	Mon, 13 Mar 2023 22:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8BD10E663;
 Mon, 13 Mar 2023 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678745568; x=1710281568;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yftl17BZxZsClnG+TrLnyFDplrR8SOH//R7wiZ60t2Y=;
 b=JZwxz7QUvUaDDCw7KhupXglYiHprqRLKQYTMYVRxuSVe6rRcHRQblOm4
 NFa1k+S0s3KYy6AgNX1rMmdxxs7TBIi/jRcbB6zpQfMWcvpjO00Kou6Mm
 6oNdfBGMfwA8TlnC+9qvrdgl3ovaM/zBNq2ekgvl11KcKdXk78Bq7pzM1
 SCrOLMXQS9/m/yyCVnI0uADaGZ5eTpE1TU4iSQKgilD4hf+vj5uFIXqVW
 /lrrbxoCH7GruwPKjKc3GDF6xrtWtMcl26awVSBLQwK36h+NTKq65c6Sd
 TGRbEOSDC5toMxNqyVIdDFw4YO6cxUjaI8YWZ0mWnBlyRfqYod1LASTiM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="335967696"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="335967696"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 15:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="767871006"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="767871006"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 15:12:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe: Use GT oriented log messages in xe_gt.c
Date: Mon, 13 Mar 2023 23:12:34 +0100
Message-Id: <20230313221234.2628-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313221234.2628-1-michal.wajdeczko@intel.com>
References: <20230313221234.2628-1-michal.wajdeczko@intel.com>
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

Replace generic log messages with ones dedicated for the GT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..a46399c24eb8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -20,6 +20,7 @@
 #include "xe_gt_clock.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_gt_topology.h"
@@ -612,15 +613,14 @@ int xe_gt_init(struct xe_gt *gt)
 
 static int do_gt_reset(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_mmio_write32(gt, GEN6_GDRST.reg, GEN11_GRDOM_FULL);
 	err = xe_mmio_wait32(gt, GEN6_GDRST.reg, 0, GEN11_GRDOM_FULL, 5000,
 			     NULL, false);
 	if (err)
-		drm_err(&xe->drm,
-			"GT reset failed to clear GEN11_GRDOM_FULL\n");
+		xe_gt_err(gt, "failed to clear GEN11_GRDOM_FULL (%pe)\n",
+			  ERR_PTR(err));
 
 	return err;
 }
@@ -663,14 +663,13 @@ static int do_gt_restart(struct xe_gt *gt)
 
 static int gt_reset(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	/* We only support GT resets with GuC submission */
 	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
 		return -ENODEV;
 
-	drm_info(&xe->drm, "GT reset started\n");
+	xe_gt_info(gt, "reset started\n");
 
 	xe_gt_sanitize(gt);
 
@@ -699,7 +698,7 @@ static int gt_reset(struct xe_gt *gt)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 
-	drm_info(&xe->drm, "GT reset done\n");
+	xe_gt_info(gt, "reset done\n");
 
 	return 0;
 
@@ -708,7 +707,7 @@ static int gt_reset(struct xe_gt *gt)
 err_msg:
 	XE_WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
-	drm_err(&xe->drm, "GT reset failed, err=%d\n", err);
+	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
@@ -722,15 +721,13 @@ static void gt_reset_worker(struct work_struct *w)
 
 void xe_gt_reset_async(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-
-	drm_info(&xe->drm, "Try GT reset\n");
+	xe_gt_info(gt, "trying reset\n");
 
 	/* Don't do a reset while one is already in flight */
 	if (xe_uc_reset_prepare(&gt->uc))
 		return;
 
-	drm_info(&xe->drm, "Doing GT reset\n");
+	xe_gt_info(gt, "reset queued\n");
 	queue_work(gt->ordered_wq, &gt->reset.worker);
 }
 
@@ -747,7 +744,6 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 
 int xe_gt_suspend(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	/* For now suspend/resume is only allowed with GuC */
@@ -767,7 +763,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	drm_info(&xe->drm, "GT suspended\n");
+	xe_gt_info(gt, "suspended\n");
 
 	return 0;
 
@@ -775,14 +771,13 @@ int xe_gt_suspend(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
-	drm_err(&xe->drm, "GT suspend failed: %d\n", err);
+	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
 
 int xe_gt_resume(struct xe_gt *gt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_device_mem_access_get(gt_to_xe(gt));
@@ -796,7 +791,7 @@ int xe_gt_resume(struct xe_gt *gt)
 
 	xe_device_mem_access_put(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-	drm_info(&xe->drm, "GT resumed\n");
+	xe_gt_info(gt, "resumed\n");
 
 	return 0;
 
@@ -804,7 +799,7 @@ int xe_gt_resume(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
-	drm_err(&xe->drm, "GT resume failed: %d\n", err);
+	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
 
 	return err;
 }
-- 
2.25.1

