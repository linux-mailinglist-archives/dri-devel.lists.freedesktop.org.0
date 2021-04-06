Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C763B354CDD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E716E5D3;
	Tue,  6 Apr 2021 06:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD37F89F69;
 Tue,  6 Apr 2021 06:02:02 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 23:02:02 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 23:02:00 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 11:31:42 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 4C98121B31; Tue,  6 Apr 2021 11:31:41 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v1 3/3] drm/msm/disp/dpu1: add flags to indicate obsolete irqs
Date: Tue,  6 Apr 2021 11:31:35 +0530
Message-Id: <1617688895-26275-4-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
References: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some irqs which are applicable for sdm845 target are no
longer applicable for sc7180 and sc7280 targets. Add a
flag to indicate the irqs which are obsolete for a
particular target so that these irqs are skipped while
checking for matching irq lookup index.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c      |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 13 +++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  5 ++++-
 5 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index 84ea09d..cdec3fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -58,8 +58,8 @@ int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
 	if (!dpu_kms->hw_intr || !dpu_kms->hw_intr->ops.irq_idx_lookup)
 		return -EINVAL;
 
-	return dpu_kms->hw_intr->ops.irq_idx_lookup(intr_type,
-			instance_idx);
+	return dpu_kms->hw_intr->ops.irq_idx_lookup(dpu_kms->hw_intr,
+			intr_type, instance_idx);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ec27e6a..d4c381f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -56,6 +56,13 @@
 
 #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
 
+#define INTR_SC7180_MASK \
+	(BIT(DPU_IRQ_TYPE_PING_PONG_RD_PTR) |\
+	BIT(DPU_IRQ_TYPE_PING_PONG_WR_PTR) |\
+	BIT(DPU_IRQ_TYPE_PING_PONG_AUTO_REF) |\
+	BIT(DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK) |\
+	BIT(DPU_IRQ_TYPE_PING_PONG_TE_CHECK))
+
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
@@ -1077,6 +1084,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.dma_cfg = sdm845_regdma,
 		.perf = sc7180_perf_data,
 		.mdss_irqs = 0x3f,
+		.obsolete_irq = INTR_SC7180_MASK,
 	};
 }
 
@@ -1166,6 +1174,7 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif = sdm845_vbif,
 		.perf = sc7280_perf_data,
 		.mdss_irqs = 0x1c07,
+		.obsolete_irq = INTR_SC7180_MASK,
 	};
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0cf7210..4dfd8a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -723,6 +723,7 @@ struct dpu_perf_cfg {
  * @cursor_formats     Supported formats for cursor pipe
  * @vig_formats        Supported formats for vig pipe
  * @mdss_irqs:         Bitmap with the irqs supported by the target
+ * @obsolete_irq:       Irq types that are obsolete for a particular target
  */
 struct dpu_mdss_cfg {
 	u32 hwversion;
@@ -769,6 +770,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 
 	unsigned long mdss_irqs;
+	unsigned long obsolete_irq;
 };
 
 struct dpu_mdss_hw_cfg_handler {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a37928b..9c4d6b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -1327,14 +1327,15 @@ static const struct dpu_irq_type dpu_irq_map[] = {
 	{ DPU_IRQ_TYPE_RESERVED, 0, 0, 12},
 };
 
-static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
-		u32 instance_idx)
+static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
+	enum dpu_intr_type intr_type, u32 instance_idx)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(dpu_irq_map); i++) {
 		if (intr_type == dpu_irq_map[i].intr_type &&
-			instance_idx == dpu_irq_map[i].instance_idx)
+			instance_idx == dpu_irq_map[i].instance_idx &&
+			!(intr->obsolete_irq & BIT(dpu_irq_map[i].intr_type)))
 			return i;
 	}
 
@@ -1386,7 +1387,9 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				(irq_idx < end_idx) && irq_status;
 				irq_idx++)
 			if ((irq_status & dpu_irq_map[irq_idx].irq_mask) &&
-				(dpu_irq_map[irq_idx].reg_idx == reg_idx)) {
+				(dpu_irq_map[irq_idx].reg_idx == reg_idx) &&
+				!(intr->obsolete_irq &
+				BIT(dpu_irq_map[irq_idx].intr_type))) {
 				/*
 				 * Once a match on irq mask, perform a callback
 				 * to the given cbfunc. cbfunc will take care
@@ -1698,6 +1701,8 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	}
 
 	intr->irq_mask = m->mdss_irqs;
+	intr->obsolete_irq = m->obsolete_irq;
+
 	spin_lock_init(&intr->irq_lock);
 
 	return intr;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index fc9c986..5d6f9a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -83,11 +83,12 @@ struct dpu_hw_intr_ops {
 	/**
 	 * irq_idx_lookup - Lookup IRQ index on the HW interrupt type
 	 *                 Used for all irq related ops
+	 * @intr:		HW interrupt handle
 	 * @intr_type:		Interrupt type defined in dpu_intr_type
 	 * @instance_idx:	HW interrupt block instance
 	 * @return:		irq_idx or -EINVAL for lookup fail
 	 */
-	int (*irq_idx_lookup)(
+	int (*irq_idx_lookup)(struct dpu_hw_intr *intr,
 			enum dpu_intr_type intr_type,
 			u32 instance_idx);
 
@@ -179,6 +180,7 @@ struct dpu_hw_intr_ops {
  * @save_irq_status:  array of IRQ status reg storage created during init
  * @irq_idx_tbl_size: total number of irq_idx mapped in the hw_interrupts
  * @irq_lock:         spinlock for accessing IRQ resources
+ * @obsolete_irq:      irq types that are obsolete for a particular target
  */
 struct dpu_hw_intr {
 	struct dpu_hw_blk_reg_map hw;
@@ -188,6 +190,7 @@ struct dpu_hw_intr {
 	u32 irq_idx_tbl_size;
 	spinlock_t irq_lock;
 	unsigned long irq_mask;
+	unsigned long obsolete_irq;
 };
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
