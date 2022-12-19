Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F34650A2E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 11:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017310E226;
	Mon, 19 Dec 2022 10:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89E510E224;
 Mon, 19 Dec 2022 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671446125; x=1702982125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKhudszbnFX8GFo2J2iZzlHbDqbcui9m6gTwjVrwpak=;
 b=B8Ege/4iMjuo2Z+8pdpB3b6+re3tDIsNQ+qEghZXtxsrtmxoM8AwG/6G
 GJfn3+QGLiNV4m0G6ocwFrU7w1UYA1CmRVDTj/2vEPt7FNUro4fyli8SJ
 g5Ml0+9IIe6KvbAp9VH3MNKUSf3fYMrKT48zHp9fmlimkXkZYDQxocou0
 7hQtnvNBS5M5rhqsmuIN1+wKY9+VKaYlU0WhN64hTtFWQ35V1FCFFlUwv
 umS1brX0vBScZyd+L9GGTYjaDj40Bdo07rcTH+8MmW4KVPATR0FDuTDDc
 nbq7Xv5fzBRfm/zNomaRqxQKdCFYARsCF+yAQlxTn+dA7ChVmfQKuKrNQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="321214461"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="321214461"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 02:35:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="774884248"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="774884248"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 02:35:24 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: implement wa 14015076503
Date: Mon, 19 Dec 2022 02:40:00 -0800
Message-Id: <20221219104000.3936094-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The WA states that before doing a GSC engine reset we need to alert the
GSC FW and then wait for 200ms for the FW to get ready for it. The GuC
will take care of this for engine reset, but i915 is still responsible
for the full GT reset scenario.

Given that we do full GT resets in the resume paths to cleanup the HW
state and that waiting 200ms in those scenarios would not be acceptable,
a faster path has been introduced where, if there are no pending
submissions to the GSC engine, we first try to individually reset the
GuC and all engines except the GSC and only fall back to full reset if
that fails.

Note that the 200ms wait is based on the worst case scenario and it
should be possible to limit the wait to a shorter time if the GSC FW
is idle when we alert it. However, the GSC FW team has advised against
this approach as the shorter wait time in that case would depend on the
actual power state of the microcontroller, because suspend exit time
might have to be added in. The GSC engine is very rarely active anyway,
so we should take the faster path in the great majority of cases.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 74 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h       |  5 +-
 2 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index ffde89c5835a..7cf84b0b72e1 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -14,6 +14,8 @@
 
 #include "gt/intel_gt_regs.h"
 
+#include "gt/uc/intel_gsc_fw.h"
+
 #include "i915_drv.h"
 #include "i915_file_private.h"
 #include "i915_gpu_error.h"
@@ -668,6 +670,64 @@ static reset_func intel_get_gpu_reset(const struct intel_gt *gt)
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
+		intel_uncore_write(gt->uncore,
+				   HECI_GENERAL_STATUS(MTL_GSC_HECI2_BASE),
+				   BIT(0));
+		intel_uncore_write(gt->uncore,
+				   HECI_CONTROL_AND_STATUS(MTL_GSC_HECI2_BASE),
+				   BIT(2));
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
+	intel_uncore_write(gt->uncore,
+			   HECI_GENERAL_STATUS(MTL_GSC_HECI2_BASE), 0);
+}
+
 int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
 {
 	const int retries = engine_mask == ALL_ENGINES ? RESET_MAX_RETRIES : 1;
@@ -685,10 +745,16 @@ int __intel_gt_reset(struct intel_gt *gt, intel_engine_mask_t engine_mask)
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
 
@@ -713,14 +779,12 @@ bool intel_has_reset_engine(const struct intel_gt *gt)
 
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
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index cef9418beec0..8584df72b6e2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -923,8 +923,11 @@
 #define DG1_GSC_HECI2_BASE	0x00259000
 #define DG2_GSC_HECI1_BASE	0x00373000
 #define DG2_GSC_HECI2_BASE	0x00374000
+#define MTL_GSC_HECI1_BASE	0x00116000
+#define MTL_GSC_HECI2_BASE	0x00117000
 
-
+#define HECI_CONTROL_AND_STATUS(base)	_MMIO(base + 0x4)
+#define HECI_GENERAL_STATUS(base)	_MMIO(base + 0xc4c)
 
 #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
 #define   GTT_CACHE_EN_ALL	0xF0007FFF
-- 
2.37.3

