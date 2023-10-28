Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8227DA7E5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574A610E090;
	Sat, 28 Oct 2023 15:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5363510E04E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508794; x=1730044794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qkjrhXZyv7UE5dfQZAF6JQsD1xWU4sSQ9tplVhpwUQY=;
 b=FpUIAvy9QPOInP1speSC2Y5eDKtD0YMgtKP4pR0Zhl2OrnraeASzHEUf
 +7YJTumjPluCrYw1dmcw2oDS/hBfzwxlUvpl3F5Jm6bP0QGDFxI6gQmuW
 fO2K69yIlexMgmbatv6/7R0h5+gUbSx+EwlRuOCs00q1ah4FcvWwIEa41
 4AqvhbK7/7gtWz8L5bkW9G1yi0iiF5yhlOr7iN2RE5c0ORaieMq+wUpDu
 NwuNburPsdzFLIzMEp0a/np+soqWCUcY2t7oUTmlBx9HYzcG+yfEcHJLl
 r0HIh6pWLEOVIWyVYPc2GZ3stvySjAyZwAZEUIoPZ3FRCwi1JY/agL1N6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152645"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152645"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516388"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516388"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:41 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] accel/ivpu/40xx: Allow to change profiling frequency
Date: Sat, 28 Oct 2023 17:59:29 +0200
Message-Id: <20231028155936.1183342-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>

Profiling freq is a debug firmware feature. It switches default clock
to higher resolution for fine-grained and more accurate firmware task
profiling. We already configure it during boot up of VPU4.

Add debugfs knob and helpers per HW generation that allow to change it.
For vpu37xx the implementation is empty as profiling frequency can only
be changed on VPU4 or newer.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 29 +++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_fw.c      |  7 +++++++
 drivers/accel/ivpu/ivpu_hw.h      | 12 ++++++++++++
 drivers/accel/ivpu/ivpu_hw_37xx.c | 13 +++++++++++++
 drivers/accel/ivpu/ivpu_hw_40xx.c | 15 +++++++++++++++
 5 files changed, 76 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index 6e0d56823024..19035230563d 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -14,6 +14,7 @@
 #include "ivpu_fw.h"
 #include "ivpu_fw_log.h"
 #include "ivpu_gem.h"
+#include "ivpu_hw.h"
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
 
@@ -176,6 +177,30 @@ static const struct file_operations fw_log_fops = {
 	.release = single_release,
 };
 
+static ssize_t
+fw_profiling_freq_fops_write(struct file *file, const char __user *user_buf,
+			     size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+	bool enable;
+	int ret;
+
+	ret = kstrtobool_from_user(user_buf, size, &enable);
+	if (ret < 0)
+		return ret;
+
+	ivpu_hw_profiling_freq_drive(vdev, enable);
+	ivpu_pm_schedule_recovery(vdev);
+
+	return size;
+}
+
+static const struct file_operations fw_profiling_freq_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = fw_profiling_freq_fops_write,
+};
+
 static ssize_t
 fw_trace_destination_mask_fops_write(struct file *file, const char __user *user_buf,
 				     size_t size, loff_t *pos)
@@ -319,4 +344,8 @@ void ivpu_debugfs_init(struct ivpu_device *vdev)
 
 	debugfs_create_file("reset_engine", 0200, debugfs_root, vdev,
 			    &ivpu_reset_engine_fops);
+
+	if (ivpu_hw_gen(vdev) >= IVPU_HW_40XX)
+		debugfs_create_file("fw_profiling_freq_drive", 0200,
+				    debugfs_root, vdev, &fw_profiling_freq_fops);
 }
diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index 4a21be3a0c59..3fd74cd4205f 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -498,6 +498,13 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->vpu_id = to_pci_dev(vdev->drm.dev)->bus->number;
 	boot_params->frequency = ivpu_hw_reg_pll_freq_get(vdev);
 
+	/*
+	 * This param is a debug firmware feature.  It switches default clock
+	 * to higher resolution one for fine-grained and more accurate firmware
+	 * task profiling.
+	 */
+	boot_params->perf_clk_frequency = ivpu_hw_profiling_freq_get(vdev);
+
 	/*
 	 * Uncached region of VPU address space, covers IPC buffers, job queues
 	 * and log buffers, programmable to L2$ Uncached by VPU MTRR
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index b7694b1cbc02..aa52e5c29a65 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -17,6 +17,8 @@ struct ivpu_hw_ops {
 	int (*wait_for_idle)(struct ivpu_device *vdev);
 	void (*wdt_disable)(struct ivpu_device *vdev);
 	void (*diagnose_failure)(struct ivpu_device *vdev);
+	u32 (*profiling_freq_get)(struct ivpu_device *vdev);
+	void (*profiling_freq_drive)(struct ivpu_device *vdev, bool enable);
 	u32 (*reg_pll_freq_get)(struct ivpu_device *vdev);
 	u32 (*reg_telemetry_offset_get)(struct ivpu_device *vdev);
 	u32 (*reg_telemetry_size_get)(struct ivpu_device *vdev);
@@ -104,6 +106,16 @@ static inline void ivpu_hw_wdt_disable(struct ivpu_device *vdev)
 	vdev->hw->ops->wdt_disable(vdev);
 };
 
+static inline u32 ivpu_hw_profiling_freq_get(struct ivpu_device *vdev)
+{
+	return vdev->hw->ops->profiling_freq_get(vdev);
+};
+
+static inline void ivpu_hw_profiling_freq_drive(struct ivpu_device *vdev, bool enable)
+{
+	return vdev->hw->ops->profiling_freq_drive(vdev, enable);
+};
+
 /* Register indirect accesses */
 static inline u32 ivpu_hw_reg_pll_freq_get(struct ivpu_device *vdev)
 {
diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 1c8c5715095b..81f81046d39a 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -29,6 +29,7 @@
 
 #define PLL_REF_CLK_FREQ	     (50 * 1000000)
 #define PLL_SIMULATION_FREQ	     (10 * 1000000)
+#define PLL_PROF_CLK_FREQ	     (38400 * 1000)
 #define PLL_DEFAULT_EPP_VALUE	     0x80
 
 #define TIM_SAFE_ENABLE		     0xf1d0dead
@@ -769,6 +770,16 @@ static void ivpu_hw_37xx_wdt_disable(struct ivpu_device *vdev)
 	REGV_WR32(VPU_37XX_CPU_SS_TIM_GEN_CONFIG, val);
 }
 
+static u32 ivpu_hw_37xx_profiling_freq_get(struct ivpu_device *vdev)
+{
+	return PLL_PROF_CLK_FREQ;
+}
+
+static void ivpu_hw_37xx_profiling_freq_drive(struct ivpu_device *vdev, bool enable)
+{
+	/* Profiling freq - is a debug feature. Unavailable on VPU 37XX. */
+}
+
 static u32 ivpu_hw_37xx_pll_to_freq(u32 ratio, u32 config)
 {
 	u32 pll_clock = PLL_REF_CLK_FREQ * ratio;
@@ -1012,6 +1023,8 @@ const struct ivpu_hw_ops ivpu_hw_37xx_ops = {
 	.boot_fw = ivpu_hw_37xx_boot_fw,
 	.wdt_disable = ivpu_hw_37xx_wdt_disable,
 	.diagnose_failure = ivpu_hw_37xx_diagnose_failure,
+	.profiling_freq_get = ivpu_hw_37xx_profiling_freq_get,
+	.profiling_freq_drive = ivpu_hw_37xx_profiling_freq_drive,
 	.reg_pll_freq_get = ivpu_hw_37xx_reg_pll_freq_get,
 	.reg_telemetry_offset_get = ivpu_hw_37xx_reg_telemetry_offset_get,
 	.reg_telemetry_size_get = ivpu_hw_37xx_reg_telemetry_size_get,
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 6a9672f650d1..a779b905f8b1 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -931,6 +931,19 @@ static void ivpu_hw_40xx_wdt_disable(struct ivpu_device *vdev)
 	REGV_WR32(VPU_40XX_CPU_SS_TIM_GEN_CONFIG, val);
 }
 
+static u32 ivpu_hw_40xx_profiling_freq_get(struct ivpu_device *vdev)
+{
+	return vdev->hw->pll.profiling_freq;
+}
+
+static void ivpu_hw_40xx_profiling_freq_drive(struct ivpu_device *vdev, bool enable)
+{
+	if (enable)
+		vdev->hw->pll.profiling_freq = PLL_PROFILING_FREQ_HIGH;
+	else
+		vdev->hw->pll.profiling_freq = PLL_PROFILING_FREQ_DEFAULT;
+}
+
 /* Register indirect accesses */
 static u32 ivpu_hw_40xx_reg_pll_freq_get(struct ivpu_device *vdev)
 {
@@ -1182,6 +1195,8 @@ const struct ivpu_hw_ops ivpu_hw_40xx_ops = {
 	.boot_fw = ivpu_hw_40xx_boot_fw,
 	.wdt_disable = ivpu_hw_40xx_wdt_disable,
 	.diagnose_failure = ivpu_hw_40xx_diagnose_failure,
+	.profiling_freq_get = ivpu_hw_40xx_profiling_freq_get,
+	.profiling_freq_drive = ivpu_hw_40xx_profiling_freq_drive,
 	.reg_pll_freq_get = ivpu_hw_40xx_reg_pll_freq_get,
 	.reg_telemetry_offset_get = ivpu_hw_40xx_reg_telemetry_offset_get,
 	.reg_telemetry_size_get = ivpu_hw_40xx_reg_telemetry_size_get,
-- 
2.25.1

