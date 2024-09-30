Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B598AD74
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21C110E582;
	Mon, 30 Sep 2024 19:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAt6Fwd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89F810E58B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726040; x=1759262040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tW0WBWEKimQhfKv6gC9eHYLW30bxkqeKgwRAII4603M=;
 b=JAt6Fwd4sSjwMHSyQD6PFSG37n0hWZj2LQLC4e2J88tRLWeDfrGV1/2I
 l9Bg/rWyqj5QJEv9qaKa7cdApsuTFxf5G/yfgc6agMrA1EBxqkCtbB4M4
 4hXXp0Hfh1nQy/Ec+ZAW1MS1aHMjjJQ78oIlTCx2AYUuj6FFK79bfoWBd
 mhSWwMM93UDIsZZ+d3brJXE46h65n7n7gb0jWh7ntkkOYppKVFFOFm0vD
 zt2gOMMCl5UPGRShkKt09D6TL9QKylDJje6oXoebAgfYdJ8rZpGrjPAP4
 laSujgPmNCcnEvfCAf83XUHVHg9hOXHx3d5MfquYtl8/+OR2JX4z8xq2f A==;
X-CSE-ConnectionGUID: LD+YT5L+Q4+UKW+nrG3jDg==
X-CSE-MsgGUID: dtBir5UwQi68EUSYyhARcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962359"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:54:00 -0700
X-CSE-ConnectionGUID: mw/zQ5y+SHuMofSbfGilcQ==
X-CSE-MsgGUID: NDOh1RH0SFSJ94HJjhkyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370196"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:58 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 22/31] accel/ivpu: Prevent recovery invocation during probe
 and resume
Date: Mon, 30 Sep 2024 21:53:13 +0200
Message-ID: <20240930195322.461209-23-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@intel.com>

Refactor IPC send and receive functions to allow correct
handling of operations that should not trigger a recovery process.

Expose ivpu_send_receive_internal(), which is now utilized by the D0i3
entry, DCT initialization, and HWS initialization functions.
These functions have been modified to return error codes gracefully,
rather than initiating recovery.

The updated functions are invoked within ivpu_probe() and ivpu_resume(),
ensuring that any errors encountered during these stages result in a proper
teardown or shutdown sequence. The previous approach of triggering recovery
within these functions could lead to a race condition, potentially causing
undefined behavior and kernel crashes due to null pointer dereferences.

Fixes: 45e45362e095 ("accel/ivpu: Introduce ivpu_ipc_send_receive_active()")
Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c     | 35 +++++++++++--------------------
 drivers/accel/ivpu/ivpu_ipc.h     |  7 +++----
 drivers/accel/ivpu/ivpu_jsm_msg.c | 19 +++++++----------
 3 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index e7bccc20e4e4e..a4ebb761354c3 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -291,15 +291,16 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	return ret;
 }
 
-static int
+int
 ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
 			       enum vpu_ipc_msg_type expected_resp_type,
-			       struct vpu_jsm_msg *resp, u32 channel,
-			       unsigned long timeout_ms)
+			       struct vpu_jsm_msg *resp, u32 channel, unsigned long timeout_ms)
 {
 	struct ivpu_ipc_consumer cons;
 	int ret;
 
+	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev));
+
 	ivpu_ipc_consumer_add(vdev, &cons, channel, NULL);
 
 	ret = ivpu_ipc_send(vdev, &cons, req);
@@ -325,19 +326,21 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 	return ret;
 }
 
-int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
-				 enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
-				 u32 channel, unsigned long timeout_ms)
+int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+			  enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
+			  u32 channel, unsigned long timeout_ms)
 {
 	struct vpu_jsm_msg hb_req = { .type = VPU_JSM_MSG_QUERY_ENGINE_HB };
 	struct vpu_jsm_msg hb_resp;
 	int ret, hb_ret;
 
-	drm_WARN_ON(&vdev->drm, pm_runtime_status_suspended(vdev->drm.dev));
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
 
 	ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp, resp, channel, timeout_ms);
 	if (ret != -ETIMEDOUT)
-		return ret;
+		goto rpm_put;
 
 	hb_ret = ivpu_ipc_send_receive_internal(vdev, &hb_req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE,
 						&hb_resp, VPU_IPC_CHAN_ASYNC_CMD,
@@ -345,21 +348,7 @@ int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *r
 	if (hb_ret == -ETIMEDOUT)
 		ivpu_pm_trigger_recovery(vdev, "IPC timeout");
 
-	return ret;
-}
-
-int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
-			  enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
-			  u32 channel, unsigned long timeout_ms)
-{
-	int ret;
-
-	ret = ivpu_rpm_get(vdev);
-	if (ret < 0)
-		return ret;
-
-	ret = ivpu_ipc_send_receive_active(vdev, req, expected_resp, resp, channel, timeout_ms);
-
+rpm_put:
 	ivpu_rpm_put(vdev);
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 6bbe6e32c8749..b4dfb504679ba 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -101,10 +101,9 @@ int ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		     struct ivpu_ipc_hdr *ipc_buf, struct vpu_jsm_msg *jsm_msg,
 		     unsigned long timeout_ms);
-
-int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
-				 enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
-				 u32 channel, unsigned long timeout_ms);
+int ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+				   enum vpu_ipc_msg_type expected_resp_type,
+				   struct vpu_jsm_msg *resp, u32 channel, unsigned long timeout_ms);
 int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
 			  enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
 			  u32 channel, unsigned long timeout_ms);
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index cd33964d292bc..ae91ad24d10d8 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -271,9 +271,8 @@ int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev)
 
 	req.payload.pwr_d0i3_enter.send_response = 1;
 
-	ret = ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_PWR_D0I3_ENTER_DONE,
-					   &resp, VPU_IPC_CHAN_GEN_CMD,
-					   vdev->timeout.d0i3_entry_msg);
+	ret = ivpu_ipc_send_receive_internal(vdev, &req, VPU_JSM_MSG_PWR_D0I3_ENTER_DONE, &resp,
+					     VPU_IPC_CHAN_GEN_CMD, vdev->timeout.d0i3_entry_msg);
 	if (ret)
 		return ret;
 
@@ -431,8 +430,8 @@ int ivpu_jsm_hws_setup_priority_bands(struct ivpu_device *vdev)
 
 	req.payload.hws_priority_band_setup.normal_band_percentage = 10;
 
-	ret = ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP_RSP,
-					   &resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	ret = ivpu_ipc_send_receive_internal(vdev, &req, VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP_RSP,
+					     &resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret)
 		ivpu_warn_ratelimited(vdev, "Failed to set priority bands: %d\n", ret);
 
@@ -545,9 +544,8 @@ int ivpu_jsm_dct_enable(struct ivpu_device *vdev, u32 active_us, u32 inactive_us
 	req.payload.pwr_dct_control.dct_active_us = active_us;
 	req.payload.pwr_dct_control.dct_inactive_us = inactive_us;
 
-	return ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_DCT_ENABLE_DONE,
-					    &resp, VPU_IPC_CHAN_ASYNC_CMD,
-					    vdev->timeout.jsm);
+	return ivpu_ipc_send_receive_internal(vdev, &req, VPU_JSM_MSG_DCT_ENABLE_DONE, &resp,
+					      VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 }
 
 int ivpu_jsm_dct_disable(struct ivpu_device *vdev)
@@ -555,9 +553,8 @@ int ivpu_jsm_dct_disable(struct ivpu_device *vdev)
 	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_DCT_DISABLE };
 	struct vpu_jsm_msg resp;
 
-	return ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_DCT_DISABLE_DONE,
-					    &resp, VPU_IPC_CHAN_ASYNC_CMD,
-					    vdev->timeout.jsm);
+	return ivpu_ipc_send_receive_internal(vdev, &req, VPU_JSM_MSG_DCT_DISABLE_DONE, &resp,
+					      VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 }
 
 int ivpu_jsm_state_dump(struct ivpu_device *vdev)
-- 
2.45.1

