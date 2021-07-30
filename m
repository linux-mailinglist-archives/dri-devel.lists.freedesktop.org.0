Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26263DB0DF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 04:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F456EEB3;
	Fri, 30 Jul 2021 02:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905426EEB1;
 Fri, 30 Jul 2021 02:01:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="193289910"
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="193289910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 19:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="664637193"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jul 2021 19:01:23 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/14] drm/i915/guc/slpc: Initial definitions for SLPC
Date: Thu, 29 Jul 2021 19:00:54 -0700
Message-Id: <20210730020107.31415-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210730020107.31415-1-vinay.belgaumkar@intel.com>
References: <20210730020107.31415-1-vinay.belgaumkar@intel.com>
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
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add macros to check for SLPC support. This feature is currently supported
for Gen12+ and enabled whenever GuC submission is enabled/selected.

Include templates for SLPC init/fini and enable.

v2: Move SLPC helper functions to intel_guc_slpc.c/.h. Define
basic template for SLPC structure in intel_guc_slpc_types.h.
Fix copyright (Michal W)

v3: Review comments (Michal W)

v4: Include supported/selected inside slpc struct (Michal W)

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 45 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   | 33 ++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h | 16 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
 8 files changed, 105 insertions(+), 2 deletions(-)
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
index a9547069ee7e..7da11a0b6059 100644
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
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
new file mode 100644
index 000000000000..40950f1bf05c
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -0,0 +1,45 @@
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
+	slpc->supported = __detect_slpc_supported(guc);
+	slpc->selected = __guc_slpc_selected(guc);
+}
+
+int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
+{
+	return 0;
+}
+
+void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
+{
+}
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
new file mode 100644
index 000000000000..bc139682ad0f
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
+	return guc->slpc.supported;
+}
+
+static inline bool intel_guc_slpc_is_wanted(struct intel_guc *guc)
+{
+	return guc->slpc.selected;
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
index 000000000000..769c162305a0
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -0,0 +1,16 @@
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
+	bool supported;
+	bool selected;
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

