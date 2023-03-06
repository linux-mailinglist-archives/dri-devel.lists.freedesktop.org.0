Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F11636AC0A2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254710E0C1;
	Mon,  6 Mar 2023 13:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC6110E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 13:19:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8B6EB80E01;
 Mon,  6 Mar 2023 13:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F001C433EF;
 Mon,  6 Mar 2023 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678108759;
 bh=Bytkkv2XsELdlxhRMl0yyxUOY2dGNlfAuSZCwtgFelU=;
 h=From:To:Cc:Subject:Date:From;
 b=nYGMNWvbnvctdrkZ2e8JckjdBjGyNnh6Ds7X/3g35YgKDnp+HR+dFsomOGRjsbRvF
 n0saySUJMTjWtrFem79OQqX/F3SewqZrs0MStRdQBI8QeVBzCuExGBblQJhNekUQRB
 M0CFNl2g754eAjJ/yp34LQrWFd4m80MMqZXGDquLsHenybF8QTNgwUikLxpQsEKk3r
 2omLY3X/mrihyTjklvLBXOOq8Q8hSFCGp6Zf0fKJoasMwFRKUnxhKUvYwd1SvQP9nH
 ErRNU8S7wlsqdzyn5u11t63BKAMJUhV13yq6RWkP6xgkzR+NtFIk4fwRw5QBADyT1e
 9yxZgzHALWCbA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] habanalabs/gaudi2: add uapi to stall/resume engine
Date: Mon,  6 Mar 2023 15:19:11 +0200
Message-Id: <20230306131913.346343-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

The user might want to stall/resume engines to perform power testing
for various scenarios. Because our current
HL_CS_FLAGS_ENGINE_CORE_COMMAND command only handles the engines' cores,
we need to add another opcode for handling entire engine and not just
its core.

The user supplies an array, where each entry holds the engine's ID and
the command to send to the engine. The size of the array is limited
by the number of engines in the ASIC (only Gaudi2 is currently
supported).

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 .../habanalabs/common/command_submission.c    |  55 +++-
 drivers/accel/habanalabs/common/habanalabs.h  |  12 +-
 drivers/accel/habanalabs/gaudi/gaudi.c        |   1 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 255 +++++++++++++++++-
 .../accel/habanalabs/gaudi2/gaudi2_masks.h    |   2 +
 .../include/gaudi2/asic_reg/gaudi2_regs.h     |   5 +
 include/uapi/drm/habanalabs_accel.h           |  36 ++-
 7 files changed, 356 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 2cebc1c47248..af9d2e22c6e7 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -14,7 +14,7 @@
 #define HL_CS_FLAGS_TYPE_MASK	(HL_CS_FLAGS_SIGNAL | HL_CS_FLAGS_WAIT | \
 			HL_CS_FLAGS_COLLECTIVE_WAIT | HL_CS_FLAGS_RESERVE_SIGNALS_ONLY | \
 			HL_CS_FLAGS_UNRESERVE_SIGNALS_ONLY | HL_CS_FLAGS_ENGINE_CORE_COMMAND | \
-			HL_CS_FLAGS_FLUSH_PCI_HBW_WRITES)
+			HL_CS_FLAGS_ENGINES_COMMAND | HL_CS_FLAGS_FLUSH_PCI_HBW_WRITES)
 
 
 #define MAX_TS_ITER_NUM 100
@@ -1319,6 +1319,8 @@ static enum hl_cs_type hl_cs_get_cs_type(u32 cs_type_flags)
 		return CS_UNRESERVE_SIGNALS;
 	else if (cs_type_flags & HL_CS_FLAGS_ENGINE_CORE_COMMAND)
 		return CS_TYPE_ENGINE_CORE;
+	else if (cs_type_flags & HL_CS_FLAGS_ENGINES_COMMAND)
+		return CS_TYPE_ENGINES;
 	else if (cs_type_flags & HL_CS_FLAGS_FLUSH_PCI_HBW_WRITES)
 		return CS_TYPE_FLUSH_PCI_HBW_WRITES;
 	else
@@ -2444,10 +2446,13 @@ static int cs_ioctl_signal_wait(struct hl_fpriv *hpriv, enum hl_cs_type cs_type,
 static int cs_ioctl_engine_cores(struct hl_fpriv *hpriv, u64 engine_cores,
 						u32 num_engine_cores, u32 core_command)
 {
-	int rc;
 	struct hl_device *hdev = hpriv->hdev;
 	void __user *engine_cores_arr;
 	u32 *cores;
+	int rc;
+
+	if (!hdev->asic_prop.supports_engine_modes)
+		return -EPERM;
 
 	if (!num_engine_cores || num_engine_cores > hdev->asic_prop.num_engine_cores) {
 		dev_err(hdev->dev, "Number of engine cores %d is invalid\n", num_engine_cores);
@@ -2476,6 +2481,48 @@ static int cs_ioctl_engine_cores(struct hl_fpriv *hpriv, u64 engine_cores,
 	return rc;
 }
 
+static int cs_ioctl_engines(struct hl_fpriv *hpriv, u64 engines_arr_user_addr,
+						u32 num_engines, enum hl_engine_command command)
+{
+	struct hl_device *hdev = hpriv->hdev;
+	u32 *engines, max_num_of_engines;
+	void __user *engines_arr;
+	int rc;
+
+	if (!hdev->asic_prop.supports_engine_modes)
+		return -EPERM;
+
+	if (command >= HL_ENGINE_COMMAND_MAX) {
+		dev_err(hdev->dev, "Engine command is invalid\n");
+		return -EINVAL;
+	}
+
+	max_num_of_engines = hdev->asic_prop.max_num_of_engines;
+	if (command == HL_ENGINE_CORE_RUN || command == HL_ENGINE_CORE_HALT)
+		max_num_of_engines = hdev->asic_prop.num_engine_cores;
+
+	if (!num_engines || num_engines > max_num_of_engines) {
+		dev_err(hdev->dev, "Number of engines %d is invalid\n", num_engines);
+		return -EINVAL;
+	}
+
+	engines_arr = (void __user *) (uintptr_t) engines_arr_user_addr;
+	engines = kmalloc_array(num_engines, sizeof(u32), GFP_KERNEL);
+	if (!engines)
+		return -ENOMEM;
+
+	if (copy_from_user(engines, engines_arr, num_engines * sizeof(u32))) {
+		dev_err(hdev->dev, "Failed to copy engine-ids array from user\n");
+		kfree(engines);
+		return -EFAULT;
+	}
+
+	rc = hdev->asic_funcs->set_engines(hdev, engines, num_engines, command);
+	kfree(engines);
+
+	return rc;
+}
+
 static int cs_ioctl_flush_pci_hbw_writes(struct hl_fpriv *hpriv)
 {
 	struct hl_device *hdev = hpriv->hdev;
@@ -2547,6 +2594,10 @@ int hl_cs_ioctl(struct hl_fpriv *hpriv, void *data)
 		rc = cs_ioctl_engine_cores(hpriv, args->in.engine_cores,
 				args->in.num_engine_cores, args->in.core_command);
 		break;
+	case CS_TYPE_ENGINES:
+		rc = cs_ioctl_engines(hpriv, args->in.engines,
+				args->in.num_engines, args->in.engine_command);
+		break;
 	case CS_TYPE_FLUSH_PCI_HBW_WRITES:
 		rc = cs_ioctl_flush_pci_hbw_writes(hpriv);
 		break;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index e03f9c125e30..af5a51f8c173 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -372,6 +372,7 @@ enum hl_cs_type {
 	CS_RESERVE_SIGNALS,
 	CS_UNRESERVE_SIGNALS,
 	CS_TYPE_ENGINE_CORE,
+	CS_TYPE_ENGINES,
 	CS_TYPE_FLUSH_PCI_HBW_WRITES,
 };
 
@@ -644,7 +645,8 @@ struct hl_hints_range {
  *                                      which the property supports_user_set_page_size is true
  *                                      (i.e. the DRAM supports multiple page sizes), otherwise
  *                                      it will shall  be equal to dram_page_size.
- * @num_engine_cores: number of engine cpu cores
+ * @num_engine_cores: number of engine cpu cores.
+ * @max_num_of_engines: maximum number of all engines in the ASIC.
  * @num_of_special_blocks: special_blocks array size.
  * @glbl_err_cause_num: global err cause number.
  * @hbw_flush_reg: register to read to generate HBW flush. value of 0 means HBW flush is
@@ -695,6 +697,7 @@ struct hl_hints_range {
  * @supports_user_set_page_size: true if user can set the allocation page size.
  * @dma_mask: the dma mask to be set for this device
  * @supports_advanced_cpucp_rc: true if new cpucp opcodes are supported.
+ * @supports_engine_modes: true if changing engines/engine_cores modes is supported.
  */
 struct asic_fixed_properties {
 	struct hw_queue_properties	*hw_queues_props;
@@ -773,6 +776,7 @@ struct asic_fixed_properties {
 	u32				xbar_edge_enabled_mask;
 	u32				device_mem_alloc_default_page_size;
 	u32				num_engine_cores;
+	u32				max_num_of_engines;
 	u32				num_of_special_blocks;
 	u32				glbl_err_cause_num;
 	u32				hbw_flush_reg;
@@ -810,6 +814,7 @@ struct asic_fixed_properties {
 	u8				supports_user_set_page_size;
 	u8				dma_mask;
 	u8				supports_advanced_cpucp_rc;
+	u8				supports_engine_modes;
 };
 
 /**
@@ -1564,6 +1569,7 @@ struct engines_data {
  * @access_dev_mem: access device memory
  * @set_dram_bar_base: set the base of the DRAM BAR
  * @set_engine_cores: set a config command to engine cores
+ * @set_engines: set a config command to user engines
  * @send_device_activity: indication to FW about device availability
  * @set_dram_properties: set DRAM related properties.
  * @set_binning_masks: set binning/enable masks for all relevant components.
@@ -1703,6 +1709,8 @@ struct hl_asic_funcs {
 	u64 (*set_dram_bar_base)(struct hl_device *hdev, u64 addr);
 	int (*set_engine_cores)(struct hl_device *hdev, u32 *core_ids,
 					u32 num_cores, u32 core_command);
+	int (*set_engines)(struct hl_device *hdev, u32 *engine_ids,
+					u32 num_engines, u32 engine_command);
 	int (*send_device_activity)(struct hl_device *hdev, bool open);
 	int (*set_dram_properties)(struct hl_device *hdev);
 	int (*set_binning_masks)(struct hl_device *hdev);
@@ -1826,7 +1834,7 @@ struct hl_cs_outcome_store {
  * @hpriv: pointer to the private (Kernel Driver) data of the process (fd).
  * @hdev: pointer to the device structure.
  * @refcount: reference counter for the context. Context is released only when
- *		this hits 0l. It is incremented on CS and CS_WAIT.
+ *		this hits 0. It is incremented on CS and CS_WAIT.
  * @cs_pending: array of hl fence objects representing pending CS.
  * @outcome_store: storage data structure used to remember outcomes of completed
  *                 command submissions for a long time after CS id wraparound.
diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
index d37c5d4893b9..004846bc086e 100644
--- a/drivers/accel/habanalabs/gaudi/gaudi.c
+++ b/drivers/accel/habanalabs/gaudi/gaudi.c
@@ -656,6 +656,7 @@ static int gaudi_set_fixed_properties(struct hl_device *hdev)
 	prop->cfg_size = CFG_SIZE;
 	prop->max_asid = MAX_ASID;
 	prop->num_of_events = GAUDI_EVENT_SIZE;
+	prop->max_num_of_engines = GAUDI_ENGINE_ID_SIZE;
 	prop->tpc_enabled_mask = TPC_ENABLED_MASK;
 
 	set_default_power_values(hdev);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 1131aae68690..166469179628 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -1714,6 +1714,34 @@ static const u32 gaudi2_tpc_cfg_blocks_bases[TPC_ID_SIZE] = {
 	[TPC_ID_DCORE0_TPC6] = mmDCORE0_TPC6_CFG_BASE,
 };
 
+static const u32 gaudi2_tpc_eml_cfg_blocks_bases[TPC_ID_SIZE] = {
+	[TPC_ID_DCORE0_TPC0] = mmDCORE0_TPC0_EML_CFG_BASE,
+	[TPC_ID_DCORE0_TPC1] = mmDCORE0_TPC1_EML_CFG_BASE,
+	[TPC_ID_DCORE0_TPC2] = mmDCORE0_TPC2_EML_CFG_BASE,
+	[TPC_ID_DCORE0_TPC3] = mmDCORE0_TPC3_EML_CFG_BASE,
+	[TPC_ID_DCORE0_TPC4] = mmDCORE0_TPC4_EML_CFG_BASE,
+	[TPC_ID_DCORE0_TPC5] = mmDCORE0_TPC5_EML_CFG_BASE,
+	[TPC_ID_DCORE1_TPC0] = mmDCORE1_TPC0_EML_CFG_BASE,
+	[TPC_ID_DCORE1_TPC1] = mmDCORE1_TPC1_EML_CFG_BASE,
+	[TPC_ID_DCORE1_TPC2] = mmDCORE1_TPC2_EML_CFG_BASE,
+	[TPC_ID_DCORE1_TPC3] = mmDCORE1_TPC3_EML_CFG_BASE,
+	[TPC_ID_DCORE1_TPC4] = mmDCORE1_TPC4_EML_CFG_BASE,
+	[TPC_ID_DCORE1_TPC5] = mmDCORE1_TPC5_EML_CFG_BASE,
+	[TPC_ID_DCORE2_TPC0] = mmDCORE2_TPC0_EML_CFG_BASE,
+	[TPC_ID_DCORE2_TPC1] = mmDCORE2_TPC1_EML_CFG_BASE,
+	[TPC_ID_DCORE2_TPC2] = mmDCORE2_TPC2_EML_CFG_BASE,
+	[TPC_ID_DCORE2_TPC3] = mmDCORE2_TPC3_EML_CFG_BASE,
+	[TPC_ID_DCORE2_TPC4] = mmDCORE2_TPC4_EML_CFG_BASE,
+	[TPC_ID_DCORE2_TPC5] = mmDCORE2_TPC5_EML_CFG_BASE,
+	[TPC_ID_DCORE3_TPC0] = mmDCORE3_TPC0_EML_CFG_BASE,
+	[TPC_ID_DCORE3_TPC1] = mmDCORE3_TPC1_EML_CFG_BASE,
+	[TPC_ID_DCORE3_TPC2] = mmDCORE3_TPC2_EML_CFG_BASE,
+	[TPC_ID_DCORE3_TPC3] = mmDCORE3_TPC3_EML_CFG_BASE,
+	[TPC_ID_DCORE3_TPC4] = mmDCORE3_TPC4_EML_CFG_BASE,
+	[TPC_ID_DCORE3_TPC5] = mmDCORE3_TPC5_EML_CFG_BASE,
+	[TPC_ID_DCORE0_TPC6] = mmDCORE0_TPC6_EML_CFG_BASE,
+};
+
 const u32 gaudi2_rot_blocks_bases[ROTATOR_ID_SIZE] = {
 	[ROTATOR_ID_0] = mmROT0_BASE,
 	[ROTATOR_ID_1] = mmROT1_BASE
@@ -1752,6 +1780,56 @@ static const u32 gaudi2_rot_id_to_queue_id[ROTATOR_ID_SIZE] = {
 	[ROTATOR_ID_1] = GAUDI2_QUEUE_ID_ROT_1_0,
 };
 
+static const u32 gaudi2_tpc_engine_id_to_tpc_id[] = {
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_0] = TPC_ID_DCORE0_TPC0,
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_1] = TPC_ID_DCORE0_TPC1,
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_2] = TPC_ID_DCORE0_TPC2,
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_3] = TPC_ID_DCORE0_TPC3,
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_4] = TPC_ID_DCORE0_TPC4,
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_5] = TPC_ID_DCORE0_TPC5,
+	[GAUDI2_DCORE1_ENGINE_ID_TPC_0] = TPC_ID_DCORE1_TPC0,
+	[GAUDI2_DCORE1_ENGINE_ID_TPC_1] = TPC_ID_DCORE1_TPC1,
+	[GAUDI2_DCORE1_ENGINE_ID_TPC_2] = TPC_ID_DCORE1_TPC2,
+	[GAUDI2_DCORE1_ENGINE_ID_TPC_3] = TPC_ID_DCORE1_TPC3,
+	[GAUDI2_DCORE1_ENGINE_ID_TPC_4] = TPC_ID_DCORE1_TPC4,
+	[GAUDI2_DCORE1_ENGINE_ID_TPC_5] = TPC_ID_DCORE1_TPC5,
+	[GAUDI2_DCORE2_ENGINE_ID_TPC_0] = TPC_ID_DCORE2_TPC0,
+	[GAUDI2_DCORE2_ENGINE_ID_TPC_1] = TPC_ID_DCORE2_TPC1,
+	[GAUDI2_DCORE2_ENGINE_ID_TPC_2] = TPC_ID_DCORE2_TPC2,
+	[GAUDI2_DCORE2_ENGINE_ID_TPC_3] = TPC_ID_DCORE2_TPC3,
+	[GAUDI2_DCORE2_ENGINE_ID_TPC_4] = TPC_ID_DCORE2_TPC4,
+	[GAUDI2_DCORE2_ENGINE_ID_TPC_5] = TPC_ID_DCORE2_TPC5,
+	[GAUDI2_DCORE3_ENGINE_ID_TPC_0] = TPC_ID_DCORE3_TPC0,
+	[GAUDI2_DCORE3_ENGINE_ID_TPC_1] = TPC_ID_DCORE3_TPC1,
+	[GAUDI2_DCORE3_ENGINE_ID_TPC_2] = TPC_ID_DCORE3_TPC2,
+	[GAUDI2_DCORE3_ENGINE_ID_TPC_3] = TPC_ID_DCORE3_TPC3,
+	[GAUDI2_DCORE3_ENGINE_ID_TPC_4] = TPC_ID_DCORE3_TPC4,
+	[GAUDI2_DCORE3_ENGINE_ID_TPC_5] = TPC_ID_DCORE3_TPC5,
+	/* the PCI TPC is placed last (mapped liked HW) */
+	[GAUDI2_DCORE0_ENGINE_ID_TPC_6] = TPC_ID_DCORE0_TPC6,
+};
+
+static const u32 gaudi2_mme_engine_id_to_mme_id[] = {
+	[GAUDI2_DCORE0_ENGINE_ID_MME] = MME_ID_DCORE0,
+	[GAUDI2_DCORE1_ENGINE_ID_MME] = MME_ID_DCORE1,
+	[GAUDI2_DCORE2_ENGINE_ID_MME] = MME_ID_DCORE2,
+	[GAUDI2_DCORE3_ENGINE_ID_MME] = MME_ID_DCORE3,
+};
+
+static const u32 gaudi2_edma_engine_id_to_edma_id[] = {
+	[GAUDI2_ENGINE_ID_PDMA_0] = DMA_CORE_ID_PDMA0,
+	[GAUDI2_ENGINE_ID_PDMA_1] = DMA_CORE_ID_PDMA1,
+	[GAUDI2_DCORE0_ENGINE_ID_EDMA_0] = DMA_CORE_ID_EDMA0,
+	[GAUDI2_DCORE0_ENGINE_ID_EDMA_1] = DMA_CORE_ID_EDMA1,
+	[GAUDI2_DCORE1_ENGINE_ID_EDMA_0] = DMA_CORE_ID_EDMA2,
+	[GAUDI2_DCORE1_ENGINE_ID_EDMA_1] = DMA_CORE_ID_EDMA3,
+	[GAUDI2_DCORE2_ENGINE_ID_EDMA_0] = DMA_CORE_ID_EDMA4,
+	[GAUDI2_DCORE2_ENGINE_ID_EDMA_1] = DMA_CORE_ID_EDMA5,
+	[GAUDI2_DCORE3_ENGINE_ID_EDMA_0] = DMA_CORE_ID_EDMA6,
+	[GAUDI2_DCORE3_ENGINE_ID_EDMA_1] = DMA_CORE_ID_EDMA7,
+	[GAUDI2_ENGINE_ID_KDMA] = DMA_CORE_ID_KDMA,
+};
+
 const u32 edma_stream_base[NUM_OF_EDMA_PER_DCORE * NUM_OF_DCORES] = {
 	GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
 	GAUDI2_QUEUE_ID_DCORE0_EDMA_1_0,
@@ -2026,6 +2104,12 @@ static void gaudi2_set_arc_id_cap(struct hl_device *hdev, u64 arc_id);
 static void gaudi2_memset_device_lbw(struct hl_device *hdev, u32 addr, u32 size, u32 val);
 static int gaudi2_send_job_to_kdma(struct hl_device *hdev, u64 src_addr, u64 dst_addr, u32 size,
 										bool is_memset);
+static bool gaudi2_get_tpc_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e);
+static bool gaudi2_get_mme_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e);
+static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
+		struct engines_data *e);
 static u64 gaudi2_mmu_scramble_addr(struct hl_device *hdev, u64 raw_addr);
 
 static void gaudi2_init_scrambler_hbm(struct hl_device *hdev)
@@ -2326,11 +2410,14 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 		prop->pmmu_huge.end_addr = VA_HOST_SPACE_HPAGE_END;
 	}
 
+	prop->max_num_of_engines = GAUDI2_ENGINE_ID_SIZE;
 	prop->num_engine_cores = CPU_ID_MAX;
 	prop->cfg_size = CFG_SIZE;
 	prop->max_asid = MAX_ASID;
 	prop->num_of_events = GAUDI2_EVENT_SIZE;
 
+	prop->supports_engine_modes = true;
+
 	prop->dc_power_default = DC_POWER_DEFAULT;
 
 	prop->cb_pool_cb_cnt = GAUDI2_CB_POOL_CB_CNT;
@@ -4322,7 +4409,6 @@ static int gaudi2_set_engine_cores(struct hl_device *hdev, u32 *core_ids,
 {
 	int i, rc;
 
-
 	for (i = 0 ; i < num_cores ; i++) {
 		if (gaudi2_is_arc_enabled(hdev, core_ids[i]))
 			gaudi2_set_arc_running_mode(hdev, core_ids[i], core_command);
@@ -4344,6 +4430,172 @@ static int gaudi2_set_engine_cores(struct hl_device *hdev, u32 *core_ids,
 	return 0;
 }
 
+static int gaudi2_set_tpc_engine_mode(struct hl_device *hdev, u32 engine_id, u32 engine_command)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	u32 reg_base, reg_addr, reg_val, tpc_id;
+
+	if (!(gaudi2->tpc_hw_cap_initialized & HW_CAP_TPC_MASK))
+		return 0;
+
+	tpc_id = gaudi2_tpc_engine_id_to_tpc_id[engine_id];
+	if (!(gaudi2->tpc_hw_cap_initialized & BIT_ULL(HW_CAP_TPC_SHIFT + tpc_id)))
+		return 0;
+
+	reg_base = gaudi2_tpc_cfg_blocks_bases[tpc_id];
+	reg_addr = reg_base + TPC_CFG_STALL_OFFSET;
+	reg_val = FIELD_PREP(DCORE0_TPC0_CFG_TPC_STALL_V_MASK,
+			!!(engine_command == HL_ENGINE_STALL));
+	WREG32(reg_addr, reg_val);
+
+	if (engine_command == HL_ENGINE_RESUME) {
+		reg_base = gaudi2_tpc_eml_cfg_blocks_bases[tpc_id];
+		reg_addr = reg_base + TPC_EML_CFG_DBG_CNT_OFFSET;
+		RMWREG32(reg_addr, 0x1, DCORE0_TPC0_EML_CFG_DBG_CNT_DBG_EXIT_MASK);
+	}
+
+	return 0;
+}
+
+static int gaudi2_set_mme_engine_mode(struct hl_device *hdev, u32 engine_id, u32 engine_command)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	u32 reg_base, reg_addr, reg_val, mme_id;
+
+	mme_id = gaudi2_mme_engine_id_to_mme_id[engine_id];
+	if (!(gaudi2->hw_cap_initialized & BIT_ULL(HW_CAP_MME_SHIFT + mme_id)))
+		return 0;
+
+	reg_base = gaudi2_mme_ctrl_lo_blocks_bases[mme_id];
+	reg_addr = reg_base + MME_CTRL_LO_QM_STALL_OFFSET;
+	reg_val = FIELD_PREP(DCORE0_MME_CTRL_LO_QM_STALL_V_MASK,
+			!!(engine_command == HL_ENGINE_STALL));
+	WREG32(reg_addr, reg_val);
+
+	return 0;
+}
+
+static int gaudi2_set_edma_engine_mode(struct hl_device *hdev, u32 engine_id, u32 engine_command)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	u32 reg_base, reg_addr, reg_val, edma_id;
+
+	if (!(gaudi2->hw_cap_initialized & HW_CAP_EDMA_MASK))
+		return 0;
+
+	edma_id = gaudi2_edma_engine_id_to_edma_id[engine_id];
+	if (!(gaudi2->hw_cap_initialized & BIT_ULL(HW_CAP_EDMA_SHIFT + edma_id)))
+		return 0;
+
+	reg_base = gaudi2_dma_core_blocks_bases[edma_id];
+	reg_addr = reg_base + EDMA_CORE_CFG_STALL_OFFSET;
+	reg_val = FIELD_PREP(DCORE0_EDMA0_CORE_CFG_1_HALT_MASK,
+			!!(engine_command == HL_ENGINE_STALL));
+	WREG32(reg_addr, reg_val);
+
+	if (engine_command == HL_ENGINE_STALL) {
+		reg_val = FIELD_PREP(DCORE0_EDMA0_CORE_CFG_1_HALT_MASK, 0x1) |
+				FIELD_PREP(DCORE0_EDMA0_CORE_CFG_1_FLUSH_MASK, 0x1);
+		WREG32(reg_addr, reg_val);
+	}
+
+	return 0;
+}
+
+static int gaudi2_set_engine_modes(struct hl_device *hdev,
+		u32 *engine_ids, u32 num_engines, u32 engine_command)
+{
+	int i, rc;
+
+	for (i = 0 ; i < num_engines ; ++i) {
+		switch (engine_ids[i]) {
+		case GAUDI2_DCORE0_ENGINE_ID_TPC_0 ... GAUDI2_DCORE0_ENGINE_ID_TPC_5:
+		case GAUDI2_DCORE1_ENGINE_ID_TPC_0 ... GAUDI2_DCORE1_ENGINE_ID_TPC_5:
+		case GAUDI2_DCORE2_ENGINE_ID_TPC_0 ... GAUDI2_DCORE2_ENGINE_ID_TPC_5:
+		case GAUDI2_DCORE3_ENGINE_ID_TPC_0 ... GAUDI2_DCORE3_ENGINE_ID_TPC_5:
+			rc = gaudi2_set_tpc_engine_mode(hdev, engine_ids[i], engine_command);
+			if (rc)
+				return rc;
+
+			break;
+		case GAUDI2_DCORE0_ENGINE_ID_MME:
+		case GAUDI2_DCORE1_ENGINE_ID_MME:
+		case GAUDI2_DCORE2_ENGINE_ID_MME:
+		case GAUDI2_DCORE3_ENGINE_ID_MME:
+			rc = gaudi2_set_mme_engine_mode(hdev, engine_ids[i], engine_command);
+			if (rc)
+				return rc;
+
+			break;
+		case GAUDI2_DCORE0_ENGINE_ID_EDMA_0 ... GAUDI2_DCORE0_ENGINE_ID_EDMA_1:
+		case GAUDI2_DCORE1_ENGINE_ID_EDMA_0 ... GAUDI2_DCORE1_ENGINE_ID_EDMA_1:
+		case GAUDI2_DCORE2_ENGINE_ID_EDMA_0 ... GAUDI2_DCORE2_ENGINE_ID_EDMA_1:
+		case GAUDI2_DCORE3_ENGINE_ID_EDMA_0 ... GAUDI2_DCORE3_ENGINE_ID_EDMA_1:
+			rc = gaudi2_set_edma_engine_mode(hdev, engine_ids[i], engine_command);
+			if (rc)
+				return rc;
+
+			break;
+		default:
+			dev_err(hdev->dev, "Invalid engine ID %u\n", engine_ids[i]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int gaudi2_verify_engine_modes(struct hl_device *hdev, u32 *engine_ids,
+		u32 num_engines, u32 engine_command)
+{
+	bool is_engine_idle = true;
+	u64 mask_arr = 0;
+	int i;
+
+	gaudi2_get_tpc_idle_status(hdev, &mask_arr, 8 * sizeof(mask_arr), NULL);
+	gaudi2_get_mme_idle_status(hdev, &mask_arr, 8 * sizeof(mask_arr), NULL);
+	gaudi2_get_edma_idle_status(hdev, &mask_arr, 8 * sizeof(mask_arr), NULL);
+
+	for (i = 0 ; i < num_engines ; ++i) {
+		is_engine_idle = !(mask_arr & BIT_ULL(engine_ids[i]));
+		if ((engine_command == HL_ENGINE_RESUME) && !is_engine_idle) {
+			dev_err(hdev->dev, "Engine ID %u remained NOT idle!\n", engine_ids[i]);
+			return -EBUSY;
+		} else if ((engine_command == HL_ENGINE_STALL) && is_engine_idle) {
+			dev_err(hdev->dev, "Engine ID %u remained idle!\n", engine_ids[i]);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static int gaudi2_set_engines(struct hl_device *hdev, u32 *engine_ids,
+					u32 num_engines, u32 engine_command)
+{
+	int rc;
+
+	switch (engine_command) {
+	case HL_ENGINE_CORE_HALT:
+	case HL_ENGINE_CORE_RUN:
+		return gaudi2_set_engine_cores(hdev, engine_ids, num_engines, engine_command);
+
+	case HL_ENGINE_STALL:
+	case HL_ENGINE_RESUME:
+		rc = gaudi2_set_engine_modes(hdev, engine_ids, num_engines, engine_command);
+		if (rc)
+			return rc;
+
+		return gaudi2_verify_engine_modes(hdev, engine_ids, num_engines, engine_command);
+
+	default:
+		dev_err(hdev->dev, "failed to execute command id %u\n", engine_command);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void gaudi2_halt_engines(struct hl_device *hdev, bool hard_reset, bool fw_reset)
 {
 	u32 wait_timeout_ms;
@@ -10883,6 +11135,7 @@ static const struct hl_asic_funcs gaudi2_funcs = {
 	.access_dev_mem = hl_access_dev_mem,
 	.set_dram_bar_base = gaudi2_set_hbm_bar_base,
 	.set_engine_cores = gaudi2_set_engine_cores,
+	.set_engines = gaudi2_set_engines,
 	.send_device_activity = gaudi2_send_device_activity,
 	.set_dram_properties = gaudi2_set_dram_properties,
 	.set_binning_masks = gaudi2_set_binning_masks,
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h b/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
index 74bc1daaeeda..e6664c4a2cf5 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_masks.h
@@ -86,6 +86,8 @@
 
 #define DCORE0_TPC0_QM_CGM_STS_AGENT_IDLE_MASK 0x100
 
+#define DCORE0_TPC0_EML_CFG_DBG_CNT_DBG_EXIT_MASK 0x40
+
 /* CGM_IDLE_MASK is valid for all engines CGM idle check */
 #define CGM_IDLE_MASK	DCORE0_TPC0_QM_CGM_STS_AGENT_IDLE_MASK
 
diff --git a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
index 0bf3092bfeea..452b379f39f6 100644
--- a/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
+++ b/drivers/accel/habanalabs/include/gaudi2/asic_reg/gaudi2_regs.h
@@ -164,6 +164,8 @@
 
 #define mmGIC_DISTRIBUTOR__5_GICD_SETSPI_NSR	0x4800040
 
+#define mmDCORE0_TPC0_EML_CFG_DBG_CNT		0x40000
+
 #define SM_OBJS_PROT_BITS_OFFS			0x14000
 
 #define DCORE_OFFSET			(mmDCORE1_TPC0_QM_BASE - mmDCORE0_TPC0_QM_BASE)
@@ -185,7 +187,10 @@
 #define TPC_CFG_STALL_ON_ERR_OFFSET	(mmDCORE0_TPC0_CFG_STALL_ON_ERR - mmDCORE0_TPC0_CFG_BASE)
 #define TPC_CFG_TPC_INTR_MASK_OFFSET	(mmDCORE0_TPC0_CFG_TPC_INTR_MASK - mmDCORE0_TPC0_CFG_BASE)
 #define TPC_CFG_MSS_CONFIG_OFFSET	(mmDCORE0_TPC0_CFG_MSS_CONFIG - mmDCORE0_TPC0_CFG_BASE)
+#define TPC_EML_CFG_DBG_CNT_OFFSET	(mmDCORE0_TPC0_EML_CFG_DBG_CNT - mmDCORE0_TPC0_EML_CFG_BASE)
 
+#define EDMA_CORE_CFG_STALL_OFFSET	(mmDCORE0_EDMA0_CORE_CFG_1 - mmDCORE0_EDMA0_CORE_BASE)
+#define MME_CTRL_LO_QM_STALL_OFFSET	(mmDCORE0_MME_CTRL_LO_QM_STALL - mmDCORE0_MME_CTRL_LO_BASE)
 #define MME_ACC_INTR_MASK_OFFSET	(mmDCORE0_MME_ACC_INTR_MASK - mmDCORE0_MME_ACC_BASE)
 #define MME_ACC_WR_AXI_AGG_COUT0_OFFSET	(mmDCORE0_MME_ACC_WR_AXI_AGG_COUT0 - mmDCORE0_MME_ACC_BASE)
 #define MME_ACC_WR_AXI_AGG_COUT1_OFFSET	(mmDCORE0_MME_ACC_WR_AXI_AGG_COUT1 - mmDCORE0_MME_ACC_BASE)
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index 359b19ef3c3f..7ca0ef802fd1 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -1535,17 +1535,31 @@ struct hl_cs_chunk {
  */
 #define HL_CS_FLAGS_FLUSH_PCI_HBW_WRITES	0x8000
 
+/*
+ * The engines CS is merged into the existing CS ioctls.
+ * Use it to control engines modes.
+ */
+#define HL_CS_FLAGS_ENGINES_COMMAND		0x10000
+
 #define HL_CS_STATUS_SUCCESS		0
 
 #define HL_MAX_JOBS_PER_CS		512
 
-/* HL_ENGINE_CORE_ values
+/*
+ * enum hl_engine_command - engine command
  *
- * HL_ENGINE_CORE_HALT: engine core halt
- * HL_ENGINE_CORE_RUN:  engine core run
+ * @HL_ENGINE_CORE_HALT: engine core halt
+ * @HL_ENGINE_CORE_RUN: engine core run
+ * @HL_ENGINE_STALL: user engine/s stall
+ * @HL_ENGINE_RESUME: user engine/s resume
  */
-#define HL_ENGINE_CORE_HALT	(1 << 0)
-#define HL_ENGINE_CORE_RUN	(1 << 1)
+enum hl_engine_command {
+	HL_ENGINE_CORE_HALT = 1,
+	HL_ENGINE_CORE_RUN = 2,
+	HL_ENGINE_STALL = 3,
+	HL_ENGINE_RESUME = 4,
+	HL_ENGINE_COMMAND_MAX
+};
 
 struct hl_cs_in {
 
@@ -1569,6 +1583,18 @@ struct hl_cs_in {
 			/* the core command to be sent towards engine cores */
 			__u32 core_command;
 		};
+
+		/* Valid only when HL_CS_FLAGS_ENGINES_COMMAND is set */
+		struct {
+			/* this holds address of array of uint32 for engines */
+			__u64 engines;
+
+			/* number of engines in engines array */
+			__u32 num_engines;
+
+			/* the engine command to be sent towards engines */
+			__u32 engine_command;
+		};
 	};
 
 	union {
-- 
2.39.2

