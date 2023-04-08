Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CAC6DB955
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 09:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F8410E121;
	Sat,  8 Apr 2023 07:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DEA10E11B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 07:45:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A46961555;
 Sat,  8 Apr 2023 07:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE6AC433EF;
 Sat,  8 Apr 2023 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680939921;
 bh=8ciPHBDxKOnRpQHC9loAXAdpLIe4pYv36fDt4P4FM5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iU5PWJai42ivYG+JW3+7cXLO9G+YRNykNVi+tsGvndgRoIZmJ7XlC0BGlSTkBoHTH
 qwTbFF3JTfk6xY29R7UBUKEdd8Z3nAvIIQesiyNZC8ROuvzJ2EpQfYkhxvduPEJqOG
 OkH1jy82ffvXKXWLNUTKn3nGoRtTwzVNrKDy0/mL8VLmiDPRhd+BgRt1YIEiI2H3ve
 XEuFyW1XbfTHsJwJPoKlFcE/gzR+cTUx5Jo1tfDXTDwsXxtpLBZv4xSWXf/r8ll/oo
 esJASf8mDDP/nDkAyr3zXMmnAqddiVuQGrFdTTR2eofT/gD+3eRD9s0fpPnnQBe+Yq
 ZXrczAV/q+p3Q==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] accel/habanalabs: speedup h/w queues test in Gaudi2
Date: Sat,  8 Apr 2023 10:45:11 +0300
Message-Id: <20230408074512.2277163-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408074512.2277163-1-ogabbay@kernel.org>
References: <20230408074512.2277163-1-ogabbay@kernel.org>
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Moti Haimovski <mhaimovski@habana.ai>

HW queues testing at driver load and after reset takes a substantial
amount of time.
This commit reduces the queues test time in Gaudi2 devices by running
all the tests in parallel instead of one after the other.
Time measurements on tests duration shows that the new method is almost
x100 faster than the serial approach.

Signed-off-by: Moti Haimovski <mhaimovski@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c  | 152 ++++++++++++++++------
 drivers/accel/habanalabs/gaudi2/gaudi2P.h |  17 +++
 2 files changed, 128 insertions(+), 41 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b318c67dae13..b778cf764a68 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -3480,6 +3480,48 @@ static int gaudi2_special_blocks_iterator_config(struct hl_device *hdev)
 	return gaudi2_special_blocks_config(hdev);
 }
 
+static void gaudi2_test_queues_msgs_free(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_queues_test_info *msg_info = gaudi2->queues_test_info;
+	int i;
+
+	for (i = 0 ; i < GAUDI2_NUM_TESTED_QS ; i++) {
+		/* bail-out if this is an allocation failure point */
+		if (!msg_info[i].kern_addr)
+			break;
+
+		hl_asic_dma_pool_free(hdev, msg_info[i].kern_addr, msg_info[i].dma_addr);
+		msg_info[i].kern_addr = NULL;
+	}
+}
+
+static int gaudi2_test_queues_msgs_alloc(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_queues_test_info *msg_info = gaudi2->queues_test_info;
+	int i, rc;
+
+	/* allocate a message-short buf for each Q we intend to test */
+	for (i = 0 ; i < GAUDI2_NUM_TESTED_QS ; i++) {
+		msg_info[i].kern_addr =
+			(void *)hl_asic_dma_pool_zalloc(hdev, sizeof(struct packet_msg_short),
+							GFP_KERNEL, &msg_info[i].dma_addr);
+		if (!msg_info[i].kern_addr) {
+			dev_err(hdev->dev,
+				"Failed to allocate dma memory for H/W queue %d testing\n", i);
+			rc = -ENOMEM;
+			goto err_exit;
+		}
+	}
+
+	return 0;
+
+err_exit:
+	gaudi2_test_queues_msgs_free(hdev);
+	return rc;
+}
+
 static int gaudi2_sw_init(struct hl_device *hdev)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
@@ -3579,8 +3621,14 @@ static int gaudi2_sw_init(struct hl_device *hdev)
 	if (rc)
 		goto free_scratchpad_mem;
 
+	rc = gaudi2_test_queues_msgs_alloc(hdev);
+	if (rc)
+		goto special_blocks_free;
+
 	return 0;
 
+special_blocks_free:
+	gaudi2_special_blocks_iterator_free(hdev);
 free_scratchpad_mem:
 	hl_asic_dma_pool_free(hdev, gaudi2->scratchpad_kernel_address,
 				gaudi2->scratchpad_bus_address);
@@ -3603,6 +3651,8 @@ static int gaudi2_sw_fini(struct hl_device *hdev)
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 
+	gaudi2_test_queues_msgs_free(hdev);
+
 	gaudi2_special_blocks_iterator_free(hdev);
 
 	hl_cpu_accessible_dma_pool_free(hdev, prop->pmmu.page_size, gaudi2->virt_msix_db_cpu_addr);
@@ -6797,28 +6847,29 @@ static void gaudi2_qman_set_test_mode(struct hl_device *hdev, u32 hw_queue_id, b
 	}
 }
 
-static int gaudi2_test_queue(struct hl_device *hdev, u32 hw_queue_id)
+static inline u32 gaudi2_test_queue_hw_queue_id_to_sob_id(struct hl_device *hdev, u32 hw_queue_id)
 {
-	u32 sob_offset = hdev->asic_prop.first_available_user_sob[0] * 4;
+	return hdev->asic_prop.first_available_user_sob[0] +
+				hw_queue_id - GAUDI2_QUEUE_ID_PDMA_0_0;
+}
+
+static void gaudi2_test_queue_clear(struct hl_device *hdev, u32 hw_queue_id)
+{
+	u32 sob_offset = gaudi2_test_queue_hw_queue_id_to_sob_id(hdev, hw_queue_id) * 4;
 	u32 sob_addr = mmDCORE0_SYNC_MNGR_OBJS_SOB_OBJ_0 + sob_offset;
-	u32 timeout_usec, tmp, sob_base = 1, sob_val = 0x5a5a;
-	struct packet_msg_short *msg_short_pkt;
-	dma_addr_t pkt_dma_addr;
-	size_t pkt_size;
-	int rc;
 
-	if (hdev->pldm)
-		timeout_usec = GAUDI2_PLDM_TEST_QUEUE_WAIT_USEC;
-	else
-		timeout_usec = GAUDI2_TEST_QUEUE_WAIT_USEC;
+	/* Reset the SOB value */
+	WREG32(sob_addr, 0);
+}
 
-	pkt_size = sizeof(*msg_short_pkt);
-	msg_short_pkt = hl_asic_dma_pool_zalloc(hdev, pkt_size, GFP_KERNEL, &pkt_dma_addr);
-	if (!msg_short_pkt) {
-		dev_err(hdev->dev, "Failed to allocate packet for H/W queue %d testing\n",
-			hw_queue_id);
-		return -ENOMEM;
-	}
+static int gaudi2_test_queue_send_msg_short(struct hl_device *hdev, u32 hw_queue_id, u32 sob_val,
+					    struct gaudi2_queues_test_info *msg_info)
+{
+	u32 sob_offset =  gaudi2_test_queue_hw_queue_id_to_sob_id(hdev, hw_queue_id) * 4;
+	u32 tmp, sob_base = 1;
+	struct packet_msg_short *msg_short_pkt = msg_info->kern_addr;
+	size_t pkt_size = sizeof(struct packet_msg_short);
+	int rc;
 
 	tmp = (PACKET_MSG_SHORT << GAUDI2_PKT_CTL_OPCODE_SHIFT) |
 		(1 << GAUDI2_PKT_CTL_EB_SHIFT) |
@@ -6829,15 +6880,25 @@ static int gaudi2_test_queue(struct hl_device *hdev, u32 hw_queue_id)
 	msg_short_pkt->value = cpu_to_le32(sob_val);
 	msg_short_pkt->ctl = cpu_to_le32(tmp);
 
-	/* Reset the SOB value */
-	WREG32(sob_addr, 0);
+	rc = hl_hw_queue_send_cb_no_cmpl(hdev, hw_queue_id, pkt_size, msg_info->dma_addr);
+	if (rc)
+		dev_err(hdev->dev,
+			"Failed to send msg_short packet to H/W queue %d\n", hw_queue_id);
 
-	rc = hl_hw_queue_send_cb_no_cmpl(hdev, hw_queue_id, pkt_size, pkt_dma_addr);
-	if (rc) {
-		dev_err(hdev->dev, "Failed to send msg_short packet to H/W queue %d\n",
-			hw_queue_id);
-		goto free_pkt;
-	}
+	return rc;
+}
+
+static int gaudi2_test_queue_wait_completion(struct hl_device *hdev, u32 hw_queue_id, u32 sob_val)
+{
+	u32 sob_offset = gaudi2_test_queue_hw_queue_id_to_sob_id(hdev, hw_queue_id) * 4;
+	u32 sob_addr = mmDCORE0_SYNC_MNGR_OBJS_SOB_OBJ_0 + sob_offset;
+	u32 timeout_usec, tmp;
+	int rc;
+
+	if (hdev->pldm)
+		timeout_usec = GAUDI2_PLDM_TEST_QUEUE_WAIT_USEC;
+	else
+		timeout_usec = GAUDI2_TEST_QUEUE_WAIT_USEC;
 
 	rc = hl_poll_timeout(
 			hdev,
@@ -6853,11 +6914,6 @@ static int gaudi2_test_queue(struct hl_device *hdev, u32 hw_queue_id)
 		rc = -EIO;
 	}
 
-	/* Reset the SOB value */
-	WREG32(sob_addr, 0);
-
-free_pkt:
-	hl_asic_dma_pool_free(hdev, (void *) msg_short_pkt, pkt_dma_addr);
 	return rc;
 }
 
@@ -6877,30 +6933,44 @@ static int gaudi2_test_cpu_queue(struct hl_device *hdev)
 
 static int gaudi2_test_queues(struct hl_device *hdev)
 {
-	int i, rc, ret_val = 0;
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_queues_test_info *msg_info;
+	u32 sob_val = 0x5a5a;
+	int i, rc;
 
+	/* send test message on all enabled Qs */
 	for (i = GAUDI2_QUEUE_ID_PDMA_0_0 ; i < GAUDI2_QUEUE_ID_CPU_PQ; i++) {
 		if (!gaudi2_is_queue_enabled(hdev, i))
 			continue;
 
+		msg_info = &gaudi2->queues_test_info[i - GAUDI2_QUEUE_ID_PDMA_0_0];
 		gaudi2_qman_set_test_mode(hdev, i, true);
-		rc = gaudi2_test_queue(hdev, i);
-		gaudi2_qman_set_test_mode(hdev, i, false);
-
-		if (rc) {
-			ret_val = -EINVAL;
+		gaudi2_test_queue_clear(hdev, i);
+		rc = gaudi2_test_queue_send_msg_short(hdev, i, sob_val, msg_info);
+		if (rc)
 			goto done;
-		}
 	}
 
 	rc = gaudi2_test_cpu_queue(hdev);
-	if (rc) {
-		ret_val = -EINVAL;
+	if (rc)
 		goto done;
+
+	/* verify that all messages were processed */
+	for (i = GAUDI2_QUEUE_ID_PDMA_0_0 ; i < GAUDI2_QUEUE_ID_CPU_PQ; i++) {
+		if (!gaudi2_is_queue_enabled(hdev, i))
+			continue;
+
+		rc = gaudi2_test_queue_wait_completion(hdev, i, sob_val);
+		if (rc)
+			/* chip is not usable, no need for cleanups, just bail-out with error */
+			goto done;
+
+		gaudi2_test_queue_clear(hdev, i);
+		gaudi2_qman_set_test_mode(hdev, i, false);
 	}
 
 done:
-	return ret_val;
+	return rc;
 }
 
 static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index 0742046810f9..1cebe707772e 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -240,6 +240,8 @@
 #define GAUDI2_SOB_INCREMENT_BY_ONE	(FIELD_PREP(DCORE0_SYNC_MNGR_OBJS_SOB_OBJ_VAL_MASK, 1) | \
 					FIELD_PREP(DCORE0_SYNC_MNGR_OBJS_SOB_OBJ_INC_MASK, 1))
 
+#define GAUDI2_NUM_TESTED_QS (GAUDI2_QUEUE_ID_CPU_PQ - GAUDI2_QUEUE_ID_PDMA_0_0)
+
 #define GAUDI2_NUM_OF_GLBL_ERR_CAUSE		8
 
 enum gaudi2_reserved_sob_id {
@@ -452,6 +454,17 @@ struct dup_block_ctx {
 	unsigned int instances;
 };
 
+/**
+ * struct gaudi2_queues_test_info - Holds the address of a the messages used for testing the
+ *                                  device queues.
+ * @dma_addr: the address used by the HW for accessing the message.
+ * @kern_addr: The address used by the driver for accessing the message.
+ */
+struct gaudi2_queues_test_info {
+	dma_addr_t dma_addr;
+	void *kern_addr;
+};
+
 /**
  * struct gaudi2_device - ASIC specific manage structure.
  * @cpucp_info_get: get information on device from CPU-CP
@@ -510,6 +523,7 @@ struct dup_block_ctx {
  * @flush_db_fifo: flag to force flush DB FIFO after a write.
  * @hbm_cfg: HBM subsystem settings
  * @hw_queues_lock_mutex: used by simulator instead of hw_queues_lock.
+ * @queues_test_info: information used by the driver when testing the HW queues.
  */
 struct gaudi2_device {
 	int (*cpucp_info_get)(struct hl_device *hdev);
@@ -537,6 +551,9 @@ struct gaudi2_device {
 	u32				events_stat[GAUDI2_EVENT_SIZE];
 	u32				events_stat_aggregate[GAUDI2_EVENT_SIZE];
 	u32				num_of_valid_hw_events;
+
+	/* Queue testing */
+	struct gaudi2_queues_test_info	queues_test_info[GAUDI2_NUM_TESTED_QS];
 };
 
 /*
-- 
2.40.0

