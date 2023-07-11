Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5474EC66
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A1210E371;
	Tue, 11 Jul 2023 11:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739DB10E372
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:12:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFE7561449;
 Tue, 11 Jul 2023 11:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D2AC433C8;
 Tue, 11 Jul 2023 11:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689073957;
 bh=mAjnjw19LM3IptYw67mr37QegsWcSEZk93NyZA1lLu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b1rlIvtHWPGzOTDJrHKXRhOpBWOmEMjcFAQYE9AtG2pJ9+FnR8yb26tg8Vis2nonQ
 GMZCXpkCMgJQvn0lSG4DL/wVaeG7YmVO1tT0N2xZ1jkvXCJ6YJjrfxt0qHBK57Sh4S
 CF2vE+1QSAlxpT5OKf5QQj/cMlIBvMicJYBTJdaQ+Pu1rEMSDKxPRpZVUuXUeFhn69
 /gKHRSDUUyxZxWMNBw0ruquFinmBRM6O55QLDHQSfQ0lMyPdkohApOJlREi9DDx+7r
 HuWhIKVEMqmAMQyNNziUL3pMJDv8yRtPk68es5EwiXtHOFInv0HvcopArLTw6xE0v0
 acviJTnGrdpQg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] accel/habanalabs: handle f/w reserved dram space request
Date: Tue, 11 Jul 2023 14:12:19 +0300
Message-Id: <20230711111226.163670-5-ogabbay@kernel.org>
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
Cc: Dani Liberman <dliberman@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

It is possible for FW to request reserved space in dram.
If the device supports this option, it will retrieve the size from the
f/w and will reserve it.

Currently we add the common code infrastructure to support it.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c        | 5 +++++
 drivers/accel/habanalabs/common/habanalabs.h         | 4 ++++
 drivers/accel/habanalabs/include/common/hl_boot_if.h | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index c7da69dbfa0a..2bc775d29854 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -2783,6 +2783,11 @@ static int hl_fw_dynamic_init_cpu(struct hl_device *hdev,
 				hdev->decoder_binning, hdev->rotator_binning);
 		}
 
+		if (hdev->asic_prop.support_dynamic_resereved_fw_size) {
+			hdev->asic_prop.reserved_fw_mem_size =
+				le32_to_cpu(fw_loader->dynamic_loader.comm_desc.rsvd_mem_size_mb);
+		}
+
 		return 0;
 	}
 
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 16bea0a3f3a4..4fecd300b8dd 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -641,6 +641,7 @@ struct hl_hints_range {
  * @glbl_err_cause_num: global err cause number.
  * @hbw_flush_reg: register to read to generate HBW flush. value of 0 means HBW flush is
  *                 not supported.
+ * @reserved_fw_mem_size: size in MB of dram memory reserved for FW.
  * @collective_first_sob: first sync object available for collective use
  * @collective_first_mon: first monitor available for collective use
  * @sync_stream_first_sob: first sync object available for sync stream use
@@ -689,6 +690,7 @@ struct hl_hints_range {
  * @dma_mask: the dma mask to be set for this device
  * @supports_advanced_cpucp_rc: true if new cpucp opcodes are supported.
  * @supports_engine_modes: true if changing engines/engine_cores modes is supported.
+ * @support_dynamic_resereved_fw_size: true if we support dynamic reserved size for fw.
  */
 struct asic_fixed_properties {
 	struct hw_queue_properties	*hw_queues_props;
@@ -772,6 +774,7 @@ struct asic_fixed_properties {
 	u32				num_of_special_blocks;
 	u32				glbl_err_cause_num;
 	u32				hbw_flush_reg;
+	u32				reserved_fw_mem_size;
 	u16				collective_first_sob;
 	u16				collective_first_mon;
 	u16				sync_stream_first_sob;
@@ -808,6 +811,7 @@ struct asic_fixed_properties {
 	u8				dma_mask;
 	u8				supports_advanced_cpucp_rc;
 	u8				supports_engine_modes;
+	u8				support_dynamic_resereved_fw_size;
 };
 
 /**
diff --git a/drivers/accel/habanalabs/include/common/hl_boot_if.h b/drivers/accel/habanalabs/include/common/hl_boot_if.h
index cff79f7f9f75..7de8a5786a36 100644
--- a/drivers/accel/habanalabs/include/common/hl_boot_if.h
+++ b/drivers/accel/habanalabs/include/common/hl_boot_if.h
@@ -570,6 +570,8 @@ struct lkd_fw_comms_desc {
 	__le64 img_addr;	/* address for next FW component load */
 	struct lkd_fw_binning_info binning_info;
 	struct lkd_fw_ascii_msg ascii_msg[LKD_FW_ASCII_MSG_MAX];
+	__le32 rsvd_mem_size_mb; /* reserved memory size [MB] for FW/SVE */
+	char reserved1[4];
 };
 
 enum comms_reset_cause {
@@ -596,6 +598,9 @@ struct lkd_fw_comms_msg {
 			__le64 img_addr;
 			struct lkd_fw_binning_info binning_info;
 			struct lkd_fw_ascii_msg ascii_msg[LKD_FW_ASCII_MSG_MAX];
+			/* reserved memory size [MB] for FW/SVE */
+			__le32 rsvd_mem_size_mb;
+			char reserved1[4];
 		};
 		struct {
 			__u8 reset_cause;
-- 
2.34.1

