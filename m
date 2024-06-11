Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CC903B5F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64B310E5DC;
	Tue, 11 Jun 2024 12:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgI0C4DW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C734C10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107481; x=1749643481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IAfiTc22vL3QXeCsgfhS5PkgjdpWEv0zyauTNsmsY5A=;
 b=SgI0C4DWLZgB88uKOoHxDDPBtLl/5Bo/+fgKoOz8goG0HBdWLyQAzUAH
 Ul7QI6bzUmzbXPnW5my2grhbOeZjPTFYmPv4lHAgNvXbD1wRq5kNfrc0K
 asztoQbPr5xIRYFFBBlQnPt81WjZJBFhY7APTAgZWjyXpHgDs2LGyryZh
 pYBTGUu5XG/+kuU+7VHDaQkG2/af7aT7TBJA+z0/+BGUOf//pavzw/SGh
 hjs/B/OByDMRmQSVnQEbLvgom2Y4AypiaO7WRi87QrDfzQDwqlRrUsf1f
 dQTs9h0+R13L/uP/jB1eK6QKHYbkIPOgWjcTJCVuNS5ln2/sJsCDyiUeM g==;
X-CSE-ConnectionGUID: Xas0LvIZTyinUMKrsOlu9w==
X-CSE-MsgGUID: BGCX/tssTiqoIBerms29QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296029"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:41 -0700
X-CSE-ConnectionGUID: 1rGcJ3DiSg20nOWXFujubw==
X-CSE-MsgGUID: CpGXrB60Qyaw30RIeZXfnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39876951"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:38 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
	Maciej Falkowski <maciej.falkowski@intel.com>,
	Wachowski@freedesktop.org, Karol <karol.wachowski@intel.com>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 02/15] accel/ivpu: Abort jobs of faulty context
Date: Tue, 11 Jun 2024 14:04:19 +0200
Message-ID: <20240611120433.1012423-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

From: Maciej Falkowski <maciej.falkowski@intel.com>

Abort all jobs that belong to contexts generating MMU faults in order
to avoid flooding host with MMU IRQs.

Jobs are cancelled with:
  - SSID_RELEASE command when OS scheduling is enabled
  - DESTROY_CMDQ command when HW scheduling is enabled

Signed-off-by: Maciej Falkowski <maciej.falkowski@intel.com>
Co-developed-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c     | 23 +++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_drv.h     |  1 +
 drivers/accel/ivpu/ivpu_hw.h      |  3 ++-
 drivers/accel/ivpu/ivpu_ipc.c     |  3 +--
 drivers/accel/ivpu/ivpu_ipc.h     |  4 +++-
 drivers/accel/ivpu/ivpu_job.c     | 29 ++++++++++++++++++++++++++++-
 drivers/accel/ivpu/ivpu_job.h     |  4 +++-
 drivers/accel/ivpu/ivpu_jsm_msg.c |  9 +++++++--
 drivers/accel/ivpu/ivpu_mmu.c     | 10 +++++++---
 9 files changed, 75 insertions(+), 11 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index f3e0d55f4adb..3ce12b66f699 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -446,6 +446,26 @@ static const struct drm_driver driver = {
 	.minor = DRM_IVPU_DRIVER_MINOR,
 };
 
+static void ivpu_context_abort_invalid(struct ivpu_device *vdev)
+{
+	struct ivpu_file_priv *file_priv;
+	unsigned long ctx_id;
+
+	mutex_lock(&vdev->context_list_lock);
+
+	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
+		if (!file_priv->has_mmu_faults || file_priv->aborted)
+			continue;
+
+		mutex_lock(&file_priv->lock);
+		ivpu_context_abort_locked(file_priv);
+		file_priv->aborted = true;
+		mutex_unlock(&file_priv->lock);
+	}
+
+	mutex_unlock(&vdev->context_list_lock);
+}
+
 static irqreturn_t ivpu_irq_thread_handler(int irq, void *arg)
 {
 	struct ivpu_device *vdev = arg;
@@ -459,6 +479,9 @@ static irqreturn_t ivpu_irq_thread_handler(int irq, void *arg)
 		case IVPU_HW_IRQ_SRC_IPC:
 			ivpu_ipc_irq_thread_handler(vdev);
 			break;
+		case IVPU_HW_IRQ_SRC_MMU_EVTQ:
+			ivpu_context_abort_invalid(vdev);
+			break;
 		default:
 			ivpu_err_ratelimited(vdev, "Unknown IRQ source: %u\n", irq_src);
 			break;
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 823e10c41816..dc6ad1978a3b 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -169,6 +169,7 @@ struct ivpu_file_priv {
 	struct ivpu_bo *ms_info_bo;
 	bool has_mmu_faults;
 	bool bound;
+	bool aborted;
 };
 
 extern int ivpu_dbg_mask;
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 8ddf9f93189d..1a55538aafdc 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020 - 2024 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_HW_H__
@@ -15,6 +15,7 @@
 #define IVPU_HW_IRQ_FIFO_LENGTH 1024
 
 #define IVPU_HW_IRQ_SRC_IPC 1
+#define IVPU_HW_IRQ_SRC_MMU_EVTQ 2
 
 struct ivpu_addr_range {
 	resource_size_t start;
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 74ab964d229b..78b32a823241 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -210,8 +210,7 @@ void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *c
 	ivpu_ipc_tx_release(vdev, cons->tx_vpu_addr);
 }
 
-static int
-ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct vpu_jsm_msg *req)
+int ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct vpu_jsm_msg *req)
 {
 	struct ivpu_ipc_info *ipc = vdev->ipc;
 	int ret;
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 75f532428d68..4fe38141045e 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_IPC_H__
@@ -96,6 +96,8 @@ void ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *c
 			   u32 channel, ivpu_ipc_rx_callback_t callback);
 void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons);
 
+int ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
+		  struct vpu_jsm_msg *req);
 int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 		     struct ivpu_ipc_hdr *ipc_buf, struct vpu_jsm_msg *jsm_msg,
 		     unsigned long timeout_ms);
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index e4e24813fe03..be2e2bf0f43f 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <drm/drm_file.h>
@@ -312,6 +312,33 @@ void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev)
 	mutex_unlock(&vdev->context_list_lock);
 }
 
+static void ivpu_cmdq_fini_all(struct ivpu_file_priv *file_priv)
+{
+	u16 engine;
+	u8 priority;
+
+	for (engine = 0; engine < IVPU_NUM_ENGINES; engine++) {
+		for (priority = 0; priority < IVPU_NUM_PRIORITIES; priority++) {
+			int cmdq_idx = IVPU_CMDQ_INDEX(engine, priority);
+
+			if (file_priv->cmdq[cmdq_idx])
+				ivpu_cmdq_fini(file_priv, file_priv->cmdq[cmdq_idx]);
+		}
+	}
+}
+
+void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv)
+{
+	struct ivpu_device *vdev = file_priv->vdev;
+
+	lockdep_assert_held(&file_priv->lock);
+
+	ivpu_cmdq_fini_all(file_priv);
+
+	if (vdev->hw->sched_mode == VPU_SCHEDULING_MODE_OS)
+		ivpu_jsm_context_release(vdev, file_priv->ctx.id);
+}
+
 static int ivpu_cmdq_push_job(struct ivpu_cmdq *cmdq, struct ivpu_job *job)
 {
 	struct ivpu_device *vdev = job->vdev;
diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index e50002b5788c..6accb94028c7 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_JOB_H__
@@ -57,6 +57,8 @@ struct ivpu_job {
 
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
 
+void ivpu_context_abort_locked(struct ivpu_file_priv *file_priv);
+
 void ivpu_cmdq_release_all_locked(struct ivpu_file_priv *file_priv);
 void ivpu_cmdq_reset_all_contexts(struct ivpu_device *vdev);
 
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index e8dd73d947e4..3179e80de1ec 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -255,11 +255,16 @@ int ivpu_jsm_context_release(struct ivpu_device *vdev, u32 host_ssid)
 {
 	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_SSID_RELEASE };
 	struct vpu_jsm_msg resp;
+	int ret;
 
 	req.payload.ssid_release.host_ssid = host_ssid;
 
-	return ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_SSID_RELEASE_DONE, &resp,
-				     VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_SSID_RELEASE_DONE, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to release context: %d\n", ret);
+
+	return ret;
 }
 
 int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 8682e6145520..c078e214b221 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include <linux/circ_buf.h>
@@ -878,8 +878,9 @@ static void ivpu_mmu_dump_event(struct ivpu_device *vdev, u32 *event)
 	u64 in_addr = ((u64)event[5]) << 32 | event[4];
 	u32 sid = event[1];
 
-	ivpu_err(vdev, "MMU EVTQ: 0x%x (%s) SSID: %d SID: %d, e[2] %08x, e[3] %08x, in addr: 0x%llx, fetch addr: 0x%llx\n",
-		 op, ivpu_mmu_event_to_str(op), ssid, sid, event[2], event[3], in_addr, fetch_addr);
+	ivpu_err_ratelimited(vdev, "MMU EVTQ: 0x%x (%s) SSID: %d SID: %d, e[2] %08x, e[3] %08x, in addr: 0x%llx, fetch addr: 0x%llx\n",
+			     op, ivpu_mmu_event_to_str(op), ssid, sid,
+			     event[2], event[3], in_addr, fetch_addr);
 }
 
 static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
@@ -915,6 +916,9 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 		ivpu_mmu_user_context_mark_invalid(vdev, ssid);
 		REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, vdev->mmu->evtq.cons);
 	}
+
+	if (!kfifo_put(&vdev->hw->irq.fifo, IVPU_HW_IRQ_SRC_MMU_EVTQ))
+		ivpu_err_ratelimited(vdev, "IRQ FIFO full\n");
 }
 
 void ivpu_mmu_evtq_dump(struct ivpu_device *vdev)
-- 
2.45.1

