Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A640426D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 02:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4077C6E405;
	Thu,  9 Sep 2021 00:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C446E3EF;
 Thu,  9 Sep 2021 00:51:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200171453"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="200171453"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 17:50:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="539077201"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 17:50:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Date: Wed,  8 Sep 2021 17:49:40 -0700
Message-Id: <20210909004941.379035-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210909004941.379035-1-lucas.demarchi@intel.com>
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We shouldn't be using debugfs_ namespace for this functionality. Rename
debugfs_gt_pm.[ch] to intel_gt_pm_debugfs.[ch] and then make
functions, defines and structs follow suit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/Makefile                      |  2 +-
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h            | 14 --------------
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |  4 ++--
 .../gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c}  |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      | 14 ++++++++++++++
 5 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
 rename drivers/gpu/drm/i915/gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c} (99%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 232c9673a2e5..dd656f2d7721 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -79,7 +79,6 @@ i915-$(CONFIG_PERF_EVENTS) += i915_pmu.o
 
 # "Graphics Technology" (aka we talk to the gpu)
 gt-y += \
-	gt/debugfs_gt_pm.o \
 	gt/gen2_engine_cs.o \
 	gt/gen6_engine_cs.o \
 	gt/gen6_ppgtt.o \
@@ -103,6 +102,7 @@ gt-y += \
 	gt/intel_gt_engines_debugfs.o \
 	gt/intel_gt_irq.o \
 	gt/intel_gt_pm.o \
+	gt/intel_gt_pm_debugfs.o \
 	gt/intel_gt_pm_irq.o \
 	gt/intel_gt_requests.o \
 	gt/intel_gtt.o \
diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
deleted file mode 100644
index 4cf5f5c9da7d..000000000000
--- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef DEBUGFS_GT_PM_H
-#define DEBUGFS_GT_PM_H
-
-struct intel_gt;
-struct dentry;
-
-void debugfs_gt_pm_register(struct intel_gt *gt, struct dentry *root);
-
-#endif /* DEBUGFS_GT_PM_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index e5d173c235a3..4096ee893b69 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -5,10 +5,10 @@
 
 #include <linux/debugfs.h>
 
-#include "debugfs_gt_pm.h"
 #include "i915_drv.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_engines_debugfs.h"
+#include "intel_gt_pm_debugfs.h"
 #include "intel_sseu_debugfs.h"
 #include "uc/intel_uc_debugfs.h"
 
@@ -24,7 +24,7 @@ void intel_gt_register_debugfs(struct intel_gt *gt)
 		return;
 
 	intel_gt_engines_register_debugfs(gt, root);
-	debugfs_gt_pm_register(gt, root);
+	intel_gt_pm_register_debugfs(gt, root);
 	intel_sseu_debugfs_register(gt, root);
 
 	intel_uc_debugfs_register(&gt->uc, root);
diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
similarity index 99%
rename from drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
rename to drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 9222cf68c56c..baca153c05dd 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -6,12 +6,12 @@
 
 #include <linux/seq_file.h>
 
-#include "debugfs_gt_pm.h"
 #include "i915_drv.h"
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_pm.h"
+#include "intel_gt_pm_debugfs.h"
 #include "intel_llc.h"
 #include "intel_rc6.h"
 #include "intel_rps.h"
@@ -614,7 +614,7 @@ static bool rps_eval(void *data)
 
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(rps_boost);
 
-void debugfs_gt_pm_register(struct intel_gt *gt, struct dentry *root)
+void intel_gt_pm_register_debugfs(struct intel_gt *gt, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
 		{ "drpc", &drpc_fops, NULL },
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
new file mode 100644
index 000000000000..f44894579604
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef INTEL_GT_PM_DEBUGFS_H
+#define INTEL_GT_PM_DEBUGFS_H
+
+struct intel_gt;
+struct dentry;
+
+void intel_gt_pm_register_debugfs(struct intel_gt *gt, struct dentry *root);
+
+#endif /* INTEL_GT_PM_DEBUGFS_H */
-- 
2.32.0

