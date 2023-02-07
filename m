Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BBE68CEB1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 06:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B29E10E452;
	Tue,  7 Feb 2023 05:07:14 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD12D10E2E2;
 Tue,  7 Feb 2023 05:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675746428; x=1707282428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sjrmWGAlZ5kJ7vwTQACbYC3mklif7tvs2yLE8nHZOnk=;
 b=Tx4uGajGZkuE3FWFOZ/Wv1MCsXF1by3IUsMJis2I973hmsgw2UcwPWE2
 6apbJGK0wrSvwibou4pcQSKUFprlAK5U0rKlwrOKLnfSdpHDaGHpI6OHf
 1TSgV3zzn8iOq5h/74qZMUbfeRxAFfhPeIZch3jSUbp8ob8ErxqbPK2FW
 OFQOW0yRvDnNOnZYAJvYfhp4vCuTQ2mbPMK2DGfNvsTv/rQ8+qE5KyVCB
 zrMuPveCYePzywsHV0nwSDvacmYIdWbbm+vft7p/AH1tUudAaavx78FoU
 ReS28tBxYezZLddmVnD5SwIsNeLUjPTar6CbuQSX2A3MoX0NHas6x5pBB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309049937"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="309049937"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 21:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840631497"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="840631497"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 06 Feb 2023 21:07:07 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/6] drm/i915/guc: More debug print updates - GSC firmware
Date: Mon,  6 Feb 2023 21:07:13 -0800
Message-Id: <20230207050717.1833718-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
References: <20230207050717.1833718-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Update a bunch more debug prints to use the new GT based scheme.

v2: Also change prints to use %pe for error values (MichalW).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Acked-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 9 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 7 +++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
index e73d4440c5e82..1d9fdfb112681 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
@@ -6,6 +6,7 @@
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
 #include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
 #include "gt/intel_ring.h"
 #include "intel_gsc_fw.h"
 
@@ -88,9 +89,8 @@ static int gsc_fw_load(struct intel_gsc_uc *gsc)
 	i915_request_put(rq);
 
 	if (err)
-		drm_err(&gsc_uc_to_gt(gsc)->i915->drm,
-			"Request submission for GSC load failed (%d)\n",
-			err);
+		gt_err(gsc_uc_to_gt(gsc), "Request submission for GSC load failed %pe\n",
+		       ERR_PTR(err));
 
 	return err;
 }
@@ -200,8 +200,7 @@ int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc)
 	/* FW is not fully operational until we enable SW proxy */
 	intel_uc_fw_change_status(gsc_fw, INTEL_UC_FIRMWARE_TRANSFERRED);
 
-	drm_info(&gt->i915->drm, "Loaded GSC firmware %s\n",
-		 gsc_fw->file_selected.path);
+	gt_info(gt, "Loaded GSC firmware %s\n", gsc_fw->file_selected.path);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index fd21dbd2663be..8afd42cbded96 100644
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
+	gt_probe_error(gt, "GSC init failed %pe\n", ERR_PTR(err));
 	return err;
 }
 
-- 
2.39.1

