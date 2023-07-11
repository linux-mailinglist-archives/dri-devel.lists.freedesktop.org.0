Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6F74EC6C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC0010E372;
	Tue, 11 Jul 2023 11:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC91A10E375
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CE846147F;
 Tue, 11 Jul 2023 11:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4856BC433C7;
 Tue, 11 Jul 2023 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073960;
 bh=k272oihJyhtSq0n26bDpI0T6S4Z9QshNoBiJkl4neSY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sIxNAulY94NC715NjWV/leW0d1qWBYaHpztjuwml8VO07D/eC7G6xCuEB5dJjURPv
 qfdlnf3KJEcf+XpR5L7lNO8bnflfK4QY1STMqI5pttXwwf+Xl+4+YLIaNK+1rqS7/j
 jXesX+hhUbiSq+awnB2oWqW/JEE7bddY+FaoPp8NsbKj4IaqHbuWYaMTFfotL0nSVL
 zn+q4mQGM4eN52j0FfI+OVl22c4m/eMIWO0PFAKuffqDUv0o7rPZcxIVX9GfcyS7P7
 ZyESrXithdgU8RlBRofRvco235BrwxTqCixtXT+c4hXIwBvdbxuo+nbEOd+tFiK22G
 7k7XhVRxhtXNw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/12] accel/habanalabs: add info ioctl for engine error
 reports
Date: Tue, 11 Jul 2023 14:12:21 +0300
Message-Id: <20230711111226.163670-7-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711111226.163670-1-ogabbay@kernel.org>
References: <20230711111226.163670-1-ogabbay@kernel.org>
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

User gets notification for every engine error report, but he still
lacks the exact engine information. Hence, we allow user to query
for the exact engine reported an error.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c      |  14 ++
 drivers/accel/habanalabs/common/habanalabs.h  |  17 ++
 .../habanalabs/common/habanalabs_ioctl.c      |  25 +++
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 168 ++++++++++++++++++
 include/uapi/drm/habanalabs_accel.h           |  16 ++
 5 files changed, 240 insertions(+)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 28be0fc325ea..80cce6b74d05 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2701,6 +2701,20 @@ void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info)
 		*info->event_mask |= HL_NOTIFIER_EVENT_CRITICL_FW_ERR;
 }
 
+void hl_capture_engine_err(struct hl_device *hdev, u16 engine_id, u16 error_count)
+{
+	struct engine_err_info *info = &hdev->captured_err_info.engine_err;
+
+	/* Capture only the first engine error */
+	if (atomic_cmpxchg(&info->event_detected, 0, 1))
+		return;
+
+	info->event.timestamp = ktime_to_ns(ktime_get());
+	info->event.engine_id = engine_id;
+	info->event.error_count = error_count;
+	info->event_info_available = true;
+}
+
 void hl_enable_err_info_capture(struct hl_error_info *captured_err_info)
 {
 	vfree(captured_err_info->page_fault_info.user_mappings);
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 4fecd300b8dd..201d826b0fb7 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3062,6 +3062,20 @@ struct fw_err_info {
 	bool				event_info_available;
 };
 
+/**
+ * struct engine_err_info - engine error information.
+ * @event: holds information on the event.
+ * @event_detected: if set as 1, then an engine event was discovered for the
+ *                  first time after the driver has finished booting-up.
+ * @event_info_available: indicates that an engine event info is now available.
+ */
+struct engine_err_info {
+	struct hl_info_engine_err_event	event;
+	atomic_t			event_detected;
+	bool				event_info_available;
+};
+
+
 /**
  * struct hl_error_info - holds information collected during an error.
  * @cs_timeout: CS timeout error information.
@@ -3070,6 +3084,7 @@ struct fw_err_info {
  * @page_fault_info: page fault information.
  * @hw_err: (fatal) hardware error information.
  * @fw_err: firmware error information.
+ * @engine_err: engine error information.
  */
 struct hl_error_info {
 	struct cs_timeout_info		cs_timeout;
@@ -3078,6 +3093,7 @@ struct hl_error_info {
 	struct page_fault_info		page_fault_info;
 	struct hw_err_info		hw_err;
 	struct fw_err_info		fw_err;
+	struct engine_err_info		engine_err;
 };
 
 /**
@@ -3951,6 +3967,7 @@ void hl_handle_page_fault(struct hl_device *hdev, u64 addr, u16 eng_id, bool is_
 				u64 *event_mask);
 void hl_handle_critical_hw_err(struct hl_device *hdev, u16 event_id, u64 *event_mask);
 void hl_handle_fw_err(struct hl_device *hdev, struct hl_info_fw_err_info *info);
+void hl_capture_engine_err(struct hl_device *hdev, u16 engine_id, u16 error_count);
 void hl_enable_err_info_capture(struct hl_error_info *captured_err_info);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 549b2518fae0..097d65e493c8 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -875,6 +875,28 @@ static int fw_err_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
 	return rc ? -EFAULT : 0;
 }
 
+static int engine_err_info(struct hl_fpriv *hpriv, struct hl_info_args *args)
+{
+	void __user *user_buf = (void __user *) (uintptr_t) args->return_pointer;
+	struct hl_device *hdev = hpriv->hdev;
+	u32 user_buf_size = args->return_size;
+	struct engine_err_info *info;
+	int rc;
+
+	if (!user_buf)
+		return -EINVAL;
+
+	info = &hdev->captured_err_info.engine_err;
+	if (!info->event_info_available)
+		return 0;
+
+	if (user_buf_size < sizeof(struct hl_info_engine_err_event))
+		return -ENOMEM;
+
+	rc = copy_to_user(user_buf, &info->event, sizeof(struct hl_info_engine_err_event));
+	return rc ? -EFAULT : 0;
+}
+
 static int send_fw_generic_request(struct hl_device *hdev, struct hl_info_args *info_args)
 {
 	void __user *buff = (void __user *) (uintptr_t) info_args->return_pointer;
@@ -1001,6 +1023,9 @@ static int _hl_info_ioctl(struct hl_fpriv *hpriv, void *data,
 	case HL_INFO_FW_ERR_EVENT:
 		return fw_err_info(hpriv, args);
 
+	case HL_INFO_USER_ENGINE_ERR_EVENT:
+		return engine_err_info(hpriv, args);
+
 	case HL_INFO_DRAM_USAGE:
 		return dram_usage_info(hpriv, args);
 	default:
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 70b8f744cd73..222310bf1098 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -9588,6 +9588,171 @@ static int hl_arc_event_handle(struct hl_device *hdev, u16 event_type,
 	}
 }
 
+static u16 event_id_to_engine_id(struct hl_device *hdev, u16 event_type)
+{
+	enum gaudi2_block_types type = GAUDI2_BLOCK_TYPE_MAX;
+	u16 index;
+
+	switch (event_type) {
+	case GAUDI2_EVENT_TPC0_AXI_ERR_RSP ... GAUDI2_EVENT_TPC24_AXI_ERR_RSP:
+		index = event_type - GAUDI2_EVENT_TPC0_AXI_ERR_RSP;
+		type = GAUDI2_BLOCK_TYPE_TPC;
+		break;
+	case GAUDI2_EVENT_TPC0_QM ... GAUDI2_EVENT_TPC24_QM:
+		index = event_type - GAUDI2_EVENT_TPC0_QM;
+		type = GAUDI2_BLOCK_TYPE_TPC;
+		break;
+	case GAUDI2_EVENT_MME0_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME0_CTRL_AXI_ERROR_RESPONSE:
+	case GAUDI2_EVENT_MME0_SPI_BASE ... GAUDI2_EVENT_MME0_WAP_SOURCE_RESULT_INVALID:
+	case GAUDI2_EVENT_MME0_QM:
+		index = 0;
+		type = GAUDI2_BLOCK_TYPE_MME;
+		break;
+	case GAUDI2_EVENT_MME1_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME1_CTRL_AXI_ERROR_RESPONSE:
+	case GAUDI2_EVENT_MME1_SPI_BASE ... GAUDI2_EVENT_MME1_WAP_SOURCE_RESULT_INVALID:
+	case GAUDI2_EVENT_MME1_QM:
+		index = 1;
+		type = GAUDI2_BLOCK_TYPE_MME;
+		break;
+	case GAUDI2_EVENT_MME2_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME2_CTRL_AXI_ERROR_RESPONSE:
+	case GAUDI2_EVENT_MME2_SPI_BASE ... GAUDI2_EVENT_MME2_WAP_SOURCE_RESULT_INVALID:
+	case GAUDI2_EVENT_MME2_QM:
+		index = 2;
+		type = GAUDI2_BLOCK_TYPE_MME;
+		break;
+	case GAUDI2_EVENT_MME3_SBTE0_AXI_ERR_RSP ... GAUDI2_EVENT_MME3_CTRL_AXI_ERROR_RESPONSE:
+	case GAUDI2_EVENT_MME3_SPI_BASE ... GAUDI2_EVENT_MME3_WAP_SOURCE_RESULT_INVALID:
+	case GAUDI2_EVENT_MME3_QM:
+		index = 3;
+		type = GAUDI2_BLOCK_TYPE_MME;
+		break;
+	case GAUDI2_EVENT_KDMA_CH0_AXI_ERR_RSP:
+	case GAUDI2_EVENT_KDMA_BM_SPMU:
+	case GAUDI2_EVENT_KDMA0_CORE:
+		return GAUDI2_ENGINE_ID_KDMA;
+	case GAUDI2_EVENT_PDMA_CH0_AXI_ERR_RSP:
+	case GAUDI2_EVENT_PDMA0_CORE:
+	case GAUDI2_EVENT_PDMA0_BM_SPMU:
+	case GAUDI2_EVENT_PDMA0_QM:
+		return GAUDI2_ENGINE_ID_PDMA_0;
+	case GAUDI2_EVENT_PDMA_CH1_AXI_ERR_RSP:
+	case GAUDI2_EVENT_PDMA1_CORE:
+	case GAUDI2_EVENT_PDMA1_BM_SPMU:
+	case GAUDI2_EVENT_PDMA1_QM:
+		return GAUDI2_ENGINE_ID_PDMA_1;
+	case GAUDI2_EVENT_DEC0_AXI_ERR_RSPONSE ... GAUDI2_EVENT_DEC9_AXI_ERR_RSPONSE:
+		index = event_type - GAUDI2_EVENT_DEC0_AXI_ERR_RSPONSE;
+		type = GAUDI2_BLOCK_TYPE_DEC;
+		break;
+	case GAUDI2_EVENT_DEC0_SPI ... GAUDI2_EVENT_DEC9_BMON_SPMU:
+		index = (event_type - GAUDI2_EVENT_DEC0_SPI) >> 1;
+		type = GAUDI2_BLOCK_TYPE_DEC;
+		break;
+	case GAUDI2_EVENT_NIC0_AXI_ERROR_RESPONSE ... GAUDI2_EVENT_NIC11_AXI_ERROR_RESPONSE:
+		index = event_type - GAUDI2_EVENT_NIC0_AXI_ERROR_RESPONSE;
+		return GAUDI2_ENGINE_ID_NIC0_0 + (index * 2);
+	case GAUDI2_EVENT_NIC0_QM0 ... GAUDI2_EVENT_NIC11_QM1:
+		index = event_type - GAUDI2_EVENT_NIC0_QM0;
+		return GAUDI2_ENGINE_ID_NIC0_0 + index;
+	case GAUDI2_EVENT_NIC0_BMON_SPMU ... GAUDI2_EVENT_NIC11_SW_ERROR:
+		index = event_type - GAUDI2_EVENT_NIC0_BMON_SPMU;
+		return GAUDI2_ENGINE_ID_NIC0_0 + (index * 2);
+	case GAUDI2_EVENT_TPC0_BMON_SPMU ... GAUDI2_EVENT_TPC24_KERNEL_ERR:
+		index = (event_type - GAUDI2_EVENT_TPC0_BMON_SPMU) >> 1;
+		type = GAUDI2_BLOCK_TYPE_TPC;
+		break;
+	case GAUDI2_EVENT_ROTATOR0_AXI_ERROR_RESPONSE:
+	case GAUDI2_EVENT_ROTATOR0_BMON_SPMU:
+	case GAUDI2_EVENT_ROTATOR0_ROT0_QM:
+		return GAUDI2_ENGINE_ID_ROT_0;
+	case GAUDI2_EVENT_ROTATOR1_AXI_ERROR_RESPONSE:
+	case GAUDI2_EVENT_ROTATOR1_BMON_SPMU:
+	case GAUDI2_EVENT_ROTATOR1_ROT1_QM:
+		return GAUDI2_ENGINE_ID_ROT_1;
+	case GAUDI2_EVENT_HDMA0_BM_SPMU:
+	case GAUDI2_EVENT_HDMA0_QM:
+	case GAUDI2_EVENT_HDMA0_CORE:
+		return GAUDI2_DCORE0_ENGINE_ID_EDMA_0;
+	case GAUDI2_EVENT_HDMA1_BM_SPMU:
+	case GAUDI2_EVENT_HDMA1_QM:
+	case GAUDI2_EVENT_HDMA1_CORE:
+		return GAUDI2_DCORE0_ENGINE_ID_EDMA_1;
+	case GAUDI2_EVENT_HDMA2_BM_SPMU:
+	case GAUDI2_EVENT_HDMA2_QM:
+	case GAUDI2_EVENT_HDMA2_CORE:
+		return GAUDI2_DCORE1_ENGINE_ID_EDMA_0;
+	case GAUDI2_EVENT_HDMA3_BM_SPMU:
+	case GAUDI2_EVENT_HDMA3_QM:
+	case GAUDI2_EVENT_HDMA3_CORE:
+		return GAUDI2_DCORE1_ENGINE_ID_EDMA_1;
+	case GAUDI2_EVENT_HDMA4_BM_SPMU:
+	case GAUDI2_EVENT_HDMA4_QM:
+	case GAUDI2_EVENT_HDMA4_CORE:
+		return GAUDI2_DCORE2_ENGINE_ID_EDMA_0;
+	case GAUDI2_EVENT_HDMA5_BM_SPMU:
+	case GAUDI2_EVENT_HDMA5_QM:
+	case GAUDI2_EVENT_HDMA5_CORE:
+		return GAUDI2_DCORE2_ENGINE_ID_EDMA_1;
+	case GAUDI2_EVENT_HDMA6_BM_SPMU:
+	case GAUDI2_EVENT_HDMA6_QM:
+	case GAUDI2_EVENT_HDMA6_CORE:
+		return GAUDI2_DCORE3_ENGINE_ID_EDMA_0;
+	case GAUDI2_EVENT_HDMA7_BM_SPMU:
+	case GAUDI2_EVENT_HDMA7_QM:
+	case GAUDI2_EVENT_HDMA7_CORE:
+		return GAUDI2_DCORE3_ENGINE_ID_EDMA_1;
+	default:
+		break;
+	}
+
+	switch (type) {
+	case GAUDI2_BLOCK_TYPE_TPC:
+		switch (index) {
+		case TPC_ID_DCORE0_TPC0 ... TPC_ID_DCORE0_TPC5:
+			return GAUDI2_DCORE0_ENGINE_ID_TPC_0 + index;
+		case TPC_ID_DCORE1_TPC0 ... TPC_ID_DCORE1_TPC5:
+			return GAUDI2_DCORE1_ENGINE_ID_TPC_0 + index - TPC_ID_DCORE1_TPC0;
+		case TPC_ID_DCORE2_TPC0 ... TPC_ID_DCORE2_TPC5:
+			return GAUDI2_DCORE2_ENGINE_ID_TPC_0 + index - TPC_ID_DCORE2_TPC0;
+		case TPC_ID_DCORE3_TPC0 ... TPC_ID_DCORE3_TPC5:
+			return GAUDI2_DCORE3_ENGINE_ID_TPC_0 + index - TPC_ID_DCORE3_TPC0;
+		default:
+			break;
+		}
+		break;
+	case GAUDI2_BLOCK_TYPE_MME:
+		switch (index) {
+		case MME_ID_DCORE0: return GAUDI2_DCORE0_ENGINE_ID_MME;
+		case MME_ID_DCORE1: return GAUDI2_DCORE1_ENGINE_ID_MME;
+		case MME_ID_DCORE2: return GAUDI2_DCORE2_ENGINE_ID_MME;
+		case MME_ID_DCORE3: return GAUDI2_DCORE3_ENGINE_ID_MME;
+		default:
+			break;
+		}
+		break;
+	case GAUDI2_BLOCK_TYPE_DEC:
+		switch (index) {
+		case DEC_ID_DCORE0_DEC0: return GAUDI2_DCORE0_ENGINE_ID_DEC_0;
+		case DEC_ID_DCORE0_DEC1: return GAUDI2_DCORE0_ENGINE_ID_DEC_1;
+		case DEC_ID_DCORE1_DEC0: return GAUDI2_DCORE1_ENGINE_ID_DEC_0;
+		case DEC_ID_DCORE1_DEC1: return GAUDI2_DCORE1_ENGINE_ID_DEC_1;
+		case DEC_ID_DCORE2_DEC0: return GAUDI2_DCORE2_ENGINE_ID_DEC_0;
+		case DEC_ID_DCORE2_DEC1: return GAUDI2_DCORE2_ENGINE_ID_DEC_1;
+		case DEC_ID_DCORE3_DEC0: return GAUDI2_DCORE3_ENGINE_ID_DEC_0;
+		case DEC_ID_DCORE3_DEC1: return GAUDI2_DCORE3_ENGINE_ID_DEC_1;
+		case DEC_ID_PCIE_VDEC0: return GAUDI2_PCIE_ENGINE_ID_DEC_0;
+		case DEC_ID_PCIE_VDEC1: return GAUDI2_PCIE_ENGINE_ID_DEC_1;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return U16_MAX;
+}
+
 static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_entry)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
@@ -10010,6 +10175,9 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		}
 	}
 
+	if (event_mask & HL_NOTIFIER_EVENT_USER_ENGINE_ERR)
+		hl_capture_engine_err(hdev, event_id_to_engine_id(hdev, event_type), error_count);
+
 	/* Make sure to dump an error in case no error cause was printed so far.
 	 * Note that although we have counted the errors, we use this number as
 	 * a boolean.
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index e6436f3e8ea6..f912869b151e 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -809,6 +809,7 @@ enum hl_server_type {
  * HL_INFO_FW_ERR_EVENT   - Retrieve information on the reported FW error.
  *                          May return 0 even though no new data is available, in that case
  *                          timestamp will be 0.
+ * HL_INFO_USER_ENGINE_ERR_EVENT - Retrieve the last engine id that reported an error.
  */
 #define HL_INFO_HW_IP_INFO			0
 #define HL_INFO_HW_EVENTS			1
@@ -845,6 +846,7 @@ enum hl_server_type {
 #define HL_INFO_FW_GENERIC_REQ			35
 #define HL_INFO_HW_ERR_EVENT			36
 #define HL_INFO_FW_ERR_EVENT			37
+#define HL_INFO_USER_ENGINE_ERR_EVENT		38
 
 #define HL_INFO_VERSION_MAX_LEN			128
 #define HL_INFO_CARD_NAME_MAX_LEN		16
@@ -1226,6 +1228,20 @@ struct hl_info_fw_err_event {
 	__u32 pad;
 };
 
+/**
+ * struct hl_info_engine_err_event - engine error info
+ * @timestamp: time-stamp of error occurrence
+ * @engine_id: engine id who reported the error.
+ * @error_count: Amount of errors reported.
+ * @pad: size padding for u64 granularity.
+ */
+struct hl_info_engine_err_event {
+	__s64 timestamp;
+	__u16 engine_id;
+	__u16 error_count;
+	__u32 pad;
+};
+
 /**
  * struct hl_info_dev_memalloc_page_sizes - valid page sizes in device mem alloc information.
  * @page_order_bitmask: bitmap in which a set bit represents the order of the supported page size
-- 
2.34.1

