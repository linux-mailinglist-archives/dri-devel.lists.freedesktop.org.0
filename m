Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148D90849E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 09:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307DD10EC3D;
	Fri, 14 Jun 2024 07:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="Wfndyg7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45A10E258
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:22:43 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718266939; bh=UZp2NpcAo6pnZ9xkZ7YEDZZj4voBRNnnWL8Qfu9bSIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wfndyg7emoOGk83VcQAvjPsuBzsp5r6eXab7/jKf4qDtyoDMta6MKjER7YVK91syw
 CTCD/R5RmcVgYVQSm66lHmPaBu48d2ouLsMiKHv6bs+74adIO8878IE0W86xS/pdoW
 RR5EE+vTJRIrbgZ+5EdpEiF74lJQWzgydvEgclgqyMbx5rVE61vnx0Z4yx76nWmNTe
 PsmGGQWMxH1zAnms4LUuXizZa8IANUC7hIx8xT0pk2gbN1WXX4OyUPnbiZgdFK4/mL
 wle5cRrO9KPbDMYD79TyKMMVvDj5A+QDTGmp6ZVW0cvil536yMYG6/EGxoGOJqGQZ6
 6CaOu6A2/FEUg==
Received: from oshpigelman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by oshpigelman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 45D8M8hk1440009; Thu, 13 Jun 2024 11:22:12 +0300
From: Omer Shpigelman <oshpigelman@habana.ai>
To: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: ogabbay@kernel.org, oshpigelman@habana.ai, zyehudai@habana.ai
Subject: [PATCH 15/15] accel/habanalabs/gaudi2: network scaling support
Date: Thu, 13 Jun 2024 11:22:08 +0300
Message-Id: <20240613082208.1439968-16-oshpigelman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613082208.1439968-1-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jun 2024 07:24:52 +0000
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

Add GAUDI2 ASIC specific support for AI scaling over the network.

Signed-off-by: Omer Shpigelman <oshpigelman@habana.ai>
Co-developed-by: Abhilash K V <kvabhilash@habana.ai>
Signed-off-by: Abhilash K V <kvabhilash@habana.ai>
Co-developed-by: Andrey Agranovich <aagranovich@habana.ai>
Signed-off-by: Andrey Agranovich <aagranovich@habana.ai>
Co-developed-by: Bharat Jauhari <bjauhari@habana.ai>
Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
Co-developed-by: David Meriin <dmeriin@habana.ai>
Signed-off-by: David Meriin <dmeriin@habana.ai>
Co-developed-by: Sagiv Ozeri <sozeri@habana.ai>
Signed-off-by: Sagiv Ozeri <sozeri@habana.ai>
Co-developed-by: Zvika Yehudai <zyehudai@habana.ai>
Signed-off-by: Zvika Yehudai <zyehudai@habana.ai>
---
 drivers/accel/habanalabs/gaudi2/Makefile      |   2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c      | 426 +++++++++++++++++-
 drivers/accel/habanalabs/gaudi2/gaudi2P.h     |  41 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_cn.c   | 424 +++++++++++++++++
 drivers/accel/habanalabs/gaudi2/gaudi2_cn.h   |  42 ++
 .../habanalabs/gaudi2/gaudi2_coresight.c      | 145 +++++-
 6 files changed, 1050 insertions(+), 30 deletions(-)
 create mode 100644 drivers/accel/habanalabs/gaudi2/gaudi2_cn.c
 create mode 100644 drivers/accel/habanalabs/gaudi2/gaudi2_cn.h

diff --git a/drivers/accel/habanalabs/gaudi2/Makefile b/drivers/accel/habanalabs/gaudi2/Makefile
index 1e047883ba74..289e69a355b1 100644
--- a/drivers/accel/habanalabs/gaudi2/Makefile
+++ b/drivers/accel/habanalabs/gaudi2/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 HL_GAUDI2_FILES := gaudi2/gaudi2.o gaudi2/gaudi2_security.o \
-		gaudi2/gaudi2_coresight.o
+		gaudi2/gaudi2_coresight.o gaudi2/gaudi2_cn.o
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a22d2a93394e..6417c69d47af 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -1,12 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /*
- * Copyright 2020-2022 HabanaLabs, Ltd.
+ * Copyright 2020-2024 HabanaLabs, Ltd.
  * All Rights Reserved.
  */
 
 #include "gaudi2P.h"
+#include "gaudi2_cn.h"
 #include "gaudi2_masks.h"
+#include "gaudi2_coresight_regs.h"
 #include "../include/gaudi2/gaudi2_special_blocks.h"
 #include "../include/hw_ip/mmu/mmu_general.h"
 #include "../include/hw_ip/mmu/mmu_v2_0.h"
@@ -2216,6 +2218,9 @@ static bool gaudi2_get_edma_idle_status(struct hl_device *hdev, u64 *mask_arr, u
 		struct engines_data *e);
 static u64 gaudi2_mmu_scramble_addr(struct hl_device *hdev, u64 raw_addr);
 static u64 gaudi2_mmu_descramble_addr(struct hl_device *hdev, u64 scrambled_addr);
+static int gaudi2_send_cpu_message(struct hl_device *hdev, u32 *msg, u16 len, u32 timeout,
+		u64 *result);
+static void gaudi2_init_cn(struct hl_device *hdev);
 
 static void gaudi2_init_scrambler_hbm(struct hl_device *hdev)
 {
@@ -2382,15 +2387,17 @@ static int gaudi2_set_dram_properties(struct hl_device *hdev)
 	hbm_drv_base_offset = roundup(CPU_FW_IMAGE_SIZE, prop->num_functional_hbms * SZ_8M);
 
 	/*
-	 * The NIC driver section size and the HMMU page tables section in the HBM needs
-	 * to be the remaining size in the first dram page after taking into
-	 * account the F/W image size
+	 * The NIC driver section size and the HMMU page tables section in the HBM needs to be the
+	 * remaining size in the first dram page after taking into account the F/W image size.
 	 */
+	prop->nic_drv_size = (prop->dram_page_size - hbm_drv_base_offset) -
+				(HMMU_PAGE_TABLES_SIZE + EDMA_PQS_SIZE + EDMA_SCRATCHPAD_SIZE);
+	prop->nic_drv_addr = DRAM_PHYS_BASE + hbm_drv_base_offset;
+
+	prop->clk = GAUDI2_NIC_CLK_FREQ / USEC_PER_SEC;
 
 	/* Reserve region in HBM for HMMU page tables */
-	prop->mmu_pgt_addr = DRAM_PHYS_BASE + hbm_drv_base_offset +
-				((prop->dram_page_size - hbm_drv_base_offset) -
-				(HMMU_PAGE_TABLES_SIZE + EDMA_PQS_SIZE + EDMA_SCRATCHPAD_SIZE));
+	prop->mmu_pgt_addr = prop->nic_drv_addr + prop->nic_drv_size;
 
 	/* Set EDMA PQs HBM addresses */
 	edma_pq_base_addr = prop->mmu_pgt_addr + HMMU_PAGE_TABLES_SIZE;
@@ -2409,6 +2416,7 @@ static int gaudi2_set_dram_properties(struct hl_device *hdev)
 static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
+	struct hl_cn_properties *cn_prop = &prop->cn_props;
 	struct hw_queue_properties *q_props;
 	u32 num_sync_stream_queues = 0;
 	int i, rc;
@@ -2601,6 +2609,10 @@ static int gaudi2_set_fixed_properties(struct hl_device *hdev)
 
 	prop->hbw_flush_reg = mmPCIE_WRAP_SPECIAL_GLBL_SPARE_0;
 
+	prop->macro_cfg_size = NIC_OFFSET;
+	cn_prop->status_packet_size = sizeof(struct cpucp_nic_status);
+	cn_prop->max_num_of_ports = NIC_NUMBER_OF_PORTS;
+
 	return 0;
 
 free_qprops:
@@ -2996,8 +3008,16 @@ static int gaudi2_cpucp_info_get(struct hl_device *hdev)
 	u64 dram_size;
 	int rc;
 
-	if (!(gaudi2->hw_cap_initialized & HW_CAP_CPU_Q))
+	if (!(gaudi2->hw_cap_initialized & HW_CAP_CPU_Q)) {
+		/* Skip for hard or device release reset flow. No need to repopulate. */
+		if (!hdev->reset_info.in_reset) {
+			rc = gaudi2_cn_set_info(hdev, false);
+			if (rc)
+				return rc;
+		}
+
 		return 0;
+	}
 
 	/* No point of asking this information again when not doing hard reset, as the device
 	 * CPU hasn't been reset
@@ -3058,23 +3078,47 @@ static int gaudi2_cpucp_info_get(struct hl_device *hdev)
 
 	prop->max_power_default = (u64) max_power;
 
-	return 0;
+	/* Repopulate post hard reset since device CPU has been reset */
+	return gaudi2_cn_set_info(hdev, true);
 }
 
-static int gaudi2_fetch_psoc_frequency(struct hl_device *hdev)
+static int gaudi2_fetch_frequency(struct hl_device *hdev, u32 pll_index, u16 *pll_freq_arr)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
-	u16 pll_freq_arr[HL_PLL_NUM_OUTPUTS];
-	int rc;
 
 	if (!(gaudi2->hw_cap_initialized & HW_CAP_CPU_Q))
 		return 0;
 
-	rc = hl_fw_cpucp_pll_info_get(hdev, HL_GAUDI2_CPU_PLL, pll_freq_arr);
+	return hl_fw_cpucp_pll_info_get(hdev, pll_index, pll_freq_arr);
+}
+
+static int gaudi2_fetch_psoc_frequency(struct hl_device *hdev)
+{
+	u16 pll_freq_arr[HL_PLL_NUM_OUTPUTS] = {0};
+	int rc;
+
+	rc = gaudi2_fetch_frequency(hdev, HL_GAUDI2_CPU_PLL, pll_freq_arr);
+	if (rc)
+		return rc;
+
+	if (pll_freq_arr[3] != 0)
+		hdev->asic_prop.psoc_timestamp_frequency = pll_freq_arr[3];
+
+	return 0;
+}
+
+static int gaudi2_fetch_nic_frequency(struct hl_device *hdev)
+{
+	u16 pll_freq_arr[HL_PLL_NUM_OUTPUTS] = {0};
+	int rc;
+
+	rc = gaudi2_fetch_frequency(hdev, HL_GAUDI2_NIC_PLL, pll_freq_arr);
 	if (rc)
 		return rc;
 
-	hdev->asic_prop.psoc_timestamp_frequency = pll_freq_arr[3];
+	/* DIV1 - nic_clk */
+	if (pll_freq_arr[1] != 0)
+		hdev->asic_prop.clk = pll_freq_arr[1];
 
 	return 0;
 }
@@ -3237,6 +3281,79 @@ static void gaudi2_init_arcs(struct hl_device *hdev)
 		CFG_BASE + le32_to_cpu(dyn_regs->eng_arc_irq_ctrl);
 }
 
+static int gaudi2_cn_clear_mem(struct hl_device *hdev)
+{
+	u32 nic_drv_size, gran_per_packet, num_iter;
+	struct asic_fixed_properties *asic_prop;
+	struct cpucp_cn_clear_mem_packet pkt;
+	bool use_cpucp;
+	int i, rc = 0;
+	u64 val = 0;
+
+	if (!hdev->cn.ports_mask)
+		return rc;
+
+	asic_prop = &hdev->asic_prop;
+
+	use_cpucp = !!(hdev->asic_prop.fw_app_cpu_boot_dev_sts0 &
+			CPU_BOOT_DEV_STS0_NIC_MEM_CLEAR_EN);
+	if (use_cpucp) {
+		/* nic driver size is expected to be less than 4GB in gaudi2 */
+		if (asic_prop->nic_drv_size > BIT(32)) {
+			dev_err(hdev->dev,
+				"Failed to clear NIC memory, nic size is 0x%llx is bigger than 4GB\n",
+				asic_prop->nic_drv_size);
+			return -EINVAL;
+		}
+
+		/* subtract 1 to support size of 4GB as well */
+		nic_drv_size = (asic_prop->nic_drv_size - 1) & 0xFFFFFFFF;
+		/* max 250 MB per packet, in order to avoid CPUCP packet timeout */
+		gran_per_packet = 250 * 1024 * 1024;
+		num_iter = (nic_drv_size + gran_per_packet) / gran_per_packet;
+
+		for (i = 0; i < num_iter; i++) {
+			memset(&pkt, 0, sizeof(pkt));
+			pkt.cpucp_pkt.ctl = cpu_to_le32(CPUCP_PACKET_NIC_CLR_MEM <<
+							CPUCP_PKT_CTL_OPCODE_SHIFT);
+			pkt.mem_base_addr = cpu_to_le64(asic_prop->nic_drv_addr +
+							i * gran_per_packet);
+
+			if (i < num_iter - 1)
+				pkt.size = cpu_to_le32(gran_per_packet);
+			else
+				/* add 1 as it was subtracted in original size calculation */
+				pkt.size = cpu_to_le32(nic_drv_size - gran_per_packet * i + 1);
+
+			rc = gaudi2_send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+			if (rc) {
+				dev_err(hdev->dev,
+					"Failed to handle CPU-CP pkt %u, error %d\n",
+					CPUCP_PACKET_NIC_CLR_MEM, rc);
+				return rc;
+			}
+		}
+	} else {
+		for (i = 0; i < hdev->asic_prop.nic_drv_size; i += sizeof(val)) {
+			rc = hdev->asic_funcs->access_dev_mem(hdev, PCI_REGION_DRAM,
+								hdev->asic_prop.nic_drv_addr + i,
+								&val, DEBUGFS_WRITE64);
+
+			if (rc) {
+				dev_err(hdev->dev, "Failed to set nic memory. addr: 0x%llx",
+						hdev->asic_prop.nic_drv_addr + i);
+				return rc;
+			}
+
+			/* sleep every 32MB to avoid high CPU utilization */
+			if (i && !(i % SZ_32M))
+				usleep_range(50, 100);
+		}
+	}
+
+	return rc;
+}
+
 static int gaudi2_scrub_arc_dccm(struct hl_device *hdev, u32 cpu_id)
 {
 	u32 reg_base, reg_val;
@@ -3303,6 +3420,15 @@ static int gaudi2_scrub_arcs_dccm(struct hl_device *hdev)
 	return 0;
 }
 
+static int gaudi2_nic_unmask_ecc_interrupts(struct hl_device *hdev)
+{
+	struct cpucp_packet pkt = {};
+
+	pkt.ctl = cpu_to_le32(CPUCP_PACKET_NIC_ECC_INTRS_UNMASK << CPUCP_PKT_CTL_OPCODE_SHIFT);
+
+	return gaudi2_send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt), 0, NULL);
+}
+
 static int gaudi2_late_init(struct hl_device *hdev)
 {
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
@@ -3329,6 +3455,24 @@ static int gaudi2_late_init(struct hl_device *hdev)
 		goto disable_pci_access;
 	}
 
+	rc = gaudi2_fetch_nic_frequency(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to fetch NIC frequency\n");
+		goto disable_pci_access;
+	}
+
+	rc = gaudi2_cn_clear_mem(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to clear CN memory\n");
+		goto disable_pci_access;
+	}
+
+	rc = gaudi2_nic_unmask_ecc_interrupts(hdev);
+	if (rc) {
+		dev_err(hdev->dev, "Failed to unmask NIC ECC interrupts\n");
+		goto disable_pci_access;
+	}
+
 	gaudi2_init_arcs(hdev);
 
 	rc = gaudi2_scrub_arcs_dccm(hdev);
@@ -4836,6 +4980,13 @@ static void gaudi2_halt_engines(struct hl_device *hdev, bool hard_reset, bool fw
 	else
 		wait_timeout_ms = GAUDI2_RESET_WAIT_MSEC;
 
+	/*
+	 * Mark the NIC as in reset to avoid any new NIC accesses to the H/W. This must be done
+	 * before we stop the CPU as the NIC might use it e.g. get/set EEPROM data.
+	 */
+	if (hard_reset)
+		hl_cn_hard_reset_prepare(hdev, fw_reset);
+
 	if (fw_reset)
 		goto skip_engines;
 
@@ -4872,11 +5023,14 @@ static void gaudi2_halt_engines(struct hl_device *hdev, bool hard_reset, bool fw
 
 skip_engines:
 	if (hard_reset) {
+		hl_cn_stop(hdev);
 		gaudi2_disable_msix(hdev);
 		return;
 	}
 
+	gaudi2_cn_compute_reset_prepare(hdev);
 	gaudi2_sync_irqs(hdev);
+	hl_cn_synchronize_irqs(hdev);
 }
 
 static void gaudi2_init_firmware_preload_params(struct hl_device *hdev)
@@ -5377,7 +5531,7 @@ static void gaudi2_arm_monitors_for_virt_msix_db(struct hl_device *hdev, u32 sob
 
 static void gaudi2_prepare_sm_for_virt_msix_db(struct hl_device *hdev)
 {
-	u32 decoder_id, sob_id, first_mon_id, interrupt_id;
+	u32 decoder_id, port, sob_id, first_mon_id, interrupt_id;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 
 	/* Decoder normal/abnormal interrupts */
@@ -5395,6 +5549,14 @@ static void gaudi2_prepare_sm_for_virt_msix_db(struct hl_device *hdev)
 		interrupt_id += 1;
 		gaudi2_arm_monitors_for_virt_msix_db(hdev, sob_id, first_mon_id, interrupt_id);
 	}
+
+	/* NIC EQ interrupts */
+	for (port = 0 ; port < NIC_NUMBER_OF_PORTS ; ++port) {
+		sob_id = GAUDI2_RESERVED_SOB_NIC_PORT_FIRST + port;
+		first_mon_id = GAUDI2_RESERVED_MON_NIC_PORT_FIRST + 3 * port;
+		interrupt_id = GAUDI2_IRQ_NUM_NIC_PORT_FIRST + port;
+		gaudi2_arm_monitors_for_virt_msix_db(hdev, sob_id, first_mon_id, interrupt_id);
+	}
 }
 
 static void gaudi2_init_sm(struct hl_device *hdev)
@@ -6161,6 +6323,8 @@ static int gaudi2_hw_init(struct hl_device *hdev)
 		return rc;
 	}
 
+	gaudi2_cn_quiescence(hdev);
+
 	gaudi2_init_scrambler_hbm(hdev);
 	gaudi2_init_kdma(hdev);
 
@@ -6187,6 +6351,7 @@ static int gaudi2_hw_init(struct hl_device *hdev)
 	gaudi2_init_mme(hdev);
 	gaudi2_init_rotator(hdev);
 	gaudi2_init_dec(hdev);
+	gaudi2_init_cn(hdev);
 	gaudi2_enable_timestamp(hdev);
 
 	rc = gaudi2_coresight_init(hdev);
@@ -6469,6 +6634,12 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 			gaudi2_poll_btm_indication(hdev, poll_timeout_us);
 	}
 
+	/* On PLDM the NIC PHY link is always up, and because the NIC interrupts are enabled by
+	 * default - need to disable the interrupts ASAP.
+	 */
+	if (hard_reset && hdev->pldm)
+		gaudi2_cn_disable_interrupts(hdev);
+
 	if (!gaudi2)
 		return 0;
 
@@ -6488,7 +6659,7 @@ static int gaudi2_hw_fini(struct hl_device *hdev, bool hard_reset, bool fw_reset
 			HW_CAP_PMMU | HW_CAP_CPU | HW_CAP_CPU_Q |
 			HW_CAP_SRAM_SCRAMBLER | HW_CAP_DMMU_MASK |
 			HW_CAP_PDMA_MASK | HW_CAP_EDMA_MASK | HW_CAP_KDMA |
-			HW_CAP_MME_MASK | HW_CAP_ROT_MASK);
+			HW_CAP_MME_MASK | HW_CAP_ROT_MASK | HW_CAP_NIC_DRV);
 
 		memset(gaudi2->events_stat, 0, sizeof(gaudi2->events_stat));
 	} else {
@@ -7173,6 +7344,8 @@ static int gaudi2_compute_reset_late_init(struct hl_device *hdev)
 
 	gaudi2_init_security(hdev);
 
+	gaudi2_cn_compute_reset_late_init(hdev);
+
 	/* Unmask all IRQs since some could have been received during the soft reset */
 	irq_arr_size = gaudi2->num_of_valid_hw_events * sizeof(gaudi2->hw_events[0]);
 	return hl_fw_unmask_irq_arr(hdev, gaudi2->hw_events, irq_arr_size);
@@ -7557,6 +7730,30 @@ static void gaudi2_hw_queues_unlock(struct hl_device *hdev)
 	spin_unlock(&gaudi2->hw_queues_lock);
 }
 
+void gaudi2_init_cn(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	u32 i, reg_base, queue_id;
+
+	if (!hdev->cn.ports_mask)
+		return;
+
+	if (gaudi2->nic_hw_cap_initialized & HW_CAP_NIC_MASK)
+		return;
+
+	queue_id = GAUDI2_QUEUE_ID_NIC_0_0;
+
+	for (i = 0; i < NIC_NUMBER_OF_ENGINES;
+		i++, queue_id += NUM_OF_PQ_PER_QMAN) {
+		if (!(hdev->cn.ports_mask & BIT(i)))
+			continue;
+
+		reg_base = gaudi2_qm_blocks_bases[queue_id];
+		gaudi2_init_qman(hdev, reg_base, queue_id);
+		gaudi2->nic_hw_cap_initialized |= BIT_ULL(i);
+	}
+}
+
 static u32 gaudi2_get_pci_id(struct hl_device *hdev)
 {
 	return hdev->pdev->device;
@@ -7779,7 +7976,7 @@ static int gaudi2_mmu_shared_prepare(struct hl_device *hdev, u32 asid)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
 	u32 rw_asid, offset;
-	int rc, i;
+	int rc, i, q;
 
 	rw_asid = FIELD_PREP(ARC_FARM_KDMA_CTX_AXUSER_HB_ASID_RD_MASK, asid) |
 			FIELD_PREP(ARC_FARM_KDMA_CTX_AXUSER_HB_ASID_WR_MASK, asid);
@@ -7819,6 +8016,18 @@ static int gaudi2_mmu_shared_prepare(struct hl_device *hdev, u32 asid)
 	if (rc)
 		return rc;
 
+	/* NIC */
+	for (i = 0 ; i < NIC_NUMBER_OF_MACROS ; i++)
+		for (q = 0 ; q < NIC_NUMBER_OF_QM_PER_MACRO ; q++) {
+			if (!(hdev->cn.ports_mask & BIT(i * NIC_NUMBER_OF_QM_PER_MACRO + q)))
+				continue;
+
+			WREG32(mmNIC0_QM0_AXUSER_NONSECURED_HB_ASID +
+				i * NIC_OFFSET + q * NIC_QM_OFFSET, rw_asid);
+			WREG32(mmNIC0_QM0_AXUSER_NONSECURED_HB_MMU_BP +
+				i * NIC_OFFSET + q * NIC_QM_OFFSET, 0);
+		}
+
 	return 0;
 }
 
@@ -7936,6 +8145,47 @@ static bool gaudi2_handle_ecc_event(struct hl_device *hdev, u16 event_type,
 	return !!ecc_data->is_critical;
 }
 
+static void gaudi2_handle_bmon_spmu_event(struct hl_device *hdev, u8 macro_index)
+{
+	/* For this point a profiler is not configuring the BMON and SPMU block and
+	 * therefore we can't deduce which port and entity triggered the interrupt.
+	 * So for now we only clear all interrupt registers to prevent interrupt flood
+	 */
+	u32 macro_offset = GAUDI2_SPMU_NIC1_DBG_0 - GAUDI2_SPMU_NIC0_DBG_0;
+
+	WREG32(debug_spmu_regs[GAUDI2_SPMU_NIC0_DBG_0 + macro_index * macro_offset]
+			+ mmSPMU_PMINTENCLR_EL1_OFFSET, 0x1);
+	WREG32(debug_spmu_regs[GAUDI2_SPMU_NIC0_DBG_1 + macro_index * macro_offset]
+			+ mmSPMU_PMINTENCLR_EL1_OFFSET, 0x1);
+
+	macro_offset = GAUDI2_BMON_NIC1_DBG_0_0 - GAUDI2_BMON_NIC0_DBG_0_0;
+	WREG32(debug_bmon_regs[GAUDI2_BMON_NIC0_DBG_0_0 + macro_index * macro_offset]
+			+ mmBMON_INT_CLR_OFFSET, 0x1);
+	WREG32(debug_bmon_regs[GAUDI2_BMON_NIC0_DBG_1_0 + macro_index * macro_offset]
+			+ mmBMON_INT_CLR_OFFSET, 0x1);
+	WREG32(debug_bmon_regs[GAUDI2_BMON_NIC0_DBG_2_0 + macro_index * macro_offset]
+			+ mmBMON_INT_CLR_OFFSET, 0x1);
+	WREG32(debug_bmon_regs[GAUDI2_BMON_NIC0_DBG_0_1 + macro_index * macro_offset]
+			+ mmBMON_INT_CLR_OFFSET, 0x1);
+	WREG32(debug_bmon_regs[GAUDI2_BMON_NIC0_DBG_1_1 + macro_index * macro_offset]
+			+ mmBMON_INT_CLR_OFFSET, 0x1);
+	WREG32(debug_bmon_regs[GAUDI2_BMON_NIC0_DBG_2_1 + macro_index * macro_offset]
+			+ mmBMON_INT_CLR_OFFSET, 0x1);
+}
+
+static int gaudi2_handle_nic_sw_error_event(struct hl_device *hdev, u16 event_type, u8 macro_index,
+						struct hl_eq_nic_intr_cause *nic_intr_cause)
+{
+	u32 error_count;
+
+	error_count = gaudi2_cn_handle_sw_error_event(hdev, event_type, macro_index,
+							nic_intr_cause);
+
+	hl_check_for_glbl_errors(hdev);
+
+	return error_count;
+}
+
 static void handle_lower_qman_data_on_err(struct hl_device *hdev, u64 qman_base, u32 engine_id)
 {
 	struct undefined_opcode_info *undef_opcode = &hdev->captured_err_info.undef_opcode;
@@ -8347,6 +8597,22 @@ static void gaudi2_check_if_razwi_happened(struct hl_device *hdev)
 		gaudi2_ack_module_razwi_event_handler(hdev, RAZWI_ROT, mod_idx, 0, NULL);
 }
 
+static int gaudi2_handle_nic_axi_error_response_event(struct hl_device *hdev, u16 event_type,
+				u8 macro_index, struct hl_eq_nic_intr_cause *nic_intr_cause,
+				u64 *event_mask)
+{
+	u32 error_count = 0;
+
+	error_count = gaudi2_cn_handle_axi_error_response_event(hdev, event_type, macro_index,
+								nic_intr_cause);
+
+	/* check if RAZWI happened */
+	gaudi2_ack_module_razwi_event_handler(hdev, RAZWI_NIC, macro_index, 0, event_mask);
+	hl_check_for_glbl_errors(hdev);
+
+	return error_count;
+}
+
 static int gaudi2_psoc_razwi_get_engines(struct gaudi2_razwi_info *razwi_info, u32 array_size,
 						u32 axuser_xy, u32 *base, u16 *eng_id,
 						char *eng_name)
@@ -8560,6 +8826,11 @@ static int gaudi2_handle_qm_sei_err(struct hl_device *hdev, u16 event_type,
 		qman_base = mmROT0_QM_BASE + index * ROT_OFFSET;
 		module = RAZWI_ROT;
 		break;
+	case GAUDI2_EVENT_NIC0_AXI_ERROR_RESPONSE ... GAUDI2_EVENT_NIC11_AXI_ERROR_RESPONSE:
+		index = event_type - GAUDI2_EVENT_NIC0_AXI_ERROR_RESPONSE;
+		qman_base = mmNIC0_QM0_BASE + index * NIC_OFFSET;
+		module = RAZWI_NIC;
+		break;
 	default:
 		return 0;
 	}
@@ -8684,6 +8955,13 @@ static int gaudi2_handle_qman_err(struct hl_device *hdev, u16 event_type, u64 *e
 		qid_base = GAUDI2_QUEUE_ID_ROT_1_0;
 		qman_base = mmROT1_QM_BASE;
 		break;
+	case GAUDI2_EVENT_NIC0_QM0 ... GAUDI2_EVENT_NIC11_QM1:
+		index = event_type - GAUDI2_EVENT_NIC0_QM0;
+		qid_base = GAUDI2_QUEUE_ID_NIC_0_0 + index * QMAN_STREAMS;
+		qman_base = mmNIC0_QM0_BASE +
+			(index / NIC_NUMBER_OF_QM_PER_MACRO) * NIC_OFFSET +
+			(index % NIC_NUMBER_OF_QM_PER_MACRO) * NIC_QM_OFFSET;
+		break;
 	default:
 		return 0;
 	}
@@ -10176,6 +10454,25 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
 		break;
 
+	case GAUDI2_EVENT_NIC0_BMON_SPMU:
+	case GAUDI2_EVENT_NIC1_BMON_SPMU:
+	case GAUDI2_EVENT_NIC2_BMON_SPMU:
+	case GAUDI2_EVENT_NIC3_BMON_SPMU:
+	case GAUDI2_EVENT_NIC4_BMON_SPMU:
+	case GAUDI2_EVENT_NIC5_BMON_SPMU:
+	case GAUDI2_EVENT_NIC6_BMON_SPMU:
+	case GAUDI2_EVENT_NIC7_BMON_SPMU:
+	case GAUDI2_EVENT_NIC8_BMON_SPMU:
+	case GAUDI2_EVENT_NIC9_BMON_SPMU:
+	case GAUDI2_EVENT_NIC10_BMON_SPMU:
+	case GAUDI2_EVENT_NIC11_BMON_SPMU:
+		index = (event_type - GAUDI2_EVENT_NIC0_BMON_SPMU) /
+				(GAUDI2_EVENT_NIC1_BMON_SPMU - GAUDI2_EVENT_NIC0_BMON_SPMU);
+		gaudi2_handle_bmon_spmu_event(hdev, index);
+		error_count = GAUDI2_NA_EVENT_CAUSE;
+		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		break;
+
 	case GAUDI2_EVENT_CPU_FIX_POWER_ENV_S:
 	case GAUDI2_EVENT_CPU_FIX_POWER_ENV_E:
 	case GAUDI2_EVENT_CPU_FIX_THERMAL_ENV_S:
@@ -10213,6 +10510,33 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
+	case GAUDI2_EVENT_NIC0_AXI_ERROR_RESPONSE ... GAUDI2_EVENT_NIC11_AXI_ERROR_RESPONSE:
+		index = (event_type - GAUDI2_EVENT_NIC0_AXI_ERROR_RESPONSE);
+		error_count = gaudi2_handle_nic_axi_error_response_event(hdev, event_type, index,
+							&eq_entry->nic_intr_cause, &event_mask);
+		error_count += gaudi2_handle_qm_sei_err(hdev, event_type, false, &event_mask);
+		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		break;
+
+	case GAUDI2_EVENT_NIC0_SW_ERROR:
+	case GAUDI2_EVENT_NIC1_SW_ERROR:
+	case GAUDI2_EVENT_NIC2_SW_ERROR:
+	case GAUDI2_EVENT_NIC3_SW_ERROR:
+	case GAUDI2_EVENT_NIC4_SW_ERROR:
+	case GAUDI2_EVENT_NIC5_SW_ERROR:
+	case GAUDI2_EVENT_NIC6_SW_ERROR:
+	case GAUDI2_EVENT_NIC7_SW_ERROR:
+	case GAUDI2_EVENT_NIC8_SW_ERROR:
+	case GAUDI2_EVENT_NIC9_SW_ERROR:
+	case GAUDI2_EVENT_NIC10_SW_ERROR:
+	case GAUDI2_EVENT_NIC11_SW_ERROR:
+		index = (event_type - GAUDI2_EVENT_NIC0_SW_ERROR) /
+				(GAUDI2_EVENT_NIC1_SW_ERROR - GAUDI2_EVENT_NIC0_SW_ERROR);
+		error_count = gaudi2_handle_nic_sw_error_event(hdev, event_type, index,
+							&eq_entry->nic_intr_cause);
+		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
+		break;
+
 	case GAUDI2_EVENT_CPU_CPLD_SHUTDOWN_CAUSE:
 		dev_info(hdev->dev, "CPLD shutdown cause, reset reason: 0x%llx\n",
 						le64_to_cpu(eq_entry->data[0]));
@@ -10233,6 +10557,11 @@ static void gaudi2_handle_eqe(struct hl_device *hdev, struct hl_eq_entry *eq_ent
 		event_mask |= HL_NOTIFIER_EVENT_GENERAL_HW_ERR;
 		break;
 
+	case GAUDI2_EVENT_CPU0_STATUS_NIC0_ENG0 ... GAUDI2_EVENT_CPU11_STATUS_NIC11_ENG1:
+		hl_cn_send_status(hdev, event_type - GAUDI2_EVENT_CPU0_STATUS_NIC0_ENG0, 0, 0);
+		error_count = GAUDI2_NA_EVENT_CAUSE;
+		break;
+
 	case GAUDI2_EVENT_ARC_DCCM_FULL:
 		error_count = hl_arc_event_handle(hdev, event_type, &eq_entry->arc_data);
 		event_mask |= HL_NOTIFIER_EVENT_USER_ENGINE_ERR;
@@ -11510,6 +11839,54 @@ static u32 *gaudi2_get_stream_master_qid_arr(void)
 	return NULL;
 }
 
+static void gaudi2_update_nic_qmans_state(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	u32 nic_mask, queue_id;
+	int nic_id;
+
+	queue_id = GAUDI2_QUEUE_ID_NIC_0_0;
+
+	for (nic_id = 0 ; nic_id < NIC_NUMBER_OF_ENGINES;
+						nic_id++, queue_id += NUM_OF_PQ_PER_QMAN) {
+
+		nic_mask = BIT(HW_CAP_NIC_SHIFT + nic_id);
+
+		/* We need to stop and disable the QMAN in case we already
+		 * initialized it AND the firmware reported that the matching
+		 * NIC is disabled
+		 */
+		if ((gaudi2->nic_hw_cap_initialized & nic_mask) &&
+				(!(hdev->cn.ports_mask & BIT(nic_id)))) {
+
+			gaudi2_stop_qman_common(hdev, gaudi2_qm_blocks_bases[queue_id]);
+			gaudi2_disable_qman_common(hdev, gaudi2_qm_blocks_bases[queue_id]);
+
+			/* Remove that capability bit so no one would be able
+			 * to submit to that NIC's QMAN
+			 */
+			gaudi2->nic_hw_cap_initialized &= ~nic_mask;
+		}
+	}
+}
+
+static int gaudi2_cn_init(struct hl_device *hdev)
+{
+	int rc;
+
+	rc = hl_cn_init(hdev);
+	if (rc)
+		return rc;
+
+	/* After ports initialization (for the first time), we need to check
+	 * whether the f/w reported on ports that are disabled. For those
+	 * ports, we need to disable their QMANs and update the HW_CAP bits
+	 */
+	gaudi2_update_nic_qmans_state(hdev);
+
+	return 0;
+}
+
 static void gaudi2_add_device_attr(struct hl_device *hdev, struct attribute_group *dev_clk_attr_grp,
 				struct attribute_group *dev_vrm_attr_grp)
 {
@@ -11590,6 +11967,17 @@ static void gaudi2_write_pte(struct hl_device *hdev, u64 addr, u64 val)
 	writeq(val, hdev->pcie_bar[DRAM_BAR_ID] + (addr - gaudi2->dram_bar_cur_addr));
 }
 
+static int gaudi2_get_reg_pcie_addr(struct hl_device *hdev, u32 reg, u64 *pci_addr)
+{
+	u64 offset = CFG_BASE - STM_FLASH_BASE_ADDR + reg;
+
+	if (pci_resource_len(hdev->pdev, SRAM_CFG_BAR_ID) < offset)
+		return -EINVAL;
+
+	*pci_addr = offset;
+	return 0;
+}
+
 static const struct hl_asic_funcs gaudi2_funcs = {
 	.early_init = gaudi2_early_init,
 	.early_fini = gaudi2_early_fini,
@@ -11641,10 +12029,13 @@ static const struct hl_asic_funcs gaudi2_funcs = {
 	.get_eeprom_data = gaudi2_get_eeprom_data,
 	.get_monitor_dump = gaudi2_get_monitor_dump,
 	.send_cpu_message = gaudi2_send_cpu_message,
+	.cn_init = gaudi2_cn_init,
+	.cn_fini = hl_cn_fini,
 	.pci_bars_map = gaudi2_pci_bars_map,
 	.init_iatu = gaudi2_init_iatu,
 	.rreg = hl_rreg,
 	.wreg = hl_wreg,
+	.get_reg_pcie_addr = gaudi2_get_reg_pcie_addr,
 	.halt_coresight = gaudi2_halt_coresight,
 	.ctx_init = gaudi2_ctx_init,
 	.ctx_fini = gaudi2_ctx_fini,
@@ -11679,6 +12070,7 @@ static const struct hl_asic_funcs gaudi2_funcs = {
 	.get_sob_addr = &gaudi2_get_sob_addr,
 	.set_pci_memory_regions = gaudi2_set_pci_memory_regions,
 	.get_stream_master_qid_arr = gaudi2_get_stream_master_qid_arr,
+	.cn_funcs = &gaudi2_cn_funcs,
 	.check_if_razwi_happened = gaudi2_check_if_razwi_happened,
 	.mmu_get_real_page_size = gaudi2_mmu_get_real_page_size,
 	.access_dev_mem = hl_access_dev_mem,
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2P.h b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
index eee41387b269..429e89703e36 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2P.h
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2P.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
- * Copyright 2020-2022 HabanaLabs, Ltd.
+ * Copyright 2020-2024 HabanaLabs, Ltd.
  * All Rights Reserved.
  *
  */
@@ -8,12 +8,15 @@
 #ifndef GAUDI2P_H_
 #define GAUDI2P_H_
 
+#include <linux/net/intel/cn_aux.h>
+#include <linux/net/intel/gaudi2_aux.h>
 #include <uapi/drm/habanalabs_accel.h>
 #include "../common/habanalabs.h"
 #include <linux/habanalabs/hl_boot_if.h>
 #include "../include/gaudi2/gaudi2.h"
 #include "../include/gaudi2/gaudi2_packets.h"
 #include "../include/gaudi2/gaudi2_fw_if.h"
+#include "../include/gaudi2/gaudi2_coresight.h"
 #include "../include/gaudi2/gaudi2_async_events.h"
 
 #define GAUDI2_LINUX_FW_FILE	"habanalabs/gaudi2/gaudi2-fit.itb"
@@ -86,7 +89,7 @@
 
 #define GAUDI2_BOOT_FIT_REQ_TIMEOUT_USEC	10000000	/* 10s */
 
-#define GAUDI2_NIC_CLK_FREQ			450000000ull	/* 450 MHz */
+#define GAUDI2_NIC_CLK_FREQ			488000000ull	/* 488 MHz */
 
 #define DC_POWER_DEFAULT			60000		/* 60W */
 
@@ -198,6 +201,7 @@
 						HW_CAP_HBM_SCRAMBLER_SW_RESET)
 #define HW_CAP_HBM_SCRAMBLER_SHIFT	41
 #define HW_CAP_RESERVED			BIT(43)
+#define HW_CAP_NIC_DRV			BIT(44)
 #define HW_CAP_MMU_MASK			(HW_CAP_PMMU | HW_CAP_DMMU_MASK)
 
 /* Range Registers */
@@ -239,6 +243,8 @@
 
 #define GAUDI2_NUM_TESTED_QS		(GAUDI2_QUEUE_ID_CPU_PQ - GAUDI2_QUEUE_ID_PDMA_0_0)
 
+extern u64 debug_bmon_regs[GAUDI2_BMON_LAST + 1];
+extern u64 debug_spmu_regs[GAUDI2_SPMU_LAST + 1];
 
 enum gaudi2_reserved_sob_id {
 	GAUDI2_RESERVED_SOB_CS_COMPLETION_FIRST,
@@ -251,6 +257,9 @@ enum gaudi2_reserved_sob_id {
 	GAUDI2_RESERVED_SOB_DEC_ABNRM_FIRST,
 	GAUDI2_RESERVED_SOB_DEC_ABNRM_LAST =
 			GAUDI2_RESERVED_SOB_DEC_ABNRM_FIRST + NUMBER_OF_DEC - 1,
+	GAUDI2_RESERVED_SOB_NIC_PORT_FIRST,
+	GAUDI2_RESERVED_SOB_NIC_PORT_LAST =
+			GAUDI2_RESERVED_SOB_NIC_PORT_FIRST + NIC_NUMBER_OF_PORTS - 1,
 	GAUDI2_RESERVED_SOB_NUMBER
 };
 
@@ -265,6 +274,9 @@ enum gaudi2_reserved_mon_id {
 	GAUDI2_RESERVED_MON_DEC_ABNRM_FIRST,
 	GAUDI2_RESERVED_MON_DEC_ABNRM_LAST =
 			GAUDI2_RESERVED_MON_DEC_ABNRM_FIRST + 3 * NUMBER_OF_DEC - 1,
+	GAUDI2_RESERVED_MON_NIC_PORT_FIRST,
+	GAUDI2_RESERVED_MON_NIC_PORT_LAST =
+			GAUDI2_RESERVED_MON_NIC_PORT_FIRST + 3 * NIC_NUMBER_OF_PORTS - 1,
 	GAUDI2_RESERVED_MON_NUMBER
 };
 
@@ -513,13 +525,8 @@ struct gaudi2_queues_test_info {
  * @events_stat: array that holds histogram of all received events.
  * @events_stat_aggregate: same as events_stat but doesn't get cleared on reset.
  * @num_of_valid_hw_events: used to hold the number of valid H/W events.
- * @nic_ports: array that holds all NIC ports manage structures.
- * @nic_macros: array that holds all NIC macro manage structures.
- * @core_info: core info to be used by the Ethernet driver.
- * @aux_ops: functions for core <-> aux drivers communication.
- * @flush_db_fifo: flag to force flush DB FIFO after a write.
- * @hbm_cfg: HBM subsystem settings
- * @hw_queues_lock_mutex: used by simulator instead of hw_queues_lock.
+ * @cn_aux_ops: functions for core <-> accel drivers communication.
+ * @cn_aux_data: data to be used by the core driver.
  * @queues_test_info: information used by the driver when testing the HW queues.
  */
 struct gaudi2_device {
@@ -549,6 +556,10 @@ struct gaudi2_device {
 	u32				events_stat_aggregate[GAUDI2_EVENT_SIZE];
 	u32				num_of_valid_hw_events;
 
+	/* NIC fields */
+	struct gaudi2_cn_aux_ops	cn_aux_ops;
+	struct gaudi2_cn_aux_data	cn_aux_data;
+
 	/* Queue testing */
 	struct gaudi2_queues_test_info	queues_test_info[GAUDI2_NUM_TESTED_QS];
 };
@@ -588,6 +599,7 @@ enum gaudi2_block_types {
 	GAUDI2_BLOCK_TYPE_MAX
 };
 
+extern struct hl_cn_funcs gaudi2_cn_funcs;
 extern const u32 gaudi2_dma_core_blocks_bases[DMA_CORE_ID_SIZE];
 extern const u32 gaudi2_qm_blocks_bases[GAUDI2_QUEUE_ID_SIZE];
 extern const u32 gaudi2_mme_acc_blocks_bases[MME_ID_SIZE];
@@ -609,4 +621,15 @@ int gaudi2_init_security(struct hl_device *hdev);
 void gaudi2_ack_protection_bits_errors(struct hl_device *hdev);
 int gaudi2_send_device_activity(struct hl_device *hdev, bool open);
 
+/* Functions exported for NIC */
+void gaudi2_cn_spmu_get_stats_info(struct hl_device *hdev, u32 port, struct hbl_cn_stat **stats,
+					u32 *n_stats);
+int gaudi2_cn_spmu_config(struct hl_device *hdev, u32 port, u32 num_event_types, u32 event_types[],
+				bool enable);
+int gaudi2_cn_spmu_sample(struct hl_device *hdev, u32 port, u32 num_out_data, u64 out_data[]);
+void gaudi2_cn_disable_interrupts(struct hl_device *hdev);
+void gaudi2_cn_quiescence(struct hl_device *hdev);
+void gaudi2_cn_compute_reset_prepare(struct hl_device *hdev);
+void gaudi2_cn_compute_reset_late_init(struct hl_device *hdev);
+
 #endif /* GAUDI2P_H_ */
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_cn.c b/drivers/accel/habanalabs/gaudi2/gaudi2_cn.c
new file mode 100644
index 000000000000..9beb11b579e4
--- /dev/null
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_cn.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2020-2022 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include "gaudi2_cn.h"
+#include "../include/gaudi2/asic_reg/gaudi2_regs.h"
+#include "../include/gaudi2/gaudi2_async_ids_map_extended.h"
+#include "../include/hw_ip/nic/nic_general.h"
+
+static bool gaudi2_cn_get_hw_cap(struct hl_device *hdev);
+
+int gaudi2_cn_handle_sw_error_event(struct hl_device *hdev, u16 event_type, u8 macro_index,
+					struct hl_eq_nic_intr_cause *nic_intr_cause)
+{
+	struct hbl_aux_dev *aux_dev = &hdev->cn.cn_aux_dev;
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_ops *aux_ops = &gaudi2->cn_aux_ops;
+	u32 error_count = 0;
+
+	if (aux_ops->sw_err_event_handler)
+		error_count = aux_ops->sw_err_event_handler(aux_dev, event_type, macro_index,
+								nic_intr_cause);
+
+	return error_count;
+}
+
+int gaudi2_cn_handle_axi_error_response_event(struct hl_device *hdev, u16 event_type,
+						u8 macro_index,
+						struct hl_eq_nic_intr_cause *nic_intr_cause)
+{
+	struct hbl_aux_dev *aux_dev = &hdev->cn.cn_aux_dev;
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_ops *aux_ops = &gaudi2->cn_aux_ops;
+	u32 error_count = 0;
+
+	if (aux_ops->axi_error_response_event_handler)
+		error_count = aux_ops->axi_error_response_event_handler(aux_dev, event_type,
+									macro_index,
+									nic_intr_cause);
+
+	return error_count;
+}
+
+/**
+ * gaudi2_cn_disable_interrupts() - Disable interrupts of all ports.
+ * Gaudi2 CN interrupts are enabled by default, need to disable them ASAP
+ * before ports init and after hard reset.
+ *
+ * @hdev: habanalabs device structure.
+ */
+void gaudi2_cn_disable_interrupts(struct hl_device *hdev)
+{
+	u32 port;
+
+	if (!hdev->cn.ports_mask)
+		return;
+
+	/* we only need the port number for NIC_WREG32 */
+	for (port = 0 ; port < NIC_NUMBER_OF_PORTS ; port++) {
+		NIC_WREG32(mmNIC0_QPC0_EVENT_QUE_CFG, 0);
+		NIC_WREG32(mmNIC0_QPC0_INTERRUPT_EN, 0);
+		NIC_WREG32(mmNIC0_QPC0_INTERRUPT_MASK, 0xFFFFFFFF);
+
+		/* This registers needs to be configured only in case of PLDM */
+		if (hdev->pldm) {
+			NIC_WREG32(mmNIC0_QPC0_INTERRUPT_RESP_ERR_MASK, 0xFFFFFFFF);
+			NIC_WREG32(mmNIC0_TXE0_INTERRUPT_MASK, 0xFFFFFFFF);
+			NIC_WREG32(mmNIC0_RXE0_SPI_INTR_MASK, 0xFFFFFFFF);
+			NIC_WREG32(mmNIC0_RXE0_SEI_INTR_MASK, 0xFFFFFFFF);
+			NIC_WREG32(mmNIC0_TXS0_INTERRUPT_MASK, 0xFFFFFFFF);
+		}
+
+		/* WA for H/W bug H6-3339 - mask the link UP interrupt */
+		NIC_MACRO_WREG32(mmNIC0_PHY_PHY_LINK_STS_INTR, 0x1);
+	}
+
+	/* flush */
+	port = 0;
+	NIC_RREG32(mmNIC0_QPC0_EVENT_QUE_CFG);
+}
+
+/**
+ * gaudi2_cn_quiescence() - make sure that NIC does not generate events nor
+ *                           receives traffic.
+ * Gaudi2 default values at power-up and after hard-reset are interrupts enabled
+ * and Rx enabled, we need to disable them until driver configuration is
+ * complete.
+ *
+ * @hdev: habanalabs device structure.
+ */
+void gaudi2_cn_quiescence(struct hl_device *hdev)
+{
+	/*
+	 * Do not quiescence the ports during device release
+	 * reset aka soft reset flow.
+	 */
+	if (gaudi2_cn_get_hw_cap(hdev))
+		return;
+
+	dev_dbg(hdev->dev, "Quiescence the NICs\n");
+
+	gaudi2_cn_disable_interrupts(hdev);
+}
+
+static bool gaudi2_cn_get_hw_cap(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+
+	return (gaudi2->hw_cap_initialized & HW_CAP_NIC_DRV);
+}
+
+static void gaudi2_cn_set_hw_cap(struct hl_device *hdev, bool enable)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+
+	if (enable)
+		gaudi2->hw_cap_initialized |= HW_CAP_NIC_DRV;
+	else
+		gaudi2->hw_cap_initialized &= ~HW_CAP_NIC_DRV;
+}
+
+/**
+ * gaudi2_cn_override_ports_ext_mask() - Set the external ports mask.
+ * @hdev: Hl device whose external ports mask to return.
+ * @ports_ext_mask: Out, the external ports mask.
+ */
+static void gaudi2_cn_override_ports_ext_mask(struct hl_device *hdev, uint64_t *ports_ext_mask)
+{
+	/* For asic type GAUDI2B, the external ports mask shouldn't be changed */
+	if (hdev->asic_type == ASIC_GAUDI2B) {
+		*ports_ext_mask = hdev->cn.ports_ext_mask;
+		return;
+	}
+
+	/* If we are running on a PCI card, all the ports should be set as external */
+	if (hdev->card_type == cpucp_card_type_pci) {
+		*ports_ext_mask = hdev->cn.ports_mask;
+		return;
+	}
+
+	/* For HLS2 setup type, the external ports mask shouldn't be changed */
+	*ports_ext_mask = hdev->cn.ports_ext_mask;
+}
+
+static int gaudi2_cn_check_oui_prefix_validity(u8 *mac_addr)
+{
+	u8 mac[ETH_ALEN];
+	int i;
+
+	for (i = 0 ; i < 3 ; i++)
+		mac[i] = HABANALABS_MAC_OUI_1 >> (8 * (2 - i));
+
+	if (!strncmp(mac, mac_addr, 3))
+		return 1;
+
+	for (i = 0 ; i < 3 ; i++)
+		mac[i] = HABANALABS_MAC_OUI_2 >> (8 * (2 - i));
+
+	if (!strncmp(mac, mac_addr, 3))
+		return 1;
+
+	return 0;
+}
+
+int gaudi2_cn_set_info(struct hl_device *hdev, bool get_from_fw)
+{
+	struct hbl_cn_cpucp_info *cn_cpucp_info = &hdev->asic_prop.cn_props.cpucp_info;
+	struct cpucp_info *cpucp_info = &hdev->asic_prop.cpucp_info;
+	struct hbl_cn_cpucp_mac_addr *mac_arr = cn_cpucp_info->mac_addrs;
+	struct hl_cn *cn = &hdev->cn;
+	u32 serdes_type = MAX_NUM_SERDES_TYPE;
+	u8 mac[ETH_ALEN], *mac_addr;
+	int rc, i;
+
+	/* copy the MAC OUI in reverse */
+	for (i = 0 ; i < 3 ; i++)
+		mac[i] = HABANALABS_MAC_OUI_1 >> (8 * (2 - i));
+
+	if (get_from_fw) {
+		rc = hl_cn_cpucp_info_get(hdev);
+		if (rc)
+			return rc;
+
+		cn->ports_mask &= cn_cpucp_info->link_mask[0];
+		cn->ports_ext_mask &= cn_cpucp_info->link_ext_mask[0];
+		cn->auto_neg_mask &= cn_cpucp_info->auto_neg_mask[0];
+
+		serdes_type = cn_cpucp_info->serdes_type;
+
+		/* check for invalid MAC addresses from F/W (bad OUI) */
+		for (i = 0 ; i < NIC_NUMBER_OF_PORTS ; i++) {
+			if (!(cn->ports_mask & BIT(i)))
+				continue;
+
+			mac_addr = mac_arr[i].mac_addr;
+			if (!gaudi2_cn_check_oui_prefix_validity(mac_addr))
+				dev_warn(hdev->dev, "unrecognized MAC OUI %pM, port %d\n",
+					mac_addr, i);
+		}
+
+		cn->card_location = le32_to_cpu(cpucp_info->card_location);
+		cn->use_fw_serdes_info = true;
+	} else {
+		/* No F/W, hence need to set the MACs manually (randomize) */
+		get_random_bytes(&mac[3], 2);
+
+		for (i = 0 ; i < NIC_NUMBER_OF_PORTS ; i++) {
+			if (!(cn->ports_mask & BIT(i)))
+				continue;
+
+			mac[ETH_ALEN - 1] = i;
+			memcpy(mac_arr[i].mac_addr, mac, ETH_ALEN);
+		}
+
+		dev_warn(hdev->dev, "can't read card location as FW security is enabled\n");
+	}
+
+	switch (serdes_type) {
+	case HLS2_SERDES_TYPE:
+		hdev->asic_prop.server_type = HL_SERVER_GAUDI2_HLS2;
+		break;
+	case HLS2_TYPE_1_SERDES_TYPE:
+		hdev->asic_prop.server_type = HL_SERVER_GAUDI2_TYPE1;
+		break;
+	default:
+		hdev->asic_prop.server_type = HL_SERVER_TYPE_UNKNOWN;
+
+		if (get_from_fw) {
+			dev_err(hdev->dev, "bad SerDes type %d\n", serdes_type);
+			return -EFAULT;
+		}
+		break;
+	}
+
+	/* If we are running on non HLS2 setup or a PCI card, all the ports should be set as
+	 * external (the only exception is when the asic type is GADUI2B).
+	 */
+	if (hdev->card_type == cpucp_card_type_pci) {
+		if (hdev->asic_type != ASIC_GAUDI2B)
+			cn->ports_ext_mask = cn->ports_mask;
+
+		cn->auto_neg_mask &= ~cn->ports_ext_mask;
+	}
+
+	gaudi2_cn_override_ports_ext_mask(hdev, &cn->ports_ext_mask);
+
+	if (hdev->card_type == cpucp_card_type_pci)
+		cn->auto_neg_mask &= ~cn->ports_ext_mask;
+
+	/* Disable ANLT on NIC 0 ports (due to lane swapping) */
+	cn->auto_neg_mask &= ~0x3;
+
+	cn->lanes_per_port = 2;
+	cn->load_fw = false;
+	cn->eth_on_internal = false;
+
+	return 0;
+}
+
+static int gaudi2_cn_pre_core_init(struct hl_device *hdev)
+{
+	return 0;
+}
+
+static char *gaudi2_cn_get_event_name(struct hbl_aux_dev *aux_dev, u16 event_type)
+{
+	return gaudi2_irq_map_table[event_type].valid ? gaudi2_irq_map_table[event_type].name :
+			"N/A Event";
+}
+
+static int gaudi2_cn_poll_mem(struct hbl_aux_dev *aux_dev, u32 *addr, u32 *val,
+				hbl_cn_poll_cond_func func)
+{
+	return hl_poll_timeout_memory(hdev, addr, *val, func(*val, NULL), 10,
+					HL_DEVICE_TIMEOUT_USEC, true);
+}
+
+static void *gaudi2_cn_dma_alloc_coherent(struct hbl_aux_dev *aux_dev, size_t size,
+					  dma_addr_t *dma_handle, gfp_t flag)
+{
+	return hl_cn_dma_alloc_coherent(aux_dev, size, dma_handle, flag);
+}
+
+static void gaudi2_cn_dma_free_coherent(struct hbl_aux_dev *aux_dev, size_t size, void *cpu_addr,
+					dma_addr_t dma_handle)
+{
+	hl_cn_dma_free_coherent(aux_dev, size, cpu_addr, dma_handle);
+}
+
+static void *gaudi2_cn_dma_pool_zalloc(struct hbl_aux_dev *aux_dev, size_t size, gfp_t mem_flags,
+				       dma_addr_t *dma_handle)
+{
+	return hl_cn_dma_pool_zalloc(aux_dev, size, mem_flags, dma_handle);
+}
+
+static void gaudi2_cn_dma_pool_free(struct hbl_aux_dev *aux_dev, void *vaddr, dma_addr_t dma_addr)
+{
+	hl_cn_dma_pool_free(aux_dev, vaddr, dma_addr);
+}
+
+static void gaudi2_cn_set_cn_data(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_data *gaudi2_aux_data;
+	struct gaudi2_cn_aux_ops *gaudi2_aux_ops;
+	struct hbl_cn_aux_data *aux_data;
+	struct hbl_cn_aux_ops *aux_ops;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = &cn->cn_aux_dev;
+	aux_data = aux_dev->aux_data;
+	gaudi2_aux_data = &gaudi2->cn_aux_data;
+	aux_data->asic_specific = gaudi2_aux_data;
+	aux_ops = aux_dev->aux_ops;
+	gaudi2_aux_ops = &gaudi2->cn_aux_ops;
+	aux_ops->asic_ops = gaudi2_aux_ops;
+
+	gaudi2_aux_data->cfg_base = CFG_BASE;
+	gaudi2_aux_data->fw_security_enabled = hdev->asic_prop.fw_security_enabled;
+	gaudi2_aux_data->msix_enabled = !!(gaudi2->hw_cap_initialized & HW_CAP_MSIX);
+	gaudi2_aux_data->irq_num_port_base = GAUDI2_IRQ_NUM_NIC_PORT_FIRST;
+	gaudi2_aux_data->sob_id_base = GAUDI2_RESERVED_SOB_NIC_PORT_FIRST;
+	gaudi2_aux_data->sob_inc_cfg_val = GAUDI2_SOB_INCREMENT_BY_ONE;
+	gaudi2_aux_data->setup_type = GAUDI2_SETUP_TYPE_HLS2;
+
+	/* cn2accel */
+	gaudi2_aux_ops->get_event_name = gaudi2_cn_get_event_name;
+	gaudi2_aux_ops->poll_mem = gaudi2_cn_poll_mem;
+	gaudi2_aux_ops->dma_alloc_coherent = gaudi2_cn_dma_alloc_coherent;
+	gaudi2_aux_ops->dma_free_coherent = gaudi2_cn_dma_free_coherent;
+	gaudi2_aux_ops->dma_pool_zalloc = gaudi2_cn_dma_pool_zalloc;
+	gaudi2_aux_ops->dma_pool_free = gaudi2_cn_dma_pool_free;
+	gaudi2_aux_ops->spmu_get_stats_info = hl_cn_spmu_get_stats_info;
+	gaudi2_aux_ops->spmu_config = hl_cn_spmu_config;
+	gaudi2_aux_ops->spmu_sample = hl_cn_spmu_sample;
+	gaudi2_aux_ops->poll_reg = hl_cn_poll_reg;
+	gaudi2_aux_ops->send_cpu_message = hl_cn_send_cpu_message;
+	gaudi2_aux_ops->post_send_status = hl_cn_post_send_status;
+}
+
+void gaudi2_cn_compute_reset_prepare(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_ops *gaudi2_aux_ops;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = &cn->cn_aux_dev;
+	gaudi2_aux_ops = &gaudi2->cn_aux_ops;
+
+	if (gaudi2_aux_ops->reset_prepare)
+		gaudi2_aux_ops->reset_prepare(aux_dev);
+}
+
+void gaudi2_cn_compute_reset_late_init(struct hl_device *hdev)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_ops *gaudi2_aux_ops;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = &cn->cn_aux_dev;
+	gaudi2_aux_ops = &gaudi2->cn_aux_ops;
+
+	if (gaudi2_aux_ops->reset_late_init)
+		gaudi2_aux_ops->reset_late_init(aux_dev);
+}
+
+static void gaudi2_cn_post_send_status(struct hl_device *hdev, u32 port)
+{
+	hl_fw_unmask_irq(hdev, GAUDI2_EVENT_CPU0_STATUS_NIC0_ENG0 + port);
+}
+
+static void gaudi2_cn_ports_stop_prepare(struct hl_device *hdev, bool fw_reset, bool in_teardown)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_ops *gaudi2_aux_ops;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = &cn->cn_aux_dev;
+	gaudi2_aux_ops = &gaudi2->cn_aux_ops;
+
+	if (gaudi2_aux_ops->ports_stop_prepare)
+		gaudi2_aux_ops->ports_stop_prepare(aux_dev, fw_reset, in_teardown);
+}
+
+static int gaudi2_cn_send_port_cpucp_status(struct hl_device *hdev, u32 port, u8 cmd, u8 period)
+{
+	struct gaudi2_device *gaudi2 = hdev->asic_specific;
+	struct gaudi2_cn_aux_ops *gaudi2_aux_ops;
+	struct hl_cn *cn = &hdev->cn;
+	struct hbl_aux_dev *aux_dev;
+
+	aux_dev = &cn->cn_aux_dev;
+	gaudi2_aux_ops = &gaudi2->cn_aux_ops;
+
+	if (gaudi2_aux_ops->send_port_cpucp_status)
+		return gaudi2_aux_ops->send_port_cpucp_status(aux_dev, port, cmd, period);
+
+	return -ENODEV;
+}
+
+static struct hl_cn_port_funcs gaudi2_cn_port_funcs = {
+	.spmu_get_stats_info = gaudi2_cn_spmu_get_stats_info,
+	.spmu_config = gaudi2_cn_spmu_config,
+	.spmu_sample = gaudi2_cn_spmu_sample,
+	.post_send_status = gaudi2_cn_post_send_status,
+	.ports_stop_prepare = gaudi2_cn_ports_stop_prepare,
+	.send_port_cpucp_status = gaudi2_cn_send_port_cpucp_status,
+};
+
+struct hl_cn_funcs gaudi2_cn_funcs = {
+	.get_hw_cap = gaudi2_cn_get_hw_cap,
+	.set_hw_cap = gaudi2_cn_set_hw_cap,
+	.pre_core_init = gaudi2_cn_pre_core_init,
+	.set_cn_data = gaudi2_cn_set_cn_data,
+	.port_funcs = &gaudi2_cn_port_funcs,
+};
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_cn.h b/drivers/accel/habanalabs/gaudi2/gaudi2_cn.h
new file mode 100644
index 000000000000..dbc8ede23779
--- /dev/null
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_cn.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2020-2024 HabanaLabs, Ltd.
+ * Copyright (C) 2023-2024, Intel Corporation.
+ * All Rights Reserved.
+ *
+ */
+
+#ifndef GAUDI2_CN_H_
+#define GAUDI2_CN_H_
+
+#include "gaudi2P.h"
+#include "../include/gaudi2/asic_reg/gaudi2_regs.h"
+
+#define NIC_MAX_RC_MTU		SZ_8K
+/* This is the max frame length the H/W supports (Tx/Rx) */
+#define NIC_MAX_RDMA_HDRS	128
+#define NIC_MAX_FRM_LEN		(NIC_MAX_RC_MTU + NIC_MAX_RDMA_HDRS)
+
+#define NIC_CFG_LO_SIZE		(mmNIC0_QPC1_REQ_STATIC_CONFIG - \
+					mmNIC0_QPC0_REQ_STATIC_CONFIG)
+
+#define NIC_CFG_HI_SIZE		(mmNIC0_RXE1_CONTROL - mmNIC0_RXE0_CONTROL)
+
+#define NIC_CFG_BASE(port, reg)					\
+		((u64) (NIC_MACRO_CFG_BASE(port) +		\
+		((reg < mmNIC0_RXE0_CONTROL) ?			\
+		(NIC_CFG_LO_SIZE * (u64) ((port) & 1)) :	\
+		(NIC_CFG_HI_SIZE * (u64) ((port) & 1)))))
+
+#define NIC_RREG32(reg) RREG32(NIC_CFG_BASE(port, (reg)) + (reg))
+#define NIC_WREG32(reg, val) WREG32(NIC_CFG_BASE(port, (reg)) + (reg), (val))
+#define NIC_RMWREG32(reg, val, mask)	\
+		RMWREG32(NIC_CFG_BASE(port, reg) + (reg), (val), (mask))
+
+int gaudi2_cn_set_info(struct hl_device *hdev, bool get_from_fw);
+int gaudi2_cn_handle_sw_error_event(struct hl_device *hdev, u16 event_type, u8 macro_index,
+					struct hl_eq_nic_intr_cause *nic_intr_cause);
+int gaudi2_cn_handle_axi_error_response_event(struct hl_device *hdev, u16 event_type,
+				u8 macro_index, struct hl_eq_nic_intr_cause *nic_intr_cause);
+
+#endif /* GAUDI2_CN_H_ */
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
index 2423620ff358..f7b3692f6bff 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /*
- * Copyright 2019-2022 HabanaLabs, Ltd.
+ * Copyright 2019-2024 HabanaLabs, Ltd.
  * All Rights Reserved.
  */
 #include "gaudi2_coresight_regs.h"
@@ -9,6 +9,8 @@
 
 #define GAUDI2_PLDM_CORESIGHT_TIMEOUT_USEC	(CORESIGHT_TIMEOUT_USEC * 2000)
 #define SPMU_MAX_COUNTERS			6
+/* SPMU should also include overflow_idx and cycle_cnt_idx */
+#define SPMU_DATA_LEN				(SPMU_MAX_COUNTERS + 2)
 
 #define COMPONENT_ID_INVALID ((u32)(-1))
 #define MAX_BMONS_PER_UNIT 8
@@ -59,6 +61,23 @@ struct component_config_offsets {
 	u32 bmon_ids[MAX_BMONS_PER_UNIT];
 };
 
+static struct hbl_cn_stat gaudi2_nic0_spmu_stats[] = {
+	{"spmu_req_out_of_range_psn", 17},
+	{"spmu_req_unset_psn", 18},
+	{"spmu_res_duplicate_psn", 20},
+	{"spmu_res_out_of_sequence_psn", 21}
+};
+
+static struct hbl_cn_stat gaudi2_nic1_spmu_stats[] = {
+	{"spmu_req_out_of_range_psn", 5},
+	{"spmu_req_unset_psn", 6},
+	{"spmu_res_duplicate_psn", 8},
+	{"spmu_res_out_of_sequence_psn", 9}
+};
+
+static size_t gaudi2_nic0_spmu_stats_len = ARRAY_SIZE(gaudi2_nic0_spmu_stats);
+static size_t gaudi2_nic1_spmu_stats_len = ARRAY_SIZE(gaudi2_nic1_spmu_stats);
+
 static u64 debug_stm_regs[GAUDI2_STM_LAST + 1] = {
 	[GAUDI2_STM_DCORE0_TPC0_EML] = mmDCORE0_TPC0_EML_STM_BASE,
 	[GAUDI2_STM_DCORE0_TPC1_EML] = mmDCORE0_TPC1_EML_STM_BASE,
@@ -489,7 +508,7 @@ static u64 debug_funnel_regs[GAUDI2_FUNNEL_LAST + 1] = {
 	[GAUDI2_FUNNEL_NIC11_DBG_NCH] = mmNIC11_DBG_FUNNEL_NCH_BASE
 };
 
-static u64 debug_bmon_regs[GAUDI2_BMON_LAST + 1] = {
+u64 debug_bmon_regs[GAUDI2_BMON_LAST + 1] = {
 	[GAUDI2_BMON_DCORE0_TPC0_EML_0] = mmDCORE0_TPC0_EML_BUSMON_0_BASE,
 	[GAUDI2_BMON_DCORE0_TPC0_EML_1] = mmDCORE0_TPC0_EML_BUSMON_1_BASE,
 	[GAUDI2_BMON_DCORE0_TPC0_EML_2] = mmDCORE0_TPC0_EML_BUSMON_2_BASE,
@@ -877,7 +896,7 @@ static u64 debug_bmon_regs[GAUDI2_BMON_LAST + 1] = {
 	[GAUDI2_BMON_NIC11_DBG_2_1] = mmNIC11_DBG_BMON2_1_BASE
 };
 
-static u64 debug_spmu_regs[GAUDI2_SPMU_LAST + 1] = {
+u64 debug_spmu_regs[GAUDI2_SPMU_LAST + 1] = {
 	[GAUDI2_SPMU_DCORE0_TPC0_EML] = mmDCORE0_TPC0_EML_SPMU_BASE,
 	[GAUDI2_SPMU_DCORE0_TPC1_EML] = mmDCORE0_TPC1_EML_SPMU_BASE,
 	[GAUDI2_SPMU_DCORE0_TPC2_EML] = mmDCORE0_TPC2_EML_SPMU_BASE,
@@ -2432,6 +2451,11 @@ static int gaudi2_config_bmon(struct hl_device *hdev, struct hl_debug_params *pa
 	return 0;
 }
 
+static bool gaudi2_reg_is_nic_spmu(enum gaudi2_debug_spmu_regs_index reg_idx)
+{
+	return reg_idx >= GAUDI2_SPMU_NIC0_DBG_0 && reg_idx <= GAUDI2_SPMU_NIC11_DBG_1;
+}
+
 static int gaudi2_config_spmu(struct hl_device *hdev, struct hl_debug_params *params)
 {
 	struct hl_debug_params_spmu *input = params->input;
@@ -2542,6 +2566,121 @@ static int gaudi2_config_spmu(struct hl_device *hdev, struct hl_debug_params *pa
 	return 0;
 }
 
+static int gaudi2_sample_spmu(struct hl_device *hdev, struct hl_debug_params *params)
+{
+	u32 output_arr_len;
+	u32 events_num;
+	u64 base_reg;
+	u64 *output;
+	int i;
+
+	if (params->reg_idx >= ARRAY_SIZE(debug_spmu_regs)) {
+		dev_err(hdev->dev, "Invalid register index in SPMU\n");
+		return -EINVAL;
+	}
+
+	base_reg = debug_spmu_regs[params->reg_idx];
+
+	 /* in case base reg is 0x0 we ignore this configuration */
+	if (!base_reg)
+		return 0;
+
+	output = params->output;
+	output_arr_len = params->output_size / sizeof(u64);
+	events_num = output_arr_len;
+
+	if (output_arr_len < 1) {
+		dev_err(hdev->dev, "not enough values for SPMU sample\n");
+		return -EINVAL;
+	}
+
+	if (events_num > SPMU_MAX_COUNTERS) {
+		dev_err(hdev->dev, "too many events values for SPMU sample\n");
+		return -EINVAL;
+	}
+
+	/* capture */
+	WREG32(base_reg + mmSPMU_PMSCR_OFFSET, 1);
+
+	/* read the shadow registers */
+	for (i = 0 ; i < events_num ; i++)
+		output[i] = RREG32(base_reg + mmSPMU_PMEVCNTSR0_OFFSET + i * 4);
+
+	return 0;
+}
+
+void gaudi2_cn_spmu_get_stats_info(struct hl_device *hdev, u32 port, struct hbl_cn_stat **stats,
+					u32 *n_stats)
+{
+	if (!hdev->supports_coresight) {
+		*n_stats = 0;
+		return;
+	}
+
+	if (port & 1) {
+		*n_stats = gaudi2_nic1_spmu_stats_len;
+		*stats = gaudi2_nic1_spmu_stats;
+	} else {
+		*n_stats = gaudi2_nic0_spmu_stats_len;
+		*stats = gaudi2_nic0_spmu_stats;
+	}
+}
+
+int gaudi2_cn_spmu_config(struct hl_device *hdev, u32 port, u32 num_event_types, u32 event_types[],
+				bool enable)
+{
+	struct hl_debug_params_spmu spmu;
+	struct hl_debug_params params;
+	u64 event_counters[SPMU_DATA_LEN];
+	int i;
+
+	if (!hdev->supports_coresight)
+		return 0;
+
+	/* validate nic port */
+	if  (!gaudi2_reg_is_nic_spmu(GAUDI2_SPMU_NIC0_DBG_0 + port)) {
+		dev_err(hdev->dev, "Invalid nic port %u\n", port);
+		return -EINVAL;
+	}
+
+	memset(&params, 0, sizeof(struct hl_debug_params));
+	params.op = HL_DEBUG_OP_SPMU;
+	params.input = &spmu;
+	params.enable = enable;
+	params.output_size = sizeof(event_counters);
+	params.output = event_counters;
+	params.reg_idx = GAUDI2_SPMU_NIC0_DBG_0 + port;
+
+	memset(&spmu, 0, sizeof(struct hl_debug_params_spmu));
+	spmu.event_types_num = num_event_types;
+
+	for (i = 0 ; i < spmu.event_types_num ; i++)
+		spmu.event_types[i] = event_types[i];
+
+	return gaudi2_config_spmu(hdev, &params);
+}
+
+int gaudi2_cn_spmu_sample(struct hl_device *hdev, u32 port, u32 num_out_data, u64 out_data[])
+{
+	struct hl_debug_params params;
+
+	if (!hdev->supports_coresight)
+		return 0;
+
+	/* validate nic port */
+	if  (!gaudi2_reg_is_nic_spmu(GAUDI2_SPMU_NIC0_DBG_0 + port)) {
+		dev_err(hdev->dev, "Invalid nic port %u\n", port);
+		return -EINVAL;
+	}
+
+	memset(&params, 0, sizeof(struct hl_debug_params));
+	params.output = out_data;
+	params.output_size = num_out_data * sizeof(u64);
+	params.reg_idx = GAUDI2_SPMU_NIC0_DBG_0 + port;
+
+	return gaudi2_sample_spmu(hdev, &params);
+}
+
 int gaudi2_debug_coresight(struct hl_device *hdev, struct hl_ctx *ctx, void *data)
 {
 	struct hl_debug_params *params = data;
-- 
2.34.1

