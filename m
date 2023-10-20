Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7607D0DD4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FD710E5A8;
	Fri, 20 Oct 2023 10:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E27F10E5BD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798726; x=1729334726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3tAw22AHB5yMfzdlBOy1n9jc3DI3WATbiGMTcO13qrU=;
 b=Nnh7pyCVDoGHxyvkNhsEEfFNOYzrtvmuDX7ZNSq2EVTQ7M7gYHJBwKF3
 ZmxeUlZz1+mX65IxPAnH3eDy5C6SiLNjg1/XHHp4shipYsUqpwiINqCPs
 NKRmuvXPAqirM7kqdwXOB0CSrLELtIlvq/iU6U8hKxUD9pKQB2xlZdXLQ
 ulTEx/c3oSxb2R0KUh6V+hHjeK7me5giU/QwS5/hLceubUJhOE00wgKMi
 dzeGX81fTgzqpfy9Apn8Acl6t5DpQgDDwBGRb8vR+wBS0iFR0ZBCWEG+Y
 xTBOEgced18qw4AHPUHkSaGG/aUz6zJOofuYDWC00/57Ei9YwxmYs48D+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287560"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287560"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572682"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572682"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:24 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] accel/ivpu/37xx: Remove support for FPGA and simics
Date: Fri, 20 Oct 2023 12:45:01 +0200
Message-Id: <20231020104501.697763-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
References: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We do not run 37xx VPU on non-silicon platforms any longer.
Remove deprecated code to make it cleaner.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 57 +++++--------------------------
 1 file changed, 8 insertions(+), 49 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 63ce5418d3fa..e5cb9d8acb82 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -68,37 +68,9 @@
 				     (REG_FLD(VPU_37XX_HOST_SS_FW_SOC_IRQ_EN, MSS_MBI)) | \
 				     (REG_FLD(VPU_37XX_HOST_SS_FW_SOC_IRQ_EN, MSS_MBI_CMX)))
 
-static char *ivpu_platform_to_str(u32 platform)
-{
-	switch (platform) {
-	case IVPU_PLATFORM_SILICON:
-		return "IVPU_PLATFORM_SILICON";
-	case IVPU_PLATFORM_SIMICS:
-		return "IVPU_PLATFORM_SIMICS";
-	case IVPU_PLATFORM_FPGA:
-		return "IVPU_PLATFORM_FPGA";
-	default:
-		return "Invalid platform";
-	}
-}
-
-static void ivpu_hw_read_platform(struct ivpu_device *vdev)
-{
-	u32 gen_ctrl = REGV_RD32(VPU_37XX_HOST_SS_GEN_CTRL);
-	u32 platform = REG_GET_FLD(VPU_37XX_HOST_SS_GEN_CTRL, PS, gen_ctrl);
-
-	if  (platform == IVPU_PLATFORM_SIMICS || platform == IVPU_PLATFORM_FPGA)
-		vdev->platform = platform;
-	else
-		vdev->platform = IVPU_PLATFORM_SILICON;
-
-	ivpu_dbg(vdev, MISC, "Platform type: %s (%d)\n",
-		 ivpu_platform_to_str(vdev->platform), vdev->platform);
-}
-
 static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 {
-	vdev->wa.punit_disabled = ivpu_is_fpga(vdev);
+	vdev->wa.punit_disabled = false;
 	vdev->wa.clear_runtime_mem = false;
 	vdev->wa.d3hot_after_power_off = true;
 
@@ -113,19 +85,11 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 
 static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
 {
-	if (ivpu_is_simics(vdev) || ivpu_is_fpga(vdev)) {
-		vdev->timeout.boot = 100000;
-		vdev->timeout.jsm = 50000;
-		vdev->timeout.tdr = 2000000;
-		vdev->timeout.reschedule_suspend = 1000;
-		vdev->timeout.autosuspend = -1;
-	} else {
-		vdev->timeout.boot = 1000;
-		vdev->timeout.jsm = 500;
-		vdev->timeout.tdr = 2000;
-		vdev->timeout.reschedule_suspend = 10;
-		vdev->timeout.autosuspend = 10;
-	}
+	vdev->timeout.boot = 1000;
+	vdev->timeout.jsm = 500;
+	vdev->timeout.tdr = 2000;
+	vdev->timeout.reschedule_suspend = 10;
+	vdev->timeout.autosuspend = 10;
 }
 
 static int ivpu_pll_wait_for_cmd_send(struct ivpu_device *vdev)
@@ -220,8 +184,7 @@ static int ivpu_pll_drive(struct ivpu_device *vdev, bool enable)
 	int ret;
 
 	if (IVPU_WA(punit_disabled)) {
-		ivpu_dbg(vdev, PM, "Skipping PLL request on %s\n",
-			 ivpu_platform_to_str(vdev->platform));
+		ivpu_dbg(vdev, PM, "Skipping PLL request\n");
 		return 0;
 	}
 
@@ -484,10 +447,6 @@ static void ivpu_boot_pwr_island_drive(struct ivpu_device *vdev, bool enable)
 
 static int ivpu_boot_wait_for_pwr_island_status(struct ivpu_device *vdev, u32 exp_val)
 {
-	/* FPGA model (UPF) is not power aware, skipped Power Island polling */
-	if (ivpu_is_fpga(vdev))
-		return 0;
-
 	return REGV_POLL_FLD(VPU_37XX_HOST_SS_AON_PWR_ISLAND_STATUS0, MSS_CPU,
 			     exp_val, PWR_ISLAND_STATUS_TIMEOUT_US);
 }
@@ -632,7 +591,7 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 	ivpu_hw_init_range(&hw->ranges.shave, 0x180000000, SZ_2G);
 	ivpu_hw_init_range(&hw->ranges.dma,   0x200000000, SZ_8G);
 
-	ivpu_hw_read_platform(vdev);
+	vdev->platform = IVPU_PLATFORM_SILICON;
 	ivpu_hw_wa_init(vdev);
 	ivpu_hw_timeouts_init(vdev);
 
-- 
2.25.1

