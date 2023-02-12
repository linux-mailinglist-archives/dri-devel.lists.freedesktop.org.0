Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908EA6939F0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADFC10E1F2;
	Sun, 12 Feb 2023 20:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048E10E474
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35E0460B35;
 Sun, 12 Feb 2023 20:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6C4C433EF;
 Sun, 12 Feb 2023 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234735;
 bh=y+2SkfZ0qneur3y3ujatPoIfLNPxwiyf50xdobLLsjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r6sqk7Rix74WO9aT8yZ91Hb9vybp7AG4UqRyu3EDpSzHammlxSBky/yzCRvpLnxse
 Nqp576FE9ajNufo+igKALjwDmrDUggSvrvwluASYpgxlS/p1zCbBfGCD7yE5+m+zUi
 pcxt/8Tx4MVcbPdJ2qYhN++zYZSF6/NNYZXykXi6f5JC+kjAjQ7hVVsDZN9Vsp9dcI
 FOjTvAOR+bgvr6BcuGR5s63+XeK9LghzvJ1h8XoKj6aVYLm6PqVqevCx4llJzYBv3H
 Mr+dIjl2mlGngjc+0g6e12Hdq3x7gV+L7l38ykFByDbZA83ayCtHAZ8KkymwAXCclH
 XQVcJA+YB/bqg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/27] habanalabs/gaudi2: add support for TPC assert
Date: Sun, 12 Feb 2023 22:44:47 +0200
Message-Id: <20230212204454.2938561-20-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
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

In order to allow TPC engines to raise an assert, we must expose
the relevant MSIX interrupt to the user so he will configure the engine
correctly. In addition, we implement the corresponding interrupt
handler that will notify the user upon such an event.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h  |  5 ++++
 .../habanalabs/common/habanalabs_ioctl.c      |  1 +
 drivers/accel/habanalabs/common/irq.c         | 18 +++++++++++++
 drivers/accel/habanalabs/gaudi/gaudi.c        |  1 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 25 ++++++++++++++++---
 drivers/accel/habanalabs/gaudi2/gaudi2P.h     |  2 ++
 drivers/accel/habanalabs/goya/goya.c          |  1 +
 include/uapi/drm/habanalabs_accel.h           |  3 ++-
 8 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 24ad15272040..ed6987a0050f 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -665,6 +665,7 @@ struct hl_hints_range {
  * @first_available_cq: first available CQ for the user.
  * @user_interrupt_count: number of user interrupts.
  * @user_dec_intr_count: number of decoder interrupts exposed to user.
+ * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
  * @cache_line_size: device cache line size.
  * @server_type: Server type that the ASIC is currently installed in.
  *               The value is according to enum hl_server_type in uapi file.
@@ -791,6 +792,7 @@ struct asic_fixed_properties {
 	u16				first_available_cq[HL_MAX_DCORES];
 	u16				user_interrupt_count;
 	u16				user_dec_intr_count;
+	u16				tpc_interrupt_id;
 	u16				cache_line_size;
 	u16				server_type;
 	u8				completion_queues_count;
@@ -1099,6 +1101,7 @@ struct hl_cq {
 enum hl_user_interrupt_type {
 	HL_USR_INTERRUPT_CQ = 0,
 	HL_USR_INTERRUPT_DECODER,
+	HL_USR_INTERRUPT_TPC
 };
 
 /**
@@ -3148,6 +3151,7 @@ struct hl_reset_info {
  * @user_interrupt: array of hl_user_interrupt. upon the corresponding user
  *                  interrupt, driver will monitor the list of fences
  *                  registered to this interrupt.
+ * @tpc_interrupt: single TPC interrupt for all TPCs.
  * @common_user_cq_interrupt: common user CQ interrupt for all user CQ interrupts.
  *                         upon any user CQ interrupt, driver will monitor the
  *                         list of fences registered to this common structure.
@@ -3332,6 +3336,7 @@ struct hl_device {
 	enum hl_asic_type		asic_type;
 	struct hl_cq			*completion_queue;
 	struct hl_user_interrupt	*user_interrupt;
+	struct hl_user_interrupt	tpc_interrupt;
 	struct hl_user_interrupt	common_user_cq_interrupt;
 	struct hl_user_interrupt	common_decoder_interrupt;
 	struct hl_cs			**shadow_cs_queue;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 448cdd2501d8..100282fc82fc 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -102,6 +102,7 @@ static int hw_ip_info(struct hl_device *hdev, struct hl_info_args *args)
 	hw_ip.mme_master_slave_mode = prop->mme_master_slave_mode;
 	hw_ip.first_available_interrupt_id = prop->first_available_user_interrupt;
 	hw_ip.number_of_user_interrupts = prop->user_interrupt_count;
+	hw_ip.tpc_interrupt_id = prop->tpc_interrupt_id;
 
 	hw_ip.edma_enabled_mask = prop->edma_enabled_mask;
 	hw_ip.server_type = prop->server_type;
diff --git a/drivers/accel/habanalabs/common/irq.c b/drivers/accel/habanalabs/common/irq.c
index 716228291b46..bd0e3413721b 100644
--- a/drivers/accel/habanalabs/common/irq.c
+++ b/drivers/accel/habanalabs/common/irq.c
@@ -325,6 +325,21 @@ static void handle_user_interrupt(struct hl_device *hdev, struct hl_user_interru
 	}
 }
 
+static void handle_tpc_interrupt(struct hl_device *hdev)
+{
+	u64 event_mask;
+	u32 flags;
+
+	event_mask = HL_NOTIFIER_EVENT_TPC_ASSERT |
+		HL_NOTIFIER_EVENT_USER_ENGINE_ERR |
+		HL_NOTIFIER_EVENT_DEVICE_RESET;
+
+	flags = HL_DRV_RESET_DELAY;
+
+	dev_err_ratelimited(hdev->dev, "Received TPC assert\n");
+	hl_device_cond_reset(hdev, flags, event_mask);
+}
+
 /**
  * hl_irq_handler_user_interrupt - irq handler for user interrupts
  *
@@ -367,6 +382,9 @@ irqreturn_t hl_irq_user_interrupt_thread_handler(int irq, void *arg)
 		/* Handle decoder interrupt registered on this specific irq */
 		handle_user_interrupt(hdev, user_int);
 		break;
+	case HL_USR_INTERRUPT_TPC:
+		handle_tpc_interrupt(hdev);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index e097641db1d2..a276a2a4a46d 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -679,6 +679,7 @@ static int gaudi_set_fixed_properties(struct hl_device *hdev)
 			(num_sync_stream_queues * HL_RSVD_MONS);
 
 	prop->first_available_user_interrupt = USHRT_MAX;
+	prop->tpc_interrupt_id = USHRT_MAX;
 
 	for (i = 0 ; i < HL_MAX_DCORES ; i++)
 		prop->first_available_cq[i] = USHRT_MAX;
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a3e01e287f9d..2f51a121909b 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2348,6 +2348,7 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 					(num_sync_stream_queues * HL_RSVD_MONS);
 
 	prop->first_available_user_interrupt = GAUDI2_IRQ_NUM_USER_FIRST;
+	prop->tpc_interrupt_id = GAUDI2_IRQ_NUM_TPC_ASSERT;
 
 	prop->first_available_cq[0] = GAUDI2_RESERVED_CQ_NUMBER;
 
@@ -3235,6 +3236,9 @@ static void gaudi2_user_interrupt_setup(struct hl_device *hdev)
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	int i, j, k;
 
+	/* Initialize TPC interrupt */
+	HL_USR_INTR_STRUCT_INIT(hdev->tpc_interrupt, hdev, 0, HL_USR_INTERRUPT_TPC);
+
 	/* Initialize common user CQ interrupt */
 	HL_USR_INTR_STRUCT_INIT(hdev->common_user_cq_interrupt, hdev,
 				HL_COMMON_USER_CQ_INTERRUPT_ID, HL_USR_INTERRUPT_CQ);
@@ -3892,6 +3896,8 @@ static const char *gaudi2_irq_name(u16 irq_number)
 		return "gaudi2 completion";
 	case GAUDI2_IRQ_NUM_DCORE0_DEC0_NRM ... GAUDI2_IRQ_NUM_SHARED_DEC1_ABNRM:
 		return gaudi2_vdec_irq_name[irq_number - GAUDI2_IRQ_NUM_DCORE0_DEC0_NRM];
+	case GAUDI2_IRQ_NUM_TPC_ASSERT:
+		return "gaudi2 tpc assert";
 	case GAUDI2_IRQ_NUM_USER_FIRST ... GAUDI2_IRQ_NUM_USER_LAST:
 		return "gaudi2 user completion";
 	default:
@@ -4004,6 +4010,15 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 		goto free_event_irq;
 	}
 
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT);
+	rc = request_threaded_irq(irq, hl_irq_handler_user_interrupt,
+			hl_irq_user_interrupt_thread_handler, IRQF_ONESHOT,
+			gaudi2_irq_name(GAUDI2_IRQ_NUM_TPC_ASSERT), &hdev->tpc_interrupt);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to request IRQ %d", irq);
+		goto free_dec_irq;
+	}
+
 	for (i = GAUDI2_IRQ_NUM_USER_FIRST, j = prop->user_dec_intr_count, user_irq_init_cnt = 0;
 			user_irq_init_cnt < prop->user_interrupt_count;
 			i++, j++, user_irq_init_cnt++) {
@@ -4031,9 +4046,8 @@ static int gaudi2_enable_msix(struct hl_device *hdev)
 		irq = pci_irq_vector(hdev->pdev, i);
 		free_irq(irq, &hdev->user_interrupt[j]);
 	}
-
-	gaudi2_dec_disable_msix(hdev, GAUDI2_IRQ_NUM_SHARED_DEC1_ABNRM + 1);
-
+free_dec_irq:
+	gaudi2_dec_disable_msix(hdev, GAUDI2_IRQ_NUM_DEC_LAST + 1);
 free_event_irq:
 	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_EVENT_QUEUE);
 	free_irq(irq, cq);
@@ -4065,6 +4079,8 @@ static void gaudi2_sync_irqs(struct hl_device *hdev)
 		synchronize_irq(irq);
 	}
 
+	synchronize_irq(pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT));
+
 	for (i = GAUDI2_IRQ_NUM_USER_FIRST, j = 0 ; j < hdev->asic_prop.user_interrupt_count;
 										i++, j++) {
 		irq = pci_irq_vector(hdev->pdev, i);
@@ -4091,6 +4107,9 @@ static void gaudi2_disable_msix(struct hl_device *hdev)
 
 	gaudi2_dec_disable_msix(hdev, GAUDI2_IRQ_NUM_SHARED_DEC1_ABNRM + 1);
 
+	irq = pci_irq_vector(hdev->pdev, GAUDI2_IRQ_NUM_TPC_ASSERT);
+	free_irq(irq, &hdev->tpc_interrupt);
+
 	for (i = GAUDI2_IRQ_NUM_USER_FIRST, j = prop->user_dec_intr_count, k = 0;
 			k < hdev->asic_prop.user_interrupt_count ; i++, j++, k++) {
 
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index 2687404d9d21..f79958b24811 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -410,9 +410,11 @@ enum gaudi2_irq_num {
 	GAUDI2_IRQ_NUM_SHARED_DEC0_ABNRM,
 	GAUDI2_IRQ_NUM_SHARED_DEC1_NRM,
 	GAUDI2_IRQ_NUM_SHARED_DEC1_ABNRM,
+	GAUDI2_IRQ_NUM_DEC_LAST = GAUDI2_IRQ_NUM_SHARED_DEC1_ABNRM,
 	GAUDI2_IRQ_NUM_COMPLETION,
 	GAUDI2_IRQ_NUM_NIC_PORT_FIRST,
 	GAUDI2_IRQ_NUM_NIC_PORT_LAST = (GAUDI2_IRQ_NUM_NIC_PORT_FIRST + NIC_NUMBER_OF_PORTS - 1),
+	GAUDI2_IRQ_NUM_TPC_ASSERT,
 	GAUDI2_IRQ_NUM_RESERVED_FIRST,
 	GAUDI2_IRQ_NUM_RESERVED_LAST = (GAUDI2_MSIX_ENTRIES - GAUDI2_NUM_USER_INTERRUPTS - 1),
 	GAUDI2_IRQ_NUM_USER_FIRST,
diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
index 2b135e856607..c5a22a8e0957 100644
--- a/drivers/accel/habanalabs/goya/goya.c
+++ b/drivers/accel/habanalabs/goya/goya.c
@@ -472,6 +472,7 @@ int goya_set_fixed_properties(struct hl_device *hdev)
 	prop->max_pending_cs = GOYA_MAX_PENDING_CS;
 
 	prop->first_available_user_interrupt = USHRT_MAX;
+	prop->tpc_interrupt_id = USHRT_MAX;
 
 	for (i = 0 ; i < HL_MAX_DCORES ; i++)
 		prop->first_available_cq[i] = USHRT_MAX;
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index c1fdbb85d1d5..359b19ef3c3f 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -885,6 +885,7 @@ enum hl_server_type {
  *                             application to use. Relevant for Gaudi2 and later.
  * @device_mem_alloc_default_page_size: default page size used in device memory allocation.
  * @revision_id: PCI revision ID of the ASIC.
+ * @tpc_interrupt_id: interrupt id for TPC to use in order to raise events towards the host.
  * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
  *                                  in order to raise events toward FW.
  */
@@ -922,7 +923,7 @@ struct hl_info_hw_ip_info {
 	__u32 reserved7;
 	__u8 reserved8;
 	__u8 revision_id;
-	__u8 pad[2];
+	__u16 tpc_interrupt_id;
 	__u32 reserved9;
 	__u8 pad3[4];
 	__u64 engine_core_interrupt_reg_addr;
-- 
2.25.1

