Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD198AD6D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF9B10E584;
	Mon, 30 Sep 2024 19:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5Q7aBHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D51010E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726019; x=1759262019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5d62YKxzAE4g8hV0D8J2CCj6cyyprF7md7jATV1Lkc=;
 b=f5Q7aBHJQknHoeCJeGSzFFjJwMs6A/taZeiEIMPI0jtPwlHeqd6H706y
 2ngFm8s46tqwSzBy7Ap/4V/ALSyMghjvySzHCChChP0y8GLeqH9QNMMFd
 eA6EnniDJgxxsqC0fzf/xKt34YCYOSrVQ7l++ddzLyRB3g89libe4bnJD
 vr3PobEeY731OrvxocX/Fmh4ZRFBKHxresVTBEuUakJ8VjDT2R8NWIapj
 6cm3QvrvWMjz/DVZztJZS69H6T/waQHz+aetIKuxzEA5SpXGQGwP2ysgE
 UnRdGPcPBL8cX+P5TxI5D2XwfCPUglouRuHQflTW6SW82EYCPMzJlANJR w==;
X-CSE-ConnectionGUID: wELKGC3KR0KsCaNJC2QN1Q==
X-CSE-MsgGUID: ZvB43P6vRJmjqU7Dn7lMfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962308"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962308"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:38 -0700
X-CSE-ConnectionGUID: ytErJZlGR8mF3047EVPOcw==
X-CSE-MsgGUID: YMdzoshqTJWPtAt3e+zp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370010"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:37 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 08/31] accel/ivpu: Add FW state dump on TDR
Date: Mon, 30 Sep 2024 21:52:59 +0200
Message-ID: <20240930195322.461209-9-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Send JSM state dump message at the beginning of TDR handler. This allows
FW to collect debug info in the FW log before the state of the NPU is
lost allowing to analyze the cause of a TDR.

Wait a predefined timeout (10 ms) so the FW has a chance to write debug
logs. We cannot wait for JSM response at this point because IRQs are
already disabled before TDR handler is invoked.

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

