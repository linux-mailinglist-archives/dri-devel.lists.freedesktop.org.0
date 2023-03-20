Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784AC6C236D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 22:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2F510E31B;
	Mon, 20 Mar 2023 21:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AD310E31B;
 Mon, 20 Mar 2023 21:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679346658; x=1710882658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1skaer4TvSgCSxQ9LNNgYx0yU4GOqQOcdR1VxYLRh0A=;
 b=Aq3S3hzBAZaH9MWizDrxSi8427bUVE6I2sThDT6zbExhrpgSaps2435P
 0eBGh1c0xG0CyCClF5OchOcJRyvn2H1/0C7vCzdCdGpUDEh/7k04TCPcb
 jW+5WuATz15E5+um5/xyvYtdCAB7BcyfS2w9qjv3Vjis2CB1XFUEDNnUK
 BgurmYI203Hwt4RPXQOJlkz+wCj9V9MmxN/RH5zDFLurW8W3P/SEcfG97
 sNuWbcj+KACLMQByk7ebC9IMw6eYMB1oBeqOfO0a5wHU5LYHd4oB5AvLS
 P7fxyba07coHGnFGiiDbT/HE0pSTfsMiFYY/5qkEJ3b8GVRubnvytzxVE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337497124"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="337497124"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674559656"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="674559656"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 14:10:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gsc: implement wa 14015076503
Date: Mon, 20 Mar 2023 14:10:39 -0700
Message-Id: <20230320211039.1513368-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
References: <20230320211039.1513368-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The WA states that we need to alert the GSC FW before doing a GSC engine
reset and then wait for 200ms. The GuC owns engine reset, so on the i915
side we only need to apply this for full GT reset.

Given that we do full GT resets in the resume paths to cleanup the HW
state and that a long wait in those scenarios would not be acceptable,
a faster path has been introduced where, if the GSC is idle, we try first
to individually reset the GuC and all engines except the GSC and only fall
back to full reset if that fails.

Note: according to the WA specs, if the GSC is idle it should be possible
to only wait for the uC wakeup time (~15ms) instead of the whole 200ms.
However, the GSC FW team have mentioned that the wakeup time can change
based on other things going on in the HW and pcode, so a good security
margin would be required. Given that when the GSC is idle we already
skip the wait & reset entirely and that this reduced wait would still
likely be too long to use in resume paths, it's not worth adding support
for this reduced wait.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c     | 77 +++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h |  2 +
 drivers/gpu/drm/i915/i915_reg.h           | 14 ++++-
 3 files changed, 86 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 2c3463f77e5c..5f75f59122cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -14,6 +14,8 @@
 
 #include "gt/intel_gt_regs.h"
 
+#include "gt/uc/intel_gsc_fw.h"
+
 #include "i915_drv.h"
 #include "i915_file_private.h"
 #include "i915_gpu_error.h"
@@ -695,6 +697,67 @@ static reset_func intel_get_gpu_reset(const struct intel_gt *gt)
 		return NULL;
 }
 
+static int __reset_guc(struct intel_gt *gt)
+{
+	u32 guc_domain =
+		GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : GEN9_GRDOM_GUC;
+
+	return gen6_hw_domain_reset(gt, guc_domain);
+}
+
+static bool needs_wa_14015076503(struct intel_gt *gt, intel_engine_mask_t engine_mask)
+{
+	if (!IS_METEORLAKE(gt->i915) || !HAS_ENGINE(gt, GSC0))
+		return false;
+
+	if (!__HAS_ENGINE(engine_mask, GSC0))
+		return false;
+
+	return intel_gsc_uc_fw_init_done(&gt->uc.gsc);
+}
+
+static intel_engine_mask_t
+wa_14015076503_start(struct intel_gt *gt, intel_engine_mask_t engine_mask, bool first)
+{
+	if (!needs_wa_14015076503(gt, engine_mask))
+		return engine_mask;
+
+	/*
+	 * wa_14015076503: if the GSC FW is loaded, we need to alert it that
+	 * we're going to do a GSC engine reset and then wait for 200ms for the
+	 * FW to get ready for it. However, if this the first ALL_ENGINES reset
+	 * attempt and the GSC is not busy, we can try to instead reset the GuC
+	 * and all the other engines individually to avoid the 200ms wait.
+	 */
+	if (engine_mask == ALL_ENGINES && first && intel_engine_is_idle(gt->engine[GSC0])) {
+		__reset_guc(gt);
+		engine_mask = gt->info.engine_mask & ~BIT(GSC0);
+	} else {
+		intel_uncore_rmw(gt->uncore,
+				 HECI_H_GS1(MTL_GSC_HECI2_BASE),
+				 0, HECI_H_GS1_ER_PREP);
+
+		/* make sure the reset bit is clear when writing the CSR reg */
+		intel_uncore_rmw(gt->uncore,
+				 HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 HECI_H_CSR_RST, HECI_H_CSR_IG);
+		msleep(200);
+	}
+
+	return engine_mask;
+}
+
+static void
+wa_14015076503_end(struct intel_gt *gt, intel_engine_mask_t engine_mask)
+{
+	if (!needs_wa_14015076503(gt, engine_mask))
+		return;
+
+	intel_uncore_rmw(gt->uncore,
+			 HECI_H_GS1(MTL_GSC_HECI2_BASE),
+			 HECI_H_GS1_ER_PREP, 0);
+}
+
 int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 {
 	const int retries = engine_mask == ALL_ENGINES ? RESET_MAX_RETRIES : 1;
@@ -712,10 +775,16 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 	 */
 	intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
 	for (retry = 0; ret == -ETIMEDOUT && retry < retries; retry++) {
-		GT_TRACE(gt, "engine_mask=%x\n", engine_mask);
+		intel_engine_mask_t reset_mask;
+
+		reset_mask = wa_14015076503_start(gt, engine_mask, !retry);
+
+		GT_TRACE(gt, "engine_mask=%x\n", reset_mask);
 		preempt_disable();
-		ret = reset(gt, engine_mask, retry);
+		ret = reset(gt, reset_mask, retry);
 		preempt_enable();
+
+		wa_14015076503_end(gt, reset_mask);
 	}
 	intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
 
@@ -740,14 +809,12 @@ bool intel_has_reset_engine(const struct intel_gt *gt)
 
 int intel_reset_guc(struct intel_gt *gt)
 {
-	u32 guc_domain =
-		GRAPHICS_VER(gt->i915) >= 11 ? GEN11_GRDOM_GUC : GEN9_GRDOM_GUC;
 	int ret;
 
 	GEM_BUG_ON(!HAS_GT_UC(gt->i915));
 
 	intel_uncore_forcewake_get(gt->uncore, FORCEWAKE_ALL);
-	ret = gen6_hw_domain_reset(gt, guc_domain);
+	ret = __reset_guc(gt);
 	intel_uncore_forcewake_put(gt->uncore, FORCEWAKE_ALL);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
index 4b5dbb44afb4..f4c1106bb2a9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
@@ -9,7 +9,9 @@
 #include <linux/types.h>
 
 struct intel_gsc_uc;
+struct intel_uncore;
 
 int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
 bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d22ffd7a32dc..80e33ede7fac 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -928,8 +928,18 @@
 #define DG1_GSC_HECI2_BASE	0x00259000
 #define DG2_GSC_HECI1_BASE	0x00373000
 #define DG2_GSC_HECI2_BASE	0x00374000
-
-
+#define MTL_GSC_HECI1_BASE	0x00116000
+#define MTL_GSC_HECI2_BASE	0x00117000
+
+#define HECI_H_CSR(base)	_MMIO(base + 0x4)
+#define   HECI_H_CSR_IE		REG_BIT(0)
+#define   HECI_H_CSR_IS		REG_BIT(1)
+#define   HECI_H_CSR_IG		REG_BIT(2)
+#define   HECI_H_CSR_RDY	REG_BIT(3)
+#define   HECI_H_CSR_RST	REG_BIT(4)
+
+#define HECI_H_GS1(base)	_MMIO(base + 0xc4c)
+#define   HECI_H_GS1_ER_PREP	REG_BIT(0)
 
 #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
 #define   GTT_CACHE_EN_ALL	0xF0007FFF
-- 
2.37.3

