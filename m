Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8869B684
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 00:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE5010E47F;
	Fri, 17 Feb 2023 23:48:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CD110E05E;
 Fri, 17 Feb 2023 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676677683; x=1708213683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BD+NISiSWRGWfGLMIn5qOeTC2TBwMDzoVonyaEJW9js=;
 b=RS+5wLnWKgw/t3JQB3Gc032anxxYxVF0NSupsfKtVRYZxwRK/g9uvN8i
 4x3ZMwrlV9/a/Z6QYanFIOqzSzI5Q5Ga7p3sfXsLAE/OTA1f7iLbKKOgy
 OLgiD2Xv+B9vAzewZYeopUrFxk7tJGCf12eJiVrK5eY9XAcQbHMikGByZ
 49jo4guHeXTl7WGSuhM/foFGdlBNzQVmzwSjO+K7rC/Cd3fhJfs0LqEki
 MLmXktsW3Ympp8Jxjrv71d4I4jg9a4WLVoG9USjJ77zXbpUrdcPU4EO6C
 nEENg1bfQl1RH+UO2xBM6/4kqApOD639VpIt8cYhBYGaFwNfpzXyOaWRN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394600973"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394600973"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 15:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739427160"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="739427160"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 15:47:56 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Allow for very slow GuC loading
Date: Fri, 17 Feb 2023 15:47:15 -0800
Message-Id: <20230217234715.3609670-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
References: <20230217234715.3609670-1-John.C.Harrison@Intel.com>
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

A failure to load the GuC is occasionally observed where the GuC log
actually showed that the GuC had loaded just fine. The implication
being that the load just took ever so slightly longer than the 200ms
timeout. Given that the actual time should be tens of milliseconds at
the slowest, this should never happen. So far the issue has generally
been caused by a bad IFWI resulting in low frequencies during boot
(depsite the KMD requesting max frequency). However, the issue seems
to happen more often than one would like.

So a) increase the timeout so that the user still gets a working
system even in the case of slow load. And b) report the frequency
during the load to see if that is the case of the slow down.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 37 +++++++++++++++++++++--
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 2f5942606913d..72e003f50617d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -12,6 +12,7 @@
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
 #include "gt/intel_gt_regs.h"
+#include "gt/intel_rps.h"
 #include "intel_guc_fw.h"
 #include "intel_guc_print.h"
 #include "i915_drv.h"
@@ -139,9 +140,12 @@ static int guc_wait_ucode(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
 	struct intel_uncore *uncore = gt->uncore;
+	ktime_t before, after, delta;
 	bool success;
 	u32 status;
-	int ret;
+	int ret, count;
+	u64 delta_ms;
+	u32 before_freq;
 
 	/*
 	 * Wait for the GuC to start up.
@@ -159,13 +163,32 @@ static int guc_wait_ucode(struct intel_guc *guc)
 	 * issues to be resolved. In the meantime bump the timeout to
 	 * 200ms. Even at slowest clock, this should be sufficient. And
 	 * in the working case, a larger timeout makes no difference.
+	 *
+	 * IFWI updates have also been seen to cause sporadic failures due to
+	 * the requested frequency not being granted and thus the firmware
+	 * load is attempted at minimum frequency. That can lead to load times
+	 * in the seconds range. However, there is a limit on how long an
+	 * individual wait_for() can wait. So wrap it in a loop.
 	 */
-	ret = wait_for(guc_load_done(uncore, &status, &success), 200);
+	before_freq = intel_rps_read_actual_frequency(&uncore->gt->rps);
+	before = ktime_get();
+	for (count = 0; count < 20; count++) {
+		ret = wait_for(guc_load_done(uncore, &status, &success), 1000);
+		if (!ret || !success)
+			break;
+
+		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz\n",
+			count, intel_rps_read_actual_frequency(&uncore->gt->rps));
+	}
+	after = ktime_get();
+	delta = ktime_sub(after, before);
+	delta_ms = ktime_to_ms(delta);
 	if (ret || !success) {
 		u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
 		u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
 
-		guc_info(guc, "load failed: status = 0x%08X, ret = %d\n", status, ret);
+		guc_info(guc, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz, ret = %d\n",
+			 status, delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps), ret);
 		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
 			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
 			 bootrom, ukernel,
@@ -206,6 +229,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
 		/* Uncommon/unexpected error, see earlier status code print for details */
 		if (ret == 0)
 			ret = -ENXIO;
+	} else if (delta_ms > 200) {
+		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
+			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
+			 before_freq, status, count, ret);
+	} else {
+		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
+			before_freq, status, count, ret);
 	}
 
 	return ret;
-- 
2.39.1

