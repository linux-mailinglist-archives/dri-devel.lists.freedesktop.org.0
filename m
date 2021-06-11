Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC033A4ABD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 23:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD13B6F3DD;
	Fri, 11 Jun 2021 21:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473CC6F3DD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:44:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j20so10577681lfe.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKkC/HLwK4dy4ppkMfGRNZeMcfVr6SydoDUnwNluEeQ=;
 b=YqUaaB24U0Mtdztms6x9fvHoE2bIey7Oltadnc7ZmyjSPH72xWUpLl/+SmWtDN/U15
 wGSRdwon6rYrysSMITd92T8KgA6tkBZeWiFBN1amRaW+aQ9F2jNaBvXg3P3K5gCdqVuE
 wiuLZ9Ykiq17W/g3fvb9QXbxUcUMcgydK4TlS1nPFzM99EIJ32v4AHe/opcNKtuJTxJA
 lh8K73l+QuRwB+qpn5mgI2xe/+N2EqMErTIMpwNyE/bxjYXNixajOpnMxG38uhDVrZ3e
 vek9ogjv0oGlL3GXxLOVFHNDrV3YpteMHVR2r7NAErQ7oGFe37LAZck6UTCAvk9X5wAp
 YdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XKkC/HLwK4dy4ppkMfGRNZeMcfVr6SydoDUnwNluEeQ=;
 b=oVxeCegvz4Af+O9tQGws4sV1BopYAtdDhIkjU/2yCQr5Rrcrfh18AnEaF/KIGBoPCc
 /nyweLbJ5KW4R5H7S8FeCl2Sg51QYNJ182rt/nDJFkYL2LVYyHgtU6uzNOvoWp7rzNPc
 qsWK6JSg6ck8DLa37GQcJ9XgMv7Yr4SYKza09ZpSLJ0yIXVkfQ7SIvcrabBSXPR51GB8
 pKpg3s+ExEa1L7Q+mjPJbxHGCzwUxchOAoRISwtMglPgkff6Zfy1AKH4gXoUoAEQaChV
 qVnz+2Oz6bCGyG04WZj8ZoaWORqVbDgVt55509GfhGfReot43ClqFE5ekfDHdTXNlajD
 K0SQ==
X-Gm-Message-State: AOAM533yse1QgFf4ku/AqASHtmgV1kF/qy+VWOVkdWiw41Ot9/BjCLhT
 2L6VHNHSsCaMgJY8lEfL9dK2ew==
X-Google-Smtp-Source: ABdhPJxRYEGEJFrzkNI9UJmS5fg5iRSN2DwLkoB2tAOxDA3/edsymOwfcvhAo74ShnPBmqoVDVkkuA==
X-Received: by 2002:a05:6512:3b3:: with SMTP id
 v19mr3833619lfp.516.1623447887483; 
 Fri, 11 Jun 2021 14:44:47 -0700 (PDT)
Received: from localhost.localdomain ([92.34.204.253])
 by smtp.gmail.com with ESMTPSA id p3sm703922lfa.116.2021.06.11.14.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 14:44:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/panel: s6e63m0: Switch to DBI abstraction for SPI
Date: Fri, 11 Jun 2021 23:42:43 +0200
Message-Id: <20210611214243.669892-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
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

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                 |  1 +
 .../gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 10 ++-
 .../gpu/drm/panel/panel-samsung-s6e63m0-spi.c | 85 ++++++++-----------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 41 ++-------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.h | 33 ++++++-
 5 files changed, 81 insertions(+), 89 deletions(-)

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
index 326deb3177b6..293c18ee448a 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
@@ -5,62 +5,42 @@
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
+	else
+		dev_dbg(dev, "read DBI %02x\n", *data);
 
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
+	struct mipi_dbi *dbi = trsp;
+	int ret;
 
 	dev_dbg(dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
 
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
-
+	ret = mipi_dbi_command_stackbuf(dbi, data[0], (data + 1), (len - 1));
 	usleep_range(300, 310);
 
 	return ret;
@@ -69,18 +49,23 @@ static int s6e63m0_spi_dcs_write(struct device *dev, const u8 *data, size_t len)
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
+	spi_set_drvdata(spi, dbi);
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

