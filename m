Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348A47BE994
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616B710E2B3;
	Mon,  9 Oct 2023 18:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9DE10E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS2xzFzZgdgyN36MvD7TG0hgNc8bhRrNc8wsTPEa2bU=;
 b=GG7lVnU2ZEH/tUHqJ7ymqL4Y6ljmFk2/DyznCAjsrUqanZxwFSoQwyiPuUacnlmZhZTDoy
 /EXUTCDBKAgQbdQ518iNioDOl/gzJIPAv9bt0rcUhYJkXcjsOTmWEj0RwocDcn2llY4xZY
 EYU6rpZQ/XTY22rXlOmGfaHFeQx50w8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-rBCrx7WrMNeRZRh0w_7Fcw-1; Mon, 09 Oct 2023 14:36:03 -0400
X-MC-Unique: rBCrx7WrMNeRZRh0w_7Fcw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4074f9d17a5so6552285e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876562; x=1697481362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AS2xzFzZgdgyN36MvD7TG0hgNc8bhRrNc8wsTPEa2bU=;
 b=tnikkHJu+UVJO4rjF0wduI0hoU/VhKPxZeDL5pnCxCUdF7QE3SaEJM8HRskji1IV+P
 z3odcriCfnKhgppaDKDDzAcHVthiepbx4YdskQe2hfaCqoePU6i6h8ER4k4FqGi4fF/P
 QqXfuU8ZazKzZWduHlrEMa50zglFCA6cgfOcDx47u1xKC2Whhsorj+AEQJc9FQzZByDP
 71Oq+wC9o1SrckaZWPTFEzdzQN47DvtTl/1zFcRxUCiXQpzkEcLANomieUha37IbpwQM
 2umOykA1QElI/2wc3wntsah7MFKAOW/9I2gVu4GhPBFqDcudDUGlH/6830J+i9T82/hK
 /1mA==
X-Gm-Message-State: AOJu0YxpB2l9dIJj+XZQHeV7gtt72Z1N+t8ZKnDk0uljrcAX0mbOD0/s
 dUvSEbQPwsn9My7GK4TxH04hXTw+ud5z+5IZwrdfHy7+ZDsQgMGTJrLnMUIpW8m5MWZ4lfvjups
 PmxO+2MIe7601x2PTBlmniyzFVGD5
X-Received: by 2002:a05:600c:22ce:b0:405:4c3a:796f with SMTP id
 14-20020a05600c22ce00b004054c3a796fmr15028068wmg.2.1696876561158; 
 Mon, 09 Oct 2023 11:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWJhKMLn5coCsSo/jRIXKww/SawpnLUP1yHfiQwkSbB3lgXd7mxY+dq9vvijq7p0oEoooq3g==
X-Received: by 2002:a05:600c:22ce:b0:405:4c3a:796f with SMTP id
 14-20020a05600c22ce00b004054c3a796fmr15028051wmg.2.1696876560672; 
 Mon, 09 Oct 2023 11:36:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k22-20020a7bc416000000b00404719b05b5sm11897542wmi.27.2023.10.09.11.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] drm/ssd13xx: Rename data structures and functions prefixes
Date: Mon,  9 Oct 2023 20:34:16 +0200
Message-ID: <20231009183522.543918-3-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183522.543918-1-javierm@redhat.com>
References: <20231009183522.543918-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the driver is now called ssd13xx and will support other Solomon OLED
controller families, rename the structs and functions prefixes as well.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd13xx-i2c.c |  63 +--
 drivers/gpu/drm/solomon/ssd13xx-spi.c |  73 +--
 drivers/gpu/drm/solomon/ssd13xx.c     | 644 +++++++++++++-------------
 drivers/gpu/drm/solomon/ssd13xx.h     |  18 +-
 4 files changed, 400 insertions(+), 398 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd13xx-i2c.c b/drivers/gpu/drm/solomon/ssd13xx-i2c.c
index f4d0feaa8515..d9cece374331 100644
--- a/drivers/gpu/drm/solomon/ssd13xx-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd13xx-i2c.c
@@ -16,95 +16,96 @@
 #define DRIVER_NAME	"ssd13xx-i2c"
 #define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays (I2C)"
 
-static const struct regmap_config ssd130x_i2c_regmap_config = {
+static const struct regmap_config ssd13xx_i2c_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
 
-static int ssd130x_i2c_probe(struct i2c_client *client)
+static int ssd13xx_i2c_probe(struct i2c_client *client)
 {
-	struct ssd130x_device *ssd130x;
+	struct ssd13xx_device *ssd13xx;
 	struct regmap *regmap;
 
-	regmap = devm_regmap_init_i2c(client, &ssd130x_i2c_regmap_config);
+	regmap = devm_regmap_init_i2c(client, &ssd13xx_i2c_regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ssd130x = ssd130x_probe(&client->dev, regmap);
-	if (IS_ERR(ssd130x))
-		return PTR_ERR(ssd130x);
+	ssd13xx = ssd13xx_probe(&client->dev, regmap);
+	if (IS_ERR(ssd13xx))
+		return PTR_ERR(ssd13xx);
 
-	i2c_set_clientdata(client, ssd130x);
+	i2c_set_clientdata(client, ssd13xx);
 
 	return 0;
 }
 
-static void ssd130x_i2c_remove(struct i2c_client *client)
+static void ssd13xx_i2c_remove(struct i2c_client *client)
 {
-	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
+	struct ssd13xx_device *ssd13xx = i2c_get_clientdata(client);
 
-	ssd130x_remove(ssd130x);
+	ssd13xx_remove(ssd13xx);
 }
 
-static void ssd130x_i2c_shutdown(struct i2c_client *client)
+static void ssd13xx_i2c_shutdown(struct i2c_client *client)
 {
-	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
+	struct ssd13xx_device *ssd13xx = i2c_get_clientdata(client);
 
-	ssd130x_shutdown(ssd130x);
+	ssd13xx_shutdown(ssd13xx);
 }
 
-static const struct of_device_id ssd130x_of_match[] = {
+static const struct of_device_id ssd13xx_of_match[] = {
+	/* ssd130x family */
 	{
 		.compatible = "sinowealth,sh1106",
-		.data = &ssd130x_variants[SH1106_ID],
+		.data = &ssd13xx_variants[SH1106_ID],
 	},
 	{
 		.compatible = "solomon,ssd1305",
-		.data = &ssd130x_variants[SSD1305_ID],
+		.data = &ssd13xx_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306",
-		.data = &ssd130x_variants[SSD1306_ID],
+		.data = &ssd13xx_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307",
-		.data = &ssd130x_variants[SSD1307_ID],
+		.data = &ssd13xx_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309",
-		.data = &ssd130x_variants[SSD1309_ID],
+		.data = &ssd13xx_variants[SSD1309_ID],
 	},
 	/* Deprecated but kept for backward compatibility */
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
-		.data = &ssd130x_variants[SSD1305_ID],
+		.data = &ssd13xx_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306fb-i2c",
-		.data = &ssd130x_variants[SSD1306_ID],
+		.data = &ssd13xx_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307fb-i2c",
-		.data = &ssd130x_variants[SSD1307_ID],
+		.data = &ssd13xx_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309fb-i2c",
-		.data = &ssd130x_variants[SSD1309_ID],
+		.data = &ssd13xx_variants[SSD1309_ID],
 	},
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, ssd130x_of_match);
+MODULE_DEVICE_TABLE(of, ssd13xx_of_match);
 
-static struct i2c_driver ssd130x_i2c_driver = {
+static struct i2c_driver ssd13xx_i2c_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
-		.of_match_table = ssd130x_of_match,
+		.of_match_table = ssd13xx_of_match,
 	},
-	.probe = ssd130x_i2c_probe,
-	.remove = ssd130x_i2c_remove,
-	.shutdown = ssd130x_i2c_shutdown,
+	.probe = ssd13xx_i2c_probe,
+	.remove = ssd13xx_i2c_remove,
+	.shutdown = ssd13xx_i2c_shutdown,
 };
-module_i2c_driver(ssd130x_i2c_driver);
+module_i2c_driver(ssd13xx_i2c_driver);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
diff --git a/drivers/gpu/drm/solomon/ssd13xx-spi.c b/drivers/gpu/drm/solomon/ssd13xx-spi.c
index 20d1e3711e2f..a5ebe5475a49 100644
--- a/drivers/gpu/drm/solomon/ssd13xx-spi.c
+++ b/drivers/gpu/drm/solomon/ssd13xx-spi.c
@@ -13,7 +13,7 @@
 #define DRIVER_NAME	"ssd13xx-spi"
 #define DRIVER_DESC	"DRM driver for Solomon SSD13xx OLED displays (SPI)"
 
-struct ssd130x_spi_transport {
+struct ssd13xx_spi_transport {
 	struct spi_device *spi;
 	struct gpio_desc *dc;
 };
@@ -28,9 +28,9 @@ struct ssd130x_spi_transport {
  * and can be used by the ssd13xx SPI driver to determine if the data sent
  * is for a command register or for the Graphic Display Data RAM (GDDRAM).
  */
-static int ssd130x_spi_write(void *context, const void *data, size_t count)
+static int ssd13xx_spi_write(void *context, const void *data, size_t count)
 {
-	struct ssd130x_spi_transport *t = context;
+	struct ssd13xx_spi_transport *t = context;
 	struct spi_device *spi = t->spi;
 	const u8 *reg = data;
 
@@ -45,24 +45,24 @@ static int ssd130x_spi_write(void *context, const void *data, size_t count)
 }
 
 /* The ssd130x driver does not read registers but regmap expects a .read */
-static int ssd130x_spi_read(void *context, const void *reg, size_t reg_size,
+static int ssd13xx_spi_read(void *context, const void *reg, size_t reg_size,
 			    void *val, size_t val_size)
 {
 	return -EOPNOTSUPP;
 }
 
-static const struct regmap_config ssd130x_spi_regmap_config = {
+static const struct regmap_config ssd13xx_spi_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.write = ssd130x_spi_write,
-	.read = ssd130x_spi_read,
+	.write = ssd13xx_spi_write,
+	.read = ssd13xx_spi_read,
 	.can_multi_write = true,
 };
 
-static int ssd130x_spi_probe(struct spi_device *spi)
+static int ssd13xx_spi_probe(struct spi_device *spi)
 {
-	struct ssd130x_spi_transport *t;
-	struct ssd130x_device *ssd130x;
+	struct ssd13xx_spi_transport *t;
+	struct ssd13xx_device *ssd13xx;
 	struct regmap *regmap;
 	struct gpio_desc *dc;
 	struct device *dev = &spi->dev;
@@ -80,57 +80,58 @@ static int ssd130x_spi_probe(struct spi_device *spi)
 	t->spi = spi;
 	t->dc = dc;
 
-	regmap = devm_regmap_init(dev, NULL, t, &ssd130x_spi_regmap_config);
+	regmap = devm_regmap_init(dev, NULL, t, &ssd13xx_spi_regmap_config);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	ssd130x = ssd130x_probe(dev, regmap);
-	if (IS_ERR(ssd130x))
-		return PTR_ERR(ssd130x);
+	ssd13xx = ssd13xx_probe(dev, regmap);
+	if (IS_ERR(ssd13xx))
+		return PTR_ERR(ssd13xx);
 
-	spi_set_drvdata(spi, ssd130x);
+	spi_set_drvdata(spi, ssd13xx);
 
 	return 0;
 }
 
-static void ssd130x_spi_remove(struct spi_device *spi)
+static void ssd13xx_spi_remove(struct spi_device *spi)
 {
-	struct ssd130x_device *ssd130x = spi_get_drvdata(spi);
+	struct ssd13xx_device *ssd13xx = spi_get_drvdata(spi);
 
-	ssd130x_remove(ssd130x);
+	ssd13xx_remove(ssd13xx);
 }
 
-static void ssd130x_spi_shutdown(struct spi_device *spi)
+static void ssd13xx_spi_shutdown(struct spi_device *spi)
 {
-	struct ssd130x_device *ssd130x = spi_get_drvdata(spi);
+	struct ssd13xx_device *ssd13xx = spi_get_drvdata(spi);
 
-	ssd130x_shutdown(ssd130x);
+	ssd13xx_shutdown(ssd13xx);
 }
 
-static const struct of_device_id ssd130x_of_match[] = {
+static const struct of_device_id ssd13xx_of_match[] = {
+	/* ssd130x family */
 	{
 		.compatible = "sinowealth,sh1106",
-		.data = &ssd130x_variants[SH1106_ID],
+		.data = &ssd13xx_variants[SH1106_ID],
 	},
 	{
 		.compatible = "solomon,ssd1305",
-		.data = &ssd130x_variants[SSD1305_ID],
+		.data = &ssd13xx_variants[SSD1305_ID],
 	},
 	{
 		.compatible = "solomon,ssd1306",
-		.data = &ssd130x_variants[SSD1306_ID],
+		.data = &ssd13xx_variants[SSD1306_ID],
 	},
 	{
 		.compatible = "solomon,ssd1307",
-		.data = &ssd130x_variants[SSD1307_ID],
+		.data = &ssd13xx_variants[SSD1307_ID],
 	},
 	{
 		.compatible = "solomon,ssd1309",
-		.data = &ssd130x_variants[SSD1309_ID],
+		.data = &ssd13xx_variants[SSD1309_ID],
 	},
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(of, ssd130x_of_match);
+MODULE_DEVICE_TABLE(of, ssd13xx_of_match);
 
 #if IS_MODULE(CONFIG_DRM_SSD13XX_SPI)
 /*
@@ -141,7 +142,7 @@ MODULE_DEVICE_TABLE(of, ssd130x_of_match);
  * To workaround this issue, add a SPI device ID table. Even when this should
  * not be needed for this driver to match the registered SPI devices.
  */
-static const struct spi_device_id ssd130x_spi_table[] = {
+static const struct spi_device_id ssd13xx_spi_table[] = {
 	{ "sh1106",  SH1106_ID },
 	{ "ssd1305", SSD1305_ID },
 	{ "ssd1306", SSD1306_ID },
@@ -149,19 +150,19 @@ static const struct spi_device_id ssd130x_spi_table[] = {
 	{ "ssd1309", SSD1309_ID },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
+MODULE_DEVICE_TABLE(spi, ssd13xx_spi_table);
 #endif
 
-static struct spi_driver ssd130x_spi_driver = {
+static struct spi_driver ssd13xx_spi_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
-		.of_match_table = ssd130x_of_match,
+		.of_match_table = ssd13xx_of_match,
 	},
-	.probe = ssd130x_spi_probe,
-	.remove = ssd130x_spi_remove,
-	.shutdown = ssd130x_spi_shutdown,
+	.probe = ssd13xx_spi_probe,
+	.remove = ssd13xx_spi_remove,
+	.shutdown = ssd13xx_spi_shutdown,
 };
-module_spi_driver(ssd130x_spi_driver);
+module_spi_driver(ssd13xx_spi_driver);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
diff --git a/drivers/gpu/drm/solomon/ssd13xx.c b/drivers/gpu/drm/solomon/ssd13xx.c
index 0bf12965719a..10a767fb614c 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.c
+++ b/drivers/gpu/drm/solomon/ssd13xx.c
@@ -94,7 +94,7 @@
 
 #define MAX_CONTRAST 255
 
-const struct ssd130x_deviceinfo ssd130x_variants[] = {
+const struct ssd13xx_deviceinfo ssd13xx_variants[] = {
 	[SH1106_ID] = {
 		.default_vcomh = 0x40,
 		.default_dclk_div = 1,
@@ -139,52 +139,52 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.page_height = 8,
 	}
 };
-EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD13XX);
+EXPORT_SYMBOL_NS_GPL(ssd13xx_variants, DRM_SSD13XX);
 
-struct ssd130x_crtc_state {
+struct ssd13xx_crtc_state {
 	struct drm_crtc_state base;
 	/* Buffer to store pixels in HW format and written to the panel */
 	u8 *data_array;
 };
 
-struct ssd130x_plane_state {
+struct ssd13xx_plane_state {
 	struct drm_shadow_plane_state base;
 	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
 	u8 *buffer;
 };
 
-static inline struct ssd130x_crtc_state *to_ssd130x_crtc_state(struct drm_crtc_state *state)
+static inline struct ssd13xx_crtc_state *to_ssd13xx_crtc_state(struct drm_crtc_state *state)
 {
-	return container_of(state, struct ssd130x_crtc_state, base);
+	return container_of(state, struct ssd13xx_crtc_state, base);
 }
 
-static inline struct ssd130x_plane_state *to_ssd130x_plane_state(struct drm_plane_state *state)
+static inline struct ssd13xx_plane_state *to_ssd13xx_plane_state(struct drm_plane_state *state)
 {
-	return container_of(state, struct ssd130x_plane_state, base.base);
+	return container_of(state, struct ssd13xx_plane_state, base.base);
 }
 
-static inline struct ssd130x_device *drm_to_ssd130x(struct drm_device *drm)
+static inline struct ssd13xx_device *drm_to_ssd13xx(struct drm_device *drm)
 {
-	return container_of(drm, struct ssd130x_device, drm);
+	return container_of(drm, struct ssd13xx_device, drm);
 }
 
 /*
  * Helper to write data (SSD130X_DATA) to the device.
  */
-static int ssd130x_write_data(struct ssd130x_device *ssd130x, u8 *values, int count)
+static int ssd13xx_write_data(struct ssd13xx_device *ssd13xx, u8 *values, int count)
 {
-	return regmap_bulk_write(ssd130x->regmap, SSD130X_DATA, values, count);
+	return regmap_bulk_write(ssd13xx->regmap, SSD130X_DATA, values, count);
 }
 
 /*
  * Helper to write command (SSD130X_COMMAND). The fist variadic argument
  * is the command to write and the following are the command options.
  *
- * Note that the ssd130x protocol requires each command and option to be
+ * Note that the ssd13xx protocol requires each command and option to be
  * written as a SSD130X_COMMAND device register value. That is why a call
  * to regmap_write(..., SSD130X_COMMAND, ...) is done for each argument.
  */
-static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
+static int ssd13xx_write_cmd(struct ssd13xx_device *ssd13xx, int count,
 			     /* u8 cmd, u8 option, ... */...)
 {
 	va_list ap;
@@ -195,7 +195,7 @@ static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 
 	do {
 		value = va_arg(ap, int);
-		ret = regmap_write(ssd130x->regmap, SSD130X_COMMAND, value);
+		ret = regmap_write(ssd13xx->regmap, SSD130X_COMMAND, value);
 		if (ret)
 			goto out_end;
 	} while (--count);
@@ -207,44 +207,44 @@ static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
 }
 
 /* Set address range for horizontal/vertical addressing modes */
-static int ssd130x_set_col_range(struct ssd130x_device *ssd130x,
+static int ssd13xx_set_col_range(struct ssd13xx_device *ssd13xx,
 				 u8 col_start, u8 cols)
 {
 	u8 col_end = col_start + cols - 1;
 	int ret;
 
-	if (col_start == ssd130x->col_start && col_end == ssd130x->col_end)
+	if (col_start == ssd13xx->col_start && col_end == ssd13xx->col_end)
 		return 0;
 
-	ret = ssd130x_write_cmd(ssd130x, 3, SSD130X_SET_COL_RANGE, col_start, col_end);
+	ret = ssd13xx_write_cmd(ssd13xx, 3, SSD130X_SET_COL_RANGE, col_start, col_end);
 	if (ret < 0)
 		return ret;
 
-	ssd130x->col_start = col_start;
-	ssd130x->col_end = col_end;
+	ssd13xx->col_start = col_start;
+	ssd13xx->col_end = col_end;
 	return 0;
 }
 
-static int ssd130x_set_page_range(struct ssd130x_device *ssd130x,
+static int ssd13xx_set_page_range(struct ssd13xx_device *ssd13xx,
 				  u8 page_start, u8 pages)
 {
 	u8 page_end = page_start + pages - 1;
 	int ret;
 
-	if (page_start == ssd130x->page_start && page_end == ssd130x->page_end)
+	if (page_start == ssd13xx->page_start && page_end == ssd13xx->page_end)
 		return 0;
 
-	ret = ssd130x_write_cmd(ssd130x, 3, SSD130X_SET_PAGE_RANGE, page_start, page_end);
+	ret = ssd13xx_write_cmd(ssd13xx, 3, SSD130X_SET_PAGE_RANGE, page_start, page_end);
 	if (ret < 0)
 		return ret;
 
-	ssd130x->page_start = page_start;
-	ssd130x->page_end = page_end;
+	ssd13xx->page_start = page_start;
+	ssd13xx->page_end = page_end;
 	return 0;
 }
 
 /* Set page and column start address for page addressing mode */
-static int ssd130x_set_page_pos(struct ssd130x_device *ssd130x,
+static int ssd13xx_set_page_pos(struct ssd13xx_device *ssd13xx,
 				u8 page_start, u8 col_start)
 {
 	int ret;
@@ -256,67 +256,67 @@ static int ssd130x_set_page_pos(struct ssd130x_device *ssd130x,
 		  SSD130X_PAGE_COL_START_LOW_SET(col_start);
 	col_high = SSD130X_PAGE_COL_START_HIGH |
 		   SSD130X_PAGE_COL_START_HIGH_SET(col_start);
-	ret = ssd130x_write_cmd(ssd130x, 3, page, col_low, col_high);
+	ret = ssd13xx_write_cmd(ssd13xx, 3, page, col_low, col_high);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int ssd130x_pwm_enable(struct ssd130x_device *ssd130x)
+static int ssd13xx_pwm_enable(struct ssd13xx_device *ssd13xx)
 {
-	struct device *dev = ssd130x->dev;
+	struct device *dev = ssd13xx->dev;
 	struct pwm_state pwmstate;
 
-	ssd130x->pwm = pwm_get(dev, NULL);
-	if (IS_ERR(ssd130x->pwm)) {
+	ssd13xx->pwm = pwm_get(dev, NULL);
+	if (IS_ERR(ssd13xx->pwm)) {
 		dev_err(dev, "Could not get PWM from firmware description!\n");
-		return PTR_ERR(ssd130x->pwm);
+		return PTR_ERR(ssd13xx->pwm);
 	}
 
-	pwm_init_state(ssd130x->pwm, &pwmstate);
+	pwm_init_state(ssd13xx->pwm, &pwmstate);
 	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
-	pwm_apply_state(ssd130x->pwm, &pwmstate);
+	pwm_apply_state(ssd13xx->pwm, &pwmstate);
 
 	/* Enable the PWM */
-	pwm_enable(ssd130x->pwm);
+	pwm_enable(ssd13xx->pwm);
 
 	dev_dbg(dev, "Using PWM %s with a %lluns period.\n",
-		ssd130x->pwm->label, pwm_get_period(ssd130x->pwm));
+		ssd13xx->pwm->label, pwm_get_period(ssd13xx->pwm));
 
 	return 0;
 }
 
-static void ssd130x_reset(struct ssd130x_device *ssd130x)
+static void ssd13xx_reset(struct ssd13xx_device *ssd13xx)
 {
-	if (!ssd130x->reset)
+	if (!ssd13xx->reset)
 		return;
 
 	/* Reset the screen */
-	gpiod_set_value_cansleep(ssd130x->reset, 1);
+	gpiod_set_value_cansleep(ssd13xx->reset, 1);
 	udelay(4);
-	gpiod_set_value_cansleep(ssd130x->reset, 0);
+	gpiod_set_value_cansleep(ssd13xx->reset, 0);
 	udelay(4);
 }
 
-static int ssd130x_power_on(struct ssd130x_device *ssd130x)
+static int ssd13xx_power_on(struct ssd13xx_device *ssd13xx)
 {
-	struct device *dev = ssd130x->dev;
+	struct device *dev = ssd13xx->dev;
 	int ret;
 
-	ssd130x_reset(ssd130x);
+	ssd13xx_reset(ssd13xx);
 
-	ret = regulator_enable(ssd130x->vcc_reg);
+	ret = regulator_enable(ssd13xx->vcc_reg);
 	if (ret) {
 		dev_err(dev, "Failed to enable VCC: %d\n", ret);
 		return ret;
 	}
 
-	if (ssd130x->device_info->need_pwm) {
-		ret = ssd130x_pwm_enable(ssd130x);
+	if (ssd13xx->device_info->need_pwm) {
+		ret = ssd13xx_pwm_enable(ssd13xx);
 		if (ret) {
 			dev_err(dev, "Failed to enable PWM: %d\n", ret);
-			regulator_disable(ssd130x->vcc_reg);
+			regulator_disable(ssd13xx->vcc_reg);
 			return ret;
 		}
 	}
@@ -324,75 +324,75 @@ static int ssd130x_power_on(struct ssd130x_device *ssd130x)
 	return 0;
 }
 
-static void ssd130x_power_off(struct ssd130x_device *ssd130x)
+static void ssd13xx_power_off(struct ssd13xx_device *ssd13xx)
 {
-	pwm_disable(ssd130x->pwm);
-	pwm_put(ssd130x->pwm);
+	pwm_disable(ssd13xx->pwm);
+	pwm_put(ssd13xx->pwm);
 
-	regulator_disable(ssd130x->vcc_reg);
+	regulator_disable(ssd13xx->vcc_reg);
 }
 
-static int ssd130x_init(struct ssd130x_device *ssd130x)
+static int ssd13xx_init(struct ssd13xx_device *ssd13xx)
 {
 	u32 precharge, dclk, com_invdir, compins, chargepump, seg_remap;
 	bool scan_mode;
 	int ret;
 
 	/* Set initial contrast */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_CONTRAST, ssd130x->contrast);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_CONTRAST, ssd13xx->contrast);
 	if (ret < 0)
 		return ret;
 
 	/* Set segment re-map */
 	seg_remap = (SSD130X_SET_SEG_REMAP |
-		     SSD130X_SET_SEG_REMAP_SET(ssd130x->seg_remap));
-	ret = ssd130x_write_cmd(ssd130x, 1, seg_remap);
+		     SSD130X_SET_SEG_REMAP_SET(ssd13xx->seg_remap));
+	ret = ssd13xx_write_cmd(ssd13xx, 1, seg_remap);
 	if (ret < 0)
 		return ret;
 
 	/* Set COM direction */
 	com_invdir = (SSD130X_SET_COM_SCAN_DIR |
-		      SSD130X_SET_COM_SCAN_DIR_SET(ssd130x->com_invdir));
-	ret = ssd130x_write_cmd(ssd130x,  1, com_invdir);
+		      SSD130X_SET_COM_SCAN_DIR_SET(ssd13xx->com_invdir));
+	ret = ssd13xx_write_cmd(ssd13xx,  1, com_invdir);
 	if (ret < 0)
 		return ret;
 
 	/* Set multiplex ratio value */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd13xx->height - 1);
 	if (ret < 0)
 		return ret;
 
 	/* set display offset value */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_DISPLAY_OFFSET, ssd130x->com_offset);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_DISPLAY_OFFSET, ssd13xx->com_offset);
 	if (ret < 0)
 		return ret;
 
 	/* Set clock frequency */
-	dclk = (SSD130X_SET_CLOCK_DIV_SET(ssd130x->dclk_div - 1) |
-		SSD130X_SET_CLOCK_FREQ_SET(ssd130x->dclk_frq));
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_CLOCK_FREQ, dclk);
+	dclk = (SSD130X_SET_CLOCK_DIV_SET(ssd13xx->dclk_div - 1) |
+		SSD130X_SET_CLOCK_FREQ_SET(ssd13xx->dclk_frq));
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_CLOCK_FREQ, dclk);
 	if (ret < 0)
 		return ret;
 
 	/* Set Area Color Mode ON/OFF & Low Power Display Mode */
-	if (ssd130x->area_color_enable || ssd130x->low_power) {
+	if (ssd13xx->area_color_enable || ssd13xx->low_power) {
 		u32 mode = 0;
 
-		if (ssd130x->area_color_enable)
+		if (ssd13xx->area_color_enable)
 			mode |= SSD130X_SET_AREA_COLOR_MODE_ENABLE;
 
-		if (ssd130x->low_power)
+		if (ssd13xx->low_power)
 			mode |= SSD130X_SET_AREA_COLOR_MODE_LOW_POWER;
 
-		ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_AREA_COLOR_MODE, mode);
+		ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_AREA_COLOR_MODE, mode);
 		if (ret < 0)
 			return ret;
 	}
 
 	/* Set precharge period in number of ticks from the internal clock */
-	precharge = (SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep1) |
-		     SSD130X_SET_PRECHARGE_PERIOD2_SET(ssd130x->prechargep2));
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_PRECHARGE_PERIOD, precharge);
+	precharge = (SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd13xx->prechargep1) |
+		     SSD130X_SET_PRECHARGE_PERIOD2_SET(ssd13xx->prechargep2));
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_PRECHARGE_PERIOD, precharge);
 	if (ret < 0)
 		return ret;
 
@@ -403,60 +403,60 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
 	 * property "solomon,com-seq". The value 0b means scan from COM0 to
 	 * COM[N - 1] while 1b means scan from COM[N - 1] to COM0.
 	 */
-	scan_mode = !ssd130x->com_seq;
+	scan_mode = !ssd13xx->com_seq;
 	compins |= (SSD130X_SET_COM_PINS_CONFIG1_SET(scan_mode) |
-		    SSD130X_SET_COM_PINS_CONFIG2_SET(ssd130x->com_lrremap));
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_COM_PINS_CONFIG, compins);
+		    SSD130X_SET_COM_PINS_CONFIG2_SET(ssd13xx->com_lrremap));
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_COM_PINS_CONFIG, compins);
 	if (ret < 0)
 		return ret;
 
 	/* Set VCOMH */
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_VCOMH, ssd130x->vcomh);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_VCOMH, ssd13xx->vcomh);
 	if (ret < 0)
 		return ret;
 
 	/* Turn on the DC-DC Charge Pump */
 	chargepump = BIT(4);
 
-	if (ssd130x->device_info->need_chargepump)
+	if (ssd13xx->device_info->need_chargepump)
 		chargepump |= BIT(2);
 
-	ret = ssd130x_write_cmd(ssd130x, 2, SSD130X_CHARGE_PUMP, chargepump);
+	ret = ssd13xx_write_cmd(ssd13xx, 2, SSD130X_CHARGE_PUMP, chargepump);
 	if (ret < 0)
 		return ret;
 
 	/* Set lookup table */
-	if (ssd130x->lookup_table_set) {
+	if (ssd13xx->lookup_table_set) {
 		int i;
 
-		ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_SET_LOOKUP_TABLE);
+		ret = ssd13xx_write_cmd(ssd13xx, 1, SSD130X_SET_LOOKUP_TABLE);
 		if (ret < 0)
 			return ret;
 
-		for (i = 0; i < ARRAY_SIZE(ssd130x->lookup_table); i++) {
-			u8 val = ssd130x->lookup_table[i];
+		for (i = 0; i < ARRAY_SIZE(ssd13xx->lookup_table); i++) {
+			u8 val = ssd13xx->lookup_table[i];
 
 			if (val < 31 || val > 63)
-				dev_warn(ssd130x->dev,
+				dev_warn(ssd13xx->dev,
 					 "lookup table index %d value out of range 31 <= %d <= 63\n",
 					 i, val);
-			ret = ssd130x_write_cmd(ssd130x, 1, val);
+			ret = ssd13xx_write_cmd(ssd13xx, 1, val);
 			if (ret < 0)
 				return ret;
 		}
 	}
 
 	/* Switch to page addressing mode */
-	if (ssd130x->page_address_mode)
-		return ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_ADDRESS_MODE,
+	if (ssd13xx->page_address_mode)
+		return ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_ADDRESS_MODE,
 					 SSD130X_SET_ADDRESS_MODE_PAGE);
 
 	/* Switch to horizontal addressing mode */
-	return ssd130x_write_cmd(ssd130x, 2, SSD130X_SET_ADDRESS_MODE,
+	return ssd13xx_write_cmd(ssd13xx, 2, SSD130X_SET_ADDRESS_MODE,
 				 SSD130X_SET_ADDRESS_MODE_HORIZONTAL);
 }
 
-static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
+static int ssd13xx_update_rect(struct ssd13xx_device *ssd13xx,
 			       struct drm_rect *rect, u8 *buf,
 			       u8 *data_array)
 {
@@ -465,9 +465,9 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
-	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int page_height = ssd13xx->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(height, page_height);
-	struct drm_device *drm = &ssd130x->drm;
+	struct drm_device *drm = &ssd13xx->drm;
 	u32 array_idx = 0;
 	int ret, i, j, k;
 
@@ -502,13 +502,13 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
 	 */
 
-	if (!ssd130x->page_address_mode) {
+	if (!ssd13xx->page_address_mode) {
 		/* Set address range for horizontal addressing mode */
-		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset + x, width);
+		ret = ssd13xx_set_col_range(ssd13xx, ssd13xx->col_offset + x, width);
 		if (ret < 0)
 			return ret;
 
-		ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
+		ret = ssd13xx_set_page_range(ssd13xx, ssd13xx->page_offset + y / 8, pages);
 		if (ret < 0)
 			return ret;
 	}
@@ -517,8 +517,8 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 		int m = 8;
 
 		/* Last page may be partial */
-		if (8 * (y / 8 + i + 1) > ssd130x->height)
-			m = ssd130x->height % 8;
+		if (8 * (y / 8 + i + 1) > ssd13xx->height)
+			m = ssd13xx->height % 8;
 		for (j = 0; j < width; j++) {
 			u8 data = 0;
 
@@ -535,14 +535,14 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 		 * In page addressing mode, the start address needs to be reset,
 		 * and each page then needs to be written out separately.
 		 */
-		if (ssd130x->page_address_mode) {
-			ret = ssd130x_set_page_pos(ssd130x,
-						   ssd130x->page_offset + i,
-						   ssd130x->col_offset + x);
+		if (ssd13xx->page_address_mode) {
+			ret = ssd13xx_set_page_pos(ssd13xx,
+						   ssd13xx->page_offset + i,
+						   ssd13xx->col_offset + x);
 			if (ret < 0)
 				return ret;
 
-			ret = ssd130x_write_data(ssd130x, data_array, width);
+			ret = ssd13xx_write_data(ssd13xx, data_array, width);
 			if (ret < 0)
 				return ret;
 
@@ -551,33 +551,33 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
 	}
 
 	/* Write out update in one go if we aren't using page addressing mode */
-	if (!ssd130x->page_address_mode)
-		ret = ssd130x_write_data(ssd130x, data_array, width * pages);
+	if (!ssd13xx->page_address_mode)
+		ret = ssd13xx_write_data(ssd13xx, data_array, width * pages);
 
 	return ret;
 }
 
-static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
+static void ssd13xx_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
 {
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
-	unsigned int width = ssd130x->width;
+	unsigned int page_height = ssd13xx->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, page_height);
+	unsigned int width = ssd13xx->width;
 	int ret, i;
 
-	if (!ssd130x->page_address_mode) {
+	if (!ssd13xx->page_address_mode) {
 		memset(data_array, 0, width * pages);
 
 		/* Set address range for horizontal addressing mode */
-		ret = ssd130x_set_col_range(ssd130x, ssd130x->col_offset, width);
+		ret = ssd13xx_set_col_range(ssd13xx, ssd13xx->col_offset, width);
 		if (ret < 0)
 			return;
 
-		ret = ssd130x_set_page_range(ssd130x, ssd130x->page_offset, pages);
+		ret = ssd13xx_set_page_range(ssd13xx, ssd13xx->page_offset, pages);
 		if (ret < 0)
 			return;
 
 		/* Write out update in one go if we aren't using page addressing mode */
-		ssd130x_write_data(ssd130x, data_array, width * pages);
+		ssd13xx_write_data(ssd13xx, data_array, width * pages);
 	} else {
 		/*
 		 * In page addressing mode, the start address needs to be reset,
@@ -586,33 +586,33 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 		memset(data_array, 0, width);
 
 		for (i = 0; i < pages; i++) {
-			ret = ssd130x_set_page_pos(ssd130x,
-						   ssd130x->page_offset + i,
-						   ssd130x->col_offset);
+			ret = ssd13xx_set_page_pos(ssd13xx,
+						   ssd13xx->page_offset + i,
+						   ssd13xx->col_offset);
 			if (ret < 0)
 				return;
 
-			ret = ssd130x_write_data(ssd130x, data_array, width);
+			ret = ssd13xx_write_data(ssd13xx, data_array, width);
 			if (ret < 0)
 				return;
 		}
 	}
 }
 
-static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
+static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
 				struct drm_rect *rect,
 				u8 *buf, u8 *data_array)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	unsigned int page_height = ssd130x->device_info->page_height;
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(fb->dev);
+	unsigned int page_height = ssd13xx->device_info->page_height;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
 
 	/* Align y to display page boundaries */
 	rect->y1 = round_down(rect->y1, page_height);
-	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd130x->height);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd13xx->height);
 
 	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
 
@@ -625,18 +625,18 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	ssd130x_update_rect(ssd130x, rect, buf, data_array);
+	ssd13xx_update_rect(ssd13xx, rect, buf, data_array);
 
 	return ret;
 }
 
-static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
+static int ssd13xx_primary_plane_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
 	struct drm_device *drm = plane->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+	struct ssd13xx_plane_state *ssd13xx_state = to_ssd13xx_plane_state(plane_state);
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	const struct drm_format_info *fi;
@@ -658,24 +658,24 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 	if (!fi)
 		return -EINVAL;
 
-	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+	pitch = drm_format_info_min_pitch(fi, 0, ssd13xx->width);
 
-	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
-	if (!ssd130x_state->buffer)
+	ssd13xx_state->buffer = kcalloc(pitch, ssd13xx->height, GFP_KERNEL);
+	if (!ssd13xx_state->buffer)
 		return -ENOMEM;
 
 	return 0;
 }
 
-static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
+static void ssd13xx_primary_plane_atomic_update(struct drm_plane *plane,
 						struct drm_atomic_state *state)
 {
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
-	struct ssd130x_crtc_state *ssd130x_crtc_state =  to_ssd130x_crtc_state(crtc_state);
-	struct ssd130x_plane_state *ssd130x_plane_state = to_ssd130x_plane_state(plane_state);
+	struct ssd13xx_crtc_state *ssd13xx_crtc_state =  to_ssd13xx_crtc_state(crtc_state);
+	struct ssd13xx_plane_state *ssd13xx_plane_state = to_ssd13xx_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_device *drm = plane->dev;
@@ -693,187 +693,187 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 		if (!drm_rect_intersect(&dst_clip, &damage))
 			continue;
 
-		ssd130x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
-				     ssd130x_plane_state->buffer,
-				     ssd130x_crtc_state->data_array);
+		ssd13xx_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
+				     ssd13xx_plane_state->buffer,
+				     ssd13xx_crtc_state->data_array);
 	}
 
 	drm_dev_exit(idx);
 }
 
-static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
+static void ssd13xx_primary_plane_atomic_disable(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
 	struct drm_device *drm = plane->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_crtc_state *crtc_state;
-	struct ssd130x_crtc_state *ssd130x_crtc_state;
+	struct ssd13xx_crtc_state *ssd13xx_crtc_state;
 	int idx;
 
 	if (!plane_state->crtc)
 		return;
 
 	crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
-	ssd130x_crtc_state = to_ssd130x_crtc_state(crtc_state);
+	ssd13xx_crtc_state = to_ssd13xx_crtc_state(crtc_state);
 
 	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	ssd130x_clear_screen(ssd130x, ssd130x_crtc_state->data_array);
+	ssd13xx_clear_screen(ssd13xx, ssd13xx_crtc_state->data_array);
 
 	drm_dev_exit(idx);
 }
 
 /* Called during init to allocate the plane's atomic state. */
-static void ssd130x_primary_plane_reset(struct drm_plane *plane)
+static void ssd13xx_primary_plane_reset(struct drm_plane *plane)
 {
-	struct ssd130x_plane_state *ssd130x_state;
+	struct ssd13xx_plane_state *ssd13xx_state;
 
 	WARN_ON(plane->state);
 
-	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
-	if (!ssd130x_state)
+	ssd13xx_state = kzalloc(sizeof(*ssd13xx_state), GFP_KERNEL);
+	if (!ssd13xx_state)
 		return;
 
-	__drm_gem_reset_shadow_plane(plane, &ssd130x_state->base);
+	__drm_gem_reset_shadow_plane(plane, &ssd13xx_state->base);
 }
 
-static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_plane *plane)
+static struct drm_plane_state *ssd13xx_primary_plane_duplicate_state(struct drm_plane *plane)
 {
 	struct drm_shadow_plane_state *new_shadow_plane_state;
-	struct ssd130x_plane_state *old_ssd130x_state;
-	struct ssd130x_plane_state *ssd130x_state;
+	struct ssd13xx_plane_state *old_ssd13xx_state;
+	struct ssd13xx_plane_state *ssd13xx_state;
 
 	if (WARN_ON(!plane->state))
 		return NULL;
 
-	old_ssd130x_state = to_ssd130x_plane_state(plane->state);
-	ssd130x_state = kmemdup(old_ssd130x_state, sizeof(*ssd130x_state), GFP_KERNEL);
-	if (!ssd130x_state)
+	old_ssd13xx_state = to_ssd13xx_plane_state(plane->state);
+	ssd13xx_state = kmemdup(old_ssd13xx_state, sizeof(*ssd13xx_state), GFP_KERNEL);
+	if (!ssd13xx_state)
 		return NULL;
 
 	/* The buffer is not duplicated and is allocated in .atomic_check */
-	ssd130x_state->buffer = NULL;
+	ssd13xx_state->buffer = NULL;
 
-	new_shadow_plane_state = &ssd130x_state->base;
+	new_shadow_plane_state = &ssd13xx_state->base;
 
 	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
 
 	return &new_shadow_plane_state->base;
 }
 
-static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
+static void ssd13xx_primary_plane_destroy_state(struct drm_plane *plane,
 						struct drm_plane_state *state)
 {
-	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
+	struct ssd13xx_plane_state *ssd13xx_state = to_ssd13xx_plane_state(state);
 
-	kfree(ssd130x_state->buffer);
+	kfree(ssd13xx_state->buffer);
 
-	__drm_gem_destroy_shadow_plane_state(&ssd130x_state->base);
+	__drm_gem_destroy_shadow_plane_state(&ssd13xx_state->base);
 
-	kfree(ssd130x_state);
+	kfree(ssd13xx_state);
 }
 
-static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
+static const struct drm_plane_helper_funcs ssd13xx_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = ssd130x_primary_plane_atomic_check,
-	.atomic_update = ssd130x_primary_plane_atomic_update,
-	.atomic_disable = ssd130x_primary_plane_atomic_disable,
+	.atomic_check = ssd13xx_primary_plane_atomic_check,
+	.atomic_update = ssd13xx_primary_plane_atomic_update,
+	.atomic_disable = ssd13xx_primary_plane_atomic_disable,
 };
 
-static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
+static const struct drm_plane_funcs ssd13xx_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = ssd130x_primary_plane_reset,
-	.atomic_duplicate_state = ssd130x_primary_plane_duplicate_state,
-	.atomic_destroy_state = ssd130x_primary_plane_destroy_state,
+	.reset = ssd13xx_primary_plane_reset,
+	.atomic_duplicate_state = ssd13xx_primary_plane_duplicate_state,
+	.atomic_destroy_state = ssd13xx_primary_plane_destroy_state,
 	.destroy = drm_plane_cleanup,
 };
 
-static enum drm_mode_status ssd130x_crtc_mode_valid(struct drm_crtc *crtc,
+static enum drm_mode_status ssd13xx_crtc_mode_valid(struct drm_crtc *crtc,
 						    const struct drm_display_mode *mode)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(crtc->dev);
 
-	if (mode->hdisplay != ssd130x->mode.hdisplay &&
-	    mode->vdisplay != ssd130x->mode.vdisplay)
+	if (mode->hdisplay != ssd13xx->mode.hdisplay &&
+	    mode->vdisplay != ssd13xx->mode.vdisplay)
 		return MODE_ONE_SIZE;
-	else if (mode->hdisplay != ssd130x->mode.hdisplay)
+	else if (mode->hdisplay != ssd13xx->mode.hdisplay)
 		return MODE_ONE_WIDTH;
-	else if (mode->vdisplay != ssd130x->mode.vdisplay)
+	else if (mode->vdisplay != ssd13xx->mode.vdisplay)
 		return MODE_ONE_HEIGHT;
 
 	return MODE_OK;
 }
 
-static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
+static int ssd13xx_crtc_atomic_check(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct drm_device *drm = crtc->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(crtc_state);
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	struct ssd13xx_crtc_state *ssd13xx_state = to_ssd13xx_crtc_state(crtc_state);
+	unsigned int page_height = ssd13xx->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd13xx->height, page_height);
 	int ret;
 
 	ret = drm_crtc_helper_atomic_check(crtc, state);
 	if (ret)
 		return ret;
 
-	ssd130x_state->data_array = kmalloc(ssd130x->width * pages, GFP_KERNEL);
-	if (!ssd130x_state->data_array)
+	ssd13xx_state->data_array = kmalloc(ssd13xx->width * pages, GFP_KERNEL);
+	if (!ssd13xx_state->data_array)
 		return -ENOMEM;
 
 	return 0;
 }
 
 /* Called during init to allocate the CRTC's atomic state. */
-static void ssd130x_crtc_reset(struct drm_crtc *crtc)
+static void ssd13xx_crtc_reset(struct drm_crtc *crtc)
 {
-	struct ssd130x_crtc_state *ssd130x_state;
+	struct ssd13xx_crtc_state *ssd13xx_state;
 
 	WARN_ON(crtc->state);
 
-	ssd130x_state = kzalloc(sizeof(*ssd130x_state), GFP_KERNEL);
-	if (!ssd130x_state)
+	ssd13xx_state = kzalloc(sizeof(*ssd13xx_state), GFP_KERNEL);
+	if (!ssd13xx_state)
 		return;
 
-	__drm_atomic_helper_crtc_reset(crtc, &ssd130x_state->base);
+	__drm_atomic_helper_crtc_reset(crtc, &ssd13xx_state->base);
 }
 
-static struct drm_crtc_state *ssd130x_crtc_duplicate_state(struct drm_crtc *crtc)
+static struct drm_crtc_state *ssd13xx_crtc_duplicate_state(struct drm_crtc *crtc)
 {
-	struct ssd130x_crtc_state *old_ssd130x_state;
-	struct ssd130x_crtc_state *ssd130x_state;
+	struct ssd13xx_crtc_state *old_ssd13xx_state;
+	struct ssd13xx_crtc_state *ssd13xx_state;
 
 	if (WARN_ON(!crtc->state))
 		return NULL;
 
-	old_ssd130x_state = to_ssd130x_crtc_state(crtc->state);
-	ssd130x_state = kmemdup(old_ssd130x_state, sizeof(*ssd130x_state), GFP_KERNEL);
-	if (!ssd130x_state)
+	old_ssd13xx_state = to_ssd13xx_crtc_state(crtc->state);
+	ssd13xx_state = kmemdup(old_ssd13xx_state, sizeof(*ssd13xx_state), GFP_KERNEL);
+	if (!ssd13xx_state)
 		return NULL;
 
 	/* The buffer is not duplicated and is allocated in .atomic_check */
-	ssd130x_state->data_array = NULL;
+	ssd13xx_state->data_array = NULL;
 
-	__drm_atomic_helper_crtc_duplicate_state(crtc, &ssd130x_state->base);
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &ssd13xx_state->base);
 
-	return &ssd130x_state->base;
+	return &ssd13xx_state->base;
 }
 
-static void ssd130x_crtc_destroy_state(struct drm_crtc *crtc,
+static void ssd13xx_crtc_destroy_state(struct drm_crtc *crtc,
 				       struct drm_crtc_state *state)
 {
-	struct ssd130x_crtc_state *ssd130x_state = to_ssd130x_crtc_state(state);
+	struct ssd13xx_crtc_state *ssd13xx_state = to_ssd13xx_crtc_state(state);
 
-	kfree(ssd130x_state->data_array);
+	kfree(ssd13xx_state->data_array);
 
 	__drm_atomic_helper_crtc_destroy_state(state);
 
-	kfree(ssd130x_state);
+	kfree(ssd13xx_state);
 }
 
 /*
@@ -881,75 +881,75 @@ static void ssd130x_crtc_destroy_state(struct drm_crtc *crtc,
  * the primary plane's atomic_update function. Disabling clears
  * the screen in the primary plane's atomic_disable function.
  */
-static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
-	.mode_valid = ssd130x_crtc_mode_valid,
-	.atomic_check = ssd130x_crtc_atomic_check,
+static const struct drm_crtc_helper_funcs ssd13xx_crtc_helper_funcs = {
+	.mode_valid = ssd13xx_crtc_mode_valid,
+	.atomic_check = ssd13xx_crtc_atomic_check,
 };
 
-static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
-	.reset = ssd130x_crtc_reset,
+static const struct drm_crtc_funcs ssd13xx_crtc_funcs = {
+	.reset = ssd13xx_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = ssd130x_crtc_duplicate_state,
-	.atomic_destroy_state = ssd130x_crtc_destroy_state,
+	.atomic_duplicate_state = ssd13xx_crtc_duplicate_state,
+	.atomic_destroy_state = ssd13xx_crtc_destroy_state,
 };
 
-static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
+static void ssd13xx_encoder_atomic_enable(struct drm_encoder *encoder,
 					  struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 	int ret;
 
-	ret = ssd130x_power_on(ssd130x);
+	ret = ssd13xx_power_on(ssd13xx);
 	if (ret)
 		return;
 
-	ret = ssd130x_init(ssd130x);
+	ret = ssd13xx_init(ssd13xx);
 	if (ret)
 		goto power_off;
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
+	ssd13xx_write_cmd(ssd13xx, 1, SSD130X_DISPLAY_ON);
 
-	backlight_enable(ssd130x->bl_dev);
+	backlight_enable(ssd13xx->bl_dev);
 
 	return;
 
 power_off:
-	ssd130x_power_off(ssd130x);
+	ssd13xx_power_off(ssd13xx);
 	return;
 }
 
-static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
+static void ssd13xx_encoder_atomic_disable(struct drm_encoder *encoder,
 					   struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(drm);
 
-	backlight_disable(ssd130x->bl_dev);
+	backlight_disable(ssd13xx->bl_dev);
 
-	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
+	ssd13xx_write_cmd(ssd13xx, 1, SSD130X_DISPLAY_OFF);
 
-	ssd130x_power_off(ssd130x);
+	ssd13xx_power_off(ssd13xx);
 }
 
-static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs = {
-	.atomic_enable = ssd130x_encoder_atomic_enable,
-	.atomic_disable = ssd130x_encoder_atomic_disable,
+static const struct drm_encoder_helper_funcs ssd13xx_encoder_helper_funcs = {
+	.atomic_enable = ssd13xx_encoder_atomic_enable,
+	.atomic_disable = ssd13xx_encoder_atomic_disable,
 };
 
-static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
+static const struct drm_encoder_funcs ssd13xx_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int ssd130x_connector_get_modes(struct drm_connector *connector)
+static int ssd13xx_connector_get_modes(struct drm_connector *connector)
 {
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
+	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(connector->dev);
 	struct drm_display_mode *mode;
-	struct device *dev = ssd130x->dev;
+	struct device *dev = ssd13xx->dev;
 
-	mode = drm_mode_duplicate(connector->dev, &ssd130x->mode);
+	mode = drm_mode_duplicate(connector->dev, &ssd13xx->mode);
 	if (!mode) {
 		dev_err(dev, "Failed to duplicated mode\n");
 		return 0;
@@ -962,11 +962,11 @@ static int ssd130x_connector_get_modes(struct drm_connector *connector)
 	return 1;
 }
 
-static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {
-	.get_modes = ssd130x_connector_get_modes,
+static const struct drm_connector_helper_funcs ssd13xx_connector_helper_funcs = {
+	.get_modes = ssd13xx_connector_get_modes,
 };
 
-static const struct drm_connector_funcs ssd130x_connector_funcs = {
+static const struct drm_connector_funcs ssd13xx_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
@@ -974,19 +974,19 @@ static const struct drm_connector_funcs ssd130x_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_mode_config_funcs ssd130x_mode_config_funcs = {
+static const struct drm_mode_config_funcs ssd13xx_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-static const uint32_t ssd130x_formats[] = {
+static const uint32_t ssd13xx_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-DEFINE_DRM_GEM_FOPS(ssd130x_fops);
+DEFINE_DRM_GEM_FOPS(ssd13xx_fops);
 
-static const struct drm_driver ssd130x_drm_driver = {
+static const struct drm_driver ssd13xx_drm_driver = {
 	DRM_GEM_SHMEM_DRIVER_OPS,
 	.name			= DRIVER_NAME,
 	.desc			= DRIVER_DESC,
@@ -994,85 +994,85 @@ static const struct drm_driver ssd130x_drm_driver = {
 	.major			= DRIVER_MAJOR,
 	.minor			= DRIVER_MINOR,
 	.driver_features	= DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
-	.fops			= &ssd130x_fops,
+	.fops			= &ssd13xx_fops,
 };
 
-static int ssd130x_update_bl(struct backlight_device *bdev)
+static int ssd13xx_update_bl(struct backlight_device *bdev)
 {
-	struct ssd130x_device *ssd130x = bl_get_data(bdev);
+	struct ssd13xx_device *ssd13xx = bl_get_data(bdev);
 	int brightness = backlight_get_brightness(bdev);
 	int ret;
 
-	ssd130x->contrast = brightness;
+	ssd13xx->contrast = brightness;
 
-	ret = ssd130x_write_cmd(ssd130x, 1, SSD130X_CONTRAST);
+	ret = ssd13xx_write_cmd(ssd13xx, 1, SSD130X_CONTRAST);
 	if (ret < 0)
 		return ret;
 
-	ret = ssd130x_write_cmd(ssd130x, 1, ssd130x->contrast);
+	ret = ssd13xx_write_cmd(ssd13xx, 1, ssd13xx->contrast);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static const struct backlight_ops ssd130xfb_bl_ops = {
-	.update_status	= ssd130x_update_bl,
+static const struct backlight_ops ssd13xxfb_bl_ops = {
+	.update_status	= ssd13xx_update_bl,
 };
 
-static void ssd130x_parse_properties(struct ssd130x_device *ssd130x)
+static void ssd13xx_parse_properties(struct ssd13xx_device *ssd13xx)
 {
-	struct device *dev = ssd130x->dev;
+	struct device *dev = ssd13xx->dev;
 
-	if (device_property_read_u32(dev, "solomon,width", &ssd130x->width))
-		ssd130x->width = ssd130x->device_info->default_width;
+	if (device_property_read_u32(dev, "solomon,width", &ssd13xx->width))
+		ssd13xx->width = ssd13xx->device_info->default_width;
 
-	if (device_property_read_u32(dev, "solomon,height", &ssd130x->height))
-		ssd130x->height = ssd130x->device_info->default_height;
+	if (device_property_read_u32(dev, "solomon,height", &ssd13xx->height))
+		ssd13xx->height = ssd13xx->device_info->default_height;
 
-	if (device_property_read_u32(dev, "solomon,page-offset", &ssd130x->page_offset))
-		ssd130x->page_offset = 1;
+	if (device_property_read_u32(dev, "solomon,page-offset", &ssd13xx->page_offset))
+		ssd13xx->page_offset = 1;
 
-	if (device_property_read_u32(dev, "solomon,col-offset", &ssd130x->col_offset))
-		ssd130x->col_offset = 0;
+	if (device_property_read_u32(dev, "solomon,col-offset", &ssd13xx->col_offset))
+		ssd13xx->col_offset = 0;
 
-	if (device_property_read_u32(dev, "solomon,com-offset", &ssd130x->com_offset))
-		ssd130x->com_offset = 0;
+	if (device_property_read_u32(dev, "solomon,com-offset", &ssd13xx->com_offset))
+		ssd13xx->com_offset = 0;
 
-	if (device_property_read_u32(dev, "solomon,prechargep1", &ssd130x->prechargep1))
-		ssd130x->prechargep1 = 2;
+	if (device_property_read_u32(dev, "solomon,prechargep1", &ssd13xx->prechargep1))
+		ssd13xx->prechargep1 = 2;
 
-	if (device_property_read_u32(dev, "solomon,prechargep2", &ssd130x->prechargep2))
-		ssd130x->prechargep2 = 2;
+	if (device_property_read_u32(dev, "solomon,prechargep2", &ssd13xx->prechargep2))
+		ssd13xx->prechargep2 = 2;
 
 	if (!device_property_read_u8_array(dev, "solomon,lookup-table",
-					   ssd130x->lookup_table,
-					   ARRAY_SIZE(ssd130x->lookup_table)))
-		ssd130x->lookup_table_set = 1;
-
-	ssd130x->seg_remap = !device_property_read_bool(dev, "solomon,segment-no-remap");
-	ssd130x->com_seq = device_property_read_bool(dev, "solomon,com-seq");
-	ssd130x->com_lrremap = device_property_read_bool(dev, "solomon,com-lrremap");
-	ssd130x->com_invdir = device_property_read_bool(dev, "solomon,com-invdir");
-	ssd130x->area_color_enable =
+					   ssd13xx->lookup_table,
+					   ARRAY_SIZE(ssd13xx->lookup_table)))
+		ssd13xx->lookup_table_set = 1;
+
+	ssd13xx->seg_remap = !device_property_read_bool(dev, "solomon,segment-no-remap");
+	ssd13xx->com_seq = device_property_read_bool(dev, "solomon,com-seq");
+	ssd13xx->com_lrremap = device_property_read_bool(dev, "solomon,com-lrremap");
+	ssd13xx->com_invdir = device_property_read_bool(dev, "solomon,com-invdir");
+	ssd13xx->area_color_enable =
 		device_property_read_bool(dev, "solomon,area-color-enable");
-	ssd130x->low_power = device_property_read_bool(dev, "solomon,low-power");
+	ssd13xx->low_power = device_property_read_bool(dev, "solomon,low-power");
 
-	ssd130x->contrast = 127;
-	ssd130x->vcomh = ssd130x->device_info->default_vcomh;
+	ssd13xx->contrast = 127;
+	ssd13xx->vcomh = ssd13xx->device_info->default_vcomh;
 
 	/* Setup display timing */
-	if (device_property_read_u32(dev, "solomon,dclk-div", &ssd130x->dclk_div))
-		ssd130x->dclk_div = ssd130x->device_info->default_dclk_div;
-	if (device_property_read_u32(dev, "solomon,dclk-frq", &ssd130x->dclk_frq))
-		ssd130x->dclk_frq = ssd130x->device_info->default_dclk_frq;
+	if (device_property_read_u32(dev, "solomon,dclk-div", &ssd13xx->dclk_div))
+		ssd13xx->dclk_div = ssd13xx->device_info->default_dclk_div;
+	if (device_property_read_u32(dev, "solomon,dclk-frq", &ssd13xx->dclk_frq))
+		ssd13xx->dclk_frq = ssd13xx->device_info->default_dclk_frq;
 }
 
-static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
+static int ssd13xx_init_modeset(struct ssd13xx_device *ssd13xx)
 {
-	struct drm_display_mode *mode = &ssd130x->mode;
-	struct device *dev = ssd130x->dev;
-	struct drm_device *drm = &ssd130x->drm;
+	struct drm_display_mode *mode = &ssd13xx->mode;
+	struct device *dev = ssd13xx->dev;
+	struct drm_device *drm = &ssd13xx->drm;
 	unsigned long max_width, max_height;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
@@ -1092,10 +1092,10 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 
 	mode->type = DRM_MODE_TYPE_DRIVER;
 	mode->clock = 1;
-	mode->hdisplay = mode->htotal = ssd130x->width;
-	mode->hsync_start = mode->hsync_end = ssd130x->width;
-	mode->vdisplay = mode->vtotal = ssd130x->height;
-	mode->vsync_start = mode->vsync_end = ssd130x->height;
+	mode->hdisplay = mode->htotal = ssd13xx->width;
+	mode->hsync_start = mode->hsync_end = ssd13xx->width;
+	mode->vdisplay = mode->vtotal = ssd13xx->height;
+	mode->vsync_start = mode->vsync_end = ssd13xx->height;
 	mode->width_mm = 27;
 	mode->height_mm = 27;
 
@@ -1107,60 +1107,60 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 	drm->mode_config.min_height = mode->vdisplay;
 	drm->mode_config.max_height = max_height;
 	drm->mode_config.preferred_depth = 24;
-	drm->mode_config.funcs = &ssd130x_mode_config_funcs;
+	drm->mode_config.funcs = &ssd13xx_mode_config_funcs;
 
 	/* Primary plane */
 
-	primary_plane = &ssd130x->primary_plane;
-	ret = drm_universal_plane_init(drm, primary_plane, 0, &ssd130x_primary_plane_funcs,
-				       ssd130x_formats, ARRAY_SIZE(ssd130x_formats),
+	primary_plane = &ssd13xx->primary_plane;
+	ret = drm_universal_plane_init(drm, primary_plane, 0, &ssd13xx_primary_plane_funcs,
+				       ssd13xx_formats, ARRAY_SIZE(ssd13xx_formats),
 				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
 	if (ret) {
 		dev_err(dev, "DRM primary plane init failed: %d\n", ret);
 		return ret;
 	}
 
-	drm_plane_helper_add(primary_plane, &ssd130x_primary_plane_helper_funcs);
+	drm_plane_helper_add(primary_plane, &ssd13xx_primary_plane_helper_funcs);
 
 	drm_plane_enable_fb_damage_clips(primary_plane);
 
 	/* CRTC */
 
-	crtc = &ssd130x->crtc;
+	crtc = &ssd13xx->crtc;
 	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
-					&ssd130x_crtc_funcs, NULL);
+					&ssd13xx_crtc_funcs, NULL);
 	if (ret) {
 		dev_err(dev, "DRM crtc init failed: %d\n", ret);
 		return ret;
 	}
 
-	drm_crtc_helper_add(crtc, &ssd130x_crtc_helper_funcs);
+	drm_crtc_helper_add(crtc, &ssd13xx_crtc_helper_funcs);
 
 	/* Encoder */
 
-	encoder = &ssd130x->encoder;
-	ret = drm_encoder_init(drm, encoder, &ssd130x_encoder_funcs,
+	encoder = &ssd13xx->encoder;
+	ret = drm_encoder_init(drm, encoder, &ssd13xx_encoder_funcs,
 			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(dev, "DRM encoder init failed: %d\n", ret);
 		return ret;
 	}
 
-	drm_encoder_helper_add(encoder, &ssd130x_encoder_helper_funcs);
+	drm_encoder_helper_add(encoder, &ssd13xx_encoder_helper_funcs);
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	/* Connector */
 
-	connector = &ssd130x->connector;
-	ret = drm_connector_init(drm, connector, &ssd130x_connector_funcs,
+	connector = &ssd13xx->connector;
+	ret = drm_connector_init(drm, connector, &ssd13xx_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret) {
 		dev_err(dev, "DRM connector init failed: %d\n", ret);
 		return ret;
 	}
 
-	drm_connector_helper_add(connector, &ssd130x_connector_helper_funcs);
+	drm_connector_helper_add(connector, &ssd13xx_connector_helper_funcs);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
@@ -1173,62 +1173,62 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 	return 0;
 }
 
-static int ssd130x_get_resources(struct ssd130x_device *ssd130x)
+static int ssd13xx_get_resources(struct ssd13xx_device *ssd13xx)
 {
-	struct device *dev = ssd130x->dev;
+	struct device *dev = ssd13xx->dev;
 
-	ssd130x->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ssd130x->reset))
-		return dev_err_probe(dev, PTR_ERR(ssd130x->reset),
+	ssd13xx->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ssd13xx->reset))
+		return dev_err_probe(dev, PTR_ERR(ssd13xx->reset),
 				     "Failed to get reset gpio\n");
 
-	ssd130x->vcc_reg = devm_regulator_get(dev, "vcc");
-	if (IS_ERR(ssd130x->vcc_reg))
-		return dev_err_probe(dev, PTR_ERR(ssd130x->vcc_reg),
+	ssd13xx->vcc_reg = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ssd13xx->vcc_reg))
+		return dev_err_probe(dev, PTR_ERR(ssd13xx->vcc_reg),
 				     "Failed to get VCC regulator\n");
 
 	return 0;
 }
 
-struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
+struct ssd13xx_device *ssd13xx_probe(struct device *dev, struct regmap *regmap)
 {
-	struct ssd130x_device *ssd130x;
+	struct ssd13xx_device *ssd13xx;
 	struct backlight_device *bl;
 	struct drm_device *drm;
 	int ret;
 
-	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
-				     struct ssd130x_device, drm);
-	if (IS_ERR(ssd130x))
-		return ERR_PTR(dev_err_probe(dev, PTR_ERR(ssd130x),
+	ssd13xx = devm_drm_dev_alloc(dev, &ssd13xx_drm_driver,
+				     struct ssd13xx_device, drm);
+	if (IS_ERR(ssd13xx))
+		return ERR_PTR(dev_err_probe(dev, PTR_ERR(ssd13xx),
 					     "Failed to allocate DRM device\n"));
 
-	drm = &ssd130x->drm;
+	drm = &ssd13xx->drm;
 
-	ssd130x->dev = dev;
-	ssd130x->regmap = regmap;
-	ssd130x->device_info = device_get_match_data(dev);
+	ssd13xx->dev = dev;
+	ssd13xx->regmap = regmap;
+	ssd13xx->device_info = device_get_match_data(dev);
 
-	if (ssd130x->device_info->page_mode_only)
-		ssd130x->page_address_mode = 1;
+	if (ssd13xx->device_info->page_mode_only)
+		ssd13xx->page_address_mode = 1;
 
-	ssd130x_parse_properties(ssd130x);
+	ssd13xx_parse_properties(ssd13xx);
 
-	ret = ssd130x_get_resources(ssd130x);
+	ret = ssd13xx_get_resources(ssd13xx);
 	if (ret)
 		return ERR_PTR(ret);
 
-	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
-					    &ssd130xfb_bl_ops, NULL);
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd13xx,
+					    &ssd13xxfb_bl_ops, NULL);
 	if (IS_ERR(bl))
 		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bl),
 					     "Unable to register backlight device\n"));
 
-	bl->props.brightness = ssd130x->contrast;
+	bl->props.brightness = ssd13xx->contrast;
 	bl->props.max_brightness = MAX_CONTRAST;
-	ssd130x->bl_dev = bl;
+	ssd13xx->bl_dev = bl;
 
-	ret = ssd130x_init_modeset(ssd130x);
+	ret = ssd13xx_init_modeset(ssd13xx);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1238,22 +1238,22 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 
 	drm_fbdev_generic_setup(drm, 32);
 
-	return ssd130x;
+	return ssd13xx;
 }
-EXPORT_SYMBOL_GPL(ssd130x_probe);
+EXPORT_SYMBOL_GPL(ssd13xx_probe);
 
-void ssd130x_remove(struct ssd130x_device *ssd130x)
+void ssd13xx_remove(struct ssd13xx_device *ssd13xx)
 {
-	drm_dev_unplug(&ssd130x->drm);
-	drm_atomic_helper_shutdown(&ssd130x->drm);
+	drm_dev_unplug(&ssd13xx->drm);
+	drm_atomic_helper_shutdown(&ssd13xx->drm);
 }
-EXPORT_SYMBOL_GPL(ssd130x_remove);
+EXPORT_SYMBOL_GPL(ssd13xx_remove);
 
-void ssd130x_shutdown(struct ssd130x_device *ssd130x)
+void ssd13xx_shutdown(struct ssd13xx_device *ssd13xx)
 {
-	drm_atomic_helper_shutdown(&ssd130x->drm);
+	drm_atomic_helper_shutdown(&ssd13xx->drm);
 }
-EXPORT_SYMBOL_GPL(ssd130x_shutdown);
+EXPORT_SYMBOL_GPL(ssd13xx_shutdown);
 
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
diff --git a/drivers/gpu/drm/solomon/ssd13xx.h b/drivers/gpu/drm/solomon/ssd13xx.h
index f89ccd11cd29..e5abf23196b0 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.h
+++ b/drivers/gpu/drm/solomon/ssd13xx.h
@@ -24,16 +24,16 @@
 #define SSD130X_DATA				0x40
 #define SSD130X_COMMAND				0x80
 
-enum ssd130x_variants {
+enum ssd13xx_variants {
 	SH1106_ID,
 	SSD1305_ID,
 	SSD1306_ID,
 	SSD1307_ID,
 	SSD1309_ID,
-	NR_SSD130X_VARIANTS
+	NR_SSD13XX_VARIANTS
 };
 
-struct ssd130x_deviceinfo {
+struct ssd13xx_deviceinfo {
 	u32 default_vcomh;
 	u32 default_dclk_div;
 	u32 default_dclk_frq;
@@ -45,7 +45,7 @@ struct ssd130x_deviceinfo {
 	bool page_mode_only;
 };
 
-struct ssd130x_device {
+struct ssd13xx_device {
 	struct drm_device drm;
 	struct device *dev;
 	struct drm_display_mode mode;
@@ -57,7 +57,7 @@ struct ssd130x_device {
 
 	struct regmap *regmap;
 
-	const struct ssd130x_deviceinfo *device_info;
+	const struct ssd13xx_deviceinfo *device_info;
 
 	unsigned page_address_mode : 1;
 	unsigned area_color_enable : 1;
@@ -91,10 +91,10 @@ struct ssd130x_device {
 	u8 page_end;
 };
 
-extern const struct ssd130x_deviceinfo ssd130x_variants[];
+extern const struct ssd13xx_deviceinfo ssd13xx_variants[];
 
-struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap);
-void ssd130x_remove(struct ssd130x_device *ssd130x);
-void ssd130x_shutdown(struct ssd130x_device *ssd130x);
+struct ssd13xx_device *ssd13xx_probe(struct device *dev, struct regmap *regmap);
+void ssd13xx_remove(struct ssd13xx_device *ssd13xx);
+void ssd13xx_shutdown(struct ssd13xx_device *ssd13xx);
 
 #endif /* __SSD13XX_H__ */
-- 
2.41.0

