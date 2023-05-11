Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A46FFD21
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 01:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91F10E60A;
	Thu, 11 May 2023 23:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A465010E5FB;
 Thu, 11 May 2023 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683847074; x=1715383074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JrEstdtydKFhF2YRnxl7AAdNiqiGlqtcBM3zg0KHTOA=;
 b=HOdOvpPNiQJSr1HOkBoQ7JZaQ9YV9ENF+r4rPrQcF196zuTr4+dgIA0D
 pH8kgTkfkNyYdsiPLcAFy0St6lGfblJny7/+IaGosqovujewu/Kr1OfZt
 2HbwObEBQIFrcQdsF0jinzbESkctEU2EWjqt2lsSb4k+2IMoFlpM+1M68
 iaCEwlcuOMmy7HKRuV3tjad6usc4GxgjGCNZmAw3WT1qDrw9C4gzqvqEX
 WuXDS71qnEtxZArZjTzV0VHmvsQkbyagpLl1cOqEarwdLn758t2RcgdtO
 lcRM7pE/3t5tGyM1VjlgrDJQkzL47NJhRnwjQkDG1VDdx51Z7pUIVtzqL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378794008"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="378794008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 16:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874164395"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="874164395"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 11 May 2023 16:17:42 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 8/8] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Date: Thu, 11 May 2023 16:17:38 -0700
Message-Id: <20230511231738.1077674-9-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230511231738.1077674-1-alan.previn.teres.alexis@intel.com>
References: <20230511231738.1077674-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Juston Li <justonli@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable PXP with MTL-GSC-CS: add the has_pxp into device info
and increase the debugfs teardown timeouts to align with
new GSC-CS + firmware specs.

Now that we have 3 places that are selecting pxp timeouts
based on tee vs gsccs back-end, let's add a helper.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c              |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c         | 18 ++++++++++--------
 drivers/gpu/drm/i915/pxp/intel_pxp.h         |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c |  6 +++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  2 +-
 5 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 72dd7b9f6dfd..e4a19161afce 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1212,6 +1212,7 @@ static const struct intel_device_info mtl_info = {
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
 	.max_pat_index = 4,
+	.has_pxp = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
 	.require_force_probe = 1,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index f143eadbc253..bb2e15329f34 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -289,6 +289,14 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
 	return bound;
 }
 
+int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp)
+{
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		return GSCFW_MAX_ROUND_TRIP_LATENCY_MS;
+	else
+		return 250;
+}
+
 static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 {
 	int timeout;
@@ -302,10 +310,7 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 	intel_pxp_mark_termination_in_progress(pxp);
 	intel_pxp_terminate(pxp, false);
 
-	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
-		timeout = GSCFW_MAX_ROUND_TRIP_LATENCY_MS;
-	else
-		timeout = 250;
+	timeout = intel_pxp_get_backend_timeout_ms(pxp);
 
 	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
 		return -ETIMEDOUT;
@@ -325,10 +330,7 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
 	 */
 	pxp_queue_termination(pxp);
 
-	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
-		timeout = GSCFW_MAX_ROUND_TRIP_LATENCY_MS;
-	else
-		timeout = 250;
+	timeout = intel_pxp_get_backend_timeout_ms(pxp);
 
 	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
 		return -ETIMEDOUT;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 17e6dbc86b38..17254c3f1267 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -27,6 +27,7 @@ void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
 
 int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
+int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp);
 int intel_pxp_start(struct intel_pxp *pxp);
 void intel_pxp_end(struct intel_pxp *pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
index 4b8e70caa3ad..e07c5b380789 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
@@ -14,6 +14,7 @@
 
 #include "intel_pxp.h"
 #include "intel_pxp_debugfs.h"
+#include "intel_pxp_gsccs.h"
 #include "intel_pxp_irq.h"
 #include "intel_pxp_types.h"
 
@@ -45,6 +46,7 @@ static int pxp_terminate_set(void *data, u64 val)
 {
 	struct intel_pxp *pxp = data;
 	struct intel_gt *gt = pxp->ctrl_gt;
+	int timeout_ms;
 
 	if (!intel_pxp_is_active(pxp))
 		return -ENODEV;
@@ -54,8 +56,10 @@ static int pxp_terminate_set(void *data, u64 val)
 	intel_pxp_irq_handler(pxp, GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT);
 	spin_unlock_irq(gt->irq_lock);
 
+	timeout_ms = intel_pxp_get_backend_timeout_ms(pxp);
+
 	if (!wait_for_completion_timeout(&pxp->termination,
-					 msecs_to_jiffies(100)))
+					 msecs_to_jiffies(timeout_ms)))
 		return -ETIMEDOUT;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index e4d8242302c5..0a3e66b0265e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -44,7 +44,7 @@ static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_pla
 				      KCR_SIP(pxp->kcr_base),
 				      mask,
 				      in_play ? mask : 0,
-				      100);
+				      250);
 
 	intel_runtime_pm_put(uncore->rpm, wakeref);
 
-- 
2.39.0

