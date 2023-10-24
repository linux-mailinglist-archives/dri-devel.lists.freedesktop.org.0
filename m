Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE57D57DA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F6810E3F5;
	Tue, 24 Oct 2023 16:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A58610E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698164397; x=1729700397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mu/DKq1BJIR57qxEjZeNBmefOyY89UYWWz536HbsPL8=;
 b=XK4jvGPDERVB/bZti4RCLNJiiNOTo/oUA/e9Nq9IqLw+cij+KmLhDgA+
 sLWu913Mf+SqpUqjsiRQWhYnqzd09ThVYandtJh4QgUK75ncmuEuUa959
 sRs9JnpegLKB1pmc2DJkx7+nOAOLsi/N8JOOZ33rkKH5LRmReETW0bO1j
 TqahEhhWCyuY6qa1ehUJ4aXac1sjbAMKHRoS5PQPCMxQlDsY6vZzDLzKi
 +RBqjXQCjLnKf36z4PGVgc6D46f335fPtcWpk1ZVqlNwnxQqpSXtGfaky
 413g2I5AnebYo1MZ2ut7UcA0S4WkTrITRd4CK06LbFUeobDzj8VYCqwqq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453576084"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="453576084"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005700117"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="1005700117"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:19:54 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/ivpu/37xx: Fix missing VPUIP interrupts
Date: Tue, 24 Oct 2023 18:19:52 +0200
Message-Id: <20231024161952.759914-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Move sequence of masking and unmasking global interrupts from buttress
interrupt handler to generic one that handles both VPUIP and BTRS
interrupts. Unmasking global interrupts will re-trigger MSI for any
pending interrupts.

Lack of this sequence will cause the driver to miss any
VPUIP interrupt that comes after reading VPU_37XX_HOST_SS_ICB_STATUS_0
and before clearing all active interrupt sources.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index 7e4e87aa7602..5c0246b9e522 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -906,9 +906,6 @@ static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	if (status == 0)
 		return 0;
 
-	/* Disable global interrupt before handling local buttress interrupts */
-	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
-
 	if (REG_TEST_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
 		ivpu_dbg(vdev, IRQ, "FREQ_CHANGE irq: %08x",
 			 REGB_RD32(VPU_37XX_BUTTRESS_CURRENT_PLL));
@@ -940,9 +937,6 @@ static u32 ivpu_hw_37xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	else
 		REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, status);
 
-	/* Re-enable global interrupt */
-	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
-
 	if (schedule_recovery)
 		ivpu_pm_schedule_recovery(vdev);
 
@@ -954,9 +948,14 @@ static irqreturn_t ivpu_hw_37xx_irq_handler(int irq, void *ptr)
 	struct ivpu_device *vdev = ptr;
 	u32 ret_irqv, ret_irqb;
 
+	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
+
 	ret_irqv = ivpu_hw_37xx_irqv_handler(vdev, irq);
 	ret_irqb = ivpu_hw_37xx_irqb_handler(vdev, irq);
 
+	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
+	REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
+
 	return IRQ_RETVAL(ret_irqb | ret_irqv);
 }
 
-- 
2.25.1

