Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F13D1391
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2756E9B1;
	Wed, 21 Jul 2021 16:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3FF6EC6D;
 Wed, 21 Jul 2021 16:12:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297028356"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="297028356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564787151"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 09:12:54 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/14] drm/i915/guc/rc: Setup and enable GUCRC feature
Date: Wed, 21 Jul 2021 09:11:20 -0700
Message-Id: <20210721161120.24610-15-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This feature hands over the control of HW RC6 to the GuC.
GuC decides when to put HW into RC6 based on it's internal
busyness algorithms.

GUCRC needs GuC submission to be enabled, and only
supported on Gen12+ for now.

When GUCRC is enabled, do not set HW RC6. Use a H2G message
to tell GuC to enable GUCRC. When disabling RC6, tell GuC to
revert RC6 control back to KMD.

v2: Address comments (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 22 +++--
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     | 81 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h     | 31 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
 8 files changed, 141 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index d8eac4468df9..3fc17f20d88e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
 	  gt/uc/intel_guc_fw.o \
 	  gt/uc/intel_guc_log.o \
 	  gt/uc/intel_guc_log_debugfs.o \
+	  gt/uc/intel_guc_rc.o \
 	  gt/uc/intel_guc_slpc.o \
 	  gt/uc/intel_guc_submission.o \
 	  gt/uc/intel_huc.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 259d7eb4e165..299fcf10b04b 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -98,11 +98,19 @@ static void gen11_rc6_enable(struct intel_rc6 *rc6)
 	set(uncore, GEN9_MEDIA_PG_IDLE_HYSTERESIS, 60);
 	set(uncore, GEN9_RENDER_PG_IDLE_HYSTERESIS, 60);
 
-	/* 3a: Enable RC6 */
-	rc6->ctl_enable =
-		GEN6_RC_CTL_HW_ENABLE |
-		GEN6_RC_CTL_RC6_ENABLE |
-		GEN6_RC_CTL_EI_MODE(1);
+	/* 3a: Enable RC6
+	 *
+	 * With GUCRC, we do not enable bit 31 of RC_CTL,
+	 * thus allowing GuC to control RC6 entry/exit fully instead.
+	 * We will not set the HW ENABLE and EI bits
+	 */
+	if (!intel_guc_rc_enable(&gt->uc.guc))
+		rc6->ctl_enable = GEN6_RC_CTL_RC6_ENABLE;
+	else
+		rc6->ctl_enable =
+			GEN6_RC_CTL_HW_ENABLE |
+			GEN6_RC_CTL_RC6_ENABLE |
+			GEN6_RC_CTL_EI_MODE(1);
 
 	pg_enable =
 		GEN9_RENDER_PG_ENABLE |
@@ -513,6 +521,10 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
 {
 	struct drm_i915_private *i915 = rc6_to_i915(rc6);
 	struct intel_uncore *uncore = rc6_to_uncore(rc6);
+	struct intel_gt *gt = rc6_to_gt(rc6);
+
+	/* Take control of RC6 back from GuC */
+	intel_guc_rc_disable(&gt->uc.guc);
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 	if (GRAPHICS_VER(i915) >= 9)
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index d832c8f11c11..5f1c82f35d97 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -136,6 +136,7 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
 	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
 	INTEL_GUC_ACTION_SLPC_REQUEST = 0x3003,
+	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
 	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
 	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
@@ -146,6 +147,11 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_LIMIT
 };
 
+enum intel_guc_rc_options {
+	INTEL_GUCRC_HOST_CONTROL,
+	INTEL_GUCRC_FIRMWARE_CONTROL,
+};
+
 enum intel_guc_preempt_options {
 	INTEL_GUC_PREEMPT_OPTION_DROP_WORK_Q = 0x4,
 	INTEL_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 686cb978662d..e474f554b17a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -159,6 +159,7 @@ void intel_guc_init_early(struct intel_guc *guc)
 	intel_guc_log_init_early(&guc->log);
 	intel_guc_submission_init_early(guc);
 	intel_guc_slpc_init_early(&guc->slpc);
+	intel_guc_rc_init_early(guc);
 
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 8cecfad9d7b1..dcac31098687 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -59,6 +59,8 @@ struct intel_guc {
 
 	bool submission_supported;
 	bool submission_selected;
+	bool rc_supported;
+	bool rc_selected;
 	bool slpc_supported;
 	bool slpc_selected;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
new file mode 100644
index 000000000000..f1970342c0ab
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "intel_guc_rc.h"
+#include "gt/intel_gt.h"
+#include "i915_drv.h"
+
+static bool __guc_rc_supported(struct intel_guc *guc)
+{
+	/* GuC RC is unavailable for pre-Gen12 */
+	return guc->submission_supported &&
+		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
+}
+
+static bool __guc_rc_selected(struct intel_guc *guc)
+{
+	if (!intel_guc_rc_is_supported(guc))
+		return false;
+
+	return guc->submission_selected;
+}
+
+void intel_guc_rc_init_early(struct intel_guc *guc)
+{
+	guc->rc_supported = __guc_rc_supported(guc);
+	guc->rc_selected = __guc_rc_selected(guc);
+}
+
+static int guc_action_control_gucrc(struct intel_guc *guc, bool enable)
+{
+	u32 rc_mode = enable ? INTEL_GUCRC_FIRMWARE_CONTROL :
+				INTEL_GUCRC_HOST_CONTROL;
+	u32 action[] = {
+		INTEL_GUC_ACTION_SETUP_PC_GUCRC,
+		rc_mode
+	};
+	int ret;
+
+	ret = intel_guc_send(guc, action, ARRAY_SIZE(action));
+	ret = ret > 0 ? -EPROTO : ret;
+
+	return ret;
+}
+
+static int __guc_rc_control(struct intel_guc *guc, bool enable)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
+	int ret;
+
+	if (!intel_uc_uses_guc_rc(&gt->uc))
+		return -ENOTSUPP;
+
+	if (!intel_guc_is_ready(guc))
+		return -EINVAL;
+
+	ret = guc_action_control_gucrc(guc, enable);
+	if (ret) {
+		drm_err(drm, "Failed to set GUCRC mode(%d), err=(%pe)\n",
+			enable ? INTEL_GUCRC_FIRMWARE_CONTROL:
+			INTEL_GUCRC_HOST_CONTROL, ERR_PTR(ret));
+		return ret;
+	}
+
+	drm_info(&gt->i915->drm, "GuC RC %s\n",
+	         enableddisabled(enable));
+
+	return 0;
+}
+
+int intel_guc_rc_enable(struct intel_guc *guc)
+{
+	return __guc_rc_control(guc, true);
+}
+
+int intel_guc_rc_disable(struct intel_guc *guc)
+{
+	return __guc_rc_control(guc, false);
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
new file mode 100644
index 000000000000..57e86c337838
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_RC_H_
+#define _INTEL_GUC_RC_H_
+
+#include "intel_guc_submission.h"
+
+void intel_guc_rc_init_early(struct intel_guc *guc);
+
+static inline bool intel_guc_rc_is_supported(struct intel_guc *guc)
+{
+	return guc->rc_supported;
+}
+
+static inline bool intel_guc_rc_is_wanted(struct intel_guc *guc)
+{
+	return guc->submission_selected && intel_guc_rc_is_supported(guc);
+}
+
+static inline bool intel_guc_rc_is_used(struct intel_guc *guc)
+{
+	return intel_guc_submission_is_used(guc) && intel_guc_rc_is_wanted(guc);
+}
+
+int intel_guc_rc_enable(struct intel_guc *guc);
+int intel_guc_rc_disable(struct intel_guc *guc);
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index 925a58ca6b94..866b462821c0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -7,6 +7,7 @@
 #define _INTEL_UC_H_
 
 #include "intel_guc.h"
+#include "intel_guc_rc.h"
 #include "intel_guc_submission.h"
 #include "intel_guc_slpc.h"
 #include "intel_huc.h"
@@ -85,6 +86,7 @@ uc_state_checkers(guc, guc);
 uc_state_checkers(huc, huc);
 uc_state_checkers(guc, guc_submission);
 uc_state_checkers(guc, guc_slpc);
+uc_state_checkers(guc, guc_rc);
 
 #undef uc_state_checkers
 #undef __uc_state_checker
-- 
2.25.0

