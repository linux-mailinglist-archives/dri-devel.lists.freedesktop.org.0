Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08B688B8A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7EB10E6BD;
	Fri,  3 Feb 2023 00:11:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89110E6AF;
 Fri,  3 Feb 2023 00:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675383101; x=1706919101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HTD8Ig0JDrvodNgwIPVAerGVLelk4nQ/jkUpoQ+xyJ4=;
 b=NX4zuF6i19S1IcOZURTSBL493vJykuphSybcHT73WarHq3nzsy5p4dSN
 X3kgKoMW/OA+URqutZ9X0MciJPFpq+Wh391EZrfuFAf5C4aUzOIqpbODJ
 wg61a4SHk36p+fbLU5Y2wcY7z1Ahiza8DiTY8McQrf4H/P2dq7r3CbymE
 18oPdCAfD9umQdbFAlYBTgULMp0qYN5iD400Zo0HvAvx9erTAtjR/fzDG
 Ox+ILbNyEXuhj08LUB/LQqlwHWpYjACvJuV/cX1GFPSze7yLKcI0hQiDg
 x5IN/WWiKRnmL01UlaEVuGugUDUIRdu4YgR/0Eb3dcojkLvlwkToYjLHD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393204045"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="393204045"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:11:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="789487434"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; d="scan'208";a="789487434"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 16:11:39 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/6] drm/i915/guc: More debug print updates - GSC firmware
Date: Thu,  2 Feb 2023 16:11:39 -0800
Message-Id: <20230203001143.3323433-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Update a bunch more debug prints to use the new GT based scheme.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 8 +++-----
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 7 +++----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index e73d4440c5e82..8e0c736fa4e94 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -6,6 +6,7 @@
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "gt/intel_ring.h"
 #include "intel_gsc_fw.h"
 
@@ -88,9 +89,7 @@ static int gsc_fw_load(struct intel_gsc_uc *gsc)
 	i915_request_put(rq);
 
 	if (err)
-		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
-			"Request submission for GSC load failed (%d)\n",
-			err);
+		gt_err(gsc_uc_to_gt(gsc), "Request submission for GSC load failed (%d)\n", err);
 
 	return err;
 }
@@ -200,8 +199,7 @@ int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
 	/* FW is not fully operational until we enable SW proxy */
 	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
-	drm_info(&gt->i915->drm, "Loaded GSC firmware %s\n",
-		 gsc_fw->file_selected.path);
+	gt_info(gt, "Loaded GSC firmware %s\n", gsc_fw->file_selected.path);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index fd21dbd2663be..6e7d5aa4dcf5e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "intel_gsc_uc.h"
 #include "intel_gsc_fw.h"
 #include "i915_drv.h"
@@ -59,7 +60,6 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
 {
 	static struct lock_class_key gsc_lock;
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
-	struct drm_i915_private *i915 = gt->i915;
 	struct intel_engine_cs *engine = gt->engine[GSC0];
 	struct intel_context *ce;
 	struct i915_vma *vma;
@@ -81,8 +81,7 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
 						I915_GEM_HWS_GSC_ADDR,
 						&gsc_lock, "gsc_context");
 	if (IS_ERR(ce)) {
-		drm_err(&gt->i915->drm,
-			"failed to create GSC CS ctx for FW communication\n");
+		gt_err(gt, "failed to create GSC CS ctx for FW communication\n");
 		err =  PTR_ERR(ce);
 		goto out_vma;
 	}
@@ -98,7 +97,7 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
 out_fw:
 	intel_uc_fw_fini(&gsc->fw);
 out:
-	i915_probe_error(i915, "failed with %d\n", err);
+	gt_probe_error(gt, "GSC init failed with %d\n", err);
 	return err;
 }
 
-- 
2.39.1

