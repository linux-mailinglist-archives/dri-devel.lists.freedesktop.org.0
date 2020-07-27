Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6362E22E3DA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAD66E14D;
	Mon, 27 Jul 2020 02:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BC96E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:20 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C587325D4;
 Mon, 27 Jul 2020 04:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815638;
 bh=CBHStpysls3lp6dLfGjwPtcFLkvaQEeapNfa2Wyq3ic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QCSecLfEQG2ltNKUugLSM+jnBxNgEmuP8DD2WqBMWZNFDOCV+Hk7O3oAV2oq5sHNl
 JxhrEXtrtlhd8WMnQ+wvA9J0j7C4VXbw4hHNkMouKiEEM+jr3FtTQI+FKS5cyoIyrT
 1Pzjaw5jInzqUy6mrcmZ6FUo0ABli8PuvmCOAcmI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 13/22] drm: mxsfb: Don't touch AXI clock in IRQ context
Date: Mon, 27 Jul 2020 05:06:45 +0300
Message-Id: <20200727020654.8231-14-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
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
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  6 ++----
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 15 ++++-----------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 08b2b2735bc6..cac50fb4fc0f 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -232,7 +232,9 @@ static void mxsfb_irq_disable(struct drm_device *drm)
 {
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
 
+	mxsfb_enable_axi_clk(mxsfb);
 	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
+	mxsfb_disable_axi_clk(mxsfb);
 }
 
 static irqreturn_t mxsfb_irq_handler(int irq, void *data)
@@ -241,8 +243,6 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
 	u32 reg;
 
-	mxsfb_enable_axi_clk(mxsfb);
-
 	reg = readl(mxsfb->base + LCDC_CTRL1);
 
 	if (reg & CTRL1_CUR_FRAME_DONE_IRQ)
@@ -250,8 +250,6 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
 
-	mxsfb_disable_axi_clk(mxsfb);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 770546e67a8d..3e118848a083 100644
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
