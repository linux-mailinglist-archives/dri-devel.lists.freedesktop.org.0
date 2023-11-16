Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC97EE9F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 00:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4885F10E2D8;
	Thu, 16 Nov 2023 23:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8407F10E2D8;
 Thu, 16 Nov 2023 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700176843; x=1731712843;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AHdlijasPpYfdJ9Jt6N6vvvBtszP85uNsJvFObuDq1g=;
 b=J3yRQ2H6rYfY2x6N5luKMpoaphELuwER5EKsWVmqz1aVA1fnqAkfZ/ix
 JJCAw8jVQnO/LPYs+fIh0BuOUp2aakdn8faLChaKLt9KMWuMtRQGbCv+b
 IglZqfIuT+K1aa2eEBnQgYSBnevPkFxD+mlKMBDnNDCWIK8pbTNkbKawg
 dKhZ29hpeNdA/J9OaZvOKEhrohXu/PavyyWsuyoSwkrDsUZ1bCL0uCJDz
 SUoG006q3tMzZ2BQBzbScGoy5wMgxs2nS303ZteavYDvHFdiwsSoXMI1+
 JZiaCLw83zscHmvQCIj7a4T/Co+FAs8dV1JgW7rhBeM6hOQqf3p6sZX8w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="9860996"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="9860996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 15:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; 
   d="scan'208";a="6680981"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orviesa002.jf.intel.com with ESMTP; 16 Nov 2023 15:20:42 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/i915/pxp: Bail early in pxp tee backend on first
 teardown error
Date: Thu, 16 Nov 2023 15:20:41 -0800
Message-Id: <20231116232041.25534-1-alan.previn.teres.alexis@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For Gen12 when using mei-pxp tee backend tranport, if we are coming
up from a cold boot or from a resume (not runtime resume), we can
optionally quicken the very first session cleanup that would occur
as part of starting up a default PXP session. Typically a cleanup
from a cold-start is expected to be quick so we can use a shorter
timeout and skip retries (when getting non-success on calling
backend transport for intel_pxp_tee_end_arb_fw_session).

While we are touching this area of code, lets not update
pxp->platform_cfg_is_bad so its not done inside an "is_foo"
helper, move that to the helper's caller.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c         |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c   |  3 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c      |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c     | 23 +++++++++++++-------
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h   | 10 +++++++++
 6 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index dc327cf40b5a..b4de34e6ad01 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -140,6 +140,7 @@ static void pxp_init_full(struct intel_pxp *pxp)
 	if (ret)
 		return;
 
+	pxp->hw_state_coldstart = true;
 	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
 		ret = intel_pxp_gsccs_init(pxp);
 	else
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 75df959b0aa0..94a26faac14f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -24,7 +24,6 @@ is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
 	case PXP_STATUS_ERROR_API_VERSION:
 	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
 	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
-		pxp->platform_cfg_is_bad = true;
 		return true;
 	default:
 		break;
@@ -228,6 +227,7 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
 		drm_err(&i915->drm, "Failed to init session %d, ret=[%d]\n", arb_session_id, ret);
 	} else if (msg_out.header.status != 0) {
 		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
+			pxp->platform_cfg_is_bad = true;
 			drm_info_once(&i915->drm,
 				      "PXP init-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
 				      arb_session_id, msg_out.header.status,
@@ -271,6 +271,7 @@ void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 			session_id, ret);
 	} else if (msg_out.header.status != 0) {
 		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
+			pxp->platform_cfg_is_bad = true;
 			drm_info_once(&i915->drm,
 				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
 				      session_id, msg_out.header.status,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
index 6dfd24918953..fd53b4fd7bac 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
@@ -60,6 +60,7 @@ static void _pxp_resume(struct intel_pxp *pxp, bool take_wakeref)
 void intel_pxp_resume_complete(struct intel_pxp *pxp)
 {
 	_pxp_resume(pxp, true);
+	pxp->hw_state_coldstart = true;
 }
 
 void intel_pxp_runtime_resume(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 0a3e66b0265e..7979648c6a2c 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -114,6 +114,7 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 		intel_pxp_gsccs_end_arb_fw_session(pxp, ARB_SESSION);
 	else
 		intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
+	pxp->hw_state_coldstart = false;
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index b00d6c280159..07696738d31b 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -22,6 +22,7 @@
 #include "intel_pxp_types.h"
 
 #define PXP_TRANSPORT_TIMEOUT_MS 5000 /* 5 sec */
+#define PXP_TRANSPORT_TIMEOUT_FAST_MS 1000 /* 1 sec */
 
 static bool
 is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
@@ -30,7 +31,6 @@ is_fw_err_platform_config(struct intel_pxp *pxp, u32 type)
 	case PXP_STATUS_ERROR_API_VERSION:
 	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
 	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
-		pxp->platform_cfg_is_bad = true;
 		return true;
 	default:
 		break;
@@ -58,7 +58,8 @@ fw_err_to_string(u32 type)
 static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
 				    void *msg_in, u32 msg_in_size,
 				    void *msg_out, u32 msg_out_max_size,
-				    u32 *msg_out_rcv_size)
+				    u32 *msg_out_rcv_size,
+				    unsigned long timeout_ms)
 {
 	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
 	struct i915_pxp_component *pxp_component = pxp->pxp_component;
@@ -76,14 +77,14 @@ static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
 	}
 
 	ret = pxp_component->ops->send(pxp_component->tee_dev, msg_in, msg_in_size,
-				       PXP_TRANSPORT_TIMEOUT_MS);
+				       timeout_ms);
 	if (ret) {
 		drm_err(&i915->drm, "Failed to send PXP TEE message\n");
 		goto unlock;
 	}
 
 	ret = pxp_component->ops->recv(pxp_component->tee_dev, msg_out, msg_out_max_size,
-				       PXP_TRANSPORT_TIMEOUT_MS);
+				       timeout_ms);
 	if (ret < 0) {
 		drm_err(&i915->drm, "Failed to receive PXP TEE message\n");
 		goto unlock;
@@ -344,12 +345,13 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 	ret = intel_pxp_tee_io_message(pxp,
 				       &msg_in, sizeof(msg_in),
 				       &msg_out, sizeof(msg_out),
-				       NULL);
+				       NULL, PXP_TRANSPORT_TIMEOUT_MS);
 
 	if (ret) {
 		drm_err(&i915->drm, "Failed to send tee msg init arb session, ret=[%d]\n", ret);
 	} else if (msg_out.header.status != 0) {
 		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
+			pxp->platform_cfg_is_bad = true;
 			drm_info_once(&i915->drm,
 				      "PXP init-arb-session-%d failed due to BIOS/SOC:0x%08x:%s\n",
 				      arb_session_id, msg_out.header.status,
@@ -387,10 +389,14 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 	ret = intel_pxp_tee_io_message(pxp,
 				       &msg_in, sizeof(msg_in),
 				       &msg_out, sizeof(msg_out),
-				       NULL);
+				       NULL, pxp->hw_state_coldstart ?
+				       PXP_TRANSPORT_TIMEOUT_FAST_MS : PXP_TRANSPORT_TIMEOUT_MS);
 
-	/* Cleanup coherency between GT and Firmware is critical, so try again if it fails */
-	if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
+	/*
+	 * Cleanup coherency between GT and Firmware is critical, so try again if it
+	 * fails, unless we are performing a cold-start reset
+	 */
+	if ((ret || msg_out.header.status != 0x0) && !pxp->hw_state_coldstart &&  ++trials < 3)
 		goto try_again;
 
 	if (ret) {
@@ -398,6 +404,7 @@ void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
 			session_id, ret);
 	} else if (msg_out.header.status != 0) {
 		if (is_fw_err_platform_config(pxp, msg_out.header.status)) {
+			pxp->platform_cfg_is_bad = true;
 			drm_info_once(&i915->drm,
 				      "PXP inv-stream-key-%u failed due to BIOS/SOC :0x%08x:%s\n",
 				      session_id, msg_out.header.status,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7e11fa8034b2..acafd5dfe12f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -108,6 +108,16 @@ struct intel_pxp {
 	 * we only re-start the arb session when required.
 	 */
 	bool hw_state_invalidated;
+	/**
+	 * @hw_state_coldstart: If we are coming up from a cold boot or from
+	 * resume (not runtime resume) condition, we can optionally quicken
+	 * the very first session cleanup that would occur as part of starting
+	 * up a default PXP session. Typically a cleanup from a cold-start
+	 * is expected to be quick so we can use a shorter timeout and skip
+	 * retries (when getting non-success on calling backend transport
+	 * for intel_pxp_tee_end_arb_fw_session).
+	 */
+	bool hw_state_coldstart;
 
 	/** @irq_enabled: tracks the status of the kcr irqs */
 	bool irq_enabled;

base-commit: 346f47e69d27a4b3177c2939b1f6f26d093ad8c4
-- 
2.39.0

