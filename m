Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9546F2849
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 11:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E519110E1F7;
	Sun, 30 Apr 2023 09:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A231310E092
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 09:22:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4edc114c716so1902992e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682846540; x=1685438540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pp3PRNYbx/fsurHzrjtHyOhBV0+Rw2cfHp2A04u+CvU=;
 b=ogQG1hefbBUDibvfB660K9VwHo/1OzVvHE9PYhoOMrc9ljBQ3pCYMW7AQs03a5VytT
 Oo39k1OhdlbJ8mN63PexAX76k7B7o58cm359+ZnPCpx3lP1hX1OfDrTqK7AsWDdAkgiB
 ctMqx+48GAYHEcbP5sfbbDIWdM+6j93MG48Qd7TJdJ/CXnbvQXvDfS03L0OPtOMeReHe
 ip9H5x+po165jWyRLTpHhBLgTpeszBChgkatvewFfHh8EVXCencQPduCr2c6OY0RFwfR
 RaoDYI3LRcfOqbM0aL1hh5bmAEoLq/6ucphw66KAEQ1Px0rNTsTS0RZc47HlH3mkJxO/
 qYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682846540; x=1685438540;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pp3PRNYbx/fsurHzrjtHyOhBV0+Rw2cfHp2A04u+CvU=;
 b=j6O9hQpJ1XwUnmgaD5c09AJaB1GzePznfJjnRPO3D+aa/XPhnZlQT9bTfdFxaIEAhX
 zD82TEaShiHbbQoRwA95oYN5iJ0QTswFvIqe0gBbClX8sldexefEPSXMgyqUiIBfoHtP
 ziTnAFObB3zljV4rptfBwiSZGC8Kp013PTOXEI4y5oxFOEAmQq5Evn1xEyijDaR74qq2
 UmkeE5KNtolkdgrvWLVoXRG2qXiu3zbBWHdXvbOLeBsX63YG2KT/pT29aB4eeMDn1atg
 0hd/4knolr5J78XufzIIAFk/nHnDOeWzEpaUySDJdaz7cWPWwud2yBuQplMuxDbf3cuJ
 ZIUg==
X-Gm-Message-State: AC+VfDzuf9sjpx3j7vwaHNTQqHC8nutqVXa1SfJbLbtG5jjWiJZIqJne
 iipOoZUxhj6XAP/bejAX7qHNVQ==
X-Google-Smtp-Source: ACHHUZ5qSx+bMQGVLRRHnfcdwsy1zCxobKTnDm6GAMGf84RnuSnGIlaEUsssFScThYQ8Ui2ipQzb4w==
X-Received: by 2002:ac2:528a:0:b0:4ee:d562:5752 with SMTP id
 q10-20020ac2528a000000b004eed5625752mr2748859lfm.27.1682846540332; 
 Sun, 30 Apr 2023 02:22:20 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05651238a200b004ec62d9a7f9sm4077327lft.62.2023.04.30.02.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 02:22:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Apr 2023 11:22:17 +0200
Subject: [PATCH 2/4] fbdev/ARM: Fix up LCD MIPID GPIO usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v1-2-97704e36b094@linaro.org>
References: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v1-0-97704e36b094@linaro.org>
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

The Nokia 770 is using GPIOs from the global numberspace to pass
down to the LCD controller. This regresses when we let the OMAP
GPIO driver use dynamic GPIO base.

As this is the only user of LCD MIPID we can easily augment the
driver to use a GPIO descriptor instead and resolve the issue.

The platform data .shutdown() callback wasn't even used in the
code, but we encode a shutdown asserting RESET in the remove()
callback for completeness sake.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-nokia770.c    | 23 ++++++++++-------------
 drivers/video/fbdev/omap/lcd_mipid.c    | 10 ++++++++++
 include/linux/platform_data/lcd-mipid.h |  2 --
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index eb7652670447..509afcd42823 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -85,26 +85,23 @@ static struct platform_device *nokia770_devices[] __initdata = {
 	&nokia770_kp_device,
 };
 
-static void mipid_shutdown(struct mipid_platform_data *pdata)
-{
-	if (pdata->nreset_gpio != -1) {
-		printk(KERN_INFO "shutdown LCD\n");
-		gpio_set_value(pdata->nreset_gpio, 0);
-		msleep(120);
-	}
-}
-
-static struct mipid_platform_data nokia770_mipid_platform_data = {
-	.shutdown = mipid_shutdown,
-};
+static struct mipid_platform_data nokia770_mipid_platform_data = { };
 
 static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 	.ctrl_name	= "hwa742",
 };
 
+static struct gpiod_lookup_table nokia770_lcd_gpio_table = {
+	.dev_id = "lcd_mipid",
+	.table = {
+		GPIO_LOOKUP("gpio-0-15", 13, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
 static void __init mipid_dev_init(void)
 {
-	nokia770_mipid_platform_data.nreset_gpio = 13;
+	gpiod_add_lookup_table(&nokia770_lcd_gpio_table);
 	nokia770_mipid_platform_data.data_lines = 16;
 
 	omapfb_set_lcd_config(&nokia770_lcd_config);
diff --git a/drivers/video/fbdev/omap/lcd_mipid.c b/drivers/video/fbdev/omap/lcd_mipid.c
index 03cff39d392d..e4a7f0b824ff 100644
--- a/drivers/video/fbdev/omap/lcd_mipid.c
+++ b/drivers/video/fbdev/omap/lcd_mipid.c
@@ -7,6 +7,7 @@
  */
 #include <linux/device.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/spi/spi.h>
@@ -41,6 +42,7 @@ struct mipid_device {
 						   when we can issue the
 						   next sleep in/out command */
 	unsigned long	hw_guard_wait;		/* max guard time in jiffies */
+	struct gpio_desc	*reset;
 
 	struct omapfb_device	*fbdev;
 	struct spi_device	*spi;
@@ -556,6 +558,12 @@ static int mipid_spi_probe(struct spi_device *spi)
 		return -ENOMEM;
 	}
 
+	/* This will de-assert RESET if active */
+	md->reset = gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(md->reset))
+		return dev_err_probe(&spi->dev, PTR_ERR(md->reset),
+				     "no reset GPIO line\n");
+
 	spi->mode = SPI_MODE_0;
 	md->spi = spi;
 	dev_set_drvdata(&spi->dev, md);
@@ -574,6 +582,8 @@ static void mipid_spi_remove(struct spi_device *spi)
 {
 	struct mipid_device *md = dev_get_drvdata(&spi->dev);
 
+	/* Asserts RESET */
+	gpiod_set_value(md->reset, 1);
 	mipid_disable(&md->panel);
 	kfree(md);
 }
diff --git a/include/linux/platform_data/lcd-mipid.h b/include/linux/platform_data/lcd-mipid.h
index 63f05eb23827..4927cfc5158c 100644
--- a/include/linux/platform_data/lcd-mipid.h
+++ b/include/linux/platform_data/lcd-mipid.h
@@ -15,10 +15,8 @@ enum mipid_test_result {
 #ifdef __KERNEL__
 
 struct mipid_platform_data {
-	int	nreset_gpio;
 	int	data_lines;
 
-	void	(*shutdown)(struct mipid_platform_data *pdata);
 	void	(*set_bklight_level)(struct mipid_platform_data *pdata,
 				     int level);
 	int	(*get_bklight_level)(struct mipid_platform_data *pdata);

-- 
2.34.1

