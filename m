Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D384076D6D7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEAA10E562;
	Wed,  2 Aug 2023 18:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CFE10E55E;
 Wed,  2 Aug 2023 18:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691000753; x=1722536753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9WarRPwi/OZGZsiVhMTi5GRaTUUu4h8eVCaYPk6+tLw=;
 b=LppiMoXBDWAjapq2FNXdqzG0xn84iDFMIdGAMy1tPG/RdzRUfeGInJNi
 qoPTreR9lEiWNXChGrlGadcUj+Dc/4E1ayC1v9lcyNiXl+9D4AJCMgcRF
 xvRvf8EzTL1HuMtvBFASkGVKYfJkCC+z+vik0kxD+bt0jBBoKL2f3geDe
 OaGPoqPJamnaw1oMCfOYRN+p3rxf2C1/Qymz+5aV+Dkmxqt24RvfnwmNd
 M63XpAL9mqKBS2a7eEWO7MxgxLGU0mpI1yFvyxcegXlQTwqP7hIKYbPjy
 LS8nXEkcXzgWkBf2BKvyQ54doO+GKSQJ4wgF9UD1B2W4xf5m7jvJ7pPhp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349262620"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="349262620"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 11:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799216239"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="799216239"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2023 11:25:52 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/1] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Date: Wed,  2 Aug 2023 11:25:50 -0700
Message-Id: <20230802182550.1592926-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
 Jani Nikula <jani.nikula@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After recent discussions with Mesa folks, it was requested
that we optimize i915's GET_PARAM for the PXP_STATUS without
changing the UAPI spec.

Add these additional optimizations:
   - If any PXP initializatoin flow failed, then ensure that
     we catch it so that we can change the returned PXP_STATUS
     from "2" (i.e. 'PXP is supported but not yet ready')
     to "-ENODEV". This typically should not happen and if it
     does, we have a platform configuration issue.
   - If a PXP arbitration session creation event failed
     due to incorrect firmware version or blocking SOC fusing
     or blocking BIOS configuration (platform reasons that won't
     change if we retry), then reflect that blockage by also
     returning -ENODEV in the GET_PARAM:PXP_STATUS.
   - GET_PARAM:PXP_STATUS should not wait at all if PXP is
     supported but non-i915 dependencies (component-driver /
     firmware) we are still pending to complete the init flows.
     In this case, just return "2" immediately (i.e. 'PXP is
     supported but not yet ready').

Difference from prio revs:
  v3: - Rebase with latest tip that has pulled in setting the
        gsc fw load to fail if proxy init fails.
  v2: - Use a #define for the default readiness timeout (Vivaik).
      - Improve comments around the failing of proxy-init.
  v1: - Change the commit msg style to be imperative. (Jani)
      - Rename timeout to timeout_ms. (Jani)
      - Fix is_fw_err_platform_config to use higher order
        param (pxp) first. (Jani)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c       |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 40 ++++++++++++++++++----
 drivers/gpu/drm/i915/pxp/intel_pxp.h       |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  7 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  7 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  9 +++++
 6 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 890f2b382bee..5c3fec63cb4c 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -109,7 +109,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			return value;
 		break;
 	case I915_PARAM_PXP_STATUS:
-		value = intel_pxp_get_readiness_status(i915->pxp);
+		value = intel_pxp_get_readiness_status(i915->pxp, 0);
 		if (value < 0)
 			return value;
 		break;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 38ec754d0ec8..dc327cf40b5a 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -359,22 +359,46 @@ void intel_pxp_end(struct intel_pxp *pxp)
 	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
 }
 
+static bool pxp_required_fw_failed(struct intel_pxp *pxp)
+{
+	if (__intel_uc_fw_status(&pxp->ctrl_gt->uc.huc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
+		return true;
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0) &&
+	    __intel_uc_fw_status(&pxp->ctrl_gt->uc.gsc.fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)
+		return true;
+
+	return false;
+}
+
+static bool pxp_fw_dependencies_completed(struct intel_pxp *pxp)
+{
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		return intel_pxp_gsccs_is_ready_for_sessions(pxp);
+
+	return pxp_component_bound(pxp);
+}
+
 /*
  * this helper is used by both intel_pxp_start and by
  * the GET_PARAM IOCTL that user space calls. Thus, the
  * return values here should match the UAPI spec.
  */
-int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
+int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout_ms)
 {
 	if (!intel_pxp_is_enabled(pxp))
 		return -ENODEV;
 
-	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
-		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 250))
-			return 2;
-	} else {
-		if (wait_for(pxp_component_bound(pxp), 250))
+	if (pxp_required_fw_failed(pxp))
+		return -ENODEV;
+
+	if (pxp->platform_cfg_is_bad)
+		return -ENODEV;
+
+	if (timeout_ms) {
+		if (wait_for(pxp_fw_dependencies_completed(pxp), timeout_ms))
 			return 2;
+	} else if (!pxp_fw_dependencies_completed(pxp)) {
+		return 2;
 	}
 	return 1;
 }
@@ -383,11 +407,13 @@ int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
  * the arb session is restarted from the irq work when we receive the
  * termination completion interrupt
  */
+#define PXP_READINESS_TIMEOUT 250
+
 int intel_pxp_start(struct intel_pxp *pxp)
 {
 	int ret = 0;
 
-	ret = intel_pxp_get_readiness_status(pxp);
+	ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
 	if (ret < 0)
 		return ret;
 	else if (ret > 1)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 17254c3f1267..d9372f6f7797 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -26,7 +26,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
 
-int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
+int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout_ms);
 int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp);
 int intel_pxp_start(struct intel_pxp *pxp);
 void intel_pxp_end(struct intel_pxp *pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index c7df47364013..97ad58d6aff1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -17,12 +17,13 @@
 #include "intel_pxp_types.h"
 
 static bool
-is_fw_err_platform_config(u32 type)
+is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
 {
 	switch (type) {
 	case PXP_STATUS_ERROR_API_VERSION:
 	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
 	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
+		pxp->platform_cfg_is_bad = true;
 		return true;
 	default:
 		break;
@@ -225,7 +226,7 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
 	if (ret) {
 		drm_err(&i915->drm, "Failed to init session %d, ret=[%d]\n", arb_session_id, ret);
 	} else if (msg_out.header.status != 0) {
-		if (is_fw_err_platform_config(msg_out.header.status)) {
+		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
 			drm_info_once(&i915->drm,
 				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
 				      arb_session_id, msg_out.header.status,
@@ -268,7 +269,7 @@ void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 		drm_err(&i915->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
 			session_id, ret);
 	} else if (msg_out.header.status != 0) {
-		if (is_fw_err_platform_config(msg_out.header.status)) {
+		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
 			drm_info_once(&i915->drm,
 				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
 				      session_id, msg_out.header.status,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 1ce07d7e8769..1de054126c6d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -20,12 +20,13 @@
 #include "intel_pxp_types.h"
 
 static bool
-is_fw_err_platform_config(u32 type)
+is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
 {
 	switch (type) {
 	case PXP_STATUS_ERROR_API_VERSION:
 	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
 	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
+		pxp->platform_cfg_is_bad = true;
 		return true;
 	default:
 		break;
@@ -339,7 +340,7 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 	if (ret) {
 		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
 	} else if (msg_out.header.status != 0) {
-		if (is_fw_err_platform_config(msg_out.header.status)) {
+		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
 			drm_info_once(&i915->drm,
 				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
 				      arb_session_id, msg_out.header.status,
@@ -387,7 +388,7 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
 			session_id, ret);
 	} else if (msg_out.header.status != 0) {
-		if (is_fw_err_platform_config(msg_out.header.status)) {
+		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
 			drm_info_once(&i915->drm,
 				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
 				      session_id, msg_out.header.status,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 1a8765866b8b..7e11fa8034b2 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -26,6 +26,15 @@ struct intel_pxp {
 	 */
 	struct intel_gt *ctrl_gt;
 
+	/**
+	 * @platform_cfg_is_bad: used to track if any prior arb session creation resulted
+	 * in a failure that was caused by a platform configuration issue, meaning that
+	 * failure will not get resolved without a change to the platform (not kernel)
+	 * such as BIOS configuration, firwmware update, etc. This bool gets reflected when
+	 * GET_PARAM:I915_PARAM_PXP_STATUS is called.
+	 */
+	bool platform_cfg_is_bad;
+
 	/**
 	 * @kcr_base: base mmio offset for the KCR engine which is different on legacy platforms
 	 * vs newer platforms where the KCR is inside the media-tile.

base-commit: d7a437067a2146e1035a5609dae08b9595773a16
-- 
2.39.0

