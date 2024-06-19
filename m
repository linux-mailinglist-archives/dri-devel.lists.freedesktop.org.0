Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C285D90E37F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2843D10E926;
	Wed, 19 Jun 2024 06:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="lLLhshXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED41510E8FB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:44 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778885; bh=NxYliGGJgqHz9gehJ3BphJe2LVCMpgSUk84vQe7b8b8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lLLhshXK2yeanoazEPxh/k027tAsuOyFfNa/CQq3zAeq/FHH5wvYBpVNSlFeGQaCG
 Fk5vOg6fM7Blg3LLaX1+gCyTccv+FNkC0qznTA1+SaneNdD8rl9gs7GNpnmR27evVf
 65QO5u1yBmOwSEUCHTA+sXwxt68PKUGJmuH40hl56Jmf7pBRNyO7N4W+aPq0S2QIZM
 v54x9Ch1ZfS59PlAOvj1E7jOmx9yYIqguIqzrrwboOSrfM+Y/3kBsOJ4jNgw+Xovms
 KFRiOXqsEUmdlMD3tPC3aUnnIJLcC7P8PiSxtmx8l46sBqefu+96R8uzk7TEA9b64q
 evndcaqY/GABw==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB71377354; Wed, 19 Jun 2024 09:34:33 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Tomer Tayar <ttayar@habana.ai>
Subject: [PATCH 7/9] accel/habanalabs: print timestamp of last PQ heartbeat on
 EQ heartbeat failure
Date: Wed, 19 Jun 2024 09:34:23 +0300
Message-Id: <20240619063425.1377327-7-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
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

From: Tomer Tayar <ttayar@habana.ai>

The test packet which is sent to FW for the PQ heartbeat is used also as
the trigger in FW to send the EQ heartbeat event.
Add the time of the last sent packet to the debug info which is printed
upon a EQ heartbeat failure.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/device.c      | 37 +++++++++++++++++--
 drivers/accel/habanalabs/common/firmware_if.c | 16 ++++----
 drivers/accel/habanalabs/common/habanalabs.h  |  5 +++
 3 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 7bd7c2eb5dd2..050c278e5ddb 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1062,11 +1062,28 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 	return (device_id == hdev->pdev->device);
 }
 
+static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
+						bool is_pq_hb)
+{
+	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
+					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
+	struct tm tm;
+
+	if (!seconds)
+		return;
+
+	time64_to_tm(seconds, 0, &tm);
+
+	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
+		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
+}
+
 static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 {
 	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
 	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
 
 	if (!prop->cpucp_info.eq_health_check_supported)
 		return true;
@@ -1074,13 +1091,17 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 	if (!hdev->eq_heartbeat_received) {
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
 
+		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
+		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
 		dev_err(hdev->dev,
-			"Heartbeat events counter: %u, EQ CI: %u, PQ PI: %u, PQ CI: %u (%u)\n",
-			heartbeat_debug_info->heartbeat_event_counter,
+			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
 			hdev->event_queue.ci,
+			heartbeat_debug_info->heartbeat_event_counter,
+			eq_time_str,
 			hdev->kernel_queues[cpu_q_id].pi,
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
-			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask);
+			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
+			pq_time_str);
 
 		hl_eq_dump(hdev, &hdev->event_queue);
 
@@ -1562,12 +1583,19 @@ static void handle_reset_trigger(struct hl_device *hdev, u32 flags)
 	}
 }
 
+static void reset_heartbeat_debug_info(struct hl_device *hdev)
+{
+	hdev->heartbeat_debug_info.last_pq_heartbeat_ts = 0;
+	hdev->heartbeat_debug_info.last_eq_heartbeat_ts = 0;
+	hdev->heartbeat_debug_info.heartbeat_event_counter = 0;
+}
+
 static inline void device_heartbeat_schedule(struct hl_device *hdev)
 {
 	if (!hdev->heartbeat)
 		return;
 
-	hdev->heartbeat_debug_info.heartbeat_event_counter = 0;
+	reset_heartbeat_debug_info(hdev);
 
 	/*
 	 * Before scheduling the heartbeat driver will check if eq event has received.
@@ -2883,6 +2911,7 @@ void hl_set_irq_affinity(struct hl_device *hdev, int irq)
 void hl_eq_heartbeat_event_handle(struct hl_device *hdev)
 {
 	hdev->heartbeat_debug_info.heartbeat_event_counter++;
+	hdev->heartbeat_debug_info.last_eq_heartbeat_ts = ktime_get_real_seconds();
 	hdev->eq_heartbeat_received = true;
 }
 
diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 3cd8a1f69980..eeb6b2a80fc7 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -466,12 +466,12 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 		} else {
 			struct hl_bd *bd = queue->kernel_address;
 
-			bd += hl_pi_2_offset(queue->pi);
+			bd += hl_pi_2_offset(pi);
 
 			dev_err(hdev->dev, "Device CPU packet timeout (status = 0x%x)\n"
-					"Pkt info: dma_addr: 0x%llx, kernel_addr: %p, len:0x%x, ctl: 0x%x, ptr:0x%llx, dram_bd:%u\n",
-					tmp, pkt_dma_addr, (void *)pkt, bd->len, bd->ctl, bd->ptr,
-					queue->dram_bd);
+				"Pkt info[%u]: dma_addr: 0x%llx, kernel_addr: %p, len:0x%x, ctl: 0x%x, ptr:0x%llx, dram_bd:%u\n",
+				tmp, pi, pkt_dma_addr, (void *)pkt, bd->len, bd->ctl, bd->ptr,
+				queue->dram_bd);
 		}
 		hdev->device_cpu_disabled = true;
 		goto out;
@@ -681,12 +681,10 @@ int hl_fw_send_heartbeat(struct hl_device *hdev)
 	int rc;
 
 	memset(&hb_pkt, 0, sizeof(hb_pkt));
-	hb_pkt.ctl = cpu_to_le32(CPUCP_PACKET_TEST <<
-					CPUCP_PKT_CTL_OPCODE_SHIFT);
+	hb_pkt.ctl = cpu_to_le32(CPUCP_PACKET_TEST << CPUCP_PKT_CTL_OPCODE_SHIFT);
 	hb_pkt.value = cpu_to_le64(CPUCP_PACKET_FENCE_VAL);
 
-	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &hb_pkt,
-						sizeof(hb_pkt), 0, &result);
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &hb_pkt, sizeof(hb_pkt), 0, &result);
 
 	if ((rc) || (result != CPUCP_PACKET_FENCE_VAL))
 		return -EIO;
@@ -697,6 +695,8 @@ int hl_fw_send_heartbeat(struct hl_device *hdev)
 		rc = -EIO;
 	}
 
+	hdev->heartbeat_debug_info.last_pq_heartbeat_ts = ktime_get_real_seconds();
+
 	return rc;
 }
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index ce78b331e244..a06e5a966f45 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3196,10 +3196,15 @@ struct hl_reset_info {
 
 /**
  * struct eq_heartbeat_debug_info - stores debug info to be used upon heartbeat failure.
+ * @last_pq_heartbeat_ts: timestamp of the last test packet that was sent to FW.
+ *                        This packet is the trigger in FW to send the EQ heartbeat event.
+ * @last_eq_heartbeat_ts: timestamp of the last EQ heartbeat event that was received from FW.
  * @heartbeat_event_counter: number of heartbeat events received.
  * @cpu_queue_id: used to read the queue pi/ci
  */
 struct eq_heartbeat_debug_info {
+	time64_t last_pq_heartbeat_ts;
+	time64_t last_eq_heartbeat_ts;
 	u32 heartbeat_event_counter;
 	u32 cpu_queue_id;
 };
-- 
2.34.1

