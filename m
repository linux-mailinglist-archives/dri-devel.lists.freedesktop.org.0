Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E2739E58
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B918910E52F;
	Thu, 22 Jun 2023 10:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8701910E53D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:20:24 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687429222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=we/dYtzaO/9WyQOcc/fbAM6+Lt9sVHN9sAiCELLzclY=;
 b=BpjE9TQacu2zz6ruqh1SVEhjx1wwxKQ0/61HFTk2ttEgzN+KML63kmb6/K/v6Yp61Ha4h+
 pKIgheNf4cHYSMvbnXZ0EppjCLkNR0BoOVybYBru8NvgSIQDKrqFp/1J6o4SmMgFpA2ClU
 okHj4fm+WSsbis/J9fUg3l9xl3rouUr48KmFycA5fG8bymxesEfrOaLpRp6qa6WX2eZHLd
 mECrCZC9NHCNzvI+Mjzyl3is7EiHuGgT9alUJhF/aEWgpS3+xSr1Eao2AlCGhSSFpUmUqk
 OL9G0Hw6njFdC54Bt5Dr1GzCvqklgWGIL4LX8q+s5Y8ypwb+AdZpxSd4euNCZg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D627C0008;
 Thu, 22 Jun 2023 10:20:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/panel: simple: Add support for Mitsubishi AA084XE01
Date: Thu, 22 Jun 2023 12:20:19 +0200
Message-Id: <20230622102019.3472053-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622102019.3472053-1-miquel.raynal@bootlin.com>
References: <20230622102019.3472053-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Weber <thomas.weber@corscience.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Weber <thomas.weber@corscience.de>

Add support for the Mitsubishi AA084XE01 panel which is an 8.4 inch XGA
TFT-LCD module for industrial use.

Link: https://www.mouser.fr/datasheet/2/274/aa084xe01_e-364171.pdf
Signed-off-by: Thomas Weber <thomas.weber@corscience.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v3:
* Fix connector type.

Changes in v2:
* Add connector type and bus flags.

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8a3b685c2fcc..cd2f8025aee0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2670,6 +2670,32 @@ static const struct panel_desc mitsubishi_aa070mc01 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 };
 
+static const struct drm_display_mode mitsubishi_aa084xe01_mode = {
+	.clock = 56234,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 24,
+	.hsync_end = 1024 + 24 + 63,
+	.htotal = 1024 + 24 + 63 + 1,
+	.vdisplay = 768,
+	.vsync_start = 768 + 3,
+	.vsync_end = 768 + 3 + 6,
+	.vtotal = 768 + 3 + 6 + 1,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+};
+
+static const struct panel_desc mitsubishi_aa084xe01 = {
+	.modes = &mitsubishi_aa084xe01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 1024,
+		.height = 768,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB565_1X16,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+};
+
 static const struct display_timing multi_inno_mi0700s4t_6_timing = {
 	.pixelclock = { 29000000, 33000000, 38000000 },
 	.hactive = { 800, 800, 800 },
@@ -4158,6 +4184,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "mitsubishi,aa070mc01-ca1",
 		.data = &mitsubishi_aa070mc01,
+	}, {
+		.compatible = "mitsubishi,aa084xe01",
+		.data = &mitsubishi_aa084xe01,
 	}, {
 		.compatible = "multi-inno,mi0700s4t-6",
 		.data = &multi_inno_mi0700s4t_6,
-- 
2.34.1

