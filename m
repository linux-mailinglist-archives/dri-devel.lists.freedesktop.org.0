Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844178CFF76
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5307B10E2CF;
	Mon, 27 May 2024 11:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="gU3sezJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CC710E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:58:38 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716810492; bh=mp5DAl21UuJcDlAVTYNSw0SqQLrU/a4V6eKgkuG5J8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gU3sezJVjMC+rZyyE2IDiEiPjdsfNX87Jxr+wY/gezbcd9j9FFyUzPrRVrXTAR1n4
 DcF9m4YsVwW8UCj8vOVqdm0EsACpMYTDGWXxsSts63egR42iidyWg3V9LPdoBwSsrI
 JsI/NwlMRR0kXhh4vN8fjowwUWW7nrnTgcPZ1f+qo9q94cMGaDYjcnuzhQrdob1ERz
 NkaDjKcfW3+6Kpt0ZBVN8I0CGM9RY/mT62SeCD3SIac6I+90w6MVS0t7fWt+cdXOqA
 lO2n+0jcA7O6YKkPG4r6B4/hQ+7J7iJt5OqCGpuBtqRdt7kNvu900hP4VjMZ9nWlVC
 1FYta+dXIvrow==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RBltNn1919357; Mon, 27 May 2024 14:47:56 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 9/9] accel/habanalabs: add heartbeat debug info
Date: Mon, 27 May 2024 14:47:46 +0300
Message-Id: <20240527114746.1919292-9-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527114746.1919292-1-obitton@habana.ai>
References: <20240527114746.1919292-1-obitton@habana.ai>
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

From: Farah Kassabri <fkassabri@habana.ai>

It is hard to debug the reason for heartbeat check failures.
As an attempt to ease this task, this patch will provide more
information when this failure happens.
Heartbeat checks the communication with FW, so printing
the CPU queue pi/ci and the counter of how many times that event
was received would help in debugging the issue.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c     | 12 ++++++++++++
 drivers/accel/habanalabs/common/habanalabs.h | 15 ++++++++++++++-
 drivers/accel/habanalabs/gaudi2/gaudi2.c     |  3 +++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index bb3f44392908..35502e938b5d 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1052,12 +1052,22 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	u32 cpu_q_id;
 
 	if (!prop->cpucp_info.eq_health_check_supported)
 		return true;
 
 	if (!hdev->eq_heartbeat_received) {
+		cpu_q_id = hdev->heartbeat_debug_info.cpu_queue_id;
+
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
+
+		dev_err(hdev->dev, "Heartbeat events counter: %u, Q_PI: %u, Q_CI: %u, EQ CI: %u, EQ prev: %u\n",
+				hdev->heartbeat_debug_info.heartbeat_event_counter,
+				hdev->kernel_queues[cpu_q_id].pi,
+				atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
+				hdev->event_queue.ci,
+				hdev->event_queue.prev_eqe_index);
 		return false;
 	}
 
@@ -1138,6 +1148,8 @@ static int device_late_init(struct hl_device *hdev)
 	hdev->high_pll = hdev->asic_prop.high_pll;
 
 	if (hdev->heartbeat) {
+		hdev->heartbeat_debug_info.heartbeat_event_counter = 0;
+
 		/*
 		 * Before scheduling the heartbeat driver will check if eq event has received.
 		 * for the first schedule we need to set the indication as true then for the next
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 55495861f432..5e9f54ca336a 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -71,7 +71,7 @@ struct hl_fpriv;
 
 #define HL_DEVICE_TIMEOUT_USEC		1000000 /* 1 s */
 
-#define HL_HEARTBEAT_PER_USEC		5000000 /* 5 s */
+#define HL_HEARTBEAT_PER_USEC		10000000 /* 10 s */
 
 #define HL_PLL_LOW_JOB_FREQ_USEC	5000000 /* 5 s */
 
@@ -3174,6 +3174,16 @@ struct hl_reset_info {
 	u8		watchdog_active;
 };
 
+/**
+ * struct eq_heartbeat_debug_info - stores debug info to be used upon heartbeat failure.
+ * @heartbeat_event_counter: number of heartbeat events received.
+ * @cpu_queue_id: used to read the queue pi/ci
+ */
+struct eq_heartbeat_debug_info {
+	u32 heartbeat_event_counter;
+	u32 cpu_queue_id;
+};
+
 /**
  * struct hl_device - habanalabs device structure.
  * @pdev: pointer to PCI device, can be NULL in case of simulator device.
@@ -3262,6 +3272,7 @@ struct hl_reset_info {
  * @clk_throttling: holds information about current/previous clock throttling events
  * @captured_err_info: holds information about errors.
  * @reset_info: holds current device reset information.
+ * @heartbeat_debug_info: counters used to debug heartbeat failures.
  * @irq_affinity_mask: mask of available CPU cores for user and decoder interrupt handling.
  * @stream_master_qid_arr: pointer to array with QIDs of master streams.
  * @fw_inner_major_ver: the major of current loaded preboot inner version.
@@ -3452,6 +3463,8 @@ struct hl_device {
 
 	struct hl_reset_info		reset_info;
 
+	struct eq_heartbeat_debug_info	heartbeat_debug_info;
+
 	cpumask_t			irq_affinity_mask;
 
 	u32				*stream_master_qid_arr;
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 962b7fcd4318..08276f03c80f 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3796,6 +3796,8 @@ static int gaudi2_sw_init(struct hl_device *hdev)
 	if (rc)
 		goto special_blocks_free;
 
+	hdev->heartbeat_debug_info.cpu_queue_id = GAUDI2_QUEUE_ID_CPU_PQ;
+
 	return 0;
 
 special_blocks_free:
@@ -9777,6 +9779,7 @@ static u16 event_id_to_engine_id(struct hl_device *hdev, u16 event_type)
 
 static void hl_eq_heartbeat_event_handle(struct hl_device *hdev)
 {
+	hdev->heartbeat_debug_info.heartbeat_event_counter++;
 	hdev->eq_heartbeat_received = true;
 }
 
-- 
2.34.1

