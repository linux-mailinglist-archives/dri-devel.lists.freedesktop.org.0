Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14516C05B82
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AAB10EA72;
	Fri, 24 Oct 2025 10:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XhzDzALn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6151810EA6E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 10:57:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57e8e67aa3eso4582675e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761303460; x=1761908260; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TDFcFZ4pKJmDfhD5kcDZS16NPNGgQ/ZBppEJ8jHXnMM=;
 b=XhzDzALncferxG1O3Aed9IMvdyeryQvjPsg5/36iKuCFE4u6+/PeW3MjGL0/H2xv9I
 Umdo7hVwJPuAV/2fBd24Ex5iCKfV30b+TMfeg5ahDqep0hOPsbQ7tW8rrXD5OweYCkbt
 GzkNmrsjmOFlp2hgPzb3xmoRHsYjInBadUqjjAtf19i2OgGZXL+fLTN0quaKm+k+x7Om
 ByEZJVD0mLChZN1EMQyn8XN7ryZmIpodJwZz9IBkY+NmB1V3YfoLtL6oj3JmpMwXMVDS
 p/KVa50rjVs5b3q21F7PK56wKNpVcBA3LFgp/0jGkkwLMzBNR3m6daJx/mL4durCnQFY
 fHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761303460; x=1761908260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TDFcFZ4pKJmDfhD5kcDZS16NPNGgQ/ZBppEJ8jHXnMM=;
 b=VBu2rHWFd/UiXku7xUnafClSVAN7LC+5j6F4u5pmXInouolNg10lTiIfmqwOvtXEA3
 I42QZFAgGyVxBxQJviJn+wyNx3rw3oIeURbtwtkBSpCVzWfXDZHpZ1metqpTpqbwG237
 1cXqZY82Z9BU5xrIAVs6T61Q4bGdU7yCrDpHg15+eLqJ7OvKjNs7qSe8qD1PvMhrboqJ
 jTLAg8RYPw3baUWGFT2o2L5/8YozSzpWRMnRS7AwUoUttOCkSkWBbXobUaBVfp4qLTXG
 q0+p7a+F1IuTxiL7l/pxomXTJvYy/oaLMxbQcqXTNYgsK9wuo0DyJ3M4zn2rv4YV88Fj
 2bbg==
X-Gm-Message-State: AOJu0Yzpx4oE1/CzXtTx8iRcFdnBvw9NNFD964ANOF3CFDEy79H+80x2
 AtpdXnn/HTvvMtPsmVmnD2osKFzKlxKjtt0nN/Uq/FoGNEN9yVglpXA8
X-Gm-Gg: ASbGncupogograP8nP49lA3vuQdOvXFHRpsqpw2TI9RaDCu4+LXQv2Q8LjxSWxwb+gO
 m+Bpys2Z5nBsL+wUuWA2BeBkSBeeyGe63MGBQzLKFDOAxZwykvzYogx34jbZdQ8isprNNk8lOo8
 xDMZUutXdJHiBgE+HDmdlDo/mApoP/Rdzb/4jzu0QRPI0RR+iMAa8ZX3Kk6s49YWLH+yHFGZzRZ
 xQlJWyv0SwrwM9EJ+e210huuYYVc0Dwxc6QuIck35UoAiUN1QRR7mnSfTISna/VgEi0dJ/tmMWd
 wfdNwnfxOA5B2J6/tFm0gBQq1JDcNNpSBrqfJ+igWlB6MoGtJYpTX/i7dp5lVV3y27MOHvqY51q
 1eCgjlQIT3RBx3QYrf3FtYv3hx0f9rQg+JoGUuPQHzn2E3e3ahdFa2gs3I1j+40OnEgQTAbHnXN
 nFG2XBnWXWTyRvrNKxA8ITmJuniMW/Rye3wzCX4u0hlibTPD6OVjB1iBk=
X-Google-Smtp-Source: AGHT+IHBsVvWVKQ86dEKY3E3M3AXOOif5v9cuxp+oStRr36ZtlDghWUb6DPUD58X7KnPc9ZQ7pVRlA==
X-Received: by 2002:a2e:b8cb:0:b0:373:c272:d986 with SMTP id
 38308e7fff4ca-378e3e7c25bmr7492661fa.17.1761303459507; 
 Fri, 24 Oct 2025 03:57:39 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67db8fesm10375671fa.38.2025.10.24.03.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 03:57:38 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 24 Oct 2025 12:56:57 +0200
Subject: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>
References: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
In-Reply-To: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4561;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=7feswa3GRHqUfcbWHAfsnWtSXtDiRE9nClVCJljxFI0=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo+1uVUCBLRQNNTmG1F55tPUeRPIkdcXShQe5yA
 U7bl1NGzVyJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPtblQAKCRCIgE5vWV1S
 MqukEACsvh+7rxk0IfAOpFbQpi7ZsmHteCI5k4fodn6kDt7bv77+NACPto26wmUA8xw9vK4yxSM
 WGjV6aanOK3hDUD4+TdIbDS5PLwD0BrPRm98l8hUjIjQ4MujVgnV6qdMnOhK1Xl5RoXpbvikiKt
 yH9h05/mG+qpKG7OV1LCLMXoEEYLR7BERpRKNdothud7u1WxKZ7JP7H1VLju7rkhBeZijvDvlgk
 Wkx3ifWNofA1aO4dOZCBvPPKZbBrfxBkwpi9AchazxAmYBYBmSRApveKn5kzZ9Gq5ppDnJ67jbA
 /sZbXfKldiM0RvK0UkQGz1y+0wCh7fGJg184/yXlFgvklTLJrAWAA5APTqYWiHW3/D/VOfzYGG8
 5/ioqcx5Kzlm6UOO+8zr8CaYp6i739l48UcXUI/nYKsz+AOZ9mQ+h6YBg4qfMoqCUQhebjThQMd
 85c7v4iZLZlRGn9cJ4V3dXiSYJxVEOtqvCHbFSLqAc3v3punSobLF+wDcTJRnWGJ4jCHV/Sa/xJ
 ZLe0o11vGUQlWVISynPuj7/p3lX4nlQh+jwDnD159xEXRYYHHWkjpDhKYW+kpMKqnxIVgFFf7c9
 oK6fvC4WyRctODKbPjzt6jKd2TYceZPB2pcSER8WvclSVj9nadqtiiAelYnLeBDEbBPJCb4+zMN
 wGkCfwfOCTjrrhQ==
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
 drivers/gpu/drm/sitronix/st7571-spi.c | 75 +++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)

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
index 0000000000000000000000000000000000000000..104737ca860ce44ff411dbdd36c3a7b32a81733f
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/st7571-spi.c
@@ -0,0 +1,75 @@
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

-- 
2.50.1

