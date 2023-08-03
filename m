Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16176EBD3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D81C10E1DA;
	Thu,  3 Aug 2023 14:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5E310E1CC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 14:08:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyZ-0006mi-Nq; Thu, 03 Aug 2023 16:06:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyO-000rBL-8E; Thu, 03 Aug 2023 16:06:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qRYyM-00A9kE-Uj; Thu, 03 Aug 2023 16:06:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] pwm: Manage owner assignment implicitly for drivers
Date: Thu,  3 Aug 2023 16:06:31 +0200
Message-Id: <20230803140633.138165-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
References: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=37568;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=QohLjSMriC3nuwI9OCwYXWCsZHPt9IeCl7mIdhMPLm8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBky7Rj4w2PE52GDRUOz4tpVPT4BA6VLcRGV2eeK
 SJv1zlgTOiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMu0YwAKCRCPgPtYfRL+
 TpSdB/9eeuLEMu6EYwvywWJmtjU5zmckIOIM8Yv212RoicJ0N1Jy0VbHs5dIRoSes4/KvOhZG0M
 YDAcn/rroeKwc6/qvWLGQDtLu9+6kRpeUZnQZTUGmB6I+GEt0lN8tqPvPn8edgnZQHNRK+1mm6c
 EnYU5nOpL555Tx/gvUQfhdqiPf6NT11KAkFnRBtPp7CR+TyoATojgl4Cndy3BtyUHEQllgZeOCJ
 Ug1yRgGDEcoCLn1/GHaZ+ssHatCvwXH88ZY4h2dwo3IG4QhfrcNvDsitxf0AyTKJ4TbCvOISCIU
 HBO43JJ5YdlHctH3aORa+f1oIaLIxbhpdO5YPoJBItN4t1/t
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

Instead of requiring each driver to care for assigning the owner member
of struct pwm_ops, handle that implicitly using a macro. Note that the
owner member has to be moved to struct pwm_chip, as the ops structure
usually lives in read-only memory and so cannot be modified.

The upside is that new lowlevel drivers cannot forget the assignment and
save one line each. The pwm-crc driver didn't assign .owner, that's not
a problem in practise though as the driver cannot be compiled as a
module.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-mvebu.c             |  1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
 drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
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
 68 files changed, 16 insertions(+), 80 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a68f682aec01..b2e6b54e2559 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -756,7 +756,6 @@ static const struct pwm_ops mvebu_pwm_ops = {
 	.free = mvebu_pwm_free,
 	.get_state = mvebu_pwm_get_state,
 	.apply = mvebu_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static void __maybe_unused mvebu_pwm_suspend(struct mvebu_gpio_chip *mvchip)
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c499a14d0b98..53d133d18c18 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1571,7 +1571,6 @@ static const struct pwm_ops ti_sn_pwm_ops = {
 	.free = ti_sn_pwm_free,
 	.apply = ti_sn_pwm_apply,
 	.get_state = ti_sn_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int ti_sn_pwm_probe(struct auxiliary_device *adev,
diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 59581b3e25ca..d7ae30ebb34a 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1086,7 +1086,6 @@ static const struct pwm_ops lpg_pwm_ops = {
 	.request = lpg_pwm_request,
 	.apply = lpg_pwm_apply,
 	.get_state = lpg_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int lpg_add_pwm(struct lpg *lpg)
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index dc66e3405bf5..96069c6d3d69 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -89,13 +89,13 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
 	if (test_bit(PWMF_REQUESTED, &pwm->flags))
 		return -EBUSY;
 
-	if (!try_module_get(pwm->chip->ops->owner))
+	if (!try_module_get(pwm->chip->owner))
 		return -ENODEV;
 
 	if (pwm->chip->ops->request) {
 		err = pwm->chip->ops->request(pwm->chip, pwm);
 		if (err) {
-			module_put(pwm->chip->ops->owner);
+			module_put(pwm->chip->owner);
 			return err;
 		}
 	}
@@ -253,14 +253,14 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
 }
 
 /**
- * pwmchip_add() - register a new PWM chip
+ * __pwmchip_add() - register a new PWM chip
  * @chip: the PWM chip to add
  *
  * Register a new PWM chip.
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int pwmchip_add(struct pwm_chip *chip)
+int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
 {
 	struct pwm_device *pwm;
 	unsigned int i;
@@ -272,6 +272,8 @@ int pwmchip_add(struct pwm_chip *chip)
 	if (!pwm_ops_check(chip))
 		return -EINVAL;
 
+	chip->owner = owner;
+
 	chip->pwms = kcalloc(chip->npwm, sizeof(*pwm), GFP_KERNEL);
 	if (!chip->pwms)
 		return -ENOMEM;
@@ -306,7 +308,7 @@ int pwmchip_add(struct pwm_chip *chip)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(pwmchip_add);
+EXPORT_SYMBOL_GPL(__pwmchip_add);
 
 /**
  * pwmchip_remove() - remove a PWM chip
@@ -338,17 +340,17 @@ static void devm_pwmchip_remove(void *data)
 	pwmchip_remove(chip);
 }
 
-int devm_pwmchip_add(struct device *dev, struct pwm_chip *chip)
+int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner)
 {
 	int ret;
 
-	ret = pwmchip_add(chip);
+	ret = __pwmchip_add(chip, owner);
 	if (ret)
 		return ret;
 
 	return devm_add_action_or_reset(dev, devm_pwmchip_remove, chip);
 }
-EXPORT_SYMBOL_GPL(devm_pwmchip_add);
+EXPORT_SYMBOL_GPL(__devm_pwmchip_add);
 
 /**
  * pwm_request_from_chip() - request a PWM device relative to a PWM chip
@@ -979,7 +981,7 @@ void pwm_put(struct pwm_device *pwm)
 	pwm_set_chip_data(pwm, NULL);
 	pwm->label = NULL;
 
-	module_put(pwm->chip->ops->owner);
+	module_put(pwm->chip->owner);
 out:
 	mutex_unlock(&pwm_lock);
 }
diff --git a/drivers/pwm/pwm-ab8500.c b/drivers/pwm/pwm-ab8500.c
index 583a7d69c741..670d33daea84 100644
--- a/drivers/pwm/pwm-ab8500.c
+++ b/drivers/pwm/pwm-ab8500.c
@@ -181,7 +181,6 @@ static int ab8500_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops ab8500_pwm_ops = {
 	.apply = ab8500_pwm_apply,
 	.get_state = ab8500_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int ab8500_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-apple.c b/drivers/pwm/pwm-apple.c
index 8e7d67fb5fbe..4d755b628d9e 100644
--- a/drivers/pwm/pwm-apple.c
+++ b/drivers/pwm/pwm-apple.c
@@ -99,7 +99,6 @@ static int apple_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops apple_pwm_ops = {
 	.apply = apple_pwm_apply,
 	.get_state = apple_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int apple_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-atmel-hlcdc.c b/drivers/pwm/pwm-atmel-hlcdc.c
index e271d920151e..07920e034757 100644
--- a/drivers/pwm/pwm-atmel-hlcdc.c
+++ b/drivers/pwm/pwm-atmel-hlcdc.c
@@ -170,7 +170,6 @@ static int atmel_hlcdc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops atmel_hlcdc_pwm_ops = {
 	.apply = atmel_hlcdc_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct atmel_hlcdc_pwm_errata atmel_hlcdc_pwm_at91sam9x5_errata = {
diff --git a/drivers/pwm/pwm-atmel-tcb.c b/drivers/pwm/pwm-atmel-tcb.c
index c00dd37c5fbd..98b33c016c3c 100644
--- a/drivers/pwm/pwm-atmel-tcb.c
+++ b/drivers/pwm/pwm-atmel-tcb.c
@@ -364,7 +364,6 @@ static const struct pwm_ops atmel_tcb_pwm_ops = {
 	.request = atmel_tcb_pwm_request,
 	.free = atmel_tcb_pwm_free,
 	.apply = atmel_tcb_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static struct atmel_tcb_config tcb_rm9200_config = {
diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
index 1f73325d1bea..e452f7b4a098 100644
--- a/drivers/pwm/pwm-atmel.c
+++ b/drivers/pwm/pwm-atmel.c
@@ -402,7 +402,6 @@ static int atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops atmel_pwm_ops = {
 	.apply = atmel_pwm_apply,
 	.get_state = atmel_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static const struct atmel_pwm_data atmel_sam9rl_pwm_data = {
diff --git a/drivers/pwm/pwm-bcm-iproc.c b/drivers/pwm/pwm-bcm-iproc.c
index 7d70b6f186a6..1da902440df2 100644
--- a/drivers/pwm/pwm-bcm-iproc.c
+++ b/drivers/pwm/pwm-bcm-iproc.c
@@ -183,7 +183,6 @@ static int iproc_pwmc_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops iproc_pwm_ops = {
 	.apply = iproc_pwmc_apply,
 	.get_state = iproc_pwmc_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int iproc_pwmc_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-bcm-kona.c b/drivers/pwm/pwm-bcm-kona.c
index e5b00cc9f7a7..15d6ed03c3ce 100644
--- a/drivers/pwm/pwm-bcm-kona.c
+++ b/drivers/pwm/pwm-bcm-kona.c
@@ -269,7 +269,6 @@ static int kona_pwmc_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops kona_pwm_ops = {
 	.apply = kona_pwmc_apply,
-	.owner = THIS_MODULE,
 };
 
 static int kona_pwmc_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-bcm2835.c b/drivers/pwm/pwm-bcm2835.c
index bdfc2a5ec0d6..af318a35d510 100644
--- a/drivers/pwm/pwm-bcm2835.c
+++ b/drivers/pwm/pwm-bcm2835.c
@@ -129,7 +129,6 @@ static const struct pwm_ops bcm2835_pwm_ops = {
 	.request = bcm2835_pwm_request,
 	.free = bcm2835_pwm_free,
 	.apply = bcm2835_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int bcm2835_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-berlin.c b/drivers/pwm/pwm-berlin.c
index 0971c666afd1..6a6641fc4fa1 100644
--- a/drivers/pwm/pwm-berlin.c
+++ b/drivers/pwm/pwm-berlin.c
@@ -205,7 +205,6 @@ static const struct pwm_ops berlin_pwm_ops = {
 	.request = berlin_pwm_request,
 	.free = berlin_pwm_free,
 	.apply = berlin_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id berlin_pwm_match[] = {
diff --git a/drivers/pwm/pwm-brcmstb.c b/drivers/pwm/pwm-brcmstb.c
index a3faa9a3de7c..96967f8a8dad 100644
--- a/drivers/pwm/pwm-brcmstb.c
+++ b/drivers/pwm/pwm-brcmstb.c
@@ -220,7 +220,6 @@ static int brcmstb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops brcmstb_pwm_ops = {
 	.apply = brcmstb_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id brcmstb_pwm_of_match[] = {
diff --git a/drivers/pwm/pwm-clk.c b/drivers/pwm/pwm-clk.c
index 0ee4d2aee4df..9dd88b386907 100644
--- a/drivers/pwm/pwm-clk.c
+++ b/drivers/pwm/pwm-clk.c
@@ -77,7 +77,6 @@ static int pwm_clk_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops pwm_clk_ops = {
 	.apply = pwm_clk_apply,
-	.owner = THIS_MODULE,
 };
 
 static int pwm_clk_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-clps711x.c b/drivers/pwm/pwm-clps711x.c
index b0d91142da8d..42179b3f7ec3 100644
--- a/drivers/pwm/pwm-clps711x.c
+++ b/drivers/pwm/pwm-clps711x.c
@@ -72,7 +72,6 @@ static int clps711x_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops clps711x_pwm_ops = {
 	.request = clps711x_pwm_request,
 	.apply = clps711x_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static struct pwm_device *clps711x_pwm_xlate(struct pwm_chip *chip,
diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
index baaac0c33aa0..500504c7d459 100644
--- a/drivers/pwm/pwm-cros-ec.c
+++ b/drivers/pwm/pwm-cros-ec.c
@@ -241,7 +241,6 @@ static const struct pwm_ops cros_ec_pwm_ops = {
 	.free = cros_ec_pwm_free,
 	.get_state	= cros_ec_pwm_get_state,
 	.apply		= cros_ec_pwm_apply,
-	.owner		= THIS_MODULE,
 };
 
 /*
diff --git a/drivers/pwm/pwm-dwc.c b/drivers/pwm/pwm-dwc.c
index 3bbb26c862c3..53fe00ccd47e 100644
--- a/drivers/pwm/pwm-dwc.c
+++ b/drivers/pwm/pwm-dwc.c
@@ -195,7 +195,6 @@ static int dwc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops dwc_pwm_ops = {
 	.apply = dwc_pwm_apply,
 	.get_state = dwc_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static struct dwc_pwm *dwc_pwm_alloc(struct device *dev)
diff --git a/drivers/pwm/pwm-ep93xx.c b/drivers/pwm/pwm-ep93xx.c
index c45a75e65c86..51e072572a87 100644
--- a/drivers/pwm/pwm-ep93xx.c
+++ b/drivers/pwm/pwm-ep93xx.c
@@ -159,7 +159,6 @@ static const struct pwm_ops ep93xx_pwm_ops = {
 	.request = ep93xx_pwm_request,
 	.free = ep93xx_pwm_free,
 	.apply = ep93xx_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int ep93xx_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
index b7c6045c5d08..d1b6d1aa4773 100644
--- a/drivers/pwm/pwm-fsl-ftm.c
+++ b/drivers/pwm/pwm-fsl-ftm.c
@@ -350,7 +350,6 @@ static const struct pwm_ops fsl_pwm_ops = {
 	.request = fsl_pwm_request,
 	.free = fsl_pwm_free,
 	.apply = fsl_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int fsl_pwm_init(struct fsl_pwm_chip *fpc)
diff --git a/drivers/pwm/pwm-hibvt.c b/drivers/pwm/pwm-hibvt.c
index f7ba6fe9a349..c435776e2f78 100644
--- a/drivers/pwm/pwm-hibvt.c
+++ b/drivers/pwm/pwm-hibvt.c
@@ -185,7 +185,6 @@ static const struct pwm_ops hibvt_pwm_ops = {
 	.get_state = hibvt_pwm_get_state,
 	.apply = hibvt_pwm_apply,
 
-	.owner = THIS_MODULE,
 };
 
 static int hibvt_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-img.c b/drivers/pwm/pwm-img.c
index 326af85888e7..116fa060e302 100644
--- a/drivers/pwm/pwm-img.c
+++ b/drivers/pwm/pwm-img.c
@@ -208,7 +208,6 @@ static int img_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops img_pwm_ops = {
 	.apply = img_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct img_pwm_soc_data pistachio_pwm = {
diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 98ab65c89685..fe8bf598d388 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -332,7 +332,6 @@ static const struct pwm_ops imx_tpm_pwm_ops = {
 	.free = pwm_imx_tpm_free,
 	.get_state = pwm_imx_tpm_get_state,
 	.apply = pwm_imx_tpm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int pwm_imx_tpm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-imx1.c b/drivers/pwm/pwm-imx1.c
index 0651983bed19..d175d895f22a 100644
--- a/drivers/pwm/pwm-imx1.c
+++ b/drivers/pwm/pwm-imx1.c
@@ -146,7 +146,6 @@ static int pwm_imx1_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops pwm_imx1_ops = {
 	.apply = pwm_imx1_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id pwm_imx1_dt_ids[] = {
diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index 29a3089c534c..7d9bc43f12b0 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -296,7 +296,6 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops pwm_imx27_ops = {
 	.apply = pwm_imx27_apply,
 	.get_state = pwm_imx27_get_state,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id pwm_imx27_dt_ids[] = {
diff --git a/drivers/pwm/pwm-intel-lgm.c b/drivers/pwm/pwm-intel-lgm.c
index 0cd7dd548e82..54ecae7f937e 100644
--- a/drivers/pwm/pwm-intel-lgm.c
+++ b/drivers/pwm/pwm-intel-lgm.c
@@ -107,7 +107,6 @@ static int lgm_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops lgm_pwm_ops = {
 	.get_state = lgm_pwm_get_state,
 	.apply = lgm_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static void lgm_pwm_init(struct lgm_pwm_chip *pc)
diff --git a/drivers/pwm/pwm-iqs620a.c b/drivers/pwm/pwm-iqs620a.c
index 47b3141135f3..378ab036edfe 100644
--- a/drivers/pwm/pwm-iqs620a.c
+++ b/drivers/pwm/pwm-iqs620a.c
@@ -166,7 +166,6 @@ static int iqs620_pwm_notifier(struct notifier_block *notifier,
 static const struct pwm_ops iqs620_pwm_ops = {
 	.apply = iqs620_pwm_apply,
 	.get_state = iqs620_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static void iqs620_pwm_notifier_unregister(void *context)
diff --git a/drivers/pwm/pwm-jz4740.c b/drivers/pwm/pwm-jz4740.c
index ef1293f2a897..cb384e6a1d91 100644
--- a/drivers/pwm/pwm-jz4740.c
+++ b/drivers/pwm/pwm-jz4740.c
@@ -216,7 +216,6 @@ static const struct pwm_ops jz4740_pwm_ops = {
 	.request = jz4740_pwm_request,
 	.free = jz4740_pwm_free,
 	.apply = jz4740_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int jz4740_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-keembay.c b/drivers/pwm/pwm-keembay.c
index ac02d8bb4a0b..ac824ecc3f64 100644
--- a/drivers/pwm/pwm-keembay.c
+++ b/drivers/pwm/pwm-keembay.c
@@ -178,7 +178,6 @@ static int keembay_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 }
 
 static const struct pwm_ops keembay_pwm_ops = {
-	.owner = THIS_MODULE,
 	.apply = keembay_pwm_apply,
 	.get_state = keembay_pwm_get_state,
 };
diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
index 4b133a17f4be..a1a106747372 100644
--- a/drivers/pwm/pwm-lp3943.c
+++ b/drivers/pwm/pwm-lp3943.c
@@ -216,7 +216,6 @@ static const struct pwm_ops lp3943_pwm_ops = {
 	.request	= lp3943_pwm_request,
 	.free		= lp3943_pwm_free,
 	.apply		= lp3943_pwm_apply,
-	.owner		= THIS_MODULE,
 };
 
 static int lp3943_pwm_parse_dt(struct device *dev,
diff --git a/drivers/pwm/pwm-lpc18xx-sct.c b/drivers/pwm/pwm-lpc18xx-sct.c
index 7a19a840bca5..ef7d0da137ed 100644
--- a/drivers/pwm/pwm-lpc18xx-sct.c
+++ b/drivers/pwm/pwm-lpc18xx-sct.c
@@ -341,7 +341,6 @@ static const struct pwm_ops lpc18xx_pwm_ops = {
 	.apply = lpc18xx_pwm_apply,
 	.request = lpc18xx_pwm_request,
 	.free = lpc18xx_pwm_free,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id lpc18xx_pwm_of_match[] = {
diff --git a/drivers/pwm/pwm-lpc32xx.c b/drivers/pwm/pwm-lpc32xx.c
index 806f0bb3ad6d..78f664e41e6e 100644
--- a/drivers/pwm/pwm-lpc32xx.c
+++ b/drivers/pwm/pwm-lpc32xx.c
@@ -115,7 +115,6 @@ static int lpc32xx_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops lpc32xx_pwm_ops = {
 	.apply = lpc32xx_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int lpc32xx_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 23fe332b2394..a6ea3ce7e019 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -243,7 +243,6 @@ static int pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops pwm_lpss_ops = {
 	.apply = pwm_lpss_apply,
 	.get_state = pwm_lpss_get_state,
-	.owner = THIS_MODULE,
 };
 
 struct pwm_lpss_chip *devm_pwm_lpss_probe(struct device *dev, void __iomem *base,
diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6adb0ed01906..373abfd25acb 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -229,7 +229,6 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops pwm_mediatek_ops = {
 	.apply = pwm_mediatek_apply,
-	.owner = THIS_MODULE,
 };
 
 static int pwm_mediatek_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 25519cddc2a9..5bea53243ed2 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -335,7 +335,6 @@ static const struct pwm_ops meson_pwm_ops = {
 	.free = meson_pwm_free,
 	.apply = meson_pwm_apply,
 	.get_state = meson_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static const char * const pwm_meson8b_parent_names[] = {
diff --git a/drivers/pwm/pwm-microchip-core.c b/drivers/pwm/pwm-microchip-core.c
index e7525c98105e..c0c53968f3e9 100644
--- a/drivers/pwm/pwm-microchip-core.c
+++ b/drivers/pwm/pwm-microchip-core.c
@@ -435,7 +435,6 @@ static int mchp_core_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm
 static const struct pwm_ops mchp_core_pwm_ops = {
 	.apply = mchp_core_pwm_apply,
 	.get_state = mchp_core_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id mchp_core_of_match[] = {
diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index a83bd6e18b07..7748e3eaa818 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -227,7 +227,6 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 static const struct pwm_ops mtk_disp_pwm_ops = {
 	.apply = mtk_disp_pwm_apply,
 	.get_state = mtk_disp_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int mtk_disp_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-mxs.c b/drivers/pwm/pwm-mxs.c
index 766dbc58dad8..1b5e787d78f1 100644
--- a/drivers/pwm/pwm-mxs.c
+++ b/drivers/pwm/pwm-mxs.c
@@ -115,7 +115,6 @@ static int mxs_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops mxs_pwm_ops = {
 	.apply = mxs_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int mxs_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-ntxec.c b/drivers/pwm/pwm-ntxec.c
index 7514ea384ec5..78606039eda2 100644
--- a/drivers/pwm/pwm-ntxec.c
+++ b/drivers/pwm/pwm-ntxec.c
@@ -126,7 +126,6 @@ static int ntxec_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm_dev,
 }
 
 static const struct pwm_ops ntxec_pwm_ops = {
-	.owner = THIS_MODULE,
 	.apply = ntxec_pwm_apply,
 	/*
 	 * No .get_state callback, because the current state cannot be read
diff --git a/drivers/pwm/pwm-omap-dmtimer.c b/drivers/pwm/pwm-omap-dmtimer.c
index 4889fbd8a431..40a46138ebbb 100644
--- a/drivers/pwm/pwm-omap-dmtimer.c
+++ b/drivers/pwm/pwm-omap-dmtimer.c
@@ -311,7 +311,6 @@ static int pwm_omap_dmtimer_apply(struct pwm_chip *chip,
 
 static const struct pwm_ops pwm_omap_dmtimer_ops = {
 	.apply = pwm_omap_dmtimer_apply,
-	.owner = THIS_MODULE,
 };
 
 static int pwm_omap_dmtimer_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index 3038a68412a7..e79b1de8c4d8 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -505,7 +505,6 @@ static const struct pwm_ops pca9685_pwm_ops = {
 	.get_state = pca9685_pwm_get_state,
 	.request = pca9685_pwm_request,
 	.free = pca9685_pwm_free,
-	.owner = THIS_MODULE,
 };
 
 static const struct regmap_config pca9685_regmap_i2c_config = {
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 1e475ed10180..faf6b35b9336 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -135,7 +135,6 @@ static int pxa_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops pxa_pwm_ops = {
 	.apply = pxa_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/pwm/pwm-raspberrypi-poe.c b/drivers/pwm/pwm-raspberrypi-poe.c
index 2939b71a7ba7..1ad814fdec6b 100644
--- a/drivers/pwm/pwm-raspberrypi-poe.c
+++ b/drivers/pwm/pwm-raspberrypi-poe.c
@@ -135,7 +135,6 @@ static int raspberrypi_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops raspberrypi_pwm_ops = {
 	.get_state = raspberrypi_pwm_get_state,
 	.apply = raspberrypi_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int raspberrypi_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
index 5b5f357c44de..13269f55fccf 100644
--- a/drivers/pwm/pwm-rcar.c
+++ b/drivers/pwm/pwm-rcar.c
@@ -198,7 +198,6 @@ static const struct pwm_ops rcar_pwm_ops = {
 	.request = rcar_pwm_request,
 	.free = rcar_pwm_free,
 	.apply = rcar_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int rcar_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-renesas-tpu.c b/drivers/pwm/pwm-renesas-tpu.c
index d7311614c846..1b004e01829a 100644
--- a/drivers/pwm/pwm-renesas-tpu.c
+++ b/drivers/pwm/pwm-renesas-tpu.c
@@ -431,7 +431,6 @@ static const struct pwm_ops tpu_pwm_ops = {
 	.request = tpu_pwm_request,
 	.free = tpu_pwm_free,
 	.apply = tpu_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index 03ee18fb82d5..cce4381e188a 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -228,7 +228,6 @@ static int rockchip_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops rockchip_pwm_ops = {
 	.get_state = rockchip_pwm_get_state,
 	.apply = rockchip_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct rockchip_pwm_data pwm_data_v1 = {
diff --git a/drivers/pwm/pwm-rz-mtu3.c b/drivers/pwm/pwm-rz-mtu3.c
index a56cecb0e46e..bdda315b3bd3 100644
--- a/drivers/pwm/pwm-rz-mtu3.c
+++ b/drivers/pwm/pwm-rz-mtu3.c
@@ -438,7 +438,6 @@ static const struct pwm_ops rz_mtu3_pwm_ops = {
 	.free = rz_mtu3_pwm_free,
 	.get_state = rz_mtu3_pwm_get_state,
 	.apply = rz_mtu3_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int rz_mtu3_pwm_pm_runtime_suspend(struct device *dev)
diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index e8828f57ab15..08a903257383 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -475,7 +475,6 @@ static const struct pwm_ops pwm_samsung_ops = {
 	.request	= pwm_samsung_request,
 	.free		= pwm_samsung_free,
 	.apply		= pwm_samsung_apply,
-	.owner		= THIS_MODULE,
 };
 
 #ifdef CONFIG_OF
diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index eabddb7c7820..089e50bdbbf0 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -203,7 +203,6 @@ static const struct pwm_ops pwm_sifive_ops = {
 	.free = pwm_sifive_free,
 	.get_state = pwm_sifive_get_state,
 	.apply = pwm_sifive_apply,
-	.owner = THIS_MODULE,
 };
 
 static int pwm_sifive_clock_notifier(struct notifier_block *nb,
diff --git a/drivers/pwm/pwm-sl28cpld.c b/drivers/pwm/pwm-sl28cpld.c
index 9e42e3a74ad6..88b01ff9e460 100644
--- a/drivers/pwm/pwm-sl28cpld.c
+++ b/drivers/pwm/pwm-sl28cpld.c
@@ -200,7 +200,6 @@ static int sl28cpld_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops sl28cpld_pwm_ops = {
 	.apply = sl28cpld_pwm_apply,
 	.get_state = sl28cpld_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int sl28cpld_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-spear.c b/drivers/pwm/pwm-spear.c
index 4e1cfd8d7c03..2cbc34cf6799 100644
--- a/drivers/pwm/pwm-spear.c
+++ b/drivers/pwm/pwm-spear.c
@@ -189,7 +189,6 @@ static int spear_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops spear_pwm_ops = {
 	.apply = spear_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int spear_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
index 1499c8c1fe37..dfda2152a7c1 100644
--- a/drivers/pwm/pwm-sprd.c
+++ b/drivers/pwm/pwm-sprd.c
@@ -210,7 +210,6 @@ static int sprd_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops sprd_pwm_ops = {
 	.apply = sprd_pwm_apply,
 	.get_state = sprd_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int sprd_pwm_clk_init(struct sprd_pwm_chip *spc)
diff --git a/drivers/pwm/pwm-sti.c b/drivers/pwm/pwm-sti.c
index b1d1373648a3..5756f2e3b3c0 100644
--- a/drivers/pwm/pwm-sti.c
+++ b/drivers/pwm/pwm-sti.c
@@ -420,7 +420,6 @@ static const struct pwm_ops sti_pwm_ops = {
 	.capture = sti_pwm_capture,
 	.apply = sti_pwm_apply,
 	.free = sti_pwm_free,
-	.owner = THIS_MODULE,
 };
 
 static irqreturn_t sti_pwm_interrupt(int irq, void *data)
diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index bb3a045a7334..b67974cc1872 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -189,7 +189,6 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
 }
 
 static const struct pwm_ops stm32_pwm_lp_ops = {
-	.owner = THIS_MODULE,
 	.apply = stm32_pwm_lp_apply,
 	.get_state = stm32_pwm_lp_get_state,
 };
diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 3d6be7749e23..3303a754ea02 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -487,7 +487,6 @@ static int stm32_pwm_apply_locked(struct pwm_chip *chip, struct pwm_device *pwm,
 }
 
 static const struct pwm_ops stm32pwm_ops = {
-	.owner = THIS_MODULE,
 	.apply = stm32_pwm_apply_locked,
 	.capture = IS_ENABLED(CONFIG_DMA_ENGINE) ? stm32_pwm_capture : NULL,
 };
diff --git a/drivers/pwm/pwm-stmpe.c b/drivers/pwm/pwm-stmpe.c
index e205405c4828..a46f5b4dd816 100644
--- a/drivers/pwm/pwm-stmpe.c
+++ b/drivers/pwm/pwm-stmpe.c
@@ -287,7 +287,6 @@ static int stmpe_24xx_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops stmpe_24xx_pwm_ops = {
 	.apply = stmpe_24xx_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int __init stmpe_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index c84fcf1a13dc..1a439025540d 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -325,7 +325,6 @@ static int sun4i_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops sun4i_pwm_ops = {
 	.apply = sun4i_pwm_apply,
 	.get_state = sun4i_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static const struct sun4i_pwm_data sun4i_pwm_dual_nobypass = {
diff --git a/drivers/pwm/pwm-sunplus.c b/drivers/pwm/pwm-sunplus.c
index 7705c7b86c3a..773e2f80526e 100644
--- a/drivers/pwm/pwm-sunplus.c
+++ b/drivers/pwm/pwm-sunplus.c
@@ -163,7 +163,6 @@ static int sunplus_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops sunplus_pwm_ops = {
 	.apply = sunplus_pwm_apply,
 	.get_state = sunplus_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static void sunplus_pwm_clk_release(void *data)
diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index a169a34e0778..39ea51e08c94 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -268,7 +268,6 @@ static int tegra_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops tegra_pwm_ops = {
 	.apply = tegra_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int tegra_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index 8c94b266c1b2..11e3549cf103 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -205,7 +205,6 @@ static int ecap_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops ecap_pwm_ops = {
 	.apply = ecap_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id ecap_of_match[] = {
diff --git a/drivers/pwm/pwm-tiehrpwm.c b/drivers/pwm/pwm-tiehrpwm.c
index ecbfd7e954ec..66ac2655845f 100644
--- a/drivers/pwm/pwm-tiehrpwm.c
+++ b/drivers/pwm/pwm-tiehrpwm.c
@@ -437,7 +437,6 @@ static int ehrpwm_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops ehrpwm_pwm_ops = {
 	.free = ehrpwm_pwm_free,
 	.apply = ehrpwm_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id ehrpwm_of_match[] = {
diff --git a/drivers/pwm/pwm-twl-led.c b/drivers/pwm/pwm-twl-led.c
index 8fb84b441853..625233f4703a 100644
--- a/drivers/pwm/pwm-twl-led.c
+++ b/drivers/pwm/pwm-twl-led.c
@@ -189,7 +189,6 @@ static int twl4030_pwmled_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops twl4030_pwmled_ops = {
 	.apply = twl4030_pwmled_apply,
-	.owner = THIS_MODULE,
 };
 
 static int twl6030_pwmled_config(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -342,7 +341,6 @@ static const struct pwm_ops twl6030_pwmled_ops = {
 	.apply = twl6030_pwmled_apply,
 	.request = twl6030_pwmled_request,
 	.free = twl6030_pwmled_free,
-	.owner = THIS_MODULE,
 };
 
 static int twl_pwmled_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-twl.c b/drivers/pwm/pwm-twl.c
index 86567add79db..603d31f27470 100644
--- a/drivers/pwm/pwm-twl.c
+++ b/drivers/pwm/pwm-twl.c
@@ -333,12 +333,10 @@ static const struct pwm_ops twl4030_pwm_ops = {
 	.apply = twl4030_pwm_apply,
 	.request = twl4030_pwm_request,
 	.free = twl4030_pwm_free,
-	.owner = THIS_MODULE,
 };
 
 static const struct pwm_ops twl6030_pwm_ops = {
 	.apply = twl6030_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int twl_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-visconti.c b/drivers/pwm/pwm-visconti.c
index 7f7591a2384c..8d736d558122 100644
--- a/drivers/pwm/pwm-visconti.c
+++ b/drivers/pwm/pwm-visconti.c
@@ -129,7 +129,6 @@ static int visconti_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 static const struct pwm_ops visconti_pwm_ops = {
 	.apply = visconti_pwm_apply,
 	.get_state = visconti_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static int visconti_pwm_probe(struct platform_device *pdev)
diff --git a/drivers/pwm/pwm-vt8500.c b/drivers/pwm/pwm-vt8500.c
index 6d46db51daac..a96c7f5d9099 100644
--- a/drivers/pwm/pwm-vt8500.c
+++ b/drivers/pwm/pwm-vt8500.c
@@ -221,7 +221,6 @@ static int vt8500_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 
 static const struct pwm_ops vt8500_pwm_ops = {
 	.apply = vt8500_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static const struct of_device_id vt8500_pwm_dt_ids[] = {
diff --git a/drivers/pwm/pwm-xilinx.c b/drivers/pwm/pwm-xilinx.c
index 85153ee90809..5f3c2a6fed11 100644
--- a/drivers/pwm/pwm-xilinx.c
+++ b/drivers/pwm/pwm-xilinx.c
@@ -198,7 +198,6 @@ static int xilinx_pwm_get_state(struct pwm_chip *chip,
 static const struct pwm_ops xilinx_pwm_ops = {
 	.apply = xilinx_pwm_apply,
 	.get_state = xilinx_pwm_get_state,
-	.owner = THIS_MODULE,
 };
 
 static const struct regmap_config xilinx_pwm_regmap_config = {
diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index c483e1f0738e..4fdff84ec2e7 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -259,7 +259,6 @@ static const struct pwm_ops gb_pwm_ops = {
 	.request = gb_pwm_request,
 	.free = gb_pwm_free,
 	.apply = gb_pwm_apply,
-	.owner = THIS_MODULE,
 };
 
 static int gb_pwm_probe(struct gbphy_device *gbphy_dev,
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index d2f9f690a9c1..d9fa0114edfa 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -278,7 +278,6 @@ struct pwm_ops {
 		     const struct pwm_state *state);
 	int (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
 			 struct pwm_state *state);
-	struct module *owner;
 };
 
 /**
@@ -295,6 +294,7 @@ struct pwm_ops {
 struct pwm_chip {
 	struct device *dev;
 	const struct pwm_ops *ops;
+	struct module *owner;
 	int base;
 	unsigned int npwm;
 
@@ -386,10 +386,12 @@ int pwm_capture(struct pwm_device *pwm, struct pwm_capture *result,
 int pwm_set_chip_data(struct pwm_device *pwm, void *data);
 void *pwm_get_chip_data(struct pwm_device *pwm);
 
-int pwmchip_add(struct pwm_chip *chip);
+int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
+#define pwmchip_add(chip) __pwmchip_add(chip, THIS_MODULE)
 void pwmchip_remove(struct pwm_chip *chip);
 
-int devm_pwmchip_add(struct device *dev, struct pwm_chip *chip);
+int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
+#define devm_pwmchip_add(dev, chip) __devm_pwmchip_add(dev, chip, THIS_MODULE)
 
 struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
 					 unsigned int index,
-- 
2.39.2

