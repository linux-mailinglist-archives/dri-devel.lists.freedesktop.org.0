Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CC729D9D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5C10E6BD;
	Fri,  9 Jun 2023 15:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189DA10E6C1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:59:57 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686322796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nq6EroddWpsFxHMt68/nfoMOdKtHAf27aF2fFd7Umk4=;
 b=gEpvYVFP+WvhW6wKXVnxEg8n7BqHXZgpOr99f4i/fZk/S4i+s1LKeNHOOIIJ/ZxwQfgI7X
 L5cx26jgOp0sjAx4C5Br+/Ki5SaaToEiWB64judDAUP7FHV6UHtlaHlvmoyl9v3PjbVuUZ
 LjaLQw1msB12Q25czgj1EPQV0MPwRP3GQ/XFwiRrn5l+DrYTeMHTAHHrOk1e64YKz9WMP9
 NcWwiXeCaBTK/WGIQvFvkYL2dLDaGznVpcvnxk1sVkTgBCKEystklVltyCUNtL2efYjFaO
 iyXpi0QDrZ7I1aZDIceLMvIQhJBQr0GYXny/PIJYAngFy2OZggdrTDSMNrOkfQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD5FD24000B;
 Fri,  9 Jun 2023 14:59:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/panel: sitronix-st7789v: Use 9 bits per spi word by
 default
Date: Fri,  9 Jun 2023 16:59:46 +0200
Message-Id: <20230609145951.853533-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609145951.853533-1-miquel.raynal@bootlin.com>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sitronix controller expects 9-bit words, provide this as default at
probe time rather than specifying this in each and every access.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index c67b9adb157f..e9ca7ebb458a 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -138,7 +138,6 @@ static int st7789v_spi_write(struct st7789v *ctx, enum st7789v_prefix prefix,
 	spi_message_init(&msg);
 
 	xfer.tx_buf = &txbuf;
-	xfer.bits_per_word = 9;
 	xfer.len = sizeof(txbuf);
 
 	spi_message_add_tail(&xfer, &msg);
@@ -365,6 +364,13 @@ static int st7789v_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
+	spi->bits_per_word = 9;
+	ret = spi_setup(spi);
+	if (ret < 0) {
+		dev_err(&spi->dev, "spi_setup failed: %d\n", ret);
+		return ret;
+	}
+
 	drm_panel_init(&ctx->panel, &spi->dev, &st7789v_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
-- 
2.34.1

