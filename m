Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3033125EDF6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Sep 2020 15:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81BC6E05D;
	Sun,  6 Sep 2020 13:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52C6E05D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Sep 2020 13:29:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k25so12991330ljg.9
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Sep 2020 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQ7YOWjeZqzu+1D8RA/tngDdTRiaTxVQqJg3mjkIHrY=;
 b=RoMn5bnw/Qst0X027w/4bODWD8d33zVEzCzlmHhDLeJqluFXLmLCz7Z/MHAyy/uGyu
 DSMHQce6pkS/Hx51Myx2GSLvSb34kLgr1UCLqfAfcUU4JPGdg3bZqNYJGmbrWQtBXtkP
 yBGqoAkVnGhXoGvM1yxN3cS7/MXfyJ6vC4sQfGGb7cGeevL+QlxJHLumd5VTvZm0gbVQ
 JUjE+f8rd+eZYMGGBLHytECyvAkLhdiM18FiHL1d1MDC6yE49Ie4K2/YOsncLOLHTPmZ
 1/zj0N5s3zjXWnzNAgvBRhchT76II0mEl1+sRBTwg5qEdKgZJgpkVXQlo3V3adO5T609
 1SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IQ7YOWjeZqzu+1D8RA/tngDdTRiaTxVQqJg3mjkIHrY=;
 b=BqWjCW7jNxMefQlKH6YMUDPyC6E+huYCu27O8uJg5k+vwjRcoQ0AFZq3VT0AtsMkVx
 k67SoMb7S4i/JCV6jS6ISfv9JlS83GtbtLxB9kkdu0y9J61tYGiiPXiQSPuaRt+CoRQN
 WGNB/4QCQF8zoeECTsO+gGZNY1UZgZi4gMWjGNzNa/AAUmuGXSD0XhiMVAgu8ugZbl/d
 1oXdm9QpnQvfXEzQO/+/STRF7WfhevUW/6cETr+Zi66Or9y+auyd0MgeOv/ZMRCWDrqM
 4sOunfxBf5xanQf+uNIssvQQ2CZvuLV/YdJ/BGLPpL1fbuiIW2OTvH415Kgn90l3MmSx
 cQoA==
X-Gm-Message-State: AOAM533H1k/h9WdeVGU8B2djxp/qPspz66/E8izty2QBuicnD3IQlyYG
 hVYZfYShbFlfPrsMXiZupREsKQ==
X-Google-Smtp-Source: ABdhPJyfaKHG7owo9cZwtNl5jvg6uVq7ECH/4MbQhYj06p8PCB2lRTP9DFrcbSNlxczhUkIKRK02LA==
X-Received: by 2002:a2e:9988:: with SMTP id w8mr8700250lji.286.1599398945365; 
 Sun, 06 Sep 2020 06:29:05 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id g11sm4575913lfc.46.2020.09.06.06.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 06:29:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: s6e63m0: Fix up DRM_DEV* regression
Date: Sun,  6 Sep 2020 15:29:03 +0200
Message-Id: <20200906132903.5739-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ooops the panel drivers stopped to use DRM_DEV* messages
and we predictably create errors by merging code that
still use it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../gpu/drm/panel/panel-samsung-s6e63m0-dsi.c | 28 +++++++++----------
 .../gpu/drm/panel/panel-samsung-s6e63m0-spi.c |  8 +++---
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 18 ++++++------
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
index 2ec9e7900791..6eca6f4c0e99 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c
@@ -23,11 +23,11 @@ static int s6e63m0_dsi_dcs_read(struct device *dev, const u8 cmd, u8 *data)
 
 	ret = mipi_dsi_dcs_read(dsi, cmd, data, 1);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "could not read DCS CMD %02x\n", cmd);
+		dev_err(dev, "could not read DCS CMD %02x\n", cmd);
 		return ret;
 	}
 
-	DRM_DEV_INFO(dev, "DSI read CMD %02x = %02x\n", cmd, *data);
+	dev_info(dev, "DSI read CMD %02x = %02x\n", cmd, *data);
 
 	return 0;
 }
@@ -42,7 +42,7 @@ static int s6e63m0_dsi_dcs_write(struct device *dev, const u8 *data, size_t len)
 	int chunk;
 	int ret;
 
-	DRM_DEV_INFO(dev, "DSI writing dcs seq: %*ph\n", (int)len, data);
+	dev_info(dev, "DSI writing dcs seq: %*ph\n", (int)len, data);
 
 	/* Pick out and skip past the DCS command */
 	cmd = *seqp;
@@ -56,9 +56,9 @@ static int s6e63m0_dsi_dcs_write(struct device *dev, const u8 *data, size_t len)
 		chunk = S6E63M0_DSI_MAX_CHUNK;
 	ret = mipi_dsi_dcs_write(dsi, cmd, seqp, chunk);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dev,
-			      "error sending DCS command seq cmd %02x\n",
-			      cmd);
+		dev_err(dev,
+			"error sending DCS command seq cmd %02x\n",
+			cmd);
 		return ret;
 	}
 	cmdwritten += chunk;
@@ -70,23 +70,23 @@ static int s6e63m0_dsi_dcs_write(struct device *dev, const u8 *data, size_t len)
 			chunk = S6E63M0_DSI_MAX_CHUNK;
 		ret = mipi_dsi_dcs_write(dsi, MCS_GLOBAL_PARAM, &cmdwritten, 1);
 		if (ret < 0) {
-			DRM_DEV_ERROR(dev,
-				      "error sending CMD %02x global param %02x\n",
-				      cmd, cmdwritten);
+			dev_err(dev,
+				"error sending CMD %02x global param %02x\n",
+				cmd, cmdwritten);
 			return ret;
 		}
 		ret = mipi_dsi_dcs_write(dsi, cmd, seqp, chunk);
 		if (ret < 0) {
-			DRM_DEV_ERROR(dev,
-				      "error sending CMD %02x chunk\n",
-				      cmd);
+			dev_err(dev,
+				"error sending CMD %02x chunk\n",
+				cmd);
 			return ret;
 		}
 		cmdwritten += chunk;
 		seqp += chunk;
 	}
-	DRM_DEV_INFO(dev, "sent command %02x %02x bytes\n",
-		     cmd, cmdwritten);
+	dev_info(dev, "sent command %02x %02x bytes\n",
+		 cmd, cmdwritten);
 
 	usleep_range(8000, 9000);
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
index 3b1a2a3a44ea..d298d780220d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0-spi.c
@@ -41,7 +41,7 @@ static int s6e63m0_spi_dcs_write(struct device *dev, const u8 *data, size_t len)
 {
 	int ret = 0;
 
-	DRM_DEV_DEBUG(dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
+	dev_dbg(dev, "SPI writing dcs seq: %*ph\n", (int)len, data);
 	ret = s6e63m0_spi_write_word(dev, *data);
 
 	while (!ret && --len) {
@@ -50,8 +50,8 @@ static int s6e63m0_spi_dcs_write(struct device *dev, const u8 *data, size_t len)
 	}
 
 	if (ret) {
-		DRM_DEV_ERROR(dev, "SPI error %d writing dcs seq: %*ph\n", ret,
-			      (int)len, data);
+		dev_err(dev, "SPI error %d writing dcs seq: %*ph\n", ret,
+			(int)len, data);
 	}
 
 	usleep_range(300, 310);
@@ -68,7 +68,7 @@ static int s6e63m0_spi_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_3;
 	ret = spi_setup(spi);
 	if (ret < 0) {
-		DRM_DEV_ERROR(dev, "spi setup failed.\n");
+		dev_err(dev, "spi setup failed.\n");
 		return ret;
 	}
 	return s6e63m0_probe(dev, s6e63m0_spi_dcs_read, s6e63m0_spi_dcs_write,
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index c9472b2ae0cd..7f2fd5516958 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -179,28 +179,28 @@ static int s6e63m0_check_lcd_type(struct s6e63m0 *ctx)
 
 	ret = s6e63m0_clear_error(ctx);
 	if (ret) {
-		DRM_DEV_ERROR(ctx->dev, "error checking LCD type (%d)\n",
-			      ret);
+		dev_err(ctx->dev, "error checking LCD type (%d)\n",
+			ret);
 		ctx->lcd_type = 0x00;
 		return ret;
 	}
 
-	DRM_DEV_INFO(ctx->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
+	dev_info(ctx->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
 
 	/* We attempt to detect what panel is mounted on the controller */
 	switch (id2) {
 	case S6E63M0_LCD_ID_VALUE_M2:
-		DRM_DEV_INFO(ctx->dev,
-			     "detected LCD panel AMS397GE MIPI M2\n");
+		dev_info(ctx->dev,
+			 "detected LCD panel AMS397GE MIPI M2\n");
 		break;
 	case S6E63M0_LCD_ID_VALUE_SM2:
 	case S6E63M0_LCD_ID_VALUE_SM2_1:
-		DRM_DEV_INFO(ctx->dev,
-			     "detected LCD panel AMS397GE MIPI SM2\n");
+		dev_info(ctx->dev,
+			 "detected LCD panel AMS397GE MIPI SM2\n");
 		break;
 	default:
-		DRM_DEV_INFO(ctx->dev,
-			     "unknown LCD panel type %02x\n", id2);
+		dev_info(ctx->dev,
+			 "unknown LCD panel type %02x\n", id2);
 		break;
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
