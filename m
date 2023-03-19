Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DE6C0078
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1806510E508;
	Sun, 19 Mar 2023 09:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4398E10E16B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:59:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0649ECE0BB0;
 Sun, 19 Mar 2023 09:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFABC4339B;
 Sun, 19 Mar 2023 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679219937;
 bh=lnZMIbWVXiImVIQ223fwTOpNbmc7JDEXIG3SHOPjsxE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EnUjXbkNXrkEwiTalSuaj3vXmcftaNtLGoyxszdoq/H184bPbs7Dx1502wCKp+SBH
 /e08Owet1Jbzu1WfoOaRfyy43fG888H23YZLsSTABFpZnWAYh0tdbiOgNbVNVJsjIL
 6Z1AiDD25PWcng2iOlpov37hFDhJZvfxZ27l/hNDiYe/BJ5HdYY9lp3qHDzHUybW9/
 ilovrd40RkoDOuGMJcxx0yJxnaluxtYFREktl9k0Kph3D0da6Lg9h2Z8+vAdoJB/R9
 fTt4RbFgoEKXLqmzUm0h177MkDCcsSlskExnkt0woalVsTYYK8dzcfr9o13MTxeaEX
 giNG2tSTgLTkg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] accel/habanalabs: add handling for unexpected user event
Date: Sun, 19 Mar 2023 11:58:48 +0200
Message-Id: <20230319095850.692040-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319095850.692040-1-ogabbay@kernel.org>
References: <20230319095850.692040-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

In order for the user to be aware of unexpected events in Gaudi2 that
aren't assigned to a specific engine, we are adding the handling of
this dedicated interrupt.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h  |  7 +++++-
 drivers/accel/habanalabs/common/irq.c         |  8 ++++++
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 25 +++++++++++++++++++
 drivers/accel/habanalabs/gaudi2/gaudi2P.h     |  7 ++++--
 .../accel/habanalabs/include/gaudi2/gaudi2.h  |  2 ++
 5 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index c01677ed3c07..1636f6a700b9 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -662,6 +662,7 @@ struct hl_hints_range {
  * @user_interrupt_count: number of user interrupts.
  * @user_dec_intr_count: number of decoder interrupts exposed to user.
  * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
+ * @unexpected_user_error_interrupt_id: interrupt id used to indicate an unexpected user error.
  * @cache_line_size: device cache line size.
  * @server_type: Server type that the ASIC is currently installed in.
  *               The value is according to enum hl_server_type in uapi file.
@@ -792,6 +793,7 @@ struct asic_fixed_properties {
 	u16				user_interrupt_count;
 	u16				user_dec_intr_count;
 	u16				tpc_interrupt_id;
+	u16				unexpected_user_error_interrupt_id;
 	u16				cache_line_size;
 	u16				server_type;
 	u8				completion_queues_count;
@@ -1101,7 +1103,8 @@ struct hl_cq {
 enum hl_user_interrupt_type {
 	HL_USR_INTERRUPT_CQ = 0,
 	HL_USR_INTERRUPT_DECODER,
-	HL_USR_INTERRUPT_TPC
+	HL_USR_INTERRUPT_TPC,
+	HL_USR_INTERRUPT_UNEXPECTED
 };
 
 /**
@@ -3155,6 +3158,7 @@ struct hl_reset_info {
  *                  interrupt, driver will monitor the list of fences
  *                  registered to this interrupt.
  * @tpc_interrupt: single TPC interrupt for all TPCs.
+ * @unexpected_error_interrupt: single interrupt for unexpected user error indication.
  * @common_user_cq_interrupt: common user CQ interrupt for all user CQ interrupts.
  *                         upon any user CQ interrupt, driver will monitor the
  *                         list of fences registered to this common structure.
@@ -3340,6 +3344,7 @@ struct hl_device {
 	struct hl_cq			*completion_queue;
 	struct hl_user_interrupt	*user_interrupt;
 	struct hl_user_interrupt	tpc_interrupt;
+	struct hl_user_interrupt	unexpected_error_interrupt;
 	struct hl_user_interrupt	common_user_cq_interrupt;
 	struct hl_user_interrupt	common_decoder_interrupt;
 	struct hl_cs			**shadow_cs_queue;
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 8c6705cf958e..fab1abc5c910 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -340,6 +340,11 @@ static void handle_tpc_interrupt(struct hl_device *hdev)
 	hl_device_cond_reset(hdev, flags, event_mask);
 }
 
+static void handle_unexpected_user_interrupt(struct hl_device *hdev)
+{
+	dev_err_ratelimited(hdev->dev, "Received unexpected user error interrupt\n");
+}
+
 /**
  * hl_irq_handler_user_interrupt - irq handler for user interrupts
  *
@@ -385,6 +390,9 @@ irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg)
 	case HL_USR_INTERRUPT_TPC:
 		handle_tpc_interrupt(hdev);
 		break;
+	case HL_USR_INTERRUPT_UNEXPECTED:
+		handle_unexpected_user_interrupt(hdev);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 40563e29be8d..cff1d4588913 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2440,6 +2440,7 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 
 	prop->first_available_user_interrupt = GAUDI2_IRQ_NUM_USER_FIRST;
 	prop->tpc_interrupt_id = GAUDI2_IRQ_NUM_TPC_ASSERT;
+	prop->unexpected_user_error_interrupt_id = GAUDI2_IRQ_NUM_UNEXPECTED_ERROR;
 
 	prop->first_available_cq[0] = GAUDI2_RESERVED_CQ_NUMBER;
 
@@ -3346,6 +3347,10 @@ static void gaudi2_user_interrupt_setup(struct hl_device *hdev)
 	/* Initialize TPC interrupt */
 	HL_USR_INTR_STRUCT_INIT(hdev->tpc_interrupt, hdev, 0, HL_USR_INTERRUPT_TPC);
 
+	/* Initialize general purpose interrupt */
+	HL_USR_INTR_STRUCT_INIT(hdev->unexpected_error_interrupt, hdev, 0,
+						HL_USR_INTERRUPT_UNEXPECTED);
+
 	/* Initialize common user CQ interrupt */
 	HL_USR_INTR_STRUCT_INIT(hdev->common_user_cq_interrupt, hdev,
 				HL_COMMON_USER_CQ_INTERRUPT_ID, HL_USR_INTERRUPT_CQ);
@@ -4005,6 +4010,8 @@ static const char *gaudi2_irq_name(u16 irq_number)
 		return gaudi2_vdec_irq_name[irq_number - GAUDI2_IRQ_NUM_DCORE0_DEC0_NRM];
 	case GAUDI2_IRQ_NUM_TPC_ASSERT:
 		return "gaudi2 tpc assert";
+	case GAUDI2_IRQ_NUM_UNEXPECTED_ERROR:
+		return "gaudi2 tpc assert";
 	case GAUDI2_IRQ_NUM_USER_FIRST ... GAUDI2_IRQ_NUM_USER_LAST:
 		return "gaudi2 user completion";
 	default:
@@ -4125,6 +4132,15 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 		goto free_dec_irq;
 	}
 
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_UNEXPECTED_ERROR);
+	rc = request_irq(irq, hl_irq_handler_user_interrupt, 0,
+			gaudi2_irq_name(GAUDI2_IRQ_NUM_UNEXPECTED_ERROR),
+					&hdev->unexpected_error_interrupt);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to request IRQ %d", irq);
+		goto free_tpc_irq;
+	}
+
 	for (i = GAUDI2_IRQ_NUM_USER_FIRST, j = prop->user_dec_intr_count, user_irq_init_cnt = 0;
 			user_irq_init_cnt < prop->user_interrupt_count;
 			i++, j++, user_irq_init_cnt++) {
@@ -4151,6 +4167,11 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 		irq = pci_irq_vector(hdev->pdev, i);
 		free_irq(irq, &hdev->user_interrupt[j]);
 	}
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_UNEXPECTED_ERROR);
+	free_irq(irq, &hdev->unexpected_error_interrupt);
+free_tpc_irq:
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT);
+	free_irq(irq, &hdev->tpc_interrupt);
 free_dec_irq:
 	gaudi2_dec_disable_msix(hdev, GAUDI2_IRQ_NUM_DEC_LAST + 1);
 free_event_irq:
@@ -4185,6 +4206,7 @@ static void gaudi2_sync_irqs(struct hl_device *hdev)
 	}
 
 	synchronize_irq(pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT));
+	synchronize_irq(pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_UNEXPECTED_ERROR));
 
 	for (i = GAUDI2_IRQ_NUM_USER_FIRST, j = 0 ; j < hdev->asic_prop.user_interrupt_count;
 										i++, j++) {
@@ -4215,6 +4237,9 @@ static void gaudi2_disable_msix(struct hl_device *hdev)
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT);
 	free_irq(irq, &hdev->tpc_interrupt);
 
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_UNEXPECTED_ERROR);
+	free_irq(irq, &hdev->unexpected_error_interrupt);
+
 	for (i = GAUDI2_IRQ_NUM_USER_FIRST, j = prop->user_dec_intr_count, k = 0;
 			k < hdev->asic_prop.user_interrupt_count ; i++, j++, k++) {
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index f79958b24811..0742046810f9 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -387,6 +387,8 @@ enum gaudi2_edma_id {
  * We have 64 CQ's per dcore, CQ0 in dcore 0 is reserved for legacy mode
  */
 #define GAUDI2_NUM_USER_INTERRUPTS 255
+#define GAUDI2_NUM_RESERVED_INTERRUPTS 1
+#define GAUDI2_TOTAL_USER_INTERRUPTS (GAUDI2_NUM_USER_INTERRUPTS + GAUDI2_NUM_RESERVED_INTERRUPTS)
 
 enum gaudi2_irq_num {
 	GAUDI2_IRQ_NUM_EVENT_QUEUE = GAUDI2_EVENT_QUEUE_MSIX_IDX,
@@ -416,8 +418,9 @@ enum gaudi2_irq_num {
 	GAUDI2_IRQ_NUM_NIC_PORT_LAST = (GAUDI2_IRQ_NUM_NIC_PORT_FIRST + NIC_NUMBER_OF_PORTS - 1),
 	GAUDI2_IRQ_NUM_TPC_ASSERT,
 	GAUDI2_IRQ_NUM_RESERVED_FIRST,
-	GAUDI2_IRQ_NUM_RESERVED_LAST = (GAUDI2_MSIX_ENTRIES - GAUDI2_NUM_USER_INTERRUPTS - 1),
-	GAUDI2_IRQ_NUM_USER_FIRST,
+	GAUDI2_IRQ_NUM_RESERVED_LAST = (GAUDI2_MSIX_ENTRIES - GAUDI2_TOTAL_USER_INTERRUPTS - 1),
+	GAUDI2_IRQ_NUM_UNEXPECTED_ERROR = RESERVED_MSIX_UNEXPECTED_USER_ERROR_INTERRUPT,
+	GAUDI2_IRQ_NUM_USER_FIRST = GAUDI2_IRQ_NUM_UNEXPECTED_ERROR + 1,
 	GAUDI2_IRQ_NUM_USER_LAST = (GAUDI2_IRQ_NUM_USER_FIRST + GAUDI2_NUM_USER_INTERRUPTS - 1),
 	GAUDI2_IRQ_NUM_LAST = (GAUDI2_MSIX_ENTRIES - 1)
 };
diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
index 5b4f9e108798..0231d6c55b4a 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2.h
@@ -63,6 +63,8 @@
 #define RESERVED_VA_RANGE_FOR_ARC_ON_HOST_HPAGE_START	0xFFF0F80000000000ull
 #define RESERVED_VA_RANGE_FOR_ARC_ON_HOST_HPAGE_END	0xFFF0FFFFFFFFFFFFull
 
+#define RESERVED_MSIX_UNEXPECTED_USER_ERROR_INTERRUPT	256
+
 #define GAUDI2_MSIX_ENTRIES	512
 
 #define QMAN_PQ_ENTRY_SIZE	16			/* Bytes */
-- 
2.40.0

