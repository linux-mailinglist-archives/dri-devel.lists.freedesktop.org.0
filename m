Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB75ED123
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 01:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F08810E19F;
	Tue, 27 Sep 2022 23:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B842E10E19D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 23:38:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C9F64F7;
 Wed, 28 Sep 2022 01:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664321907;
 bh=ZkrOJHiGWrNZ9XWOPCJJCN+DZUaTxS+nSIOoCGci8T4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e8wRA06pIeMpj5tO7q/1GDTi/LY6Gl1QHtD6h8NmvHEa9GCt+JEZZcd10rH9y+9A+
 AIYmY1K6V4SaXWEdMVrsoggUahh+xhtdjYQFCQLzHV6337epmzFAsCxRTDoQ/5sM3v
 cEj93snDncQcAaQ1xKSygq6MaJ+tZxxQN0kmN2Q8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Date: Wed, 28 Sep 2022 02:38:20 +0300
Message-Id: <20220927233821.8007-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
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

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1f22ea5896d5..ba84b51598b3 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -53,16 +53,16 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
 		       lcdif->base + LCDC_V8_DISP_PARA);
 
-		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
-		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
+		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
+		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
 		       lcdif->base + LCDC_V8_CSC0_COEF0);
-		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
+		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
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

