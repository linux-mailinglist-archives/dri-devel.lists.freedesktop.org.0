Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E06C68EE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 13:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC33710E747;
	Thu, 23 Mar 2023 12:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204010E747
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679576127; x=1711112127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dEGQZTStBxhWNsIpqvhHkOcsSc84Z8jv7muS9IpzS0M=;
 b=d1y1A64n+e/kvxoJUD80yPos9rOzSNcFMyisnj7R3M7DifZvSOq8jlgL
 orkGbjn4pjzNJ+KrMUN/I/bsILrxY08fyKJBW6Hr4plaeRZN9sXyEvosA
 sqJ1sdFMZjqhDrxIbKjE9yG6vRh0593++794g/vcbxXFneGpItN21DECr
 BR9maD9IER03D7ICOO12cl8xK3VHKkShLzyg9eZBKcds6QP5n9dRDBTbQ
 HTfd0WtfO8IRUfPT4TXzD2muxauhaIU4d04kRmwhL8XAPc7S+xCQos/wf
 WEP8+AWCpUsDfT8WiISX4jKpKnEVq4ikWKzcByHHqtIPNjglq7q7lnOXq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336982544"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="336982544"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="793010830"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="793010830"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 05:55:25 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/8] accel/ivpu: Fix power down sequence
Date: Thu, 23 Mar 2023 13:55:00 +0100
Message-Id: <20230323125504.2586442-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
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

Remove FPGA workaround on power_down to skip checking for noc
quiescent state.

Put VPU in reset before powering it down and skip manipulating
registers that are reset by the VPU reset.

This fixes power down errors where VPU is powered down just after VPU
is booted.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Co-developed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
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

