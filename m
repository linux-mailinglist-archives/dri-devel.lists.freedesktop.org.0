Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0114B6650C0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 01:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F13D10E6C1;
	Wed, 11 Jan 2023 00:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAD010E065;
 Wed, 11 Jan 2023 00:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673398613; x=1704934613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h0YtJJmGgLDWfZXf4Dm/DQW3XjguU506yOS1xoXQ1+w=;
 b=UvI0LvLx007CRLut/ozijpRk6LKssYBkbH2w9D2p6R+zAcIZtjwQiKts
 s5IquUsTGxFlOdkjtVn1RjAc785iQe7R7PvN0ocom378YUcS/Yrvcqznh
 cKAocBWlf5r9GiOtwm7JIblOKOuW5MsX6qP7e8YUyvuMWRk4zWusRRCH1
 VlAPbBifLeMYYDdIjf3Cpfyrzqr6RSSZ1QuyQPEvPr3SnxwOKwNju1k14
 H/MIfL4BcaCjKVQulrUYJQYncKODWlFrMDVZVxeU3q+65VaQF9Lsq31yD
 dxJRxKWglMv/rCzBWWu3KXe8nu1JbWhqYiD4tVpownSWRQpbkRPQx6Ukq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325307094"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="325307094"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 16:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831175660"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="831175660"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 16:56:52 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/9] drm/i915/pxp: Add ARB session creation with new PXP API
 Ver4.3
Date: Tue, 10 Jan 2023 16:56:37 -0800
Message-Id: <20230111005642.300761-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
References: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
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
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h | 21 +++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 56 ++++++++++++++++++-
 2 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 52b9a61bcdd4..ee78c0817ba1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -11,6 +11,7 @@
 
 /* PXP-Cmd-Op definitions */
 #define PXP43_CMDID_START_HUC_AUTH	0x0000003A
+#define PXP43_CMDID_INIT_SESSION	0x00000036
 
 /* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
 #define PXP43_MAX_HECI_IN_SIZE		(SZ_32K)
@@ -27,4 +28,24 @@ struct pxp43_start_huc_auth_out {
 	struct pxp_cmd_header header;
 } __packed;
 
+/* PXP-Input-Packet: Init PXP session */
+struct pxp43_create_arb_in {
+	struct pxp_cmd_header header;
+		/* header.stream_id fields for vesion 4.3 of Init PXP session: */
+		#define PXP43_INIT_SESSION_VALID GENMASK(0, 0)
+		#define PXP43_INIT_SESSION_APPTYPE GENMASK(1, 1)
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
index 84045e18591e..9fe30516eced 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -43,7 +43,8 @@ static inline struct gsccs_teelink_priv *pxp_to_gsccs_priv(struct intel_pxp *pxp
 static int gsccs_send_message(struct intel_pxp *pxp,
 			      void *msg_in, size_t msg_in_size,
 			      void *msg_out, size_t msg_out_size_max,
-			      size_t *msg_out_len)
+			      size_t *msg_out_len,
+			      u64 *gsc_msg_handle_retry)
 {
 	struct intel_gt *gt = pxp->ctrl_gt;
 	struct drm_i915_private *i915 = gt->i915;
@@ -74,6 +75,9 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 	intel_gsc_uc_heci_cmd_emit_mtl_header(header, MTL_HECI_CLIENT_PXP, msg_in_size,
 					      exec->host_session_handle, 0);
 
+	/* copy caller provided gsc message handle if this is polling for a prior msg completion */
+	header->gsc_message_handle = *gsc_msg_handle_retry;
+
 	memcpy(exec->pkt_vaddr + sizeof(*header), msg_in, msg_in_size);
 
 	pkt.addr_in = i915_vma_offset(exec->pkt_vma);
@@ -90,7 +94,7 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 		goto unlock;
 	}
 
-	/* we keep separate location for reply, so get the response header loc first */
+	/* we keep separate location for reply, so go to the response header now */
 	header = exec->pkt_vaddr + PXP43_MAX_HECI_IN_SIZE;
 
 	/* Response validity marker, status and busyness */
@@ -107,6 +111,13 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 	}
 	if (header->flags & MTL_GSC_HDR_FLAG_MSG_PENDING) {
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
@@ -134,7 +145,46 @@ static int gsccs_send_message(struct intel_pxp *pxp,
 int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
 				   int arb_session_id)
 {
-	return -ENODEV;
+	struct gsccs_session_resources *exec = &pxp_to_gsccs_priv(pxp)->arb_exec_res;
+	struct pxp43_create_arb_in msg_in = {0};
+	struct pxp43_create_arb_out msg_out = {0};
+	u64 gsc_session_retry = 0;
+	int insize, outsize, ret, tries = 0;
+	void *inptr, *outptr;
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
+	inptr = &msg_in;
+	outptr = &msg_out;
+	insize = sizeof(msg_in);
+	outsize = sizeof(msg_out);
+
+	/*
+	 * Keep sending request if GSC firmware was busy.
+	 * Based on test data, we expects a worst case delay of 250 milisecs.
+	 */
+	do {
+		ret = gsccs_send_message(pxp,
+					 inptr, insize,
+					 outptr, outsize, NULL,
+					 &gsc_session_retry);
+		/* Only try again if gsc says so */
+		if (ret != -EAGAIN)
+			break;
+
+		msleep(20);
+	} while (++tries < 12);
+
+	return ret;
 }
 
 static void
-- 
2.39.0

