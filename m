Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DE75ACAB5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C2710E1AC;
	Mon,  5 Sep 2022 06:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D47410E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:31:22 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id b196so7295822pga.7
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=f1PZzsaMnOlN09CVwbSU1GebwD1POC8hMtOU/HbCocM=;
 b=pdli+4eCvdWbxLZpx0O/e5Ud3wuQ5WWZPs7wxvLZ8aWyeshw5o3oRO/WG8ev2Aaq1m
 BX/Fr0/H0104qGs68GxhCwuFDG+PdZ2DrBRO+OPQVwRTpp7rdrBwbaXxSj0nC7vBM+b5
 GXjvKR+R9YSnP5K560kQKQaswuG1HWEF9p6rBSHyfMHnnKCObj/NMkW/0nwlLU7coaJN
 lMlGTVarp6ddLZqLDpTSWdUVPPyTlQJyHZXKdGvmnZujDf4OJXr1QpZ4olhMYA2SJhx8
 m53y0aRnHgIB7peKEuEd6JQIyv+D3WxGZ668VhcUTC58GT5LurfYxI/+Of47FfV3GuNG
 TzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f1PZzsaMnOlN09CVwbSU1GebwD1POC8hMtOU/HbCocM=;
 b=CpAQNc0IIH3vu2eU86cs2M7/7m3oIJ44yTCgdWF/xUUWXsxS3ABkpDnGRbhkJa3W+e
 4GTmkMhBhzYCEj7WfZrYBt6GAC52nqO8souKXTo+oKG3iFIzmVW8VUY6s3+xxjhpo57s
 QESjTk6Buymi6FZgtbSCNILEwl/2QRurNawuilBEgUh7ZMxj6xCeRkrMHhHDANEreCY3
 +lhl6/vt9UYSeJPmN9+0lO9nKxr5fHfuuG6FXUSdM9ZyWJVGqTSY1cBtAmVVTCLpTgBO
 PY//yo1iQQZwYurC2NS/mffHhyfAG780ZQ9uZfGe8sqnX3Fm6oFQ71hec9jXXbObvuGk
 v+tA==
X-Gm-Message-State: ACgBeo01G4zbmFcrqf5vVsR2oTt7jvKipSI7HiYrryJM4YVbkOzH/kOP
 fyEAs3R+gWokw72/OBwYHPGd7S+uvIE=
X-Google-Smtp-Source: AA6agR5cvvg/UZg1XV6YqtMeu4gBydqn31I2YyYPcH2GdlFOcXWs2FB6+oFFKzKdNcI+NqL1V/14Sg==
X-Received: by 2002:aa7:978c:0:b0:537:d68e:3a27 with SMTP id
 o12-20020aa7978c000000b00537d68e3a27mr28251047pfp.71.1662359481595; 
 Sun, 04 Sep 2022 23:31:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>,
 David Airlie <airlied@linux.ie>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 05/11] usb: gadget: udc: at91: switch to using
 fwnode_gpiod_get_index()
Date: Sun,  4 Sep 2022 23:30:57 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-5-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-fc921
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
Cc: linux-watchdog@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I would like to stop exporting OF-specific gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit, so let's switch to the generic
fwnode property API.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 728987280373..1db1dbbab79a 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1779,12 +1779,14 @@ static void at91udc_of_init(struct at91_udc *udc, struct device_node *np)
 	if (of_property_read_u32(np, "atmel,vbus-polled", &val) == 0)
 		board->vbus_polled = 1;
 
-	board->vbus_pin = gpiod_get_from_of_node(np, "atmel,vbus-gpio", 0,
-						 GPIOD_IN, "udc_vbus");
+	board->vbus_pin = fwnode_gpiod_get_index(of_fwnode_handle(np),
+						 "atmel,vbus", 0, GPIOD_IN,
+						 "udc_vbus");
 	if (IS_ERR(board->vbus_pin))
 		board->vbus_pin = NULL;
 
-	board->pullup_pin = gpiod_get_from_of_node(np, "atmel,pullup-gpio", 0,
+	board->pullup_pin = fwnode_gpiod_get_index(of_fwnode_handle(np),
+						   "atmel,pullup", 0,
 						   GPIOD_ASIS, "udc_pullup");
 	if (IS_ERR(board->pullup_pin))
 		board->pullup_pin = NULL;

-- 
b4 0.10.0-dev-fc921
