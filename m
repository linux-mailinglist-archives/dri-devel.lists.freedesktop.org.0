Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C57BE9BC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD3710E2B2;
	Mon,  9 Oct 2023 18:38:28 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1329610E2B2;
 Mon,  9 Oct 2023 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696876704; x=1728412704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wZ7mOFnpwrvqoLiLiiAb7HJNuT0jl2PWZXJ6uH4r5dw=;
 b=LyCgDqEsJQF2R4Rvm1ngeQwf2UOsC2D7p0lC1jOk3fneY1f88igakAZv
 5AwqzzCEx4P3UoEgBlqJdskiZvPai2q6I8pf/ROV3OC+IIi/s3a97L8mt
 pNjPxaTrGwI+1WdNhm+mkiDGYU6+hvyRza4sNexfllKZYTOx1p2+aVCCs
 oTqz7ZWasJnYbe4bmkpBElQjjghwk5HBRQNcKOGucHvuGou0C40U4LOrO
 RLfucrAde8EFC2O+MLYJ+206Ey5FqwOF/2xtn7KwicbYmBVxA31Z27HHh
 al/JtvUJBC+XIxhNvDMaQ/87m8okV+8HV7XJPDxp7bAtGFxtyv9CjZCtf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384079354"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="384079354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 11:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="756804156"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="756804156"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga007.fm.intel.com with ESMTP; 09 Oct 2023 11:38:22 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915: More use of GT specific print helpers
Date: Mon,  9 Oct 2023 11:38:02 -0700
Message-ID: <20231009183802.673882-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183802.673882-1-John.C.Harrison@Intel.com>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
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

Update a bunch of GT related print messages in non-GT files to use the
GT specific helpers.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c | 8 +++-----
 drivers/gpu/drm/i915/i915_driver.c        | 3 ++-
 drivers/gpu/drm/i915/i915_perf.c          | 8 ++++----
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index 0d3b22a743659..453d855dd1de7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -68,8 +68,7 @@ static void gsc_work(struct work_struct *work)
 				 * A proxy failure right after firmware load means the proxy-init
 				 * step has failed so mark GSC as not usable after this
 				 */
-				drm_err(&gt->i915->drm,
-					"GSC proxy handler failed to init\n");
+				gt_err(gt, "GSC proxy handler failed to init\n");
 				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 			}
 			goto out_put;
@@ -83,11 +82,10 @@ static void gsc_work(struct work_struct *work)
 			 * status register to check if the proxy init was actually successful
 			 */
 			if (intel_gsc_uc_fw_proxy_init_done(gsc, false)) {
-				drm_dbg(&gt->i915->drm, "GSC Proxy initialized\n");
+				gt_dbg(gt, "GSC Proxy initialized\n");
 				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_RUNNING);
 			} else {
-				drm_err(&gt->i915->drm,
-					"GSC status reports proxy init not complete\n");
+				gt_err(gt, "GSC status reports proxy init not complete\n");
 				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
 			}
 		}
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e5a94b08d5efe..944ab895da72e 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -71,6 +71,7 @@
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_pm.h"
+#include "gt/intel_gt_print.h"
 #include "gt/intel_rc6.h"
 
 #include "pxp/intel_pxp.h"
@@ -429,7 +430,7 @@ static int i915_pcode_init(struct drm_i915_private *i915)
 	for_each_gt(gt, i915, id) {
 		ret = intel_pcode_init(gt->uncore);
 		if (ret) {
-			drm_err(&gt->i915->drm, "gt%d: intel_pcode_init failed %d\n", id, ret);
+			gt_err(gt, "intel_pcode_init failed %d\n", ret);
 			return ret;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 1347e4ec9dd5a..8f7ab64feec0d 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -206,6 +206,7 @@
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_clock_utils.h"
 #include "gt/intel_gt_mcr.h"
+#include "gt/intel_gt_print.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_lrc.h"
 #include "gt/intel_lrc_reg.h"
@@ -1659,9 +1660,8 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	free_noa_wait(stream);
 
 	if (perf->spurious_report_rs.missed) {
-		drm_notice(&gt->i915->drm,
-			   "%d spurious OA report notices suppressed due to ratelimiting\n",
-			   perf->spurious_report_rs.missed);
+		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n",
+			  perf->spurious_report_rs.missed);
 	}
 }
 
@@ -1852,7 +1852,7 @@ static int alloc_oa_buffer(struct i915_perf_stream *stream)
 	 */
 	ret = i915_vma_pin(vma, 0, SZ_16M, PIN_GLOBAL | PIN_HIGH);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to pin OA buffer %d\n", ret);
+		gt_err(gt, "Failed to pin OA buffer %d\n", ret);
 		goto err_unref;
 	}
 
-- 
2.41.0

