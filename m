Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF88A7E74
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17141132F3;
	Wed, 17 Apr 2024 08:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tur/92lM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EAF1132DF;
 Wed, 17 Apr 2024 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713343158; x=1744879158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jxwKrYdQbJjUb2NDmoKICIy8nBQdnqLRAYUq2VHXE5M=;
 b=Tur/92lMt8tNIS0OEWoVcsqQp3GsXqU0HJi6+Gbf1ndiMWJ4bCDUE7X+
 I0cucrQVlzUxQC5lct3ws56PDowHyMA06jrJsWmC7J1nmaZyCuxNk+5XY
 yNV2B6WD/iqEMYJy/+dJAEZTD/fFM7tPLPY5Q41RKzHNfefsLSjronlP/
 Ev5ix4kdAQGxSkghn5QfSSIFLp5FXsuajASkPCtUQzliGOXvqRbaT+Yv0
 uF9C1YfYxNVLn6Uw3164BWr1zWQ9BEyOH8PkaWUsMfT2Wmcp2MUc1YcMo
 iwQXIOgzV2STXGtd+md3fBouKngEvTvQKDWu2xZxmyWWDJql9LP2p40GR A==;
X-CSE-ConnectionGUID: DxCM6qFvT++upjbk4RTIDQ==
X-CSE-MsgGUID: J0NUmrEoS/W4tHFZsg3Zfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12660894"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="12660894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:18 -0700
X-CSE-ConnectionGUID: JRDA/b7mS9CueNkSVciaVA==
X-CSE-MsgGUID: WHYUyLKYTou1Lgnz6FSM1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27338931"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:15 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/4] drm/xe: Extract xe_gt_idle() helper
Date: Wed, 17 Apr 2024 14:11:44 +0530
Message-Id: <20240417084145.242480-4-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

