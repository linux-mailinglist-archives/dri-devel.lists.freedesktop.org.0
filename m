Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7AA4E2E59
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CC310E4BA;
	Mon, 21 Mar 2022 16:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870BD10E417;
 Mon, 21 Mar 2022 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647880977; x=1679416977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n90g41nasTOkJJJfkZtFE/Kw80GDLJQatNpnDpFnpV4=;
 b=bfD6haXrcIQwBe6QiQJjL+nZAcTEV6so7rx5mxow+Dl6G85nknChMpN6
 hMfo7QCqNRwwpQGcRoXx7aPrPfmqaWuhSgDo/CIUet/NNIrY/fun8VkID
 gnsIIewkx7x42ovAD+0bbCIkJpp1lGFbkrHqRIJrkg8razk1x2Z8qWrRd
 7wm2KlYIMpnlHJ8qdGAGwvV34xo8aa3oq7HGN874ZRc1HAt2QeGjaW/wO
 qXuEFYBXJ1bF0cw9f4MVZpC/iioS7+xrbIguw7wmkugnuda9LMXFDrxHv
 tw5MnQKliMzFPshlWOY7LODJ46SDraug7C3rke64cmJI7zD+srRK/gyAC Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="239752681"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="239752681"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 09:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="716563783"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2022 09:42:57 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 09/13] drm/i915/guc: Check sizing of guc_capture output
Date: Mon, 21 Mar 2022 09:45:23 -0700
Message-Id: <20220321164527.2500062-10-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321164527.2500062-1-alan.previn.teres.alexis@intel.com>
References: <20220321164527.2500062-1-alan.previn.teres.alexis@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add intel_guc_capture_output_min_size_est function to
provide a reasonable minimum size for error-capture
region before allocating the shared buffer.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 48 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  7 ++-
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 63ef407a2fd0..f87fee216430 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -663,6 +663,54 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
 	return 0;
 }
 
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+int
+intel_guc_capture_output_min_size_est(struct intel_guc *guc)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct intel_engine_cs *engine;
+	enum intel_engine_id id;
+	int worst_min_size = 0, num_regs = 0;
+	size_t tmp = 0;
+
+	/*
+	 * If every single engine-instance suffered a failure in quick succession but
+	 * were all unrelated, then a burst of multiple error-capture events would dump
+	 * registers for every one engine instance, one at a time. In this case, GuC
+	 * would even dump the global-registers repeatedly.
+	 *
+	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
+	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
+	 * dumps are split across different register types (where the '3' are global vs class
+	 * vs instance). Finally, let's multiply the whole thing by 3x (just so we are
+	 * not limited to just 1 round of data in a worst case full register dump log)
+	 *
+	 * NOTE: intel_guc_log that allocates the log buffer would round this size up to
+	 * a power of two.
+	 */
+
+	for_each_engine(engine, gt, id) {
+		worst_min_size += sizeof(struct guc_state_capture_group_header_t) +
+				  (3 * sizeof(struct guc_state_capture_header_t));
+
+		if (!intel_guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp))
+			num_regs += tmp;
+
+		if (!intel_guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+						   engine->class, &tmp)) {
+			num_regs += tmp;
+		}
+		if (!intel_guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+						   engine->class, &tmp)) {
+			num_regs += tmp;
+		}
+	}
+
+	worst_min_size += (num_regs * sizeof(struct guc_mmio_reg));
+
+	return (worst_min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER);
+}
+
 static void
 guc_capture_free_ads_cache(struct intel_guc_state_capture *gc)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
index 8de7704e12eb..540d72079462 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.h
@@ -11,6 +11,7 @@
 struct guc_gt_system_info;
 struct intel_guc;
 
+int intel_guc_capture_output_min_size_est(struct intel_guc *guc);
 int intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 			      void **outptr);
 int intel_guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index fe4b2d3f305d..ed05b1a04f9c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -7,10 +7,11 @@
 #include <linux/string_helpers.h>
 
 #include "gt/intel_gt.h"
+#include "intel_guc_capture.h"
+#include "intel_guc_log.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_memcpy.h"
-#include "intel_guc_log.h"
 
 static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log);
 
@@ -466,6 +467,10 @@ int intel_guc_log_create(struct intel_guc_log *log)
 	 *  |         Capture logs          |
 	 *  +===============================+ + CAPTURE_SIZE
 	 */
+	if (intel_guc_capture_output_min_size_est(guc) > CAPTURE_BUFFER_SIZE)
+		DRM_WARN("GuC log buffer for state_capture maybe too small. %d < %d\n",
+			 CAPTURE_BUFFER_SIZE, intel_guc_capture_output_min_size_est(guc));
+
 	guc_log_size = PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
 		       CAPTURE_BUFFER_SIZE;
 
-- 
2.25.1

