Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A117E957
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 20:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7034E6E56D;
	Mon,  9 Mar 2020 19:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658356E53C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 19:53:14 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 412F3428C;
 Mon,  9 Mar 2020 20:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583783591;
 bh=LRZc4rVZWA1S2QkmLx4CUJ2VjsjeMlvfX1b7KBtSirM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RrclgFk5fFRFREIgpHB0/yfNMOhuhXkJOU1pRDt7sL3XaX7beWwCoQ5Cgei0fWEho
 3hEmprR49Qbi8SUC5tRk85vjLFxu7BpsBw+7fAGD4Ugmt7kENvpsz/711FQlMyXXH7
 /0pYLvNlE6fp+3+qrSdp9ewYA19Jye3SZTN7a6Ys=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/21] drm: mxsfb: Don't touch AXI clock in IRQ context
Date: Mon,  9 Mar 2020 21:52:08 +0200
Message-Id: <20200309195216.31042-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver attempts agressive power management by enabling and disabling
the AXI clock around register accesses. This results in attempts to
enable and disable the clock in the IRQ handler, which is a no-go as
preparing or unpreparing the clock may sleep.

On the other hand, the driver enables the AXI clock when enabling the
CRTC and keeps it enabled until the CRTC is disabled. This is correct,
and renders the power management attempt pointless, as interrupts are
not supposed to occur when the CRTC is off.

The same reasoning can be applied to the CRTC .enable_vblank() and
.disable_vblank() that are not supposed to be called when the CRTC off
and thus don't require manual handling of the AXI clock. Furthermore,
vblank handling is never enabled, which results in the vblank enable and
disable handlers never being called.

To fix this, remove the manual clock handling in the IRQ, the CRTC
.enable_vblank() and .disable_vblank() handlers and the plane
.atomic_update() handler. We however need to handle the clock manually
in mxsfb_irq_disable() as is calls .disable_vblank() manually and is
used both at probe and remove time.

The clock disabling is also moved to the last step of the
mxsfb_crtc_atomic_disable() function, to prepare for enabling vblank
handling.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  6 ++----
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 15 ++++-----------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index a8da92976d13..e324bd2a63a5 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -231,7 +231,9 @@ static void mxsfb_irq_disable(struct drm_device *drm)
 {
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
 
+	mxsfb_enable_axi_clk(mxsfb);
 	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
+	mxsfb_disable_axi_clk(mxsfb);
 }
 
 static irqreturn_t mxsfb_irq_handler(int irq, void *data)
@@ -240,8 +242,6 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
 	u32 reg;
 
-	mxsfb_enable_axi_clk(mxsfb);
-
 	reg = readl(mxsfb->base + LCDC_CTRL1);
 
 	if (reg & CTRL1_CUR_FRAME_DONE_IRQ)
@@ -249,8 +249,6 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
 
-	mxsfb_disable_axi_clk(mxsfb);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index ebe0785694cb..ac2696c8483d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -344,9 +344,6 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_pending_vblank_event *event;
 
 	mxsfb_disable_controller(mxsfb);
-	mxsfb_disable_axi_clk(mxsfb);
-
-	pm_runtime_put_sync(drm->dev);
 
 	spin_lock_irq(&drm->event_lock);
 	event = crtc->state->event;
@@ -355,6 +352,9 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 		drm_crtc_send_vblank_event(crtc, event);
 	}
 	spin_unlock_irq(&drm->event_lock);
+
+	mxsfb_disable_axi_clk(mxsfb);
+	pm_runtime_put_sync(drm->dev);
 }
 
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
@@ -362,10 +362,8 @@ static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 
 	/* Clear and enable VBLANK IRQ */
-	mxsfb_enable_axi_clk(mxsfb);
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
 	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_SET);
-	mxsfb_disable_axi_clk(mxsfb);
 
 	return 0;
 }
@@ -375,10 +373,8 @@ static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 
 	/* Disable and clear VBLANK IRQ */
-	mxsfb_enable_axi_clk(mxsfb);
 	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-	mxsfb_disable_axi_clk(mxsfb);
 }
 
 static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
@@ -433,11 +429,8 @@ static void mxsfb_plane_atomic_update(struct drm_plane *plane,
 	dma_addr_t paddr;
 
 	paddr = mxsfb_get_fb_paddr(mxsfb);
-	if (paddr) {
-		mxsfb_enable_axi_clk(mxsfb);
+	if (paddr)
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
-		mxsfb_disable_axi_clk(mxsfb);
-	}
 }
 
 static const struct drm_plane_helper_funcs mxsfb_plane_helper_funcs = {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
