Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3B81BC9D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 18:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CED510E36F;
	Thu, 21 Dec 2023 17:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD8210E361;
 Thu, 21 Dec 2023 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703178532; x=1734714532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AkxWMgw+yDJcpjwi6ib/cCtRhejLGQ2UQuetkG7rgdo=;
 b=RNc8y1e8xNZwSBQYjK3p1zoRjw94rnX88e7/YthUReu9sCe7/VMnVuQN
 mcJUW+uhsQSFwOARXKDmVuot8EAJ2xiSzW83o+88hO5NnC9n4fZZox979
 ExOKWnOvb2182Pi4DXzDLbHthGo3bFsu6RbJjQDpJf1idZROSx73iwX+e
 MoyhAa/PEP35oBVZpfH6HPvr8I52UAmQo7usbnQ455b/Hf0kZ/OJ3qj3e
 T/6KDAwFtbzX1SddWr+jpU00jg8KfOSjsP61wtKXjtTIk1LOUpAZ0GVUv
 fAyb4LFoUazQ0DscjHRHR+6cGedC9N+R5vok7BGwtgqdaxr191WCH5LtD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9382742"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="9382742"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="867377218"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="867377218"
Received: from dgiardin-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.73])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:08:47 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915/gt: Support fixed CCS mode
Date: Thu, 21 Dec 2023 18:08:22 +0100
Message-ID: <20231221170825.356970-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221170825.356970-1-andi.shyti@linux.intel.com>
References: <20231221170825.356970-1-andi.shyti@linux.intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CCS mode involves assigning CCS engines to slices depending
on the number of slices and the number of engines the user wishes
to set.

In this patch, the default CCS setting is established during the
initial GT settings. It involves assigning only one CCS to all
the slices.

Based on a patch by Chris Wilson <chris.p.wilson@linux.intel.com>
and Tejas Upadhyay <tejas.upadhyay@intel.com>.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/i915/Makefile               |  1 +
 drivers/gpu/drm/i915/gt/intel_gt.c          |  6 ++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 81 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 16 ++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 13 ++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    | 20 +++++
 drivers/gpu/drm/i915/i915_drv.h             |  2 +
 7 files changed, 139 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index e777686190ca..1dce15d6306b 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -119,6 +119,7 @@ gt-y += \
 	gt/intel_ggtt_fencing.o \
 	gt/intel_gt.o \
 	gt/intel_gt_buffer_pool.o \
+	gt/intel_gt_ccs_mode.o \
 	gt/intel_gt_clock_utils.o \
 	gt/intel_gt_debugfs.o \
 	gt/intel_gt_engines_debugfs.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index a425db5ed3a2..e83c7b80c07a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -17,6 +17,7 @@
 #include "intel_engine_regs.h"
 #include "intel_ggtt_gmch.h"
 #include "intel_gt.h"
+#include "intel_gt_ccs_mode.h"
 #include "intel_gt_buffer_pool.h"
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_debugfs.h"
@@ -47,6 +48,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
 	init_llist_head(&gt->watchdog.list);
 	INIT_WORK(&gt->watchdog.work, intel_gt_watchdog_work);
 
+	intel_gt_init_ccs_mode(gt);
 	intel_gt_init_buffer_pool(gt);
 	intel_gt_init_reset(gt);
 	intel_gt_init_requests(gt);
@@ -195,6 +197,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
 
 	intel_gt_init_swizzling(gt);
 
+	/* Configure CCS mode */
+	intel_gt_apply_ccs_mode(gt);
+
 	/*
 	 * At least 830 can leave some of the unused rings
 	 * "active" (ie. head != tail) after resume which
@@ -860,6 +865,7 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
 
 	for_each_gt(gt, i915, id) {
 		intel_uc_driver_late_release(&gt->uc);
+		intel_gt_fini_ccs_mode(gt);
 		intel_gt_fini_requests(gt);
 		intel_gt_fini_reset(gt);
 		intel_gt_fini_timelines(gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
new file mode 100644
index 000000000000..fab8a77bded2
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -0,0 +1,81 @@
+//SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915_drv.h"
+
+#include "intel_gt.h"
+#include "intel_gt_ccs_mode.h"
+#include "intel_gt_regs.h"
+#include "intel_gt_types.h"
+
+static void __intel_gt_apply_ccs_mode(struct intel_gt *gt)
+{
+	u32 mode = XEHP_CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
+	int num_slices = hweight32(CCS_MASK(gt));
+	int num_engines = gt->ccs.mode;
+	int slice = 0;
+	int i;
+
+	if (!num_engines)
+		return;
+
+	/*
+	 * Loop over all available slices and assign each a user engine.
+	 *
+	 * With 1 engine (ccs0):
+	 *   slice 0, 1, 2, 3: ccs0
+	 *
+	 * With 2 engines (ccs0, ccs1):
+	 *   slice 0, 2: ccs0
+	 *   slice 1, 3: ccs1
+	 *
+	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
+	 *   slice 0: ccs0
+	 *   slice 1: ccs1
+	 *   slice 2: ccs2
+	 *   slice 3: ccs3
+	 *
+	 * Since the number of slices and the number of engines is
+	 * known, and we ensure that there is an exact multiple of
+	 * engines for slices, the double loop becomes a loop over each
+	 * slice.
+	 */
+	for (i = num_slices / num_engines; i < num_slices; i++) {
+		struct intel_engine_cs *engine;
+		intel_engine_mask_t tmp;
+
+		for_each_engine_masked(engine, gt, ALL_CCS(gt), tmp) {
+			/* If a slice is fused off, leave disabled */
+			while (!(CCS_MASK(gt) & BIT(slice)))
+				slice++;
+
+			mode &= ~XEHP_CCS_MODE_CSLICE(slice, XEHP_CCS_MODE_CSLICE_MASK);
+			mode |= XEHP_CCS_MODE_CSLICE(slice, engine->instance);
+
+			/* assign the next slice */
+			slice++;
+		}
+	}
+
+	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
+}
+
+void intel_gt_apply_ccs_mode(struct intel_gt *gt)
+{
+	mutex_lock(&gt->ccs.mutex);
+	__intel_gt_apply_ccs_mode(gt);
+	mutex_unlock(&gt->ccs.mutex);
+}
+
+void intel_gt_init_ccs_mode(struct intel_gt *gt)
+{
+	mutex_init(&gt->ccs.mutex);
+	gt->ccs.mode = 1;
+}
+
+void intel_gt_fini_ccs_mode(struct intel_gt *gt)
+{
+	mutex_destroy(&gt->ccs.mutex);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
new file mode 100644
index 000000000000..751c5700944b
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef INTEL_GT_CCS_MODE_H
+#define INTEL_GT_CCS_MODE_H
+
+struct intel_gt;
+
+void intel_gt_init_ccs_mode(struct intel_gt *gt);
+void intel_gt_fini_ccs_mode(struct intel_gt *gt);
+
+void intel_gt_apply_ccs_mode(struct intel_gt *gt);
+
+#endif /* INTEL_GT_CCS_MODE_H */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 50962cfd1353..3e558d6d5e89 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1604,6 +1604,19 @@
 #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
 #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
 
+/*
+ * Total of 4 cslices, where each cslice is in the form:
+ *   [0-3]     CCS ID
+ *   [4-6]     RSVD
+ *   [7]       Disabled
+ */
+#define XEHP_CCS_MODE				_MMIO(0x14804)
+#define   XEHP_CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0)
+#define   XEHP_CCS_MODE_CSLICE_MASK		0x7 /* CCS0-3 + rsvd */
+#define   XEHP_CCS_MODE_CSLICE_WIDTH		ilog2(XEHP_CCS_MODE_CSLICE_MASK + 1)
+#define   XEHP_CCS_MODE_CSLICE(cslice, ccs) \
+	(ccs << (cslice * XEHP_CCS_MODE_CSLICE_WIDTH))
+
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
 #define   GEN12_HECI_2				(30)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index def7dd0eb6f1..6abd93c299c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -207,6 +207,26 @@ struct intel_gt {
 					    [MAX_ENGINE_INSTANCE + 1];
 	enum intel_submission_method submission_method;
 
+	/*
+	 * Track fixed mapping between CCS engines and compute slices.
+	 *
+	 * In order to w/a HW that has the inability to dynamically load
+	 * balance between CCS engines and EU in the compute slices, we have to
+	 * reconfigure a static mapping on the fly. We track the current CCS
+	 * configuration (determined by inspection of the user's engine
+	 * selection during execbuf) and compare it against the current
+	 * CCS_MODE (which maps CCS engines to compute slices).  If there is
+	 * only a single engine selected, we can map it to all available
+	 * compute slices for maximal single task performance (fast/narrow). If
+	 * there are more then one engine selected, we have to reduce the
+	 * number of slices allocated to each engine (wide/slow), fairly
+	 * distributing the EU between the equivalent engines.
+	 */
+	struct {
+		struct mutex mutex;
+		u32 mode;
+	} ccs;
+
 	/*
 	 * Default address space (either GGTT or ppGTT depending on arch).
 	 *
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index e81b3b2858ac..cd85889ecfe4 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -659,6 +659,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define CCS_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
 
+#define ALL_CCS(gt) (CCS_MASK(gt) << CCS0)
+
 #define HAS_MEDIA_RATIO_MODE(i915) (INTEL_INFO(i915)->has_media_ratio_mode)
 
 /*
-- 
2.43.0

