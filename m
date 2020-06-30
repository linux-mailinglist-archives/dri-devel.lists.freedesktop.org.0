Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B620FEEB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E546E393;
	Tue, 30 Jun 2020 21:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FDE6E317;
 Tue, 30 Jun 2020 21:28:43 +0000 (UTC)
IronPort-SDR: +5qBoyJqdSNGtgQOzjr7WmCBAWyioDm65at5KvgxATgvWJfq6urasZNw7xUinXK0hiYUdmA2nL
 6wnnmvS3B5UA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="144554742"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="144554742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:42 -0700
IronPort-SDR: 8UA/6K72vm2HMB6S2EvyAHco7oFUjKZu044uVZGHp9A3sbmpt6nA3s51DfRHOMu60BDfrww/rX
 VkKj3xQzrE0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066693"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:42 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 21/59] drm/kmb: IRQ handlers for LCD and mipi dsi
Date: Tue, 30 Jun 2020 14:27:33 -0700
Message-Id: <1593552491-23698-22-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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

Added handlers for lcd and mipi, it only finds and clears the interrupt
as of now, more functionality can be added as needed.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c  | 51 ++++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/kmb/kmb_drv.h  |  2 ++
 drivers/gpu/drm/kmb/kmb_dsi.c  | 37 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/kmb/kmb_dsi.h  |  1 +
 drivers/gpu/drm/kmb/kmb_regs.h | 35 +++++++++++++++++++++--------
 5 files changed, 108 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index d35f1b2..e5f4da1 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -57,7 +57,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	/*struct resource *res;*/
 	/*u32 version;*/
-	/*int irq_lcd, irq_mipi; */
+	int irq_lcd, irq_mipi;
 	int ret;
 
 	/* TBD - not sure if clock_get needs to be called here */
@@ -108,11 +108,29 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	dev_p->msscam_mmio = ioremap_cache(MSS_CAM_BASE_ADDR,
 			MSS_CAM_MMIO_SIZE);
 
-	/*TODO - register irqs here - section 17.3 in databook
-	 * lists LCD at 79 under MSS CPU - firmware has to redirect it to A53
-	 * May be 33 for LCD and 34 for MIPI? Will wait till firmware
-	 * finalizes the IRQ numbers for redirection
+	/* register irqs here - section 17.3 in databook
+	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
+	 * firmware has to redirect it to A53
 	 */
+	irq_lcd = platform_get_irq_byname(pdev, "irq_lcd");
+	if (irq_lcd < 0) {
+		DRM_ERROR("irq_lcd not found");
+		return irq_lcd;
+	}
+	pr_info("irq_lcd platform_get_irq = %d\n", irq_lcd);
+	ret = request_irq(irq_lcd, kmb_isr, IRQF_SHARED, "irq_lcd", dev_p);
+	dev_p->irq_lcd = irq_lcd;
+
+	irq_mipi = platform_get_irq_byname(pdev, "irq_mipi");
+	if (irq_mipi < 0) {
+		DRM_ERROR("irq_mipi not found");
+		return irq_mipi;
+	}
+	pr_info("irq_mipi platform_get_irq = %d\n", irq_mipi);
+	ret = request_irq(irq_mipi, kmb_isr, IRQF_SHARED, "irq_mipi", dev_p);
+	dev_p->irq_mipi = irq_mipi;
+
+
 
 /*TBD read and check for correct product version here */
 
@@ -161,9 +179,9 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 	drm->mode_config.funcs = &kmb_mode_config_funcs;
 }
 
-static irqreturn_t kmb_isr(int irq, void *arg)
+
+static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 {
-	struct drm_device *dev = (struct drm_device *)arg;
 	unsigned long status, val;
 
 	status = kmb_read_lcd(dev->dev_private, LCD_INT_STATUS);
@@ -192,10 +210,29 @@ static irqreturn_t kmb_isr(int irq, void *arg)
 			break;
 		}
 	}
+	return IRQ_HANDLED;
+}
 
+static irqreturn_t  handle_mipi_irq(struct drm_device *dev)
+{
+	mipi_tx_handle_irqs(dev->dev_private);
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t kmb_isr(int irq, void *arg)
+{
+	struct drm_device *dev = (struct drm_device *)arg;
+	struct kmb_drm_private *dev_p = dev->dev_private;
+	irqreturn_t ret = IRQ_NONE;
+
+	if (irq == dev_p->irq_lcd)
+		ret = handle_lcd_irq(dev);
+	else if (irq == dev_p->irq_mipi)
+		ret = handle_mipi_irq(dev);
+
+	return ret;
+}
+
 static void kmb_irq_reset(struct drm_device *drm)
 {
 	kmb_write_lcd(drm->dev_private, LCD_INT_CLEAR, 0xFFFF);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index ad5f214..dcaeb11 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -43,6 +43,8 @@ struct kmb_drm_private {
 	struct kmb_plane		*plane;
 	struct drm_atomic_state		*state;
 	spinlock_t			irq_lock;
+	int				irq_lcd;
+	int				irq_mipi;
 };
 
 static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4d2790f..684ddbc 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1234,7 +1234,7 @@ static void mipi_tx_init_irqs(struct kmb_drm_private *dev_p,
 	SET_MIPI_TX_HS_IRQ_CLEAR(dev_p, MIPI_CTRL6, MIPI_TX_HS_IRQ_ALL);
 	/*global interrupts */
 	SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6, MIPI_HS_IRQ);
-	SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
+	SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6, MIPI_DPHY_ERR_IRQ);
 	SET_MIPI_CTRL_IRQ_CLEAR1(dev_p, MIPI_CTRL6, MIPI_HS_RX_EVENT_IRQ);
 
 	/*enable interrupts */
@@ -1250,7 +1250,7 @@ static void mipi_tx_init_irqs(struct kmb_drm_private *dev_p,
 
 	/*enable user enabled interrupts */
 	if (cfg->irq_cfg.dphy_error)
-		SET_MIPI_CTRL_IRQ_ENABLE0(dev_p, MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
+		SET_MIPI_CTRL_IRQ_ENABLE0(dev_p, MIPI_CTRL6, MIPI_DPHY_ERR_IRQ);
 	if (cfg->irq_cfg.line_compare)
 		SET_HS_IRQ_ENABLE(dev_p, MIPI_CTRL6,
 				MIPI_TX_HS_IRQ_LINE_COMPARE);
@@ -1260,6 +1260,39 @@ static void mipi_tx_init_irqs(struct kmb_drm_private *dev_p,
 	spin_unlock_irqrestore(&dev_p->irq_lock, irqflags);
 }
 
+
+void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
+{
+	uint32_t irq_ctrl_stat_0, hs_stat, hs_enable;
+	uint32_t irq_ctrl_enabled_0;
+
+	irq_ctrl_stat_0 = MIPI_GET_IRQ_STAT0(dev_p);
+	irq_ctrl_enabled_0 = MIPI_GET_IRQ_ENABLED0(dev_p);
+	/*only service enabled interrupts */
+	irq_ctrl_stat_0 &= irq_ctrl_enabled_0;
+
+	if (irq_ctrl_stat_0 & MIPI_DPHY_ERR_MASK) {
+		if (irq_ctrl_stat_0 & ((1 << (MIPI_DPHY6 + 1))))
+			SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6,
+					MIPI_DPHY_ERR_IRQ);
+	} else if (irq_ctrl_stat_0 & MIPI_HS_IRQ_MASK) {
+		hs_stat = GET_MIPI_TX_HS_IRQ_STATUS(dev_p, MIPI_CTRL6);
+		hs_enable = GET_HS_IRQ_ENABLE(dev_p, MIPI_CTRL6);
+		hs_stat &= hs_enable;
+		/*look for errors */
+		if (hs_stat & MIPI_TX_HS_IRQ_ERROR) {
+			CLR_HS_IRQ_ENABLE(dev_p, MIPI_CTRL6,
+				(hs_stat & MIPI_TX_HS_IRQ_ERROR) |
+				MIPI_TX_HS_IRQ_DMA_DONE |
+				MIPI_TX_HS_IRQ_DMA_IDLE);
+		}
+		/* clear local, then global */
+		SET_MIPI_TX_HS_IRQ_CLEAR(dev_p, MIPI_CTRL6, hs_stat);
+		SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6, MIPI_HS_IRQ);
+	}
+
+}
+
 void kmb_dsi_init(struct drm_device *dev)
 {
 	struct kmb_dsi *kmb_dsi;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 7645d03..8f4e0b9 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -330,6 +330,7 @@ union mipi_irq_cfg {
 
 void kmb_dsi_init(struct drm_device *dev);
 void kmb_plane_destroy(struct drm_plane *plane);
+void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
 
 #define to_kmb_connector(x) container_of(x, struct kmb_connector, base)
 #define to_kmb_host(x) container_of(x, struct kmb_dsi_host, base)
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index cfe2cc1..5f7aff7 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -527,15 +527,25 @@
 
 /* MIPI IRQ */
 #define MIPI_CTRL_IRQ_STATUS0				(0x00)
-#define   MIPI_DHY_ERR_IRQ				1
+#define   MIPI_DPHY_ERR_IRQ				1
+#define   MIPI_DPHY_ERR_MASK				0x7FE /*bits 1-10 */
 #define   MIPI_HS_IRQ					13
+#define   MIPI_HS_IRQ_MASK				0x7FE000 /*bits 13-22 */
 #define   MIPI_LP_EVENT_IRQ				25
+#define   MIPI_GET_IRQ_STAT0(dev)		kmb_read_mipi(dev, \
+						MIPI_CTRL_IRQ_STATUS0)
 #define MIPI_CTRL_IRQ_STATUS1				(0x04)
 #define   MIPI_HS_RX_EVENT_IRQ				0
+#define   MIPI_GET_IRQ_STAT1(dev)		kmb_read_mipi(dev, \
+						MIPI_CTRL_IRQ_STATUS1)
 #define MIPI_CTRL_IRQ_ENABLE0				(0x08)
-#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)		\
-		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_ENABLE0, M+N)
+#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)	kmb_set_bit_mipi(dev, \
+						MIPI_CTRL_IRQ_ENABLE0, M+N)
+#define   MIPI_GET_IRQ_ENABLED0(dev)		kmb_read_mipi(dev, \
+						MIPI_CTRL_IRQ_ENABLE0)
 #define MIPI_CTRL_IRQ_ENABLE1				(0x0c)
+#define   MIPI_GET_IRQ_ENABLED1(dev)		kmb_read_mipi(dev, \
+						MIPI_CTRL_IRQ_ENABLE1)
 #define MIPI_CTRL_IRQ_CLEAR0				(0x010)
 #define   SET_MIPI_CTRL_IRQ_CLEAR0(dev, M, N)		\
 		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, M+N)
@@ -543,8 +553,10 @@
 #define   SET_MIPI_CTRL_IRQ_CLEAR1(dev, M, N)		\
 		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, M+N)
 #define MIPI_TX_HS_IRQ_STATUS				(0x01c)
-#define   MIPI_TX_HS_IRQ_STATUSm(M)			\
-			(MIPI_TX_HS_IRQ_STATUS + HS_OFFSET(M))
+#define   MIPI_TX_HS_IRQ_STATUSm(M)		(MIPI_TX_HS_IRQ_STATUS + \
+						HS_OFFSET(M))
+#define   GET_MIPI_TX_HS_IRQ_STATUS(dev, M)	kmb_read_mipi(dev, \
+						MIPI_TX_HS_IRQ_STATUSm(M))
 #define   MIPI_TX_HS_IRQ_LINE_COMPARE			(1<<1)
 #define   MIPI_TX_HS_IRQ_FRAME_DONE_0			(1<<2)
 #define   MIPI_TX_HS_IRQ_FRAME_DONE_1			(1<<3)
@@ -598,10 +610,15 @@
 				MIPI_TX_HS_IRQ_ERROR)
 
 #define MIPI_TX_HS_IRQ_ENABLE				(0x020)
-#define   SET_HS_IRQ_ENABLE(dev, M, val)			\
-			kmb_set_bitmask_mipi(dev, \
-			MIPI_TX_HS_IRQ_ENABLE \
-			+ HS_OFFSET(M), val)
+#define   SET_HS_IRQ_ENABLE(dev, M, val)	kmb_set_bitmask_mipi(dev, \
+						MIPI_TX_HS_IRQ_ENABLE \
+						+ HS_OFFSET(M), val)
+#define   CLR_HS_IRQ_ENABLE(dev, M, val)	kmb_clr_bitmask_mipi(dev, \
+						MIPI_TX_HS_IRQ_ENABLE \
+						+ HS_OFFSET(M), val)
+#define	  GET_HS_IRQ_ENABLE(dev, M)		kmb_read_mipi(dev, \
+						MIPI_TX_HS_IRQ_ENABLE \
+						+ HS_OFFSET(M))
 #define MIPI_TX_HS_IRQ_CLEAR				(0x024)
 #define   SET_MIPI_TX_HS_IRQ_CLEAR(dev, M, val)		\
 			kmb_set_bitmask_mipi(dev, \
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
