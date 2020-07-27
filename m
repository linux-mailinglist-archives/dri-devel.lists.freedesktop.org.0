Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE0222E3D5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F9C6E10A;
	Mon, 27 Jul 2020 02:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C3F6E057
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:14 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D586A1C;
 Mon, 27 Jul 2020 04:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815630;
 bh=megrPKgP00oEycHRh1RmgiRTQgRzcs8HJh/H7euSV1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hpYLg/zDURZvnSV9mLSv5lwO8HPY5z+4XHzJ7QrZD8uCMbnSSEHonMUPFnDTvvG98
 bIU7gmkNje7iFGFdOfD0X3c0AQL/J7RZ8D+ZdQHK6tfcR2P/HYlBKHjnIRQSWwoxYH
 cGY4LXX5hDQaD5jivDTOIp8dy5C8CF03giONkU8M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/22] drm: mxsfb: Clarify format and bus width
 configuration
Date: Mon, 27 Jul 2020 05:06:37 +0300
Message-Id: <20200727020654.8231-6-laurent.pinchart@ideasonboard.com>
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

Replace the convoluted way to set the format and bus width through
difficult to read macros with more explicit ones. Also remove the
outdated comment related to the limitations on bus width setting as it
doesn't apply anymore (the bus width can be specified through the
display_info bus format).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 17 +++++------------
 drivers/gpu/drm/mxsfb/mxsfb_regs.h | 17 ++++++++---------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index b69ace8bf526..8b6339316929 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -52,13 +52,6 @@ static int mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
 
 	ctrl = CTRL_BYPASS_COUNT | CTRL_MASTER;
 
-	/*
-	 * WARNING: The bus width, CTRL_SET_BUS_WIDTH(), is configured to
-	 * match the selected mode here. This differs from the original
-	 * MXSFB driver, which had the option to configure the bus width
-	 * to arbitrary value. This limitation should not pose an issue.
-	 */
-
 	/* CTRL1 contains IRQ config and status bits, preserve those. */
 	ctrl1 = readl(mxsfb->base + LCDC_CTRL1);
 	ctrl1 &= CTRL1_CUR_FRAME_DONE_IRQ_EN | CTRL1_CUR_FRAME_DONE_IRQ;
@@ -66,12 +59,12 @@ static int mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
 	switch (format) {
 	case DRM_FORMAT_RGB565:
 		dev_dbg(drm->dev, "Setting up RGB565 mode\n");
-		ctrl |= CTRL_SET_WORD_LENGTH(0);
+		ctrl |= CTRL_WORD_LENGTH_16;
 		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0xf);
 		break;
 	case DRM_FORMAT_XRGB8888:
 		dev_dbg(drm->dev, "Setting up XRGB8888 mode\n");
-		ctrl |= CTRL_SET_WORD_LENGTH(3);
+		ctrl |= CTRL_WORD_LENGTH_24;
 		/* Do not use packed pixels = one pixel per word instead. */
 		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0x7);
 		break;
@@ -104,13 +97,13 @@ static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
 	reg &= ~CTRL_BUS_WIDTH_MASK;
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_RGB565_1X16:
-		reg |= CTRL_SET_BUS_WIDTH(STMLCDIF_16BIT);
+		reg |= CTRL_BUS_WIDTH_16;
 		break;
 	case MEDIA_BUS_FMT_RGB666_1X18:
-		reg |= CTRL_SET_BUS_WIDTH(STMLCDIF_18BIT);
+		reg |= CTRL_BUS_WIDTH_18;
 		break;
 	case MEDIA_BUS_FMT_RGB888_1X24:
-		reg |= CTRL_SET_BUS_WIDTH(STMLCDIF_24BIT);
+		reg |= CTRL_BUS_WIDTH_24;
 		break;
 	default:
 		dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 78e6cb754712..8ebb52bb1b46 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -34,11 +34,15 @@
 #define CTRL_VSYNC_MODE			BIT(18)
 #define CTRL_DOTCLK_MODE		BIT(17)
 #define CTRL_DATA_SELECT		BIT(16)
-#define CTRL_SET_BUS_WIDTH(x)		(((x) & 0x3) << 10)
-#define CTRL_GET_BUS_WIDTH(x)		(((x) >> 10) & 0x3)
+#define CTRL_BUS_WIDTH_16		(0 << 10)
+#define CTRL_BUS_WIDTH_8		(1 << 10)
+#define CTRL_BUS_WIDTH_18		(2 << 10)
+#define CTRL_BUS_WIDTH_24		(3 << 10)
 #define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
-#define CTRL_SET_WORD_LENGTH(x)		(((x) & 0x3) << 8)
-#define CTRL_GET_WORD_LENGTH(x)		(((x) >> 8) & 0x3)
+#define CTRL_WORD_LENGTH_16		(0 << 8)
+#define CTRL_WORD_LENGTH_8		(1 << 8)
+#define CTRL_WORD_LENGTH_18		(2 << 8)
+#define CTRL_WORD_LENGTH_24		(3 << 8)
 #define CTRL_MASTER			BIT(5)
 #define CTRL_DF16			BIT(3)
 #define CTRL_DF18			BIT(2)
@@ -91,9 +95,4 @@
 #define MXSFB_MAX_XRES			0xffff
 #define MXSFB_MAX_YRES			0xffff
 
-#define STMLCDIF_8BIT  1 /* pixel data bus to the display is of 8 bit width */
-#define STMLCDIF_16BIT 0 /* pixel data bus to the display is of 16 bit width */
-#define STMLCDIF_18BIT 2 /* pixel data bus to the display is of 18 bit width */
-#define STMLCDIF_24BIT 3 /* pixel data bus to the display is of 24 bit width */
-
 #endif /* __MXSFB_REGS_H__ */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
