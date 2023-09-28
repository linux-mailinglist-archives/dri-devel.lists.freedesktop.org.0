Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB357B1B3C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7F10E05D;
	Thu, 28 Sep 2023 11:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CFF10E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:36:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJm-0001rz-1h; Thu, 28 Sep 2023 13:36:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qlpJl-009Z8S-JD; Thu, 28 Sep 2023 13:36:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 2/8] drm: lcdif: don't clear unrelated bits in CTRLDESCL0_5
 when setting up format
Date: Thu, 28 Sep 2023 13:36:23 +0200
Message-Id: <20230928113629.103188-2-l.stach@pengutronix.de>
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

The CTRLDESCL0_5 register also holds other bits that are not related to the
format, which should not be overwritten when the format is set up. Use a
proper RMW access in lcdif_set_formats().

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v3: no changes
v2: new patch
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 40 +++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 07e343e01f3e..e277592e5fa5 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -166,6 +166,7 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 	const u32 format = plane_state->fb->format->format;
 	bool in_yuv = false;
 	bool out_yuv = false;
+	u32 ctrl_desc_5;
 
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_RGB565_1X16:
@@ -186,52 +187,49 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 		break;
 	}
 
+	ctrl_desc_5 = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5) &
+		      ~(CTRLDESCL0_5_BPP_MASK | CTRLDESCL0_5_YUV_FORMAT_MASK);
+
 	switch (format) {
 	/* RGB Formats */
 	case DRM_FORMAT_RGB565:
-		writel(CTRLDESCL0_5_BPP_16_RGB565,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_16_RGB565;
 		break;
 	case DRM_FORMAT_RGB888:
-		writel(CTRLDESCL0_5_BPP_24_RGB888,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_24_RGB888;
 		break;
 	case DRM_FORMAT_XRGB1555:
-		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_16_ARGB1555;
 		break;
 	case DRM_FORMAT_XRGB4444:
-		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_16_ARGB4444;
 		break;
 	case DRM_FORMAT_XBGR8888:
-		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_32_ABGR8888;
 		break;
 	case DRM_FORMAT_XRGB8888:
-		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_32_ARGB8888;
 		break;
 
 	/* YUV Formats */
 	case DRM_FORMAT_YUYV:
-		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_VY2UY1,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_YCbCr422 |
+			       CTRLDESCL0_5_YUV_FORMAT_VY2UY1;
 		in_yuv = true;
 		break;
 	case DRM_FORMAT_YVYU:
-		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_UY2VY1,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_YCbCr422 |
+			       CTRLDESCL0_5_YUV_FORMAT_UY2VY1;
 		in_yuv = true;
 		break;
 	case DRM_FORMAT_UYVY:
-		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2VY1U,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_YCbCr422 |
+			       CTRLDESCL0_5_YUV_FORMAT_Y2VY1U;
 		in_yuv = true;
 		break;
 	case DRM_FORMAT_VYUY:
-		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2UY1V,
-		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
+		ctrl_desc_5 |= CTRLDESCL0_5_BPP_YCbCr422 |
+			       CTRLDESCL0_5_YUV_FORMAT_Y2UY1V;
 		in_yuv = true;
 		break;
 
@@ -240,6 +238,8 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 		break;
 	}
 
+	writel(ctrl_desc_5, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
 	/*
 	 * The CSC differentiates between "YCbCr" and "YUV", but the reference
 	 * manual doesn't detail how they differ. Experiments showed that the
-- 
2.39.2

