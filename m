Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351A7EC11D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 12:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E53E10E53E;
	Wed, 15 Nov 2023 11:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998510E53E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 11:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700046610; x=1731582610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JbxytaP6UMJBdMcT+5WHtuc9auoYKdTOaoPuPN1F2JU=;
 b=UxsF1mF2X/p93QOltTQ6lb7W/9EG+J8u2dyMiGAG+7wFncRB2MM40ge6
 tld9g9PBbRUzPc1UMpJPspF/WvvMsxeOSDRb2K9f+YPgHzKzikV+LdTTf
 0Lslf8L+bLx1UVoL24ZjkVXjbXmxpQqmCdwvy2VjNgBmOEPwk/og27ELv
 t0HHc51H6pheOrid5FNmXThMP7PaCBv2wugwtyweyQqS7c3t9BpXrtuyx
 WMLH84s7JQca54jDl38uHcar7k+a+L7jh7NBJH5c2UdF7f7KGBUeO0p6h
 M+191VWPlhwlv/MRCHgiz+vtRDIvQ3zgEbE+qjErGLs/FN5Zu0RMQUvt+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="388017727"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="388017727"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:10:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="714858957"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="714858957"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:10:06 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu/37xx: Fix hangs related to MMIO reset
Date: Wed, 15 Nov 2023 12:10:04 +0100
Message-ID: <20231115111004.1304092-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to call MMIO reset using VPU_37XX_BUTTRESS_VPU_IP_RESET
register. IP will be reset by FLR or by entering d0i3. Also IP reset
during power_up is not needed as the VPU is already in reset.

Removing MMIO reset improves stability as it a partial device reset
that is not safe in some corner cases.

This change also brings back ivpu_boot_pwr_domain_disable() that
helps to properly power down VPU when it is hung by a buggy workload.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Fixes: 828d63042aec ("accel/ivpu: Don't enter d0i3 during FLR")
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 46 +++++++++++++++----------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 5c0246b9e522..4ccf1994b97a 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -502,6 +502,16 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
 	return ret;
 }
 
+static int ivpu_boot_pwr_domain_disable(struct ivpu_device *vdev)
+{
+	ivpu_boot_dpu_active_drive(vdev, false);
+	ivpu_boot_pwr_island_isolation_drive(vdev, true);
+	ivpu_boot_pwr_island_trickle_drive(vdev, false);
+	ivpu_boot_pwr_island_drive(vdev, false);
+
+	return ivpu_boot_wait_for_pwr_island_status(vdev, 0x0);
+}
+
 static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 {
 	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
@@ -600,25 +610,17 @@ static int ivpu_hw_37xx_info_init(struct ivpu_device *vdev)
 
 static int ivpu_hw_37xx_reset(struct ivpu_device *vdev)
 {
-	int ret;
-	u32 val;
-
-	if (IVPU_WA(punit_disabled))
-		return 0;
+	int ret = 0;
 
-	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
-	if (ret) {
-		ivpu_err(vdev, "Timed out waiting for TRIGGER bit\n");
-		return ret;
+	if (ivpu_boot_pwr_domain_disable(vdev)) {
+		ivpu_err(vdev, "Failed to disable power domain\n");
+		ret = -EIO;
 	}
 
-	val = REGB_RD32(VPU_37XX_BUTTRESS_VPU_IP_RESET);
-	val = REG_SET_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, val);
-	REGB_WR32(VPU_37XX_BUTTRESS_VPU_IP_RESET, val);
-
-	ret = REGB_POLL_FLD(VPU_37XX_BUTTRESS_VPU_IP_RESET, TRIGGER, 0, TIMEOUT_US);
-	if (ret)
-		ivpu_err(vdev, "Timed out waiting for RESET completion\n");
+	if (ivpu_pll_disable(vdev)) {
+		ivpu_err(vdev, "Failed to disable PLL\n");
+		ret = -EIO;
+	}
 
 	return ret;
 }
@@ -651,10 +653,6 @@ static int ivpu_hw_37xx_power_up(struct ivpu_device *vdev)
 {
 	int ret;
 
-	ret = ivpu_hw_37xx_reset(vdev);
-	if (ret)
-		ivpu_warn(vdev, "Failed to reset HW: %d\n", ret);
-
 	ret = ivpu_hw_37xx_d0i3_disable(vdev);
 	if (ret)
 		ivpu_warn(vdev, "Failed to disable D0I3: %d\n", ret);
@@ -722,11 +720,11 @@ static int ivpu_hw_37xx_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
-	if (!ivpu_hw_37xx_is_idle(vdev) && ivpu_hw_37xx_reset(vdev))
-		ivpu_err(vdev, "Failed to reset the VPU\n");
+	if (!ivpu_hw_37xx_is_idle(vdev))
+		ivpu_warn(vdev, "VPU not idle during power down\n");
 
-	if (ivpu_pll_disable(vdev)) {
-		ivpu_err(vdev, "Failed to disable PLL\n");
+	if (ivpu_hw_37xx_reset(vdev)) {
+		ivpu_err(vdev, "Failed to reset VPU\n");
 		ret = -EIO;
 	}
 
-- 
2.42.0

