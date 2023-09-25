Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F197AD7BC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F5E10E23C;
	Mon, 25 Sep 2023 12:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8796B10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695643912; x=1727179912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXFrgIbMv31VEOmKi4Aruzyfjl9nWroTlDdFDxICVlY=;
 b=f9lg75X60WPyqqKQitKY4Zpszszj6LEn9GNefiHzfJaU61hj/byMHDm2
 4hLuZBXPrNTxOozOAhiqa/GXBCBCTiPmjcIHsvC1UPbG3eOBbgPRegls/
 L9fgc7OmTyWtTYYQYIN5FrFFG0qmpL4+R6uprbkUtlOeTQX0U96kDqma+
 FVILqsigRhCuyQ9BnOSWTstp66twwqS7Yt9Yum1IXqqPguruqqF+qRODE
 6FsKbEk8ZZmGNkf9k8uvPIM5L9/dELNW52Aw/ax9K6z9LKd/AVJd86zr2
 TAErsnHbH3jZUOSzYBXeP4IPMpp6rcYQj8B8RVYFUsEDFddTT06O4FJyy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378503427"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378503427"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921949490"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="921949490"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:49 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] accel/ivpu/40xx: Ensure clock resource ownership Ack
 before Power-Up
Date: Mon, 25 Sep 2023 14:11:34 +0200
Message-Id: <20230925121137.872158-4-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
References: <20230925121137.872158-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

We need to wait for the CLOCK_RESOURCE_OWN_ACK bit to be set
after configuring the workpoint. This step ensures that the VPU
microcontroller clock is actively toggling and ready for operation.

Previously, we relied solely on the READY bit in the VPU_STATUS
register, which indicated the completion of the workpoint download.
However, this approach was insufficient, as the READY bit could be set
while the device was still running on a sideband clock until the PLL
locked. To guarantee that the PLL is locked and the device is running on
the main clock source, we now wait for the CLOCK_RESOURCE_OWN_ACK before
proceeding with the remainder of the power-up sequence.

Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c     | 14 ++++++++++++++
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 00c5dbbe6847..f4a251a58ca4 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -196,6 +196,14 @@ static int ivpu_pll_wait_for_status_ready(struct ivpu_device *vdev)
 	return REGB_POLL_FLD(VPU_40XX_BUTTRESS_VPU_STATUS, READY, 1, PLL_TIMEOUT_US);
 }
 
+static int ivpu_wait_for_clock_own_resource_ack(struct ivpu_device *vdev)
+{
+	if (ivpu_is_simics(vdev))
+		return 0;
+
+	return REGB_POLL_FLD(VPU_40XX_BUTTRESS_VPU_STATUS, CLOCK_RESOURCE_OWN_ACK, 1, TIMEOUT_US);
+}
+
 static void ivpu_pll_init_frequency_ratios(struct ivpu_device *vdev)
 {
 	struct ivpu_hw_info *hw = vdev->hw;
@@ -556,6 +564,12 @@ static int ivpu_boot_pwr_domain_enable(struct ivpu_device *vdev)
 {
 	int ret;
 
+	ret = ivpu_wait_for_clock_own_resource_ack(vdev);
+	if (ret) {
+		ivpu_err(vdev, "Timed out waiting for clock own resource ACK\n");
+		return ret;
+	}
+
 	ivpu_boot_pwr_island_trickle_drive(vdev, true);
 	ivpu_boot_pwr_island_drive(vdev, true);
 
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
index 5139cfe88532..ff4a5d4f5821 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
@@ -70,6 +70,8 @@
 #define VPU_40XX_BUTTRESS_VPU_STATUS_READY_MASK				BIT_MASK(0)
 #define VPU_40XX_BUTTRESS_VPU_STATUS_IDLE_MASK				BIT_MASK(1)
 #define VPU_40XX_BUTTRESS_VPU_STATUS_DUP_IDLE_MASK			BIT_MASK(2)
+#define VPU_40XX_BUTTRESS_VPU_STATUS_CLOCK_RESOURCE_OWN_ACK_MASK	BIT_MASK(6)
+#define VPU_40XX_BUTTRESS_VPU_STATUS_POWER_RESOURCE_OWN_ACK_MASK	BIT_MASK(7)
 #define VPU_40XX_BUTTRESS_VPU_STATUS_PERF_CLK_MASK			BIT_MASK(11)
 #define VPU_40XX_BUTTRESS_VPU_STATUS_DISABLE_CLK_RELINQUISH_MASK        BIT_MASK(12)
 
-- 
2.25.1

