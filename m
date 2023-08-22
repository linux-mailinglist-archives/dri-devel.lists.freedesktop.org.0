Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31964783D5D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 11:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864910E1CA;
	Tue, 22 Aug 2023 09:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5810010E1CA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692697966; x=1724233966;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fe1NOFTtzwZ8UL+f2RiejnXu4R442RBpnsFpCnfbWM0=;
 b=U49v9Mzda80wEmwS7mDznx8+ouMsfIW2cWt3hfWr9nUxlm0qGgzBHSJg
 QGOkPlffRMUip4IYgQgH5BLLe0aRowcgH1HaEQvFSyocrhQ0RP1bu5Zkl
 FfQd7Yc3PMpAOSa/09cmjiLp0OcNfaeHXNC1Xymb589G3MrrSk1PKiYnH
 bube8ve3LfB9mdNdh/Z0YyLoSDKoH5nxjy1V0xcDmDZLKoMX9Wecke4Gz
 cQGgrhlYAEkL3iEN1kUAPOVG7DEJ5o+8swJh8ldTUQrcvlYbfMyHF+nM/
 WKL5S/IfEfnTxfxmSxegHopUaymfghHoSXJbgJayjT9V79ghjqJ/bzb23 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376568762"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="376568762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 02:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826272501"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; d="scan'208";a="826272501"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 02:52:40 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] accel/ivpu/40xx: Fix buttress interrupt handling
Date: Tue, 22 Aug 2023 11:52:38 +0200
Message-Id: <20230822095238.3722815-1-stanislaw.gruszka@linux.intel.com>
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
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Buttress spec requires that the interrupt status is cleared at
the source first (before clearing MTL_BUTTRESS_INTERRUPT_STAT),
that implies that we have to mask out the global interrupt while
handling buttress interrupts.

Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 34626d66fa10..00c5dbbe6847 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -1046,7 +1046,8 @@ static irqreturn_t ivpu_hw_40xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	if (status == 0)
 		return IRQ_NONE;
 
-	REGB_WR32(VPU_40XX_BUTTRESS_INTERRUPT_STAT, status);
+	/* Disable global interrupt before handling local buttress interrupts */
+	REGB_WR32(VPU_40XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
 
 	if (REG_TEST_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
 		ivpu_dbg(vdev, IRQ, "FREQ_CHANGE");
@@ -1092,6 +1093,12 @@ static irqreturn_t ivpu_hw_40xx_irqb_handler(struct ivpu_device *vdev, int irq)
 		schedule_recovery = true;
 	}
 
+	/* This must be done after interrupts are cleared at the source. */
+	REGB_WR32(VPU_40XX_BUTTRESS_INTERRUPT_STAT, status);
+
+	/* Re-enable global interrupt */
+	REGB_WR32(VPU_40XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
+
 	if (schedule_recovery)
 		ivpu_pm_schedule_recovery(vdev);
 
-- 
2.25.1

