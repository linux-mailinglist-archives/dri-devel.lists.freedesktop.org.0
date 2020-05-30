Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D31E8D68
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 05:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E279D6E9AA;
	Sat, 30 May 2020 03:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F976E99F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 03:10:51 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83A6A2E86;
 Sat, 30 May 2020 05:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590808250;
 bh=Hj/6NZpRVdFV+yk1UNN9mns/kjR8HMc7xkYgMBBREGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ToaSLPoe54k9dIDlgEfhBmh9vgIn9UMer5nA7+ghq7RnzUqgXI92G/DMW1sToZ/bg
 e4tfn7BbqyBs2jX2NKLmgFrBYWE5rP6L5LCuUyTjFRnTOoq9JWxtOMK06VQHBHmoei
 o71awmmk8f+m7DqXe+lEy4MOJZAvH06/pPBlOC3A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/22] drm: mxsfb: Update internal IP version number for
 i.MX6SX
Date: Sat, 30 May 2020 06:10:10 +0300
Message-Id: <20200530031015.15492-18-laurent.pinchart@ideasonboard.com>
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

The LCDIF present in the i.MX6SX has extra features compared to
the i.MX28. It has however lost its IP version register, so no official
version number is known. Bump the version to MXSFB_V6 following the i.MX
version, in preparation for support for the additional features.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 7c9a041f5f6d..2316c12c5c42 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -35,6 +35,11 @@
 enum mxsfb_devtype {
 	MXSFB_V3,
 	MXSFB_V4,
+	/*
+	 * Starting at i.MX6 the hardware version register is gone, use the
+	 * i.MX family number as the version.
+	 */
+	MXSFB_V6,
 };
 
 static const struct mxsfb_devdata mxsfb_devdata[] = {
@@ -52,6 +57,13 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.hs_wdth_mask	= 0x3fff,
 		.hs_wdth_shift	= 18,
 	},
+	[MXSFB_V6] = {
+		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
+		.cur_buf	= LCDC_V4_CUR_BUF,
+		.next_buf	= LCDC_V4_NEXT_BUF,
+		.hs_wdth_mask	= 0x3fff,
+		.hs_wdth_shift	= 18,
+	},
 };
 
 void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
@@ -279,7 +291,7 @@ static struct drm_driver mxsfb_driver = {
 static const struct platform_device_id mxsfb_devtype[] = {
 	{ .name = "imx23-fb", .driver_data = MXSFB_V3, },
 	{ .name = "imx28-fb", .driver_data = MXSFB_V4, },
-	{ .name = "imx6sx-fb", .driver_data = MXSFB_V4, },
+	{ .name = "imx6sx-fb", .driver_data = MXSFB_V6, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mxsfb_devtype);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
