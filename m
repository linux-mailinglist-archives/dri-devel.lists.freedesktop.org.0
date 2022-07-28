Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1BE583FCE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A964994C6;
	Thu, 28 Jul 2022 13:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F095D8DF0E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659014257; x=1690550257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dCA94kR9Bxf5Q+RwGP9uolJjYB3XW3PD+p6rqn13738=;
 b=eWF38Ha7njbl2eDCuuy/hI1crlIJXnKshGQgbHwDFcdIpUUIngkqhf0D
 idceBfsSUkApFRG8XovynQBDElZpMwWJOlyowtQUmkUyuaRPPfRHB8oIv
 YaKHwHgFJSsBsAVV9BSRFcXJXXFet7YOZdQU7db2b81Zh15+bMUYZPJz5
 3iqo564v6fG/yv3HOTpl3j7xiXF2n6MsbWhgjkjGcm4wdpuO/So31eOTY
 tjXk6E5lKoiCYWugGIiI42mk9N4+V/IL9TCN0hQd4go39BOTa7hdiBx6K
 icbILmcOMqoSGt2mNnFur0N/adj+trTgeiGn5s2cYiQG2rmUaZQOpODDE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288520377"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288520377"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659722670"
Received: from jlawryno-desktop.igk.intel.com ([172.22.229.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 06:17:35 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v1 4/7] drm/vpu: Add IPC driver and JSM messages
Date: Thu, 28 Jul 2022 15:17:06 +0200
Message-Id: <20220728131709.1087188-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: andrzej.kacprowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IPC driver is used to send and receive messages to/from firmware
running on the VPU.

The only supported IPC message format is Job Submission Model (JSM)
defined in vpu_jsm_api.h header.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/vpu/Makefile      |   2 +
 drivers/gpu/drm/vpu/vpu_drv.c     |  15 +
 drivers/gpu/drm/vpu/vpu_drv.h     |   1 +
 drivers/gpu/drm/vpu/vpu_hw_mtl.c  |   4 +
 drivers/gpu/drm/vpu/vpu_ipc.c     | 474 ++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_ipc.h     |  91 +++++
 drivers/gpu/drm/vpu/vpu_jsm_api.h | 529 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vpu/vpu_jsm_msg.c | 220 +++++++++++++
 drivers/gpu/drm/vpu/vpu_jsm_msg.h |  25 ++
 9 files changed, 1361 insertions(+)
 create mode 100644 drivers/gpu/drm/vpu/vpu_ipc.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_ipc.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_jsm_api.h
 create mode 100644 drivers/gpu/drm/vpu/vpu_jsm_msg.c
 create mode 100644 drivers/gpu/drm/vpu/vpu_jsm_msg.h

diff --git a/drivers/gpu/drm/vpu/Makefile b/drivers/gpu/drm/vpu/Makefile
index b2f7a6c240f7..43cede47c75f 100644
--- a/drivers/gpu/drm/vpu/Makefile
+++ b/drivers/gpu/drm/vpu/Makefile
@@ -5,6 +5,8 @@ intel_vpu-y := \
 	vpu_drv.o \
 	vpu_gem.o \
 	vpu_hw_mtl.o \
+	vpu_ipc.o \
+	vpu_jsm_msg.o \
 	vpu_mmu.o \
 	vpu_mmu_context.o
 
diff --git a/drivers/gpu/drm/vpu/vpu_drv.c b/drivers/gpu/drm/vpu/vpu_drv.c
index 0e820aeecdcc..48551c147a1c 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.c
+++ b/drivers/gpu/drm/vpu/vpu_drv.c
@@ -16,6 +16,7 @@
 #include "vpu_drv.h"
 #include "vpu_gem.h"
 #include "vpu_hw.h"
+#include "vpu_ipc.h"
 #include "vpu_mmu.h"
 #include "vpu_mmu_context.h"
 
@@ -201,6 +202,7 @@ int vpu_shutdown(struct vpu_device *vdev)
 	int ret;
 
 	vpu_hw_irq_disable(vdev);
+	vpu_ipc_disable(vdev);
 	vpu_mmu_disable(vdev);
 
 	ret = vpu_hw_power_down(vdev);
@@ -318,6 +320,10 @@ static int vpu_dev_init(struct vpu_device *vdev)
 	if (!vdev->mmu)
 		return -ENOMEM;
 
+	vdev->ipc = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->ipc), GFP_KERNEL);
+	if (!vdev->ipc)
+		return -ENOMEM;
+
 	vdev->hw->ops = &vpu_hw_mtl_ops;
 	vdev->platform = VPU_PLATFORM_INVALID;
 
@@ -361,8 +367,16 @@ static int vpu_dev_init(struct vpu_device *vdev)
 		goto err_mmu_gctx_fini;
 	}
 
+	ret = vpu_ipc_init(vdev);
+	if (ret) {
+		vpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
+		goto err_mmu_fini;
+	}
+
 	return 0;
 
+err_mmu_fini:
+	vpu_mmu_fini(vdev);
 err_mmu_gctx_fini:
 	vpu_mmu_global_context_fini(vdev);
 err_power_down:
@@ -378,6 +392,7 @@ static void vpu_dev_fini(struct vpu_device *vdev)
 {
 	vpu_shutdown(vdev);
 
+	vpu_ipc_fini(vdev);
 	vpu_mmu_fini(vdev);
 	vpu_mmu_global_context_fini(vdev);
 	vpu_irq_fini(vdev);
diff --git a/drivers/gpu/drm/vpu/vpu_drv.h b/drivers/gpu/drm/vpu/vpu_drv.h
index a9f3ad0c5f67..ddb83aeaf6d3 100644
--- a/drivers/gpu/drm/vpu/vpu_drv.h
+++ b/drivers/gpu/drm/vpu/vpu_drv.h
@@ -87,6 +87,7 @@ struct vpu_device {
 	struct vpu_wa_table wa;
 	struct vpu_hw_info *hw;
 	struct vpu_mmu_info *mmu;
+	struct vpu_ipc_info *ipc;
 
 	struct vpu_mmu_context gctx;
 	struct xarray context_xa;
diff --git a/drivers/gpu/drm/vpu/vpu_hw_mtl.c b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
index 901ec5c40de9..b53ec7b9cc4d 100644
--- a/drivers/gpu/drm/vpu/vpu_hw_mtl.c
+++ b/drivers/gpu/drm/vpu/vpu_hw_mtl.c
@@ -7,6 +7,7 @@
 #include "vpu_hw_mtl_reg.h"
 #include "vpu_hw_reg_io.h"
 #include "vpu_hw.h"
+#include "vpu_ipc.h"
 #include "vpu_mmu.h"
 
 #define TILE_FUSE_ENABLE_BOTH	     0x0
@@ -931,6 +932,9 @@ static irqreturn_t vpu_hw_mtl_irqv_handler(struct vpu_device *vdev, int irq)
 
 	REGV_WR32(MTL_VPU_HOST_SS_ICB_CLEAR_0, status);
 
+	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT, status))
+		ret &= vpu_ipc_irq_handler(vdev);
+
 	if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT, status))
 		ret &= vpu_mmu_irq_evtq_handler(vdev);
 
diff --git a/drivers/gpu/drm/vpu/vpu_ipc.c b/drivers/gpu/drm/vpu/vpu_ipc.c
new file mode 100644
index 000000000000..0a01e5614a5f
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_ipc.c
@@ -0,0 +1,474 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include <linux/genalloc.h>
+#include <linux/highmem.h>
+#include <linux/kthread.h>
+#include <linux/wait.h>
+
+#include "vpu_drv.h"
+#include "vpu_gem.h"
+#include "vpu_hw.h"
+#include "vpu_ipc.h"
+#include "vpu_jsm_msg.h"
+
+#define IPC_MAX_RX_MSG	128
+#define IS_KTHREAD()	(get_current()->flags & PF_KTHREAD)
+
+struct vpu_ipc_tx_buf {
+	struct vpu_ipc_hdr ipc;
+	struct vpu_jsm_msg jsm;
+} __packed;
+
+struct vpu_ipc_rx_msg {
+	struct list_head link;
+	struct vpu_ipc_hdr *ipc_hdr;
+	struct vpu_jsm_msg *jsm_msg;
+};
+
+static void vpu_ipc_msg_dump(struct vpu_device *vdev, char *c,
+			     struct vpu_ipc_hdr *ipc_hdr, u32 vpu_addr)
+{
+	vpu_dbg(IPC,
+		"%s: vpu:0x%x (data_addr:0x%08x, data_size:0x%x, channel:0x%x, src_node:0x%x, dst_node:0x%x, status:0x%x)",
+		c, vpu_addr, ipc_hdr->data_addr, ipc_hdr->data_size,
+		ipc_hdr->channel, ipc_hdr->src_node, ipc_hdr->dst_node,
+		ipc_hdr->status);
+}
+
+static void vpu_jsm_msg_dump(struct vpu_device *vdev, char *c,
+			     struct vpu_jsm_msg *jsm_msg, u32 vpu_addr)
+{
+	u32 *payload = (u32 *)&jsm_msg->payload;
+
+	vpu_dbg(JSM,
+		"%s: vpu:0x%08x (type:%s, status:0x%x, id: 0x%x, result: 0x%x, payload:0x%x 0x%x 0x%x 0x%x 0x%x)\n",
+		c, vpu_addr, vpu_jsm_msg_type_to_str(jsm_msg->type),
+		jsm_msg->status, jsm_msg->request_id, jsm_msg->result,
+		payload[0], payload[1], payload[2], payload[3], payload[4]);
+}
+
+static void
+vpu_ipc_rx_mark_free(struct vpu_device *vdev, struct vpu_ipc_hdr *ipc_hdr,
+		     struct vpu_jsm_msg *jsm_msg)
+{
+	ipc_hdr->status = VPU_IPC_HDR_FREE;
+	if (jsm_msg)
+		jsm_msg->status = VPU_JSM_MSG_FREE;
+	wmb(); /* Flush msg status to VPU */
+}
+
+static void vpu_ipc_mem_fini(struct vpu_device *vdev)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+
+	vpu_bo_free_internal(ipc->mem_rx);
+	vpu_bo_free_internal(ipc->mem_tx);
+}
+
+static int
+vpu_ipc_tx_prepare(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+		   struct vpu_jsm_msg *req)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_ipc_tx_buf *tx_buf;
+	u32 tx_buf_vpu_addr;
+	u32 jsm_vpu_addr;
+
+	tx_buf_vpu_addr = gen_pool_alloc(ipc->mm_tx, sizeof(*tx_buf));
+	if (!tx_buf_vpu_addr) {
+		vpu_err(vdev, "Failed to reserve IPC buffer, size %ld\n",
+			sizeof(*tx_buf));
+		return -ENOMEM;
+	}
+
+	tx_buf = vpu_to_cpu_addr(ipc->mem_tx, tx_buf_vpu_addr);
+	if (WARN_ON(!tx_buf)) {
+		gen_pool_free(ipc->mm_tx, tx_buf_vpu_addr, sizeof(*tx_buf));
+		return -EIO;
+	}
+
+	jsm_vpu_addr = tx_buf_vpu_addr + offsetof(struct vpu_ipc_tx_buf, jsm);
+
+	if (tx_buf->ipc.status != VPU_IPC_HDR_FREE)
+		vpu_warn(vdev, "IPC message vpu:0x%x not released by firmware\n",
+			 tx_buf_vpu_addr);
+
+	if (tx_buf->jsm.status != VPU_JSM_MSG_FREE)
+		vpu_warn(vdev, "JSM message vpu:0x%x not released by firmware\n",
+			 jsm_vpu_addr);
+
+	memset(tx_buf, 0, sizeof(*tx_buf));
+	tx_buf->ipc.data_addr = jsm_vpu_addr;
+	/* TODO: Set data_size to actual JSM message size, not union of all messages */
+	tx_buf->ipc.data_size = sizeof(*req);
+	tx_buf->ipc.channel = cons->channel;
+	tx_buf->ipc.src_node = 0;
+	tx_buf->ipc.dst_node = 1;
+	tx_buf->ipc.status = VPU_IPC_HDR_ALLOCATED;
+	tx_buf->jsm.type = req->type;
+	tx_buf->jsm.status = VPU_JSM_MSG_ALLOCATED;
+	tx_buf->jsm.payload = req->payload;
+
+	req->request_id = atomic_inc_return(&ipc->request_id);
+	tx_buf->jsm.request_id = req->request_id;
+	cons->request_id = req->request_id;
+	wmb(); /* Flush IPC, JSM msgs */
+
+	cons->tx_vpu_addr = tx_buf_vpu_addr;
+
+	vpu_jsm_msg_dump(vdev, "TX", &tx_buf->jsm, jsm_vpu_addr);
+	vpu_ipc_msg_dump(vdev, "TX", &tx_buf->ipc, tx_buf_vpu_addr);
+
+	return 0;
+}
+
+static void vpu_ipc_tx_release(struct vpu_device *vdev, u32 vpu_addr)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+
+	if (vpu_addr)
+		gen_pool_free(ipc->mm_tx, vpu_addr, sizeof(struct vpu_ipc_tx_buf));
+}
+
+static void vpu_ipc_tx(struct vpu_device *vdev, u32 vpu_addr)
+{
+	vpu_hw_reg_ipc_tx_set(vdev, vpu_addr);
+}
+
+void vpu_ipc_consumer_add(struct vpu_device *vdev,
+			  struct vpu_ipc_consumer *cons, u32 channel)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+
+	init_waitqueue_head(&cons->rx_msg_wq);
+	INIT_LIST_HEAD(&cons->link);
+	cons->channel = channel;
+	cons->tx_vpu_addr = 0;
+	cons->request_id = 0;
+
+	INIT_LIST_HEAD(&cons->rx_msg_list);
+
+	spin_lock_irq(&ipc->cons_list_lock);
+	list_add_tail(&cons->link, &ipc->cons_list);
+	spin_unlock_irq(&ipc->cons_list_lock);
+}
+
+void vpu_ipc_consumer_del(struct vpu_device *vdev, struct vpu_ipc_consumer *cons)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_ipc_rx_msg *rx_msg, *r;
+
+	spin_lock_irq(&ipc->cons_list_lock);
+
+	list_del(&cons->link);
+	list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link) {
+		list_del(&rx_msg->link);
+		vpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
+		atomic_dec(&ipc->rx_msg_count);
+		kfree(rx_msg);
+	}
+
+	spin_unlock_irq(&ipc->cons_list_lock);
+
+	vpu_ipc_tx_release(vdev, cons->tx_vpu_addr);
+}
+
+static int vpu_ipc_send(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+			struct vpu_jsm_msg *req)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	int ret;
+
+	if (mutex_lock_interruptible(&ipc->lock))
+		return -EINTR;
+
+	if (!ipc->on) {
+		ret = -EAGAIN;
+		goto unlock;
+	}
+
+	ret = vpu_ipc_tx_prepare(vdev, cons, req);
+	if (ret)
+		goto unlock;
+
+	vpu_ipc_tx(vdev, cons->tx_vpu_addr);
+
+unlock:
+	mutex_unlock(&ipc->lock);
+	return ret;
+}
+
+int vpu_ipc_receive(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+		    struct vpu_ipc_hdr *ipc_buf,
+		    struct vpu_jsm_msg *ipc_payload, unsigned long timeout_ms)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_ipc_rx_msg *rx_msg;
+	int wait_ret, ret = 0;
+
+	wait_ret = wait_event_interruptible_timeout(cons->rx_msg_wq,
+						    (IS_KTHREAD() && kthread_should_stop()) ||
+						    !list_empty(&cons->rx_msg_list),
+						    msecs_to_jiffies(timeout_ms));
+
+	if (IS_KTHREAD() && kthread_should_stop())
+		return -EINTR;
+
+	if (wait_ret == 0)
+		return -ETIMEDOUT;
+
+	if (wait_ret < 0)
+		return -ERESTARTSYS;
+
+	spin_lock_irq(&ipc->rx_msg_list_lock);
+	rx_msg = list_first_entry_or_null(&cons->rx_msg_list,
+					  struct vpu_ipc_rx_msg, link);
+	if (!rx_msg) {
+		spin_unlock_irq(&ipc->rx_msg_list_lock);
+		return -EAGAIN;
+	}
+	list_del(&rx_msg->link);
+	spin_unlock_irq(&ipc->rx_msg_list_lock);
+
+	if (ipc_buf)
+		memcpy(ipc_buf, rx_msg->ipc_hdr, sizeof(*ipc_buf));
+	if (rx_msg->jsm_msg) {
+		u32 size = min_t(int, rx_msg->ipc_hdr->data_size, sizeof(*ipc_payload));
+
+		if (rx_msg->jsm_msg->result != VPU_JSM_STATUS_SUCCESS) {
+			vpu_dbg(IPC, "IPC resp result error: %d\n", rx_msg->jsm_msg->result);
+			ret = -EBADMSG;
+		}
+
+		if (ipc_payload)
+			memcpy(ipc_payload, rx_msg->jsm_msg, size);
+	}
+
+	vpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
+	atomic_dec(&ipc->rx_msg_count);
+	kfree(rx_msg);
+
+	return ret;
+}
+
+int vpu_ipc_send_receive(struct vpu_device *vdev, struct vpu_jsm_msg *req,
+			 enum vpu_ipc_msg_type expected_resp_type,
+			 struct vpu_jsm_msg *resp, u32 channel,
+			 unsigned long timeout_ms)
+{
+	struct vpu_ipc_consumer cons;
+	int ret;
+
+	vpu_ipc_consumer_add(vdev, &cons, channel);
+
+	ret = vpu_ipc_send(vdev, &cons, req);
+	if (ret) {
+		vpu_warn(vdev, "IPC send failed: %d\n", ret);
+		goto consumer_del;
+	}
+
+	ret = vpu_ipc_receive(vdev, &cons, NULL, resp, timeout_ms);
+	if (ret) {
+		vpu_warn(vdev, "IPC receive failed: %d\n", ret);
+		goto consumer_del;
+	}
+
+	if (resp->type != expected_resp_type) {
+		vpu_warn(vdev, "Invalid JSM response type: %d\n", resp->type);
+		ret = -EBADE;
+	}
+
+consumer_del:
+	vpu_ipc_consumer_del(vdev, &cons);
+
+	return ret;
+}
+
+static bool
+vpu_ipc_match_consumer(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+		       struct vpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
+{
+	if (cons->channel != ipc_hdr->channel)
+		return false;
+
+	if (!jsm_msg || jsm_msg->request_id == cons->request_id)
+		return true;
+
+	return false;
+}
+
+static bool
+vpu_ipc_dispatch(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+		 struct vpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_ipc_rx_msg *rx_msg;
+	unsigned long f;
+
+	if (!vpu_ipc_match_consumer(vdev, cons, ipc_hdr, jsm_msg))
+		return false;
+
+	if (atomic_read(&ipc->rx_msg_count) > IPC_MAX_RX_MSG) {
+		vpu_warn(vdev, "IPC RX message dropped, msg count %d\n",
+			 IPC_MAX_RX_MSG);
+		vpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
+		return true;
+	}
+
+	rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
+	if (!rx_msg) {
+		vpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
+		return true;
+	}
+
+	atomic_inc(&ipc->rx_msg_count);
+
+	rx_msg->ipc_hdr = ipc_hdr;
+	rx_msg->jsm_msg = jsm_msg;
+
+	spin_lock_irqsave(&ipc->rx_msg_list_lock, f);
+	list_add_tail(&rx_msg->link, &cons->rx_msg_list);
+	spin_unlock_irqrestore(&ipc->rx_msg_list_lock, f);
+
+	wake_up_all(&cons->rx_msg_wq);
+
+	return true;
+}
+
+irqreturn_t vpu_ipc_irq_handler(struct vpu_device *vdev)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_ipc_consumer *cons;
+	struct vpu_ipc_hdr *ipc_hdr;
+	struct vpu_jsm_msg *jsm_msg;
+	unsigned long f;
+
+	/* Driver needs to purge all messages from IPC FIFO to clear IPC interrupt.
+	 * Without purge IPC FIFO to 0 next IPC interrupts won't be generated.
+	 */
+	while (vpu_hw_reg_ipc_rx_count_get(vdev)) {
+		u32 vpu_addr = vpu_hw_reg_ipc_rx_addr_get(vdev);
+		bool dispatched = false;
+
+		ipc_hdr = vpu_to_cpu_addr(ipc->mem_rx, vpu_addr);
+		if (!ipc_hdr) {
+			vpu_warn(vdev, "IPC message 0x%x out of range\n", vpu_addr);
+			continue;
+		}
+		vpu_ipc_msg_dump(vdev, "RX", ipc_hdr, vpu_addr);
+
+		jsm_msg = NULL;
+		if (ipc_hdr->channel != VPU_IPC_CHAN_BOOT_MSG) {
+			jsm_msg = vpu_to_cpu_addr(ipc->mem_rx, ipc_hdr->data_addr);
+
+			if (!jsm_msg) {
+				vpu_warn(vdev, "JSM message 0x%x out of range\n",
+					 ipc_hdr->data_addr);
+				vpu_ipc_rx_mark_free(vdev, ipc_hdr, NULL);
+				continue;
+			}
+
+			vpu_jsm_msg_dump(vdev, "RX", jsm_msg, ipc_hdr->data_addr);
+		}
+
+		spin_lock_irqsave(&ipc->cons_list_lock, f);
+		list_for_each_entry(cons, &ipc->cons_list, link) {
+			if (vpu_ipc_dispatch(vdev, cons, ipc_hdr, jsm_msg)) {
+				dispatched = true;
+				break;
+			}
+		}
+		spin_unlock_irqrestore(&ipc->cons_list_lock, f);
+
+		if (!dispatched) {
+			vpu_dbg(IPC, "IPC RX message 0x%x dropped (no consumer)\n",
+				vpu_addr);
+			vpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+int vpu_ipc_init(struct vpu_device *vdev)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_bo *mem_tx, *mem_rx;
+	int ret = -ENOMEM;
+
+	mem_tx = vpu_bo_alloc_internal(vdev, 0, SZ_16K, true);
+	if (!mem_tx)
+		return ret;
+
+	mem_rx = vpu_bo_alloc_internal(vdev, 0, SZ_16K, true);
+	if (!mem_rx)
+		goto err_free_tx;
+
+	ipc->mm_tx = devm_gen_pool_create(vdev->drm.dev, __ffs(VPU_IPC_ALIGNMENT),
+					  -1, "TX_IPC_JSM");
+	if (IS_ERR(ipc->mm_tx)) {
+		ret = PTR_ERR(ipc->mm_tx);
+		vpu_err(vdev, "Failed to create gen pool, %pe\n", ipc->mm_tx);
+		goto err_free_rx;
+	}
+
+	ret = gen_pool_add(ipc->mm_tx, mem_tx->vpu_addr, mem_tx->base.size, -1);
+	if (ret) {
+		vpu_err(vdev, "gen_pool_add failed, ret %d\n", ret);
+		goto err_free_rx;
+	}
+
+	ipc->mem_rx = mem_rx;
+	ipc->mem_tx = mem_tx;
+
+	memset(ipc->mem_tx->kvaddr, 0, ipc->mem_tx->base.size);
+	memset(ipc->mem_rx->kvaddr, 0, ipc->mem_rx->base.size);
+
+	spin_lock_init(&ipc->rx_msg_list_lock);
+	spin_lock_init(&ipc->cons_list_lock);
+	INIT_LIST_HEAD(&ipc->cons_list);
+
+	mutex_init(&ipc->lock);
+
+	return 0;
+
+err_free_rx:
+	vpu_bo_free_internal(mem_rx);
+err_free_tx:
+	vpu_bo_free_internal(mem_tx);
+	return ret;
+}
+
+void vpu_ipc_fini(struct vpu_device *vdev)
+{
+	vpu_ipc_mem_fini(vdev);
+}
+
+void vpu_ipc_enable(struct vpu_device *vdev)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+
+	mutex_lock(&ipc->lock);
+	ipc->on = true;
+	mutex_unlock(&ipc->lock);
+}
+
+void vpu_ipc_disable(struct vpu_device *vdev)
+{
+	struct vpu_ipc_info *ipc = vdev->ipc;
+	struct vpu_ipc_consumer *cons, *c;
+	unsigned long f;
+
+	mutex_lock(&ipc->lock);
+	ipc->on = false;
+	mutex_unlock(&ipc->lock);
+
+	spin_lock_irqsave(&ipc->cons_list_lock, f);
+	list_for_each_entry_safe(cons, c, &ipc->cons_list, link)
+		wake_up_all(&cons->rx_msg_wq);
+
+	spin_unlock_irqrestore(&ipc->cons_list_lock, f);
+}
diff --git a/drivers/gpu/drm/vpu/vpu_ipc.h b/drivers/gpu/drm/vpu/vpu_ipc.h
new file mode 100644
index 000000000000..1245bfbef4ac
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_ipc.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_IPC_H__
+#define __VPU_IPC_H__
+
+#include <linux/interrupt.h>
+
+#include "vpu_jsm_api.h"
+
+struct vpu_bo;
+
+/* VPU FW boot notification */
+#define VPU_IPC_CHAN_BOOT_MSG	   0x3ff
+#define VPU_IPC_BOOT_MSG_DATA_ADDR 0x424f4f54
+
+/* The alignment to be used for IPC Buffers and IPC Data. */
+#define VPU_IPC_ALIGNMENT	   64
+
+#define VPU_IPC_HDR_FREE	   0
+#define VPU_IPC_HDR_ALLOCATED	   0
+
+/**
+ * struct vpu_ipc_hdr - The IPC message header structure, exchanged
+ * with the VPU device firmware.
+ * @data_addr: The VPU address of the payload (JSM message)
+ * @data_size: The size of the payload.
+ * @channel: The channel used.
+ * @src_node: The Node ID of the sender.
+ * @dst_node: The Node ID of the intended receiver.
+ * @status: IPC buffer usage status
+ */
+struct vpu_ipc_hdr {
+	u32 data_addr;
+	u32 data_size;
+	u16 channel;
+	u8 src_node;
+	u8 dst_node;
+	u8 status;
+} __packed __aligned(VPU_IPC_ALIGNMENT);
+
+struct vpu_ipc_consumer {
+	struct list_head link;
+	u32 channel;
+	u32 tx_vpu_addr;
+	u32 request_id;
+
+	struct list_head rx_msg_list;
+	wait_queue_head_t rx_msg_wq;
+};
+
+struct vpu_ipc_info {
+	struct gen_pool *mm_tx;
+	struct vpu_bo *mem_tx;
+	struct vpu_bo *mem_rx;
+
+	spinlock_t rx_msg_list_lock; /* Lock for consumer rx_msg list */
+	atomic_t rx_msg_count;
+
+	spinlock_t cons_list_lock; /* Lock for consumers list */
+	struct list_head cons_list;
+
+	atomic_t request_id;
+	struct mutex lock; /* Lock on status */
+	bool on;
+};
+
+int vpu_ipc_init(struct vpu_device *vdev);
+void vpu_ipc_fini(struct vpu_device *vdev);
+
+void vpu_ipc_enable(struct vpu_device *vdev);
+void vpu_ipc_disable(struct vpu_device *vdev);
+
+irqreturn_t vpu_ipc_irq_handler(struct vpu_device *vdev);
+
+void vpu_ipc_consumer_add(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+			  u32 channel);
+void vpu_ipc_consumer_del(struct vpu_device *vdev, struct vpu_ipc_consumer *cons);
+
+int vpu_ipc_receive(struct vpu_device *vdev, struct vpu_ipc_consumer *cons,
+		    struct vpu_ipc_hdr *ipc_buf, struct vpu_jsm_msg *ipc_payload,
+		    unsigned long timeout_ms);
+
+int vpu_ipc_send_receive(struct vpu_device *vdev, struct vpu_jsm_msg *req,
+			 enum vpu_ipc_msg_type expected_resp_type,
+			 struct vpu_jsm_msg *resp, u32 channel,
+			 unsigned long timeout_ms);
+
+#endif /* __VPU_IPC_H__ */
diff --git a/drivers/gpu/drm/vpu/vpu_jsm_api.h b/drivers/gpu/drm/vpu/vpu_jsm_api.h
new file mode 100644
index 000000000000..6ca0c45479c0
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_jsm_api.h
@@ -0,0 +1,529 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+/**
+ * @file
+ * @brief JSM shared definitions
+ *
+ * @ingroup Jsm
+ * @brief JSM shared definitions
+ * @{
+ */
+#ifndef VPU_JSM_API_H
+#define VPU_JSM_API_H
+
+/*
+ * Major version changes that break backward compatibility
+ */
+#define VPU_JSM_API_VER_MAJOR 2
+
+/*
+ * Minor version changes when API backward compatibility is preserved.
+ */
+#define VPU_JSM_API_VER_MINOR 5
+
+/*
+ * API header changed (field names, documentation, formatting) but API itself has not been changed
+ */
+#define VPU_JSM_API_VER_PATCH 2
+
+/*
+ * Index in the API version table
+ */
+#define VPU_JSM_API_VER_INDEX 4
+
+/** Pack the API structures for now, once alignment issues are fixed this can be removed */
+#pragma pack(push, 1)
+
+/*
+ * Engine indexes.
+ */
+#define VPU_ENGINE_COMPUTE 0
+#define VPU_ENGINE_COPY	   1
+#define VPU_ENGINE_NB	   2
+
+/*
+ * VPU status values.
+ */
+#define VPU_JSM_STATUS_SUCCESS				 0x0U
+#define VPU_JSM_STATUS_PARSING_ERR			 0x1U
+#define VPU_JSM_STATUS_PROCESSING_ERR			 0x2U
+#define VPU_JSM_STATUS_PREEMPTED			 0x3U
+#define VPU_JSM_STATUS_ABORTED				 0x4U
+#define VPU_JSM_STATUS_USER_CTX_VIOL_ERR		 0x5U
+#define VPU_JSM_STATUS_GLOBAL_CTX_VIOL_ERR		 0x6U
+#define VPU_JSM_STATUS_MVNCI_WRONG_INPUT_FORMAT		 0x7U
+#define VPU_JSM_STATUS_MVNCI_UNSUPPORTED_NETWORK_ELEMENT 0x8U
+#define VPU_JSM_STATUS_MVNCI_INVALID_HANDLE		 0x9U
+#define VPU_JSM_STATUS_MVNCI_OUT_OF_RESOURCES		 0xAU
+#define VPU_JSM_STATUS_MVNCI_NOT_IMPLEMENTED		 0xBU
+#define VPU_JSM_STATUS_MVNCI_INTERNAL_ERROR		 0xCU
+
+/*
+ * Host <-> VPU IPC channels.
+ * ASYNC commands use a high priority channel, other messages use low-priority ones.
+ */
+#define VPU_IPC_CHAN_ASYNC_CMD 0
+#define VPU_IPC_CHAN_GEN_CMD   10
+#define VPU_IPC_CHAN_JOB_RET   11
+
+/*
+ * Job flags bit masks.
+ */
+#define VPU_JOB_FLAGS_NULL_SUBMISSION_MASK 0x00000001
+
+/*
+ * Sizes of the reserved areas in jobs, in bytes.
+ */
+#define VPU_JOB_RESERVED_BYTES	     16
+/*
+ * Sizes of the reserved areas in job queues, in bytes.
+ */
+#define VPU_JOB_QUEUE_RESERVED_BYTES 52
+
+/*
+ * Max length (including trailing NULL char) of trace entity name (e.g., the
+ * name of a logging destination or a loggable HW component).
+ */
+#define VPU_TRACE_ENTITY_NAME_MAX_LEN 32
+
+/*
+ * Max length (including trailing NULL char) of a dyndbg command.
+ *
+ * NOTE: 112 is used so that the size of 'struct vpu_ipc_msg' in the JSM API is
+ * 128 bytes (multiple of 64 bytes, the cache line size).
+ */
+#define VPU_DYNDBG_CMD_MAX_LEN 112
+
+/*
+ * Job format.
+ */
+struct vpu_job_queue_entry {
+	u64 batch_buf_addr; /**< Address of VPU commands batch buffer */
+	u32 job_id;	  /**< Job ID */
+	u32 flags; /**< Flags bit field, see VPU_JOB_FLAGS_* above */
+	u64 root_page_table_addr; /**< Address of root page table to use for this job */
+	u64 root_page_table_update_counter; /**< Page tables update events counter */
+	u64 preemption_buffer_address; /**< Address of the preemption buffer to use for this job */
+	u64 preemption_buffer_size; /**< Size of the preemption buffer to use for this job */
+	u8 reserved[VPU_JOB_RESERVED_BYTES];
+};
+
+/*
+ * Job queue control registers.
+ */
+struct vpu_job_queue_header {
+	u32 engine_idx;
+	u32 head;
+	u32 tail;
+	u8 reserved[VPU_JOB_QUEUE_RESERVED_BYTES];
+};
+
+/*
+ * Job queue format.
+ */
+struct vpu_job_queue {
+	struct vpu_job_queue_header header;
+	struct vpu_job_queue_entry job[];
+};
+
+/**
+ * Logging entity types.
+ *
+ * This enum defines the different types of entities involved in logging.
+ */
+enum vpu_trace_entity_type {
+	/** Logging destination (entity where logs can be stored / printed). */
+	VPU_TRACE_ENTITY_TYPE_DESTINATION = 1,
+	/** Loggable HW component (HW entity that can be logged). */
+	VPU_TRACE_ENTITY_TYPE_HW_COMPONENT = 2,
+};
+
+/*
+ * Host <-> VPU IPC messages types.
+ */
+enum vpu_ipc_msg_type {
+	VPU_JSM_MSG_UNKNOWN = 0xFFFFFFFF,
+	/* IPC Host -> Device, Async commands */
+	VPU_JSM_MSG_ASYNC_CMD = 0x1100,
+	VPU_JSM_MSG_ENGINE_RESET = VPU_JSM_MSG_ASYNC_CMD,
+	VPU_JSM_MSG_ENGINE_PREEMPT = 0x1101,
+	VPU_JSM_MSG_REGISTER_DB = 0x1102,
+	VPU_JSM_MSG_UNREGISTER_DB = 0x1103,
+	VPU_JSM_MSG_QUERY_ENGINE_HB = 0x1104,
+	VPU_JSM_MSG_GET_POWER_LEVEL_COUNT = 0x1105,
+	VPU_JSM_MSG_GET_POWER_LEVEL = 0x1106,
+	VPU_JSM_MSG_SET_POWER_LEVEL = 0x1107,
+	VPU_JSM_MSG_METRIC_STREAMER_OPEN = 0x1108,
+	VPU_JSM_MSG_METRIC_STREAMER_CLOSE = 0x1109,
+	/** Configure logging (used to modify configuration passed in boot params). */
+	VPU_JSM_MSG_TRACE_SET_CONFIG = 0x110a,
+	/** Return current logging configuration. */
+	VPU_JSM_MSG_TRACE_GET_CONFIG = 0x110b,
+	/**
+	 * Get masks of destinations and HW components supported by the firmware
+	 * (may vary between HW generations and FW compile
+	 * time configurations)
+	 */
+	VPU_JSM_MSG_TRACE_GET_CAPABILITY = 0x110c,
+	/** Get the name of a destination or HW component. */
+	VPU_JSM_MSG_TRACE_GET_NAME = 0x110d,
+	/**
+	 * Clean up user context. All jobs that belong to the current context are
+	 * aborted and removed from internal scheduling queues. All doorbells assigned
+	 * to the context are unregistered and any internal FW resources belonging to
+	 * the context are released.
+	 *
+	 * Note: VPU_JSM_MSG_CONTEXT_DELETE is currently added as a placeholder and is
+	 * not yet functional. Implementation of this command to be added by EISW-40925.
+	 */
+	VPU_JSM_MSG_CONTEXT_DELETE = 0x110e,
+	/* IPC Host -> Device, General commands */
+	VPU_JSM_MSG_GENERAL_CMD = 0x1200,
+	VPU_JSM_MSG_BLOB_DEINIT = VPU_JSM_MSG_GENERAL_CMD,
+	/**
+	 * Control dyndbg behavior by executing a dyndbg command; equivalent to
+	 * Linux command: `echo '<dyndbg_cmd>' > <debugfs>/dynamic_debug/control`.
+	 */
+	VPU_JSM_MSG_DYNDBG_CONTROL = 0x1201,
+	/* IPC Device -> Host, Job completion */
+	VPU_JSM_MSG_JOB_DONE = 0x2100,
+	/* IPC Device -> Host, Async command completion */
+	VPU_JSM_MSG_ASYNC_CMD_DONE = 0x2200,
+	VPU_JSM_MSG_ENGINE_RESET_DONE = VPU_JSM_MSG_ASYNC_CMD_DONE,
+	VPU_JSM_MSG_ENGINE_PREEMPT_DONE = 0x2201,
+	VPU_JSM_MSG_REGISTER_DB_DONE = 0x2202,
+	VPU_JSM_MSG_UNREGISTER_DB_DONE = 0x2203,
+	VPU_JSM_MSG_QUERY_ENGINE_HB_DONE = 0x2204,
+	VPU_JSM_MSG_GET_POWER_LEVEL_COUNT_DONE = 0x2205,
+	VPU_JSM_MSG_GET_POWER_LEVEL_DONE = 0x2206,
+	VPU_JSM_MSG_SET_POWER_LEVEL_DONE = 0x2207,
+	VPU_JSM_MSG_METRIC_STREAMER_OPEN_DONE = 0x2208,
+	VPU_JSM_MSG_METRIC_STREAMER_CLOSE_DONE = 0x2209,
+	/** Response to VPU_JSM_MSG_TRACE_SET_CONFIG. */
+	VPU_JSM_MSG_TRACE_SET_CONFIG_RSP = 0x220a,
+	/** Response to VPU_JSM_MSG_TRACE_GET_CONFIG. */
+	VPU_JSM_MSG_TRACE_GET_CONFIG_RSP = 0x220b,
+	/** Response to VPU_JSM_MSG_TRACE_GET_CAPABILITY. */
+	VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP = 0x220c,
+	/** Response to VPU_JSM_MSG_TRACE_GET_NAME. */
+	VPU_JSM_MSG_TRACE_GET_NAME_RSP = 0x220d,
+	/** Response to VPU_JSM_MSG_CONTEXT_DELETE. */
+	VPU_JSM_MSG_CONTEXT_DELETE_DONE = 0x220e,
+	/* IPC Device -> Host, General command completion */
+	VPU_JSM_MSG_GENERAL_CMD_DONE = 0x2300,
+	VPU_JSM_MSG_BLOB_DEINIT_DONE = VPU_JSM_MSG_GENERAL_CMD_DONE,
+	/** Response to VPU_JSM_MSG_DYNDBG_CONTROL. */
+	VPU_JSM_MSG_DYNDBG_CONTROL_RSP = 0x2301,
+};
+
+enum vpu_ipc_msg_status { VPU_JSM_MSG_FREE, VPU_JSM_MSG_ALLOCATED };
+
+/*
+ * Host <-> LRT IPC message payload definitions
+ */
+struct vpu_ipc_msg_payload_engine_reset {
+	/* Engine to be reset. */
+	u32 engine_idx;
+};
+
+struct vpu_ipc_msg_payload_engine_preempt {
+	/* Engine to be preempted. */
+	u32 engine_idx;
+	/* ID of the preemption request. */
+	u32 preempt_id;
+};
+
+struct vpu_ipc_msg_payload_register_db {
+	/* Index of the doorbell to register. */
+	u32 db_idx;
+	/* Virtual address in Global GTT pointing to the start of job queue. */
+	u64 jobq_base;
+	/* Size of the job queue in bytes. */
+	u32 jobq_size;
+	/* Host sub-stream ID for the context assigned to the doorbell. */
+	u32 host_ssid;
+};
+
+struct vpu_ipc_msg_payload_unregister_db {
+	/* Index of the doorbell to unregister. */
+	u32 db_idx;
+};
+
+struct vpu_ipc_msg_payload_query_engine_hb {
+	/* Engine to return heartbeat value. */
+	u32 engine_idx;
+};
+
+struct vpu_ipc_msg_payload_power_level {
+	/**
+	 * Requested power level. The power level value is in the
+	 * range [0, power_level_count-1] where power_level_count
+	 * is the number of available power levels as returned by
+	 * the get power level count command. A power level of 0
+	 * corresponds to the maximum possible power level, while
+	 * power_level_count-1 corresponds to the minimum possible
+	 * power level. Values outside of this range are not
+	 * considered to be valid.
+	 */
+	u32 power_level;
+};
+
+struct vpu_ipc_msg_payload_context_delete {
+	/* Host sub-stream ID for the context to be finalised. */
+	u32 host_ssid;
+};
+
+struct vpu_ipc_msg_payload_blob_deinit {
+	/* 64-bit unique ID for the blob to be de-initialized. */
+	u64 blob_id;
+};
+
+/**
+ * @brief Metric streamer open command structure
+ * @see VPU_JSM_MSG_METRIC_STREAMER_OPEN
+ */
+struct vpu_ipc_msg_payload_metric_streamer_open {
+	/* Bit mask to select the desired metric group */
+	/* @see bit indexes in vpu_metric_group_bit enum */
+	u64 metric_group_mask;
+	/* Sampling rate in milliseconds */
+	u32 rate;
+	/* Number of samples to collect */
+	u32 sample_count;
+	/**
+	 * 64bit address to an array of 32bit sizes of the buffers where
+	 * the counters will be stored.
+	 * The array is indexed by metric group bit indexes.
+	 */
+	u64 metric_size_array_address;
+	/**
+	 * 64bit address to an array of 32bit sizes of the buffers where
+	 * the counters will be stored.
+	 * The array is indexed by metric group bit indexes.
+	 */
+	u64 metric_data_array_address;
+};
+
+static_assert(sizeof(struct vpu_ipc_msg_payload_metric_streamer_open) % 8 == 0,
+	      "vpu_ipc_msg_payload_metric_streamer_open is misaligned");
+
+struct vpu_ipc_msg_payload_job_done {
+	/* Engine to which the job was submitted. */
+	u32 engine_idx;
+	/* Index of the doorbell to which the job was submitted */
+	u32 db_idx;
+	/* ID of the completed job */
+	u32 job_id;
+	/* Status of the completed job */
+	u32 job_status;
+};
+
+struct vpu_ipc_msg_payload_engine_reset_done {
+	/* Engine reset. */
+	u32 engine_idx;
+};
+
+struct vpu_ipc_msg_payload_engine_preempt_done {
+	/* Engine preempted. */
+	u32 engine_idx;
+	/* ID of the preemption request. */
+	u32 preempt_id;
+};
+
+struct vpu_ipc_msg_payload_register_db_done {
+	/* Index of the registered doorbell. */
+	u32 db_idx;
+};
+
+struct vpu_ipc_msg_payload_unregister_db_done {
+	/* Index of the unregistered doorbell. */
+	u32 db_idx;
+};
+
+struct vpu_ipc_msg_payload_query_engine_hb_done {
+	/* Engine returning heartbeat value. */
+	u32 engine_idx;
+	/* Heartbeat value. */
+	u64 heartbeat;
+};
+
+struct vpu_ipc_msg_payload_get_power_level_count_done {
+	/**
+	 * Number of supported power levels. The maximum possible
+	 * value of power_level_count is 16 but this may vary across
+	 * implementations.
+	 */
+	u32 power_level_count;
+	/**
+	 * Power consumption limit for each supported power level in
+	 * [0-100%] range relative to power level 0.
+	 */
+	u8 power_limit[16];
+};
+
+struct vpu_ipc_msg_payload_blob_deinit_done {
+	/* 64-bit unique ID for the blob de-initialized. */
+	u64 blob_id;
+};
+
+/**
+ * Payload for VPU_JSM_MSG_TRACE_SET_CONFIG[_RSP] and
+ * VPU_JSM_MSG_TRACE_GET_CONFIG_RSP messages.
+ *
+ * The payload is interpreted differently depending on the type of message:
+ *
+ * - For VPU_JSM_MSG_TRACE_SET_CONFIG, the payload specifies the desired
+ *   logging configuration to be set.
+ *
+ * - For VPU_JSM_MSG_TRACE_SET_CONFIG_RSP, the payload reports the logging
+ *   configuration that was set after a VPU_JSM_MSG_TRACE_SET_CONFIG request.
+ *   The host can compare this payload with the one it sent in the
+ *   VPU_JSM_MSG_TRACE_SET_CONFIG request to check whether or not the
+ *   configuration was set as desired.
+ *
+ * - VPU_JSM_MSG_TRACE_GET_CONFIG_RSP, the payload reports the current logging
+ *   configuration.
+ */
+struct vpu_ipc_msg_payload_trace_config {
+	/**
+	 * Logging level (currently set or to be set); see 'mvLog_t' enum for
+	 * acceptable values. The specified logging level applies to all
+	 * destinations and HW components
+	 */
+	u32 trace_level;
+	/**
+	 * Bitmask of logging destinations (currently enabled or to be enabled);
+	 * bitwise OR of values defined in logging_destination enum.
+	 */
+	u32 trace_destination_mask;
+	/**
+	 * Bitmask of loggable HW components (currently enabled or to be enabled);
+	 * bitwise OR of values defined in loggable_hw_component enum.
+	 */
+	u64 trace_hw_component_mask;
+	u64 reserved_0; /**< Reserved for future extensions. */
+};
+
+/**
+ * Payload for VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP messages.
+ */
+struct vpu_ipc_msg_payload_trace_capability_rsp {
+	u32 trace_destination_mask; /**< Bitmask of supported logging destinations. */
+	u32 reserved_0;
+	u64 trace_hw_component_mask; /**< Bitmask of supported loggable HW components. */
+	u64 reserved_1; /**< Reserved for future extensions. */
+};
+
+/**
+ * Payload for VPU_JSM_MSG_TRACE_GET_NAME requests.
+ */
+struct vpu_ipc_msg_payload_trace_get_name {
+	/**
+	 * The type of the entity to query name for; see logging_entity_type for
+	 * possible values.
+	 */
+	u32 entity_type;
+	u32 reserved_0;
+	/**
+	 * The ID of the entity to query name for; possible values depends on the
+	 * entity type.
+	 */
+	u64 entity_id;
+};
+
+/**
+ * Payload for VPU_JSM_MSG_TRACE_GET_NAME_RSP responses.
+ */
+struct vpu_ipc_msg_payload_trace_get_name_rsp {
+	/**
+	 * The type of the entity whose name was queried; see logging_entity_type
+	 * for possible values.
+	 */
+	u32 entity_type;
+	u32 reserved_0;
+	/**
+	 * The ID of the entity whose name was queried; possible values depends on
+	 * the entity type.
+	 */
+	u64 entity_id;
+	/** Reserved for future extensions. */
+	u64 reserved_1;
+	/** The name of the entity. */
+	char entity_name[VPU_TRACE_ENTITY_NAME_MAX_LEN];
+};
+
+/**
+ * Payload for VPU_JSM_MSG_DYNDBG_CONTROL requests.
+ *
+ * VPU_JSM_MSG_DYNDBG_CONTROL are used to control the VPU FW Dynamic Debug
+ * feature, which allows developers to selectively enable / disable MVLOG_DEBUG
+ * messages. This is equivalent to the Dynamic Debug functionality provided by
+ * Linux
+ * (https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html)
+ * The host can control Dynamic Debug behavior by sending dyndbg commands, which
+ * have the same syntax as Linux
+ * dyndbg commands.
+ *
+ * NOTE: in order for MVLOG_DEBUG messages to be actually printed, the host
+ * still has to set the logging level to MVLOG_DEBUG, using the
+ * VPU_JSM_MSG_TRACE_SET_CONFIG command.
+ *
+ * The host can see the current dynamic debug configuration by executing a
+ * special 'show' command. The dyndbg configuration will be printed to the
+ * configured logging destination using MVLOG_INFO logging level.
+ */
+struct vpu_ipc_msg_payload_dyndbg_control {
+	/**
+	 * Dyndbg command (same format as Linux dyndbg); must be a NULL-terminated
+	 * string.
+	 */
+	char dyndbg_cmd[VPU_DYNDBG_CMD_MAX_LEN];
+};
+
+/*
+ * Payloads union, used to define complete message format.
+ */
+union vpu_ipc_msg_payload {
+	struct vpu_ipc_msg_payload_engine_reset engine_reset;
+	struct vpu_ipc_msg_payload_engine_preempt engine_preempt;
+	struct vpu_ipc_msg_payload_register_db register_db;
+	struct vpu_ipc_msg_payload_unregister_db unregister_db;
+	struct vpu_ipc_msg_payload_query_engine_hb query_engine_hb;
+	struct vpu_ipc_msg_payload_power_level power_level;
+	struct vpu_ipc_msg_payload_blob_deinit blob_deinit;
+	struct vpu_ipc_msg_payload_metric_streamer_open metric_streamer_open;
+	struct vpu_ipc_msg_payload_context_delete context_delete;
+	struct vpu_ipc_msg_payload_job_done job_done;
+	struct vpu_ipc_msg_payload_engine_reset_done engine_reset_done;
+	struct vpu_ipc_msg_payload_engine_preempt_done engine_preempt_done;
+	struct vpu_ipc_msg_payload_register_db_done register_db_done;
+	struct vpu_ipc_msg_payload_unregister_db_done unregister_db_done;
+	struct vpu_ipc_msg_payload_query_engine_hb_done query_engine_hb_done;
+	struct vpu_ipc_msg_payload_get_power_level_count_done get_power_level_count_done;
+	struct vpu_ipc_msg_payload_blob_deinit_done blob_deinit_done;
+	struct vpu_ipc_msg_payload_trace_config trace_config;
+	struct vpu_ipc_msg_payload_trace_capability_rsp trace_capability;
+	struct vpu_ipc_msg_payload_trace_get_name trace_get_name;
+	struct vpu_ipc_msg_payload_trace_get_name_rsp trace_get_name_rsp;
+	struct vpu_ipc_msg_payload_dyndbg_control dyndbg_control;
+};
+
+/*
+ * Host <-> LRT IPC message base structure.
+ */
+struct vpu_jsm_msg {
+	enum vpu_ipc_msg_type type;
+	enum vpu_ipc_msg_status status;
+	u32 request_id;
+	u32 result;
+	union vpu_ipc_msg_payload payload;
+};
+
+#pragma pack(pop)
+
+#endif
+
+///@}
diff --git a/drivers/gpu/drm/vpu/vpu_jsm_msg.c b/drivers/gpu/drm/vpu/vpu_jsm_msg.c
new file mode 100644
index 000000000000..ee4c1b74c329
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_jsm_msg.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#include "vpu_drv.h"
+#include "vpu_ipc.h"
+#include "vpu_jsm_msg.h"
+
+const char *vpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type)
+{
+	switch (type) {
+	case VPU_JSM_MSG_ENGINE_RESET:
+		return "VPU_JSM_MSG_ENGINE_RESET";
+	case VPU_JSM_MSG_ENGINE_PREEMPT:
+		return "VPU_JSM_MSG_ENGINE_PREEMPT";
+	case VPU_JSM_MSG_REGISTER_DB:
+		return "VPU_JSM_MSG_REGISTER_DB";
+	case VPU_JSM_MSG_UNREGISTER_DB:
+		return "VPU_JSM_MSG_UNREGISTER_DB";
+	case VPU_JSM_MSG_QUERY_ENGINE_HB:
+		return "VPU_JSM_MSG_QUERY_ENGINE_HB";
+	case VPU_JSM_MSG_TRACE_SET_CONFIG:
+		return "VPU_JSM_MSG_TRACE_SET_CONFIG";
+	case VPU_JSM_MSG_TRACE_GET_CONFIG:
+		return "VPU_JSM_MSG_TRACE_GET_CONFIG";
+	case VPU_JSM_MSG_TRACE_GET_CAPABILITY:
+		return "VPU_JSM_MSG_TRACE_GET_CAPABILITY";
+	case VPU_JSM_MSG_BLOB_DEINIT:
+		return "VPU_JSM_MSG_BLOB_DEINIT";
+	case VPU_JSM_MSG_DYNDBG_CONTROL:
+		return "VPU_JSM_MSG_DYNDBG_CONTROL";
+	case VPU_JSM_MSG_JOB_DONE:
+		return "VPU_JSM_MSG_JOB_DONE";
+	case VPU_JSM_MSG_ENGINE_RESET_DONE:
+		return "VPU_JSM_MSG_ENGINE_RESET_DONE";
+	case VPU_JSM_MSG_ENGINE_PREEMPT_DONE:
+		return "VPU_JSM_MSG_ENGINE_PREEMPT_DONE";
+	case VPU_JSM_MSG_REGISTER_DB_DONE:
+		return "VPU_JSM_MSG_REGISTER_DB_DONE";
+	case VPU_JSM_MSG_UNREGISTER_DB_DONE:
+		return "VPU_JSM_MSG_UNREGISTER_DB_DONE";
+	case VPU_JSM_MSG_QUERY_ENGINE_HB_DONE:
+		return "VPU_JSM_MSG_QUERY_ENGINE_HB_DONE";
+	case VPU_JSM_MSG_TRACE_SET_CONFIG_RSP:
+		return "VPU_JSM_MSG_TRACE_SET_CONFIG_RSP";
+	case VPU_JSM_MSG_TRACE_GET_CONFIG_RSP:
+		return "VPU_JSM_MSG_TRACE_GET_CONFIG_RSP";
+	case VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP:
+		return "VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP";
+	case VPU_JSM_MSG_BLOB_DEINIT_DONE:
+		return "VPU_JSM_MSG_BLOB_DEINIT_DONE";
+	case VPU_JSM_MSG_DYNDBG_CONTROL_RSP:
+		return "VPU_JSM_MSG_DYNDBG_CONTROL_RSP";
+	default:
+		return "Unknown JSM message type";
+	}
+}
+
+int vpu_jsm_register_db(struct vpu_device *vdev, u32 ctx_id, u32 db_id,
+			u64 jobq_base, u32 jobq_size)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_REGISTER_DB };
+	struct vpu_jsm_msg resp;
+	int ret = 0;
+
+	req.payload.register_db.db_idx = db_id;
+	req.payload.register_db.jobq_base = jobq_base;
+	req.payload.register_db.jobq_size = jobq_size;
+	req.payload.register_db.host_ssid = ctx_id;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_REGISTER_DB_DONE, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret) {
+		vpu_err(vdev, "Failed to register doorbell %d: %d\n", db_id, ret);
+		return ret;
+	}
+
+	vpu_dbg(JSM, "Doorbell %d registered to context %d\n", db_id, ctx_id);
+
+	return 0;
+}
+
+int vpu_jsm_unregister_db(struct vpu_device *vdev, u32 db_id)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_UNREGISTER_DB };
+	struct vpu_jsm_msg resp;
+	int ret = 0;
+
+	req.payload.unregister_db.db_idx = db_id;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_UNREGISTER_DB_DONE, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret) {
+		vpu_warn(vdev, "Failed to unregister doorbell %d: %d\n", db_id, ret);
+		return ret;
+	}
+
+	vpu_dbg(JSM, "Doorbell %d unregistered\n", db_id);
+
+	return 0;
+}
+
+int vpu_jsm_get_heartbeat(struct vpu_device *vdev, u32 engine, u64 *heartbeat)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_QUERY_ENGINE_HB };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	if (engine > VPU_ENGINE_COPY)
+		return -EINVAL;
+
+	req.payload.query_engine_hb.engine_idx = engine;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret) {
+		vpu_err(vdev, "Failed to get heartbeat from engine %d: %d\n", engine, ret);
+		goto rpm_put;
+	}
+
+	*heartbeat = resp.payload.query_engine_hb_done.heartbeat;
+rpm_put:
+	return ret;
+}
+
+int vpu_jsm_reset_engine(struct vpu_device *vdev, u32 engine)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_ENGINE_RESET };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	if (engine > VPU_ENGINE_COPY)
+		return -EINVAL;
+
+	req.payload.engine_reset.engine_idx = engine;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_ENGINE_RESET_DONE, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		vpu_err(vdev, "Failed to reset engine %d: %d\n", engine, ret);
+
+	return ret;
+}
+
+int vpu_jsm_preempt_engine(struct vpu_device *vdev, u32 engine, u32 preempt_id)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_ENGINE_PREEMPT };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	if (engine > VPU_ENGINE_COPY)
+		return -EINVAL;
+
+	req.payload.engine_preempt.engine_idx = engine;
+	req.payload.engine_preempt.preempt_id = preempt_id;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_ENGINE_PREEMPT_DONE, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		vpu_err(vdev, "Failed to preempt engine %d: %d\n", engine, ret);
+
+	return ret;
+}
+
+int vpu_jsm_dyndbg_control(struct vpu_device *vdev, char *command, size_t size)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_DYNDBG_CONTROL };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	if (!strncpy(req.payload.dyndbg_control.dyndbg_cmd, command, VPU_DYNDBG_CMD_MAX_LEN - 1))
+		return -ENOMEM;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_DYNDBG_CONTROL_RSP, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		vpu_warn(vdev, "Failed to send command \"%s\": ret %d\n", command, ret);
+
+	return ret;
+}
+
+int vpu_jsm_trace_get_capability(struct vpu_device *vdev, u32 *trace_destination_mask,
+				 u64 *trace_hw_component_mask)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_TRACE_GET_CAPABILITY };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_TRACE_GET_CAPABILITY_RSP, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret) {
+		vpu_warn(vdev, "Failed to get trace capability: %d\n", ret);
+		return ret;
+	}
+
+	*trace_destination_mask = resp.payload.trace_capability.trace_destination_mask;
+	*trace_hw_component_mask = resp.payload.trace_capability.trace_hw_component_mask;
+
+	return ret;
+}
+
+int vpu_jsm_trace_set_config(struct vpu_device *vdev, u32 trace_level, u32 trace_destination_mask,
+			     u64 trace_hw_component_mask)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_TRACE_SET_CONFIG };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	req.payload.trace_config.trace_level = trace_level;
+	req.payload.trace_config.trace_destination_mask = trace_destination_mask;
+	req.payload.trace_config.trace_hw_component_mask = trace_hw_component_mask;
+
+	ret = vpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_TRACE_SET_CONFIG_RSP, &resp,
+				   VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		vpu_warn(vdev, "Failed to set config: %d\n", ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/vpu/vpu_jsm_msg.h b/drivers/gpu/drm/vpu/vpu_jsm_msg.h
new file mode 100644
index 000000000000..93e28a1a7943
--- /dev/null
+++ b/drivers/gpu/drm/vpu/vpu_jsm_msg.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright © 2020-2022 Intel Corporation
+ */
+
+#ifndef __VPU_JSM_MSG_H__
+#define __VPU_JSM_MSG_H__
+
+#include "vpu_jsm_api.h"
+
+const char *vpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type);
+
+int vpu_jsm_register_db(struct vpu_device *vdev, u32 ctx_id, u32 db_id,
+			u64 jobq_base, u32 jobq_size);
+int vpu_jsm_unregister_db(struct vpu_device *vdev, u32 db_id);
+int vpu_jsm_get_heartbeat(struct vpu_device *vdev, u32 engine, u64 *heartbeat);
+int vpu_jsm_reset_engine(struct vpu_device *vdev, u32 engine);
+int vpu_jsm_preempt_engine(struct vpu_device *vdev, u32 engine, u32 preempt_id);
+int vpu_jsm_dyndbg_control(struct vpu_device *vdev, char *command, size_t size);
+int vpu_jsm_trace_get_capability(struct vpu_device *vdev, u32 *trace_destination_mask,
+				 u64 *trace_hw_component_mask);
+int vpu_jsm_trace_set_config(struct vpu_device *vdev, u32 trace_level, u32 trace_destination_mask,
+			     u64 trace_hw_component_mask);
+
+#endif
-- 
2.34.1

