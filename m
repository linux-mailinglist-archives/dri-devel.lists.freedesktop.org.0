Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE6A8CFF77
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 13:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCEF10EE39;
	Mon, 27 May 2024 11:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="b+3mZv9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE79010E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 11:58:39 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1716810491; bh=PJBEw7FnVPzIJklufwcaLQMQa3zl0cjZowAebR5IijA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+3mZv9PoUjcWumUz39c0/6zaZEUqPo3HArqi2wMR1dpllstpe3rsM8rO1pOXkJnW
 cZY8D7f1cUeUw6nETUojvL10n03kAh9novWehD1G7iLlbOGYp9LB9jkdsSigpbJjuS
 sMtyTeRC8OzeL62qaPWTOt5LQwiNvOzdIZu0ofsxJgWwDU87/lEb98aMaTn1Hbyw1y
 xuJCPAdXzE8vRFu/4gbrBhbnu1Kf07Gd/oMw/G6UNd15Y+hwBSLjhhbfUc/9uN1lew
 LhLD0ygNQhRcxYqwE0WSGDd53Y8lIZnK1y/YSvXuCjfUZBSfLNnTtb0JROzdCdcMfv
 +Ll4vZjzKRjIQ==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 44RBltNj1919357; Mon, 27 May 2024 14:47:55 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH 5/9] accel/habanalabs: no CPUCP prints on heartbeat failure
Date: Mon, 27 May 2024 14:47:42 +0300
Message-Id: <20240527114746.1919292-5-obitton@habana.ai>
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

From: Ohad Sharabi <osharabi@habana.ai>

If we detected heartbet event while some daemon in the background send
(via driver interface) CPUCP messages the dmesg will be flooded.

Instead, a slight refactor in hl_fw_send_cpu_message() returns -EAGAIN
when CPU is disabled (i.e. heartbeat failure) and only then.

Later, all calling functions that may be invoked by user space can issue
prints only if the error code is not -EAGAIN.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/debugfs.c     |  17 +--
 drivers/accel/habanalabs/common/device.c      |   4 +-
 drivers/accel/habanalabs/common/firmware_if.c | 142 +++++++++++-------
 drivers/accel/habanalabs/common/hwmon.c       |  60 ++++----
 drivers/accel/habanalabs/gaudi/gaudi.c        |  12 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c      |  12 +-
 drivers/accel/habanalabs/goya/goya.c          |  13 +-
 7 files changed, 128 insertions(+), 132 deletions(-)

diff --git a/drivers/accel/habanalabs/common/debugfs.c b/drivers/accel/habanalabs/common/debugfs.c
index b1c88d1837d9..de3ae2e47ec4 100644
--- a/drivers/accel/habanalabs/common/debugfs.c
+++ b/drivers/accel/habanalabs/common/debugfs.c
@@ -42,9 +42,8 @@ static int hl_debugfs_i2c_read(struct hl_device *hdev, u8 i2c_bus, u8 i2c_addr,
 	pkt.i2c_reg = i2c_reg;
 	pkt.i2c_len = i2c_len;
 
-	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
-						0, val);
-	if (rc)
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, val);
+	if (rc && rc != -EAGAIN)
 		dev_err(hdev->dev, "Failed to read from I2C, error %d\n", rc);
 
 	return rc;
@@ -75,10 +74,8 @@ static int hl_debugfs_i2c_write(struct hl_device *hdev, u8 i2c_bus, u8 i2c_addr,
 	pkt.i2c_len = i2c_len;
 	pkt.value = cpu_to_le64(val);
 
-	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
-						0, NULL);
-
-	if (rc)
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+	if (rc && rc != -EAGAIN)
 		dev_err(hdev->dev, "Failed to write to I2C, error %d\n", rc);
 
 	return rc;
@@ -99,10 +96,8 @@ static void hl_debugfs_led_set(struct hl_device *hdev, u8 led, u8 state)
 	pkt.led_index = cpu_to_le32(led);
 	pkt.value = cpu_to_le64(state);
 
-	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
-						0, NULL);
-
-	if (rc)
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+	if (rc && rc != -EAGAIN)
 		dev_err(hdev->dev, "Failed to set LED %d, error %d\n", led, rc);
 }
 
diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index eee41c367bd1..087bbb1778e5 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1498,10 +1498,8 @@ static void send_disable_pci_access(struct hl_device *hdev, u32 flags)
 		 * of heartbeat, the device CPU is marked as disable
 		 * so this message won't be sent
 		 */
-		if (hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0)) {
-			dev_warn(hdev->dev, "Failed to disable FW's PCI access\n");
+		if (hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0))
 			return;
-		}
 
 		/* verify that last EQs are handled before disabled is set */
 		if (hdev->cpu_queues_enable)
diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 348418643709..b5b960ce4ebd 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -370,43 +370,63 @@ int hl_fw_load_fw_to_device(struct hl_device *hdev, const char *fw_name,
 int hl_fw_send_pci_access_msg(struct hl_device *hdev, u32 opcode, u64 value)
 {
 	struct cpucp_packet pkt = {};
+	int rc;
 
 	pkt.ctl = cpu_to_le32(opcode << CPUCP_PKT_CTL_OPCODE_SHIFT);
 	pkt.value = cpu_to_le64(value);
 
-	return hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+	if (rc)
+		dev_err(hdev->dev, "Failed to disable FW's PCI access\n");
+
+	return rc;
 }
 
+/**
+ * hl_fw_send_cpu_message() - send CPU message to the device.
+ *
+ * @hdev: pointer to hl_device structure.
+ * @hw_queue_id: HW queue ID
+ * @msg: raw data of the message/packet
+ * @size: size of @msg in bytes
+ * @timeout_us: timeout in usec to wait for CPU reply on the message
+ * @result: return code reported by FW
+ *
+ * send message to the device CPU.
+ *
+ * Return: 0 on success, non-zero for failure.
+ *     -ENOMEM: memory allocation failure
+ *     -EAGAIN: CPU is disabled (try again when enabled)
+ *     -ETIMEDOUT: timeout waiting for FW response
+ *     -EIO: protocol error
+ */
 int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
-				u16 len, u32 timeout, u64 *result)
+				u16 size, u32 timeout_us, u64 *result)
 {
 	struct hl_hw_queue *queue = &hdev->kernel_queues[hw_queue_id];
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	u32 tmp, expected_ack_val, pi, opcode;
 	struct cpucp_packet *pkt;
 	dma_addr_t pkt_dma_addr;
 	struct hl_bd *sent_bd;
-	u32 tmp, expected_ack_val, pi, opcode;
-	int rc;
+	int rc = 0, fw_rc;
 
-	pkt = hl_cpu_accessible_dma_pool_alloc(hdev, len, &pkt_dma_addr);
+	pkt = hl_cpu_accessible_dma_pool_alloc(hdev, size, &pkt_dma_addr);
 	if (!pkt) {
-		dev_err(hdev->dev,
-			"Failed to allocate DMA memory for packet to CPU\n");
+		dev_err(hdev->dev, "Failed to allocate DMA memory for packet to CPU\n");
 		return -ENOMEM;
 	}
 
-	memcpy(pkt, msg, len);
+	memcpy(pkt, msg, size);
 
 	mutex_lock(&hdev->send_cpu_message_lock);
 
 	/* CPU-CP messages can be sent during soft-reset */
-	if (hdev->disabled && !hdev->reset_info.in_compute_reset) {
-		rc = 0;
+	if (hdev->disabled && !hdev->reset_info.in_compute_reset)
 		goto out;
-	}
 
 	if (hdev->device_cpu_disabled) {
-		rc = -EIO;
+		rc = -EAGAIN;
 		goto out;
 	}
 
@@ -422,7 +442,7 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 	 * Which means that we don't need to lock the access to the entire H/W
 	 * queues module when submitting a JOB to the CPU queue.
 	 */
-	hl_hw_queue_submit_bd(hdev, queue, hl_queue_inc_ptr(queue->pi), len, pkt_dma_addr);
+	hl_hw_queue_submit_bd(hdev, queue, hl_queue_inc_ptr(queue->pi), size, pkt_dma_addr);
 
 	if (prop->fw_app_cpu_boot_dev_sts0 & CPU_BOOT_DEV_STS0_PKT_PI_ACK_EN)
 		expected_ack_val = queue->pi;
@@ -431,7 +451,7 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 
 	rc = hl_poll_timeout_memory(hdev, &pkt->fence, tmp,
 				(tmp == expected_ack_val), 1000,
-				timeout, true);
+				timeout_us, true);
 
 	hl_hw_queue_inc_ci_kernel(hdev, hw_queue_id);
 
@@ -450,8 +470,8 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 
 	tmp = le32_to_cpu(pkt->ctl);
 
-	rc = (tmp & CPUCP_PKT_CTL_RC_MASK) >> CPUCP_PKT_CTL_RC_SHIFT;
-	if (rc) {
+	fw_rc = (tmp & CPUCP_PKT_CTL_RC_MASK) >> CPUCP_PKT_CTL_RC_SHIFT;
+	if (fw_rc) {
 		opcode = (tmp & CPUCP_PKT_CTL_OPCODE_MASK) >> CPUCP_PKT_CTL_OPCODE_SHIFT;
 
 		if (!prop->supports_advanced_cpucp_rc) {
@@ -460,7 +480,7 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 			goto scrub_descriptor;
 		}
 
-		switch (rc) {
+		switch (fw_rc) {
 		case cpucp_packet_invalid:
 			dev_err(hdev->dev,
 				"CPU packet %d is not supported by F/W\n", opcode);
@@ -485,7 +505,7 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 
 		/* propagate the return code from the f/w to the callers who want to check it */
 		if (result)
-			*result = rc;
+			*result = fw_rc;
 
 		rc = -EIO;
 
@@ -505,7 +525,7 @@ int hl_fw_send_cpu_message(struct hl_device *hdev, u32 hw_queue_id, u32 *msg,
 out:
 	mutex_unlock(&hdev->send_cpu_message_lock);
 
-	hl_cpu_accessible_dma_pool_free(hdev, len, pkt);
+	hl_cpu_accessible_dma_pool_free(hdev, size, pkt);
 
 	return rc;
 }
@@ -575,7 +595,7 @@ int hl_fw_unmask_irq_arr(struct hl_device *hdev, const u32 *irq_arr,
 int hl_fw_test_cpu_queue(struct hl_device *hdev)
 {
 	struct cpucp_packet test_pkt = {};
-	u64 result;
+	u64 result = 0;
 	int rc;
 
 	test_pkt.ctl = cpu_to_le32(CPUCP_PACKET_TEST <<
@@ -648,7 +668,7 @@ int hl_fw_send_device_activity(struct hl_device *hdev, bool open)
 int hl_fw_send_heartbeat(struct hl_device *hdev)
 {
 	struct cpucp_packet hb_pkt;
-	u64 result;
+	u64 result = 0;
 	int rc;
 
 	memset(&hb_pkt, 0, sizeof(hb_pkt));
@@ -910,7 +930,7 @@ static int hl_fw_send_msi_info_msg(struct hl_device *hdev)
 {
 	struct cpucp_array_data_packet *pkt;
 	size_t total_pkt_size, data_size;
-	u64 result;
+	u64 result = 0;
 	int rc;
 
 	/* skip sending this info for unsupported ASICs */
@@ -1001,11 +1021,10 @@ int hl_fw_get_eeprom_data(struct hl_device *hdev, void *data, size_t max_size)
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 			HL_CPUCP_EEPROM_TIMEOUT_USEC, &result);
-
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CPU-CP EEPROM packet, error %d\n",
-			rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP EEPROM packet, error %d\n", rc);
 		goto out;
 	}
 
@@ -1046,7 +1065,9 @@ int hl_fw_get_monitor_dump(struct hl_device *hdev, void *data)
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 							HL_CPUCP_MON_DUMP_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev, "Failed to handle CPU-CP monitor-dump packet, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP monitor-dump packet, error %d\n", rc);
 		goto out;
 	}
 
@@ -1080,8 +1101,9 @@ int hl_fw_cpucp_pci_counters_get(struct hl_device *hdev,
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 					HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CPU-CP PCI info pkt, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP PCI info pkt, error %d\n", rc);
 		return rc;
 	}
 	counters->rx_throughput = result;
@@ -1095,8 +1117,9 @@ int hl_fw_cpucp_pci_counters_get(struct hl_device *hdev,
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 					HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CPU-CP PCI info pkt, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP PCI info pkt, error %d\n", rc);
 		return rc;
 	}
 	counters->tx_throughput = result;
@@ -1109,8 +1132,9 @@ int hl_fw_cpucp_pci_counters_get(struct hl_device *hdev,
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 			HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CPU-CP PCI info pkt, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP PCI info pkt, error %d\n", rc);
 		return rc;
 	}
 	counters->replay_cnt = (u32) result;
@@ -1130,9 +1154,9 @@ int hl_fw_cpucp_total_energy_get(struct hl_device *hdev, u64 *total_energy)
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 					HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CpuCP total energy pkt, error %d\n",
-				rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CpuCP total energy pkt, error %d\n", rc);
 		return rc;
 	}
 
@@ -1208,7 +1232,8 @@ int hl_fw_cpucp_pll_info_get(struct hl_device *hdev, u32 pll_index,
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 			HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev, "Failed to read PLL info, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev, "Failed to read PLL info, error %d\n", rc);
 		return rc;
 	}
 
@@ -1235,7 +1260,8 @@ int hl_fw_cpucp_power_get(struct hl_device *hdev, u64 *power)
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 			HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev, "Failed to read power, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev, "Failed to read power, error %d\n", rc);
 		return rc;
 	}
 
@@ -1272,8 +1298,9 @@ int hl_fw_dram_replaced_row_get(struct hl_device *hdev,
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 					HL_CPUCP_INFO_TIMEOUT_USEC, &result);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CPU-CP replaced rows info pkt, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP replaced rows info pkt, error %d\n", rc);
 		goto out;
 	}
 
@@ -1298,7 +1325,8 @@ int hl_fw_dram_pending_row_get(struct hl_device *hdev, u32 *pend_rows_num)
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, &result);
 	if (rc) {
-		dev_err(hdev->dev,
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
 				"Failed to handle CPU-CP pending rows info pkt, error %d\n", rc);
 		goto out;
 	}
@@ -3147,10 +3175,10 @@ long hl_fw_get_frequency(struct hl_device *hdev, u32 pll_index, bool curr)
 	pkt.pll_index = cpu_to_le32((u32)used_pll_idx);
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, &result);
-
 	if (rc) {
-		dev_err(hdev->dev, "Failed to get frequency of PLL %d, error %d\n",
-			used_pll_idx, rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev, "Failed to get frequency of PLL %d, error %d\n",
+				used_pll_idx, rc);
 		return rc;
 	}
 
@@ -3174,8 +3202,7 @@ void hl_fw_set_frequency(struct hl_device *hdev, u32 pll_index, u64 freq)
 	pkt.value = cpu_to_le64(freq);
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
-
-	if (rc)
+	if (rc && rc != -EAGAIN)
 		dev_err(hdev->dev, "Failed to set frequency to PLL %d, error %d\n",
 			used_pll_idx, rc);
 }
@@ -3191,9 +3218,9 @@ long hl_fw_get_max_power(struct hl_device *hdev)
 	pkt.ctl = cpu_to_le32(CPUCP_PACKET_MAX_POWER_GET << CPUCP_PKT_CTL_OPCODE_SHIFT);
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, &result);
-
 	if (rc) {
-		dev_err(hdev->dev, "Failed to get max power, error %d\n", rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev, "Failed to get max power, error %d\n", rc);
 		return rc;
 	}
 
@@ -3215,8 +3242,7 @@ void hl_fw_set_max_power(struct hl_device *hdev)
 	pkt.value = cpu_to_le64(hdev->max_power);
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
-
-	if (rc)
+	if (rc && rc != -EAGAIN)
 		dev_err(hdev->dev, "Failed to set max power, error %d\n", rc);
 }
 
@@ -3242,11 +3268,11 @@ static int hl_fw_get_sec_attest_data(struct hl_device *hdev, u32 packet_id, void
 	pkt.data_max_size = cpu_to_le32(size);
 	pkt.nonce = cpu_to_le32(nonce);
 
-	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
-					timeout, NULL);
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), timeout, NULL);
 	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to handle CPU-CP pkt %u, error %d\n", packet_id, rc);
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev,
+				"Failed to handle CPU-CP pkt %u, error %d\n", packet_id, rc);
 		goto out;
 	}
 
@@ -3288,10 +3314,12 @@ int hl_fw_send_generic_request(struct hl_device *hdev, enum hl_passthrough_type
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *)&pkt, sizeof(pkt),
 						HL_CPUCP_INFO_TIMEOUT_USEC, &result);
-	if (rc)
-		dev_err(hdev->dev, "failed to send CPUCP data of generic fw pkt\n");
-	else
+	if (rc) {
+		if (rc != -EAGAIN)
+			dev_err(hdev->dev, "failed to send CPUCP data of generic fw pkt\n");
+	} else {
 		dev_dbg(hdev->dev, "generic pkt was successful, result: 0x%llx\n", result);
+	}
 
 	*size = (u32)result;
 
diff --git a/drivers/accel/habanalabs/common/hwmon.c b/drivers/accel/habanalabs/common/hwmon.c
index 36b951b5f503..52d1e6bf10dc 100644
--- a/drivers/accel/habanalabs/common/hwmon.c
+++ b/drivers/accel/habanalabs/common/hwmon.c
@@ -585,9 +585,10 @@ int hl_get_temperature(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err_ratelimited(hdev->dev,
-			"Failed to get temperature from sensor %d, error %d\n",
-			sensor_index, rc);
+		if (rc != -EAGAIN)
+			dev_err_ratelimited(hdev->dev,
+				"Failed to get temperature from sensor %d, error %d\n",
+				sensor_index, rc);
 		*value = 0;
 	}
 
@@ -610,8 +611,7 @@ int hl_set_temperature(struct hl_device *hdev,
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 						0, NULL);
-
-	if (rc)
+	if (rc && rc != -EAGAIN)
 		dev_err_ratelimited(hdev->dev,
 			"Failed to set temperature of sensor %d, error %d\n",
 			sensor_index, rc);
@@ -639,9 +639,10 @@ int hl_get_voltage(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err_ratelimited(hdev->dev,
-			"Failed to get voltage from sensor %d, error %d\n",
-			sensor_index, rc);
+		if (rc != -EAGAIN)
+			dev_err_ratelimited(hdev->dev,
+				"Failed to get voltage from sensor %d, error %d\n",
+				sensor_index, rc);
 		*value = 0;
 	}
 
@@ -668,9 +669,10 @@ int hl_get_current(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err_ratelimited(hdev->dev,
-			"Failed to get current from sensor %d, error %d\n",
-			sensor_index, rc);
+		if (rc != -EAGAIN)
+			dev_err_ratelimited(hdev->dev,
+				"Failed to get current from sensor %d, error %d\n",
+				sensor_index, rc);
 		*value = 0;
 	}
 
@@ -697,9 +699,10 @@ int hl_get_fan_speed(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err_ratelimited(hdev->dev,
-			"Failed to get fan speed from sensor %d, error %d\n",
-			sensor_index, rc);
+		if (rc != -EAGAIN)
+			dev_err_ratelimited(hdev->dev,
+				"Failed to get fan speed from sensor %d, error %d\n",
+				sensor_index, rc);
 		*value = 0;
 	}
 
@@ -726,9 +729,10 @@ int hl_get_pwm_info(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err_ratelimited(hdev->dev,
-			"Failed to get pwm info from sensor %d, error %d\n",
-			sensor_index, rc);
+		if (rc != -EAGAIN)
+			dev_err_ratelimited(hdev->dev,
+				"Failed to get pwm info from sensor %d, error %d\n",
+				sensor_index, rc);
 		*value = 0;
 	}
 
@@ -751,8 +755,7 @@ void hl_set_pwm_info(struct hl_device *hdev, int sensor_index, u32 attr,
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 						0, NULL);
-
-	if (rc)
+	if (rc && rc != -EAGAIN)
 		dev_err_ratelimited(hdev->dev,
 			"Failed to set pwm info to sensor %d, error %d\n",
 			sensor_index, rc);
@@ -774,8 +777,7 @@ int hl_set_voltage(struct hl_device *hdev,
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 						0, NULL);
-
-	if (rc)
+	if (rc && rc != -EAGAIN)
 		dev_err_ratelimited(hdev->dev,
 			"Failed to set voltage of sensor %d, error %d\n",
 			sensor_index, rc);
@@ -797,10 +799,8 @@ int hl_set_current(struct hl_device *hdev,
 	pkt.type = __cpu_to_le16(attr);
 	pkt.value = __cpu_to_le64(value);
 
-	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
-						0, NULL);
-
-	if (rc)
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+	if (rc && rc != -EAGAIN)
 		dev_err_ratelimited(hdev->dev,
 			"Failed to set current of sensor %d, error %d\n",
 			sensor_index, rc);
@@ -830,8 +830,7 @@ int hl_set_power(struct hl_device *hdev,
 
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 						0, NULL);
-
-	if (rc)
+	if (rc && rc != -EAGAIN)
 		dev_err_ratelimited(hdev->dev,
 			"Failed to set power of sensor %d, error %d\n",
 			sensor_index, rc);
@@ -859,9 +858,10 @@ int hl_get_power(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err_ratelimited(hdev->dev,
-			"Failed to get power of sensor %d, error %d\n",
-			sensor_index, rc);
+		if (rc != -EAGAIN)
+			dev_err_ratelimited(hdev->dev,
+				"Failed to get power of sensor %d, error %d\n",
+				sensor_index, rc);
 		*value = 0;
 	}
 
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index f2b04ffb0ecb..fa893a9b826e 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -1639,10 +1639,8 @@ static int gaudi_late_init(struct hl_device *hdev)
 	}
 
 	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_ENABLE_PCI_ACCESS, 0x0);
-	if (rc) {
-		dev_err(hdev->dev, "Failed to enable PCI access from CPU\n");
+	if (rc)
 		return rc;
-	}
 
 	/* Scrub both SRAM and DRAM */
 	rc = hdev->asic_funcs->scrub_device_mem(hdev);
@@ -4154,13 +4152,7 @@ static int gaudi_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 
 static int gaudi_suspend(struct hl_device *hdev)
 {
-	int rc;
-
-	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0);
-	if (rc)
-		dev_err(hdev->dev, "Failed to disable PCI access from CPU\n");
-
-	return rc;
+	return hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0);
 }
 
 static int gaudi_resume(struct hl_device *hdev)
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index ba1518f2bf5c..962b7fcd4318 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3312,10 +3312,8 @@ static int gaudi2_late_init(struct hl_device *hdev)
 
 	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_ENABLE_PCI_ACCESS,
 					gaudi2->virt_msix_db_dma_addr);
-	if (rc) {
-		dev_err(hdev->dev, "Failed to enable PCI access from CPU\n");
+	if (rc)
 		return rc;
-	}
 
 	rc = gaudi2_fetch_psoc_frequency(hdev);
 	if (rc) {
@@ -6467,13 +6465,7 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 
 static int gaudi2_suspend(struct hl_device *hdev)
 {
-	int rc;
-
-	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0);
-	if (rc)
-		dev_err(hdev->dev, "Failed to disable PCI access from CPU\n");
-
-	return rc;
+	return hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0);
 }
 
 static int gaudi2_resume(struct hl_device *hdev)
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 5a359c3bdc78..84768e306269 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -893,11 +893,8 @@ int goya_late_init(struct hl_device *hdev)
 	WREG32(mmMMU_LOG2_DDR_SIZE, ilog2(prop->dram_size));
 
 	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_ENABLE_PCI_ACCESS, 0x0);
-	if (rc) {
-		dev_err(hdev->dev,
-			"Failed to enable PCI access from CPU %d\n", rc);
+	if (rc)
 		return rc;
-	}
 
 	/* force setting to low frequency */
 	goya->curr_pll_profile = PLL_LOW;
@@ -2864,13 +2861,7 @@ static int goya_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 
 int goya_suspend(struct hl_device *hdev)
 {
-	int rc;
-
-	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0);
-	if (rc)
-		dev_err(hdev->dev, "Failed to disable PCI access from CPU\n");
-
-	return rc;
+	return hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_DISABLE_PCI_ACCESS, 0x0);
 }
 
 int goya_resume(struct hl_device *hdev)
-- 
2.34.1

