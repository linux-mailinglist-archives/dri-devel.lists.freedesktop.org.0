Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0167F65D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650BA10E16F;
	Thu, 23 Nov 2023 17:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F3210E127
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:55:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Duf-0004l7-I1; Thu, 23 Nov 2023 18:54:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Dud-00B5eQ-NQ; Thu, 23 Nov 2023 18:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6Dud-006rB6-Dn; Thu, 23 Nov 2023 18:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to
 ti-sn65dsi86 core
Date: Thu, 23 Nov 2023 18:54:29 +0100
Message-ID: <20231123175425.496956-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12655;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=JcgHPV4gUpmF+UHzxTlwYgBwyb/JCLVx1bOUzFNGWFI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlX5HVho7RZa/WLfXxNILhsU4oG0wuBYrdRRQKC
 cctWnRMA9aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZV+R1QAKCRCPgPtYfRL+
 Th8tB/oD0O4pF3zek49bD/vIDOfWffZ94nXCKMQi+2s+G6OrIRHRB2/mIvw6vbAz+4PTWH4NHp/
 AAJnK8R4QECmJ+3hFhO2I4sVdJIHxa8cpJuYVBJLFgV592a48I20A4LXMbDbE17GpRPGKWIvlA+
 H49aqdSu/ewwSl55X6JJu6Xmnx5hu7t/USEUeSDNeHIyvwjdX2p9RTPSPG5XrONOgY3pW89pnzI
 gfiEnhHkMWrxpgOQCBj/DfMGJCjqcyFa13G6k+cxZU8k6f2DeHfH87jWxNmO0mAi1k3ZaGmP0JT
 K7SK52cO/4xL72AEEylZRmyvLXHmu7E2xODGWU6n7UMlCpyg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a dedicated private data structure for the pwm aux driver
provided by the sn65dsi86 driver. This way data needed for PWM operation
is (to a certain degree) nicely separated and doesn't occupy memory in
the ti_sn65dsi86 core's private data if the PWM isn't used.

The eventual goal is to decouple the PWM driver completely from the
ti-sn65dsi86 core and maybe even move it to a dedicated driver below
drivers/pwm. There are a few obstacles to that quest though:

 - The busy pin check (implemented in ti_sn_pwm_pin_request() and
   ti_sn_pwm_pin_release()) would need to be available unconditionally.

 - The refclk should probably abstracted by a struct clk such that the
   pwm_refclk_freq member that currently still lives in ti-sn65dsi86
   core driver data can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 130 +++++++++++++++-----------
 1 file changed, 76 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index d6e3b1280e38..2f030998cb09 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -163,9 +163,6 @@
  *                bitmap so we can do atomic ops on it without an extra
  *                lock so concurrent users of our 4 GPIOs don't stomp on
  *                each other's read-modify-write.
- *
- * @pchip:        pwm_chip if the PWM is exposed.
- * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
  * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
  * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
  */
@@ -197,13 +194,25 @@ struct ti_sn65dsi86 {
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
 #if defined(CONFIG_PWM)
-	struct pwm_chip			pchip;
-	bool				pwm_enabled;
 	atomic_t			pwm_pin_busy;
 #endif
 	unsigned int			pwm_refclk_freq;
 };
 
+/*
+ * struct ti_sn65dsi86_pwm_ddata - Platform data for ti-sn65dsi86 pwm driver.
+ * @chip:         pwm_chip if the PWM is exposed.
+ * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
+ * @regmap:       Regmap for accessing i2c.
+ * @pdata:	  platform data of the parent device
+ */
+struct ti_sn65dsi86_pwm_ddata {
+	struct pwm_chip			chip;
+	bool				pwm_enabled;
+	struct regmap			*regmap;
+	unsigned int			*pwm_refclk_freq;
+};
+
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
 	{ .range_min = 0, .range_max = 0xFF },
 };
@@ -1360,33 +1369,37 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
  * PWM Controller
  */
 #if defined(CONFIG_PWM)
-static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
+static int ti_sn_pwm_pin_request(struct device *dev)
 {
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
+
 	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
 }
 
-static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
+static void ti_sn_pwm_pin_release(struct device *dev)
 {
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
+
 	atomic_set(&pdata->pwm_pin_busy, 0);
 }
 
-static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
+static struct ti_sn65dsi86_pwm_ddata *pwm_chip_to_ddata(struct pwm_chip *chip)
 {
-	return container_of(chip, struct ti_sn65dsi86, pchip);
+	return container_of(chip, struct ti_sn65dsi86_pwm_ddata, chip);
 }
 
 static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
 {
-	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	struct ti_sn65dsi86_pwm_ddata *ddata = pwm_chip_to_ddata(chip);
 
-	return ti_sn_pwm_pin_request(pdata);
+	return ti_sn_pwm_pin_request(ddata->chip.dev);
 }
 
 static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 {
-	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	struct ti_sn65dsi86_pwm_ddata *ddata = pwm_chip_to_ddata(chip);
 
-	ti_sn_pwm_pin_release(pdata);
+	ti_sn_pwm_pin_release(ddata->chip.dev);
 }
 
 /*
@@ -1403,7 +1416,7 @@ static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   const struct pwm_state *state)
 {
-	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	struct ti_sn65dsi86_pwm_ddata *ddata = pwm_chip_to_ddata(chip);
 	unsigned int pwm_en_inv;
 	unsigned int backlight;
 	unsigned int pre_div;
@@ -1412,24 +1425,24 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	u64 period;
 	int ret;
 
-	if (!pdata->pwm_enabled) {
-		ret = pm_runtime_resume_and_get(pdata->dev);
+	if (!ddata->pwm_enabled) {
+		ret = pm_runtime_resume_and_get(ddata->chip.dev);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (state->enabled) {
-		if (!pdata->pwm_enabled) {
+		if (!ddata->pwm_enabled) {
 			/*
 			 * The chip might have been powered down while we
 			 * didn't hold a PM runtime reference, so mux in the
 			 * PWM function on the GPIO pin again.
 			 */
-			ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+			ret = regmap_update_bits(ddata->regmap, SN_GPIO_CTRL_REG,
 						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
 						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
 			if (ret) {
-				dev_err(pdata->dev, "failed to mux in PWM function\n");
+				dev_err(ddata->chip.dev, "failed to mux in PWM function\n");
 				goto out;
 			}
 		}
@@ -1470,7 +1483,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		 */
 
 		/* Minimum T_pwm is 1 / REFCLK_FREQ */
-		if (state->period <= NSEC_PER_SEC / pdata->pwm_refclk_freq) {
+		if (state->period <= NSEC_PER_SEC / *ddata->pwm_refclk_freq) {
 			ret = -EINVAL;
 			goto out;
 		}
@@ -1480,12 +1493,12 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		 * Limit period to this to avoid overflows
 		 */
 		period_max = div_u64((u64)NSEC_PER_SEC * 255 * (65535 + 1),
-				     pdata->pwm_refclk_freq);
+				     *ddata->pwm_refclk_freq);
 		period = min(state->period, period_max);
 
-		pre_div = DIV64_U64_ROUND_UP(period * pdata->pwm_refclk_freq,
+		pre_div = DIV64_U64_ROUND_UP(period * *ddata->pwm_refclk_freq,
 					     (u64)NSEC_PER_SEC * (BACKLIGHT_SCALE_MAX + 1));
-		scale = div64_u64(period * pdata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
+		scale = div64_u64(period * *ddata->pwm_refclk_freq, (u64)NSEC_PER_SEC * pre_div) - 1;
 
 		/*
 		 * The documentation has the duty ratio given as:
@@ -1498,34 +1511,34 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		 * to definition above and adjusting for nanosecond
 		 * representation of duty cycle gives us:
 		 */
-		backlight = div64_u64(state->duty_cycle * pdata->pwm_refclk_freq,
+		backlight = div64_u64(state->duty_cycle * *ddata->pwm_refclk_freq,
 				      (u64)NSEC_PER_SEC * pre_div);
 		if (backlight > scale)
 			backlight = scale;
 
-		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
+		ret = regmap_write(ddata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
 		if (ret) {
-			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			dev_err(ddata->chip.dev, "failed to update PWM_PRE_DIV\n");
 			goto out;
 		}
 
-		ti_sn65dsi86_write_u16(pdata->regmap, SN_BACKLIGHT_SCALE_REG, scale);
-		ti_sn65dsi86_write_u16(pdata->regmap, SN_BACKLIGHT_REG, backlight);
+		ti_sn65dsi86_write_u16(ddata->regmap, SN_BACKLIGHT_SCALE_REG, scale);
+		ti_sn65dsi86_write_u16(ddata->regmap, SN_BACKLIGHT_REG, backlight);
 	}
 
 	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, state->enabled) |
 		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
-	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
+	ret = regmap_write(ddata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
 	if (ret) {
-		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		dev_err(ddata->chip.dev, "failed to update PWM_EN/PWM_INV\n");
 		goto out;
 	}
 
-	pdata->pwm_enabled = state->enabled;
+	ddata->pwm_enabled = state->enabled;
 out:
 
-	if (!pdata->pwm_enabled)
-		pm_runtime_put_sync(pdata->dev);
+	if (!ddata->pwm_enabled)
+		pm_runtime_put_sync(ddata->chip.dev);
 
 	return ret;
 }
@@ -1533,26 +1546,26 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 			       struct pwm_state *state)
 {
-	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	struct ti_sn65dsi86_pwm_ddata *ddata = pwm_chip_to_ddata(chip);
 	unsigned int pwm_en_inv;
 	unsigned int pre_div;
 	u16 backlight;
 	u16 scale;
 	int ret;
 
-	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
+	ret = regmap_read(ddata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
 	if (ret)
 		return ret;
 
-	ret = ti_sn65dsi86_read_u16(pdata->regmap, SN_BACKLIGHT_SCALE_REG, &scale);
+	ret = ti_sn65dsi86_read_u16(ddata->regmap, SN_BACKLIGHT_SCALE_REG, &scale);
 	if (ret)
 		return ret;
 
-	ret = ti_sn65dsi86_read_u16(pdata->regmap, SN_BACKLIGHT_REG, &backlight);
+	ret = ti_sn65dsi86_read_u16(ddata->regmap, SN_BACKLIGHT_REG, &backlight);
 	if (ret)
 		return ret;
 
-	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
+	ret = regmap_read(ddata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
 	if (ret)
 		return ret;
 
@@ -1563,9 +1576,9 @@ static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		state->polarity = PWM_POLARITY_NORMAL;
 
 	state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * (scale + 1),
-					 pdata->pwm_refclk_freq);
+					 *ddata->pwm_refclk_freq);
 	state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pre_div * backlight,
-					     pdata->pwm_refclk_freq);
+					     *ddata->pwm_refclk_freq);
 
 	if (state->duty_cycle > state->period)
 		state->duty_cycle = state->period;
@@ -1583,25 +1596,34 @@ static const struct pwm_ops ti_sn_pwm_ops = {
 static int ti_sn_pwm_probe(struct auxiliary_device *adev,
 			   const struct auxiliary_device_id *id)
 {
+	struct ti_sn65dsi86_pwm_ddata *ddata;
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 
-	pdata->pchip.dev = pdata->dev;
-	pdata->pchip.ops = &ti_sn_pwm_ops;
-	pdata->pchip.npwm = 1;
-	pdata->pchip.of_xlate = of_pwm_single_xlate;
-	pdata->pchip.of_pwm_n_cells = 1;
+	ddata = devm_kzalloc(pdata->dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
 
-	return pwmchip_add(&pdata->pchip);
+	ddata->chip.dev = pdata->dev;
+	ddata->chip.ops = &ti_sn_pwm_ops;
+	ddata->chip.npwm = 1;
+	ddata->chip.of_xlate = of_pwm_single_xlate;
+	ddata->chip.of_pwm_n_cells = 1;
+	ddata->regmap = pdata->regmap;
+	ddata->pwm_refclk_freq = &pdata->pwm_refclk_freq;
+
+	auxiliary_set_drvdata(adev, ddata);
+
+	return pwmchip_add(&ddata->chip);
 }
 
 static void ti_sn_pwm_remove(struct auxiliary_device *adev)
 {
-	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	struct ti_sn65dsi86_pwm_ddata *ddata = auxiliary_get_drvdata(adev);
 
-	pwmchip_remove(&pdata->pchip);
+	pwmchip_remove(&ddata->chip);
 
-	if (pdata->pwm_enabled)
-		pm_runtime_put_sync(pdata->dev);
+	if (ddata->pwm_enabled)
+		pm_runtime_put_sync(ddata->chip.dev);
 }
 
 static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {
@@ -1627,8 +1649,8 @@ static void ti_sn_pwm_unregister(void)
 }
 
 #else
-static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
-static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
+static inline int ti_sn_pwm_pin_request(struct device *dev) { return 0; }
+static inline void ti_sn_pwm_pin_release(struct device *dev) {}
 
 static inline int ti_sn_pwm_register(void) { return 0; }
 static inline void ti_sn_pwm_unregister(void) {}
@@ -1774,7 +1796,7 @@ static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset
 	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
 
 	if (offset == SN_PWM_GPIO_IDX)
-		return ti_sn_pwm_pin_request(pdata);
+		return ti_sn_pwm_pin_request(pdata->dev);
 
 	return 0;
 }
@@ -1787,7 +1809,7 @@ static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	ti_sn_bridge_gpio_direction_input(chip, offset);
 
 	if (offset == SN_PWM_GPIO_IDX)
-		ti_sn_pwm_pin_release(pdata);
+		ti_sn_pwm_pin_release(pdata->dev);
 }
 
 static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
-- 
2.42.0

