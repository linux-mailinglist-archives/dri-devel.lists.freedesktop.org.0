Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAE183DA25
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C7F10F9F1;
	Fri, 26 Jan 2024 12:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3A610F9FD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272094; x=1737808094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=toVhYrINW8F1jlfCPqu07LDLj7VyDYR1RcfoR4qadW0=;
 b=lzsEKW4jFXbRgKthCl5vtPDiR+1R2M7AcPwF+7P/RekaMyXX7EUGULZJ
 iNo/gAcjiH0Jto0PFtSrOMiTVuxwobMTPywW/BPYT7fdbIouZvM9vEKFu
 T/I+/pSG1qWhIFEjorS2IqkP2xW/n/i93LtyjCSJAj55+5O3xYH2hiIcD
 QGtv5h/cpgZz62E4/FZsBrKKt2WRsBWybBIzRAzSuagQl0F78ON7ao0xC
 Cv5Xy7nzzz1hEnjR0KyTYv1nziFE+junvHEV/J56qeqlOCID0nEuwxz8B
 sEBe/hMydrEHxZOYea6buM10ZPByz0g3GtXldsF5HJbf6nWauKiWZreun Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9207454"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9207454"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2731921"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:28:13 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] accel/ivpu: Gracefully shutdown NPU before reset
Date: Fri, 26 Jan 2024 13:28:01 +0100
Message-ID: <20240126122804.2169129-5-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
References: <20240126122804.2169129-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Replace forceful disable of power domains with requests to disable
TOP NOC CPU_CTRL and HOSTIF_L2CACHE through QREQN.

In case of failure retry multiple times following HAS sequence of
checking both QACCEPN and QDENYN registers.

This fixes VPU hangs with PCODE released in January 2024 onwards.

Fixes: 3f7c0634926d ("accel/ivpu/37xx: Fix hangs related to MMIO reset")
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 122 +++++++++++++++---------------
 1 file changed, 60 insertions(+), 62 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 77accd029c4a..b1a3a19c8986 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -332,28 +332,6 @@ static int ivpu_boot_top_noc_qrenqn_check(struct ivpu_device *vdev, u32 exp_val)
 	return 0;
 }
 
-static int ivpu_boot_top_noc_qacceptn_check(struct ivpu_device *vdev, u32 exp_val)
-{
-	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN);
-
-	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, CPU_CTRL, exp_val, val) ||
-	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QACCEPTN, HOSTIF_L2CACHE, exp_val, val))
-		return -EIO;
-
-	return 0;
-}
-
-static int ivpu_boot_top_noc_qdeny_check(struct ivpu_device *vdev, u32 exp_val)
-{
-	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY);
-
-	if (!REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, CPU_CTRL, exp_val, val) ||
-	    !REG_TEST_FLD_NUM(VPU_37XX_TOP_NOC_QDENY, HOSTIF_L2CACHE, exp_val, val))
-		return -EIO;
-
-	return 0;
-}
-
 static int ivpu_boot_host_ss_configure(struct ivpu_device *vdev)
 {
 	ivpu_boot_host_ss_rst_clr_assert(vdev);
@@ -396,37 +374,68 @@ static int ivpu_boot_host_ss_axi_enable(struct ivpu_device *vdev)
 	return ivpu_boot_host_ss_axi_drive(vdev, true);
 }
 
-static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable)
+static int ivpu_boot_host_ss_top_noc_qacceptn_check(struct ivpu_device *vdev, bool enable, u32 mask)
+{
+	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QACCEPTN) & mask;
+
+	if (enable && val == mask)
+		return 0;
+
+	if (!enable && val == 0)
+		return 0;
+
+	ivpu_dbg(vdev, PM, "Failed qacceptn check 0x%x (mask 0x%x enable %d)\n", val, mask, enable);
+	return -EIO;
+}
+
+static int ivpu_boot_host_ss_top_noc_qdeny_check(struct ivpu_device *vdev, u32 mask)
+{
+	u32 val = REGV_RD32(VPU_37XX_TOP_NOC_QDENY) & mask;
+
+	if (val) {
+		ivpu_dbg(vdev, PM, "Failed qdeny check 0x%x (mask 0x%x)\n", val, mask);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable, u32 mask)
 {
-	int ret;
 	u32 val;
 
 	val = REGV_RD32(VPU_37XX_TOP_NOC_QREQN);
-	if (enable) {
-		val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
-		val = REG_SET_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
-	} else {
-		val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, CPU_CTRL, val);
-		val = REG_CLR_FLD(VPU_37XX_TOP_NOC_QREQN, HOSTIF_L2CACHE, val);
-	}
-	REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val);
+	if (enable)
+		REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val | mask);
+	else
+		REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val & ~mask);
 
-	ret = ivpu_boot_top_noc_qacceptn_check(vdev, enable ? 0x1 : 0x0);
-	if (ret) {
-		ivpu_err(vdev, "Failed qacceptn check: %d\n", ret);
-		return ret;
-	}
+	if (!ivpu_boot_host_ss_top_noc_qacceptn_check(vdev, enable, mask))
+		return 0;
 
-	ret = ivpu_boot_top_noc_qdeny_check(vdev, 0x0);
-	if (ret)
-		ivpu_err(vdev, "Failed qdeny check: %d\n", ret);
+	if (!enable && ivpu_boot_host_ss_top_noc_qdeny_check(vdev, mask))
+		REGV_WR32(VPU_37XX_TOP_NOC_QREQN, val | mask);
 
-	return ret;
+	return -EIO;
 }
 
 static int ivpu_boot_host_ss_top_noc_enable(struct ivpu_device *vdev)
 {
-	return ivpu_boot_host_ss_top_noc_drive(vdev, true);
+	return ivpu_boot_host_ss_top_noc_drive(vdev, true,
+					       VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK |
+					       VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK);
+}
+
+static int ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(struct ivpu_device *vdev)
+{
+	return ivpu_boot_host_ss_top_noc_drive(vdev, false,
+					       VPU_37XX_TOP_NOC_QREQN_CPU_CTRL_MASK);
+}
+
+static int ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(struct ivpu_device *vdev)
+{
+	return ivpu_boot_host_ss_top_noc_drive(vdev, false,
+					       VPU_37XX_TOP_NOC_QREQN_HOSTIF_L2CACHE_MASK);
 }
 
 static void ivpu_boot_pwr_island_trickle_drive(struct ivpu_device *vdev, bool enable)
@@ -510,16 +519,6 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
 	return ret;
 }
 
-static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
-{
-	ivpu_boot_dpu_active_drive(vdev, false);
-	ivpu_boot_pwr_island_isolation_drive(vdev, true);
-	ivpu_boot_pwr_island_trickle_drive(vdev, false);
-	ivpu_boot_pwr_island_drive(vdev, false);
-
-	return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
-}
-
 static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 {
 	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
@@ -618,19 +617,18 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 
 static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
 {
-	int ret = 0;
+	int retries = 100;
 
-	if (ivpu_boot_pwr_domain_disable(vdev)) {
-		ivpu_err(vdev, "Failed to disable power domain\n");
-		ret = -EIO;
-	}
+	while (ivpu_boot_host_ss_top_noc_cpu_ctrl_disable(vdev) && --retries > 0)
+		ivpu_warn(vdev, "Retrying to disable CPU control, retries left: %d\n", retries);
 
-	if (ivpu_pll_disable(vdev)) {
-		ivpu_err(vdev, "Failed to disable PLL\n");
-		ret = -EIO;
-	}
+	while (ivpu_boot_host_ss_top_noc_hostif_l2cache_disable(vdev) && --retries > 0)
+		ivpu_warn(vdev, "Retrying to disable HostIf L2 Cache, retries left: %d\n", retries);
 
-	return ret;
+	while (ivpu_pll_disable(vdev) && --retries > 0)
+		ivpu_warn(vdev, "Retrying to disable PLL, retries left: %d\n", retries);
+
+	return retries > 0 ? 0 : -EIO;
 }
 
 static int ivpu_hw_37xx_d0i3_enable(struct ivpu_device *vdev)
-- 
2.43.0

