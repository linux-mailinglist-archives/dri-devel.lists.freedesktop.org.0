Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9A675A4A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E63B10EABB;
	Fri, 20 Jan 2023 16:41:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9165F10EAAC;
 Fri, 20 Jan 2023 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232889; x=1705768889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9gLsZwRgUnh7TQdbBEJBZig9l8RDg3f6LHAa9KO+G/Y=;
 b=BvN0bgMA+78eyUN7fzJW7Af8zOq6fazz8qmmPmZeF6uv8xowhAu3X9TO
 o1QrPfxMcqCb2rMqaUUKeTfCRm2GhIosxe7BldbjJe+zUVAilORCSOrk6
 t2zjgi20CIXDFa1IQidkRdf0KDkt0vj3JqNbTIF5xbD/u9/mFWU/Sl6Au
 vjcHMUjVgm6w1EjPUwsL6FhoMoXOORrgsQ83dfgzQEwujlVJWtbbSP1x4
 E8c4Cz41IOYOP1EKdz1/Q1NLUZ7iw7fJBrnTgVFGST4DLCXbqmqCqJNQq
 rP+CUv2GV2dUIrXXIHGfZFWn7Rgxfyyf4izCMxWXAqN60Z+AW0RPWXzqs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325656813"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="325656813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="749398889"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="749398889"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jan 2023 08:41:28 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEff023485; Fri, 20 Jan 2023 16:41:27 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/guc: Update GuC messages in intel_guc_fw.c
Date: Fri, 20 Jan 2023 17:40:47 +0100
Message-Id: <20230120164050.1765-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
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

