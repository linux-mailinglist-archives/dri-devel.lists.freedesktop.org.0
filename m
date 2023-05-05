Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE9D6F7EB4
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF3F10E216;
	Fri,  5 May 2023 08:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F34F10E216
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 08:23:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f139de8cefso13677256e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683274987; x=1685866987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g5G0cJUf9U5b39gQ8vAQOCiDix67GOEadK5YgCw6Yxo=;
 b=BSDtuJvBpLPeVoP5Mrl8D2KmSwNOLyuEFtmL2qv+nmY+uEQomIy8Gtt0Ofd1aVQ/TN
 WQE+7c6b/8ay0uAbwQwXOrq2krF2M8qk7+EXoELfMgVtaycjgIT+GLQkAhGWA052dDWz
 q18P97yPKNymERSnVLr9lWM14RVinLIr8sAzmqtiYxM5AIJOLY1ztrOwUPkLDFLXQkcF
 Rb1QIozImPlpBm6OTjMo3RDMRXQrj1QnP3J4p8OUgwIUKND2qDamsYQGwBxTNOkje3PT
 UkKoj+9fCEeCtb0/k1NeA6EibY7QLB34qitg7scU2w8x5cD4WFgOWPGO2SsX/uN9G2iq
 RsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683274987; x=1685866987;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5G0cJUf9U5b39gQ8vAQOCiDix67GOEadK5YgCw6Yxo=;
 b=bmAG791InEyhOAPAJYHr10QuheFzk9aOxDr1F0HfKB50CMqOibNicFz3LnUsrKFxUR
 zdODc5/dUpyohUvPDc/7yp+JGbL2J+Y4cr2anf1sr/ym1deHZngXMQNXvw1ATgyIK5tw
 PsO7E7U06QDvfXMBBF+S944oR/rhqDrcvseh9R5gwHI4s4pYtyUupSkNCaNewcmsb0s0
 rTanOG5hI9Vk8ZJinoO2dD2L1rx6/yxQ3iuT5x8OZ2tMugOrxg2Hz5onnQjdOTQ2OaiD
 QAiKUZsFWTAHr8aKK/Xuf3VFut7iH0A1JdF9hig7zi53lKvTWFRuQuRL/vkyL5xKY0Hb
 aKsA==
X-Gm-Message-State: AC+VfDwqEilJqKn8sXxLGAWy7DUrUhmugoZ356X6uRoo6l1LFHTyaDzc
 WOjGJYi53pf9KO04kk9zQ1AxEQ==
X-Google-Smtp-Source: ACHHUZ4ntuLtpxogEmFZl1hNzi6UMBcMw9LwaHrl5FOZUqpjjHXCeB+aLaboJ3fnDq3UPQt5rlmwAQ==
X-Received: by 2002:a05:6512:2202:b0:4ed:c64a:4aa8 with SMTP id
 h2-20020a056512220200b004edc64a4aa8mr1867732lfu.6.1683274987516; 
 Fri, 05 May 2023 01:23:07 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 h8-20020ac250c8000000b004d023090504sm200647lfm.84.2023.05.05.01.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 01:23:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 05 May 2023 10:23:02 +0200
Subject: [PATCH v2 3/3] ARM: omap1: Fix up the Nokia 770 board device IRQs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v2-3-984ed3ca5444@linaro.org>
References: <20230430-nokia770-regression-v2-0-984ed3ca5444@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v2-0-984ed3ca5444@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andreas Kemnade <andreas@kemnade.info>, Helge Deller <deller@gmx.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: b4 0.12.1
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
Cc: linux-fbdev@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The platform devices on the Nokia 770 is using some
board-specific IRQs that get statically assigned to platform
devices in the boardfile.

This does not work with dynamic IRQ chip bases.

Utilize the NULL device to define some board-specific
GPIO lookups and use these to immediately look up the
same GPIOs, convert to IRQ numbers and pass as resources
to the devices. This is ugly but should work.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-nokia770.c | 57 ++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index dc37ea30bbcf..27bd5522e1de 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -6,7 +6,7 @@
  */
 #include <linux/clkdev.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/kernel.h>
@@ -250,19 +250,25 @@ static struct i2c_board_info nokia770_i2c_board_info_2[] __initdata = {
 
 static void __init nokia770_cbus_init(void)
 {
-	const int retu_irq_gpio = 62;
-	const int tahvo_irq_gpio = 40;
-
-	if (gpio_request_one(retu_irq_gpio, GPIOF_IN, "Retu IRQ"))
-		return;
-	if (gpio_request_one(tahvo_irq_gpio, GPIOF_IN, "Tahvo IRQ")) {
-		gpio_free(retu_irq_gpio);
-		return;
+	struct gpio_desc *d;
+	int irq;
+
+	d = gpiod_get(NULL, "retu_irq", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CBUS Retu IRQ GPIO descriptor\n");
+	} else {
+		irq = gpiod_to_irq(d);
+		irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
+		nokia770_i2c_board_info_2[0].irq = irq;
+	}
+	d = gpiod_get(NULL, "tahvo_irq", GPIOD_IN);
+	if (IS_ERR(d)) {
+		pr_err("Unable to get CBUS Tahvo IRQ GPIO descriptor\n");
+	} else {
+		irq = gpiod_to_irq(d);
+		irq_set_irq_type(irq, IRQ_TYPE_EDGE_RISING);
+		nokia770_i2c_board_info_2[1].irq = irq;
 	}
-	irq_set_irq_type(gpio_to_irq(retu_irq_gpio), IRQ_TYPE_EDGE_RISING);
-	irq_set_irq_type(gpio_to_irq(tahvo_irq_gpio), IRQ_TYPE_EDGE_RISING);
-	nokia770_i2c_board_info_2[0].irq = gpio_to_irq(retu_irq_gpio);
-	nokia770_i2c_board_info_2[1].irq = gpio_to_irq(tahvo_irq_gpio);
 	i2c_register_board_info(2, nokia770_i2c_board_info_2,
 				ARRAY_SIZE(nokia770_i2c_board_info_2));
 	device_create_managed_software_node(&nokia770_cbus_device.dev,
@@ -275,8 +281,25 @@ static void __init nokia770_cbus_init(void)
 }
 #endif /* CONFIG_I2C_CBUS_GPIO */
 
+static struct gpiod_lookup_table nokia770_irq_gpio_table = {
+	.dev_id = NULL,
+	.table = {
+		/* GPIO used by SPI device 1 */
+		GPIO_LOOKUP("gpio-0-15", 15, "ads7846_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used for retu IRQ */
+		GPIO_LOOKUP("gpio-48-63", 15, "retu_irq",
+			    GPIO_ACTIVE_HIGH),
+		/* GPIO used for tahvo IRQ */
+		GPIO_LOOKUP("gpio-32-47", 8, "tahvo_irq",
+			    GPIO_ACTIVE_HIGH),
+	},
+};
+
 static void __init omap_nokia770_init(void)
 {
+	struct gpio_desc *d;
+
 	/* On Nokia 770, the SleepX signal is masked with an
 	 * MPUIO line by default.  It has to be unmasked for it
 	 * to become functional */
@@ -288,6 +311,14 @@ static void __init omap_nokia770_init(void)
 
 	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
+
+	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
+	d = gpiod_get(NULL, "ads7846_irq", GPIOD_IN);
+	if (IS_ERR(d))
+		pr_err("Unable to get ADS7846 IRQ GPIO descriptor\n");
+	else
+		nokia770_spi_board_info[1].irq = gpiod_to_irq(d);
+
 	spi_register_board_info(nokia770_spi_board_info,
 				ARRAY_SIZE(nokia770_spi_board_info));
 	omap_serial_init();

-- 
2.34.1

