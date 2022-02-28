Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5A4C6035
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49FD10E229;
	Mon, 28 Feb 2022 00:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACE210E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:43 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F2BE783A78;
 Mon, 28 Feb 2022 01:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009202;
 bh=lqFSO4QFcc91D5/Q9J1sWwC4sikFfHQ7hvvSYXappVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xdC9yEqBGrrcexqbz5Z1EP5JKNGat7S2H+Y9ba7Oxj02jgrA1ubJwwaC6YA6IcxPD
 5sxgbbiklmd1edwanc8GjD8K2NFi+PSUsQQijqptCJGneF2JPDWCQa0M9RBg1cA/2V
 JaiCOA2ApM4vbVjVIW6QHddL4ix+CutoZPRqErMd9QRt3DNRZBlVqfcDEMaNC1H9Th
 AaGQ6+to92AuQGvgPylNnBqxZ1mb+4uOVSvfM25jhRw9JRyWNrQ6hCawUI794QNVDr
 QWXL/svy2pnowm9pJZEEBB1NTMPI4SxSNVRQbA7Z36GGO6h8RqpfLKimOEf0ehxKi8
 jpOTIfxTp5Few==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm: mxsfb: Simplify LCDIF IRQ handling
Date: Mon, 28 Feb 2022 01:45:59 +0100
Message-Id: <20220228004605.367040-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The call to drm_crtc_vblank_off(&lcdif->crtc); disables IRQ generation
from the LCDIF block already and this is called in mxsfb_load() before
request_irq(), so explicitly disabling IRQ using custom function like
mxsfb_irq_disable() is not needed, remove it. The request_irq() call
would return -ENOTCONN if IRQ is IRQ_NOTCONNECTED already, so remove
the unnecessary check. Finally, remove both mxsfb_irq_install() and
mxsfb_irq_uninstall() as well, since they are no longer useful.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 38 +++++++------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index bb15e32d8a014..11298df50917c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -156,33 +156,6 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void mxsfb_irq_disable(struct drm_device *drm)
-{
-	struct mxsfb_drm_private *mxsfb = drm->dev_private;
-
-	/* Disable and clear VBLANK IRQ */
-	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-}
-
-static int mxsfb_irq_install(struct drm_device *dev, int irq)
-{
-	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
-
-	mxsfb_irq_disable(dev);
-
-	return request_irq(irq, mxsfb_irq_handler, 0,  dev->driver->name, dev);
-}
-
-static void mxsfb_irq_uninstall(struct drm_device *dev)
-{
-	struct mxsfb_drm_private *mxsfb = dev->dev_private;
-
-	mxsfb_irq_disable(dev);
-	free_irq(mxsfb->irq, dev);
-}
-
 static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
@@ -261,7 +234,8 @@ static int mxsfb_load(struct drm_device *drm,
 		return ret;
 	mxsfb->irq = ret;
 
-	ret = mxsfb_irq_install(drm, mxsfb->irq);
+	ret = request_irq(mxsfb->irq, mxsfb_irq_handler, 0,
+			  drm->driver->name, drm);
 	if (ret < 0) {
 		dev_err(drm->dev, "Failed to install IRQ handler\n");
 		return ret;
@@ -278,16 +252,20 @@ static int mxsfb_load(struct drm_device *drm,
 
 static void mxsfb_unload(struct drm_device *drm)
 {
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+
 	pm_runtime_get_sync(drm->dev);
 
+	drm_crtc_vblank_off(&mxsfb->crtc);
+
 	drm_kms_helper_poll_fini(drm);
 	drm_mode_config_cleanup(drm);
 
-	mxsfb_irq_uninstall(drm);
-
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
+	free_irq(mxsfb->irq, drm->dev);
+
 	drm->dev_private = NULL;
 }
 
-- 
2.34.1

