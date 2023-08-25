Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BE7887B3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C973110E67C;
	Fri, 25 Aug 2023 12:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E2F10E682
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692967336; x=1724503336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IQCgha+hUo0d7o/BVAc+pQv/FIeaX8Y+EXwnIlRgn7w=;
 b=VP0B9wgxtaeJglsT/hfdYRkXvMpfZC2O/qJenYWKHE5pAxOEqghAN8+n
 auaWBhGbmXmXOXPXbMkK3V3UKaSKbyz2pgXpMn9cxJqNc4XFgenIflNOJ
 +A0unuRuIplGoDN37hL6dGjl1YPdU5p12IfUMBTgNwIDKjx7QztiI5ONF
 kndUtI3FmGMNt3pR3DVPi6cRJIx7E34tyTPLWK1LVGS8NwD1cCkqBYSE3
 KOnTX83os2VYZNYa8fh16a683gKvk/H6uOwEYB6YYXV5THQV29LPzc4lq
 p4UK+QeJ0OTT7y2ekVohfDxpU2O+y7Vm6YyjSmijY/YshzsBv32ssM5js A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354233885"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="354233885"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772470381"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="772470381"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 05:42:13 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] accel/ivpu: Move MMU register definitions to ivpu_mmu.c
Date: Fri, 25 Aug 2023 14:41:35 +0200
Message-Id: <20230825124135.4086628-10-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
References: <20230825124135.4086628-1-stanislaw.gruszka@linux.intel.com>
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

MMU registers are not platform specific so they should be defined
separate to platform regs.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h |  33 --------
 drivers/accel/ivpu/ivpu_mmu.c         | 117 +++++++++++++++++---------
 2 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx_reg.h b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
index 531a68c1cce8..4083beb5e9db 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_37xx_reg.h
@@ -191,39 +191,6 @@
 #define VPU_37XX_HOST_SS_WORKPOINT_CONFIG_MIRROR_FINAL_PLL_FREQ_MASK	GENMASK(15, 0)
 #define VPU_37XX_HOST_SS_WORKPOINT_CONFIG_MIRROR_CONFIG_ID_MASK		GENMASK(31, 16)
 
-#define VPU_37XX_HOST_MMU_IDR0						0x00200000u
-#define VPU_37XX_HOST_MMU_IDR1						0x00200004u
-#define VPU_37XX_HOST_MMU_IDR3						0x0020000cu
-#define VPU_37XX_HOST_MMU_IDR5						0x00200014u
-#define VPU_37XX_HOST_MMU_CR0						0x00200020u
-#define VPU_37XX_HOST_MMU_CR0ACK					0x00200024u
-#define VPU_37XX_HOST_MMU_CR1						0x00200028u
-#define VPU_37XX_HOST_MMU_CR2						0x0020002cu
-#define VPU_37XX_HOST_MMU_IRQ_CTRL					0x00200050u
-#define VPU_37XX_HOST_MMU_IRQ_CTRLACK					0x00200054u
-
-#define VPU_37XX_HOST_MMU_GERROR					0x00200060u
-#define VPU_37XX_HOST_MMU_GERROR_CMDQ_MASK				BIT_MASK(0)
-#define VPU_37XX_HOST_MMU_GERROR_EVTQ_ABT_MASK				BIT_MASK(2)
-#define VPU_37XX_HOST_MMU_GERROR_PRIQ_ABT_MASK				BIT_MASK(3)
-#define VPU_37XX_HOST_MMU_GERROR_MSI_CMDQ_ABT_MASK			BIT_MASK(4)
-#define VPU_37XX_HOST_MMU_GERROR_MSI_EVTQ_ABT_MASK			BIT_MASK(5)
-#define VPU_37XX_HOST_MMU_GERROR_MSI_PRIQ_ABT_MASK			BIT_MASK(6)
-#define VPU_37XX_HOST_MMU_GERROR_MSI_ABT_MASK				BIT_MASK(7)
-
-#define VPU_37XX_HOST_MMU_GERRORN					0x00200064u
-
-#define VPU_37XX_HOST_MMU_STRTAB_BASE					0x00200080u
-#define VPU_37XX_HOST_MMU_STRTAB_BASE_CFG				0x00200088u
-#define VPU_37XX_HOST_MMU_CMDQ_BASE					0x00200090u
-#define VPU_37XX_HOST_MMU_CMDQ_PROD					0x00200098u
-#define VPU_37XX_HOST_MMU_CMDQ_CONS					0x0020009cu
-#define VPU_37XX_HOST_MMU_EVTQ_BASE					0x002000a0u
-#define VPU_37XX_HOST_MMU_EVTQ_PROD					0x002000a8u
-#define VPU_37XX_HOST_MMU_EVTQ_CONS					0x002000acu
-#define VPU_37XX_HOST_MMU_EVTQ_PROD_SEC					(0x002000a8u + SZ_64K)
-#define VPU_37XX_HOST_MMU_EVTQ_CONS_SEC					(0x002000acu + SZ_64K)
-
 #define VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES				0x00360000u
 #define VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES_CACHE_OVERRIDE_EN_MASK	BIT_MASK(0)
 #define VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES_AWCACHE_OVERRIDE_MASK	BIT_MASK(1)
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index baefaf7bb3cb..473e1fc686a7 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -7,12 +7,45 @@
 #include <linux/highmem.h>
 
 #include "ivpu_drv.h"
-#include "ivpu_hw_37xx_reg.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
 #include "ivpu_pm.h"
 
+#define IVPU_MMU_REG_IDR0		      0x00200000u
+#define IVPU_MMU_REG_IDR1		      0x00200004u
+#define IVPU_MMU_REG_IDR3		      0x0020000cu
+#define IVPU_MMU_REG_IDR5		      0x00200014u
+#define IVPU_MMU_REG_CR0		      0x00200020u
+#define IVPU_MMU_REG_CR0ACK		      0x00200024u
+#define IVPU_MMU_REG_CR1		      0x00200028u
+#define IVPU_MMU_REG_CR2		      0x0020002cu
+#define IVPU_MMU_REG_IRQ_CTRL		      0x00200050u
+#define IVPU_MMU_REG_IRQ_CTRLACK	      0x00200054u
+
+#define IVPU_MMU_REG_GERROR		      0x00200060u
+#define IVPU_MMU_REG_GERROR_CMDQ_MASK	      BIT_MASK(0)
+#define IVPU_MMU_REG_GERROR_EVTQ_ABT_MASK     BIT_MASK(2)
+#define IVPU_MMU_REG_GERROR_PRIQ_ABT_MASK     BIT_MASK(3)
+#define IVPU_MMU_REG_GERROR_MSI_CMDQ_ABT_MASK BIT_MASK(4)
+#define IVPU_MMU_REG_GERROR_MSI_EVTQ_ABT_MASK BIT_MASK(5)
+#define IVPU_MMU_REG_GERROR_MSI_PRIQ_ABT_MASK BIT_MASK(6)
+#define IVPU_MMU_REG_GERROR_MSI_ABT_MASK      BIT_MASK(7)
+
+#define IVPU_MMU_REG_GERRORN		      0x00200064u
+
+#define IVPU_MMU_REG_STRTAB_BASE	      0x00200080u
+#define IVPU_MMU_REG_STRTAB_BASE_CFG	      0x00200088u
+#define IVPU_MMU_REG_CMDQ_BASE		      0x00200090u
+#define IVPU_MMU_REG_CMDQ_PROD		      0x00200098u
+#define IVPU_MMU_REG_CMDQ_CONS		      0x0020009cu
+#define IVPU_MMU_REG_EVTQ_BASE		      0x002000a0u
+#define IVPU_MMU_REG_EVTQ_PROD		      0x002000a8u
+#define IVPU_MMU_REG_EVTQ_CONS		      0x002000acu
+#define IVPU_MMU_REG_EVTQ_PROD_SEC	      (0x002000a8u + SZ_64K)
+#define IVPU_MMU_REG_EVTQ_CONS_SEC	      (0x002000acu + SZ_64K)
+#define IVPU_MMU_REG_CMDQ_CONS_ERR_MASK	      GENMASK(30, 24)
+
 #define IVPU_MMU_IDR0_REF		0x080f3e0f
 #define IVPU_MMU_IDR0_REF_SIMICS	0x080f3e1f
 #define IVPU_MMU_IDR1_REF		0x0e739d18
@@ -186,13 +219,13 @@
 #define IVPU_MMU_REG_TIMEOUT_US		(10 * USEC_PER_MSEC)
 #define IVPU_MMU_QUEUE_TIMEOUT_US	(100 * USEC_PER_MSEC)
 
-#define IVPU_MMU_GERROR_ERR_MASK ((REG_FLD(VPU_37XX_HOST_MMU_GERROR, CMDQ)) | \
-				  (REG_FLD(VPU_37XX_HOST_MMU_GERROR, EVTQ_ABT)) | \
-				  (REG_FLD(VPU_37XX_HOST_MMU_GERROR, PRIQ_ABT)) | \
-				  (REG_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_CMDQ_ABT)) | \
-				  (REG_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_EVTQ_ABT)) | \
-				  (REG_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_PRIQ_ABT)) | \
-				  (REG_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_ABT)))
+#define IVPU_MMU_GERROR_ERR_MASK ((REG_FLD(IVPU_MMU_REG_GERROR, CMDQ)) | \
+				  (REG_FLD(IVPU_MMU_REG_GERROR, EVTQ_ABT)) | \
+				  (REG_FLD(IVPU_MMU_REG_GERROR, PRIQ_ABT)) | \
+				  (REG_FLD(IVPU_MMU_REG_GERROR, MSI_CMDQ_ABT)) | \
+				  (REG_FLD(IVPU_MMU_REG_GERROR, MSI_EVTQ_ABT)) | \
+				  (REG_FLD(IVPU_MMU_REG_GERROR, MSI_PRIQ_ABT)) | \
+				  (REG_FLD(IVPU_MMU_REG_GERROR, MSI_ABT)))
 
 static char *ivpu_mmu_event_to_str(u32 cmd)
 {
@@ -250,15 +283,15 @@ static void ivpu_mmu_config_check(struct ivpu_device *vdev)
 	else
 		val_ref = IVPU_MMU_IDR0_REF;
 
-	val = REGV_RD32(VPU_37XX_HOST_MMU_IDR0);
+	val = REGV_RD32(IVPU_MMU_REG_IDR0);
 	if (val != val_ref)
 		ivpu_dbg(vdev, MMU, "IDR0 0x%x != IDR0_REF 0x%x\n", val, val_ref);
 
-	val = REGV_RD32(VPU_37XX_HOST_MMU_IDR1);
+	val = REGV_RD32(IVPU_MMU_REG_IDR1);
 	if (val != IVPU_MMU_IDR1_REF)
 		ivpu_dbg(vdev, MMU, "IDR1 0x%x != IDR1_REF 0x%x\n", val, IVPU_MMU_IDR1_REF);
 
-	val = REGV_RD32(VPU_37XX_HOST_MMU_IDR3);
+	val = REGV_RD32(IVPU_MMU_REG_IDR3);
 	if (val != IVPU_MMU_IDR3_REF)
 		ivpu_dbg(vdev, MMU, "IDR3 0x%x != IDR3_REF 0x%x\n", val, IVPU_MMU_IDR3_REF);
 
@@ -269,7 +302,7 @@ static void ivpu_mmu_config_check(struct ivpu_device *vdev)
 	else
 		val_ref = IVPU_MMU_IDR5_REF;
 
-	val = REGV_RD32(VPU_37XX_HOST_MMU_IDR5);
+	val = REGV_RD32(IVPU_MMU_REG_IDR5);
 	if (val != val_ref)
 		ivpu_dbg(vdev, MMU, "IDR5 0x%x != IDR5_REF 0x%x\n", val, val_ref);
 }
@@ -396,18 +429,18 @@ static int ivpu_mmu_irqs_setup(struct ivpu_device *vdev)
 	u32 irq_ctrl = IVPU_MMU_IRQ_EVTQ_EN | IVPU_MMU_IRQ_GERROR_EN;
 	int ret;
 
-	ret = ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_IRQ_CTRL, 0);
+	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_IRQ_CTRL, 0);
 	if (ret)
 		return ret;
 
-	return ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_IRQ_CTRL, irq_ctrl);
+	return ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_IRQ_CTRL, irq_ctrl);
 }
 
 static int ivpu_mmu_cmdq_wait_for_cons(struct ivpu_device *vdev)
 {
 	struct ivpu_mmu_queue *cmdq = &vdev->mmu->cmdq;
 
-	return REGV_POLL(VPU_37XX_HOST_MMU_CMDQ_CONS, cmdq->cons, (cmdq->prod == cmdq->cons),
+	return REGV_POLL(IVPU_MMU_REG_CMDQ_CONS, cmdq->cons, (cmdq->prod == cmdq->cons),
 			 IVPU_MMU_QUEUE_TIMEOUT_US);
 }
 
@@ -447,7 +480,7 @@ static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
 		return ret;
 
 	clflush_cache_range(q->base, IVPU_MMU_CMDQ_SIZE);
-	REGV_WR32(VPU_37XX_HOST_MMU_CMDQ_PROD, q->prod);
+	REGV_WR32(IVPU_MMU_REG_CMDQ_PROD, q->prod);
 
 	ret = ivpu_mmu_cmdq_wait_for_cons(vdev);
 	if (ret)
@@ -495,7 +528,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	mmu->evtq.prod = 0;
 	mmu->evtq.cons = 0;
 
-	ret = ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_CR0, 0);
+	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, 0);
 	if (ret)
 		return ret;
 
@@ -505,17 +538,17 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	      FIELD_PREP(IVPU_MMU_CR1_QUEUE_SH, IVPU_MMU_SH_ISH) |
 	      FIELD_PREP(IVPU_MMU_CR1_QUEUE_OC, IVPU_MMU_CACHE_WB) |
 	      FIELD_PREP(IVPU_MMU_CR1_QUEUE_IC, IVPU_MMU_CACHE_WB);
-	REGV_WR32(VPU_37XX_HOST_MMU_CR1, val);
+	REGV_WR32(IVPU_MMU_REG_CR1, val);
 
-	REGV_WR64(VPU_37XX_HOST_MMU_STRTAB_BASE, mmu->strtab.dma_q);
-	REGV_WR32(VPU_37XX_HOST_MMU_STRTAB_BASE_CFG, mmu->strtab.base_cfg);
+	REGV_WR64(IVPU_MMU_REG_STRTAB_BASE, mmu->strtab.dma_q);
+	REGV_WR32(IVPU_MMU_REG_STRTAB_BASE_CFG, mmu->strtab.base_cfg);
 
-	REGV_WR64(VPU_37XX_HOST_MMU_CMDQ_BASE, mmu->cmdq.dma_q);
-	REGV_WR32(VPU_37XX_HOST_MMU_CMDQ_PROD, 0);
-	REGV_WR32(VPU_37XX_HOST_MMU_CMDQ_CONS, 0);
+	REGV_WR64(IVPU_MMU_REG_CMDQ_BASE, mmu->cmdq.dma_q);
+	REGV_WR32(IVPU_MMU_REG_CMDQ_PROD, 0);
+	REGV_WR32(IVPU_MMU_REG_CMDQ_CONS, 0);
 
 	val = IVPU_MMU_CR0_CMDQEN;
-	ret = ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_CR0, val);
+	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
 	if (ret)
 		return ret;
 
@@ -531,17 +564,17 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	if (ret)
 		return ret;
 
-	REGV_WR64(VPU_37XX_HOST_MMU_EVTQ_BASE, mmu->evtq.dma_q);
-	REGV_WR32(VPU_37XX_HOST_MMU_EVTQ_PROD_SEC, 0);
-	REGV_WR32(VPU_37XX_HOST_MMU_EVTQ_CONS_SEC, 0);
+	REGV_WR64(IVPU_MMU_REG_EVTQ_BASE, mmu->evtq.dma_q);
+	REGV_WR32(IVPU_MMU_REG_EVTQ_PROD_SEC, 0);
+	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, 0);
 
 	val |= IVPU_MMU_CR0_EVTQEN;
-	ret = ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_CR0, val);
+	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
 	if (ret)
 		return ret;
 
 	val |= IVPU_MMU_CR0_ATSCHK;
-	ret = ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_CR0, val);
+	ret = ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
 	if (ret)
 		return ret;
 
@@ -550,7 +583,7 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 		return ret;
 
 	val |= IVPU_MMU_CR0_SMMUEN;
-	return ivpu_mmu_reg_write(vdev, VPU_37XX_HOST_MMU_CR0, val);
+	return ivpu_mmu_reg_write(vdev, IVPU_MMU_REG_CR0, val);
 }
 
 static void ivpu_mmu_strtab_link_cd(struct ivpu_device *vdev, u32 sid)
@@ -801,14 +834,14 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
 	u32 idx = IVPU_MMU_Q_IDX(evtq->cons);
 	u32 *evt = evtq->base + (idx * IVPU_MMU_EVTQ_CMD_SIZE);
 
-	evtq->prod = REGV_RD32(VPU_37XX_HOST_MMU_EVTQ_PROD_SEC);
+	evtq->prod = REGV_RD32(IVPU_MMU_REG_EVTQ_PROD_SEC);
 	if (!CIRC_CNT(IVPU_MMU_Q_IDX(evtq->prod), IVPU_MMU_Q_IDX(evtq->cons), IVPU_MMU_Q_COUNT))
 		return NULL;
 
 	clflush_cache_range(evt, IVPU_MMU_EVTQ_CMD_SIZE);
 
 	evtq->cons = (evtq->cons + 1) & IVPU_MMU_Q_WRAP_MASK;
-	REGV_WR32(VPU_37XX_HOST_MMU_EVTQ_CONS_SEC, evtq->cons);
+	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, evtq->cons);
 
 	return evt;
 }
@@ -841,35 +874,35 @@ void ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev)
 
 	ivpu_dbg(vdev, IRQ, "MMU error\n");
 
-	gerror_val = REGV_RD32(VPU_37XX_HOST_MMU_GERROR);
-	gerrorn_val = REGV_RD32(VPU_37XX_HOST_MMU_GERRORN);
+	gerror_val = REGV_RD32(IVPU_MMU_REG_GERROR);
+	gerrorn_val = REGV_RD32(IVPU_MMU_REG_GERRORN);
 
 	active = gerror_val ^ gerrorn_val;
 	if (!(active & IVPU_MMU_GERROR_ERR_MASK))
 		return;
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_ABT, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, MSI_ABT, active))
 		ivpu_warn_ratelimited(vdev, "MMU MSI ABT write aborted\n");
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_PRIQ_ABT, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, MSI_PRIQ_ABT, active))
 		ivpu_warn_ratelimited(vdev, "MMU PRIQ MSI ABT write aborted\n");
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_EVTQ_ABT, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, MSI_EVTQ_ABT, active))
 		ivpu_warn_ratelimited(vdev, "MMU EVTQ MSI ABT write aborted\n");
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, MSI_CMDQ_ABT, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, MSI_CMDQ_ABT, active))
 		ivpu_warn_ratelimited(vdev, "MMU CMDQ MSI ABT write aborted\n");
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, PRIQ_ABT, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, PRIQ_ABT, active))
 		ivpu_err_ratelimited(vdev, "MMU PRIQ write aborted\n");
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, EVTQ_ABT, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, EVTQ_ABT, active))
 		ivpu_err_ratelimited(vdev, "MMU EVTQ write aborted\n");
 
-	if (REG_TEST_FLD(VPU_37XX_HOST_MMU_GERROR, CMDQ, active))
+	if (REG_TEST_FLD(IVPU_MMU_REG_GERROR, CMDQ, active))
 		ivpu_err_ratelimited(vdev, "MMU CMDQ write aborted\n");
 
-	REGV_WR32(VPU_37XX_HOST_MMU_GERRORN, gerror_val);
+	REGV_WR32(IVPU_MMU_REG_GERRORN, gerror_val);
 }
 
 int ivpu_mmu_set_pgtable(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable)
-- 
2.25.1

