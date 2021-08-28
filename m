Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B5E3FA2D6
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 03:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7F76E9FD;
	Sat, 28 Aug 2021 01:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E22A6E9F2;
 Sat, 28 Aug 2021 01:29:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="303630226"
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="303630226"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 18:29:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="517537112"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 18:29:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 04/17] drm/i915/pxp: allocate a vcs context for pxp usage
Date: Fri, 27 Aug 2021 18:27:25 -0700
Message-Id: <20210828012738.317661-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The context is required to send the session termination commands to the
VCS, which will be implemented in a follow-up patch. We can also use the
presence of the context as a check of pxp initialization completion.

v2: use perma-pinned context (Chris)
v3: rename pinned_context functions (Chris)
v4: split export of pinned_context functions to a separate patch (Rodrigo)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/Makefile              |  4 ++
 drivers/gpu/drm/i915/gt/intel_engine.h     |  2 +
 drivers/gpu/drm/i915/gt/intel_gt.c         |  5 ++
 drivers/gpu/drm/i915/gt/intel_gt_types.h   |  3 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 62 ++++++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp.h       | 35 ++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h | 15 ++++++
 7 files changed, 126 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_types.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 23612c3a1922..157644ef5886 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -280,6 +280,10 @@ i915-y += \
 
 i915-y += i915_perf.o
 
+# Protected execution platform (PXP) support
+i915-$(CONFIG_DRM_I915_PXP) += \
+	pxp/intel_pxp.o
+
 # Post-mortem debug and GPU hang state capture
 i915-$(CONFIG_DRM_I915_CAPTURE_ERROR) += i915_gpu_error.o
 i915-$(CONFIG_DRM_I915_SELFTEST) += \
diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 87579affb952..eed4634c08cd 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -175,6 +175,8 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
 #define I915_GEM_HWS_SEQNO		0x40
 #define I915_GEM_HWS_SEQNO_ADDR		(I915_GEM_HWS_SEQNO * sizeof(u32))
 #define I915_GEM_HWS_MIGRATE		(0x42 * sizeof(u32))
+#define I915_GEM_HWS_PXP		0x60
+#define I915_GEM_HWS_PXP_ADDR		(I915_GEM_HWS_PXP * sizeof(u32))
 #define I915_GEM_HWS_SCRATCH		0x80
 
 #define I915_HWS_CSB_BUF0_INDEX		0x10
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 62d40c986642..162f48fd705f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -21,6 +21,7 @@
 #include "intel_uncore.h"
 #include "intel_pm.h"
 #include "shmem_utils.h"
+#include "pxp/intel_pxp.h"
 
 void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
 {
@@ -710,6 +711,8 @@ int intel_gt_init(struct intel_gt *gt)
 
 	intel_migrate_init(&gt->migrate, gt);
 
+	intel_pxp_init(&gt->pxp);
+
 	goto out_fw;
 err_gt:
 	__intel_gt_disable(gt);
@@ -745,6 +748,8 @@ void intel_gt_driver_unregister(struct intel_gt *gt)
 
 	intel_rps_driver_unregister(&gt->rps);
 
+	intel_pxp_fini(&gt->pxp);
+
 	/*
 	 * Upon unregistering the device to prevent any new users, cancel
 	 * all in-flight requests so that we can quickly unbind the active
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index a81e21bf1bd1..ad34c77c8571 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -26,6 +26,7 @@
 #include "intel_rps_types.h"
 #include "intel_migrate_types.h"
 #include "intel_wakeref.h"
+#include "pxp/intel_pxp_types.h"
 
 struct drm_i915_private;
 struct i915_ggtt;
@@ -192,6 +193,8 @@ struct intel_gt {
 
 		unsigned long mslice_mask;
 	} info;
+
+	struct intel_pxp pxp;
 };
 
 enum intel_gt_scratch_field {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
new file mode 100644
index 000000000000..7b2053902146
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020 Intel Corporation.
+ */
+#include "intel_pxp.h"
+#include "gt/intel_context.h"
+#include "i915_drv.h"
+
+static int create_vcs_context(struct intel_pxp *pxp)
+{
+	static struct lock_class_key pxp_lock;
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	struct intel_engine_cs *engine;
+	struct intel_context *ce;
+
+	/*
+	 * Find the first VCS engine present. We're guaranteed there is one
+	 * if we're in this function due to the check in has_pxp
+	 */
+	for (engine = gt->engine_class[VIDEO_DECODE_CLASS][0]; !engine; engine++);
+	GEM_BUG_ON(!engine || engine->class != VIDEO_DECODE_CLASS);
+
+	ce = intel_engine_create_pinned_context(engine, engine->gt->vm, SZ_4K,
+						I915_GEM_HWS_PXP_ADDR,
+						&pxp_lock, "pxp_context");
+	if (IS_ERR(ce)) {
+		drm_err(&gt->i915->drm, "failed to create VCS ctx for PXP\n");
+		return PTR_ERR(ce);
+	}
+
+	pxp->ce = ce;
+
+	return 0;
+}
+
+static void destroy_vcs_context(struct intel_pxp *pxp)
+{
+	intel_engine_destroy_pinned_context(fetch_and_zero(&pxp->ce));
+}
+
+void intel_pxp_init(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	int ret;
+
+	if (!HAS_PXP(gt->i915))
+		return;
+
+	ret = create_vcs_context(pxp);
+	if (ret)
+		return;
+
+	drm_info(&gt->i915->drm, "Protected Xe Path (PXP) protected content support initialized\n");
+}
+
+void intel_pxp_fini(struct intel_pxp *pxp)
+{
+	if (!intel_pxp_is_enabled(pxp))
+		return;
+
+	destroy_vcs_context(pxp);
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
new file mode 100644
index 000000000000..e87550fb9821
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_H__
+#define __INTEL_PXP_H__
+
+#include "gt/intel_gt_types.h"
+#include "intel_pxp_types.h"
+
+static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
+{
+	return container_of(pxp, struct intel_gt, pxp);
+}
+
+static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
+{
+	return pxp->ce;
+}
+
+#ifdef CONFIG_DRM_I915_PXP
+void intel_pxp_init(struct intel_pxp *pxp);
+void intel_pxp_fini(struct intel_pxp *pxp);
+#else
+static inline void intel_pxp_init(struct intel_pxp *pxp)
+{
+}
+
+static inline void intel_pxp_fini(struct intel_pxp *pxp)
+{
+}
+#endif
+
+#endif /* __INTEL_PXP_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
new file mode 100644
index 000000000000..bd12c520e60a
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_TYPES_H__
+#define __INTEL_PXP_TYPES_H__
+
+struct intel_context;
+
+struct intel_pxp {
+	struct intel_context *ce;
+};
+
+#endif /* __INTEL_PXP_TYPES_H__ */
-- 
2.25.1

