Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBFE66645C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 21:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCCC10E805;
	Wed, 11 Jan 2023 20:05:04 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318BA10E804;
 Wed, 11 Jan 2023 20:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673467501; x=1705003501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=idcqghbny+4BOLdSgtuBg8wUHKIm0qZ7guk71r4S6aQ=;
 b=WJEKZXnH+5HqV/rzbwlfnyjMdbq24gn3oT0nxsQjAF3fQiV5jhicq912
 ljik72MirmJVLL4BEBm70/qtkZPTTDQGV9Qp2P5jOQPu8H7emUUpwcKS0
 sEGsczg20+HUoa5Ju2SB18jLMhFInCRNqZY9Yhz2tACX3KRUONEkqHHbu
 PaTETnVZ6EoxBJ+JpEQPHxmcLw+29T0XmTdl+6zL0dn09V1RGMzPWkSa5
 nP2M5mzq8XajoAeGPH9cqfH6rrZg7aRJ2VGdim4upgekd0lGKJHLEfs+W
 pBlp0Doh2nCE91nFpkEttwzoHknov2lJtDp7gYO9wZJ2HodjN5V1YfgXC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="307047471"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="307047471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 12:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="689878684"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="689878684"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 11 Jan 2023 12:05:00 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 1/1] drm/i915/gt: Start adding module oriented dmesg output
Date: Wed, 11 Jan 2023 12:04:29 -0800
Message-Id: <20230111200429.2139084-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111200429.2139084-1-John.C.Harrison@Intel.com>
References: <20230111200429.2139084-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
Convert all intel_gt*.c files.
v4: Re-order some macro definitions (Andi S), update (c) date (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            | 96 +++++++++----------
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |  8 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_print.h      | 51 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 34 ++-----
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  7 +-
 9 files changed, 129 insertions(+), 98 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 5721bf85d1197..f0dbfc434e077 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -22,6 +22,7 @@
 #include "intel_gt_debugfs.h"
 #include "intel_gt_mcr.h"
 #include "intel_gt_pm.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_requests.h"
 #include "intel_migrate.h"
@@ -89,9 +90,8 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
 		if (err == -ENODEV)
 			return 0;
 
-		drm_err(&i915->drm,
-			"Failed to setup region(%d) type=%d\n",
-			err, INTEL_MEMORY_LOCAL);
+		gt_err(gt, "Failed to setup region(%d) type=%d\n",
+		       err, INTEL_MEMORY_LOCAL);
 		return err;
 	}
 
@@ -200,14 +200,14 @@ int intel_gt_init_hw(struct intel_gt *gt)
 
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
 
@@ -257,7 +257,7 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
 		 * some errors might have become stuck,
 		 * mask them.
 		 */
-		drm_dbg(&gt->i915->drm, "EIR stuck: 0x%08x, masking\n", eir);
+		gt_dbg(gt, "EIR stuck: 0x%08x, masking\n", eir);
 		intel_uncore_rmw(uncore, EMR, 0, eir);
 		intel_uncore_write(uncore, GEN2_IIR,
 				   I915_MASTER_ERROR_INTERRUPT);
@@ -291,16 +291,16 @@ static void gen6_check_faults(struct intel_gt *gt)
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
@@ -327,17 +327,17 @@ static void xehp_check_faults(struct intel_gt *gt)
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
 
@@ -368,17 +368,17 @@ static void gen8_check_faults(struct intel_gt *gt)
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
 
@@ -472,7 +472,7 @@ static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
 	if (IS_ERR(obj))
 		obj = i915_gem_object_create_internal(i915, size);
 	if (IS_ERR(obj)) {
-		drm_err(&i915->drm, "Failed to allocate scratch page\n");
+		gt_err(gt, "Failed to allocate scratch page\n");
 		return PTR_ERR(obj);
 	}
 
@@ -727,8 +727,7 @@ int intel_gt_init(struct intel_gt *gt)
 
 	err = intel_gt_init_hwconfig(gt);
 	if (err)
-		drm_err(&gt->i915->drm, "Failed to retrieve hwconfig table: %pe\n",
-			ERR_PTR(err));
+		gt_err(gt, "Failed to retrieve hwconfig table: %pe\n", ERR_PTR(err));
 
 	err = __engines_record_defaults(gt);
 	if (err)
@@ -885,7 +884,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	gt->name = "Primary GT";
 	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
 
-	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
+	gt_dbg(gt, "Setting up %s\n", gt->name);
 	ret = intel_gt_tile_setup(gt, phys_addr);
 	if (ret)
 		return ret;
@@ -910,7 +909,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 		gt->info.engine_mask = gtdef->engine_mask;
 		gt->info.id = i;
 
-		drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
+		gt_dbg(gt, "Setting up %s\n", gt->name);
 		if (GEM_WARN_ON(range_overflows_t(resource_size_t,
 						  gtdef->mapping_base,
 						  SZ_16M,
@@ -998,8 +997,7 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
 	const unsigned int class = engine->class;
 	struct reg_and_bit rb = { };
 
-	if (drm_WARN_ON_ONCE(&engine->i915->drm,
-			     class >= num || !regs[class].reg))
+	if (gt_WARN_ON_ONCE(engine->gt, class >= num || !regs[class].reg))
 		return rb;
 
 	rb.reg = regs[class];
@@ -1096,8 +1094,7 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 		return;
 	}
 
-	if (drm_WARN_ONCE(&i915->drm, !num,
-			  "Platform does not implement TLB invalidation!"))
+	if (gt_WARN_ONCE(gt, !num, "Platform does not implement TLB invalidation!"))
 		return;
 
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
@@ -1162,9 +1159,8 @@ static void mmio_invalidate_full(struct intel_gt *gt)
 		}
 
 		if (wait_for_invalidate(gt, rb))
-			drm_err_ratelimited(&gt->i915->drm,
-					    "%s TLB invalidation did not complete in %ums!\n",
-					    engine->name, TLB_INVAL_TIMEOUT_MS);
+			gt_err_ratelimited(gt, "%s TLB invalidation did not complete in %ums!\n",
+					   engine->name, TLB_INVAL_TIMEOUT_MS);
 	}
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
index 2a6a4ca7fdad6..7c9be4fd1c8c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
@@ -7,6 +7,7 @@
 #include "i915_reg.h"
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 
 static u32 read_reference_ts_freq(struct intel_uncore *uncore)
@@ -193,10 +194,9 @@ void intel_gt_init_clock_frequency(struct intel_gt *gt)
 void intel_gt_check_clock_frequency(const struct intel_gt *gt)
 {
 	if (gt->clock_frequency != read_clock_frequency(gt->uncore)) {
-		dev_err(gt->i915->drm.dev,
-			"GT clock frequency changed, was %uHz, now %uHz!\n",
-			gt->clock_frequency,
-			read_clock_frequency(gt->uncore));
+		gt_err(gt, "GT clock frequency changed, was %uHz, now %uHz!\n",
+		       gt->clock_frequency,
+		       read_clock_frequency(gt->uncore));
 	}
 }
 #endif
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 8fac2660e16b8..1b25a60391522 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -10,6 +10,7 @@
 #include "intel_breadcrumbs.h"
 #include "intel_gt.h"
 #include "intel_gt_irq.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_uncore.h"
 #include "intel_rps.h"
@@ -47,9 +48,8 @@ gen11_gt_engine_identity(struct intel_gt *gt,
 		 !time_after32(local_clock() >> 10, timeout_ts));
 
 	if (unlikely(!(ident & GEN11_INTR_DATA_VALID))) {
-		drm_err(&gt->i915->drm,
-			"INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
-			bank, bit, ident);
+		gt_err(gt, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
+		       bank, bit, ident);
 		return 0;
 	}
 
@@ -378,8 +378,7 @@ void gen6_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
 	if (gt_iir & (GT_BLT_CS_ERROR_INTERRUPT |
 		      GT_BSD_CS_ERROR_INTERRUPT |
 		      GT_CS_MASTER_ERROR_INTERRUPT))
-		drm_dbg(&gt->i915->drm, "Command parser error, gt_iir 0x%08x\n",
-			gt_iir);
+		gt_dbg(gt, "Command parser error, gt_iir 0x%08x\n", gt_iir);
 
 	if (gt_iir & GT_PARITY_ERROR(gt->i915))
 		gen7_parity_error_irq_handler(gt, gt_iir);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 4127830c33ca3..169393a7ad88b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 
 #include "intel_gt_mcr.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 
 /**
@@ -158,7 +159,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			 GEN12_MEML3_EN_MASK);
 
 		if (!gt->info.mslice_mask) /* should be impossible! */
-			drm_warn(&i915->drm, "mslice mask all zero!\n");
+			gt_warn(gt, "mslice mask all zero!\n");
 	}
 
 	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
@@ -205,7 +206,7 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			~intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			GEN10_L3BANK_MASK;
 		if (!gt->info.l3bank_mask) /* should be impossible! */
-			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
+			gt_warn(gt, "L3 bank mask is all zero!\n");
 	} else if (GRAPHICS_VER(i915) >= 11) {
 		/*
 		 * We expect all modern platforms to have at least some
@@ -394,9 +395,7 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
 	 * releasing it properly.
 	 */
 	if (err == -ETIMEDOUT) {
-		drm_err_ratelimited(&gt->i915->drm,
-				    "GT%u hardware MCR steering semaphore timed out",
-				    gt->info.id);
+		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
 		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
 	}
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index c065950d0bade..cef3d6f5c34e0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -14,6 +14,7 @@
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_pm.h"
+#include "intel_gt_print.h"
 #include "intel_gt_requests.h"
 #include "intel_llc.h"
 #include "intel_pm.h"
@@ -275,8 +276,7 @@ int intel_gt_resume(struct intel_gt *gt)
 	/* Only when the HW is re-initialised, can we replay the requests */
 	err = intel_gt_init_hw(gt);
 	if (err) {
-		i915_probe_error(gt->i915,
-				 "Failed to initialize GPU, declaring it wedged!\n");
+		gt_probe_error(gt, "Failed to initialize GPU, declaring it wedged!\n");
 		goto err_wedged;
 	}
 
@@ -293,9 +293,8 @@ int intel_gt_resume(struct intel_gt *gt)
 
 		intel_engine_pm_put(engine);
 		if (err) {
-			drm_err(&gt->i915->drm,
-				"Failed to restart %s (%d)\n",
-				engine->name, err);
+			gt_err(gt, "Failed to restart %s (%d)\n",
+			       engine->name, err);
 			goto err_wedged;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
new file mode 100644
index 0000000000000..5d9da355ce242
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
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
+#define gt_WARN(_gt, _condition, _fmt, ...) \
+	drm_WARN(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
+	drm_WARN_ONCE(&(_gt)->i915->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define gt_WARN_ON(_gt, _condition) \
+	gt_WARN(_gt, _condition, "%s", "gt_WARN_ON(" __stringify(_condition) ")")
+
+#define gt_WARN_ON_ONCE(_gt, _condition) \
+	gt_WARN_ONCE(_gt, _condition, "%s", "gt_WARN_ONCE(" __stringify(_condition) ")")
+
+#endif /* __INTEL_GT_PRINT_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index 9486dd3bed991..6629e4c72b6bb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 #include "i915_sysfs.h"
 #include "intel_gt.h"
+#include "intel_gt_print.h"
 #include "intel_gt_sysfs.h"
 #include "intel_gt_sysfs_pm.h"
 #include "intel_gt_types.h"
@@ -105,8 +106,7 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 
 exit_fail:
 	kobject_put(&gt->sysfs_gt);
-	drm_warn(&gt->i915->drm,
-		 "failed to initialize gt%d sysfs root\n", gt->info.id);
+	gt_warn(gt, "failed to initialize sysfs root\n");
 }
 
 void intel_gt_sysfs_unregister(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 09b9365ededd3..28f27091cd3b7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -11,6 +11,7 @@
 #include "i915_reg.h"
 #include "i915_sysfs.h"
 #include "intel_gt.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
 #include "intel_gt_sysfs_pm.h"
@@ -304,9 +305,7 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
 
 	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
 	if (ret)
-		drm_warn(&gt->i915->drm,
-			 "failed to create gt%u RC6 sysfs files (%pe)\n",
-			 gt->info.id, ERR_PTR(ret));
+		gt_warn(gt, "failed to create RC6 sysfs files (%pe)\n", ERR_PTR(ret));
 
 	/*
 	 * cannot use the is_visible() attribute because
@@ -315,17 +314,13 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
 	if (HAS_RC6p(gt->i915)) {
 		ret = __intel_gt_sysfs_create_group(kobj, rc6p_attr_group);
 		if (ret)
-			drm_warn(&gt->i915->drm,
-				 "failed to create gt%u RC6p sysfs files (%pe)\n",
-				 gt->info.id, ERR_PTR(ret));
+			gt_warn(gt, "failed to create RC6p sysfs files (%pe)\n", ERR_PTR(ret));
 	}
 
 	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915)) {
 		ret = __intel_gt_sysfs_create_group(kobj, media_rc6_attr_group);
 		if (ret)
-			drm_warn(&gt->i915->drm,
-				 "failed to create media %u RC6 sysfs files (%pe)\n",
-				 gt->info.id, ERR_PTR(ret));
+			gt_warn(gt, "failed to create media RC6 sysfs files (%pe)\n", ERR_PTR(ret));
 	}
 }
 
@@ -739,9 +734,7 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 
 	ret = intel_sysfs_rps_init(gt, kobj);
 	if (ret)
-		drm_warn(&gt->i915->drm,
-			 "failed to create gt%u RPS sysfs files (%pe)",
-			 gt->info.id, ERR_PTR(ret));
+		gt_warn(gt, "failed to create RPS sysfs files (%pe)", ERR_PTR(ret));
 
 	/* end of the legacy interfaces */
 	if (!is_object_gt(kobj))
@@ -749,29 +742,22 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 
 	ret = sysfs_create_file(kobj, &attr_punit_req_freq_mhz.attr);
 	if (ret)
-		drm_warn(&gt->i915->drm,
-			 "failed to create gt%u punit_req_freq_mhz sysfs (%pe)",
-			 gt->info.id, ERR_PTR(ret));
+		gt_warn(gt, "failed to create punit_req_freq_mhz sysfs (%pe)", ERR_PTR(ret));
 
 	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
 		ret = sysfs_create_files(kobj, throttle_reason_attrs);
 		if (ret)
-			drm_warn(&gt->i915->drm,
-				 "failed to create gt%u throttle sysfs files (%pe)",
-				 gt->info.id, ERR_PTR(ret));
+			gt_warn(gt, "failed to create throttle sysfs files (%pe)", ERR_PTR(ret));
 	}
 
 	if (HAS_MEDIA_RATIO_MODE(gt->i915) && intel_uc_uses_guc_slpc(&gt->uc)) {
 		ret = sysfs_create_files(kobj, media_perf_power_attrs);
 		if (ret)
-			drm_warn(&gt->i915->drm,
-				 "failed to create gt%u media_perf_power_attrs sysfs (%pe)\n",
-				 gt->info.id, ERR_PTR(ret));
+			gt_warn(gt, "failed to create media_perf_power_attrs sysfs (%pe)\n",
+				ERR_PTR(ret));
 	}
 
 	ret = sysfs_create_files(gt->sysfs_defaults, rps_defaults_attrs);
 	if (ret)
-		drm_warn(&gt->i915->drm,
-			 "failed to add gt%u rps defaults (%pe)\n",
-			 gt->info.id, ERR_PTR(ret));
+		gt_warn(gt, "failed to add rps defaults (%pe)\n", ERR_PTR(ret));
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index e37164a60d37b..4f436ba7a3c83 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -17,6 +17,7 @@
 #include "i915_utils.h"
 #include "intel_gt.h"
 #include "intel_gt_mcr.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gtt.h"
 
@@ -461,9 +462,9 @@ void gtt_write_workarounds(struct intel_gt *gt)
 		intel_uncore_write(uncore,
 				   HSW_GTT_CACHE_EN,
 				   can_use_gtt_cache ? GTT_CACHE_EN_ALL : 0);
-		drm_WARN_ON_ONCE(&i915->drm, can_use_gtt_cache &&
-				 intel_uncore_read(uncore,
-						   HSW_GTT_CACHE_EN) == 0);
+		gt_WARN_ON_ONCE(gt, can_use_gtt_cache &&
+				intel_uncore_read(uncore,
+						  HSW_GTT_CACHE_EN) == 0);
 	}
 }
 
-- 
2.39.0

