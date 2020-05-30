Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F001E8D6E
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055706E9B0;
	Sat, 30 May 2020 03:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE556E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:53 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C31A13183;
 Sat, 30 May 2020 05:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808251;
 bh=ZxNUbxQ98AyQbtSoq0lbU2xZn3WPcTFhuDpMDXYiR88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oTtUyVRIiVveY5ow5wNbKcFGov1dfE5CNlQRk9KerscivVnyv+NDCdjKdLI7Z18wB
 OWvm0QeaYqetoupjyg8Rb/sjVyQRMnNfD7GrjzEdJ70jiFIqal/W1dC+bA+tHDCNPZ
 q4YEy033BvXHLNIEj6MFcvpNox1aODobXo3uEAjo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/22] drm: mxsfb: Turn mxsfb_set_pixel_fmt() into a void
 function
Date: Sat, 30 May 2020 06:10:12 +0300
Message-Id: <20200530031015.15492-20-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
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

The mxsfb_set_pixel_fmt() function returns an error when the selected
pixel format is unsupported. This can never happen, as such errors are
caught by the DRM core. Remove the error check.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 640305fb1068..19b937b383cf 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -43,7 +43,7 @@ static u32 set_hsync_pulse_width(struct mxsfb_drm_private *mxsfb, u32 val)
 }
 
 /* Setup the MXSFB registers for decoding the pixels out of the framebuffer */
-static int mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
+static void mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_device *drm = mxsfb->drm;
 	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
@@ -67,15 +67,10 @@ static int mxsfb_set_pixel_fmt(struct mxsfb_drm_private *mxsfb)
 		/* Do not use packed pixels = one pixel per word instead. */
 		ctrl1 |= CTRL1_SET_BYTE_PACKAGING(0x7);
 		break;
-	default:
-		dev_err(drm->dev, "Unhandled pixel format %08x\n", format);
-		return -EINVAL;
 	}
 
 	writel(ctrl1, mxsfb->base + LCDC_CTRL1);
 	writel(ctrl, mxsfb->base + LCDC_CTRL);
-
-	return 0;
 }
 
 static void mxsfb_set_bus_fmt(struct mxsfb_drm_private *mxsfb)
@@ -218,9 +213,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
 	/* Clear the FIFOs */
 	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
 
-	err = mxsfb_set_pixel_fmt(mxsfb);
-	if (err)
-		return;
+	mxsfb_set_pixel_fmt(mxsfb);
 
 	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
