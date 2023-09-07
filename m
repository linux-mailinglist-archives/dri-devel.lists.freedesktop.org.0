Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124A796DEE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 02:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0026110E743;
	Thu,  7 Sep 2023 00:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C3410E062;
 Thu,  7 Sep 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694045751; x=1725581751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMTL7JVEqd571VlUiC9H6a653Wgvewuzlg9MdbuDDJc=;
 b=GunLx9We70QJ5MdMTnij5B7x/0axPtvMiNvVO1r+oQ2ppbF9NhXXU+KV
 gGrU+Fn2v0PkFK48ZH7k9VxH7HrNCQ8o5JVXn84uwWy9EE8OrKdqqdW91
 1zUSS/592ty1A3GZfj79ehqgWy711lIS1ArYbXiBiXUDvT3TNCz9tFazT
 Mmz74mFaDNbRN7rmS4DChX3JU2OInDqj/waMlriuNIbokh/4YL6MrheTK
 XSp132BOOEaBFnt/UcAyGn/Njmy+1nW9zx5nJMKOkkewSAWGNgL8jbdpb
 ZnonrVuAgI9hsT+RTNBJEdFqDt1uz793gd0UwRfaAyGItfPorl01M2xFy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408226729"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="408226729"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811895781"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="811895781"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2023 17:15:50 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/i915/pxp/mtl: Update pxp-firmware response timeout
Date: Wed,  6 Sep 2023 17:15:47 -0700
Message-Id: <20230907001549.81262-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
References: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the max GSC-fw response time to match updated internal
fw specs. Because this response time is an SLA on the firmware,
not inclusive of i915->GuC->HW handoff latency, when submitting
requests to the GSC fw via intel_gsc_uc_heci_cmd_submit helpers,
start the count after the request hits the GSC command streamer.
Also, move GSC_REPLY_LATENCY_MS definition from pxp header to
intel_gsc_uc_heci_cmd_submit.h since its for any GSC HECI packet.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 20 +++++++++++++++++--
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  6 ++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 11 ++++++----
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index 89ed5ee9cded..fe6a2f78cea0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -81,8 +81,17 @@ int intel_gsc_uc_heci_cmd_submit_packet(struct intel_gsc_uc *gsc, u64 addr_in,
 
 	i915_request_add(rq);
 
-	if (!err && i915_request_wait(rq, 0, msecs_to_jiffies(500)) < 0)
-		err = -ETIME;
+	if (!err) {
+		/*
+		 * Start timeout for i915_request_wait only after considering one possible
+		 * pending GSC-HECI submission cycle on the other (non-privileged) path.
+		 */
+		if (wait_for(i915_request_started(rq), GSC_HECI_REPLY_LATENCY_MS))
+			drm_dbg(&gsc_uc_to_gt(gsc)->i915->drm,
+				"Delay in gsc-heci-priv submission to gsccs-hw");
+		if (i915_request_wait(rq, 0, msecs_to_jiffies(500)) < 0)
+			err = -ETIME;
+	}
 
 	i915_request_put(rq);
 
@@ -186,6 +195,13 @@ intel_gsc_uc_heci_cmd_submit_nonpriv(struct intel_gsc_uc *gsc,
 	i915_request_add(rq);
 
 	if (!err) {
+		/*
+		 * Start timeout for i915_request_wait only after considering one possible
+		 * pending GSC-HECI submission cycle on the other (privileged) path.
+		 */
+		if (wait_for(i915_request_started(rq), GSC_HECI_REPLY_LATENCY_MS))
+			drm_dbg(&gsc_uc_to_gt(gsc)->i915->drm,
+				"Delay in gsc-heci-non-priv submission to gsccs-hw");
 		if (i915_request_wait(rq, I915_WAIT_INTERRUPTIBLE,
 				      msecs_to_jiffies(timeout_ms)) < 0)
 			err = -ETIME;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
index 09d3fbdad05a..5ae5c5d9608b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
@@ -12,6 +12,12 @@ struct i915_vma;
 struct intel_context;
 struct intel_gsc_uc;
 
+#define GSC_HECI_REPLY_LATENCY_MS 350
+/*
+ * Max FW response time is 350ms, but this should be counted from the time the
+ * command has hit the GSC-CS hardware, not the preceding handoff to GuC CTB.
+ */
+
 struct intel_gsc_mtl_header {
 	u32 validity_marker;
 #define GSC_HECI_VALIDITY_MARKER 0xA578875A
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 298ad38e6c7d..a4f17b3ea286 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -8,16 +8,19 @@
 
 #include <linux/types.h>
 
+#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
+
 struct intel_pxp;
 
-#define GSC_REPLY_LATENCY_MS 210
+#define GSC_REPLY_LATENCY_MS GSC_HECI_REPLY_LATENCY_MS
 /*
- * Max FW response time is 200ms, to which we add 10ms to account for overhead
- * such as request preparation, GuC submission to hw and pipeline completion times.
+ * Max FW response time is 350ms, but this should be counted from the time the
+ * command has hit the GSC-CS hardware, not the preceding handoff to GuC CTB.
  */
 #define GSC_PENDING_RETRY_MAXCOUNT 40
 #define GSC_PENDING_RETRY_PAUSE_MS 50
-#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS)
+#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_REPLY_LATENCY_MS + \
+					 (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS))
 
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
-- 
2.39.0

