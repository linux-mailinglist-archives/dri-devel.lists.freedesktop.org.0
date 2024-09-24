Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F530984026
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C788A10E659;
	Tue, 24 Sep 2024 08:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KAkcb0hA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA17010E666
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165900; x=1758701900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G/OU9zqwydRTRUdCMD7ii+qe/hCRnNG79miPKOsdSqY=;
 b=KAkcb0hADdaZBpVsyff9gm3xobW2GnJ4BCLegt8h28BTLZ5SDWuPOSB/
 s4SyLDACKF895IenjYxNjmN0EP+TpmhU/S4Uz9rwL7InJJ1nbqn73C4wT
 n3/5vid1PvBDaf3+dqW0PQZlf1wv6yrygcHAABWe67HEo4fxKwbYKdWsI
 qnHCvC7RAPgCeowORAz+HoeFe1u6vYLEsqLykPO7oUFHSH96rf3pLpXEP
 KczhDWVCuFb65r5Yf7c/xbIG+iylG1JNxJd99mKaNx+s+g/yQl+72wslj
 hLuSTDRAp8iZO8YNoiN8kTpSAd6O0F3+1HoNo/LOvrNtDXBiLzc5wxS0F Q==;
X-CSE-ConnectionGUID: 17Lg/MJVSW60C7mmvCPVqQ==
X-CSE-MsgGUID: gnBWCDLNRh6vi2ny5OR2Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506900"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:17 -0700
X-CSE-ConnectionGUID: BTtXcdeoQ5awfhFVO9n1fQ==
X-CSE-MsgGUID: 6ANxc9e9RA+l8JORh06UQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170628"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:15 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 06/29] accel/ivpu: Fix JSM state dump message warnings
Date: Tue, 24 Sep 2024 10:17:31 +0200
Message-ID: <20240924081754.209728-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

We are disabling IRQs prior to queuing recovery work, so state dump
messages always timed out with a warning. Use simple msleep() to prevent
IPC warnings.

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h     |  1 +
 drivers/accel/ivpu/ivpu_hw.c      |  3 +++
 drivers/accel/ivpu/ivpu_ipc.c     | 26 ++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_ipc.h     |  2 ++
 drivers/accel/ivpu/ivpu_jsm_msg.c |  8 ++++++++
 drivers/accel/ivpu/ivpu_jsm_msg.h |  2 ++
 drivers/accel/ivpu/ivpu_pm.c      |  1 +
 7 files changed, 43 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 63f13b697eed7..2b30cc2e9272e 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -152,6 +152,7 @@ struct ivpu_device {
 		int tdr;
 		int autosuspend;
 		int d0i3_entry_msg;
+		int state_dump_msg;
 	} timeout;
 };
 
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 27f0fe4d54e00..85219e9596215 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -89,12 +89,14 @@ static void timeouts_init(struct ivpu_device *vdev)
 		vdev->timeout.tdr = 2000000;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = 500;
+		vdev->timeout.state_dump_msg = 10;
 	} else if (ivpu_is_simics(vdev)) {
 		vdev->timeout.boot = 50;
 		vdev->timeout.jsm = 500;
 		vdev->timeout.tdr = 10000;
 		vdev->timeout.autosuspend = -1;
 		vdev->timeout.d0i3_entry_msg = 100;
+		vdev->timeout.state_dump_msg = 10;
 	} else {
 		vdev->timeout.boot = 1000;
 		vdev->timeout.jsm = 500;
@@ -104,6 +106,7 @@ static void timeouts_init(struct ivpu_device *vdev)
 		else
 			vdev->timeout.autosuspend = 100;
 		vdev->timeout.d0i3_entry_msg = 5;
+		vdev->timeout.state_dump_msg = 10;
 	}
 }
 
diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
index 78b32a8232419..83b4ba4f3e20a 100644
--- a/drivers/accel/ivpu/ivpu_ipc.c
+++ b/drivers/accel/ivpu/ivpu_ipc.c
@@ -364,6 +364,32 @@ int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
 	return ret;
 }
 
+int ivpu_ipc_send_and_wait(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+			   u32 channel, unsigned long timeout_ms)
+{
+	struct ivpu_ipc_consumer cons;
+	int ret;
+
+	ret = ivpu_rpm_get(vdev);
+	if (ret < 0)
+		return ret;
+
+	ivpu_ipc_consumer_add(vdev, &cons, channel, NULL);
+
+	ret = ivpu_ipc_send(vdev, &cons, req);
+	if (ret) {
+		ivpu_warn_ratelimited(vdev, "IPC send failed: %d\n", ret);
+		goto consumer_del;
+	}
+
+	msleep(timeout_ms);
+
+consumer_del:
+	ivpu_ipc_consumer_del(vdev, &cons);
+	ivpu_rpm_put(vdev);
+	return ret;
+}
+
 static bool
 ivpu_ipc_match_consumer(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
 			struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
diff --git a/drivers/accel/ivpu/ivpu_ipc.h b/drivers/accel/ivpu/ivpu_ipc.h
index 4fe38141045ea..6bbe6e32c8749 100644
--- a/drivers/accel/ivpu/ivpu_ipc.h
+++ b/drivers/accel/ivpu/ivpu_ipc.h
@@ -108,5 +108,7 @@ int ivpu_ipc_send_receive_active(struct ivpu_device *vdev, struct vpu_jsm_msg *r
 int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
 			  enum vpu_ipc_msg_type expected_resp, struct vpu_jsm_msg *resp,
 			  u32 channel, unsigned long timeout_ms);
+int ivpu_ipc_send_and_wait(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
+			   u32 channel, unsigned long timeout_ms);
 
 #endif /* __IVPU_IPC_H__ */
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
index b06da8f50fd39..cd33964d292bc 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.c
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
@@ -559,3 +559,11 @@ int ivpu_jsm_dct_disable(struct ivpu_device *vdev)
 					    &resp, VPU_IPC_CHAN_ASYNC_CMD,
 					    vdev->timeout.jsm);
 }
+
+int ivpu_jsm_state_dump(struct ivpu_device *vdev)
+{
+	struct vpu_jsm_msg req = { .type = VPU_JSM_MSG_STATE_DUMP };
+
+	return ivpu_ipc_send_and_wait(vdev, &req, VPU_IPC_CHAN_ASYNC_CMD,
+				      vdev->timeout.state_dump_msg);
+}
diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.h b/drivers/accel/ivpu/ivpu_jsm_msg.h
index e4e42c0ff6e65..9e84d3526a146 100644
--- a/drivers/accel/ivpu/ivpu_jsm_msg.h
+++ b/drivers/accel/ivpu/ivpu_jsm_msg.h
@@ -43,4 +43,6 @@ int ivpu_jsm_metric_streamer_info(struct ivpu_device *vdev, u64 metric_group_mas
 				  u64 buffer_size, u32 *sample_size, u64 *info_size);
 int ivpu_jsm_dct_enable(struct ivpu_device *vdev, u32 active_us, u32 inactive_us);
 int ivpu_jsm_dct_disable(struct ivpu_device *vdev);
+int ivpu_jsm_state_dump(struct ivpu_device *vdev);
+
 #endif
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index bf77395ffcb7c..b5a69941e6e0a 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -125,6 +125,7 @@ static void ivpu_pm_recovery_work(struct work_struct *work)
 	if (ret)
 		ivpu_err(vdev, "Failed to resume NPU: %d\n", ret);
 
+	ivpu_jsm_state_dump(vdev);
 	ivpu_dev_coredump(vdev);
 
 	atomic_inc(&vdev->pm->reset_counter);
-- 
2.45.1

