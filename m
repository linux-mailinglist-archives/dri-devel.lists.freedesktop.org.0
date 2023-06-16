Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A89733614
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5C10E663;
	Fri, 16 Jun 2023 16:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54110E658
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:33:06 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686933183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpw7cRKRZgqOGCBNqWmK0bQaMahtPAr9TMsZHCRkJKs=;
 b=AlJYW9w0FDitUCtiTYhBYRJ35v3OFSgBjtP3fN2ndAjgxTGwK8arUY1ifY4OO+pO4CBByu
 09F45FHRZXg9W7u74sbVQWOsMKdEjF8FCCtw7m09fABgQz9Jc9BZNtmhOlxLZCKFjNT/Rg
 LJ5edZ/Zmaz1XHXMLwIsIJOYKJUQ375uu9dbGCXmPx35oNNVV/DWmkkf5RTRn2BP+css18
 YDZn785nwCb1MP2/ZmWma8wh7VlyZ3vldzWumFA78pPX2UamxUMo7JTRpMMXS6n1aETpRC
 FP8BK5I/3qhzTX5lIaT0+iRnQYBVMLc8K89KVBrO8oMD6TlgseOgKf2OV/g1AA==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11A24C000A;
 Fri, 16 Jun 2023 16:33:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/panel: sitronix-st7789v: Use 9 bits per spi word
 by default
Date: Fri, 16 Jun 2023 18:32:52 +0200
Message-Id: <20230616163255.2804163-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
References: <20230616163255.2804163-1-miquel.raynal@bootlin.com>
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
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Sitronix controller expects 9-bit words, provide this as default at
probe time rather than specifying this in each and every access.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 172c6c1fc090..605b9f6d0f14 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -142,7 +142,6 @@ static int st7789v_spi_write(struct st7789v *ctx, enum st7789v_prefix prefix,
 	u16 txbuf = ((prefix & 1) << 8) | data;
 
 	xfer.tx_buf = &txbuf;
-	xfer.bits_per_word = 9;
 	xfer.len = sizeof(txbuf);
 
 	return spi_sync_transfer(ctx->spi, &xfer, 1);
@@ -436,6 +435,11 @@ static int st7789v_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
+	spi->bits_per_word = 9;
+	ret = spi_setup(spi);
+	if (ret < 0)
+		return dev_err_probe(&spi->dev, ret, "Failed to setup spi\n");
+
 	ctx->info = device_get_match_data(&spi->dev);
 
 	drm_panel_init(&ctx->panel, dev, &st7789v_drm_funcs,
-- 
2.34.1

