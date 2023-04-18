Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5C6E5D9E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8373010E724;
	Tue, 18 Apr 2023 09:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9717810E723
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:39:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 277D2625F0;
 Tue, 18 Apr 2023 09:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29045C4339C;
 Tue, 18 Apr 2023 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681810767;
 bh=GbucswmlkFevsYu4Aa/VuRUww7vrdpB9R+VxnfOPSqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eJMHePn0WZuCMPv2fIR95nLiU69iIZ/l+ZPKhEsWPzv3KMo3Qpok4bzd+nkMND6rI
 rWdSMFNXDRBMfKu9JBPxmtvW/dhYqGJYWJlXGE2fTt2GyxbwmBwWr0P4nGsTv1X5rK
 h+qjXL7YO/0W87w/G610uxqUx5pBqxfJAWmhZczrDVvfrhYcsEAqCJwJPlmT8+i971
 oyCqdmCSTLF22tm0ujo9rhvk8Qk5VnixKO/P9Zr6AOAIcX5BgHnyGpesmKNHRk3hal
 XSM176z49yQmx/y16xmKOBcwklRO9KYLUCn/ePYTXAFFRoQnpeh7U1ahUhWwl46l5X
 4W/7SQhtmlCgw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] accel/habanalabs: do soft-reset using cpucp packet
Date: Tue, 18 Apr 2023 12:39:11 +0300
Message-Id: <20230418093916.2979728-5-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418093916.2979728-1-ogabbay@kernel.org>
References: <20230418093916.2979728-1-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

This is done depending on the FW version. The cpucp method is
preferable and saves scratchpads resource.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 14 ++++++++++
 drivers/accel/habanalabs/common/habanalabs.h  |  1 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 26 ++++++++++++-------
 .../habanalabs/include/common/cpucp_if.h      |  4 +++
 4 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 62052cfe694f..e48f024d8649 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -591,6 +591,20 @@ void hl_fw_cpu_accessible_dma_pool_free(struct hl_device *hdev, size_t size,
 			size);
 }
 
+int hl_fw_send_soft_reset(struct hl_device *hdev)
+{
+	struct cpucp_packet pkt;
+	int rc;
+
+	memset(&pkt, 0, sizeof(pkt));
+	pkt.ctl = cpu_to_le32(CPUCP_PACKET_SOFT_RESET << CPUCP_PKT_CTL_OPCODE_SHIFT);
+	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+	if (rc)
+		dev_err(hdev->dev, "failed to send soft-reset msg (err = %d)\n", rc);
+
+	return rc;
+}
+
 int hl_fw_send_device_activity(struct hl_device *hdev, bool open)
 {
 	struct cpucp_packet pkt;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 02620654ccdf..6b102947cb90 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3884,6 +3884,7 @@ int hl_fw_dram_replaced_row_get(struct hl_device *hdev,
 int hl_fw_dram_pending_row_get(struct hl_device *hdev, u32 *pend_rows_num);
 int hl_fw_cpucp_engine_core_asid_set(struct hl_device *hdev, u32 asid);
 int hl_fw_send_device_activity(struct hl_device *hdev, bool open);
+int hl_fw_send_soft_reset(struct hl_device *hdev);
 int hl_pci_bars_map(struct hl_device *hdev, const char * const name[3],
 			bool is_wc[3]);
 int hl_pci_elbi_read(struct hl_device *hdev, u64 addr, u32 *data);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 6e3aa89b19c2..5c80e7af5b78 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -6148,18 +6148,24 @@ static int gaudi2_execute_soft_reset(struct hl_device *hdev, bool driver_perform
 						u32 poll_timeout_us)
 {
 	struct cpu_dyn_regs *dyn_regs = &hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
+	int rc = 0;
 
 	if (!driver_performs_reset) {
-		/* set SP to indicate reset request sent to FW */
-		if (dyn_regs->cpu_rst_status)
-			WREG32(le32_to_cpu(dyn_regs->cpu_rst_status), CPU_RST_STATUS_NA);
-		else
-			WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
-
-		WREG32(le32_to_cpu(dyn_regs->gic_host_soft_rst_irq),
-			gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
-
-		return gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
+		if (hl_is_fw_sw_ver_below(hdev, 1, 10)) {
+			/* set SP to indicate reset request sent to FW */
+			if (dyn_regs->cpu_rst_status)
+				WREG32(le32_to_cpu(dyn_regs->cpu_rst_status), CPU_RST_STATUS_NA);
+			else
+				WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
+			WREG32(le32_to_cpu(dyn_regs->gic_host_soft_rst_irq),
+				gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
+
+			/* wait for f/w response */
+			rc = gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
+		} else {
+			rc = hl_fw_send_soft_reset(hdev);
+		}
+		return rc;
 	}
 
 	/* Block access to engines, QMANs and SM during reset, these
diff --git a/drivers/accel/habanalabs/include/common/cpucp_if.h b/drivers/accel/habanalabs/include/common/cpucp_if.h
index 8bbe685458c4..f68308cc2524 100644
--- a/drivers/accel/habanalabs/include/common/cpucp_if.h
+++ b/drivers/accel/habanalabs/include/common/cpucp_if.h
@@ -665,6 +665,9 @@ enum pq_init_status {
  *
  * CPUCP_PACKET_REGISTER_INTERRUPTS -
  *       Packet to register interrupts indicating LKD is ready to receive events from FW.
+ *
+ * CPUCP_PACKET_SOFT_RESET -
+ *	 Packet to perform soft-reset.
  */
 
 enum cpucp_packet_id {
@@ -731,6 +734,7 @@ enum cpucp_packet_id {
 	CPUCP_PACKET_RESERVED11,		/* not used */
 	CPUCP_PACKET_RESERVED12,		/* internal */
 	CPUCP_PACKET_REGISTER_INTERRUPTS,	/* internal */
+	CPUCP_PACKET_SOFT_RESET,		/* internal */
 	CPUCP_PACKET_ID_MAX			/* must be last */
 };
 
-- 
2.40.0

