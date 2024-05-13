Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB18C4063
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B155010E712;
	Mon, 13 May 2024 12:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqXm8WPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8D10E712
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715601883; x=1747137883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6JmYTuYUTRjECIrLVFhNtiL4R4KgUuEPfWNar/FT7s=;
 b=UqXm8WPdJVNS7APMNa+29HcvRVCnqW6dzdFE6BkRcESkxJes2fDEQ6hn
 GG1920DI34tMb2rhopuO5zKYEEi1SteaRHyQNmBTB7j5KduCygAfm5ctW
 f6O+AHQMiukV41L3znnQosuXdVLJqHtstJ7RGqSKdAMczq/H/RQEkHPBu
 qBEJwH+1nt32fmUU9jzJRpT9VNfKFm6U9qJ93O4RF6xRpDXmYc9YrXbZ6
 99deuqz/7gS2gZzvgYqmeysZy1msrzIXl6yOnEERTzKvmKuOwqOmWu0iy
 mtxvrODHIVsUq7C6KQrk5iK/mUY+TH0Q4mdWvlb7i+iBWmvUegli3Zdhc w==;
X-CSE-ConnectionGUID: ZhbgPWt0Q6auSzTLOFQuzw==
X-CSE-MsgGUID: HuR6+8DWSNakWK5o8lP/NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22131736"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22131736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:43 -0700
X-CSE-ConnectionGUID: HOKqAZi+Q02ABUexIY15gA==
X-CSE-MsgGUID: /VfpkcN8Tmmm5Ri0/eOfxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30341062"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 05:04:41 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 05/12] accel/ivpu: Add HWS JSM messages
Date: Mon, 13 May 2024 14:04:24 +0200
Message-ID: <20240513120431.3187212-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
References: <20240513120431.3187212-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Add JSM messages that will be used to implement hardware scheduler.
Most of these messages are used to create and manage HWS specific
command queues.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 drivers/accel/ivpu/ivpu_drv.h     |   1 +
 drivers/accel/ivpu/ivpu_jsm_msg.c | 161 +++++++++++++++++++++++++++++-
 drivers/accel/ivpu/ivpu_jsm_msg.h |  14 ++-
 3 files changed, 174 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index f500b2d92452..9e9d85ad78ea 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -171,6 +171,7 @@ extern bool ivpu_disable_mmu_cont_pages;
 #define IVPU_TEST_MODE_D0I3_MSG_DISABLE   BIT(4)
 #define IVPU_TEST_MODE_D0I3_MSG_ENABLE    BIT(5)
 #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
+#define IVPU_TEST_MODE_HWS_EXTRA_EVENTS	  BIT(7)
 extern int ivpu_test_mode;
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index 8cea0dd731b9..4b260065ad72 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #include "ivpu_drv.h"
@@ -281,3 +281,162 @@ int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev)
 
 	return ivpu_hw_wait_for_idle(vdev);
 }
+
+int ivpu_jsm_hws_create_cmdq(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_group, u32 cmdq_id,
+			     u32 pid, u32 engine, u64 cmdq_base, u32 cmdq_size)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_CREATE_CMD_QUEUE };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	req.payload.hws_create_cmdq.host_ssid = ctx_id;
+	req.payload.hws_create_cmdq.process_id = pid;
+	req.payload.hws_create_cmdq.engine_idx = engine;
+	req.payload.hws_create_cmdq.cmdq_group = cmdq_group;
+	req.payload.hws_create_cmdq.cmdq_id = cmdq_id;
+	req.payload.hws_create_cmdq.cmdq_base = cmdq_base;
+	req.payload.hws_create_cmdq.cmdq_size = cmdq_size;
+
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_CREATE_CMD_QUEUE_RSP, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to create command queue: %d\n", ret);
+
+	return ret;
+}
+
+int ivpu_jsm_hws_destroy_cmdq(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_DESTROY_CMD_QUEUE };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	req.payload.hws_destroy_cmdq.host_ssid = ctx_id;
+	req.payload.hws_destroy_cmdq.cmdq_id = cmdq_id;
+
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_DESTROY_CMD_QUEUE_RSP, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to destroy command queue: %d\n", ret);
+
+	return ret;
+}
+
+int ivpu_jsm_hws_register_db(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id, u32 db_id,
+			     u64 cmdq_base, u32 cmdq_size)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_HWS_REGISTER_DB };
+	struct vpu_jsm_msg resp;
+	int ret = 0;
+
+	req.payload.hws_register_db.db_id = db_id;
+	req.payload.hws_register_db.host_ssid = ctx_id;
+	req.payload.hws_register_db.cmdq_id = cmdq_id;
+	req.payload.hws_register_db.cmdq_base = cmdq_base;
+	req.payload.hws_register_db.cmdq_size = cmdq_size;
+
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_REGISTER_DB_DONE, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_err_ratelimited(vdev, "Failed to register doorbell %u: %d\n", db_id, ret);
+
+	return ret;
+}
+
+int ivpu_jsm_hws_resume_engine(struct ivpu_device *vdev, u32 engine)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_HWS_ENGINE_RESUME };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	if (engine >= VPU_ENGINE_NB)
+		return -EINVAL;
+
+	req.payload.hws_resume_engine.engine_idx = engine;
+
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_HWS_RESUME_ENGINE_DONE, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_err_ratelimited(vdev, "Failed to resume engine %d: %d\n", engine, ret);
+
+	return ret;
+}
+
+int ivpu_jsm_hws_set_context_sched_properties(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id,
+					      u32 priority)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_SET_CONTEXT_SCHED_PROPERTIES };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	req.payload.hws_set_context_sched_properties.host_ssid = ctx_id;
+	req.payload.hws_set_context_sched_properties.cmdq_id = cmdq_id;
+	req.payload.hws_set_context_sched_properties.priority_band = priority;
+	req.payload.hws_set_context_sched_properties.realtime_priority_level = 0;
+	req.payload.hws_set_context_sched_properties.in_process_priority = 0;
+	req.payload.hws_set_context_sched_properties.context_quantum = 20000;
+	req.payload.hws_set_context_sched_properties.grace_period_same_priority = 10000;
+	req.payload.hws_set_context_sched_properties.grace_period_lower_priority = 0;
+
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_SET_CONTEXT_SCHED_PROPERTIES_RSP, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to set context sched properties: %d\n", ret);
+
+	return ret;
+}
+
+int ivpu_jsm_hws_set_scheduling_log(struct ivpu_device *vdev, u32 engine_idx, u32 host_ssid,
+				    u64 vpu_log_buffer_va)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_HWS_SET_SCHEDULING_LOG };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	req.payload.hws_set_scheduling_log.engine_idx = engine_idx;
+	req.payload.hws_set_scheduling_log.host_ssid = host_ssid;
+	req.payload.hws_set_scheduling_log.vpu_log_buffer_va = vpu_log_buffer_va;
+	req.payload.hws_set_scheduling_log.notify_index = 0;
+	req.payload.hws_set_scheduling_log.enable_extra_events =
+		ivpu_test_mode & IVPU_TEST_MODE_HWS_EXTRA_EVENTS;
+
+	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_HWS_SET_SCHEDULING_LOG_RSP, &resp,
+				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to set scheduling log: %d\n", ret);
+
+	return ret;
+}
+
+int ivpu_jsm_hws_setup_priority_bands(struct ivpu_device *vdev)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP };
+	struct vpu_jsm_msg resp;
+	int ret;
+
+	/* Idle */
+	req.payload.hws_priority_band_setup.grace_period[0] = 0;
+	req.payload.hws_priority_band_setup.process_grace_period[0] = 50000;
+	req.payload.hws_priority_band_setup.process_quantum[0] = 160000;
+	/* Normal */
+	req.payload.hws_priority_band_setup.grace_period[1] = 50000;
+	req.payload.hws_priority_band_setup.process_grace_period[1] = 50000;
+	req.payload.hws_priority_band_setup.process_quantum[1] = 300000;
+	/* Focus */
+	req.payload.hws_priority_band_setup.grace_period[2] = 50000;
+	req.payload.hws_priority_band_setup.process_grace_period[2] = 50000;
+	req.payload.hws_priority_band_setup.process_quantum[2] = 200000;
+	/* Realtime */
+	req.payload.hws_priority_band_setup.grace_period[3] = 0;
+	req.payload.hws_priority_band_setup.process_grace_period[3] = 50000;
+	req.payload.hws_priority_band_setup.process_quantum[3] = 200000;
+
+	req.payload.hws_priority_band_setup.normal_band_percentage = 10;
+
+	ret = ivpu_ipc_send_receive_active(vdev, &req, VPU_JSM_MSG_SET_PRIORITY_BAND_SETUP_RSP,
+					   &resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
+	if (ret)
+		ivpu_warn_ratelimited(vdev, "Failed to set priority bands: %d\n", ret);
+
+	return ret;
+}
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.h b/drivers/accel/ivpu/ivpu_jsm_msg.h
index ae75e5dbcc41..357728295fe9 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.h
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2020-2023 Intel Corporation
+ * Copyright (C) 2020-2024 Intel Corporation
  */
 
 #ifndef __IVPU_JSM_MSG_H__
@@ -23,4 +23,16 @@ int ivpu_jsm_trace_set_config(struct ivpu_device *vdev, u32 trace_level, u32 tra
 			      u64 trace_hw_component_mask);
 int ivpu_jsm_context_release(struct ivpu_device *vdev, u32 host_ssid);
 int ivpu_jsm_pwr_d0i3_enter(struct ivpu_device *vdev);
+int ivpu_jsm_hws_create_cmdq(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_group, u32 cmdq_id,
+			     u32 pid, u32 engine, u64 cmdq_base, u32 cmdq_size);
+int ivpu_jsm_hws_destroy_cmdq(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id);
+int ivpu_jsm_hws_register_db(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id, u32 db_id,
+			     u64 cmdq_base, u32 cmdq_size);
+int ivpu_jsm_hws_resume_engine(struct ivpu_device *vdev, u32 engine);
+int ivpu_jsm_hws_set_context_sched_properties(struct ivpu_device *vdev, u32 ctx_id, u32 cmdq_id,
+					      u32 priority);
+int ivpu_jsm_hws_set_scheduling_log(struct ivpu_device *vdev, u32 engine_idx, u32 host_ssid,
+				    u64 vpu_log_buffer_va);
+int ivpu_jsm_hws_setup_priority_bands(struct ivpu_device *vdev);
+
 #endif
-- 
2.43.2

