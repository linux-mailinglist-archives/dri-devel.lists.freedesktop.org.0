Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3E7B1B47
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B0910E626;
	Thu, 28 Sep 2023 11:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A326B10E623
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:36:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJm-0001s0-1z; Thu, 28 Sep 2023 13:36:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJl-009Z8S-KS; Thu, 28 Sep 2023 13:36:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 3/8] drm: lcdif: enable DMA before display
Date: Thu, 28 Sep 2023 13:36:24 +0200
Message-Id: <20230928113629.103188-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113629.103188-1-l.stach@pengutronix.de>
References: <20230928113629.103188-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise the DMA enable races with the fetch start, which causes
wrong or no data to be scanned out on the first frame. Also there
is no point in waiting for the DMA disable when the controller is
going to shut down. Simply disable the display first so no further
fetches are triggered and then shut down DMA.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3: new patch
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index e277592e5fa5..6a292f4b332b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -358,34 +358,27 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
 	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
 	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
 
-	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
-	reg |= DISP_PARA_DISP_ON;
-	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
-
 	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
 	reg |= CTRLDESCL0_5_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
+	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
+	reg |= DISP_PARA_DISP_ON;
+	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
 }
 
 static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
 {
 	u32 reg;
-	int ret;
-
-	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
-	reg &= ~CTRLDESCL0_5_EN;
-	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
-
-	ret = readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
-				 reg, !(reg & CTRLDESCL0_5_EN),
-				 0, 36000);	/* Wait ~2 frame times max */
-	if (ret)
-		drm_err(lcdif->drm, "Failed to disable controller!\n");
 
 	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
 	reg &= ~DISP_PARA_DISP_ON;
 	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
 
+	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
+	reg &= ~CTRLDESCL0_5_EN;
+	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
 	/* Disable FIFO Panic NoC priority booster. */
 	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D1);
 }
-- 
2.39.2

