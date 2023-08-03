Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1376EBD2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71D310E1AA;
	Thu,  3 Aug 2023 14:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4955510E1AA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 14:08:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyZ-0006mV-Nr; Thu, 03 Aug 2023 16:06:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyN-000rBF-In; Thu, 03 Aug 2023 16:06:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyM-00A9kB-Jk; Thu, 03 Aug 2023 16:06:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] pwm: Manage owner assignment implicitly for drivers
Date: Thu,  3 Aug 2023 16:06:30 +0200
Message-Id: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=fUIfC654WxtfT7CEJ8mGT4DHYTt22edc6EeQOO0mgBU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBky7RhOm8jkQTlEYB5GsZS8El0/H9apHFEdsZFO
 x8y+5Ja40OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMu0YQAKCRCPgPtYfRL+
 TsJcB/90L6hN+ip+TjX3AzflYEmXfAvsD7DvqLlndSD4q7tLpczaexF3R7J6u81XciSqOUe2jgL
 ZFH92dwUdpov0xdqiWraRK+aZJ+b0W4jpGsrqqlhoMdolr0pAB7fIFytPguywOKD62dbKy1CvL1
 Dhl29UAwsXqsIV7jcTR/3lRLsFUwN9/STI8/IVeD4JJHoLv16c1Q61uVC/I22L/ivskcK9F/YQX
 7it5vFhz9lfLpr79GuNQ3+d+atoBJRDfjCnDak/HWaR9JRk7b7F8pb+oq6ih+R2INrvw1jlBxDW
 1b3cg6OWSLaXTh/Y3/NSkgaZz/kG8/JbVRjAFD6tfDS0KfZO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Johan Hovold <johan@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Michael Walle <michael@walle.cc>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Alex Elder <elder@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

while working on the pwm core I noticed that pwm-crc doesn't assign
.owner in its pwm_ops structure. This isn't a problem in practise though
as this driver can only be compiled built-in (up to now).

Still prevent future pwm drivers not assigning .owner by wrapping
pwmchip_add() in a macro that automates owner handling simplifying each
driver a (tiny) bit.

I also found that there is no hard reason to only compile pwm-crc as a
built-in on x86, so this limitation is lifted in the second patch.

Best regards
Uwe

Uwe Kleine-König (2):
  pwm: Manage owner assignment implicitly for drivers
  pwm: crc: Allow compilation as module and with COMPILE_TEST

 drivers/gpio/gpio-mvebu.c             |  1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
 drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
 drivers/pwm/Kconfig                   |  4 ++--
 drivers/pwm/core.c                    | 20 +++++++++++---------
 drivers/pwm/pwm-ab8500.c              |  1 -
 drivers/pwm/pwm-apple.c               |  1 -
 drivers/pwm/pwm-atmel-hlcdc.c         |  1 -
 drivers/pwm/pwm-atmel-tcb.c           |  1 -
 drivers/pwm/pwm-atmel.c               |  1 -
 drivers/pwm/pwm-bcm-iproc.c           |  1 -
 drivers/pwm/pwm-bcm-kona.c            |  1 -
 drivers/pwm/pwm-bcm2835.c             |  1 -
 drivers/pwm/pwm-berlin.c              |  1 -
 drivers/pwm/pwm-brcmstb.c             |  1 -
 drivers/pwm/pwm-clk.c                 |  1 -
 drivers/pwm/pwm-clps711x.c            |  1 -
 drivers/pwm/pwm-crc.c                 |  5 ++++-
 drivers/pwm/pwm-cros-ec.c             |  1 -
 drivers/pwm/pwm-dwc.c                 |  1 -
 drivers/pwm/pwm-ep93xx.c              |  1 -
 drivers/pwm/pwm-fsl-ftm.c             |  1 -
 drivers/pwm/pwm-hibvt.c               |  1 -
 drivers/pwm/pwm-img.c                 |  1 -
 drivers/pwm/pwm-imx-tpm.c             |  1 -
 drivers/pwm/pwm-imx1.c                |  1 -
 drivers/pwm/pwm-imx27.c               |  1 -
 drivers/pwm/pwm-intel-lgm.c           |  1 -
 drivers/pwm/pwm-iqs620a.c             |  1 -
 drivers/pwm/pwm-jz4740.c              |  1 -
 drivers/pwm/pwm-keembay.c             |  1 -
 drivers/pwm/pwm-lp3943.c              |  1 -
 drivers/pwm/pwm-lpc18xx-sct.c         |  1 -
 drivers/pwm/pwm-lpc32xx.c             |  1 -
 drivers/pwm/pwm-lpss.c                |  1 -
 drivers/pwm/pwm-mediatek.c            |  1 -
 drivers/pwm/pwm-meson.c               |  1 -
 drivers/pwm/pwm-microchip-core.c      |  1 -
 drivers/pwm/pwm-mtk-disp.c            |  1 -
 drivers/pwm/pwm-mxs.c                 |  1 -
 drivers/pwm/pwm-ntxec.c               |  1 -
 drivers/pwm/pwm-omap-dmtimer.c        |  1 -
 drivers/pwm/pwm-pca9685.c             |  1 -
 drivers/pwm/pwm-pxa.c                 |  1 -
 drivers/pwm/pwm-raspberrypi-poe.c     |  1 -
 drivers/pwm/pwm-rcar.c                |  1 -
 drivers/pwm/pwm-renesas-tpu.c         |  1 -
 drivers/pwm/pwm-rockchip.c            |  1 -
 drivers/pwm/pwm-rz-mtu3.c             |  1 -
 drivers/pwm/pwm-samsung.c             |  1 -
 drivers/pwm/pwm-sifive.c              |  1 -
 drivers/pwm/pwm-sl28cpld.c            |  1 -
 drivers/pwm/pwm-spear.c               |  1 -
 drivers/pwm/pwm-sprd.c                |  1 -
 drivers/pwm/pwm-sti.c                 |  1 -
 drivers/pwm/pwm-stm32-lp.c            |  1 -
 drivers/pwm/pwm-stm32.c               |  1 -
 drivers/pwm/pwm-stmpe.c               |  1 -
 drivers/pwm/pwm-sun4i.c               |  1 -
 drivers/pwm/pwm-sunplus.c             |  1 -
 drivers/pwm/pwm-tegra.c               |  1 -
 drivers/pwm/pwm-tiecap.c              |  1 -
 drivers/pwm/pwm-tiehrpwm.c            |  1 -
 drivers/pwm/pwm-twl-led.c             |  2 --
 drivers/pwm/pwm-twl.c                 |  2 --
 drivers/pwm/pwm-visconti.c            |  1 -
 drivers/pwm/pwm-vt8500.c              |  1 -
 drivers/pwm/pwm-xilinx.c              |  1 -
 drivers/staging/greybus/pwm.c         |  1 -
 include/linux/pwm.h                   |  8 +++++---
 70 files changed, 22 insertions(+), 83 deletions(-)


base-commit: 3ccb179aa40d931eb00ef8910d7b812a95659563
-- 
2.39.2

