Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04367AB57
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBD710E74C;
	Wed, 25 Jan 2023 08:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B6D10E739;
 Wed, 25 Jan 2023 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674634015; x=1706170015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CecBNlzLfx69wkNRYxcYp6BbWGZSO2OVColV2eRTgjE=;
 b=ROX4x/RcngzeLS0hNql9LDVSlc7epkjgk9wNZiJIRz8R3MeRWL3n66B4
 jnrxgfRORvV4OGXHrEgrJRlXIBxauesPTUoQykbW3PqNGpR6ZNZGGdVxI
 lTbFcqtj1HYelFe24yicCtcWSTU/6DQuTXdjuN4on2Qp4Y5K2VAhw6Ws+
 2lSIhHnPuuT7B2MgcTyp4aC4bU/ZDrABSCGpXmDQ7L1Ykv6jk5MzBlWfN
 KcmohOmn3X1yzzaRh54ttOINkHb/t15OFdoQpg7635PkRXrmML+Qq2+6h
 l0Q5x1UBGMokv1cUKBEwTQpTUWZGc7eCyepKLGfbJyALWjeYA4jwk2Ige w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310079371"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="310079371"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991180685"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="991180685"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 00:06:54 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 5/8] drm/i915/pxp: Add ARB session creation with new PXP
 API Ver4.3
Date: Wed, 25 Jan 2023 00:06:48 -0800
Message-Id: <20230125080651.100223-6-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
References: <20230125080651.100223-1-alan.previn.teres.alexis@intel.com>
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

Before checking the return status, look at the GSC-CS-Mem-Header's
pending-bit which means the GSC firmware is busy and we should
resubmit.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  9 +++-
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h | 21 ++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 54 ++++++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  2 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  6 ++-
 5 files changed, 87 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 4350921e40c4..9b56f743eac9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -297,8 +297,13 @@ int intel_pxp_start(struct intel_pxp *pxp)
 	if (!intel_pxp_is_enabled(pxp))
 		return -ENODEV;
 
-	if (wait_for(pxp_component_bound(pxp), 250))
-		return -ENXIO;
+	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
+		if (wait_for(intel_uc_fw_is_running(&pxp->ctrl_gt->uc.gsc.fw), 250))
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
index 35b6bfa55dfc..066df4fc001f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -13,11 +13,11 @@
 #include "intel_pxp_gsccs.h"
 #include "intel_pxp_types.h"
 
-__maybe_unused
 static int gsccs_send_message(struct intel_pxp *pxp,
 			      void *msg_in, size_t msg_in_size,
 			      void *msg_out, size_t msg_out_size_max,
-			      size_t *msg_out_len)
+			      size_t *msg_out_len,
+			      u64 *gsc_msg_handle_retry)
 {
 	struct intel_gt *gt = pxp->ctrl_gt;
 	struct drm_i915_private *i915 = gt->i915;
@@ -46,6 +46,9 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 					      msg_in_size + sizeof(*header),
 					      exec->host_session_handle);
 
+	/* copy caller provided gsc message handle if this is polling for a prior msg completion */
+	header->gsc_message_handle = *gsc_msg_handle_retry;
+
 	memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
 
 	pkt.addr_in = i915_vma_offset(exec->pkt_vma);
@@ -79,6 +82,13 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 	}
 	if (header->flags & GSC_HECI_FLAG_MSG_PENDING) {
 		drm_dbg(&i915->drm, "gsc PXP reply is busy\n");
+		/*
+		 * When the GSC firmware replies with pending bit, it means that the requested
+		 * operation has begun but the completion is pending and the caller needs
+		 * to re-request with the gsc_message_handle that was returned by the firmware.
+		 * until the pending bit is turned off.
+		 */
+		*gsc_msg_handle_retry = header->gsc_message_handle;
 		ret = -EAGAIN;
 		goto unlock;
 	}
@@ -103,6 +113,46 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 	return ret;
 }
 
+int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
+				   int arb_session_id)
+{
+	struct gsccs_session_resources *exec =  &pxp->gsccs_res;
+	struct pxp43_create_arb_in msg_in = {0};
+	struct pxp43_create_arb_out msg_out = {0};
+	u64 gsc_session_retry = 0;
+	int ret, tries = 0;
+
+	/* get a unique host-session-handle (used later in HW cmds) at time of session creation */
+	get_random_bytes(&exec->host_session_handle, sizeof(exec->host_session_handle));
+
+	msg_in.header.api_version = PXP_APIVER(4, 3);
+	msg_in.header.command_id = PXP43_CMDID_INIT_SESSION;
+	msg_in.header.stream_id = (FIELD_PREP(PXP43_INIT_SESSION_APPID, arb_session_id) |
+				   FIELD_PREP(PXP43_INIT_SESSION_VALID, 1) |
+				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+	msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
+
+	/*
+	 * Keep sending request if GSC firmware was busy.
+	 * Based on specs, we can expects a worst case pending-bit
+	 * delay of 2000 milisecs.
+	 */
+	do {
+		ret = gsccs_send_message(pxp,
+					 &msg_in, sizeof(msg_in),
+					 &msg_out, sizeof(msg_out), NULL,
+					 &gsc_session_retry);
+		/* Only try again if gsc says so */
+		if (ret != -EAGAIN)
+			break;
+
+		msleep(20);
+	} while (++tries < 100);
+
+	return ret;
+}
+
 static int
 gsccs_create_buffer(struct intel_gt *gt,
 		    const char *bufname, size_t size,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 354ea9a8f940..4a381ede00f5 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -11,6 +11,8 @@
 struct intel_pxp;
 
 #ifdef CONFIG_DRM_I915_PXP
+int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
+				   int arb_session_id);
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
 int intel_pxp_gsccs_init(struct intel_pxp *pxp);
 
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 28f5ca838cb7..a4917d517e23 100644
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
-- 
2.39.0

