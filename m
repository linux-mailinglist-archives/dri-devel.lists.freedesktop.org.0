Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B42CBD41F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCD810E3CF;
	Mon, 15 Dec 2025 09:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hwXK8kn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36F810E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:47:54 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5959105629bso3378662e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765792073; x=1766396873; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lRh3hoVnVAdWoPvuzhnzUQQWZ37muBEDm12udAe6V1I=;
 b=hwXK8kn/sIJ/ddL+rYzIojoNcNbD4g04gToxDxqKjFH34Nd8caQfZkjvCZqekKtE03
 475ZY4Zydqmf0r4SjWRZqH1XF3RaOkE9CBJlAFOPM+tLAGiV8X/MJLNO2TR2m7gUH5f6
 1CqaOQ80FEMs2WucKf2c39V1h82tu66k8d7+uDxV+CAOJ41wWivE/jaVB9JJnladZDsC
 CDUPbOnkvGdWvFVSQokUFxSOvSFO4VziU/rK3t81gBqE8pwt/bkXyo5PnhJharUeMal4
 cLgPNALgLaUF5KhvQouUGYkf7bCxbG9uqRYKRT5Vev/wQ8fIxLtAJFoMUe2je88+Veuy
 /Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765792073; x=1766396873;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lRh3hoVnVAdWoPvuzhnzUQQWZ37muBEDm12udAe6V1I=;
 b=WtPyPbd3vPDCo/l3/LSO4nM8qlRr5f03PN6e32RJsnR/+qEuhnUqcXPBcIg/DlyCz2
 YAnYeZ8nGbqJ8V1k7OiR81C84YHNOQ3/87q3ZNlnsqdRENHenWB3OR0knFLAqqYVFD/D
 TjE6Fuh0BXdMifHlil4rvkRRTGSjDdqUjP6SOYI4io7rLsuJxnNhNqV6qq4+trwzKXeV
 jEFa7BOr7A1rV0ZQGGoACdRk77Jk30i23xIyRrQ7yjhZQatmZK3KnbsoO1+1v7/6n8Lw
 KwuRIOZJd1SMcRnypUG1CqU8zrjXYbMbC4nPh3+hBdskxNI7ENE52VJxVoRQf24TE8sk
 JL3Q==
X-Gm-Message-State: AOJu0Yye3jmtyz4YgUtPqOMPuCxRhqW/tob+py+hZJW6eFxcJ9HeSHos
 ri0vRZVIsXz9BF45Zt/5kXqe2iUGVosn1TiINQ6sG/S2jOYbyPN1O0KO
X-Gm-Gg: AY/fxX76K7BhstBfyTmhca8eg/m5n3AAYY+QrUgvAKXsmBQHujiscE7njDaH/XqrjPa
 wu4hyNFukGuxGwZGGkRuiXAvoMblqoDAW4RitTm5Dg5szbGQRXMheDHTWPNA00KDtf3C1HoYAui
 IjUqAWE/+swX01gjuKS0yZ97ZarpZEgHp3LCnGD9G9j+FAgp9WagIF7oh7bU6ZgzFPL9wXq1ZXZ
 CULYlERLiZudqcghySFqUk0+2S5IEIga1LxkgtP9G1o7CxLpyYul4lgEMY/QNiJUQqeYg3OSfYd
 zWDq3TvJR0BN86mmTvK02HjWGKwkAX9djHoaAigQhgcggEhozHSo1riJORi6Win0er01A1rPo0Q
 n0gYgOCDkcwV4G3VqSqntWg2G9t2sdNjwmaRoxGRy2uuFtkT4GwPZu92kTXOME5HSdJNPUYkbPJ
 JUjASYiVM56GYr0xpuQn9648a5CDSoGN/qVMprvBSskIcx6+uu0A19PmK0
X-Google-Smtp-Source: AGHT+IGjnTor4twzx0xNcYq+nhywvJtyH+jIfKRrI2Ee/mLPwpnph23iJhSGhc7xITSR+WpN6uIj0g==
X-Received: by 2002:a05:6512:15a9:b0:598:f98d:d725 with SMTP id
 2adb3069b0e04-598faa18919mr2799726e87.8.1765792073091; 
 Mon, 15 Dec 2025 01:47:53 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-598f2f37ae8sm5397546e87.15.2025.12.15.01.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:47:52 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 15 Dec 2025 10:46:48 +0100
Subject: [PATCH v3 6/7] drm/sitronix/st7571-spi: add support for SPI interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-st7571-split-v3-6-d5f3205c3138@gmail.com>
References: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
In-Reply-To: <20251215-st7571-split-v3-0-d5f3205c3138@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4431;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=amgEFJwnz1HaLfDD88LjSHq7xWobL4Dq1kG5tCo8neY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpP9kzx8v9lTk4bvuM/0c4ICiYaSBaKezSAcbDz
 wy9UVrwhrmJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaT/ZMwAKCRCIgE5vWV1S
 MtV8D/9L0ZnCX/dauXmH4lxkzkhgDEOiNVZWM8Zxw/hbtKvW9qyHkreeW6w0yCa/dn1EDKzmkHQ
 kybsdbiPAjYjEhGm+VzPuX98aC6Xab11Urvip8lqoDQLI8CQMWjI+8g6CA0qUULs7EVLsZ8qwoT
 s8Z6zprUFPSEQs7Lq5bxe51M44iWrvbTi+vrNILsKoodLE9d36/NfOThsRTz8wjddOPqEG+pYRZ
 PdHasZg2E3UD4ygABuEwGVZ8j4WLdSQYQUpFM/S4Dr9ZbkAWTIIp5sXA1a/1kRwiJ7MNonNv+WI
 DDvr7ZWPjkJwTLhYJR8O1c1aNG9sJdquH0UKKnYHa98VCjMeEHqH+VqDNPz8xg96Au1x0OSr1pf
 eqt5v9Lh+mhrdFh6GNOlmxGYzFbR6my9vMj9DTeLc6sLmv9sSWC/URVA9lYaImD5S+36GLndI39
 14uwKKvq/V24CxeUNYUMAJ8WHF1Eu9bskLrmmpk7IFfWKqOtYIfI985a7ISWc7h0Ey0IOwMdVRH
 yJX7Zk9IdtqhEUML1NYcpy6+gSWMmeHxTE7NqvskNGEDNAUMEXSbqwuFFW4fEfG9kLV/AHQpwKz
 M+PB2fsHYwCplOJXS36DTf6nAk7d1pk9rtw9B0kHRw48HWvLmaH5neswiDiLcZT72jlzza82wg5
 0eDft+CrI/KsqxA==
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

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                           |  1 +
 drivers/gpu/drm/sitronix/Kconfig      | 12 ++++++
 drivers/gpu/drm/sitronix/Makefile     |  1 +
 drivers/gpu/drm/sitronix/st7571-spi.c | 76 +++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b59960fa3a9..250251ab1a8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8106,6 +8106,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-spi.c
 F:	drivers/gpu/drm/sitronix/st7571.c
 F:	drivers/gpu/drm/sitronix/st7571.h
 
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
index 203c53fff402..56f257e16d1c 100644
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
index 8073bb776ff9..c631e3359c3d 100644
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
index 000000000000..0206e9162f1c
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
2.51.2

