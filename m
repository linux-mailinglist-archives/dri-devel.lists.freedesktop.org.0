Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081273A6E0F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 20:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1AC6E16F;
	Mon, 14 Jun 2021 18:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABE66E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 18:14:08 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id 131so21455297ljj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+I5AQnIRUr57Yb8Y6iWU0aMstwZFGsln50eOY3JGWM=;
 b=KbJza0+3KRM8d33VC11cG5UhXXNreyiM64EdJaB12IZqTBDCbhcQslLzkA6J41pJbc
 ePb+wEnfVrVIXXdYd4lKUMBhd8pTGpVlNvN/RpPhm0xjn7OAdtBae0iFOQmuDz/1dXbd
 UM3kFPdXvU6DwBGOB3QK1OAO5KY0NbkCtkfbp7eOwyoIf3S758maj5GzE8QBmlgxGIyB
 7lK8b9ErHE3OZwPjRiXqDSjUxj/ijSf7cEVxWDxytVjqOf4bFzf8bRvhB0vzrWDrphtq
 QvNN0wIIS9lKJX6pZT/dIK+fJnyR4KErlSaj20S58B6RsRQlxIv8FyzHa74pI7ESlNRU
 nhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+I5AQnIRUr57Yb8Y6iWU0aMstwZFGsln50eOY3JGWM=;
 b=OsFxH2Sx+rLpOqKbJb9i/6lcCjcFzV76h3Aw0Wb+9VBf5CF7YU2Xl3/fKUy3TVnYlx
 j3WeoRFrnHscFyaQ3y4dTOV1fcybevAHnZ9xwa544w6h/YXEgeQSZH/3IAMLcS3Wy79h
 wnPRs47nOq++lzoYf9aFbZ0YB+IrKgrWzsdG4/rO9IaFE78o4tqv6p05yJ+GhM7OU9tt
 nh40/3PJSm8BXjg+n8LXCr09a7M9QUtM1wY66dI2KSNpExCArrFvuMEdo6SBHs0uhhUc
 vZn30R49bOaeOComv2q+bdyzlRxe5ChcGaunuPBIwG4Fzs3m0JuK7NuGD/bLvG+xmBRF
 753Q==
X-Gm-Message-State: AOAM532pnc/BSKWosx78qSvLxD57SX7jQKm+oZffhQYqeUZ3jDC6JsCl
 hc+JOSBn1Z/UHs4esyea5hWLTg==
X-Google-Smtp-Source: ABdhPJwOwCDdyrjeG46Z+azjeoMQZwRzdWlxKpWqN1YFfU++d5v0DeeJmOVKcv09DoT6utrTXaIHSw==
X-Received: by 2002:a2e:6c09:: with SMTP id h9mr14303771ljc.434.1623694447118; 
 Mon, 14 Jun 2021 11:14:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id v26sm1678013lfp.0.2021.06.14.11.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 11:14:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2 v2] drm/panel: s6e63m0: Switch to DBI abstraction for SPI
Date: Mon, 14 Jun 2021 20:11:35 +0200
Message-Id: <20210614181135.1124445-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614181135.1124445-1-linus.walleij@linaro.org>
References: <20210614181135.1124445-1-linus.walleij@linaro.org>
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SPI access to s6e63m0 is using the DBI protocol, so switch
to using the elaborate DBI protocol implementation in the DRM
DBI helper library.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop two debug prints
- Drop development artifact spi_set_drvdata()
- Collect Noralf's ACK
- Collect Doug's Reviewed-by
---
 drivers/gpu/drm/panel/Kconfig                 |  1 +
 .../gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 10 ++-
 .../gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 83 +++++++------------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 41 ++-------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h | 33 +++++++-
 5 files changed, 77 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..324b932ac213 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -376,6 +376,7 @@ config DRM_PANEL_SAMSUNG_S6E63M0_SPI
 	depends on SPI
 	depends on DRM_PANEL_SAMSUNG_S6E63M0
 	default DRM_PANEL_SAMSUNG_S6E63M0
+	select DRM_MIPI_DBI
 	help
 	  Say Y here if you want to be able to access the Samsung
 	  S6E63M0 panel using SPI.
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
index 07a48f621289..e0b1a7e354f3 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
@@ -16,7 +16,8 @@
 #define MCS_GLOBAL_PARAM	0xb0
 #define S6E63M0_DSI_MAX_CHUNK	15 /* CMD + 15 bytes max */
 
-static int s6e63m0_dsi_dcs_read(struct device *dev, const u8 cmd, u8 *data)
+static int s6e63m0_dsi_dcs_read(struct device *dev, void *trsp,
+				const u8 cmd, u8 *data)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 	int ret;
@@ -32,7 +33,8 @@ static int s6e63m0_dsi_dcs_read(struct device *dev, const u8 cmd, u8 *data)
 	return 0;
 }
 
-static int s6e63m0_dsi_dcs_write(struct device *dev, const u8 *data, size_t len)
+static int s6e63m0_dsi_dcs_write(struct device *dev, void *trsp,
+				 const u8 *data, size_t len)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 	const u8 *seqp = data;
@@ -99,8 +101,8 @@ static int s6e63m0_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 		MIPI_DSI_MODE_VIDEO_BURST;
 
-	ret = s6e63m0_probe(dev, s6e63m0_dsi_dcs_read, s6e63m0_dsi_dcs_write,
-			    true);
+	ret = s6e63m0_probe(dev, NULL, s6e63m0_dsi_dcs_read,
+			    s6e63m0_dsi_dcs_write, true);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
index 326deb3177b6..3669cc3719ce 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
@@ -5,62 +5,38 @@
 #include <linux/spi/spi.h>
 #include <linux/delay.h>
 
+#include <drm/drm_mipi_dbi.h>
 #include <drm/drm_print.h>
 
 #include "panel-samsung-s6e63m0.h"
 
-#define DATA_MASK	0x100
+static const u8 s6e63m0_dbi_read_commands[] = {
+	MCS_READ_ID1,
+	MCS_READ_ID2,
+	MCS_READ_ID3,
+	0, /* sentinel */
+};
 
-static int s6e63m0_spi_dcs_read(struct device *dev, const u8 cmd, u8 *data)
+static int s6e63m0_spi_dcs_read(struct device *dev, void *trsp,
+				const u8 cmd, u8 *data)
 {
-	struct spi_device *spi = to_spi_device(dev);
-	u16 buf[1];
-	u16 rbuf[1];
+	struct mipi_dbi *dbi = trsp;
 	int ret;
 
-	/* SPI buffers are always in CPU order */
-	buf[0] = (u16)cmd;
-	ret = spi_write_then_read(spi, buf, 2, rbuf, 2);
-	dev_dbg(dev, "READ CMD: %04x RET: %04x\n", buf[0], rbuf[0]);
-	if (!ret)
-		/* These high 8 bits of the 9 contains the readout */
-		*data = (rbuf[0] & 0x1ff) >> 1;
+	ret = mipi_dbi_command_read(dbi, cmd, data);
+	if (ret)
+		dev_err(dev, "error on DBI read command %02x\n", cmd);
 
 	return ret;
 }
 
-static int s6e63m0_spi_write_word(struct device *dev, u16 data)
-{
-	struct spi_device *spi = to_spi_device(dev);
-
-	/* SPI buffers are always in CPU order */
-	return spi_write(spi, &data, 2);
-}
-
-static int s6e63m0_spi_dcs_write(struct device *dev, const u8 *data, size_t len)
+static int s6e63m0_spi_dcs_write(struct device *dev, void *trsp,
+				 const u8 *data, size_t len)
 {
-	int ret = 0;
-
-	dev_dbg(dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
-
-	/*
-	 * This sends 9 bits with the first bit (bit 8) set to 0
-	 * This indicates that this is a command. Anything after the
-	 * command is data.
-	 */
-	ret = s6e63m0_spi_write_word(dev, *data);
-
-	while (!ret && --len) {
-		++data;
-		/* This sends 9 bits with the first bit (bit 8) set to 1 */
-		ret = s6e63m0_spi_write_word(dev, *data | DATA_MASK);
-	}
-
-	if (ret) {
-		dev_err(dev, "SPI error %d writing dcs seq: %*ph\n", ret,
-			(int)len, data);
-	}
+	struct mipi_dbi *dbi = trsp;
+	int ret;
 
+	ret = mipi_dbi_command_stackbuf(dbi, data[0], (data + 1), (len - 1));
 	usleep_range(300, 310);
 
 	return ret;
@@ -69,18 +45,21 @@ static int s6e63m0_spi_dcs_write(struct device *dev, const u8 *data, size_t len)
 static int s6e63m0_spi_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	struct mipi_dbi *dbi;
 	int ret;
 
-	spi->bits_per_word = 9;
-	/* Preserve e.g. SPI_3WIRE setting */
-	spi->mode |= SPI_MODE_3;
-	ret = spi_setup(spi);
-	if (ret < 0) {
-		dev_err(dev, "spi setup failed.\n");
-		return ret;
-	}
-	return s6e63m0_probe(dev, s6e63m0_spi_dcs_read, s6e63m0_spi_dcs_write,
-			     false);
+	dbi = devm_kzalloc(dev, sizeof(*dbi), GFP_KERNEL);
+	if (!dbi)
+		return -ENOMEM;
+
+	ret = mipi_dbi_spi_init(spi, dbi, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
+	/* Register our custom MCS read commands */
+	dbi->read_commands = s6e63m0_dbi_read_commands;
+
+	return s6e63m0_probe(dev, dbi, s6e63m0_spi_dcs_read,
+			     s6e63m0_spi_dcs_write, false);
 }
 
 static int s6e63m0_spi_remove(struct spi_device *spi)
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index 5e4d2e8aa7a7..3a8a772245c0 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -24,31 +24,6 @@
 
 #include "panel-samsung-s6e63m0.h"
 
-/* Manufacturer Command Set */
-#define MCS_ELVSS_ON		0xb1
-#define MCS_TEMP_SWIRE		0xb2
-#define MCS_PENTILE_1		0xb3
-#define MCS_PENTILE_2		0xb4
-#define MCS_GAMMA_DELTA_Y_RED	0xb5
-#define MCS_GAMMA_DELTA_X_RED	0xb6
-#define MCS_GAMMA_DELTA_Y_GREEN	0xb7
-#define MCS_GAMMA_DELTA_X_GREEN	0xb8
-#define MCS_GAMMA_DELTA_Y_BLUE	0xb9
-#define MCS_GAMMA_DELTA_X_BLUE	0xba
-#define MCS_MIECTL1		0xc0
-#define MCS_BCMODE		0xc1
-#define MCS_ERROR_CHECK		0xd5
-#define MCS_READ_ID1		0xda
-#define MCS_READ_ID2		0xdb
-#define MCS_READ_ID3		0xdc
-#define MCS_LEVEL_2_KEY		0xf0
-#define MCS_MTP_KEY		0xf1
-#define MCS_DISCTL		0xf2
-#define MCS_SRCCTL		0xf6
-#define MCS_IFCTL		0xf7
-#define MCS_PANELCTL		0xf8
-#define MCS_PGAMMACTL		0xfa
-
 #define S6E63M0_LCD_ID_VALUE_M2		0xA4
 #define S6E63M0_LCD_ID_VALUE_SM2	0xB4
 #define S6E63M0_LCD_ID_VALUE_SM2_1	0xB6
@@ -285,8 +260,9 @@ static u8 const s6e63m0_elvss_per_gamma[NUM_GAMMA_LEVELS] = {
 
 struct s6e63m0 {
 	struct device *dev;
-	int (*dcs_read)(struct device *dev, const u8 cmd, u8 *val);
-	int (*dcs_write)(struct device *dev, const u8 *data, size_t len);
+	void *transport_data;
+	int (*dcs_read)(struct device *dev, void *trsp, const u8 cmd, u8 *val);
+	int (*dcs_write)(struct device *dev, void *trsp, const u8 *data, size_t len);
 	struct drm_panel panel;
 	struct backlight_device *bl_dev;
 	u8 lcd_type;
@@ -342,7 +318,7 @@ static void s6e63m0_dcs_read(struct s6e63m0 *ctx, const u8 cmd, u8 *data)
 	if (ctx->error < 0)
 		return;
 
-	ctx->error = ctx->dcs_read(ctx->dev, cmd, data);
+	ctx->error = ctx->dcs_read(ctx->dev, ctx->transport_data, cmd, data);
 }
 
 static void s6e63m0_dcs_write(struct s6e63m0 *ctx, const u8 *data, size_t len)
@@ -350,7 +326,7 @@ static void s6e63m0_dcs_write(struct s6e63m0 *ctx, const u8 *data, size_t len)
 	if (ctx->error < 0 || len == 0)
 		return;
 
-	ctx->error = ctx->dcs_write(ctx->dev, data, len);
+	ctx->error = ctx->dcs_write(ctx->dev, ctx->transport_data, data, len);
 }
 
 #define s6e63m0_dcs_write_seq_static(ctx, seq ...) \
@@ -727,9 +703,9 @@ static irqreturn_t s6e63m0_esd_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-int s6e63m0_probe(struct device *dev,
-		  int (*dcs_read)(struct device *dev, const u8 cmd, u8 *val),
-		  int (*dcs_write)(struct device *dev, const u8 *data, size_t len),
+int s6e63m0_probe(struct device *dev, void *trsp,
+		  int (*dcs_read)(struct device *dev, void *trsp, const u8 cmd, u8 *val),
+		  int (*dcs_write)(struct device *dev, void *trsp, const u8 *data, size_t len),
 		  bool dsi_mode)
 {
 	struct s6e63m0 *ctx;
@@ -741,6 +717,7 @@ int s6e63m0_probe(struct device *dev,
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->transport_data = trsp;
 	ctx->dsi_mode = dsi_mode;
 	ctx->dcs_read = dcs_read;
 	ctx->dcs_write = dcs_write;
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
index c669fec91763..306605ed1117 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.h
@@ -3,9 +3,36 @@
 #ifndef _PANEL_SAMSUNG_S6E63M0_H
 #define _PANEL_SAMSUNG_S6E63M0_H
 
-int s6e63m0_probe(struct device *dev,
-		  int (*dcs_read)(struct device *dev, const u8 cmd, u8 *val),
-		  int (*dcs_write)(struct device *dev, const u8 *data,
+/* Manufacturer Command Set */
+#define MCS_ELVSS_ON		0xb1
+#define MCS_TEMP_SWIRE		0xb2
+#define MCS_PENTILE_1		0xb3
+#define MCS_PENTILE_2		0xb4
+#define MCS_GAMMA_DELTA_Y_RED	0xb5
+#define MCS_GAMMA_DELTA_X_RED	0xb6
+#define MCS_GAMMA_DELTA_Y_GREEN	0xb7
+#define MCS_GAMMA_DELTA_X_GREEN	0xb8
+#define MCS_GAMMA_DELTA_Y_BLUE	0xb9
+#define MCS_GAMMA_DELTA_X_BLUE	0xba
+#define MCS_MIECTL1		0xc0
+#define MCS_BCMODE		0xc1
+#define MCS_ERROR_CHECK		0xd5
+#define MCS_READ_ID1		0xda
+#define MCS_READ_ID2		0xdb
+#define MCS_READ_ID3		0xdc
+#define MCS_LEVEL_2_KEY		0xf0
+#define MCS_MTP_KEY		0xf1
+#define MCS_DISCTL		0xf2
+#define MCS_SRCCTL		0xf6
+#define MCS_IFCTL		0xf7
+#define MCS_PANELCTL		0xf8
+#define MCS_PGAMMACTL		0xfa
+
+int s6e63m0_probe(struct device *dev, void *trsp,
+		  int (*dcs_read)(struct device *dev, void *trsp,
+				  const u8 cmd, u8 *val),
+		  int (*dcs_write)(struct device *dev, void *trsp,
+				   const u8 *data,
 				   size_t len),
 		  bool dsi_mode);
 int s6e63m0_remove(struct device *dev);
-- 
2.31.1

