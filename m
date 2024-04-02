Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CAB894E0C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEB310FB8B;
	Tue,  2 Apr 2024 08:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOb1ESCx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880DD10FB8B;
 Tue,  2 Apr 2024 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712048181; x=1743584181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H8rPcytHIRQCdyY60iIcJf4DnLnACvWdnFvZwhhxbQw=;
 b=XOb1ESCxmteZrS8/DTVQi13/9OfrtRdcyk4xaASAYzz2KKVr6D8Rop+S
 yHnf8idezSiX5ZdCLAI6HkykTeuEnPBcKeVrgx3acJWbnQpxz0PonUZvp
 1zHb6K8mbNUBKuaeKFofFJT/5S+8o0EYMBbXL6MMrp3BdaNQHIAg4gM7u
 cxb4xlqJqkbHVtRrzoYNGF1JT0BFx03z3YbkGIMfBRAY73Vv9N7XPqWBT
 abCJaDwF0g2fA3H35JsrGvqm3mmEwav1bcOInd9t3/UvAG5mY8CM2cjfD
 iWfv3LKgnfVFP/2KgFhaWbs7XApgG9JPLjMXNQ4zTH2FWw2nS1o1zy+65 Q==;
X-CSE-ConnectionGUID: 8AWXN1ysQ3a/VX0W9nDHpw==
X-CSE-MsgGUID: lkgc8Ck2RXCr75po6Iscng==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18654782"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18654782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="49225986"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:19 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Extract xe_gt_idle() helper
Date: Tue,  2 Apr 2024 14:28:58 +0530
Message-Id: <20240402085859.1591264-4-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
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

This would be used in other places outside of gt_reset path.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 31 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.h |  1 +
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index cfa5da900461..59f497d575ad 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+/* Idle the GT */
+int xe_gt_idle(struct xe_gt *gt)
+{
+	int err;
+
+	xe_gt_sanitize(gt);
+
+	xe_uc_gucrc_disable(&gt->uc);
+	xe_uc_stop_prepare(&gt->uc);
+	xe_gt_pagefault_reset(gt);
+
+	err = xe_uc_stop(&gt->uc);
+	if (err)
+		return err;
+
+	xe_gt_tlb_invalidation_reset(gt);
+
+	return err;
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
 	}
 
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_sanitize(gt);
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_msg;
 
-	xe_uc_gucrc_disable(&gt->uc);
-	xe_uc_stop_prepare(&gt->uc);
-	xe_gt_pagefault_reset(gt);
-
-	err = xe_uc_stop(&gt->uc);
-	if (err)
-		goto err_out;
-
-	xe_gt_tlb_invalidation_reset(gt);
+	xe_gt_idle(gt);
 
 	err = do_gt_reset(gt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index ed6ea8057e35..d62af1725ff6 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 void xe_gt_remove(struct xe_gt *gt);
+int xe_gt_idle(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
-- 
2.25.1

