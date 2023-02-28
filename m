Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445106A5113
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 03:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3C910E5A3;
	Tue, 28 Feb 2023 02:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2896010E471;
 Tue, 28 Feb 2023 02:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677550913; x=1709086913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ygbv1ZLxpsXmtm2bMKbBDM6FIbaCrrc4kLelBAs5y0Q=;
 b=h/SM2OBwJRBW8L0VlMLNdfX1biOf6WE1nk0cmgDDyMyB3AI16QU9n21B
 AGKH6HxASclPikct2RZMKAHTTIpf63DCQq6uqbqjs0YJqOwLtEKjDXMr9
 mZWzoqXjTzeLcJTuu3VNKE8sceAjEjIbRIqG1kuXllTFGYXqVgcwTTlsj
 fX3BVD5ZEKC36AlGhcX7QOd+DBFMa7Karc0dJkvefWanqVf1zOf9zyVTA
 qNT98EJjBu1Bvnv+HLopu5GGbf98DL3h0B8wK8Ee1dd8jIVcnVih+8xU4
 mOY2S0u+XDBCF9wgks9KN1RNLUhHMwbJIIc4Cv/6uPTK2lkRB5xMSDK6H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="334070733"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="334070733"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 18:21:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="919601732"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="919601732"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 27 Feb 2023 18:21:52 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
Date: Mon, 27 Feb 2023 18:21:47 -0800
Message-Id: <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MTL's function for ARB session creation using PXP firmware
version 4.3 ABI structure format.

Also add MTL's function for ARB session invalidation but this
reuses PXP firmware version 4.2 ABI structure format.

Before checking the return status, look at the GSC-CS-Mem-Header's
pending-bit which means the GSC firmware is busy and we should
resubmit.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c          | 34 ++++++++--
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h | 21 +++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 62 +++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  4 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  | 11 +++-
 5 files changed, 126 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index aecc65b5da70..61041277be24 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -290,6 +290,8 @@ static bool pxp_component_bound(struct intel_pxp *pxp)
 
 static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 {
+	int timeout;
+
 	if (!pxp->arb_is_valid)
 		return 0;
 	/*
@@ -299,7 +301,12 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 	intel_pxp_mark_termination_in_progress(pxp);
 	intel_pxp_terminate(pxp, false);
 
-	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		timeout = GSC_PENDING_RETRY_LATENCY_MS;
+	else
+		timeout = 250;
+
+	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
 		return -ETIMEDOUT;
 
 	return 0;
@@ -307,6 +314,8 @@ static int __pxp_global_teardown_final(struct intel_pxp *pxp)
 
 static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
 {
+	int timeout;
+
 	if (pxp->arb_is_valid)
 		return 0;
 	/*
@@ -315,7 +324,12 @@ static int __pxp_global_teardown_restart(struct intel_pxp *pxp)
 	 */
 	pxp_queue_termination(pxp);
 
-	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(250)))
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		timeout = GSC_PENDING_RETRY_LATENCY_MS;
+	else
+		timeout = 250;
+
+	if (!wait_for_completion_timeout(&pxp->termination, msecs_to_jiffies(timeout)))
 		return -ETIMEDOUT;
 
 	return 0;
@@ -353,8 +367,20 @@ int intel_pxp_start(struct intel_pxp *pxp)
 	if (!intel_pxp_is_enabled(pxp))
 		return -ENODEV;
 
-	if (wait_for(pxp_component_bound(pxp), 250))
-		return -ENXIO;
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
+		/*
+		 * GSC-fw loading, GSC-proxy init (requiring an mei component driver) and
+		 * HuC-fw loading must all occur first before we start requesting for PXP
+		 * sessions. Checking HuC authentication (the last dependency)  will suffice.
+		 * Let's use a much larger 8 second timeout considering all the types of
+		 * dependencies prior to that.
+		 */
+		if (wait_for(intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc), 8000))
+			return -ENXIO;
+	} else {
+		if (wait_for(pxp_component_bound(pxp), 250))
+			return -ENXIO;
+	}
 
 	mutex_lock(&pxp->arb_mutex);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index b2523d6918c7..9089e02a8c2d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -11,6 +11,7 @@
 
 /* PXP-Cmd-Op definitions */
 #define PXP43_CMDID_START_HUC_AUTH 0x0000003A
+#define PXP43_CMDID_INIT_SESSION 0x00000036
 
 /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
 #define PXP43_MAX_HECI_IN_SIZE (SZ_32K)
@@ -27,4 +28,24 @@ struct pxp43_start_huc_auth_out {
 	struct pxp_cmd_header header;
 } __packed;
 
+/* PXP-Input-Packet: Init PXP session */
+struct pxp43_create_arb_in {
+	struct pxp_cmd_header header;
+		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
+		#define PXP43_INIT_SESSION_VALID BIT(0)
+		#define PXP43_INIT_SESSION_APPTYPE BIT(1)
+		#define PXP43_INIT_SESSION_APPID GENMASK(17, 2)
+	u32 protection_mode;
+		#define PXP43_INIT_SESSION_PROTECTION_ARB 0x2
+	u32 sub_session_id;
+	u32 init_flags;
+	u32 rsvd[12];
+} __packed;
+
+/* PXP-Input-Packet: Init PXP session */
+struct pxp43_create_arb_out {
+	struct pxp_cmd_header header;
+	u32 rsvd[8];
+} __packed;
+
 #endif /* __INTEL_PXP_FW_INTERFACE_43_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 30aa660a975f..6f5c5dad8c16 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -9,6 +9,7 @@
 #include "gt/uc/intel_gsc_uc_heci_cmd_submit.h"
 
 #include "i915_drv.h"
+#include "intel_pxp_cmd_interface_42.h"
 #include "intel_pxp_cmd_interface_43.h"
 #include "intel_pxp_gsccs.h"
 #include "intel_pxp_types.h"
@@ -150,6 +151,67 @@ gsccs_send_message_retry_complete(struct intel_pxp *pxp,
 	return ret;
 }
 
+int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
+				   int arb_session_id)
+{
+	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
+	struct pxp43_create_arb_in msg_in = {0};
+	struct pxp43_create_arb_out msg_out = {0};
+	int ret;
+
+	msg_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
+	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, arb_session_id) |
+				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
+				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+	msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
+
+	ret = gsccs_send_message_retry_complete(pxp,
+						&msg_in, sizeof(msg_in),
+						&msg_out, sizeof(msg_out), NULL);
+	if (ret)
+		drm_warn(&i915->drm, "Failed to send gsccs msg for creating-session-%d: ret=[%d]\n",
+			 arb_session_id, ret);
+	else if (msg_out.header.status != 0x0)
+		drm_warn(&i915->drm, "PXP firmware failed on creating-session-%d: status=0x%08x\n",
+			 arb_session_id, msg_out.header.status);
+
+	return ret;
+}
+
+void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
+{
+	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
+	struct pxp42_inv_stream_key_in msg_in = {0};
+	struct pxp42_inv_stream_key_out msg_out = {0};
+	int ret = 0;
+
+	memset(&msg_in, 0, sizeof(msg_in));
+	memset(&msg_out, 0, sizeof(msg_out));
+	/*
+	 * Stream key invalidation reuses the same version 4.2 input/output
+	 * command format but firmware requires 4.3 API interaction
+	 */
+	msg_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in.header.command_id = PXP42_CMDID_INVALIDATE_STREAM_KEY;
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+
+	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
+	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
+	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
+
+	ret = gsccs_send_message_retry_complete(pxp,
+						&msg_in, sizeof(msg_in),
+						&msg_out, sizeof(msg_out), NULL);
+	if (ret)
+		drm_warn(&i915->drm, "Failed to send gsccs msg for inv-stream-session-%d: ret=[%d]\n",
+			 session_id, ret);
+	else if (msg_out.header.status != 0x0)
+		drm_warn(&i915->drm, "PXP firmware failed on inv-stream-session-%d: status=0x%08x\n",
+			 session_id, msg_out.header.status);
+}
+
 static int
 gsccs_create_buffer(struct intel_gt *gt,
 		    const char *bufname, size_t size,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index bd1c028bc80f..4d393f1248fe 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -13,11 +13,15 @@ struct intel_pxp;
 #define GSC_REPLY_LATENCY_MS 200
 #define GSC_PENDING_RETRY_MAXCOUNT 40
 #define GSC_PENDING_RETRY_PAUSE_MS 50
+#define GSC_PENDING_RETRY_LATENCY_MS (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS)
 
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
 int intel_pxp_gsccs_init(struct intel_pxp *pxp);
 
+int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
+void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
+
 #else
 static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
 {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index b8fa6df7141b..4ddf2ee60222 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -7,6 +7,7 @@
 
 #include "intel_pxp.h"
 #include "intel_pxp_cmd.h"
+#include "intel_pxp_gsccs.h"
 #include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "intel_pxp_types.h"
@@ -62,7 +63,10 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
 		return -EEXIST;
 	}
 
-	ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0))
+		ret = intel_pxp_gsccs_create_session(pxp, ARB_SESSION);
+	else
+		ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
 	if (ret) {
 		drm_err(&gt->i915->drm, "tee cmd for arb session creation failed\n");
 		return ret;
@@ -106,7 +110,10 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
 
 	intel_uncore_write(gt->uncore, KCR_GLOBAL_TERMINATE(pxp->kcr_base), 1);
 
-	intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
+	if (HAS_ENGINE(gt, GSC0))
+		intel_pxp_gsccs_end_arb_fw_session(pxp, ARB_SESSION);
+	else
+		intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
 
 	return ret;
 }
-- 
2.39.0

