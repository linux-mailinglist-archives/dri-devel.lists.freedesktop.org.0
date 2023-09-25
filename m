Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E07AD7BE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C010E241;
	Mon, 25 Sep 2023 12:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0745B10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695643920; x=1727179920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0wn9uVb4xB34+GZwVa3ukQ9ZFcf5Hb7d6BXpxesOdSY=;
 b=beoFgO6pY2cEsOqLOJtp0aUjJdwz692RuxvODbCNdWPZH8Cx47E++2TR
 deiUiSq9xh1/10Ge+IMqMEA9Zf9zUd6g0UF8Wr+O4tPo2A7+EQ0dcEs/9
 0XXc3WQhQcPiNdq0DKB1gmAz9idHS/A7/mfnnYKkRtnvh/b6FhEvV6h/B
 jlhYFpjnUBMImgQF6a9/PrGRHkUejVV4JaPJU4r/TchOQrgzamizGCOB9
 BCvueKr0by1eQ8eA/+nV2+h6y0PchlPUWJv0KIZyl9NlYxS5p6YoyzgPs
 FZTuo+u3MSWBtZBLVy/oRIvag3469evKEtm2avUbYaXfUsYgXu+K7J9Ob A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378503475"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378503475"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921949561"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="921949561"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:11:56 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] accel/ivpu/40xx: Fix missing VPUIP interrupts
Date: Mon, 25 Sep 2023 14:11:36 +0200
Message-Id: <20230925121137.872158-6-stanislaw.gruszka@linux.intel.com>
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

Move sequence of masking and unmasking global interrupts from buttress
interrupt handler to generic one that handles both VPUIP and BTRS
interrupts.

Unmasking global interrupts will re-trigger MSI for any pending interrupts.
Lack of this sequence can randomly cause to miss any VPUIP interrupt that
comes after reading VPU_40XX_HOST_SS_ICB_STATUS_0 and before clearing
all active interrupt sources.

Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 87b1085d44cf..8bdb59a45da6 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -1059,9 +1059,6 @@ static irqreturn_t ivpu_hw_40xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	if (status == 0)
 		return IRQ_NONE;
 
-	/* Disable global interrupt before handling local buttress interrupts */
-	REGB_WR32(VPU_40XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
-
 	if (REG_TEST_FLD(VPU_40XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE, status))
 		ivpu_dbg(vdev, IRQ, "FREQ_CHANGE");
 
@@ -1109,9 +1106,6 @@ static irqreturn_t ivpu_hw_40xx_irqb_handler(struct ivpu_device *vdev, int irq)
 	/* This must be done after interrupts are cleared at the source. */
 	REGB_WR32(VPU_40XX_BUTTRESS_INTERRUPT_STAT, status);
 
-	/* Re-enable global interrupt */
-	REGB_WR32(VPU_40XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
-
 	if (schedule_recovery)
 		ivpu_pm_schedule_recovery(vdev);
 
@@ -1123,9 +1117,14 @@ static irqreturn_t ivpu_hw_40xx_irq_handler(int irq, void *ptr)
 	struct ivpu_device *vdev = ptr;
 	irqreturn_t ret = IRQ_NONE;
 
+	REGB_WR32(VPU_40XX_BUTTRESS_GLOBAL_INT_MASK, 0x1);
+
 	ret |= ivpu_hw_40xx_irqv_handler(vdev, irq);
 	ret |= ivpu_hw_40xx_irqb_handler(vdev, irq);
 
+	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
+	REGB_WR32(VPU_40XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
+
 	if (ret & IRQ_WAKE_THREAD)
 		return IRQ_WAKE_THREAD;
 
-- 
2.25.1

