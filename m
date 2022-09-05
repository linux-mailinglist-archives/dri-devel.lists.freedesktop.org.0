Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2185ACAA8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D33E10E1AD;
	Mon,  5 Sep 2022 06:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D815210E17D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:31:11 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id w139so7706176pfc.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Sep 2022 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OVfZryZDsn7EOmcZgQCBsExc88uptR2TDaptHz7Mkz0=;
 b=NCVkm6jO5T8JvtIiswGFJRWQ6X8V/lEcdFXeBX/jS7NR6HfIMOFQqwtvbzVJH4QbnW
 5eAaKJ2Btz6EDiplEg7pNTEHzAVyU5kQFh+Had3EVkArXQkeEhZc+8Xu5s/fSXNTBYRd
 QxwDXvJLKzwpv0KLpWVLomVHNaTztUDtOmDZOUePP3FQAXx80QMYryGWp8Qtgtkq+rCS
 zMl46htgUuknSjojcasQ8VFXQgdYGTuGM8zLouDO2HoFeHfp3xTuqNCMdAVcyrwb89NO
 Puk4rmbUyqRCdbE9PptjU3xweuFiTOXTPnuBWJEMAtMUaphJsUh67rNB6zwD4fYTTNtY
 YpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OVfZryZDsn7EOmcZgQCBsExc88uptR2TDaptHz7Mkz0=;
 b=UOXRwnUzqn7LNKU3jco27k+ZNN1UPVGfSlh0wo4kgoXVPniU0TXztjOpcZE7+KQhOm
 RnieWCgDn5ZtudWdMFtOflTBpUuwAZFwEMuSsKpSN/M499UzzDquFUStAqmGwhx2MmW2
 KwH7gThbRtahauq3XjS5k9h5htz+mXnj68YH7bXGYSOadWAOWqkoHS57u3TsXT9D961i
 Wb7i/9uGwx0ZDgZrHg6VFon8DSneDeFRhr7VEV7Ff7v60KUGCdfNl0AD9vmO8LQriMcQ
 WIKXWnernFOKXJVWVMzW706ICaB4OPwvleAPF5AQ3y5fcU2bnlOPgEJGVZl5IZj79Xo1
 K9VQ==
X-Gm-Message-State: ACgBeo3iFLxuDohjBhomjFo2FqQGVJ9h/jhJusWHxB8Nxq0fhg9bGCy0
 cz5uzm95ZbemeR/QbzY4k9Y=
X-Google-Smtp-Source: AA6agR6Idf7B+Ir3+C7s0CQ8UlH5pwxbWKYpAaeA415uduldic97z5mhuS5KFGWggWKjnL3sMq7imA==
X-Received: by 2002:a63:dd51:0:b0:430:18d9:edf8 with SMTP id
 g17-20020a63dd51000000b0043018d9edf8mr21685454pgj.163.1662359471251; 
 Sun, 04 Sep 2022 23:31:11 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:202:201:7332:f188:2984:5930])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042254fce5e7sm5710653pga.50.2022.09.04.23.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 23:31:10 -0700 (PDT)
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
Subject: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
Date: Sun,  4 Sep 2022 23:30:53 -0700
Message-Id: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
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

I would like to limit (or maybe even remove) use of
[devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
a bit, so let's switch to the generic device property API. It may even
help with handling secondary fwnodes when gpiolib is taught to handle
gpios described by swnodes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 8e323e93be91..929f9363e94b 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -2202,10 +2202,11 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
 		 * and in this case fall back to using AFI per port register
 		 * to toggle PERST# SFIO line.
 		 */
-		rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
-							     "reset-gpios", 0,
-							     GPIOD_OUT_LOW,
-							     label);
+		rp->reset_gpio = devm_fwnode_gpiod_get(dev,
+						       of_fwnode_handle(port),
+						       "reset",
+						       GPIOD_OUT_LOW,
+						       label);
 		if (IS_ERR(rp->reset_gpio)) {
 			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
 				rp->reset_gpio = NULL;

-- 
b4 0.10.0-dev-fc921
