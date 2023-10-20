Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9047D0DCB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A811210E5A4;
	Fri, 20 Oct 2023 10:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB69F10E5A4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798710; x=1729334710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Ol4SHi4pBNpbs7BOlXx2WERR5ht68shG0Bc+feycWI=;
 b=aoF//rCTpH3QbGMmeLU/0PjFn5vfVPQ3mzmFAbd5o6VRcq7sIPKkPxb0
 dM4EDT4qNBV0UB9YX5HE0mkBvpQNvb5wvcsZWMIwgb6Kcna2UobCHUBrb
 VcnU2kahDu9OI/rxJ9taxalVJBMRypDQChvjCUT61A5xD8ym1UZVX37df
 o3f5DUa8mZzDDNKYCv3tTdJRQx9HNCpwq7EdEvobZRi+5ASHmbLtp09Z8
 hnbBqWdUyhOGxywgFfkmbPG74dscNh3YcbAITPVxCOC6RwkjrA1Ueb4hz
 UZby1kUHZEY0169rA8ZeMtof/Uk/WM0QnrRA/7PnJtQwXwyRvF2dxHYjZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287493"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287493"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572505"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572505"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:06 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] accel/ivpu: Use ratelimited warn and err in IPC/JSM
Date: Fri, 20 Oct 2023 12:44:56 +0200
Message-Id: <20231020104501.697763-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>

Quite often during test corner cases IPC, JSM functions can flood
dmesg with warn or err messages. With that lost dmesg history.
Change warn, err to ratelimited versions in IPC, JSM to suppress
dmesg spam occurrence during fail test scenarios.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_ipc.c     | 29 ++++++++++++++++-------------
 drivers/accel/ivpu/ivpu_jsm_msg.c | 18 ++++++++++--------
 2 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index c2541035a30f..f0137536d7c6 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -79,8 +79,8 @@ ivpu_ipc_tx_prepare(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 
 	tx_buf_vpu_addr = gen_pool_alloc(ipc->mm_tx, sizeof(*tx_buf));
 	if (!tx_buf_vpu_addr) {
-		ivpu_err(vdev, "Failed to reserve IPC buffer, size %ld\n",
-			 sizeof(*tx_buf));
+		ivpu_err_ratelimited(vdev, "Failed to reserve IPC buffer, size %ld\n",
+				     sizeof(*tx_buf));
 		return -ENOMEM;
 	}
 
@@ -93,12 +93,12 @@ ivpu_ipc_tx_prepare(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 	jsm_vpu_addr = tx_buf_vpu_addr + offsetof(struct ivpu_ipc_tx_buf, jsm);
 
 	if (tx_buf->ipc.status != IVPU_IPC_HDR_FREE)
-		ivpu_warn(vdev, "IPC message vpu:0x%x not released by firmware\n",
-			  tx_buf_vpu_addr);
+		ivpu_warn_ratelimited(vdev, "IPC message vpu:0x%x not released by firmware\n",
+				      tx_buf_vpu_addr);
 
 	if (tx_buf->jsm.status != VPU_JSM_MSG_FREE)
-		ivpu_warn(vdev, "JSM message vpu:0x%x not released by firmware\n",
-			  jsm_vpu_addr);
+		ivpu_warn_ratelimited(vdev, "JSM message vpu:0x%x not released by firmware\n",
+				      jsm_vpu_addr);
 
 	memset(tx_buf, 0, sizeof(*tx_buf));
 	tx_buf->ipc.data_addr = jsm_vpu_addr;
@@ -266,18 +266,19 @@ ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req
 
 	ret = ivpu_ipc_send(vdev, &cons, req);
 	if (ret) {
-		ivpu_warn(vdev, "IPC send failed: %d\n", ret);
+		ivpu_warn_ratelimited(vdev, "IPC send failed: %d\n", ret);
 		goto consumer_del;
 	}
 
 	ret = ivpu_ipc_receive(vdev, &cons, NULL, resp, timeout_ms);
 	if (ret) {
-		ivpu_warn(vdev, "IPC receive failed: type 0x%x, ret %d\n", req->type, ret);
+		ivpu_warn_ratelimited(vdev, "IPC receive failed: type 0x%x, ret %d\n",
+				      req->type, ret);
 		goto consumer_del;
 	}
 
 	if (resp->type != expected_resp_type) {
-		ivpu_warn(vdev, "Invalid JSM response type: 0x%x\n", resp->type);
+		ivpu_warn_ratelimited(vdev, "Invalid JSM response type: 0x%x\n", resp->type);
 		ret = -EBADE;
 	}
 
@@ -375,13 +376,13 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 	while (ivpu_hw_reg_ipc_rx_count_get(vdev)) {
 		vpu_addr = ivpu_hw_reg_ipc_rx_addr_get(vdev);
 		if (vpu_addr == REG_IO_ERROR) {
-			ivpu_err(vdev, "Failed to read IPC rx addr register\n");
+			ivpu_err_ratelimited(vdev, "Failed to read IPC rx addr register\n");
 			return -EIO;
 		}
 
 		ipc_hdr = ivpu_to_cpu_addr(ipc->mem_rx, vpu_addr);
 		if (!ipc_hdr) {
-			ivpu_warn(vdev, "IPC msg 0x%x out of range\n", vpu_addr);
+			ivpu_warn_ratelimited(vdev, "IPC msg 0x%x out of range\n", vpu_addr);
 			continue;
 		}
 		ivpu_ipc_msg_dump(vdev, "RX", ipc_hdr, vpu_addr);
@@ -390,7 +391,8 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		if (ipc_hdr->channel != IVPU_IPC_CHAN_BOOT_MSG) {
 			jsm_msg = ivpu_to_cpu_addr(ipc->mem_rx, ipc_hdr->data_addr);
 			if (!jsm_msg) {
-				ivpu_warn(vdev, "JSM msg 0x%x out of range\n", ipc_hdr->data_addr);
+				ivpu_warn_ratelimited(vdev, "JSM msg 0x%x out of range\n",
+						      ipc_hdr->data_addr);
 				ivpu_ipc_rx_mark_free(vdev, ipc_hdr, NULL);
 				continue;
 			}
@@ -398,7 +400,8 @@ int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
 		}
 
 		if (atomic_read(&ipc->rx_msg_count) > IPC_MAX_RX_MSG) {
-			ivpu_warn(vdev, "IPC RX msg dropped, msg count %d\n", IPC_MAX_RX_MSG);
+			ivpu_warn_ratelimited(vdev, "IPC RX msg dropped, msg count %d\n",
+					      IPC_MAX_RX_MSG);
 			ivpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
 			continue;
 		}
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index bdddef2c59ee..5d37efa8ce31 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -22,7 +22,7 @@ int ivpu_jsm_register_db(struct ivpu_device *vdev, u32 ctx_id, u32 db_id,
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_REGISTER_DB_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret) {
-		ivpu_err(vdev, "Failed to register doorbell %d: %d\n", db_id, ret);
+		ivpu_err_ratelimited(vdev, "Failed to register doorbell %d: %d\n", db_id, ret);
 		return ret;
 	}
 
@@ -42,7 +42,7 @@ int ivpu_jsm_unregister_db(struct ivpu_device *vdev, u32 db_id)
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_UNREGISTER_DB_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret) {
-		ivpu_warn(vdev, "Failed to unregister doorbell %d: %d\n", db_id, ret);
+		ivpu_warn_ratelimited(vdev, "Failed to unregister doorbell %d: %d\n", db_id, ret);
 		return ret;
 	}
 
@@ -65,7 +65,8 @@ int ivpu_jsm_get_heartbeat(struct ivpu_device *vdev, u32 engine, u64 *heartbeat)
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret) {
-		ivpu_err(vdev, "Failed to get heartbeat from engine %d: %d\n", engine, ret);
+		ivpu_err_ratelimited(vdev, "Failed to get heartbeat from engine %d: %d\n",
+				     engine, ret);
 		return ret;
 	}
 
@@ -87,7 +88,7 @@ int ivpu_jsm_reset_engine(struct ivpu_device *vdev, u32 engine)
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_ENGINE_RESET_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret)
-		ivpu_err(vdev, "Failed to reset engine %d: %d\n", engine, ret);
+		ivpu_err_ratelimited(vdev, "Failed to reset engine %d: %d\n", engine, ret);
 
 	return ret;
 }
@@ -107,7 +108,7 @@ int ivpu_jsm_preempt_engine(struct ivpu_device *vdev, u32 engine, u32 preempt_id
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_ENGINE_PREEMPT_DONE, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret)
-		ivpu_err(vdev, "Failed to preempt engine %d: %d\n", engine, ret);
+		ivpu_err_ratelimited(vdev, "Failed to preempt engine %d: %d\n", engine, ret);
 
 	return ret;
 }
@@ -123,7 +124,8 @@ int ivpu_jsm_dyndbg_control(struct ivpu_device *vdev, char *command, size_t size
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_DYNDBG_CONTROL_RSP, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret)
-		ivpu_warn(vdev, "Failed to send command \"%s\": ret %d\n", command, ret);
+		ivpu_warn_ratelimited(vdev, "Failed to send command \"%s\": ret %d\n",
+				      command, ret);
 
 	return ret;
 }
@@ -138,7 +140,7 @@ int ivpu_jsm_trace_get_capability(struct ivpu_device *vdev, u32 *trace_destinati
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret) {
-		ivpu_warn(vdev, "Failed to get trace capability: %d\n", ret);
+		ivpu_warn_ratelimited(vdev, "Failed to get trace capability: %d\n", ret);
 		return ret;
 	}
 
@@ -162,7 +164,7 @@ int ivpu_jsm_trace_set_config(struct ivpu_device *vdev, u32 trace_level, u32 tra
 	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_TRACE_SET_CONFIG_RSP, &resp,
 				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
 	if (ret)
-		ivpu_warn(vdev, "Failed to set config: %d\n", ret);
+		ivpu_warn_ratelimited(vdev, "Failed to set config: %d\n", ret);
 
 	return ret;
 }
-- 
2.25.1

