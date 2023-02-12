Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D236939E8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F5410E470;
	Sun, 12 Feb 2023 20:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8AE10E46D
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5161A60DDE;
 Sun, 12 Feb 2023 20:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BEFC4339C;
 Sun, 12 Feb 2023 20:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234721;
 bh=+GP8aIShxcmqRIPoDVO1hzZUlydJDL3OkFf7Cbl5le8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NzH2LvKF0UZsbRkbiyqFDu1eIXeiL439xji0tBfzemiMe1rGsilzTb2LE93RmJyk6
 LdMPnZ3rS3DIJtHhryTbnMyz6g8+WxrspyJPVHOV4GpTNOPJNJ2sH+Wd5x0ZFqJYIJ
 RyZWDXtyuBDC/qV88juY/Ixk2Nvr53wTi6Ly7cobMQP1L6vXgpTOC7e2jawez6VDXA
 E9rAEC6973gcd84gQi42+zY0UUSEyj1+wU3bKc5Jqn6SaXIckhNwFXwU7tQyCv0F9S
 VeF1C7vXqmUy0J00MV+GlOYxHf4c7dIOJUheChpIoe8hVDGAr8VcnygSt/pgNzpp0U
 7yrY1O2GxcRfA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/27] habanalabs/gaudi2: expose engine core int reg address
Date: Sun, 12 Feb 2023 22:44:38 +0200
Message-Id: <20230212204454.2938561-11-ogabbay@kernel.org>
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

In order for engine cores to raise interrupts towards FW, They need
to know which register the event data should be written to.
Hence, we forward the relevant scratchpad register received during
dynamic regs handshake with FW.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs.h       | 3 +++
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 1 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 5 +++++
 include/uapi/drm/habanalabs_accel.h                | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index 176a2e2c050d..bf81eda88e2e 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -592,6 +592,8 @@ struct hl_hints_range {
  * @host_base_address: host physical start address for host DMA from device
  * @host_end_address: host physical end address for host DMA from device
  * @max_freq_value: current max clk frequency.
+ * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
+ *                                  in order to raise events toward FW.
  * @clk_pll_index: clock PLL index that specify which PLL determines the clock
  *                 we display to the user
  * @mmu_pgt_size: MMU page tables total size.
@@ -739,6 +741,7 @@ struct asic_fixed_properties {
 	u64				host_base_address;
 	u64				host_end_address;
 	u64				max_freq_value;
+	u64				engine_core_interrupt_reg_addr;
 	u32				clk_pll_index;
 	u32				mmu_pgt_size;
 	u32				mmu_pte_size;
diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 13cd5013c72a..448cdd2501d8 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -107,6 +107,7 @@ static int hw_ip_info(struct hl_device *hdev, struct hl_info_args *args)
 	hw_ip.server_type = prop->server_type;
 	hw_ip.security_enabled = prop->fw_security_enabled;
 	hw_ip.revision_id = hdev->pdev->revision;
+	hw_ip.engine_core_interrupt_reg_addr = prop->engine_core_interrupt_reg_addr;
 
 	return copy_to_user(out, &hw_ip,
 		min((size_t) size, sizeof(hw_ip))) ? -EFAULT : 0;
diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 9b41eb3f1380..405d0d37efe5 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -2933,6 +2933,7 @@ static bool gaudi2_is_arc_tpc_owned(u64 arc_id)
 
 static void gaudi2_init_arcs(struct hl_device *hdev)
 {
+	struct cpu_dyn_regs *dyn_regs = &hdev->fw_loader.dynamic_loader.comm_desc.cpu_dyn_regs;
 	struct gaudi2_device *gaudi2 = hdev->asic_specific;
 	u64 arc_id;
 	u32 i;
@@ -2962,6 +2963,10 @@ static void gaudi2_init_arcs(struct hl_device *hdev)
 
 		gaudi2_set_arc_id_cap(hdev, arc_id);
 	}
+
+	/* Fetch ARC scratchpad address */
+	hdev->asic_prop.engine_core_interrupt_reg_addr =
+		CFG_BASE + le32_to_cpu(dyn_regs->eng_arc_irq_ctrl);
 }
 
 static int gaudi2_scrub_arc_dccm(struct hl_device *hdev, u32 cpu_id)
diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
index 3a62652a6452..c1fdbb85d1d5 100644
--- a/include/uapi/drm/habanalabs_accel.h
+++ b/include/uapi/drm/habanalabs_accel.h
@@ -885,6 +885,8 @@ enum hl_server_type {
  *                             application to use. Relevant for Gaudi2 and later.
  * @device_mem_alloc_default_page_size: default page size used in device memory allocation.
  * @revision_id: PCI revision ID of the ASIC.
+ * @engine_core_interrupt_reg_addr: interrupt register address for engine core to use
+ *                                  in order to raise events toward FW.
  */
 struct hl_info_hw_ip_info {
 	__u64 sram_base_address;
@@ -921,6 +923,9 @@ struct hl_info_hw_ip_info {
 	__u8 reserved8;
 	__u8 revision_id;
 	__u8 pad[2];
+	__u32 reserved9;
+	__u8 pad3[4];
+	__u64 engine_core_interrupt_reg_addr;
 };
 
 struct hl_info_dram_usage {
-- 
2.25.1

