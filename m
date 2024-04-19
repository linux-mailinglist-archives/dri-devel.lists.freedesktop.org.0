Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B18AAAFA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F27210EEFC;
	Fri, 19 Apr 2024 08:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8btmP7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1E10FE63;
 Fri, 19 Apr 2024 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713516956; x=1745052956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRxmihYD6YLqzpHDOZaQqPXSGeVHICpQAId+FuwwTHw=;
 b=H8btmP7d5c6rjNQ0mvIhnps6WJbee8HbNKhZd2eu426MsXTymkwU9B7l
 YGNOF9fa9cBN3bXsTcGelVtoIoH/qha6OfHQsybmeVuZAzZTv3XqMCFnx
 hEX0l+/idwsiUCdRopzXx5yfU6BQxDKQOOLC32iFJVdHZKLL9vEQR4/ra
 vL4E1EL/Sd21yeDfqYWw4lv/bKPtw10zR78zNy6SkhGkCcrO2gw+dND8R
 JCl9Pf8XCQbwTN+wFbACyVfxTLc4GoJjK409aY9B05lNKbizjO2bA09wz
 LAlEBQEvqSPCOqfffIEbRouzd8chuBtxiCXAlJWs9+loyPozuT7Szogb4 Q==;
X-CSE-ConnectionGUID: Ahdp9vH3QpSIfUPB+ui5Sw==
X-CSE-MsgGUID: K39kYG1NRnGbPKLucDzxFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12051619"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12051619"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:55:56 -0700
X-CSE-ConnectionGUID: Lc0tPIsJTJmNfQoCN4jQlw==
X-CSE-MsgGUID: D7pEd+zyREC952ImQhuMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27890744"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 01:55:53 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Extract xe_gt_idle() helper
Date: Fri, 19 Apr 2024 14:28:25 +0530
Message-Id: <20240419085826.263743-4-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
References: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
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

v2:
1. Add kernel doc for xe_gt_idle (Michal)
2. fix return as no actual error is reported by xe_uc_stop (Himal)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 28 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_gt.h |  1 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 491d0413de15..a24340219c30 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -629,6 +629,23 @@ static int do_gt_restart(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_idle: Idle the GT.
+ * @gt: The gt object
+ *
+ * Typically called before initiating any resets.
+ *
+ */
+void xe_gt_idle(struct xe_gt *gt)
+{
+	xe_gt_sanitize(gt);
+	xe_uc_gucrc_disable(&gt->uc);
+	xe_uc_stop_prepare(&gt->uc);
+	xe_gt_pagefault_reset(gt);
+	xe_uc_stop(&gt->uc);
+	xe_gt_tlb_invalidation_reset(gt);
+}
+
 static int gt_reset(struct xe_gt *gt)
 {
 	int err;
@@ -645,21 +662,12 @@ static int gt_reset(struct xe_gt *gt)
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
index ed6ea8057e35..dcc1023d20e8 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 void xe_gt_remove(struct xe_gt *gt);
+void xe_gt_idle(struct xe_gt *gt);
 
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
-- 
2.25.1

