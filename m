Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665A3D1371
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 18:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ED06E9B3;
	Wed, 21 Jul 2021 16:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427156E9B3;
 Wed, 21 Jul 2021 16:12:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="211186393"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="211186393"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 09:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="564786856"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2021 09:12:04 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm/i915/guc/slpc: Initial definitions for SLPC
Date: Wed, 21 Jul 2021 09:11:08 -0700
Message-Id: <20210721161120.24610-3-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add macros to check for SLPC support. This feature is currently supported
for Gen12+ and enabled whenever GuC submission is enabled/selected.

Include templates for SLPC init/fini and enable.

v2: Move SLPC helper functions to intel_guc_slpc.c/.h. Define basic
template for SLPC structure in intel_guc_slpc_types.h. Fix copyright (Michal W)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

drm/i915/guc/slpc: Lay out slpc init/enable/fini

Declare init/fini and enable function templates.

v2: Rebase

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 63 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   | 33 ++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h | 15 +++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
 8 files changed, 124 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ab7679957623..d8eac4468df9 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
 	  gt/uc/intel_guc_fw.o \
 	  gt/uc/intel_guc_log.o \
 	  gt/uc/intel_guc_log_debugfs.o \
+	  gt/uc/intel_guc_slpc.o \
 	  gt/uc/intel_guc_submission.o \
 	  gt/uc/intel_huc.o \
 	  gt/uc/intel_huc_debugfs.o \
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 979128e28372..39bc3c16057b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -7,6 +7,7 @@
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_pm_irq.h"
 #include "intel_guc.h"
+#include "intel_guc_slpc.h"
 #include "intel_guc_ads.h"
 #include "intel_guc_submission.h"
 #include "i915_drv.h"
@@ -157,6 +158,7 @@ void intel_guc_init_early(struct intel_guc *guc)
 	intel_guc_ct_init_early(&guc->ct);
 	intel_guc_log_init_early(&guc->log);
 	intel_guc_submission_init_early(guc);
+	intel_guc_slpc_init_early(&guc->slpc);
 
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 9c62c68fb132..8cecfad9d7b1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -15,6 +15,7 @@
 #include "intel_guc_ct.h"
 #include "intel_guc_log.h"
 #include "intel_guc_reg.h"
+#include "intel_guc_slpc_types.h"
 #include "intel_uc_fw.h"
 #include "i915_utils.h"
 #include "i915_vma.h"
@@ -30,6 +31,7 @@ struct intel_guc {
 	struct intel_uc_fw fw;
 	struct intel_guc_log log;
 	struct intel_guc_ct ct;
+	struct intel_guc_slpc slpc;
 
 	/* Global engine used to submit requests to GuC */
 	struct i915_sched_engine *sched_engine;
@@ -57,6 +59,8 @@ struct intel_guc {
 
 	bool submission_supported;
 	bool submission_selected;
+	bool slpc_supported;
+	bool slpc_selected;
 
 	struct i915_vma *ads_vma;
 	struct __guc_ads_blob *ads_blob;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
new file mode 100644
index 000000000000..d9feb430ce35
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "i915_drv.h"
+#include "intel_guc_slpc.h"
+#include "gt/intel_gt.h"
+
+static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
+{
+	return container_of(slpc, struct intel_guc, slpc);
+}
+
+static bool __detect_slpc_supported(struct intel_guc *guc)
+{
+	/* GuC SLPC is unavailable for pre-Gen12 */
+	return guc->submission_supported &&
+		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
+}
+
+static bool __guc_slpc_selected(struct intel_guc *guc)
+{
+	if (!intel_guc_slpc_is_supported(guc))
+		return false;
+
+	return guc->submission_selected;
+}
+
+void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
+{
+	struct intel_guc *guc = slpc_to_guc(slpc);
+
+	guc->slpc_supported = __detect_slpc_supported(guc);
+	guc->slpc_selected = __guc_slpc_selected(guc);
+}
+
+int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
+{
+	return 0;
+}
+
+/*
+ * intel_guc_slpc_enable() - Start SLPC
+ * @slpc: pointer to intel_guc_slpc.
+ *
+ * SLPC is enabled by setting up the shared data structure and
+ * sending reset event to GuC SLPC. Initial data is setup in
+ * intel_guc_slpc_init. Here we send the reset event. We do
+ * not currently need a slpc_disable since this is taken care
+ * of automatically when a reset/suspend occurs and the GuC
+ * CTB is destroyed.
+ *
+ * Return: 0 on success, non-zero error code on failure.
+ */
+int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
+{
+	return 0;
+}
+
+void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
+{
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
new file mode 100644
index 000000000000..c3b0ad7f0f93
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_SLPC_H_
+#define _INTEL_GUC_SLPC_H_
+
+#include "intel_guc_submission.h"
+#include "intel_guc_slpc_types.h"
+
+static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
+{
+	return guc->slpc_supported;
+}
+
+static inline bool intel_guc_slpc_is_wanted(struct intel_guc *guc)
+{
+	return guc->slpc_selected;
+}
+
+static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
+{
+	return intel_guc_submission_is_used(guc) && intel_guc_slpc_is_wanted(guc);
+}
+
+void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
+
+int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
+int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
+void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
new file mode 100644
index 000000000000..b85148265b1f
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_SLPC_TYPES_H_
+#define _INTEL_GUC_SLPC_TYPES_H_
+
+#include <linux/types.h>
+
+struct intel_guc_slpc {
+
+};
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index da57d18d9f6b..e6bd9406c7b2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -75,16 +75,18 @@ static void __confirm_options(struct intel_uc *uc)
 	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
 
 	drm_dbg(&i915->drm,
-		"enable_guc=%d (guc:%s submission:%s huc:%s)\n",
+		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
 		i915->params.enable_guc,
 		yesno(intel_uc_wants_guc(uc)),
 		yesno(intel_uc_wants_guc_submission(uc)),
-		yesno(intel_uc_wants_huc(uc)));
+		yesno(intel_uc_wants_huc(uc)),
+		yesno(intel_uc_wants_guc_slpc(uc)));
 
 	if (i915->params.enable_guc == 0) {
 		GEM_BUG_ON(intel_uc_wants_guc(uc));
 		GEM_BUG_ON(intel_uc_wants_guc_submission(uc));
 		GEM_BUG_ON(intel_uc_wants_huc(uc));
+		GEM_BUG_ON(intel_uc_wants_guc_slpc(uc));
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
index e2da2b6e76e1..925a58ca6b94 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
@@ -8,6 +8,7 @@
 
 #include "intel_guc.h"
 #include "intel_guc_submission.h"
+#include "intel_guc_slpc.h"
 #include "intel_huc.h"
 #include "i915_params.h"
 
@@ -83,6 +84,7 @@ __uc_state_checker(x, func, uses, used)
 uc_state_checkers(guc, guc);
 uc_state_checkers(huc, huc);
 uc_state_checkers(guc, guc_submission);
+uc_state_checkers(guc, guc_slpc);
 
 #undef uc_state_checkers
 #undef __uc_state_checker
-- 
2.25.0

