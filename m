Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF47D6727
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995FB10E61C;
	Wed, 25 Oct 2023 09:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BC110E627
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227044; x=1729763044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bf2yMMHShxXiG6kx1ej44vhViTIA5HVCT0qb0zUecF4=;
 b=PeY3Am8v7iU1cXXb1o9Qfe3F9Cfp/gB4uSuLVWNtmBjdxMVwmSQuZzDb
 MZAEogPkz8smQFPJNQgvlANEti8vHDQyypS9NHPZS32gHB0WzdBFPRYRW
 QpGZQ407AFRxBgf28jWnEER4kPq57ECX15+aulRaGRliWIOMRLcFsN1hk
 ohCPbj1HVoSTUklLm9NS+I8OaRh6xEowRmCZ78Qgskc/thXbTT72vE2Kp
 IBoxfSfb52JeJ+foaELqPXphiZrWBzSVHpn5STxDQ7KaJK2M0/5q8qBbo
 KWP+3UrhiRgbfZL9jL6/DGftIVftgTNOlTPsk/s4M22AKfYH2cGwgMpv6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451498843"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="451498843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="882401183"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882401183"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:59 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] accel/ivpu: Pass D0i3 residency time to the VPU firmware
Date: Wed, 25 Oct 2023 11:43:20 +0200
Message-Id: <20231025094323.989987-9-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>

The firmware needs to know the time spend in D0i3/D3 to
calculate telemetry data. The D0i3/D3 residency time is
calculated by the driver and passed to the firmware
in the boot parameters.

The driver also passes VPU perf counter value captured
right before entering D0i3 - this allows the VPU firmware
to generate monotonic timestamps for the logs.

Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c          | 17 ++++++++++++++++-
 drivers/accel/ivpu/ivpu_hw.h          |  2 ++
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  8 ++++++++
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h |  2 ++
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index a4149fc8a1d7..51d976ba5276 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -426,14 +426,27 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->vpu_telemetry_enable);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.dvfs_mode = %u\n",
 		 boot_params->dvfs_mode);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_residency_time_us = %lld\n",
+		 boot_params->d0i3_residency_time_us);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_entry_vpu_ts = %llu\n",
+		 boot_params->d0i3_entry_vpu_ts);
 }
 
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
 {
 	struct ivpu_bo *ipc_mem_rx = vdev->ipc->mem_rx;
 
-	/* In case of warm boot we only have to reset the entrypoint addr */
+	/* In case of warm boot only update variable params */
 	if (!ivpu_fw_is_cold_boot(vdev)) {
+		boot_params->d0i3_residency_time_us =
+			ktime_us_delta(ktime_get_boottime(), vdev->hw->d0i3_entry_host_ts);
+		boot_params->d0i3_entry_vpu_ts = vdev->hw->d0i3_entry_vpu_ts;
+
+		ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_residency_time_us = %lld\n",
+			 boot_params->d0i3_residency_time_us);
+		ivpu_dbg(vdev, FW_BOOT, "boot_params.d0i3_entry_vpu_ts = %llu\n",
+			 boot_params->d0i3_entry_vpu_ts);
+
 		boot_params->save_restore_ret_address = 0;
 		vdev->pm->is_warmboot = true;
 		wmb(); /* Flush WC buffers after writing save_restore_ret_address */
@@ -498,6 +511,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->punit_telemetry_sram_size = ivpu_hw_reg_telemetry_size_get(vdev);
 	boot_params->vpu_telemetry_enable = ivpu_hw_reg_telemetry_enable_get(vdev);
 	boot_params->dvfs_mode = vdev->fw->dvfs_mode;
+	boot_params->d0i3_residency_time_us = 0;
+	boot_params->d0i3_entry_vpu_ts = 0;
 
 	wmb(); /* Flush WC buffers after writing bootparams */
 
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 1079e06255ba..bb4368168247 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -58,6 +58,8 @@ struct ivpu_hw_info {
 	u32 sku;
 	u16 config;
 	int dma_bits;
+	ktime_t d0i3_entry_host_ts;
+	u64 d0i3_entry_vpu_ts;
 };
 
 extern const struct ivpu_hw_ops ivpu_hw_37xx_ops;
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 0da4e6117d6b..06d7db28448a 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -731,10 +731,18 @@ static bool ivpu_hw_37xx_is_idle(struct ivpu_device *vdev)
 	       REG_TEST_FLD(VPU_37XX_BUTTRESS_VPU_STATUS, IDLE, val);
 }
 
+static void ivpu_hw_37xx_save_d0i3_entry_timestamp(struct ivpu_device *vdev)
+{
+	vdev->hw->d0i3_entry_host_ts = ktime_get_boottime();
+	vdev->hw->d0i3_entry_vpu_ts = REGV_RD64(VPU_37XX_CPU_SS_TIM_PERF_FREE_CNT);
+}
+
 static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
+	ivpu_hw_37xx_save_d0i3_entry_timestamp(vdev);
+
 	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_ip_reset(vdev))
 		ivpu_err(vdev, "Failed to reset the VPU\n");
 
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx_reg.h b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
index 4083beb5e9db..f6fec1919202 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
@@ -240,6 +240,8 @@
 #define VPU_37XX_CPU_SS_TIM_GEN_CONFIG					0x06021008u
 #define VPU_37XX_CPU_SS_TIM_GEN_CONFIG_WDOG_TO_INT_CLR_MASK		BIT_MASK(9)
 
+#define VPU_37XX_CPU_SS_TIM_PERF_FREE_CNT				0x06029000u
+
 #define VPU_37XX_CPU_SS_DOORBELL_0					0x06300000u
 #define VPU_37XX_CPU_SS_DOORBELL_0_SET_MASK				BIT_MASK(0)
 
-- 
2.25.1

