Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7FCBA0135
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF84B10E951;
	Thu, 25 Sep 2025 14:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEGPpqTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66510E951
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758811930; x=1790347930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IwjDAGVUwONdhybli8Qy4uUWVDN+SwSEPL6GrxcI8jU=;
 b=PEGPpqTefHD2hUsIRLU++6OseSlPSJh/YtA2AP+AFWSOEANyyInbcPqa
 H4gbmbCHjcLrOYhcMU5XPpAsRhfJK5s9vKZqM8x/yV6GpCpfSz6eqPjb5
 3XS82+B9t3VaDdejRozRU+Qi1EszKuEY/U9UPzDzeuzMdjtuKZBhzC4cj
 MUbpAyQF9HGDFKUKOOv+8nC+N4mXiPBoYAEQO4BpF8K5H3Lo/GC/I3qu/
 rroQ74yg7CRsuuLo3F8YVBEFrcVU0+LhU9AHGAUKtCfJjXJ9zgpvpkVv9
 U/dPL12RsFcV/4Yu7P7SSLQbDppIPCYsa17wpQ0IUjp2OlVwYeDB8BmCa g==;
X-CSE-ConnectionGUID: d8PuJa0kROCXo5kfbz2rGw==
X-CSE-MsgGUID: TYjwow38TOmWfsUkh9rWuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72491032"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72491032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:52:10 -0700
X-CSE-ConnectionGUID: 46pEIUoERfKf6FWt8omAsg==
X-CSE-MsgGUID: QiR+vZrFR9CzDjCKgJ/0BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177743374"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:52:07 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Enable MCA ECC signalling based on MSR
Date: Thu, 25 Sep 2025 16:50:20 +0200
Message-ID: <20250925145020.1446208-1-maciej.falkowski@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Add new boot parameter for NPU5+ that enables
ECC signalling for on-chip memory based on the value
of MSR_INTEGRITY_CAPS register.

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_fw.c |  4 ++++
 drivers/accel/ivpu/ivpu_hw.c | 23 +++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_hw.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
index b81bd143a285..be1290be77fd 100644
--- a/drivers/accel/ivpu/ivpu_fw.c
+++ b/drivers/accel/ivpu/ivpu_fw.c
@@ -606,6 +606,8 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
 		 boot_params->system_time_us);
 	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = 0x%x\n",
 		 boot_params->power_profile);
+	ivpu_dbg(vdev, FW_BOOT, "boot_params.vpu_uses_ecc_mca_signal = 0x%x\n",
+		 boot_params->vpu_uses_ecc_mca_signal);
 }
 
 void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params)
@@ -708,6 +710,8 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
 	boot_params->d0i3_entry_vpu_ts = 0;
 	if (IVPU_WA(disable_d0i2))
 		boot_params->power_profile |= BIT(1);
+	boot_params->vpu_uses_ecc_mca_signal =
+		ivpu_hw_uses_ecc_mca_signal(vdev) ? VPU_BOOT_MCA_ECC_BOTH : 0;
 
 	boot_params->system_time_us = ktime_to_us(ktime_get_real());
 	wmb(); /* Flush WC buffers after writing bootparams */
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 8dbf8780920a..d69cd0d93569 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -8,6 +8,8 @@
 #include "ivpu_hw_btrs.h"
 #include "ivpu_hw_ip.h"
 
+#include <asm/msr-index.h>
+#include <asm/msr.h>
 #include <linux/dmi.h>
 #include <linux/fault-inject.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +24,8 @@ MODULE_PARM_DESC(fail_hw, "<interval>,<probability>,<space>,<times>");
 
 #define FW_SHARED_MEM_ALIGNMENT	SZ_512K /* VPU MTRR limitation */
 
+#define ECC_MCA_SIGNAL_ENABLE_MASK	0xff
+
 static char *platform_to_str(u32 platform)
 {
 	switch (platform) {
@@ -395,3 +399,22 @@ irqreturn_t ivpu_hw_irq_handler(int irq, void *ptr)
 	pm_runtime_mark_last_busy(vdev->drm.dev);
 	return IRQ_HANDLED;
 }
+
+bool ivpu_hw_uses_ecc_mca_signal(struct ivpu_device *vdev)
+{
+	unsigned long long msr_integrity_caps;
+	int ret;
+
+	if (ivpu_hw_ip_gen(vdev) < IVPU_HW_IP_50XX)
+		return false;
+
+	ret = rdmsrq_safe(MSR_INTEGRITY_CAPS, &msr_integrity_caps);
+	if (ret) {
+		ivpu_warn(vdev, "Error reading MSR_INTEGRITY_CAPS: %d", ret);
+		return false;
+	}
+
+	ivpu_dbg(vdev, MISC, "MSR_INTEGRITY_CAPS: 0x%llx\n", msr_integrity_caps);
+
+	return msr_integrity_caps & ECC_MCA_SIGNAL_ENABLE_MASK;
+}
diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
index 511a1a29f7f6..b6d0f0d0dccc 100644
--- a/drivers/accel/ivpu/ivpu_hw.h
+++ b/drivers/accel/ivpu/ivpu_hw.h
@@ -63,6 +63,7 @@ void ivpu_irq_handlers_init(struct ivpu_device *vdev);
 void ivpu_hw_irq_enable(struct ivpu_device *vdev);
 void ivpu_hw_irq_disable(struct ivpu_device *vdev);
 irqreturn_t ivpu_hw_irq_handler(int irq, void *ptr);
+bool ivpu_hw_uses_ecc_mca_signal(struct ivpu_device *vdev);
 
 static inline u32 ivpu_hw_btrs_irq_handler(struct ivpu_device *vdev, int irq)
 {
-- 
2.43.0

