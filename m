Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3687D6726
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB5910E625;
	Wed, 25 Oct 2023 09:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3A10E621
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227037; x=1729763037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZXnSdWR8LXRWq3/k6LxsCNXGFbJJmhxFvpS3g7ii30=;
 b=K/c4D1cHJ1sYfU0vXIW8pU20S3w4nM6MYk6iZeXawJyzc/cw8w3UPI2W
 whFw3na4JEcF6yYN0psrY+SP4iy5QL8o3U2SUR++gHJlgnSvo1YJMO6eO
 cZHAOwQems+CfoElpLwLUiSRaKsqmOL1UrNKlEC49BCqyrPMFkZlFVTPe
 ZOddBOuUFhOnw9EqrY4zSs8tZmhdhhxFABuWWXxFaDLCoLg59iW/5S3pY
 Gs0lI78x+oX3qK4l5hHydQUtnEZx7RH6pYHaEgEhI4ECaZBRc81F757u+
 YDOVkrIbzq06PpFUS6DpbcWu5Z0rRagw/t6s2KKBIjWb0D+LhPps7BCq4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451498831"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="451498831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882401168"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882401168"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:55 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] accel/ivpu: Introduce ivpu_ipc_send_receive_active()
Date: Wed, 25 Oct 2023 11:43:19 +0200
Message-Id: <20231025094323.989987-8-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Split ivpu_ipc_send_receive() implementation to have a version
that does not call pm_runtime_resume_and_get(). That implementation
can be invoked when device is up and runtime resume is prohibited
(for example at the end of boot sequence).

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c | 33 ++++++++++++++++++++++-----------
 drivers/accel/ivpu/ivpu_ipc.h |  8 +++++---
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index a4ca40b184d4..962b3bcca460 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -285,23 +285,20 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 	return ret;
 }
 
-int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
-			  enum vpu_ipc_msg_type expected_resp_type,
-			  struct vpu_jsm_msg *resp, u32 channel,
-			  unsigned long timeout_ms)
+int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+				 enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
+				 u32 channel, unsigned long timeout_ms)
 {
 	struct vpu_jsm_msg hb_req = { .type = VPU_JSM_MSG_QUERY_ENGINE_HB };
 	struct vpu_jsm_msg hb_resp;
 	int ret, hb_ret;
 
-	ret = ivpu_rpm_get(vdev);
-	if (ret < 0)
-		return ret;
+	drm_WARN_ON(&vdev->drm,
+		    vdev->drm.dev->power.runtime_status == RPM_SUSPENDED);
 
-	ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp_type, resp,
-					     channel, timeout_ms);
+	ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp, resp, channel, timeout_ms);
 	if (ret != -ETIMEDOUT)
-		goto rpm_put;
+		return ret;
 
 	hb_ret = ivpu_ipc_send_receive_internal(vdev, &hb_req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE,
 						&hb_resp, VPU_IPC_CHAN_ASYNC_CMD,
@@ -311,7 +308,21 @@ int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
 		ivpu_pm_schedule_recovery(vdev);
 	}
 
-rpm_put:
+	return ret;
+}
+
+int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+			  enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
+			  u32 channel, unsigned long timeout_ms)
+{
+	int ret;
+
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
+	ret = ivpu_ipc_send_receive_active(vdev, req, expected_resp, resp, channel, timeout_ms);
+
 	ivpu_rpm_put(vdev);
 	return ret;
 }
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 68f5b6668e00..6918db23daa4 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -85,9 +85,11 @@ int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		     struct ivpu_ipc_hdr *ipc_buf, struct vpu_jsm_msg *ipc_payload,
 		     unsigned long timeout_ms);
 
+int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+				 enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
+				 u32 channel, unsigned long timeout_ms);
 int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
-			  enum vpu_ipc_msg_type expected_resp_type,
-			  struct vpu_jsm_msg *resp, u32 channel,
-			  unsigned long timeout_ms);
+			  enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
+			  u32 channel, unsigned long timeout_ms);
 
 #endif /* __IVPU_IPC_H__ */
-- 
2.25.1

