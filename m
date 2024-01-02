Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECFA8224A4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 23:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1B610E221;
	Tue,  2 Jan 2024 22:20:14 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B35310E221;
 Tue,  2 Jan 2024 22:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704234014; x=1735770014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xP8O99wKmbh+kQZU3ZD1ZyXh7v0LzQG+T1sU+ydo66I=;
 b=WpizH9vXj3txg1Y8SUubsJ+gL48yfXyZncU6+o5OtWLvUnGyNxiJvqRz
 4I5JDNQlwnrzBK4XNTCoWoQlb1NnBM/TY2+ahrKZk0x94z0oedY31OG3W
 msYaPZW35OBIRxOh/hJNMXaQM7jsNMhucQLU5PSbGaLbccQjwEGpjvLwN
 4UQACT66lc0RJ4Cud9vwf+jBE5KklW3cjxBeRukD269uTDpOyjuCq5KPg
 xB38tT2Q10CeQfsnDlO8+UMXzXpnENEZvQXEZSJ2cMzirYKbS6CI6/mdA
 NwXdu7zXiKN6XhWttTIj72wS/o1/ATToABNCLTaxmnAVCGUYkIzVaNwhV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3700085"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="3700085"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 14:20:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; d="scan'208";a="14297447"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 02 Jan 2024 14:20:12 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/huc: Allow for very slow HuC loading
Date: Tue,  2 Jan 2024 14:22:02 -0800
Message-ID: <20240102222202.310495-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

A failure to load the HuC is occasionally observed where the cause is
believed to be a low GT frequency leading to very long load times.

So a) increase the timeout so that the user still gets a working
system even in the case of slow load. And b) report the frequency
during the load to see if that is the cause of the slow down.

Also update the similar code on the GuC load to not use uncore->gt
when there is a local gt available. The two should match, but no need
for unnecessary de-referencing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 10 ++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 64 ++++++++++++++++++++---
 2 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 0f79cb6585182..52332bb143395 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -184,7 +184,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
 	 * in the seconds range. However, there is a limit on how long an
 	 * individual wait_for() can wait. So wrap it in a loop.
 	 */
-	before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
+	before_freq = intel_rps_read_actual_frequency(&gt->rps);
 	before = ktime_get();
 	for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
 		ret = wait_for(guc_load_done(uncore, &status, &success), 1000);
@@ -192,7 +192,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
 			break;
 
 		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz, status = 0x%08X [0x%02X/%02X]\n",
-			count, intel_rps_read_actual_frequency(&uncore->gt->rps), status,
+			count, intel_rps_read_actual_frequency(&gt->rps), status,
 			REG_FIELD_GET(GS_BOOTROM_MASK, status),
 			REG_FIELD_GET(GS_UKERNEL_MASK, status));
 	}
@@ -204,7 +204,7 @@ static int guc_wait_ucode(struct intel_guc *guc)
 		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
 
 		guc_info(guc, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz, ret = %d\n",
-			 status, delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
+			 status, delta_ms, intel_rps_read_actual_frequency(&gt->rps), ret);
 		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
 			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
 			 bootrom, ukernel,
@@ -254,11 +254,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
 		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
 			 delta_ms, status, count, ret);
 		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			 intel_rps_read_actual_frequency(&uncore->gt->rps), before_freq,
+			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
 			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
 		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
-			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
+			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
 			before_freq, status, count, ret);
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ba9e07fc2b577..9ccec7de9628a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 
 #include "gt/intel_gt.h"
+#include "gt/intel_rps.h"
 #include "intel_guc_reg.h"
 #include "intel_huc.h"
 #include "intel_huc_print.h"
@@ -447,17 +448,68 @@ static const char *auth_mode_string(struct intel_huc *huc,
 	return partial ? "clear media" : "all workloads";
 }
 
+/*
+ * Use a longer timeout for debug builds so that problems can be detected
+ * and analysed. But a shorter timeout for releases so that user's don't
+ * wait forever to find out there is a problem. Note that the only reason
+ * an end user should hit the timeout is in case of extreme thermal throttling.
+ * And a system that is that hot during boot is probably dead anyway!
+ */
+#if defined(CONFIG_DRM_I915_DEBUG_GEM)
+#define HUC_LOAD_RETRY_LIMIT   20
+#else
+#define HUC_LOAD_RETRY_LIMIT   3
+#endif
+
 int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 				     enum intel_huc_authentication_type type)
 {
 	struct intel_gt *gt = huc_to_gt(huc);
-	int ret;
+	struct intel_uncore *uncore = gt->uncore;
+	ktime_t before, after, delta;
+	int ret, count;
+	u64 delta_ms;
+	u32 before_freq;
 
-	ret = __intel_wait_for_register(gt->uncore,
-					huc->status[type].reg,
-					huc->status[type].mask,
-					huc->status[type].value,
-					2, 50, NULL);
+	/*
+	 * The KMD requests maximum frequency during driver load, however thermal
+	 * throttling can force the frequency down to minimum (although the board
+	 * really should never get that hot in real life!). IFWI  issues have been
+	 * seen to cause sporadic failures to grant the higher frequency. And at
+	 * minimum frequency, the load time can be in the seconds range. Note that
+	 * there is a limit on how long an individual wait_for() can wait. So wrap
+	 * it in a loop.
+	 */
+	before_freq = intel_rps_read_actual_frequency(&gt->rps);
+	before = ktime_get();
+	for (count = 0; count < HUC_LOAD_RETRY_LIMIT; count++) {
+		ret = __intel_wait_for_register(gt->uncore,
+						huc->status[type].reg,
+						huc->status[type].mask,
+						huc->status[type].value,
+						2, 1000, NULL);
+		if (!ret)
+			break;
+
+		huc_dbg(huc, "auth still in progress, count = %d, freq = %dMHz, status = 0x%08X\n",
+			count, intel_rps_read_actual_frequency(&gt->rps),
+			huc->status[type].reg.reg);
+	}
+	after = ktime_get();
+	delta = ktime_sub(after, before);
+	delta_ms = ktime_to_ms(delta);
+
+	if (delta_ms > 50) {
+		huc_warn(huc, "excessive auth time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
+			 delta_ms, huc->status[type].reg.reg, count, ret);
+		huc_warn(huc, "excessive auth time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
+			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
+			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
+	} else {
+		huc_dbg(huc, "auth took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
+			before_freq, huc->status[type].reg.reg, count, ret);
+	}
 
 	/* mark the load process as complete even if the wait failed */
 	delayed_huc_load_complete(huc);
-- 
2.41.0

