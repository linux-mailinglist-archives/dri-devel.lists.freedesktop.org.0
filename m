Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E45ED24F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE13F10E1EA;
	Wed, 28 Sep 2022 00:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCF910E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:58:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72BE64D5;
 Wed, 28 Sep 2022 02:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664326698;
 bh=ZuGOSa8ZrpXXrrOEUoxFGSo75s2XHYQYMowDLLW3IRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qeeNT8ZMhxHzOrdPYh/B41ky55iQXe2uaQdbU7tX1mwqfy5XtDv4bgih371fe1rJr
 gI5HJ7+03H/DMR8l/q1c7NAbIBndPa7VZaUCsyMqwjTkk+LzhWfvANJe+lhQG3bOYd
 LaUdD3nsQxrQxlWSZdOw/8Z/nNt6fRJrL3sAAAcA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Date: Wed, 28 Sep 2022 03:58:11 +0300
Message-Id: <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Up to and including v1.3, HDMI supported limited quantization range only
for YCbCr. HDMI v1.4 introduced selectable quantization ranges, but this
features isn't supported in the dw-hdmi driver that is used in
conjunction with the LCDIF in the i.MX8MP. The HDMI YCbCr output is thus
always advertised in the AVI infoframe as limited range.

The LCDIF driver, on the other hand, configures the CSC to produce full
range YCbCr. This mismatch results in loss of details and incorrect
colours. Fix it by switching to limited range YCbCr.

The coefficients are copied from drivers/media/platforms/nxp/imx-pxp.c
for coherency, as the hardware is most likely identical.

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Use coefficients from imx-pxp.c
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1f22ea5896d5..c3622be0c587 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -53,16 +53,16 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
 		       lcdif->base + LCDC_V8_DISP_PARA);
 
-		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
-		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
+		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
+		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
 		       lcdif->base + LCDC_V8_CSC0_COEF0);
-		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
+		writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
 		       lcdif->base + LCDC_V8_CSC0_COEF1);
-		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
+		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
 		       lcdif->base + LCDC_V8_CSC0_COEF2);
-		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
+		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
 		       lcdif->base + LCDC_V8_CSC0_COEF3);
-		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
+		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
 		       lcdif->base + LCDC_V8_CSC0_COEF4);
 		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
 		       lcdif->base + LCDC_V8_CSC0_COEF5);
-- 
Regards,

Laurent Pinchart

