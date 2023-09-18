Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F77A45A4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE15E10E23A;
	Mon, 18 Sep 2023 09:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E48D10E234
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:13:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 863DB60F0C;
 Mon, 18 Sep 2023 09:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF119C433CC;
 Mon, 18 Sep 2023 09:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695028419;
 bh=jZzubz+wsAcVV1N05/YAGUJdAXiGGqIY6UuWeo0Tcgk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MhBcCBskLilP1NkOm/lbjBhp/rbVw2FzZnl+eczpom7qmeAVnJJ7IzdGU+eZkC90g
 gbVkYzjiP46mabs4w3Gd5pl/Iagzbw5JT0V8YEM0PdC8JQt+BnG3WirVYW8ciSZ21a
 nMgctOgGd7JH6zReoqaF9aF2RKbWTsfQjkQlUvV0d/vBBkhPpqxFiYEKstjnxTokFJ
 4rxYGwbGlZOGk2jvHXUcz96GUFIDsPBRwx35dEz88ykBRCu7PvIpCx8v3S35yl77O0
 fb6M8OzEZgrBUOwk7mxx0ccoWw9+gYKg5Pc45EoeTJhTNmx2l6Z6toGVLp/X0M/O6R
 Emd6cRSoq6JSg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/14] accel/habanalabs/gaudi2: add eq health check using irq
Date: Mon, 18 Sep 2023 12:13:16 +0300
Message-Id: <20230918091321.855943-9-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918091321.855943-1-ogabbay@kernel.org>
References: <20230918091321.855943-1-ogabbay@kernel.org>
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
Cc: farah kassabri <fkassabri@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: farah kassabri <fkassabri@habana.ai>

This is the second patch for applying the eq health check mechanism
which will add support for the interrupt flow for gaudi2 asic.

More info about the interrupt mechanism:
set a dedicated msix for the eq error interrupt, and add
interrupt handler for it.
when FW detects some issue with EQ like EQ_FULL, it'll
raise that interrupt and driver should reset the device.
Driver will inform the FW which msix index to use through
the already existing handshake mechanism which will
send msix info message to fw.

Signed-off-by: farah kassabri <fkassabri@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h |  1 +
 drivers/accel/habanalabs/common/irq.c        | 12 ++++++++++++
 drivers/accel/habanalabs/gaudi2/gaudi2.c     | 16 ++++++++++++++++
 drivers/accel/habanalabs/gaudi2/gaudi2P.h    |  1 +
 include/linux/habanalabs/cpucp_if.h          |  1 +
 5 files changed, 31 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index e5b416852996..6f2cbd3c2e95 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3689,6 +3689,7 @@ irqreturn_t hl_irq_handler_eq(int irq, void *arg);
 irqreturn_t hl_irq_handler_dec_abnrm(int irq, void *arg);
 irqreturn_t hl_irq_handler_user_interrupt(int irq, void *arg);
 irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg);
+irqreturn_t hl_irq_eq_error_interrupt_thread_handler(int irq, void *arg);
 u32 hl_cq_inc_ptr(u32 ptr);
 
 int hl_asid_init(struct hl_device *hdev);
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 10ac100bf9e2..f6b6c54bc868 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -401,6 +401,18 @@ irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+irqreturn_t hl_irq_eq_error_interrupt_thread_handler(int irq, void *arg)
+{
+	u64 event_mask = HL_NOTIFIER_EVENT_DEVICE_RESET | HL_NOTIFIER_EVENT_DEVICE_UNAVAILABLE;
+	struct hl_device *hdev = arg;
+
+	dev_err(hdev->dev, "EQ error interrupt received\n");
+
+	hl_device_cond_reset(hdev, HL_DRV_RESET_HARD, event_mask);
+
+	return IRQ_HANDLED;
+}
+
 /**
  * hl_irq_handler_eq - irq handler for event queue
  *
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index e507847bf460..b0ba62b691ec 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -4175,6 +4175,8 @@ static const char *gaudi2_irq_name(u16 irq_number)
 		return "gaudi2 unexpected error";
 	case GAUDI2_IRQ_NUM_USER_FIRST ... GAUDI2_IRQ_NUM_USER_LAST:
 		return "gaudi2 user completion";
+	case GAUDI2_IRQ_NUM_EQ_ERROR:
+		return "gaudi2 eq error";
 	default:
 		return "invalid";
 	}
@@ -4317,6 +4319,15 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 		}
 	}
 
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_EQ_ERROR);
+	rc = request_threaded_irq(irq, NULL, hl_irq_eq_error_interrupt_thread_handler,
+					IRQF_ONESHOT, gaudi2_irq_name(GAUDI2_IRQ_NUM_EQ_ERROR),
+					hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to request IRQ %d", irq);
+		goto free_user_irq;
+	}
+
 	gaudi2->hw_cap_initialized |= HW_CAP_MSIX;
 
 	return 0;
@@ -4376,6 +4387,7 @@ static void gaudi2_sync_irqs(struct hl_device *hdev)
 	}
 
 	synchronize_irq(pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_EVENT_QUEUE));
+	synchronize_irq(pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_EQ_ERROR));
 }
 
 static void gaudi2_disable_msix(struct hl_device *hdev)
@@ -4412,6 +4424,9 @@ static void gaudi2_disable_msix(struct hl_device *hdev)
 	cq = &hdev->completion_queue[GAUDI2_RESERVED_CQ_CS_COMPLETION];
 	free_irq(irq, cq);
 
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_EQ_ERROR);
+	free_irq(irq, hdev);
+
 	pci_free_irq_vectors(hdev->pdev);
 
 	gaudi2->hw_cap_initialized &= ~HW_CAP_MSIX;
@@ -11345,6 +11360,7 @@ static int gaudi2_ack_mmu_page_fault_or_access_error(struct hl_device *hdev, u64
 static void gaudi2_get_msi_info(__le32 *table)
 {
 	table[CPUCP_EVENT_QUEUE_MSI_TYPE] = cpu_to_le32(GAUDI2_EVENT_QUEUE_MSIX_IDX);
+	table[CPUCP_EVENT_QUEUE_ERR_MSI_TYPE] = cpu_to_le32(GAUDI2_IRQ_NUM_EQ_ERROR);
 }
 
 static int gaudi2_map_pll_idx_to_fw_idx(u32 pll_idx)
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index 4535aa5ab561..14e281fd9895 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -419,6 +419,7 @@ enum gaudi2_irq_num {
 	GAUDI2_IRQ_NUM_NIC_PORT_FIRST,
 	GAUDI2_IRQ_NUM_NIC_PORT_LAST = (GAUDI2_IRQ_NUM_NIC_PORT_FIRST + NIC_NUMBER_OF_PORTS - 1),
 	GAUDI2_IRQ_NUM_TPC_ASSERT,
+	GAUDI2_IRQ_NUM_EQ_ERROR,
 	GAUDI2_IRQ_NUM_RESERVED_FIRST,
 	GAUDI2_IRQ_NUM_RESERVED_LAST = (GAUDI2_MSIX_ENTRIES - GAUDI2_TOTAL_USER_INTERRUPTS - 1),
 	GAUDI2_IRQ_NUM_UNEXPECTED_ERROR = RESERVED_MSIX_UNEXPECTED_USER_ERROR_INTERRUPT,
diff --git a/include/linux/habanalabs/cpucp_if.h b/include/linux/habanalabs/cpucp_if.h
index a18fa81aad1f..84d74c4ee4d3 100644
--- a/include/linux/habanalabs/cpucp_if.h
+++ b/include/linux/habanalabs/cpucp_if.h
@@ -1004,6 +1004,7 @@ enum cpucp_msi_type {
 	CPUCP_NIC_PORT5_MSI_TYPE,
 	CPUCP_NIC_PORT7_MSI_TYPE,
 	CPUCP_NIC_PORT9_MSI_TYPE,
+	CPUCP_EVENT_QUEUE_ERR_MSI_TYPE,
 	CPUCP_NUM_OF_MSI_TYPES
 };
 
-- 
2.34.1

