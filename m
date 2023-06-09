Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BFF729DDE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC210E154;
	Fri,  9 Jun 2023 15:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963B610E154
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:09:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 13E3DC901B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:48:54 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686322126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dIwmxhMNeJPYniz56BduZ/mi4nAQ772C6BEoUIsjyNU=;
 b=DrPdd6YkGPsyftVw1cT8zbkDImexJR8vD9HEufp4DQh0MQoZnB68szhj9e/jfSkJtQjrxP
 3T1+WyuFXGVo9SFuG8ihUkgyuKrU5wrkcRPlXES1D7o1zgtjNGVlimanCNSTY26f4kkpry
 sQeqR157xYyFC8FVfkMhxTSOn+Jo7Iqc/eclirXGIduET6tJL1y1rmcnbh02K+uLrtZdWg
 LoLxRDxBxP5oAD3u7XvQbWuZrLXBsmKxEDngrvY2/sMAkRa66Oe3qeVlPTiQuwDYKZ1cQ3
 KWTMj/RmSDDdXdcOpJUqkl0WsyadTwj0Lhv6tHH/tu5sbv/ERmquC/YNcanufA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F06CFF80E;
 Fri,  9 Jun 2023 14:48:44 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock polarity
Date: Fri,  9 Jun 2023 16:48:43 +0200
Message-Id: <20230609144843.851327-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the SoC host controller, the pixel clock can be:
* standard: data is launched on the rising edge
* inverted: data is launched on the falling edge

Some panels may need the inverted option to be used so let's support
this DRM flag.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Hello, this change was tested on a Sama5d36 based custom board with a
panel not behaving correctly if the pixel clock was not inverted.
Cheers, Miquèl

 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 58184cd6ab0b..cc5cf4c2faf7 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -68,7 +68,11 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
 	struct regmap *regmap = crtc->dc->hlcdc->regmap;
 	struct drm_display_mode *adj = &c->state->adjusted_mode;
+	struct drm_encoder *encoder = NULL, *en_iter;
+	struct drm_connector *connector = NULL;
 	struct atmel_hlcdc_crtc_state *state;
+	struct drm_device *ddev = c->dev;
+	struct drm_connector_list_iter iter;
 	unsigned long mode_rate;
 	struct videomode vm;
 	unsigned long prate;
@@ -76,6 +80,23 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 	unsigned int cfg = 0;
 	int div, ret;
 
+	/* get encoder from crtc */
+	drm_for_each_encoder(en_iter, ddev) {
+		if (en_iter->crtc == c) {
+			encoder = en_iter;
+			break;
+		}
+	}
+
+	if (encoder) {
+		/* Get the connector from encoder */
+		drm_connector_list_iter_begin(ddev, &iter);
+		drm_for_each_connector_iter(connector, &iter)
+			if (connector->encoder == encoder)
+				break;
+		drm_connector_list_iter_end(&iter);
+	}
+
 	ret = clk_prepare_enable(crtc->dc->hlcdc->sys_clk);
 	if (ret)
 		return;
@@ -134,6 +155,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 
 	cfg |= ATMEL_HLCDC_CLKDIV(div);
 
+	if (connector &&
+	    connector->display_info.bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		cfg |= ATMEL_HLCDC_CLKPOL;
+
 	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(0), mask, cfg);
 
 	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
-- 
2.34.1

