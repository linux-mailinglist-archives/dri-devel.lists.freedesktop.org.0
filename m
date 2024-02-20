Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335985C07E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C9910E4CB;
	Tue, 20 Feb 2024 16:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XFsFSM+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896D510E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F590CE1A35;
 Tue, 20 Feb 2024 16:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778C0C433F1;
 Tue, 20 Feb 2024 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444894;
 bh=9eI7Z2gXF17tNcwqrpCqMe+krArtY6LVWgTijcsr1n0=;
 h=From:To:Cc:Subject:Date:From;
 b=XFsFSM+ojOugaot+qWGkYDgAaob5fArA0It0qNGUlHwbXHUdVYY24volivAFE6CDu
 P+rLqJbBWrEitHiiNLxUObDD1kY6KuDFTKgPKBr/MsvWP6uOmtDaxNpyZ8qun5zQa/
 8xsQ2y2GLHtzYlxZowW4+Flg3CoEjy3Qk4bljwVKbv9ZzBuAf/euK31JiJ73xl36mq
 bnBcIBugGpOMddZiVOe8I0qp4LSNR87MMcoDNrv9MdGwODVbeQvl96yCzLip25dXJ8
 BfXYf2Sk+JgXvZOoaKRW+j4CtzZeG3C833Y2s0NzWV8hOGa+AHN7EgODvZjlES/pcX
 pvn3FrKK4akPg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Ohad Sharabi <osharabi@habana.ai>
Subject: [PATCH 01/13] accel/habanalabs/gaudi2: use single function to compare
 FW versions
Date: Tue, 20 Feb 2024 18:01:17 +0200
Message-Id: <20240220160129.909714-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
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

Currently, the code contains 2 types of FW version comparison functions:
- hl_is_fw_sw_ver_[below/equal_or_greater]()
- gaudi2 specific function of the type
  gaudi2_is_fw_ver_[below/above]x_y_z()

Moreover, some functions use the inner FW version which should be only
stage during development but not version dependencies.

Finally, some tests are done to deprecated FW version to which LKD
should hold no compatibility.

This commit aligns all APIs to a single function that just compares the
version and return an integers indicator (similar in some way to
strcmp()).

In addition, this generic function now considers also the sub-minor FW
version and also remove dead code resulting in deprecated FW versions
compatibility.

Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 25 ++++++++
 drivers/accel/habanalabs/common/habanalabs.h  | 20 +------
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 57 +++----------------
 3 files changed, 34 insertions(+), 68 deletions(-)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 3558a6a8e192..e7dcf2fe6552 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -40,6 +40,31 @@ static char *comms_sts_str_arr[COMMS_STS_INVLD_LAST] = {
 	[COMMS_STS_TIMEOUT_ERR] = __stringify(COMMS_STS_TIMEOUT_ERR),
 };
 
+/**
+ * hl_fw_version_cmp() - compares the FW version to a specific version
+ *
+ * @hdev: pointer to hl_device structure
+ * @major: major number of a reference version
+ * @minor: minor number of a reference version
+ * @subminor: sub-minor number of a reference version
+ *
+ * Return 1 if FW version greater than the reference version, -1 if it's
+ *         smaller and 0 if versions are identical.
+ */
+int hl_fw_version_cmp(struct hl_device *hdev, u32 major, u32 minor, u32 subminor)
+{
+	if (hdev->fw_sw_major_ver != major)
+		return (hdev->fw_sw_major_ver > major) ? 1 : -1;
+
+	if (hdev->fw_sw_minor_ver != minor)
+		return (hdev->fw_sw_minor_ver > minor) ? 1 : -1;
+
+	if (hdev->fw_sw_sub_minor_ver != subminor)
+		return (hdev->fw_sw_sub_minor_ver > subminor) ? 1 : -1;
+
+	return 0;
+}
+
 static char *extract_fw_ver_from_str(const char *fw_str)
 {
 	char *str, *fw_ver, *whitespace;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 7397ce86b7f0..634a470efe27 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -3600,25 +3600,6 @@ struct hl_ioctl_desc {
 	hl_ioctl_t *func;
 };
 
-static inline bool hl_is_fw_sw_ver_below(struct hl_device *hdev, u32 fw_sw_major, u32 fw_sw_minor)
-{
-	if (hdev->fw_sw_major_ver < fw_sw_major)
-		return true;
-	if (hdev->fw_sw_major_ver > fw_sw_major)
-		return false;
-	if (hdev->fw_sw_minor_ver < fw_sw_minor)
-		return true;
-	return false;
-}
-
-static inline bool hl_is_fw_sw_ver_equal_or_greater(struct hl_device *hdev, u32 fw_sw_major,
-							u32 fw_sw_minor)
-{
-	return (hdev->fw_sw_major_ver > fw_sw_major ||
-			(hdev->fw_sw_major_ver == fw_sw_major &&
-					hdev->fw_sw_minor_ver >= fw_sw_minor));
-}
-
 /*
  * Kernel module functions that can be accessed by entire module
  */
@@ -3923,6 +3904,7 @@ void hl_mmu_dr_flush(struct hl_ctx *ctx);
 int hl_mmu_dr_init(struct hl_device *hdev);
 void hl_mmu_dr_fini(struct hl_device *hdev);
 
+int hl_fw_version_cmp(struct hl_device *hdev, u32 major, u32 minor, u32 subminor);
 int hl_fw_load_fw_to_device(struct hl_device *hdev, const char *fw_name,
 				void __iomem *dst, u32 src_offset, u32 size);
 int hl_fw_send_pci_access_msg(struct hl_device *hdev, u32 opcode, u64 value);
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 1f061209ae21..4a0917aa4dd7 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2601,6 +2601,8 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 
 	prop->hbw_flush_reg = mmPCIE_WRAP_SPECIAL_GLBL_SPARE_0;
 
+	prop->supports_advanced_cpucp_rc = true;
+
 	return 0;
 
 free_qprops:
@@ -3308,8 +3310,6 @@ static int gaudi2_late_init(struct hl_device *hdev)
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	int rc;
 
-	hdev->asic_prop.supports_advanced_cpucp_rc = true;
-
 	rc = hl_fw_send_pci_access_msg(hdev, CPUCP_PACKET_ENABLE_PCI_ACCESS,
 					gaudi2->virt_msix_db_dma_addr);
 	if (rc) {
@@ -3783,7 +3783,7 @@ static int gaudi2_sw_init(struct hl_device *hdev)
 	prop->supports_compute_reset = true;
 
 	/* Event queue sanity check added in FW version 1.11 */
-	if (hl_is_fw_sw_ver_below(hdev, 1, 11))
+	if (hl_fw_version_cmp(hdev, 1, 11, 0) < 0)
 		hdev->event_queue.check_eqe_index = false;
 	else
 		hdev->event_queue.check_eqe_index = true;
@@ -6314,26 +6314,6 @@ static void gaudi2_execute_hard_reset(struct hl_device *hdev)
 	WREG32(mmPSOC_RESET_CONF_SW_ALL_RST, 1);
 }
 
-static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_timeout_us)
-{
-	int i, rc = 0;
-	u32 reg_val;
-
-	for (i = 0 ; i < GAUDI2_RESET_POLL_CNT ; i++)
-		rc = hl_poll_timeout(
-			hdev,
-			mmCPU_RST_STATUS_TO_HOST,
-			reg_val,
-			reg_val == CPU_RST_STATUS_SOFT_RST_DONE,
-			1000,
-			poll_timeout_us);
-
-	if (rc)
-		dev_err(hdev->dev, "Timeout while waiting for FW to complete soft reset (0x%x)\n",
-				reg_val);
-	return rc;
-}
-
 /**
  * gaudi2_execute_soft_reset - execute soft reset by driver/FW
  *
@@ -6346,23 +6326,8 @@ static int gaudi2_get_soft_rst_done_indication(struct hl_device *hdev, u32 poll_
 static int gaudi2_execute_soft_reset(struct hl_device *hdev, bool driver_performs_reset,
 						u32 poll_timeout_us)
 {
-	int rc;
-
-	if (!driver_performs_reset) {
-		if (hl_is_fw_sw_ver_below(hdev, 1, 10)) {
-			/* set SP to indicate reset request sent to FW */
-			WREG32(mmCPU_RST_STATUS_TO_HOST, CPU_RST_STATUS_NA);
-
-			WREG32(mmGIC_HOST_SOFT_RST_IRQ_POLL_REG,
-				gaudi2_irq_map_table[GAUDI2_EVENT_CPU_SOFT_RESET].cpu_id);
-
-			/* wait for f/w response */
-			rc = gaudi2_get_soft_rst_done_indication(hdev, poll_timeout_us);
-		} else {
-			rc = hl_fw_send_soft_reset(hdev);
-		}
-		return rc;
-	}
+	if (!driver_performs_reset)
+		return hl_fw_send_soft_reset(hdev);
 
 	/* Block access to engines, QMANs and SM during reset, these
 	 * RRs will be reconfigured after soft reset.
@@ -7914,7 +7879,7 @@ static bool gaudi2_handle_ecc_event(struct hl_device *hdev, u16 event_type,
 	bool has_block_id = false;
 	u16 block_id;
 
-	if (!hl_is_fw_sw_ver_below(hdev, 1, 12))
+	if (hl_fw_version_cmp(hdev, 1, 12, 0) >= 0)
 		has_block_id = true;
 
 	ecc_address = le64_to_cpu(ecc_data->ecc_address);
@@ -8165,13 +8130,7 @@ static void gaudi2_ack_module_razwi_event_handler(struct hl_device *hdev,
 		}
 
 		hbw_rtr_id = gaudi2_tpc_initiator_hbw_rtr_id[module_idx];
-
-		if (hl_is_fw_sw_ver_below(hdev, 1, 9) &&
-				!hdev->asic_prop.fw_security_enabled &&
-				((module_idx == 0) || (module_idx == 1)))
-			lbw_rtr_id = DCORE0_RTR0;
-		else
-			lbw_rtr_id = gaudi2_tpc_initiator_lbw_rtr_id[module_idx];
+		lbw_rtr_id = gaudi2_tpc_initiator_lbw_rtr_id[module_idx];
 		break;
 	case RAZWI_MME:
 		sprintf(initiator_name, "MME_%u", module_idx);
@@ -10080,7 +10039,7 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		error_count = gaudi2_handle_pcie_drain(hdev, &eq_entry->pcie_drain_ind_data);
 		reset_flags |= HL_DRV_RESET_FW_FATAL_ERR;
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
-		if (hl_is_fw_sw_ver_equal_or_greater(hdev, 1, 13))
+		if (hl_fw_version_cmp(hdev, 1, 13, 0) >= 0)
 			is_critical = true;
 		break;
 
-- 
2.34.1

