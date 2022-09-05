Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D465ACAA7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C6710E17D;
	Mon,  5 Sep 2022 06:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6C10E1AD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:31:09 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 72so7721531pfx.9
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 23:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=s5BObB/DFF43Zpjz+AxwbAQA1wE3EC6yd1PYO1tpkJ0=;
 b=eLC8Rb8Jtj6ohqIsxli11sh5mg6/lRM2jJY189w3rlTxUvSnPyQEKwgiFzri16qznK
 8Q1UK6BI5arOWJOW0tj1AFole4eAGnwtpWLBlNUo5DLvXjDf2L6w22Ztu0jF9lQM7v6B
 Mgw/mw3etr4vw1HQQFCWIU3BlD77SGHudPuPuFK4F9ujodYtIFvp6WmYCo+o/G/rhDel
 cW0w+zf7/RP7Nz0D6/Vjgje6fNrs1I/PeMd47xU/8sAWlLKDTbXsIi2Op/DBjE+aLmmC
 MAF22o/KivEly0jsBjH1TXScPbJfn9X2BkKRRH0cKrk4wP42LwxdMHRse73eSv3HS6NH
 jCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=s5BObB/DFF43Zpjz+AxwbAQA1wE3EC6yd1PYO1tpkJ0=;
 b=I8EcWPcREXSrngWrgmIcfVe+KcOFRFk0Es6g/3jyLHKK3VS3VcOAHaduxRP0+Q3iNM
 e6ktjLjxOdrhR/L1qUlwkfIakfATEgtgWk5LXfoVd9Q6FDeREiilR0uMME7cKWEFvtrj
 JljWLKurMU6kFNMoUW65dfZ2WP+fdO3G5qXtuLuHtJJE2jpatPz2sxCbLrEWx0DZpFU8
 8VgnDH+aCMFlWoV6ooXoEzt7iayqDKp/b93q4GqXdk8lTtAi7sAQSts0HtLeqVB5SMEd
 /t57IhmYm2J/pzztVUvep+HT1TW7HULhEaBUP1jNxP3wpaLryHXbLCDf7NENK6E3AZRZ
 eEhA==
X-Gm-Message-State: ACgBeo1Peem8aI8ec9SRzAKZrb4ogiYvpI9LSBVlZSLpK6TZp+T+KW6H
 NwNW0JY4ELEnOwf1Lgs0dHE=
X-Google-Smtp-Source: AA6agR6MPvi6YNNmbiAwPTRGnWV1I0ziWOWrr545AIf0+R4zt3mu9zZID4cCyo19DCCSuxN6bYnKJg==
X-Received: by 2002:a63:4566:0:b0:41d:353:46b4 with SMTP id
 u38-20020a634566000000b0041d035346b4mr41713619pgk.316.1662359468624; 
 Sun, 04 Sep 2022 23:31:08 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:07 -0700 (PDT)
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
Subject: [PATCH v1 00/11] Get rid of [devm_]gpiod_get_from_of_node() public
 APIs
Date: Sun,  4 Sep 2022 23:30:52 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
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

I would like to stop exporting OF-specific [devm_]gpiod_get_from_of_node()
so that gpiolib can be cleaned a bit. We can do that by switching drivers
to use generic fwnode API ([devm_]fwnode_gpiod_get()). By doing so we open
the door to augmenting device tree and ACPI information through secondary
software properties (once we teach gpiolib how to handle those).

I hope that relevant maintainers will take patches through their trees and
then we could merge the last one some time after -rc1.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
Dmitry Torokhov (11):
      PCI: tegra: switch to using devm_fwnode_gpiod_get
      drm/tegra: switch to using devm_fwnode_gpiod_get
      mtd: rawnand: stm32_fmc2: switch to using devm_fwnode_gpiod_get()
      usb: phy: tegra: switch to using devm_gpiod_get()
      usb: gadget: udc: at91: switch to using fwnode_gpiod_get_index()
      PCI: aardvark: switch to using devm_gpiod_get_optional()
      PCI: apple: switch to using fwnode_gpiod_get_index()
      regulator: bd71815: switch to using devm_fwnode_gpiod_get()
      regulator: bd9576: switch to using devm_fwnode_gpiod_get()
      watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
      gpiolib: of: remove [devm_]gpiod_get_from_of_node() APIs

 drivers/gpio/gpiolib-devres.c          | 55 ----------------------------------
 drivers/gpio/gpiolib-of.c              |  1 -
 drivers/gpio/gpiolib-of.h              | 13 ++++++++
 drivers/gpu/drm/tegra/output.c         | 10 +++----
 drivers/mtd/nand/raw/stm32_fmc2_nand.c |  5 ++--
 drivers/pci/controller/pci-aardvark.c  | 23 +++++++-------
 drivers/pci/controller/pci-tegra.c     |  9 +++---
 drivers/pci/controller/pcie-apple.c    |  4 +--
 drivers/regulator/bd71815-regulator.c  |  7 ++---
 drivers/regulator/bd9576-regulator.c   | 17 ++++++-----
 drivers/usb/gadget/udc/at91_udc.c      |  8 +++--
 drivers/usb/phy/phy-tegra-usb.c        | 14 ++++++---
 drivers/watchdog/bd9576_wdt.c          | 51 ++++++++++++++++++-------------
 include/linux/gpio/consumer.h          | 48 -----------------------------
 14 files changed, 96 insertions(+), 169 deletions(-)
---
base-commit: 7fd22855300e693668c3397771b3a2b3948f827a
change-id: 20220903-gpiod_get_from_of_node-remove-de3032fc01de

Best regards,
-- 
Dmitry

