Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2126C4614
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8410E8D6;
	Wed, 22 Mar 2023 09:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13F010E8D7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679476767; x=1711012767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zZByBdCiWaMNMJ5jxNBFD+ZSwre9zrL3gQDEoEhFdKc=;
 b=ih53auB/a1XVXPorGCBvyDM2S7WVB0H9EtUQOs7yr7sisYWf+AAGyciU
 DbHws91fTfzKsGVWv+5YL5EwY9szxW01dVgWlXmKKH9VXwEPOuF134xQo
 4wCdPtIoQ9vKLaBYRgvnyv94AKxriGIiDbnmWmMaBVh7NRB/2ESJ27cjD
 3W6Q18jQAX3dtdqbGA7i4YQUfqeiEp75Ka862TXp6+uMWEb8OIU4y/uW7
 Ox8gfyDFkQbI/q1uQd7QcbEiCuk5v0FF3YBdJhEgZeSAd6R/iYYkjsqK2
 U7Jb6I5tj9PLfNlXyPwuNLhFBDFPRJRMKrbCdBFhI2ytu7TfADNoDdmTb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366904325"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366904325"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="746229839"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="746229839"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 02:19:26 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] accel/ivpu: Fix power down sequence
Date: Wed, 22 Mar 2023 10:18:57 +0100
Message-Id: <20230322091900.1982453-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
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

Remove FPGA WA on power_down to skip checking for noc quiescent state.

Put VPU in reset before powering it down and skip manipulating
registers that are reset by the VPU reset.

This fixes power down errors there VPU is powered down just after VPU
is booted.

Co-developed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 37 ++------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index 62bfaa9081c4..70ca6de78060 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -403,11 +403,6 @@ static int ivpu_boot_host_ss_axi_enable(struct ivpu_device *vdev)
 	return ivpu_boot_host_ss_axi_drive(vdev, true);
 }
 
-static int ivpu_boot_host_ss_axi_disable(struct ivpu_device *vdev)
-{
-	return ivpu_boot_host_ss_axi_drive(vdev, false);
-}
-
 static int ivpu_boot_host_ss_top_noc_drive(struct ivpu_device *vdev, bool enable)
 {
 	int ret;
@@ -441,11 +436,6 @@ static int ivpu_boot_host_ss_top_noc_enable(struct ivpu_device *vdev)
 	return ivpu_boot_host_ss_top_noc_drive(vdev, true);
 }
 
-static int ivpu_boot_host_ss_top_noc_disable(struct ivpu_device *vdev)
-{
-	return ivpu_boot_host_ss_top_noc_drive(vdev, false);
-}
-
 static void ivpu_boot_pwr_island_trickle_drive(struct ivpu_device *vdev, bool enable)
 {
 	u32 val = REGV_RD32(MTL_VPU_HOST_SS_AON_PWR_ISLAND_TRICKLE_EN0);
@@ -504,16 +494,6 @@ static void ivpu_boot_dpu_active_drive(struct ivpu_device *vdev, bool enable)
 	REGV_WR32(MTL_VPU_HOST_SS_AON_DPU_ACTIVE, val);
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
 static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
 {
 	int ret;
@@ -797,21 +777,8 @@ static int ivpu_hw_mtl_power_down(struct ivpu_device *vdev)
 {
 	int ret = 0;
 
-	/* FPGA requires manual clearing of IP_Reset bit by enabling quiescent state */
-	if (ivpu_is_fpga(vdev)) {
-		if (ivpu_boot_host_ss_top_noc_disable(vdev)) {
-			ivpu_err(vdev, "Failed to disable TOP NOC\n");
-			ret = -EIO;
-		}
-
-		if (ivpu_boot_host_ss_axi_disable(vdev)) {
-			ivpu_err(vdev, "Failed to disable AXI\n");
-			ret = -EIO;
-		}
-	}
-
-	if (ivpu_boot_pwr_domain_disable(vdev)) {
-		ivpu_err(vdev, "Failed to disable power domain\n");
+	if (ivpu_hw_mtl_reset(vdev)) {
+		ivpu_err(vdev, "Failed to reset the VPU\n");
 		ret = -EIO;
 	}
 
-- 
2.25.1

