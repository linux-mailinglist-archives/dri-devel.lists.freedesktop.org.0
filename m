Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F5F7A25BD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABDA10E66B;
	Fri, 15 Sep 2023 18:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224F610E66C;
 Fri, 15 Sep 2023 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694802654; x=1726338654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zKyrltrDhOfJD1vZMfMjA1RQ3J6qTxdnrwOIfdhheU4=;
 b=UninJ74orjBW2TPXZ3elxkTMRRuqf5mugd4cF5NCzYUZegrGZZ1/jTDv
 5msXokgR4AU624MshAg+Di/84+gHQGnBu0Kz1OEOvekkVgIpFCkmluNbT
 TDhRcEM3RDG+EK7P43bbkR6HpaZMPH+IFYIpSXwlu3ovnkZprxbo/TUgq
 H52Ewm985flDj8roALem3TyeDCNC1nuZBJLuqz98sT+MnhO40IzEwrW7t
 U2g3eKtr6gWkYU9Wu8R4GvMfhAHc2XGUGu5waEKYBdipJ0jt+EFTmIi51
 E9jXGYevAysUkYgrC3EQBO3qMbtuJc8mzUbziTXMXtIgIF6c92kCe4yJX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445789293"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445789293"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="991949756"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="991949756"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2023 11:30:53 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/3] drm/i915/pxp/mtl: Update pxp-firmware response timeout
Date: Fri, 15 Sep 2023 11:30:49 -0700
Message-Id: <20230915183051.1232026-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230915183051.1232026-1-alan.previn.teres.alexis@intel.com>
References: <20230915183051.1232026-1-alan.previn.teres.alexis@intel.com>
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
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
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
Reviewed-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 20 +++++++++++++++++--
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  6 ++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 10 ++++------
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index 89ed5ee9cded..2fde5c360cff 100644
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
+		if (i915_request_wait(rq, 0, msecs_to_jiffies(GSC_HECI_REPLY_LATENCY_MS)) < 0)
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
index 09d3fbdad05a..c4308291c003 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
@@ -12,6 +12,12 @@ struct i915_vma;
 struct intel_context;
 struct intel_gsc_uc;
 
+#define GSC_HECI_REPLY_LATENCY_MS 500
+/*
+ * Max FW response time is 500ms, but this should be counted from the time the
+ * command has hit the GSC-CS hardware, not the preceding handoff to GuC CTB.
+ */
+
 struct intel_gsc_mtl_header {
 	u32 validity_marker;
 #define GSC_HECI_VALIDITY_MARKER 0xA578875A
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 298ad38e6c7d..9aae779c4da3 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -8,16 +8,14 @@
 
 #include <linux/types.h>
 
+#include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
+
 struct intel_pxp;
 
-#define GSC_REPLY_LATENCY_MS 210
-/*
- * Max FW response time is 200ms, to which we add 10ms to account for overhead
- * such as request preparation, GuC submission to hw and pipeline completion times.
- */
 #define GSC_PENDING_RETRY_MAXCOUNT 40
 #define GSC_PENDING_RETRY_PAUSE_MS 50
-#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS)
+#define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_HECI_REPLY_LATENCY_MS + \
+					 (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS))
 
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
-- 
2.39.0

