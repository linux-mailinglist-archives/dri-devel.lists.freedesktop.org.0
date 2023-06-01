Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546EE71F111
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038B510E257;
	Thu,  1 Jun 2023 17:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0607010E257;
 Thu,  1 Jun 2023 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685641556; x=1717177556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a8AUutcBvxX1tf+Eai8Fu5mG0DBEvROfWOugDnIdIPQ=;
 b=h+6gVe6j2tqHw8LT8DN9U60oDVhMBaMV0vf6tMbQsCpJd+tWBsWj2WMG
 6A31tZeMDwsMGSTcM7gMzQgsm5kR9XJvz3a7go2nkVGoapPGzdIj9uZU8
 sVyKQkK1nRvg3NAD2S2zNYOpnfTOaSzFM7vzQm/biOkcDDOtf0hf1Ou3n
 2+xB20rHm6C9OwU+4jPqUQlnaLmQ7WmTVN5DmkbyjB6RopmGDirtDNewG
 aQ3W2QTaPBPRU8IAa2G7XEuGDkCKXKzHrLvuqVq+VKOBq/5Ag+6jrrC/d
 vODd45uBuARzCz2C+xtGGAyFQWxV+u/aaDgkPFcVRW1U5EQjvJpeLmQhX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353130270"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="353130270"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707452165"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707452165"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 01 Jun 2023 10:45:54 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pxp: Optimize GET_PARAM:PXP_STATUS
Date: Thu,  1 Jun 2023 10:45:53 -0700
Message-Id: <20230601174553.2410741-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After recent discussions with Mesa folks, it was requested
that we optimize i915's GET_PARAM for the PXP_STATUS without
changing the UAPI spec.

This patch adds this additional optimizations:
   - If any PXP initializatoin flow failed, then ensure that
     we catch it so that we can change the returned PXP_STATUS
     from "2" (i.e. 'PXP is supported but not yet ready')
     to "-ENODEV". This typically should not happen and if it
     does, we have a platform configuration.
   - If a PXP arbitration session creation event failed
     due to incorrect firmware version or blocking SOC fusing
     or blocking BIOS configuration (platform reasons that won't
     change if we retry), then reflect that blockage by also
     returning -ENODEV in the GET_PARAM-PXP_STATUS.
   - GET_PARAM:PXP_STATUS should not wait at all if PXP is
     supported but non-i915 dependencies (component-driver /
     firmware) we are still pending to complete the init flows.
     In this case, just return "2" immediately (i.e. 'PXP is
     supported but not yet ready').

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c  | 11 +++++++++-
 drivers/gpu/drm/i915/i915_getparam.c       |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp.c       | 25 ++++++++++++++++++----
 drivers/gpu/drm/i915/pxp/intel_pxp.h       |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c |  7 +++---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   |  7 +++---
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |  9 ++++++++
 7 files changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index fb0984f875f9..4dd744c96a37 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -42,8 +42,17 @@ static void gsc_work(struct work_struct *work)
 		}
 
 		ret = intel_gsc_proxy_request_handler(gsc);
-		if (ret)
+		if (ret) {
+			if (actions & GSC_ACTION_FW_LOAD) {
+				/*
+				 * a proxy request failure that came together with the
+				 * firmware load action means the last part of init has
+				 * failed so GSC fw won't be usable after this
+				 */
+				intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
+			}
 			goto out_put;
+		}
 
 		/* mark the GSC FW init as done the first time we run this */
 		if (actions & GSC_ACTION_FW_LOAD) {
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6f11d7eaa91a..1b2ee98a158a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -105,7 +105,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			return value;
 		break;
 	case I915_PARAM_PXP_STATUS:
-		value = intel_pxp_get_readiness_status(i915->pxp);
+		value = intel_pxp_get_readiness_status(i915->pxp, 1);
 		if (value < 0)
 			return value;
 		break;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index bb2e15329f34..1478bb9b4e26 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -359,21 +359,38 @@ void intel_pxp_end(struct intel_pxp *pxp)
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
 /*
  * this helper is used by both intel_pxp_start and by
  * the GET_PARAM IOCTL that user space calls. Thus, the
  * return values here should match the UAPI spec.
  */
-int intel_pxp_get_readiness_status(struct intel_pxp *pxp)
+int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout)
 {
 	if (!intel_pxp_is_enabled(pxp))
 		return -ENODEV;
 
+	if (pxp_required_fw_failed(pxp))
+		return -ENODEV;
+
+	if (pxp->platform_cfg_is_bad)
+		return -ENODEV;
+
 	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
-		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), 250))
+		if (wait_for(intel_pxp_gsccs_is_ready_for_sessions(pxp), timeout))
 			return 2;
 	} else {
-		if (wait_for(pxp_component_bound(pxp), 250))
+		if (wait_for(pxp_component_bound(pxp), timeout))
 			return 2;
 	}
 	return 1;
@@ -387,7 +404,7 @@ int intel_pxp_start(struct intel_pxp *pxp)
 {
 	int ret = 0;
 
-	ret = intel_pxp_get_readiness_status(pxp);
+	ret = intel_pxp_get_readiness_status(pxp, 250);
 	if (ret < 0)
 		return ret;
 	else if (ret > 1)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 17254c3f1267..46d65d641e2b 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -26,7 +26,7 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
 void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
 void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
 
-int intel_pxp_get_readiness_status(struct intel_pxp *pxp);
+int intel_pxp_get_readiness_status(struct intel_pxp *pxp, int timeout);
 int intel_pxp_get_backend_timeout_ms(struct intel_pxp *pxp);
 int intel_pxp_start(struct intel_pxp *pxp);
 void intel_pxp_end(struct intel_pxp *pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 8dc41de3f6f7..d891dd1d051e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -17,12 +17,13 @@
 #include "intel_pxp_types.h"
 
 static bool
-is_fw_err_platform_config(u32 type)
+is_fw_err_platform_config(u32 type, struct intel_pxp *pxp)
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
+		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
 			drm_info_once(&i915->drm,
 				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
 				      arb_session_id, msg_out.header.status,
@@ -268,7 +269,7 @@ void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 		drm_err(&i915->drm, "Failed to inv-stream-key-%u, ret=[%d]\n",
 			session_id, ret);
 	} else if (msg_out.header.status != 0) {
-		if (is_fw_err_platform_config(msg_out.header.status)) {
+		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
 			drm_info_once(&i915->drm,
 				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
 				      session_id, msg_out.header.status,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 1ce07d7e8769..535f4ff824b8 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -20,12 +20,13 @@
 #include "intel_pxp_types.h"
 
 static bool
-is_fw_err_platform_config(u32 type)
+is_fw_err_platform_config(u32 type, struct intel_pxp *pxp)
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
+		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
 			drm_info_once(&i915->drm,
 				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
 				      arb_session_id, msg_out.header.status,
@@ -387,7 +388,7 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%u, ret=[%d]\n",
 			session_id, ret);
 	} else if (msg_out.header.status != 0) {
-		if (is_fw_err_platform_config(msg_out.header.status)) {
+		if (is_fw_err_platform_config(msg_out.header.status, pxp)) {
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

base-commit: a66da4c33d8ede541aea9ba6d0d73b556a072d54
-- 
2.39.0

