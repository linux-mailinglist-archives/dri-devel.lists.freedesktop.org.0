Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FAA0422B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1410EAD1;
	Tue,  7 Jan 2025 14:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9IMGokp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1797010EAD2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259773; x=1767795773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RMqn4I8rzh/lt0yHX+cPTC3I+Q60fmJ8UFKQUazFO8g=;
 b=A9IMGokp1N7fMbcHQ452wkx06eV0lEaBFmsWqiJLLH8909t7/Zxz1/cG
 yb2BQ/+LLgu62LILI2ImICWM9ppJi19NvFygDRmna0ChsUoSiwc/CUilI
 p6pSpfvhcFtsVbS7oI8HQSY1Lzmc6nwrj3W0dziBFL6+bO+Eca0P34HuT
 HsyTNh6YHfm3y64xogbWuX3q16uIWx1VGRYZB9A37I6hVIH/jzHs8yOvw
 lWcdHl3utTXImaYJ8qikvsLPWKilpiLUArH+AsoUG5eUTCUoRIscFtovi
 3qK/OXHvov+bu6ezm8GBpkKi42pu4GaZ18AOBFnyvLrDjLOldeDipsPy0 g==;
X-CSE-ConnectionGUID: 8tQtP437Q4u6P21UFdkckA==
X-CSE-MsgGUID: hhQKjUMdRm+N5nynWIv7XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324479"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:52 -0800
X-CSE-ConnectionGUID: cklt1XOgSeahrmapi+1Yzw==
X-CSE-MsgGUID: chl8s7EMRz2V2QKazmjNSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635517"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:51 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 13/14] accel/ivpu: Add platform detection for presilicon
Date: Tue,  7 Jan 2025 18:32:36 +0100
Message-ID: <20250107173238.381120-14-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Use highest buttress VPU_STATUS register bits(15:13) that encode
platform type as follows:
	0 - Silicon
	2 - Simics
	3 - FPGA
	4 - Hybrid SLE

Remove old DMI based method.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h             |  4 ++-
 drivers/accel/ivpu/ivpu_hw.c              | 41 ++++++++++-------------
 drivers/accel/ivpu/ivpu_hw_btrs.c         |  7 ++++
 drivers/accel/ivpu/ivpu_hw_btrs.h         |  1 +
 drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h |  1 +
 5 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index d53902b34070..ca21102ca366 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -58,6 +58,7 @@
 #define IVPU_PLATFORM_SILICON 0
 #define IVPU_PLATFORM_SIMICS  2
 #define IVPU_PLATFORM_FPGA    3
+#define IVPU_PLATFORM_HSLE    4
 #define IVPU_PLATFORM_INVALID 8
 
 #define IVPU_SCHED_MODE_AUTO -1
@@ -288,7 +289,8 @@ static inline bool ivpu_is_simics(struct ivpu_device *vdev)
 
 static inline bool ivpu_is_fpga(struct ivpu_device *vdev)
 {
-	return ivpu_get_platform(vdev) == IVPU_PLATFORM_FPGA;
+	return ivpu_get_platform(vdev) == IVPU_PLATFORM_FPGA ||
+	       ivpu_get_platform(vdev) == IVPU_PLATFORM_HSLE;
 }
 
 static inline bool ivpu_is_force_snoop_enabled(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 1b691375ee4d..e332f19ab51d 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -19,38 +19,31 @@ static char *platform_to_str(u32 platform)
 		return "SIMICS";
 	case IVPU_PLATFORM_FPGA:
 		return "FPGA";
+	case IVPU_PLATFORM_HSLE:
+		return "HSLE";
 	default:
 		return "Invalid platform";
 	}
 }
 
-static const struct dmi_system_id dmi_platform_simulation[] = {
-	{
-		.ident = "Intel Simics",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "lnlrvp"),
-			DMI_MATCH(DMI_BOARD_VERSION, "1.0"),
-			DMI_MATCH(DMI_BOARD_SERIAL, "123456789"),
-		},
-	},
-	{
-		.ident = "Intel Simics",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_NAME, "Simics"),
-		},
-	},
-	{ }
-};
-
 static void platform_init(struct ivpu_device *vdev)
 {
-	if (dmi_check_system(dmi_platform_simulation))
-		vdev->platform = IVPU_PLATFORM_SIMICS;
-	else
-		vdev->platform = IVPU_PLATFORM_SILICON;
+	int platform = ivpu_hw_btrs_platform_read(vdev);
+
+	ivpu_dbg(vdev, MISC, "Platform type: %s (%d)\n", platform_to_str(platform), platform);
+
+	switch (platform) {
+	case IVPU_PLATFORM_SILICON:
+	case IVPU_PLATFORM_SIMICS:
+	case IVPU_PLATFORM_FPGA:
+	case IVPU_PLATFORM_HSLE:
+		vdev->platform = platform;
+		break;
 
-	ivpu_dbg(vdev, MISC, "Platform type: %s (%d)\n",
-		 platform_to_str(vdev->platform), vdev->platform);
+	default:
+		ivpu_err(vdev, "Invalid platform type: %d\n", platform);
+		break;
+	}
 }
 
 static void wa_init(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
index 3753b00ed2d6..56c56012b980 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.c
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
@@ -887,3 +887,10 @@ void ivpu_hw_btrs_diagnose_failure(struct ivpu_device *vdev)
 	else
 		return diagnose_failure_lnl(vdev);
 }
+
+int ivpu_hw_btrs_platform_read(struct ivpu_device *vdev)
+{
+	u32 reg = REGB_RD32(VPU_HW_BTRS_LNL_VPU_STATUS);
+
+	return REG_GET_FLD(VPU_HW_BTRS_LNL_VPU_STATUS, PLATFORM, reg);
+}
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
index 04f14f50fed6..1fd71b4d4ab0 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs.h
+++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
@@ -46,5 +46,6 @@ void ivpu_hw_btrs_global_int_disable(struct ivpu_device *vdev);
 void ivpu_hw_btrs_irq_enable(struct ivpu_device *vdev);
 void ivpu_hw_btrs_irq_disable(struct ivpu_device *vdev);
 void ivpu_hw_btrs_diagnose_failure(struct ivpu_device *vdev);
+int ivpu_hw_btrs_platform_read(struct ivpu_device *vdev);
 
 #endif /* __IVPU_HW_BTRS_H__ */
diff --git a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
index fc51f3098f97..fff2ef2cada6 100644
--- a/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_btrs_lnl_reg.h
@@ -86,6 +86,7 @@
 #define VPU_HW_BTRS_LNL_VPU_STATUS_POWER_RESOURCE_OWN_ACK_MASK	BIT_MASK(7)
 #define VPU_HW_BTRS_LNL_VPU_STATUS_PERF_CLK_MASK		BIT_MASK(11)
 #define VPU_HW_BTRS_LNL_VPU_STATUS_DISABLE_CLK_RELINQUISH_MASK  BIT_MASK(12)
+#define VPU_HW_BTRS_LNL_VPU_STATUS_PLATFORM_MASK		GENMASK(31, 29)
 
 #define VPU_HW_BTRS_LNL_IP_RESET				0x00000160u
 #define VPU_HW_BTRS_LNL_IP_RESET_TRIGGER_MASK			BIT_MASK(0)
-- 
2.43.0

