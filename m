Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974906665C6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380AB10E829;
	Wed, 11 Jan 2023 21:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238610E0CA;
 Wed, 11 Jan 2023 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673473350; x=1705009350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fjecOUVgXS8xG4Kss6ca1QBC/wO9qqrzOpN/iirj/dk=;
 b=g3p1So0F2TPu2i/ZsETN9U0H5ChTuSDer60mOt6RwYi08m8H8nAWffN3
 0oK+5Kb4eFG4e9fUBDb6qO4vD3mKFRPDyAQ5aUd5eBTwD7FrZUXSUOz0B
 Lnkx7CvH1AWPxrXuDdnKbcw6Su9zHf1t3pzeROtmGAYpS3r7J77BiC2Mg
 QUin+IZ+KV0+VqxrKMBrSaslWsI+UbzUn0iOUOSO47gdMTq7QDVXORrm3
 NpNNQ7SHtl2boI5iBTQFRlLNXCLKHDiQgYxAubkeHVzwKAd/AD5a9edyB
 iltGmpZ1jFAy7qZu/JBIRybXBH6Fi5C4Bhhl+rphaxGjqict7L8ta/3uf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322244745"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="322244745"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 13:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607530426"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="607530426"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 13:42:29 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/i915/pxp: Add MTL hw-plumbing enabling for KCR
 operation
Date: Wed, 11 Jan 2023 13:42:20 -0800
Message-Id: <20230111214226.907536-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 35 ++++++++++++--------
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h    | 26 +++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c | 29 +++++++++++-----
 4 files changed, 70 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 8fac2660e16b..957fa11373fc 100644
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
index be52bf92e847..809b49f59594 100644
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
@@ -61,21 +62,30 @@ bool intel_pxp_is_active(const struct intel_pxp *pxp)
 	return IS_ENABLED(CONFIG_DRM_I915_PXP) && pxp && pxp->arb_is_valid;
 }
 
-/* KCR register definitions */
-#define KCR_INIT _MMIO(0x320f0)
-/* Setting KCR Init bit is required after system boot */
-#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
+static i915_reg_t get_kcr_reg(const struct intel_pxp *pxp)
+{
+	if (pxp->gsccs_priv)
+		return MTL_KCR_INIT;
+	return GEN12_KCR_INIT;
+}
 
-static void kcr_pxp_enable(struct intel_gt *gt)
+static void kcr_pxp_set_status(const struct intel_pxp *pxp, bool enable)
 {
-	intel_uncore_write(gt->uncore, KCR_INIT,
-			   _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+	i915_reg_t reg = get_kcr_reg(pxp);
+	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
+		  _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES);
+
+	intel_uncore_write(pxp->ctrl_gt->uncore, reg, val);
 }
 
-static void kcr_pxp_disable(struct intel_gt *gt)
+static void kcr_pxp_enable(const struct intel_pxp *pxp)
 {
-	intel_uncore_write(gt->uncore, KCR_INIT,
-			   _MASKED_BIT_DISABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES));
+	kcr_pxp_set_status(pxp, true);
+}
+
+static void kcr_pxp_disable(const struct intel_pxp *pxp)
+{
+	kcr_pxp_set_status(pxp, false);
 }
 
 static int create_vcs_context(struct intel_pxp *pxp)
@@ -323,14 +333,13 @@ int intel_pxp_start(struct intel_pxp *pxp)
 
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
index 000000000000..dd4131903d4e
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_regs.h
@@ -0,0 +1,26 @@
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
+/* KCR enable/disable control */
+#define GEN12_KCR_INIT _MMIO(0x320f0)
+#define MTL_KCR_INIT _MMIO(0x3860f0)
+
+/* Setting KCR Init bit is required after system boot */
+#define KCR_INIT_ALLOW_DISPLAY_ME_WRITES REG_BIT(14)
+
+/* KCR hwdrm session in play status 0-31 */
+#define GEN12_KCR_SIP _MMIO(0x32260)
+#define MTL_KCR_SIP _MMIO(0x386260)
+
+/* PXP global terminate register for session termination */
+#define GEN12_KCR_GLOBAL_TERMINATE _MMIO(0x320f8)
+#define MTL_KCR_GLOBAL_TERMINATE _MMIO(0x3860f8)
+
+#endif /* __INTEL_PXP_REGS_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 080aa2209c5b..7bb06e67b155 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -11,23 +11,25 @@
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
 	intel_wakeref_t wakeref;
+	i915_reg_t reg;
 	u32 sip = 0;
 
 	/* if we're suspended the session is considered off */
-	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref)
-		sip = intel_uncore_read(uncore, GEN12_KCR_SIP);
+	with_intel_runtime_pm_if_in_use(uncore->rpm, wakeref) {
+		if (pxp->gsccs_priv)
+			reg = MTL_KCR_SIP;
+		else
+			reg = GEN12_KCR_SIP;
+		sip = intel_uncore_read(uncore, reg);
+	}
 
 	return sip & BIT(id);
 }
@@ -37,6 +39,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 	struct intel_uncore *uncore = pxp->ctrl_gt->uncore;
 	intel_wakeref_t wakeref;
 	u32 mask = BIT(id);
+	i915_reg_t reg;
 	int ret;
 
 	/* if we're suspended the session is considered off */
@@ -44,8 +47,13 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 	if (!wakeref)
 		return in_play ? -ENODEV : 0;
 
+	if (pxp->gsccs_priv)
+		reg = MTL_KCR_SIP;
+	else
+		reg = GEN12_KCR_SIP;
+
 	ret = intel_wait_for_register(uncore,
-				      GEN12_KCR_SIP,
+				      reg,
 				      mask,
 				      in_play ? mask : 0,
 				      100);
@@ -112,7 +120,10 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 		return ret;
 	}
 
-	intel_uncore_write(gt->uncore, PXP_GLOBAL_TERMINATE, 1);
+	if (pxp->gsccs_priv)
+		intel_uncore_write(gt->uncore, MTL_KCR_GLOBAL_TERMINATE, 1);
+	else
+		intel_uncore_write(gt->uncore, GEN12_KCR_GLOBAL_TERMINATE, 1);
 
 	return ret;
 }
-- 
2.39.0

