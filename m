Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978C67FAA0
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 20:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFACF10E1F3;
	Sat, 28 Jan 2023 19:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E420510E1F4;
 Sat, 28 Jan 2023 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935962; x=1706471962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XLrvo+vi+c+yn5lY9GqNhfnf9E5B3A1yfqJ9VP3I38o=;
 b=FMcQnl2setnOC5UyGhSW0aLRhKdHseDrD0OAoJOUMZx5XLjF/5vNqzJS
 BI4igusJXKrFTegkymOOXH+MbJH8s/1kcMrC6YwKRIlW0bY7FUCLYJyQk
 RHMcjeoMMEzk32djFmCqsS/pnpTWUJn26aIjWzOFoqFBw8G1G1ePDZ4UG
 QhLlAAvg3SnnyVaVfnG63N4bv5zPATkgc8g5owkVy0vETJl8MqP2bL3Qu
 E/EPVwvrXZMVoKide3wGiKYjvYYD8FrweLdc75uqsqOCwVMUo5mc8xAOs
 Sh8d6Ll4fMiFVM7fkmu9DkO2M+EhKbNdY46wssQXe4nytaSUozoxKs5Qn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978120"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978120"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567942"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567942"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:21 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C5AA0333EE;
 Sat, 28 Jan 2023 19:59:20 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/8] drm/i915/guc: Update GuC messages in intel_guc_fw.c
Date: Sat, 28 Jan 2023 20:59:04 +0100
Message-Id: <20230128195907.1837-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230128195907.1837-1-michal.wajdeczko@intel.com>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 5b86b2e286e0..3d2249bda368 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -13,6 +13,7 @@
 #include "gt/intel_gt_mcr.h"
 #include "gt/intel_gt_regs.h"
 #include "intel_guc_fw.h"
+#include "intel_guc_print.h"
 #include "i915_drv.h"
 
 static void guc_prepare_xfer(struct intel_gt *gt)
@@ -103,8 +104,10 @@ static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
 	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
 }
 
-static int guc_wait_ucode(struct intel_uncore *uncore)
+static int guc_wait_ucode(struct intel_guc *guc)
 {
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct intel_uncore *uncore = gt->uncore;
 	u32 status;
 	int ret;
 
@@ -127,10 +130,8 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 	 */
 	ret = wait_for(guc_ready(uncore, &status), 200);
 	if (ret) {
-		struct drm_device *drm = &uncore->i915->drm;
-
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, "
+		guc_info(guc, "load failed: status = 0x%08X\n", status);
+		guc_info(guc, "load failed: status: Reset = %d, "
 			"BootROM = 0x%02X, UKernel = 0x%02X, "
 			"MIA = 0x%02X, Auth = 0x%02X\n",
 			REG_FIELD_GET(GS_MIA_IN_RESET, status),
@@ -140,12 +141,12 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
+			guc_info(guc, "firmware signature verification failed\n");
 			ret = -ENOEXEC;
 		}
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
+			guc_info(guc, "firmware exception. EIP: %#x\n",
 				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
@@ -194,7 +195,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = guc_wait_ucode(uncore);
+	ret = guc_wait_ucode(guc);
 	if (ret)
 		goto out;
 
-- 
2.25.1

