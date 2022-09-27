Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB75ED04D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 00:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3200C10E170;
	Tue, 27 Sep 2022 22:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A1410E16F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 22:32:39 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id cp18so1865320pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date;
 bh=OD3lRvHWHynetpK03lKY+/32dF/WZQ/VUdDZ7v9K1aU=;
 b=qHLAts6EtKsbT1NsEoXQ+C6PXpkur/IifdB2C1dP2lvlMXrdmTJvj+9BfrMmfuz2X/
 JP+PUUsNNL5DWrBiqsYOEL2Ti/JQQR4qjYD0WleD/sCWgswPigU5aWdOBXS/miMdU3GP
 +APoP5q5fFdSP+aEYBLQaQVwauYWDB+I5p5BIpJemozBvyZVYtDRgiAJ0m2nrgI6XoeF
 rnxC4MP6hZoevbHVASu3X4+S9z6rS8IBPff16fY08Wi2+ZJVpQg3mbvlE6S8LUdaAX2D
 RfpHJVVZXZhOuxKT38m3MtHfgrzbZMk32LPqjSLn1IvqKOtAJPRYP1ofI8l9wEaz7TeC
 Tegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OD3lRvHWHynetpK03lKY+/32dF/WZQ/VUdDZ7v9K1aU=;
 b=7orveNuymIpzcA7xaPpBISbqae20WnMXqC4k8Pm+W2Y7wsPwAb6+l2fuUve+e65nya
 atWNIiexEGi1e5zYpGx58aHtYoYI2iNtba922SAVAmBiRh/pv+9EUYUSOYXvRnGXqM17
 MRyFkaAv7bGJtSl566b/0iabJ1ig0TZhqKbylqQq7a3286AL7zqdrFoJuoLIa6q6LNLo
 JK3qcVAE9b0v+DWJiZIq5B7YAs4/pXtk8cLJl1T1DrSrXjz1W+Syu8gp6mLSm1ywk/Pk
 kH4yiqG4YBbQ8RchIosd6MlCFqIQzckisI00veSb39cHGM19hDUuEA1kwEQJymHIimYN
 uTsw==
X-Gm-Message-State: ACrzQf3Wt3LS7X4Q4cbKAo49XWfxSjy7ZPUJuo3fYexxxF9je9t8JyBH
 68WehgUoSnNE6ylkFwmVjEU=
X-Google-Smtp-Source: AMsMyM5uGsQ8+A2UIJ1XijHFjRn43rd3Ae+Rg1wRk+/9JNpz6h4yl9fgE3o29ceHx+6KMiTaNPHtpw==
X-Received: by 2002:a17:90b:1b4c:b0:202:c05f:6e7b with SMTP id
 nv12-20020a17090b1b4c00b00202c05f6e7bmr6807078pjb.200.1664317958845; 
 Tue, 27 Sep 2022 15:32:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9739:ab49:3830:2cbb])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a170902d2d100b00176a47e5840sm2090195plc.298.2022.09.27.15.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 15:32:38 -0700 (PDT)
Date: Tue, 27 Sep 2022 15:32:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
Message-ID: <YzN6A9Y20Ea1LdEz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Properties describing GPIOs should be named as "<property>-gpios" or
"<property>-gpio", and that is what gpiod API expects, however the
driver uses non-standard "gpios-reset" name. Let's adjust this, and also
note that the reset line is active low as that is also important to
gpiod API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Another option is to add another quirk into gpiolib-of.c, but we
may end up with a ton of them once we convert everything away from
of_get_named_gpio() to gpiod API, so I'd prefer not doing that.

 arch/arm/boot/dts/imx28-cfa10049.dts | 7 +++++--
 arch/arm/boot/dts/imx28-cfa10055.dts | 3 ++-
 arch/arm/boot/dts/imx28-cfa10056.dts | 3 ++-
 drivers/video/backlight/hx8357.c     | 2 +-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-cfa10049.dts b/arch/arm/boot/dts/imx28-cfa10049.dts
index 9ef0d567ea48..ae51a2aa2028 100644
--- a/arch/arm/boot/dts/imx28-cfa10049.dts
+++ b/arch/arm/boot/dts/imx28-cfa10049.dts
@@ -3,6 +3,7 @@
  * Copyright 2012 Free Electrons
  */
 
+#include <dt-bindings/gpio/gpio.h>
 /*
  * The CFA-10049 is an expansion board for the CFA-10036 module, thus we
  * need to include the CFA-10036 DTS.
@@ -346,8 +347,10 @@ hx8357: hx8357@0 {
 			spi-max-frequency = <100000>;
 			spi-cpol;
 			spi-cpha;
-			gpios-reset = <&gpio3 30 0>;
-			im-gpios = <&gpio5 4 0 &gpio5 5 0 &gpio5 6 0>;
+			reset-gpios = <&gpio3 30 GPIO_ACTIVE_LOW>;
+			im-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH
+				    &gpio5 5 GPIO_ACTIVE_HIGH
+				    &gpio5 6 GPIO_ACTIVE_HIGH>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx28-cfa10055.dts b/arch/arm/boot/dts/imx28-cfa10055.dts
index fac5bbda7a93..70e4dc67f7d2 100644
--- a/arch/arm/boot/dts/imx28-cfa10055.dts
+++ b/arch/arm/boot/dts/imx28-cfa10055.dts
@@ -4,6 +4,7 @@
  * 				  Free Electrons
  */
 
+#include <dt-bindings/gpio/gpio.h>
 /*
  * The CFA-10055 is an expansion board for the CFA-10036 module and
  * CFA-10037, thus we need to include the CFA-10037 DTS.
@@ -148,7 +149,7 @@ hx8357: hx8357@0 {
 			spi-max-frequency = <100000>;
 			spi-cpol;
 			spi-cpha;
-			gpios-reset = <&gpio3 30 0>;
+			reset-gpios = <&gpio3 30 GPIO_ACTIVE_LOW>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/imx28-cfa10056.dts b/arch/arm/boot/dts/imx28-cfa10056.dts
index c5f3337e8b39..687eaa555a15 100644
--- a/arch/arm/boot/dts/imx28-cfa10056.dts
+++ b/arch/arm/boot/dts/imx28-cfa10056.dts
@@ -3,6 +3,7 @@
  * Copyright 2013 Free Electrons
  */
 
+#include <dt-bindings/gpio/gpio.h>
 /*
  * The CFA-10055 is an expansion board for the CFA-10036 module and
  * CFA-10037, thus we need to include the CFA-10037 DTS.
@@ -107,7 +108,7 @@ hx8369: hx8369@0 {
 			spi-max-frequency = <100000>;
 			spi-cpol;
 			spi-cpha;
-			gpios-reset = <&gpio3 30 0>;
+			reset-gpios = <&gpio3 30 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
diff --git a/drivers/video/backlight/hx8357.c b/drivers/video/backlight/hx8357.c
index 9b50bc96e00f..41332f48b2df 100644
--- a/drivers/video/backlight/hx8357.c
+++ b/drivers/video/backlight/hx8357.c
@@ -601,7 +601,7 @@ static int hx8357_probe(struct spi_device *spi)
 	if (!match || !match->data)
 		return -EINVAL;
 
-	lcd->reset = of_get_named_gpio(spi->dev.of_node, "gpios-reset", 0);
+	lcd->reset = of_get_named_gpio(spi->dev.of_node, "reset-gpios", 0);
 	if (!gpio_is_valid(lcd->reset)) {
 		dev_err(&spi->dev, "Missing dt property: gpios-reset\n");
 		return -EINVAL;
-- 
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Dmitry
