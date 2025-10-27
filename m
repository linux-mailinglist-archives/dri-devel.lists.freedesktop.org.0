Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81EEC0C3A8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6010E34E;
	Mon, 27 Oct 2025 08:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NGXYiOX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71CE10E34E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:06:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-592f098f7adso5271563e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761552391; x=1762157191; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r2KPabfMEgW+KyILM5zV1/EQ0KSjEjbWk0m/3Q0m4B8=;
 b=NGXYiOX+CH/8QptPl/x1ji15FWqGBckHrJOm+v0kKPVZS/T9Q9wKRaBRgiflvslar0
 XN6Xa+2iG5iAaRpueSKpxulVKvn8YaIJWOnwvVhnJ7r6ihLMEmDTziwucj0ZVg63kRnr
 p0LKotRa7U0aJW5wt3Qi0TbXOT2XVKJF+FmR2fXDOKIzUTN9sjkuoUXznzuxNyOahBLs
 eOfD7doftlve+MGnsNJX6sSIbNg4NQS84qd7cNUkqf1bl5vtEAZ8FmdM4aKnbd2zIM5v
 e0TsxWmm52/UjAM5vy2FyPgTQKvjtOKAkHFVoqug+3vA75O6OlnLMfHaUVvEHAJ7mfGJ
 VD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761552391; x=1762157191;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2KPabfMEgW+KyILM5zV1/EQ0KSjEjbWk0m/3Q0m4B8=;
 b=LJorVTlTfBmstMi/ELJJP/tX+m1o+ZxoDaSMXHmvsiePnJk8vvpnhMpJ75ea3yTb9p
 0G0QwCa+L6BijNKlxYS8t30JdQrznI35FindMlQ20qsBQTOhzbe1kujlWOUtp+QCQFJp
 YiNFOZJtfu2AFKBO0NET8jbTIx+caGV5uBOepL0e6FG7f2FJEsPcCuVaMnq/Rijx2DDp
 1nnhTODj0H/WST7p2btb1IYoqAH+rY4mX5r2ccl24knDwilwg9BW2gWb9Bb0CbZngpxH
 CTK3+inUJUBGdI98Th21J9Opq7jhQFRj1rcGYBdzLGwq/8po7DkKoSA5YK0H0KGskpYM
 9qjA==
X-Gm-Message-State: AOJu0YxZxYZWNLK0594qKd0GyKAyikgWauMt3PlzgpUAdsfjY3HeVEpe
 kYtCHL3FZhLaJKM/dVc4od2LuW05Wmov+e5pdCEAhHKo7ux+PSKYOKcV
X-Gm-Gg: ASbGncsXQioPUmHvFfYsFuIDa5ylhZtS4uDusCPOS4LDNKAjhDuXFECVu/KYgHCiliT
 ckomA56WOuqCUXDmKJgVWwkYolCSAYXuIJjNejUlCIgUZsPZByt9R3pmtbPxAFiDfmnZ+HwfOYZ
 V4unXY0uNMn3mQxoc6aTNjsF2iqA7LJXKm23e4CITlGtu/3+oCOIGbizJTNorEXSCoYceD+VDoO
 JfLobJWaHvdq4BQwzUgPBC47Pb6bbsvkPcnyy1tIN6nYq2vawECzLi+sP5MPtSd2ViK2QUp9r2v
 40HUB4FV70QDwMdCjV+9yFG1Jx4tKkgexzWpN6pH2X9Pg0s7h7UophM6gfmQTXT3dlsC+wVU6O/
 RZsK5hOf+JKgQefbyBF1J15EoC1Y4DoloOmkoiG9sDhNJTGQCIq5cFqu62yatg+kaI+pGCuFgE2
 xF1IXeALCltOQsHBSLOFrSBjx/oBBoxbdySU9ViyOIdukAhY5W1Ef+9dc=
X-Google-Smtp-Source: AGHT+IHi6cci/3L1haIovmKHe/JTDpeP3qUzWmsW1wcg2Io4QkAUIR0XXfeecwzIdzTN4HjaA8rKqA==
X-Received: by 2002:a05:6512:3f16:b0:590:651b:10e9 with SMTP id
 2adb3069b0e04-592fca59db4mr3353527e87.34.1761552390857; 
 Mon, 27 Oct 2025 01:06:30 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41ce8sm2210689e87.6.2025.10.27.01.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:06:30 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 27 Oct 2025 09:05:46 +0100
Subject: [PATCH v2 6/6] drm/sitronix/st7571-spi: add support for SPI interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-st7571-split-v2-6-8352fb278d21@gmail.com>
References: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
In-Reply-To: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4595;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=eJNHLBmAZOTejS10tlSIgy4paPd/qi4bHheCIJy9qE8=;
 b=owEBbAKT/ZANAwAKAYiATm9ZXVIyAcsmYgBo/yf3Co4vwEOyvi011P8dYyI0bsvPytCzYrGOd
 yfDZ4QvJvuJAjIEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaP8n9wAKCRCIgE5vWV1S
 Mv5vD/ixjOJ+YeNK4xcLmrCUCKqvkC+2LwqS6zyZutlEy/nbn6KVNICE/bSVZl7L7BgjF87MJPO
 1vtFE/aIaCxir4rMSZGYtyAjt5Zw/jDoMNhK6NS1evkTEC8OsSbu88jDmLS5eFWt6gPjNE4ltvr
 cCjRohkUALdN3+glUDVZRp54oNF5EDGtpqQDUdxqNdu2jfoaVXjsD0/+Pb65/2Rvkg7lOO8jEPy
 NgqnxORCgKucD88pOgD8Fk8M+Mmk6QSIdE0mrLKXWppCDH9hCe3KO1OQh/z+BnR5HXtcpOgOmNo
 3pAxfqCGdIze3bRvgfZTdAoFYpDV1LUeJi2eh4LN8LGMr78M3Ccu1imK/u3df1JD0UzxbaYOrsq
 8b2hzwcmmnjMqY6RbM04Fy1tB2UQ4s5hU3xuRiHlWl4LVXNgrdkSnucQptlupF/gKZM/rX12te+
 Paeux/nDIFgO9q9bDkWN5K+z0OCTuyJTZNkK8nR65lzY5zS6aX/iyNY16QZeayY62c8GZY4e7vL
 0INP0ztpsanZxYx+RZ55Gccnd7Jq/DwMWfqkJDzBq8u1tvzET/U9r7FVDtkQYH3koPnU+Xm+Lr9
 3Sem7wISVATvI8p5gQWBfGukQEMhCv1E8nKmqk0kx0EEBpsCmXYLyFcdKTsT6i6/N9uLBD+Gh3a
 lye/2zsxEGTtH
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for ST7561/ST7571 connected to SPI bus.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |  1 +
 drivers/gpu/drm/sitronix/Kconfig      | 12 ++++++
 drivers/gpu/drm/sitronix/Makefile     |  1 +
 drivers/gpu/drm/sitronix/st7571-spi.c | 76 +++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66e9ffb757c8bb19dbb894eb51f88f589ee83af6..c89e521cafa1d50fd94bfe7a6868c531aec1f494 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8083,6 +8083,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-spi.c
 F:	drivers/gpu/drm/sitronix/st7571.c
 F:	drivers/gpu/drm/sitronix/st7571.h
 
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index 0676a86661caa4ab81f226ff2e990a3e2526f74d..2204250ab4136ac2d3f18f295dc7413a6e17ed45 100644
--- a/drivers/gpu/drm/sitronix/Kconfig
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -27,6 +27,18 @@ config DRM_ST7571_I2C
 
 	  if M is selected the module will be called st7571-i2c.
 
+config DRM_ST7571_SPI
+	tristate "DRM support for Sitronix ST7567/ST7571 display panels (SPI)"
+	depends on DRM_ST7571 && SPI
+	select REGMAP_SPI
+	help
+	  Sitronix ST7571 is a driver and controller for 4-level gray
+	  scale and monochrome dot matrix LCD panels.
+
+	  DRM driver for Sitronix ST7565/ST7571 panels connected via SPI bus.
+
+	  if M is selected the module will be called st7571-spi.
+
 config DRM_ST7586
 	tristate "DRM support for Sitronix ST7586 display panels"
 	depends on DRM && SPI
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
index 8073bb776ff94de750f350b636fd9db3d54fdd46..c631e3359c3dc21ab8522b8f0cfe6e9bf0dbc011 100644
--- a/drivers/gpu/drm/sitronix/Makefile
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_ST7571)		+= st7571.o
 obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
+obj-$(CONFIG_DRM_ST7571_SPI)		+= st7571-spi.o
 obj-$(CONFIG_DRM_ST7586)		+= st7586.o
 obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/sitronix/st7571-spi.c b/drivers/gpu/drm/sitronix/st7571-spi.c
new file mode 100644
index 0000000000000000000000000000000000000000..0206e9162f1cd6ecbb315671eaad8850504530af
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7571-spi.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Sitronix ST7571 connected via SPI bus.
+ *
+ * Copyright (C) 2025 Marcus Folkesson <marcus.folkesson@gmail.com>
+ */
+
+#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "st7571.h"
+
+static const struct regmap_config st7571_spi_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.can_multi_write = true,
+};
+
+static int st7571_spi_probe(struct spi_device *spi)
+{
+	struct st7571_device *st7571;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_spi(spi, &st7571_spi_regmap_config);
+	if (IS_ERR(regmap)) {
+		return dev_err_probe(&spi->dev, PTR_ERR(regmap),
+				     "Failed to initialize regmap\n");
+	}
+
+	st7571 = st7571_probe(&spi->dev, regmap);
+	if (IS_ERR(st7571))
+		return dev_err_probe(&spi->dev, PTR_ERR(st7571),
+				     "Failed to initialize regmap\n");
+
+	spi_set_drvdata(spi, st7571);
+	return 0;
+}
+
+static void st7571_spi_remove(struct spi_device *spi)
+{
+	struct st7571_device *st7571 = spi_get_drvdata(spi);
+
+	st7571_remove(st7571);
+}
+
+static const struct of_device_id st7571_of_match[] = {
+	{ .compatible = "sitronix,st7567", .data = &st7567_config },
+	{ .compatible = "sitronix,st7571", .data = &st7571_config },
+	{},
+};
+MODULE_DEVICE_TABLE(of, st7571_of_match);
+
+static const struct spi_device_id st7571_spi_id[] = {
+	{ "st7567", 0 },
+	{ "st7571", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, st7571_spi_id);
+
+static struct spi_driver st7571_spi_driver = {
+	.driver = {
+		.name = "st7571-spi",
+		.of_match_table = st7571_of_match,
+	},
+	.probe = st7571_spi_probe,
+	.remove = st7571_spi_remove,
+	.id_table = st7571_spi_id,
+};
+
+module_spi_driver(st7571_spi_driver);
+
+MODULE_AUTHOR("Marcus Folkesson <marcus.folkesson@gmail.com>");
+MODULE_DESCRIPTION("DRM Driver for Sitronix ST7571 LCD controller (SPI)");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("DRM_ST7571");

-- 
2.50.1

