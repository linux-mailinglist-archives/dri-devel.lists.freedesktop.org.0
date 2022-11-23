Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81329636A18
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F185D10E244;
	Wed, 23 Nov 2022 19:51:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A7A10E602;
 Wed, 23 Nov 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669233090; x=1700769090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dqQk6c76UlV+XYBTd03kiUGshgQr25lhunOx9PeoWi0=;
 b=khSexHGXXSlD4z2E7xc9c7noe8DcL7yu1kckB0H/nl7P05Bo/A0mgBbK
 2sSuvWtFKK24ImzR4RByJqga+be/uw3qTgss8kZHRGGw+r0Xl1zrbi0LM
 9OT1zpXXg59NJXx26zOCEmrPsnhocrRmgPs9MZ58opGlb7OnxAc7/qDvV
 Yh7sYiGGgG62GX4H+5Le/YOygO51FodwZYzQ9X72KP0xviKOXOsaK5shX
 fYABItaFU4jgdzmm6tJoORIyH4o9EmwdRCetcGfrSIsTGlFdqH0LPP87e
 WFgbR/xQAUCstvER50q8c2488OAM9hB8V2mbawIIIs8vu6qVv+4bNlSHQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="312846852"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="312846852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 11:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="816597788"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="816597788"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 11:51:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 1/5] drm/i915/gt: Start adding module oriented dmesg output
Date: Wed, 23 Nov 2022 11:51:19 -0800
Message-Id: <20221123195123.1525100-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
References: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

When trying to analyse bug reports from CI, customers, etc. it can be
difficult to work out exactly what is happening on which GT in a
multi-GT system. So add GT oriented debug/error message wrappers. If
used instead of the drm_ equivalents, you get the same output but with
a GT# prefix on it.

v2: Go back to using lower case names (combined review feedback).
Convert intel_gt.c as a first step.
v3: Add gt_err_ratelimited() as well, undo one conversation that might
not have a GT pointer in some scenarios (review feedback from Michal W).
Split definitions into separate header (review feedback from Jani).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c       | 96 ++++++++++++------------
 drivers/gpu/drm/i915/gt/intel_gt_print.h | 51 +++++++++++++
 2 files changed, 97 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index b5ad9caa55372..f153003120997 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -23,6 +23,7 @@
 #include "intel_gt_debugfs.h"
 #include "intel_gt_mcr.h"
 #include "intel_gt_pm.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_requests.h"
 #include "intel_migrate.h"
@@ -90,9 +91,8 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
 		if (err == -ENODEV)
 			return 0;
 
-		drm_err(&i915->drm,
-			"Failed to setup region(%d) type=%d\n",
-			err, INTEL_MEMORY_LOCAL);
+		gt_err(gt, "Failed to setup region(%d) type=%d\n",
+		       err, INTEL_MEMORY_LOCAL);
 		return err;
 	}
 
@@ -192,14 +192,14 @@ int intel_gt_init_hw(struct intel_gt *gt)
 
 	ret = i915_ppgtt_init_hw(gt);
 	if (ret) {
-		drm_err(&i915->drm, "Enabling PPGTT failed (%d)\n", ret);
+		gt_err(gt, "Enabling PPGTT failed (%d)\n", ret);
 		goto out;
 	}
 
 	/* We can't enable contexts until all firmware is loaded */
 	ret = intel_uc_init_hw(&gt->uc);
 	if (ret) {
-		i915_probe_error(i915, "Enabling uc failed (%d)\n", ret);
+		gt_probe_error(gt, "Enabling uc failed (%d)\n", ret);
 		goto out;
 	}
 
@@ -264,7 +264,7 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
 		 * some errors might have become stuck,
 		 * mask them.
 		 */
-		drm_dbg(&gt->i915->drm, "EIR stuck: 0x%08x, masking\n", eir);
+		gt_dbg(gt, "EIR stuck: 0x%08x, masking\n", eir);
 		rmw_set(uncore, EMR, eir);
 		intel_uncore_write(uncore, GEN2_IIR,
 				   I915_MASTER_ERROR_INTERRUPT);
@@ -298,16 +298,16 @@ static void gen6_check_faults(struct intel_gt *gt)
 	for_each_engine(engine, gt, id) {
 		fault = GEN6_RING_FAULT_REG_READ(engine);
 		if (fault & RING_FAULT_VALID) {
-			drm_dbg(&engine->i915->drm, "Unexpected fault\n"
-				"\tAddr: 0x%08lx\n"
-				"\tAddress space: %s\n"
-				"\tSource ID: %d\n"
-				"\tType: %d\n",
-				fault & PAGE_MASK,
-				fault & RING_FAULT_GTTSEL_MASK ?
-				"GGTT" : "PPGTT",
-				RING_FAULT_SRCID(fault),
-				RING_FAULT_FAULT_TYPE(fault));
+			gt_dbg(gt, "Unexpected fault\n"
+			       "\tAddr: 0x%08lx\n"
+			       "\tAddress space: %s\n"
+			       "\tSource ID: %d\n"
+			       "\tType: %d\n",
+			       fault & PAGE_MASK,
+			       fault & RING_FAULT_GTTSEL_MASK ?
+			       "GGTT" : "PPGTT",
+			       RING_FAULT_SRCID(fault),
+			       RING_FAULT_FAULT_TYPE(fault));
 		}
 	}
 }
@@ -334,17 +334,17 @@ static void xehp_check_faults(struct intel_gt *gt)
 		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
 			     ((u64)fault_data0 << 12);
 
-		drm_dbg(&gt->i915->drm, "Unexpected fault\n"
-			"\tAddr: 0x%08x_%08x\n"
-			"\tAddress space: %s\n"
-			"\tEngine ID: %d\n"
-			"\tSource ID: %d\n"
-			"\tType: %d\n",
-			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
-			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
-			GEN8_RING_FAULT_ENGINE_ID(fault),
-			RING_FAULT_SRCID(fault),
-			RING_FAULT_FAULT_TYPE(fault));
+		gt_dbg(gt, "Unexpected fault\n"
+		       "\tAddr: 0x%08x_%08x\n"
+		       "\tAddress space: %s\n"
+		       "\tEngine ID: %d\n"
+		       "\tSource ID: %d\n"
+		       "\tType: %d\n",
+		       upper_32_bits(fault_addr), lower_32_bits(fault_addr),
+		       fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
+		       GEN8_RING_FAULT_ENGINE_ID(fault),
+		       RING_FAULT_SRCID(fault),
+		       RING_FAULT_FAULT_TYPE(fault));
 	}
 }
 
@@ -375,17 +375,17 @@ static void gen8_check_faults(struct intel_gt *gt)
 		fault_addr = ((u64)(fault_data1 & FAULT_VA_HIGH_BITS) << 44) |
 			     ((u64)fault_data0 << 12);
 
-		drm_dbg(&uncore->i915->drm, "Unexpected fault\n"
-			"\tAddr: 0x%08x_%08x\n"
-			"\tAddress space: %s\n"
-			"\tEngine ID: %d\n"
-			"\tSource ID: %d\n"
-			"\tType: %d\n",
-			upper_32_bits(fault_addr), lower_32_bits(fault_addr),
-			fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
-			GEN8_RING_FAULT_ENGINE_ID(fault),
-			RING_FAULT_SRCID(fault),
-			RING_FAULT_FAULT_TYPE(fault));
+		gt_dbg(gt, "Unexpected fault\n"
+		       "\tAddr: 0x%08x_%08x\n"
+		       "\tAddress space: %s\n"
+		       "\tEngine ID: %d\n"
+		       "\tSource ID: %d\n"
+		       "\tType: %d\n",
+		       upper_32_bits(fault_addr), lower_32_bits(fault_addr),
+		       fault_data1 & FAULT_GTT_SEL ? "GGTT" : "PPGTT",
+		       GEN8_RING_FAULT_ENGINE_ID(fault),
+		       RING_FAULT_SRCID(fault),
+		       RING_FAULT_FAULT_TYPE(fault));
 	}
 }
 
@@ -479,7 +479,7 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_internal(i915, size);
 	if (IS_ERR(obj)) {
-		drm_err(&i915->drm, "Failed to allocate scratch page\n");
+		gt_err(gt, "Failed to allocate scratch page\n");
 		return PTR_ERR(obj);
 	}
 
@@ -729,8 +729,7 @@ int intel_gt_init(struct intel_gt *gt)
 
 	err = intel_gt_init_hwconfig(gt);
 	if (err)
-		drm_err(&gt->i915->drm, "Failed to retrieve hwconfig table: %pe\n",
-			ERR_PTR(err));
+		gt_err(gt, "Failed to retrieve hwconfig table: %pe\n", ERR_PTR(err));
 
 	err = __engines_record_defaults(gt);
 	if (err)
@@ -891,7 +890,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	gt->name = "Primary GT";
 	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
 
-	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
+	gt_dbg(gt, "Setting up %s\n", gt->name);
 	ret = intel_gt_tile_setup(gt, phys_addr);
 	if (ret)
 		return ret;
@@ -916,7 +915,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 		gt->info.engine_mask = gtdef->engine_mask;
 		gt->info.id = i;
 
-		drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
+		gt_dbg(gt, "Setting up %s\n", gt->name);
 		if (GEM_WARN_ON(range_overflows_t(resource_size_t,
 						  gtdef->mapping_base,
 						  SZ_16M,
@@ -1004,8 +1003,7 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
 	const unsigned int class = engine->class;
 	struct reg_and_bit rb = { };
 
-	if (drm_WARN_ON_ONCE(&engine->i915->drm,
-			     class >= num || !regs[class].reg))
+	if (gt_WARN_ON_ONCE(engine->gt, class >= num || !regs[class].reg))
 		return rb;
 
 	rb.reg = regs[class];
@@ -1088,8 +1086,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 		return;
 	}
 
-	if (drm_WARN_ONCE(&i915->drm, !num,
-			  "Platform does not implement TLB invalidation!"))
+	if (gt_WARN_ONCE(gt, !num, "Platform does not implement TLB invalidation!"))
 		return;
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
@@ -1141,9 +1138,8 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 		}
 
 		if (wait_for_invalidate(gt, rb))
-			drm_err_ratelimited(&gt->i915->drm,
-					    "%s TLB invalidation did not complete in %ums!\n",
-					    engine->name, TLB_INVAL_TIMEOUT_MS);
+			gt_err_ratelimited(gt, "%s TLB invalidation did not complete in %ums!\n",
+					   engine->name, TLB_INVAL_TIMEOUT_MS);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
new file mode 100644
index 0000000000000..0d53c95901b38
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __INTEL_GT_PRINT__
+#define __INTEL_GT_PRINT__
+
+#include <drm/drm_print.h>
+#include "intel_gt_types.h"
+#include "i915_utils.h"
+
+#define gt_err(_gt, _fmt, ...) \
+	drm_err(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_warn(_gt, _fmt, ...) \
+	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_notice(_gt, _fmt, ...) \
+	drm_notice(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_info(_gt, _fmt, ...) \
+	drm_info(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_dbg(_gt, _fmt, ...) \
+	drm_dbg(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_err_ratelimited(_gt, _fmt, ...) \
+	drm_err_ratelimited(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_probe_error(_gt, _fmt, ...) \
+	do { \
+		if (i915_error_injected()) \
+			gt_dbg(_gt, _fmt, ##__VA_ARGS__); \
+		else \
+			gt_err(_gt, _fmt, ##__VA_ARGS__); \
+	} while (0)
+
+#define gt_WARN_ON(_gt, _condition) \
+	gt_WARN(_gt, _condition, "%s", "gt_WARN_ON(" __stringify(_condition) ")")
+
+#define gt_WARN_ON_ONCE(_gt, _condition) \
+	gt_WARN_ONCE(_gt, _condition, "%s", "gt_WARN_ONCE(" __stringify(_condition) ")")
+
+#define gt_WARN(_gt, _condition, _fmt, ...) \
+	drm_WARN(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
+	drm_WARN_ONCE(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#endif /* __INTEL_GT_H__ */
-- 
2.37.3

