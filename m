Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BD21FF16
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83996E99A;
	Tue, 14 Jul 2020 20:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110AA6E99B;
 Tue, 14 Jul 2020 20:58:27 +0000 (UTC)
IronPort-SDR: 4qSM2RpXbc15cm1FyvEdHqxcYUplhaDTlXN6hskH0Gv1LT8Uh5f2htJkj3eGN7fBTxBJKTj2SD
 pTcDPUFMebDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444563"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444563"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:27 -0700
IronPort-SDR: m2g7q63NWG6N4A9LCLN6I3bfuK0bGu73D5c8o/R1OsmjYF1cKLbFvd70PZKi2aur1C0SPdC56G
 +nn7YQYT5UQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504126"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:27 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 18/59] drm/kmb: Part8 of Mipi Tx Initialization
Date: Tue, 14 Jul 2020 13:57:04 -0700
Message-Id: <1594760265-11618-19-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This initializes the interrupts for DSI. This is the final part of mipi
DSI initialization.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c  |  1 +
 drivers/gpu/drm/kmb/kmb_drv.h  | 30 +++++++++++-----
 drivers/gpu/drm/kmb/kmb_dsi.c  | 46 ++++++++++++++++++++++++
 drivers/gpu/drm/kmb/kmb_dsi.h  | 13 +++++++
 drivers/gpu/drm/kmb/kmb_regs.h | 81 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 163 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 224a7f8..19f78ba 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -58,6 +58,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	if (ret && ret != -ENODEV)
 		return ret;
 
+	spin_lock_init(&lcd->irq_lock);
 	ret = kmb_setup_crtc(drm);
 	if (ret < 0) {
 		DRM_ERROR("failed to create crtc\n");
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 3996c84..14bdfc8 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -12,14 +12,15 @@
 #define KMB_MAX_HEIGHT			16384	/*max height in pixels */
 
 struct kmb_drm_private {
-	struct drm_device drm;
-	void __iomem *mmio;
-	unsigned char n_layers;
-	struct clk *clk;
-	struct drm_fbdev_cma *fbdev;
-	struct drm_crtc crtc;
-	struct kmb_plane *plane;
-	struct drm_atomic_state *state;
+	struct drm_device		drm;
+	void __iomem			*mmio;
+	unsigned char			n_layers;
+	struct clk			*clk;
+	struct drm_fbdev_cma		*fbdev;
+	struct drm_crtc			crtc;
+	struct kmb_plane		*plane;
+	struct drm_atomic_state		*state;
+	spinlock_t			irq_lock;
 };
 
 static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
@@ -111,6 +112,19 @@ static inline void kmb_clr_bit_mipi(unsigned int reg, u32 offset)
 	kmb_write_mipi(reg, reg_val & (~(1 << offset)));
 }
 
+static inline void kmb_set_bitmask_mipi(unsigned int reg, u32 mask)
+{
+	u32 reg_val = kmb_read_mipi(reg);
+
+	kmb_write_mipi(reg, (reg_val | mask));
+}
+
+static inline void kmb_clr_bitmask_mipi(unsigned int reg, u32 mask)
+{
+	u32 reg_val = kmb_read_mipi(reg);
+
+	kmb_write_mipi(reg, (reg_val & (~mask)));
+}
 int kmb_setup_crtc(struct drm_device *dev);
 void kmb_set_scanout(struct kmb_drm_private *lcd);
 #endif /* __KMB_DRV_H__ */
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index f8ddb87..47456b2 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -5,6 +5,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
@@ -188,6 +189,11 @@ static mipi_hs_freq_range_cfg
 	{.default_bit_rate_mbps = 2500, .hsfreqrange_code = 0x49}
 };
 
+union mipi_irq_cfg int_cfg = {
+	.irq_cfg.frame_done = 1,
+	.irq_cfg.ctrl_error = 1,
+};
+
 static enum drm_mode_status
 kmb_dsi_mode_valid(struct drm_connector *connector,
 		   struct drm_display_mode *mode)
@@ -1174,6 +1180,43 @@ static u32 mipi_tx_init_dphy(struct mipi_ctrl_cfg *cfg)
 	return 0;
 }
 
+static void mipi_tx_init_irqs(union mipi_irq_cfg *cfg,
+	struct kmb_drm_private *dev_priv,
+	struct	mipi_tx_ctrl_cfg *tx_ctrl_cfg)
+{
+	unsigned long irqflags;
+	uint8_t vc;
+
+	/* clear all interrupts first */
+	/*local interrupts */
+	SET_MIPI_TX_HS_IRQ_CLEAR(MIPI_CTRL6, MIPI_TX_HS_IRQ_ALL);
+	/*global interrupts */
+	SET_MIPI_CTRL_IRQ_CLEAR0(MIPI_CTRL6, MIPI_HS_IRQ);
+	SET_MIPI_CTRL_IRQ_CLEAR0(MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
+	SET_MIPI_CTRL_IRQ_CLEAR1(MIPI_CTRL6, MIPI_HS_RX_EVENT_IRQ);
+
+	/*enable interrupts */
+	spin_lock_irqsave(&dev_priv->irq_lock, irqflags);
+	for (vc = 0; vc < MIPI_CTRL_VIRTUAL_CHANNELS; vc++) {
+		if (tx_ctrl_cfg->frames[vc] == NULL)
+			continue;
+		/*enable FRAME_DONE interrupt if VC is configured */
+		SET_HS_IRQ_ENABLE(MIPI_CTRL6,
+				MIPI_TX_HS_IRQ_FRAME_DONE_0 << vc);
+		break; /*only one vc for LCD interface */
+	}
+
+	/*enable user enabled interrupts */
+	if (cfg->irq_cfg.dphy_error)
+		SET_MIPI_CTRL_IRQ_ENABLE0(MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
+	if (cfg->irq_cfg.line_compare)
+		SET_HS_IRQ_ENABLE(MIPI_CTRL6, MIPI_TX_HS_IRQ_LINE_COMPARE);
+	if (cfg->irq_cfg.ctrl_error)
+		SET_HS_IRQ_ENABLE(MIPI_CTRL6, MIPI_TX_HS_IRQ_ERROR);
+
+	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
+}
+
 void kmb_dsi_init(struct drm_device *dev)
 {
 	struct kmb_dsi *kmb_dsi;
@@ -1219,4 +1262,7 @@ void kmb_dsi_init(struct drm_device *dev)
 
 	/*d-phy initialization */
 	mipi_tx_init_dphy(&mipi_tx_init_cfg);
+
+	/* irq initialization */
+	mipi_tx_init_irqs(&int_cfg, dev_priv, &mipi_tx_init_cfg.tx_ctrl_cfg);
 }
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 7db7f58..810c5c7 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -295,6 +295,19 @@ struct mipi_ctrl_cfg {
 	uint32_t data_if;	/*MIPI_IF_DMA or MIPI_IF_PARALLEL */
 	struct mipi_tx_ctrl_cfg tx_ctrl_cfg;
 };
+
+/*structure for storing user specified interrupts that are enabled */
+union mipi_irq_cfg {
+	uint8_t value;
+	struct {
+		uint8_t line_compare : 1;
+		uint8_t dma_event : 1;
+		uint8_t frame_done : 1;
+		uint8_t ctrl_error : 1;
+		uint8_t dphy_error : 1;
+	} irq_cfg;
+};
+
 void kmb_dsi_init(struct drm_device *dev);
 void kmb_plane_destroy(struct drm_plane *plane);
 
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index eec434e7..5d08ee4 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -501,6 +501,87 @@
 	kmb_write_bits_mipi(MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
 			(vc % 2)*16, 16, th)
 
+/* MIPI IRQ */
+#define MIPI_CTRL_IRQ_STATUS0				(0x00)
+#define   MIPI_DHY_ERR_IRQ				1
+#define   MIPI_HS_IRQ					13
+#define   MIPI_LP_EVENT_IRQ				25
+#define MIPI_CTRL_IRQ_STATUS1				(0x04)
+#define   MIPI_HS_RX_EVENT_IRQ				0
+#define MIPI_CTRL_IRQ_ENABLE0				(0x08)
+#define   SET_MIPI_CTRL_IRQ_ENABLE0(M, N)		\
+			kmb_set_bit_mipi(MIPI_CTRL_IRQ_ENABLE0,	M+N)
+#define MIPI_CTRL_IRQ_ENABLE1				(0x0c)
+#define MIPI_CTRL_IRQ_CLEAR0				(0x010)
+#define   SET_MIPI_CTRL_IRQ_CLEAR0(M, N)		\
+			kmb_set_bit_mipi(MIPI_CTRL_IRQ_CLEAR0, M+N)
+#define MIPI_CTRL_IRQ_CLEAR1				(0x014)
+#define   SET_MIPI_CTRL_IRQ_CLEAR1(M, N)		\
+			kmb_set_bit_mipi(MIPI_CTRL_IRQ_CLEAR1, M+N)
+#define MIPI_TX_HS_IRQ_STATUS				(0x01c)
+#define   MIPI_TX_HS_IRQ_STATUSm(M)			\
+			(MIPI_TX_HS_IRQ_STATUS + HS_OFFSET(M))
+#define   MIPI_TX_HS_IRQ_LINE_COMPARE			(1<<1)
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_0			(1<<2)
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_1			(1<<3)
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_2			(1<<4)
+#define   MIPI_TX_HS_IRQ_FRAME_DONE_3			(1<<5)
+#define   MIPI_TX_HS_IRQ_DMA_DONE_0			(1<<6)
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_0			(1<<7)
+#define   MIPI_TX_HS_IRQ_DMA_DONE_1			(1<<8)
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_1			(1<<9)
+#define   MIPI_TX_HS_IRQ_DMA_DONE_2			(1<<10)
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_2			(1<<11)
+#define   MIPI_TX_HS_IRQ_DMA_DONE_3			(1<<12)
+#define   MIPI_TX_HS_IRQ_DMA_IDLE_3			(1<<13)
+#define   MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW		(1<<14)
+#define   MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW		(1<<15)
+#define   MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY			(1<<16)
+#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL		(1<<17)
+#define   MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR	(1<<18)
+#define   MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR		(1<<20)
+#define   MIPI_TX_HS_IRQ_FRAME_DONE			\
+				(MIPI_TX_HS_IRQ_FRAME_DONE_0 | \
+				MIPI_TX_HS_IRQ_FRAME_DONE_1 | \
+				MIPI_TX_HS_IRQ_FRAME_DONE_2 | \
+				MIPI_TX_HS_IRQ_FRAME_DONE_3)
+
+#define MIPI_TX_HS_IRQ_DMA_DONE				\
+				(MIPI_TX_HS_IRQ_DMA_DONE_0 | \
+				MIPI_TX_HS_IRQ_DMA_DONE_1 | \
+				MIPI_TX_HS_IRQ_DMA_DONE_2 | \
+				MIPI_TX_HS_IRQ_DMA_DONE_3)
+
+#define MIPI_TX_HS_IRQ_DMA_IDLE				\
+				(MIPI_TX_HS_IRQ_DMA_IDLE_0 | \
+				MIPI_TX_HS_IRQ_DMA_IDLE_1 | \
+				MIPI_TX_HS_IRQ_DMA_IDLE_2 | \
+				MIPI_TX_HS_IRQ_DMA_IDLE_3)
+
+#define MIPI_TX_HS_IRQ_ERROR				\
+				(MIPI_TX_HS_IRQ_MC_FIFO_UNDERFLOW | \
+				MIPI_TX_HS_IRQ_MC_FIFO_OVERFLOW | \
+				MIPI_TX_HS_IRQ_LLP_FIFO_EMPTY | \
+				MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_FULL | \
+				MIPI_TX_HS_IRQ_LLP_REQUEST_QUEUE_ERROR | \
+				MIPI_TX_HS_IRQ_LLP_WORD_COUNT_ERROR)
+
+#define MIPI_TX_HS_IRQ_ALL				\
+				(MIPI_TX_HS_IRQ_FRAME_DONE | \
+				MIPI_TX_HS_IRQ_DMA_DONE | \
+				MIPI_TX_HS_IRQ_DMA_IDLE | \
+				MIPI_TX_HS_IRQ_LINE_COMPARE | \
+				MIPI_TX_HS_IRQ_ERROR)
+
+#define MIPI_TX_HS_IRQ_ENABLE				(0x020)
+#define   SET_HS_IRQ_ENABLE(M, val)			\
+			kmb_set_bitmask_mipi(MIPI_TX_HS_IRQ_ENABLE \
+			+ HS_OFFSET(M), val)
+#define MIPI_TX_HS_IRQ_CLEAR				(0x024)
+#define   SET_MIPI_TX_HS_IRQ_CLEAR(M, val)		\
+			kmb_set_bitmask_mipi(MIPI_TX_HS_IRQ_CLEAR \
+			+ HS_OFFSET(M), val)
+
 /* D-PHY regs */
 #define DPHY_ENABLE				(0x100)
 #define DPHY_INIT_CTRL0				(0x104)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
