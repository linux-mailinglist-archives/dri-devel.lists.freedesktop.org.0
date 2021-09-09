Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F540426A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 02:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423976E3F5;
	Thu,  9 Sep 2021 00:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C086E3F0;
 Thu,  9 Sep 2021 00:51:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200171452"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="200171452"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 17:50:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="539077196"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 17:50:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 2/4] drm/i915: rename debugfs_engines files
Date: Wed,  8 Sep 2021 17:49:39 -0700
Message-Id: <20210909004941.379035-2-lucas.demarchi@intel.com>
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
debugfs_engines.[ch] to intel_gt_engines_debugfs.[ch] and then make
functions, defines and structs follow suit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/Makefile                      |  2 +-
 drivers/gpu/drm/i915/gt/debugfs_engines.h          | 14 --------------
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |  4 ++--
 ...ebugfs_engines.c => intel_gt_engines_debugfs.c} |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h | 14 ++++++++++++++
 5 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_engines.h
 rename drivers/gpu/drm/i915/gt/{debugfs_engines.c => intel_gt_engines_debugfs.c} (85%)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3e171f0b5f6a..232c9673a2e5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -79,7 +79,6 @@ i915-$(CONFIG_PERF_EVENTS) += i915_pmu.o
 
 # "Graphics Technology" (aka we talk to the gpu)
 gt-y += \
-	gt/debugfs_engines.o \
 	gt/debugfs_gt_pm.o \
 	gt/gen2_engine_cs.o \
 	gt/gen6_engine_cs.o \
@@ -101,6 +100,7 @@ gt-y += \
 	gt/intel_gt_buffer_pool.o \
 	gt/intel_gt_clock_utils.o \
 	gt/intel_gt_debugfs.o \
+	gt/intel_gt_engines_debugfs.o \
 	gt/intel_gt_irq.o \
 	gt/intel_gt_pm.o \
 	gt/intel_gt_pm_irq.o \
diff --git a/drivers/gpu/drm/i915/gt/debugfs_engines.h b/drivers/gpu/drm/i915/gt/debugfs_engines.h
deleted file mode 100644
index f69257eaa1cc..000000000000
--- a/drivers/gpu/drm/i915/gt/debugfs_engines.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef DEBUGFS_ENGINES_H
-#define DEBUGFS_ENGINES_H
-
-struct intel_gt;
-struct dentry;
-
-void debugfs_engines_register(struct intel_gt *gt, struct dentry *root);
-
-#endif /* DEBUGFS_ENGINES_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index a27ba11605d8..e5d173c235a3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -5,10 +5,10 @@
 
 #include <linux/debugfs.h>
 
-#include "debugfs_engines.h"
 #include "debugfs_gt_pm.h"
 #include "i915_drv.h"
 #include "intel_gt_debugfs.h"
+#include "intel_gt_engines_debugfs.h"
 #include "intel_sseu_debugfs.h"
 #include "uc/intel_uc_debugfs.h"
 
@@ -23,7 +23,7 @@ void intel_gt_register_debugfs(struct intel_gt *gt)
 	if (IS_ERR(root))
 		return;
 
-	debugfs_engines_register(gt, root);
+	intel_gt_engines_register_debugfs(gt, root);
 	debugfs_gt_pm_register(gt, root);
 	intel_sseu_debugfs_register(gt, root);
 
diff --git a/drivers/gpu/drm/i915/gt/debugfs_engines.c b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
similarity index 85%
rename from drivers/gpu/drm/i915/gt/debugfs_engines.c
rename to drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
index 2980dac5b171..44b22384fcb2 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
@@ -6,10 +6,10 @@
 
 #include <drm/drm_print.h>
 
-#include "debugfs_engines.h"
 #include "i915_drv.h" /* for_each_engine! */
 #include "intel_engine.h"
 #include "intel_gt_debugfs.h"
+#include "intel_gt_engines_debugfs.h"
 
 static int engines_show(struct seq_file *m, void *data)
 {
@@ -26,7 +26,7 @@ static int engines_show(struct seq_file *m, void *data)
 }
 DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(engines);
 
-void debugfs_engines_register(struct intel_gt *gt, struct dentry *root)
+void intel_gt_engines_register_debugfs(struct intel_gt *gt, struct dentry *root)
 {
 	static const struct intel_gt_debugfs_file files[] = {
 		{ "engines", &engines_fops },
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h
new file mode 100644
index 000000000000..4163b496937b
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef INTEL_GT_ENGINES_DEBUGFS_H
+#define INTEL_GT_ENGINES_DEBUGFS_H
+
+struct intel_gt;
+struct dentry;
+
+void intel_gt_engines_register_debugfs(struct intel_gt *gt, struct dentry *root);
+
+#endif /* INTEL_GT_ENGINES_DEBUGFS_H */
-- 
2.32.0

