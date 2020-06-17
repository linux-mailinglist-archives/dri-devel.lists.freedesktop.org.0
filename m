Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7541FD26A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 18:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA336E9D9;
	Wed, 17 Jun 2020 16:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A006E985
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 16:40:58 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E915DB63;
 Wed, 17 Jun 2020 18:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592412054;
 bh=SJnT8pVhaBELy8zpwAkmyxptXO7AsweVI1JkdEeGxgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sXeLc8M5FFDFDE6d6lnn1R1eFlwqs8k0jN+9iV7woUkEMohYdJV8hs4Q32TEhyE/m
 rmWK7kISDGbK2IjaMmmaecuaTR5mu3OBbcyRAMc1zp7kaENOFXPm8iEWdQA8pRc/DD
 IZEjP2PNfFvRC2QQoMhXjoFzuAM+wkdVF4Kv9HZI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 20/22] drm: mxsfb: Merge mxsfb_set_pixel_fmt() and
 mxsfb_set_bus_fmt()
Date: Wed, 17 Jun 2020 19:40:13 +0300
Message-Id: <20200617164015.30448-21-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
References: <20200617164015.30448-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, robert.chiras@nxp.com, leonard.crestez@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mxsfb_set_pixel_fmt() and mxsfb_set_bus_fmt() functions both deal
with format configuration, are always called in a row from
mxsfb_crtc_mode_set_nofb(), and set fields from the LCDC_CTRL register.
This requires a read-modify-update cycle in mxsfb_set_bus_fmt(). Make
this more efficient by merging them together.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 47 +++++++++++++------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 9a43c98963cc..ed25ecac983b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -42,13 +42,23 @@ static u32 set_hsync_pulse_width(struct mxsfb_drm_private *mxsfb, u32 val)
 		mxsfb->devdata->hs_wdth_shift;
 }
 
-/* Setup the MXSFB registers for decoding the pixels out of the framebuffer */
-static void mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
+/*
+ * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
+ * outputting them on the bus.
+ */
+static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
 	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
+	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	u32 ctrl, ctrl1;
 
+	if (mxsfb->connector->display_info.num_bus_formats)
+		bus_format = mxsfb->connector->display_info.bus_formats[0];
+
+	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
+			     bus_format);
+
 	ctrl = CTRL_BYPASS_COUNT | CTRL_MASTER;
 
 	/* CTRL1 contains IRQ config and status bits, preserve those. */
@@ -69,40 +79,23 @@ static void mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
 		break;
 	}
 
-	writel(ctrl1, mxsfb->base + LCDC_CTRL1);
-	writel(ctrl, mxsfb->base + LCDC_CTRL);
-}
-
-static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
-{
-	struct drm_device *drm = mxsfb->drm;
-	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	u32 reg;
-
-	reg = readl(mxsfb->base + LCDC_CTRL);
-
-	if (mxsfb->connector->display_info.num_bus_formats)
-		bus_format = mxsfb->connector->display_info.bus_formats[0];
-
-	DRM_DEV_DEBUG_DRIVER(drm->dev, "Using bus_format: 0x%08X\n",
-			     bus_format);
-
-	reg &= ~CTRL_BUS_WIDTH_MASK;
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_RGB565_1X16:
-		reg |= CTRL_BUS_WIDTH_16;
+		ctrl |= CTRL_BUS_WIDTH_16;
 		break;
 	case MEDIA_BUS_FMT_RGB666_1X18:
-		reg |= CTRL_BUS_WIDTH_18;
+		ctrl |= CTRL_BUS_WIDTH_18;
 		break;
 	case MEDIA_BUS_FMT_RGB888_1X24:
-		reg |= CTRL_BUS_WIDTH_24;
+		ctrl |= CTRL_BUS_WIDTH_24;
 		break;
 	default:
 		dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
 		break;
 	}
-	writel(reg, mxsfb->base + LCDC_CTRL);
+
+	writel(ctrl1, mxsfb->base + LCDC_CTRL1);
+	writel(ctrl, mxsfb->base + LCDC_CTRL);
 }
 
 static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
@@ -213,7 +206,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
 	/* Clear the FIFOs */
 	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
 
-	mxsfb_set_pixel_fmt(mxsfb);
+	mxsfb_set_formats(mxsfb);
 
 	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
 
@@ -255,8 +248,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
 
 	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
 
-	mxsfb_set_bus_fmt(mxsfb);
-
 	/* Frame length in lines. */
 	writel(m->crtc_vtotal, mxsfb->base + LCDC_VDCTRL1);
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
