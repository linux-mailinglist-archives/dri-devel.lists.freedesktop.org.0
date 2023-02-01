Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB6167AB4C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A8510E73B;
	Wed, 25 Jan 2023 08:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF8C10E044;
 Wed, 25 Jan 2023 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674634015; x=1706170015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8WdXK2jJzTnoAc0q4+L3NgXKMlvV5f5zyWk8TsIcmmQ=;
 b=Jx5ztb/PJhcNYdVSGzUk5DYCqM5tgobuTAdEgSW/qB1XYfHZiqKwPDCc
 rDvjbfh+gjnu2hosWfplBIaVbipkGs8uz3tkqmbe2VEXrR8PPrVANDz44
 e5Rq4L/9BjQuegI/cQAEHGOBRJRlFMTxxSUN2hLF4yju36CIzCpxZVSf7
 5+HK5jBonM4A2scm/JnXYrqN2i7RUPTyOCU+npgoW95Xt8U3M8+KjAnC/
 1hkfotrK536E7FBSdcupirlMUQJDjs2TQgHg4HjFZi2qVw/dGlezV14yR
 /tk6bUwyLb01iGeJBXYqIO8t3oo67qPc7Aj2HTa47gBdAY13wCi3V9aXG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310079366"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="310079366"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991180676"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="991180676"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 00:06:53 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/8] drm/i915/pxp: Add MTL hw-plumbing enabling for KCR
 operation
Date: Wed, 25 Jan 2023 00:06:45 -0800
Message-Id: <20230125080651.100223-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MTL hw-plumbing enabling for KCR operation under PXP
which includes:

1. Updating 'pick-gt' to get the media tile for
   KCR interrupt handling
2. Adding MTL's KCR registers for PXP operation
   (init, status-checking, etc.).

While doing #2, lets create a separate registers header file for PXP
to be consistent with other i915 global subsystems.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c       |  3 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 32 ++++++++++++--------
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h    | 27 +++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 12 +++-----
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   |  6 ++++
 5 files changed, 58 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 1b25a6039152..c360776a98b5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -100,7 +100,8 @@ static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
 	case VIDEO_ENHANCEMENT_CLASS:
 		return media_gt;
 	case OTHER_CLASS:
-		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
+		if ((instance == OTHER_GSC_INSTANCE || instance == OTHER_KCR_INSTANCE) &&
+		    HAS_ENGINE(media_gt, GSC0))
 			return media_gt;
 		fallthrough;
 	default:
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 22280408156e..4350921e40c4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -14,6 +14,7 @@
 #include "intel_pxp.h"
 #include "intel_pxp_gsccs.h"
 #include "intel_pxp_irq.h"
+#include "intel_pxp_regs.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "intel_pxp_types.h"
@@ -61,21 +62,22 @@ bool intel_pxp_is_active(const struct intel_pxp *pxp)
 	return IS_ENABLED(CONFIG_DRM_I915_PXP) && pxp && pxp->arb_is_valid;
 }
 
-/* KCR register definitions */
-#define KCR_INIT _MMIO(0x320f0)
-/* Setting KCR Init bit is required after system boot */
-#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
+static void kcr_pxp_set_status(const struct intel_pxp *pxp, bool enable)
+{
+	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
+		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
+
+	intel_uncore_write(pxp->ctrl_gt->uncore, KCR_INIT(pxp->kcr_base), val);
+}
 
-static void kcr_pxp_enable(struct intel_gt *gt)
+static void kcr_pxp_enable(const struct intel_pxp *pxp)
 {
-	intel_uncore_write(gt->uncore, KCR_INIT,
-			   _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+	kcr_pxp_set_status(pxp, true);
 }
 
-static void kcr_pxp_disable(struct intel_gt *gt)
+static void kcr_pxp_disable(const struct intel_pxp *pxp)
 {
-	intel_uncore_write(gt->uncore, KCR_INIT,
-			   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+	kcr_pxp_set_status(pxp, false);
 }
 
 static int create_vcs_context(struct intel_pxp *pxp)
@@ -127,6 +129,11 @@ static void pxp_init_full(struct intel_pxp *pxp)
 	init_completion(&pxp->termination);
 	complete_all(&pxp->termination);
 
+	if (pxp->ctrl_gt->type == GT_MEDIA)
+		pxp->kcr_base = MTL_KCR_BASE;
+	else
+		pxp->kcr_base = GEN12_KCR_BASE;
+
 	intel_pxp_session_management_init(pxp);
 
 	ret = create_vcs_context(pxp);
@@ -319,14 +326,13 @@ int intel_pxp_start(struct intel_pxp *pxp)
 
 void intel_pxp_init_hw(struct intel_pxp *pxp)
 {
-	kcr_pxp_enable(pxp->ctrl_gt);
+	kcr_pxp_enable(pxp);
 	intel_pxp_irq_enable(pxp);
 }
 
 void intel_pxp_fini_hw(struct intel_pxp *pxp)
 {
-	kcr_pxp_disable(pxp->ctrl_gt);
-
+	kcr_pxp_disable(pxp);
 	intel_pxp_irq_disable(pxp);
 }
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
new file mode 100644
index 000000000000..a9e7e6efa4c7
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2023, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_REGS_H__
+#define __INTEL_PXP_REGS_H__
+
+#include "i915_reg_defs.h"
+
+/* KCR subsystem register base address */
+#define GEN12_KCR_BASE 0x32000
+#define MTL_KCR_BASE 0x386000
+
+/* KCR enable/disable control */
+#define KCR_INIT(base) _MMIO((base) + 0xf0)
+
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
+
+/* KCR hwdrm session in play status 0-31 */
+#define KCR_SIP(base) _MMIO((base) + 0x260)
+
+/* PXP global terminate register for session termination */
+#define KCR_GLOBAL_TERMINATE(base) _MMIO((base) + 0xf8)
+
+#endif /* __INTEL_PXP_REGS_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index ae413580b81a..28f5ca838cb7 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -10,14 +10,10 @@
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "intel_pxp_types.h"
+#include "intel_pxp_regs.h"
 
 #define ARB_SESSION I915_PROTECTED_CONTENT_DEFAULT_SESSION /* shorter define */
 
-#define GEN12_KCR_SIP _MMIO(0x32260) /* KCR hwdrm session in play 0-31 */
-
-/* PXP global terminate register for session termination */
-#define PXP_GLOBAL_TERMINATE _MMIO(0x320f8)
-
 static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
 {
 	struct intel_uncore *uncore = pxp->ctrl_gt->uncore;
@@ -26,7 +22,7 @@ static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
 
 	/* if we're suspended the session is considered off */
 	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref)
-		sip = intel_uncore_read(uncore, GEN12_KCR_SIP);
+		sip = intel_uncore_read(uncore, KCR_SIP(pxp->kcr_base));
 
 	return sip & BIT(id);
 }
@@ -44,7 +40,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 		return in_play ? -ENODEV : 0;
 
 	ret = intel_wait_for_register(uncore,
-				      GEN12_KCR_SIP,
+				      KCR_SIP(pxp->kcr_base),
 				      mask,
 				      in_play ? mask : 0,
 				      100);
@@ -108,7 +104,7 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 		return ret;
 	}
 
-	intel_uncore_write(gt->uncore, PXP_GLOBAL_TERMINATE, 1);
+	intel_uncore_write(gt->uncore, KCR_GLOBAL_TERMINATE(pxp->kcr_base), 1);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 326bd8414407..be51e43ac23d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -26,6 +26,12 @@ struct intel_pxp {
 	 */
 	struct intel_gt *ctrl_gt;
 
+	/**
+	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
+	 * vs newer platforms where the KCR is inside the media-tile.
+	 */
+	u32 kcr_base;
+
 	/**
 	 * @gsccs_res: resources for request submission for platforms that have a GSC engine.
 	 */
-- 
2.39.0

