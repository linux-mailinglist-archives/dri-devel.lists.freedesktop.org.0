Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E50CE9ED5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF8F10E09C;
	Tue, 30 Dec 2025 14:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+0MREDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F65D10E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767104644; x=1798640644;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mAAAgeDV6P6/P1SNEqR6fjtLuCv37CDmqDaEDmzNJTo=;
 b=S+0MREDRUZhRZl5kxVpDl7sg3jh45KeT4PhOPZeK3mPAtjCNcVFRi6xa
 bkDji4klHIR6ovi9q1IUDtllzUt07NfZ+DXe2yx3Gb2LKHHQza1oOWlk0
 j2ttxsZ5KepJ4UaIWN3ub7vPixRbj40eV6c8AvRr/sAL0JlvUrhdUiyF/
 CTexfEPXSDoJnR2obTBToWXl62RHhH4ZH6g1uiWqJmzFCynBifia4ozOp
 SHJ30ZqrAe8lKfgWlcXQsDkCLXnVCPh7PcCRMIo4s7dCOjDpfB3yOKspu
 CVb5XJGZSwfSj8V0osl3tx/4saGh6ZQIDjI3AnuK01rgvwaUKBtOPdIvY A==;
X-CSE-ConnectionGUID: KdjeQwooT1a11oVZbYYVeA==
X-CSE-MsgGUID: UTkJtLE7S2u2u+NmQLFUsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68583478"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="68583478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 06:24:04 -0800
X-CSE-ConnectionGUID: fuG6a4GUSQOdcVTbBer1sg==
X-CSE-MsgGUID: k2pbMw8GTfughkoMXWnZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; d="scan'208";a="232300258"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 06:24:02 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Implement warm boot flow for NPU6 and unify boot
 handling
Date: Tue, 30 Dec 2025 15:21:16 +0100
Message-ID: <20251230142116.540026-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Starting from NPU6, the driver can pass boot parameters address through
the AON retention register and toggle between cold/warm boot types using
the boot_type parameter, while setting the cold boot entry point in both
cases.

Refactor the existing cold/warm boot handling to be consistent with the
new NPU6 boot flow requirements and still maintain compatibility with
older boot flows.

This will allow firmware to remove support for legacy warm boot starting
from NPU6.

Fixes: 550f4dd2cedd ("accel/ivpu: Add support for Nova Lake's NPU")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c     |  4 +-
 drivers/accel/ivpu/ivpu_drv.c         |  4 +-
 drivers/accel/ivpu/ivpu_fw.c          | 13 +++--
 drivers/accel/ivpu/ivpu_fw.h          |  9 ++--
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  6 +++
 drivers/accel/ivpu/ivpu_hw_ip.c       | 74 ++++++++++++++++++---------
 drivers/accel/ivpu/ivpu_hw_ip.h       |  1 -
 drivers/accel/ivpu/ivpu_pm.c          | 13 +++--
 drivers/accel/ivpu/ivpu_pm.h          |  1 -
 9 files changed, 82 insertions(+), 43 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 3bd85ee6c26b..a09f54fc4302 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -20,6 +20,7 @@
 #include "ivpu_hw.h"
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
+#include "vpu_boot_api.h"
 
 static inline struct ivpu_device *seq_to_ivpu(struct seq_file *s)
 {
@@ -96,7 +97,8 @@ static int last_bootmode_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = seq_to_ivpu(s);
 
-	seq_printf(s, "%s\n", (vdev->pm->is_warmboot) ? "warmboot" : "coldboot");
+	seq_printf(s, "%s\n", (vdev->fw->last_boot_mode == VPU_BOOT_TYPE_WARMBOOT) ?
+		   "warm boot" : "cold boot");
 
 	return 0;
 }
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 3d6fccdefdd6..8ffda57459df 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -384,6 +384,7 @@ int ivpu_boot(struct ivpu_device *vdev)
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
 
 	ivpu_fw_boot_params_setup(vdev, ivpu_bo_vaddr(vdev->fw->mem_bp));
+	vdev->fw->last_boot_mode = vdev->fw->next_boot_mode;
 
 	ret = ivpu_hw_boot_fw(vdev);
 	if (ret) {
@@ -396,13 +397,12 @@ int ivpu_boot(struct ivpu_device *vdev)
 		ivpu_err(vdev, "Failed to boot the firmware: %d\n", ret);
 		goto err_diagnose_failure;
 	}
-
 	ivpu_hw_irq_clear(vdev);
 	enable_irq(vdev->irq);
 	ivpu_hw_irq_enable(vdev);
 	ivpu_ipc_enable(vdev);
 
-	if (ivpu_fw_is_cold_boot(vdev)) {
+	if (!ivpu_fw_is_warm_boot(vdev)) {
 		ret = ivpu_pm_dct_init(vdev);
 		if (ret)
 			goto err_disable_ipc;
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 48386d2cddbb..107f8ad31050 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -300,9 +300,7 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 	fw->image_load_offset = image_load_addr - runtime_addr;
 	fw->image_size = image_size;
 	fw->shave_nn_size = PAGE_ALIGN(fw_hdr->shave_nn_fw_size);
-
 	fw->cold_boot_entry_point = fw_hdr->entry_point;
-	fw->entry_point = fw->cold_boot_entry_point;
 
 	fw->trace_level = min_t(u32, ivpu_fw_log_level, IVPU_FW_LOG_FATAL);
 	fw->trace_destination_mask = VPU_TRACE_DESTINATION_VERBOSE_TRACING;
@@ -338,7 +336,7 @@ static int ivpu_fw_parse(struct ivpu_device *vdev)
 		 fw->image_load_offset, fw->image_size);
 	ivpu_dbg(vdev, FW_BOOT, "Read-only section: address 0x%llx, size %u\n",
 		 fw->read_only_addr, fw->read_only_size);
-	ivpu_dbg(vdev, FW_BOOT, "FW entry point: 0x%llx\n", fw->entry_point);
+	ivpu_dbg(vdev, FW_BOOT, "FW cold boot entry point: 0x%llx\n", fw->cold_boot_entry_point);
 	ivpu_dbg(vdev, FW_BOOT, "SHAVE NN size: %u\n", fw->shave_nn_size);
 
 	return 0;
@@ -616,6 +614,7 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->power_profile);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_uses_ecc_mca_signal = 0x%x\n",
 		 boot_params->vpu_uses_ecc_mca_signal);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.boot_type = 0x%x\n", boot_params->boot_type);
 }
 
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
@@ -623,7 +622,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	struct ivpu_bo *ipc_mem_rx = vdev->ipc->mem_rx;
 
 	/* In case of warm boot only update variable params */
-	if (!ivpu_fw_is_cold_boot(vdev)) {
+	if (ivpu_fw_is_warm_boot(vdev)) {
 		boot_params->d0i3_residency_time_us =
 			ktime_us_delta(ktime_get_boottime(), vdev->hw->d0i3_entry_host_ts);
 		boot_params->d0i3_entry_vpu_ts = vdev->hw->d0i3_entry_vpu_ts;
@@ -635,16 +634,16 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 			 boot_params->d0i3_entry_vpu_ts);
 		ivpu_dbg(vdev, FW_BOOT, "boot_params.system_time_us = %llu\n",
 			 boot_params->system_time_us);
+		ivpu_dbg(vdev, FW_BOOT, "boot_params.boot_type = 0x%x\n", boot_params->boot_type);
 
 		boot_params->save_restore_ret_address = 0;
-		vdev->pm->is_warmboot = true;
+		boot_params->boot_type = VPU_BOOT_TYPE_WARMBOOT;
 		wmb(); /* Flush WC buffers after writing save_restore_ret_address */
 		return;
 	}
 
 	memset(boot_params, 0, sizeof(*boot_params));
-	vdev->pm->is_warmboot = false;
-
+	boot_params->boot_type = VPU_BOOT_TYPE_COLDBOOT;
 	boot_params->magic = VPU_BOOT_PARAMS_MAGIC;
 	boot_params->vpu_id = to_pci_dev(vdev->drm.dev)->bus->number;
 
diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
index 00945892b55e..d3c410912c9c 100644
--- a/drivers/accel/ivpu/ivpu_fw.h
+++ b/drivers/accel/ivpu/ivpu_fw.h
@@ -6,6 +6,7 @@
 #ifndef __IVPU_FW_H__
 #define __IVPU_FW_H__
 
+#include "vpu_boot_api.h"
 #include "vpu_jsm_api.h"
 
 #define FW_VERSION_HEADER_SIZE	SZ_4K
@@ -34,8 +35,10 @@ struct ivpu_fw_info {
 	u64 image_load_offset;
 	u32 image_size;
 	u32 shave_nn_size;
-	u64 entry_point; /* Cold or warm boot entry point for next boot */
+	u64 warm_boot_entry_point;
 	u64 cold_boot_entry_point;
+	u8 last_boot_mode;
+	u8 next_boot_mode;
 	u32 trace_level;
 	u32 trace_destination_mask;
 	u64 trace_hw_component_mask;
@@ -54,9 +57,9 @@ void ivpu_fw_fini(struct ivpu_device *vdev);
 void ivpu_fw_load(struct ivpu_device *vdev);
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params);
 
-static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
+static inline bool ivpu_fw_is_warm_boot(struct ivpu_device *vdev)
 {
-	return vdev->fw->entry_point == vdev->fw->cold_boot_entry_point;
+	return vdev->fw->next_boot_mode == VPU_BOOT_TYPE_WARMBOOT;
 }
 
 static inline u32 ivpu_fw_preempt_buf_size(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
index fc0ee8d637f9..421242acb184 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
@@ -121,6 +121,12 @@
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY			0x0003006cu
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY_STATUS_DLY_MASK	GENMASK(7, 0)
 
+#define VPU_40XX_HOST_SS_AON_RETENTION0                                 0x0003000cu
+#define VPU_40XX_HOST_SS_AON_RETENTION1                                 0x00030010u
+#define VPU_40XX_HOST_SS_AON_RETENTION2                                 0x00030014u
+#define VPU_40XX_HOST_SS_AON_RETENTION3                                 0x00030018u
+#define VPU_40XX_HOST_SS_AON_RETENTION4                                 0x0003001cu
+
 #define VPU_40XX_HOST_SS_AON_IDLE_GEN					0x00030200u
 #define VPU_40XX_HOST_SS_AON_IDLE_GEN_EN_MASK				BIT_MASK(0)
 #define VPU_40XX_HOST_SS_AON_IDLE_GEN_HW_PG_EN_MASK			BIT_MASK(1)
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index 06aa1e7dc50b..959984c54341 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -5,6 +5,7 @@
 
 #include "ivpu_drv.h"
 #include "ivpu_fw.h"
+#include "ivpu_gem.h"
 #include "ivpu_hw.h"
 #include "ivpu_hw_37xx_reg.h"
 #include "ivpu_hw_40xx_reg.h"
@@ -816,6 +817,14 @@ void ivpu_hw_ip_tbu_mmu_enable(struct ivpu_device *vdev)
 		return ivpu_hw_ip_tbu_mmu_enable_40xx(vdev);
 }
 
+static inline u64 get_entry_point_addr(struct ivpu_device *vdev)
+{
+	if (ivpu_fw_is_warm_boot(vdev))
+		return vdev->fw->warm_boot_entry_point;
+	else
+		return vdev->fw->cold_boot_entry_point;
+}
+
 static int soc_cpu_boot_37xx(struct ivpu_device *vdev)
 {
 	u32 val;
@@ -832,15 +841,12 @@ static int soc_cpu_boot_37xx(struct ivpu_device *vdev)
 	val = REG_CLR_FLD(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, IRQI_RESUME0, val);
 	REGV_WR32(VPU_37XX_CPU_SS_MSSCPU_CPR_LEON_RT_VEC, val);
 
-	val = vdev->fw->entry_point >> 9;
+	val = get_entry_point_addr(vdev) >> 9;
 	REGV_WR32(VPU_37XX_HOST_SS_LOADING_ADDRESS_LO, val);
 
 	val = REG_SET_FLD(VPU_37XX_HOST_SS_LOADING_ADDRESS_LO, DONE, val);
 	REGV_WR32(VPU_37XX_HOST_SS_LOADING_ADDRESS_LO, val);
 
-	ivpu_dbg(vdev, PM, "Booting firmware, mode: %s\n",
-		 vdev->fw->entry_point == vdev->fw->cold_boot_entry_point ? "cold boot" : "resume");
-
 	return 0;
 }
 
@@ -894,46 +900,68 @@ static int soc_cpu_drive_40xx(struct ivpu_device *vdev, bool enable)
 	return ret;
 }
 
-static int soc_cpu_enable(struct ivpu_device *vdev)
+static void soc_cpu_set_entry_point_40xx(struct ivpu_device *vdev, u64 entry_point)
 {
-	if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_60XX)
-		return 0;
+	u64 val64;
+	u32 val;
+
+	val64 = entry_point;
+	val64 <<= ffs(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO_IMAGE_LOCATION_MASK) - 1;
+	REGV_WR64(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO, val64);
 
-	return soc_cpu_drive_40xx(vdev, true);
+	val = REGV_RD32(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO);
+	val = REG_SET_FLD(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO, DONE, val);
+	REGV_WR32(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO, val);
 }
 
 static int soc_cpu_boot_40xx(struct ivpu_device *vdev)
 {
 	int ret;
-	u32 val;
-	u64 val64;
 
-	ret = soc_cpu_enable(vdev);
+	ret = soc_cpu_drive_40xx(vdev, true);
 	if (ret) {
 		ivpu_err(vdev, "Failed to enable SOC CPU: %d\n", ret);
 		return ret;
 	}
 
-	val64 = vdev->fw->entry_point;
-	val64 <<= ffs(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO_IMAGE_LOCATION_MASK) - 1;
-	REGV_WR64(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO, val64);
+	soc_cpu_set_entry_point_40xx(vdev, get_entry_point_addr(vdev));
 
-	val = REGV_RD32(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO);
-	val = REG_SET_FLD(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO, DONE, val);
-	REGV_WR32(VPU_40XX_HOST_SS_VERIFICATION_ADDRESS_LO, val);
+	return 0;
+}
 
-	ivpu_dbg(vdev, PM, "Booting firmware, mode: %s\n",
-		 ivpu_fw_is_cold_boot(vdev) ? "cold boot" : "resume");
+static int soc_cpu_boot_60xx(struct ivpu_device *vdev)
+{
+	REGV_WR64(VPU_40XX_HOST_SS_AON_RETENTION1, vdev->fw->mem_bp->vpu_addr);
+	soc_cpu_set_entry_point_40xx(vdev, vdev->fw->cold_boot_entry_point);
 
 	return 0;
 }
 
 int ivpu_hw_ip_soc_cpu_boot(struct ivpu_device *vdev)
 {
-	if (ivpu_hw_ip_gen(vdev) == IVPU_HW_IP_37XX)
-		return soc_cpu_boot_37xx(vdev);
-	else
-		return soc_cpu_boot_40xx(vdev);
+	int ret;
+
+	switch (ivpu_hw_ip_gen(vdev)) {
+	case IVPU_HW_IP_37XX:
+		ret = soc_cpu_boot_37xx(vdev);
+		break;
+
+	case IVPU_HW_IP_40XX:
+	case IVPU_HW_IP_50XX:
+		ret = soc_cpu_boot_40xx(vdev);
+		break;
+
+	default:
+		ret = soc_cpu_boot_60xx(vdev);
+	}
+
+	if (ret)
+		return ret;
+
+	ivpu_dbg(vdev, PM, "Booting firmware, mode: %s\n",
+		 ivpu_fw_is_warm_boot(vdev) ? "warm boot" : "cold boot");
+
+	return 0;
 }
 
 static void wdt_disable_37xx(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.h b/drivers/accel/ivpu/ivpu_hw_ip.h
index 5b1b391aa577..dbbcdd10a5f8 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.h
+++ b/drivers/accel/ivpu/ivpu_hw_ip.h
@@ -29,7 +29,6 @@ u32 ivpu_hw_ip_ipc_rx_addr_get(struct ivpu_device *vdev);
 void ivpu_hw_ip_ipc_tx_set(struct ivpu_device *vdev, u32 vpu_addr);
 void ivpu_hw_ip_irq_enable(struct ivpu_device *vdev);
 void ivpu_hw_ip_irq_disable(struct ivpu_device *vdev);
-void ivpu_hw_ip_diagnose_failure(struct ivpu_device *vdev);
 void ivpu_hw_ip_fabric_req_override_enable_50xx(struct ivpu_device *vdev);
 void ivpu_hw_ip_fabric_req_override_disable_50xx(struct ivpu_device *vdev);
 
diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 480c075d87f6..d20144a21e09 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -47,8 +47,10 @@ static void ivpu_pm_prepare_cold_boot(struct ivpu_device *vdev)
 	ivpu_ipc_reset(vdev);
 	ivpu_fw_log_reset(vdev);
 	ivpu_fw_load(vdev);
-	fw->entry_point = fw->cold_boot_entry_point;
 	fw->last_heartbeat = 0;
+
+	ivpu_dbg(vdev, FW_BOOT, "Cold boot entry point 0x%llx", vdev->fw->cold_boot_entry_point);
+	fw->next_boot_mode = VPU_BOOT_TYPE_COLDBOOT;
 }
 
 static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
@@ -56,13 +58,14 @@ static void ivpu_pm_prepare_warm_boot(struct ivpu_device *vdev)
 	struct ivpu_fw_info *fw = vdev->fw;
 	struct vpu_boot_params *bp = ivpu_bo_vaddr(fw->mem_bp);
 
-	if (!bp->save_restore_ret_address) {
+	fw->warm_boot_entry_point = bp->save_restore_ret_address;
+	if (!fw->warm_boot_entry_point) {
 		ivpu_pm_prepare_cold_boot(vdev);
 		return;
 	}
 
-	ivpu_dbg(vdev, FW_BOOT, "Save/restore entry point %llx", bp->save_restore_ret_address);
-	fw->entry_point = bp->save_restore_ret_address;
+	ivpu_dbg(vdev, FW_BOOT, "Warm boot entry point 0x%llx", fw->warm_boot_entry_point);
+	fw->next_boot_mode = VPU_BOOT_TYPE_WARMBOOT;
 }
 
 static int ivpu_suspend(struct ivpu_device *vdev)
@@ -110,7 +113,7 @@ static int ivpu_resume(struct ivpu_device *vdev)
 	ivpu_hw_power_down(vdev);
 	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 
-	if (!ivpu_fw_is_cold_boot(vdev)) {
+	if (ivpu_fw_is_warm_boot(vdev)) {
 		ivpu_pm_prepare_cold_boot(vdev);
 		goto retry;
 	} else {
diff --git a/drivers/accel/ivpu/ivpu_pm.h b/drivers/accel/ivpu/ivpu_pm.h
index a2aa7a27f32e..00f2a01e3df6 100644
--- a/drivers/accel/ivpu/ivpu_pm.h
+++ b/drivers/accel/ivpu/ivpu_pm.h
@@ -18,7 +18,6 @@ struct ivpu_pm_info {
 	struct rw_semaphore reset_lock;
 	atomic_t reset_counter;
 	atomic_t reset_pending;
-	bool is_warmboot;
 	u8 dct_active_percent;
 };
 
-- 
2.43.0

