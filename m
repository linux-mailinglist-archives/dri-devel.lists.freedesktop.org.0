Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052C86FE36E
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 19:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4081210E4E9;
	Wed, 10 May 2023 17:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1B10E4D5;
 Wed, 10 May 2023 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683740754; x=1715276754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ok504YMG2WcGoHNs3wnWMoFODXA5SXb7LgRoBEei2fk=;
 b=H0OZ8MfMsGMRWZKbIpAlwtkcN0keD1MWb7PbgnsrbeAUuCVvMieJDoch
 hfEe5ab258o4igoXROddYHQwID+EECZ9IecfuFo6w7u9TAuaNldD5kYHI
 VVe4C+513LVsaOYvN8au4YUrueO2S+moRqsH17sFRcZ6WqcKDDx9UbxcR
 71WVEOkAlPD4+BX+LiV++4Yr8m2Vq9X+upnYRmoiOrh/+qJ7muwbhqwOu
 aU6e3BnigzlVgtjZQoO3SF4CGOL35r6wgSoWZK1jL2392UOyEeQ1niaoX
 z8y/c4mhh+Us6sWc4dyez2prWEmz3zQBya6xfC6gM7nJ0V0s3pIfjttJD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353352066"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="353352066"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 10:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="945791934"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="945791934"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 10 May 2023 10:45:52 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 8/8] drm/i915/pxp: Enable PXP with MTL-GSC-CS
Date: Wed, 10 May 2023 10:45:50 -0700
Message-Id: <20230510174550.986965-9-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230510174550.986965-1-alan.previn.teres.alexis@intel.com>
References: <20230510174550.986965-1-alan.previn.teres.alexis@intel.com>
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
index c509ea4aa70f..116b5b5bdb91 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1152,6 +1152,7 @@ static const struct intel_device_info mtl_info = {
 	.has_llc = 0,
 	.has_mslice_steering = 0,
 	.has_snoop = 1,
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

