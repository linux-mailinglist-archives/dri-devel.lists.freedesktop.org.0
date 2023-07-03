Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B777456F7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 10:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8C410E1CC;
	Mon,  3 Jul 2023 08:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306D710E1D0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688371653; x=1719907653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E/qFl0YH5nzf6kZTABQl1Z+MOg1nrYvO1UsNt1K5PI0=;
 b=Qo/SJWCImzWKXMV0EQaequnXMv4VTSHk8j1fyA6BYnIJDRM7Dmnm624w
 e7cufSb+K6wllMBVduMK78g+rkRsXwucdBPoKtm7/xltA1aynwl5uc2wL
 yz8kMwvGOYSmIfs3dghteX5lKBmI5uDHAW1QxsfQVfx/pm1Emj0+txOY3
 MNlJJHXz+Vg7LbJIo9V22vNoqOWp8Vdw8IGHkUHu5M3lUmCXKHGw9BNPq
 Uk7OU9K6fxN98EI0vJvD02SMmk66mubNVdIGaFrdhuk5koqyhVzZFtnaA
 SzbyUV3O+NEtM/0eby9XUYckZdLnxctgXiHXz9EZCKrm29qvisNFVZTaS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="365392535"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="365392535"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 01:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="831726794"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="831726794"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 01:07:31 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] accel/ivpu: Clear specific interrupt status bits on C0
Date: Mon,  3 Jul 2023 10:07:25 +0200
Message-Id: <20230703080725.2065635-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
References: <20230703080725.2065635-1-stanislaw.gruszka@linux.intel.com>
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

MTL C0 stepping fixed issue related to butrress interrupt status clearing,
to clear an interrupt status it is required to write 1 to specific
status bit field. This allows to execute read, modify and write routine.

Writing 0 will not clear the interrupt and will cause interrupt storm.

Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
Cc: stable@vger.kernel.org # 6.3.x
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.h    |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 315180dd72ce..8fe8cda2e39d 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -75,6 +75,7 @@ struct ivpu_wa_table {
 	bool punit_disabled;
 	bool clear_runtime_mem;
 	bool d3hot_after_power_off;
+	bool interrupt_clear_with_0;
 };
 
 struct ivpu_hw_info;
diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index d3ba633daaa0..f1211e74017d 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -101,6 +101,9 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
 	vdev->wa.punit_disabled = ivpu_is_fpga(vdev);
 	vdev->wa.clear_runtime_mem = false;
 	vdev->wa.d3hot_after_power_off = true;
+
+	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_MTL && ivpu_revision(vdev) < 4)
+		vdev->wa.interrupt_clear_with_0 = true;
 }
 
 static void ivpu_hw_timeouts_init(struct ivpu_device *vdev)
@@ -962,12 +965,15 @@ static u32 ivpu_hw_mtl_irqb_handler(struct ivpu_device *vdev, int irq)
 		schedule_recovery = true;
 	}
 
-	/*
-	 * Clear local interrupt status by writing 0 to all bits.
-	 * This must be done after interrupts are cleared at the source.
-	 * Writing 1 triggers an interrupt, so we can't perform read update write.
-	 */
-	REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, 0x0);
+	/* This must be done after interrupts are cleared at the source. */
+	if (IVPU_WA(interrupt_clear_with_0))
+		/*
+		 * Writing 1 triggers an interrupt, so we can't perform read update write.
+		 * Clear local interrupt status by writing 0 to all bits.
+		 */
+		REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, 0x0);
+	else
+		REGB_WR32(MTL_BUTTRESS_INTERRUPT_STAT, status);
 
 	/* Re-enable global interrupt */
 	REGB_WR32(MTL_BUTTRESS_GLOBAL_INT_MASK, 0x0);
-- 
2.25.1

