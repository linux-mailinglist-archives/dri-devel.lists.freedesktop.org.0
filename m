Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF63B3A8C5A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 01:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A85689B3B;
	Tue, 15 Jun 2021 23:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852D89B3B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:18:31 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so618138otk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJcESTizS5WE6hkWoTIkrnq1MRoMDsamwiS/mvHEFDc=;
 b=yB7zH6zbUyvw04WWdZVt5sGwVaNJKRZNLQEQ62JnhsRLLhTtl2hkB06DGsvxuJsCVh
 Bwxa1SNr+Zyys/lx/wBGmVc5F3R5Tdeeh3PTsFAwDOefguK5v8FKk+BDQWMqNPIYwZJd
 pOa61Z1rvBziCFLkG0cBbFUd+aDX8oobVleQk0BR4OmXlW2FvT8mgXLifnyTqchVeXHl
 VCxfeEJxJbfSx0pkcflhUkPeZCfFHLBmy83j0lnT7mi1zdpM3DF4+Ue1S1VVSchr9jVh
 SCKQuMO/LzrYxBQA6NB/7QbSLVNnphAicIOHwv6blURPveqPnYwEqur1MkNqRav5XgDJ
 IRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJcESTizS5WE6hkWoTIkrnq1MRoMDsamwiS/mvHEFDc=;
 b=sZJqgRASGsSYezgGpU8VdWeZZbYsuyvkKqeHo00jb8I9A0AQCLbD+GdvK+3YI/IKKL
 npFCs1VNJ7tyygqlUIh7iEkla1fgqSmL2D7tNg2UGxfyz6NdqKH8zT5QzeRYK1u2baU6
 SYE76RceDu467W3updUA/i4UwIbG6An2ol4aezzNHUCjfYofzI6+kmgSpttrIIh1xg5A
 YPVlYlZimAN/QrFQBRq51MAPNsxPaW4kAX/y/aieMQuyai/820hv4hVDhTRhG09OPpXB
 Vz+jQ/5CFR3NreWX3U7q5keDmU3msPQ45OFKdGtHbz0sD6E3prnQsyGHU6dFw5jiKvgZ
 rPhA==
X-Gm-Message-State: AOAM533DoQhiPE+uC9tMh9GAN+jLLHVVRohisTFwU2PjM2i1tDcLl17X
 9kMkBrOF9nBBL8xcSYqK8vQsjw==
X-Google-Smtp-Source: ABdhPJyXxnCVVvQGjSYbxTppNUgd3uAVnCNwlhuWQyy31ZwV4O4UAPjG4IQjk3BjryB5kRrTp/8abg==
X-Received: by 2002:a9d:4c91:: with SMTP id m17mr1251433otf.347.1623799110526; 
 Tue, 15 Jun 2021 16:18:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id m18sm96101otr.61.2021.06.15.16.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 16:18:30 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>
Subject: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Date: Tue, 15 Jun 2021 18:18:28 -0500
Message-Id: <20210615231828.835164-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210615231828.835164-1-bjorn.andersson@linaro.org>
References: <20210615231828.835164-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
with the primary purpose of controlling the backlight of the attached
panel. Add an implementation that exposes this using the standard PWM
framework, to allow e.g. pwm-backlight to expose this to the user.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Rebased ontop of Doug's auxiliary_bus patches
- Reworked the math, per Uwe's request
- Added pwm_chip->get_state and made sure it's happy (only tested with a few
  limited periods, such as 1kHz)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 298 +++++++++++++++++++++++++-
 1 file changed, 297 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5d712c8c3c3b..8f11c9b2da48 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -4,6 +4,7 @@
  * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
  */
 
+#include <linux/atomic.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bits.h>
 #include <linux/clk.h>
@@ -15,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -91,6 +93,13 @@
 #define SN_ML_TX_MODE_REG			0x96
 #define  ML_TX_MAIN_LINK_OFF			0
 #define  ML_TX_NORMAL_MODE			BIT(0)
+#define SN_PWM_PRE_DIV_REG			0xA0
+#define SN_BACKLIGHT_SCALE_REG			0xA1
+#define  BACKLIGHT_SCALE_MAX			0xFFFF
+#define SN_BACKLIGHT_REG			0xA3
+#define SN_PWM_EN_INV_REG			0xA5
+#define  SN_PWM_INV_MASK			BIT(0)
+#define  SN_PWM_EN_MASK				BIT(1)
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
@@ -113,11 +122,14 @@
 
 #define SN_LINK_TRAINING_TRIES		10
 
+#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
+
 /**
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
  * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
  * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
+ * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
  *
  * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
@@ -145,11 +157,17 @@
  *                bitmap so we can do atomic ops on it without an extra
  *                lock so concurrent users of our 4 GPIOs don't stomp on
  *                each other's read-modify-write.
+ *
+ * @pchip:        pwm_chip if the PWM is exposed.
+ * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
+ * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
+ * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
 	struct auxiliary_device		gpio_aux;
 	struct auxiliary_device		aux_aux;
+	struct auxiliary_device		pwm_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -172,6 +190,12 @@ struct ti_sn65dsi86 {
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
+#if defined(CONFIG_PWM)
+	struct pwm_chip			pchip;
+	bool				pwm_enabled;
+	unsigned int			pwm_refclk_freq;
+	atomic_t			pwm_pin_busy;
+#endif
 };
 
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
@@ -190,6 +214,25 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
+				 unsigned int reg, u16 *val)
+{
+	unsigned int tmp;
+	int ret;
+
+	ret = regmap_read(pdata->regmap, reg, &tmp);
+	if (ret)
+		return ret;
+	*val = tmp;
+
+	ret = regmap_read(pdata->regmap, reg + 1, &tmp);
+	if (ret)
+		return ret;
+	*val |= tmp << 8;
+
+	return 0;
+}
+
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 				   unsigned int reg, u16 val)
 {
@@ -253,6 +296,14 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 
 	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
 			   REFCLK_FREQ(i));
+
+#if defined(CONFIG_PWM)
+	/*
+	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
+	 * regardless of its actual sourcing.
+	 */
+	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
+#endif
 }
 
 static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
@@ -1044,6 +1095,221 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+#if defined(CONFIG_PWM)
+static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
+{
+	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
+}
+
+static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
+{
+	atomic_set(&pdata->pwm_pin_busy, 0);
+}
+
+static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
+{
+	return container_of(chip, struct ti_sn65dsi86, pchip);
+}
+
+static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	return ti_sn_pwm_pin_request(pdata);
+}
+
+static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+
+	ti_sn_pwm_pin_release(pdata);
+}
+
+static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			   const struct pwm_state *state)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int backlight;
+	unsigned int pre_div;
+	unsigned int scale;
+	int ret;
+
+	if (!pdata->pwm_enabled) {
+		ret = pm_runtime_get_sync(pdata->dev);
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
+				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
+		if (ret) {
+			dev_err(pdata->dev, "failed to mux in PWM function\n");
+			goto out;
+		}
+	}
+
+	if (state->enabled) {
+		/*
+		 * Per the datasheet the PWM frequency is given by:
+		 *
+		 *   PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
+		 *
+		 * which can be rewritten:
+		 *
+		 *   T_pwm * REFCLK_FREQ - 1 = PWM_PRE_DIV * BACKLIGHT_SCALE
+		 *
+		 * In order to keep BACKLIGHT_SCALE within its 16 bits, PWM_PRE_DIV
+		 * must be:
+		 *
+		 *   PWM_PRE_DIV >= (T_pwm * REFCLK_FREQ - 1) / BACKLIGHT_SCALE_MAX;
+		 *
+		 * To simplify the search and optimize the resolution of the PWM, the
+		 * lowest possible PWM_PRE_DIV is used. Finally the scale is calculated
+		 * as:
+		 *
+		 *   BACKLIGHT_SCALE = (T_pwm * REFCLK_FREQ - 1) / PWM_PRE_DIV
+		 *
+		 * Here T_pwm is represented in seconds, so appropriate scaling to
+		 * nanoseconds is necessary.
+		 */
+		pre_div = DIV_ROUND_UP((state->period * pdata->pwm_refclk_freq - 1),
+				       (NSEC_PER_SEC * BACKLIGHT_SCALE_MAX));
+		scale = (state->period * pdata->pwm_refclk_freq - 1) / (NSEC_PER_SEC * pre_div);
+
+		/*
+		 * The duty ratio is given as:
+		 *
+		 *   duty = BACKLIGHT / (BACKLIGHT_SCALE + 1)
+		 */
+		backlight = state->duty_cycle * (scale + 1) / state->period;
+
+		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
+		if (ret) {
+			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
+			goto out;
+		}
+
+		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
+		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
+	}
+
+	pwm_en_inv = FIELD_PREP(SN_PWM_EN_MASK, !!state->enabled) |
+		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
+	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
+	if (ret) {
+		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
+		goto out;
+	}
+
+	pdata->pwm_enabled = !!state->enabled;
+out:
+
+	if (!pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+
+	return ret;
+}
+
+static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct ti_sn65dsi86 *pdata = pwm_chip_to_ti_sn_bridge(chip);
+	unsigned int pwm_en_inv;
+	unsigned int pre_div;
+	u16 backlight;
+	u16 scale;
+	int ret;
+
+	ret = regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
+	if (ret)
+		return;
+
+	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
+	if (ret)
+		return;
+
+	ret = ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
+	if (ret)
+		return;
+
+	ret = regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
+	if (ret)
+		return;
+
+	state->enabled = FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
+	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
+		state->polarity = PWM_POLARITY_INVERSED;
+	else
+		state->polarity = PWM_POLARITY_NORMAL;
+
+	state->period = NSEC_PER_SEC * (pre_div * scale + 1) / pdata->pwm_refclk_freq;
+	state->duty_cycle = DIV_ROUND_UP(state->period * backlight, scale + 1);
+}
+
+static const struct pwm_ops ti_sn_pwm_ops = {
+	.request = ti_sn_pwm_request,
+	.free = ti_sn_pwm_free,
+	.apply = ti_sn_pwm_apply,
+	.get_state = ti_sn_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
+static int ti_sn_pwm_probe(struct auxiliary_device *adev,
+		const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	pdata->pchip.dev = pdata->dev;
+	pdata->pchip.ops = &ti_sn_pwm_ops;
+	pdata->pchip.base = -1;
+	pdata->pchip.npwm = 1;
+	pdata->pchip.of_xlate = of_pwm_single_xlate;
+	pdata->pchip.of_pwm_n_cells = 1;
+
+	return pwmchip_add(&pdata->pchip);
+}
+
+static void ti_sn_pwm_remove(struct auxiliary_device *adev)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+
+	pwmchip_remove(&pdata->pchip);
+
+	if (pdata->pwm_enabled)
+		pm_runtime_put_sync(pdata->dev);
+}
+
+static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {
+	{ .name = "ti_sn65dsi86.pwm", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_pwm_driver = {
+	.name = "pwm",
+	.probe = ti_sn_pwm_probe,
+	.remove = ti_sn_pwm_remove,
+	.id_table = ti_sn_pwm_id_table,
+};
+
+static int __init ti_sn_pwm_register(void)
+{
+	return auxiliary_driver_register(&ti_sn_pwm_driver);
+}
+
+static void ti_sn_pwm_unregister(void)
+{
+	auxiliary_driver_unregister(&ti_sn_pwm_driver);
+}
+
+#else
+static inline int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata) { return 0; }
+static inline void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata) {}
+
+static inline int ti_sn_pwm_register(void) { return 0; }
+static inline void ti_sn_pwm_unregister(void) {}
+#endif
+
 #if defined(CONFIG_OF_GPIO)
 
 static int tn_sn_bridge_of_xlate(struct gpio_chip *chip,
@@ -1176,10 +1442,26 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 	return ret;
 }
 
+static int ti_sn_bridge_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
+
+	if (offset == SN_PWM_GPIO_IDX)
+		return ti_sn_pwm_pin_request(pdata);
+
+	return 0;
+}
+
+
 static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
+	struct ti_sn65dsi86 *pdata = gpiochip_get_data(chip);
+
 	/* We won't keep pm_runtime if we're input, so switch there on free */
 	ti_sn_bridge_gpio_direction_input(chip, offset);
+
+	if (offset == SN_PWM_GPIO_IDX)
+		ti_sn_pwm_pin_release(pdata);
 }
 
 static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
@@ -1201,6 +1483,7 @@ static int ti_sn_gpio_probe(struct auxiliary_device *adev,
 	pdata->gchip.owner = THIS_MODULE;
 	pdata->gchip.of_xlate = tn_sn_bridge_of_xlate;
 	pdata->gchip.of_gpio_n_cells = 2;
+	pdata->gchip.request = ti_sn_bridge_gpio_request;
 	pdata->gchip.free = ti_sn_bridge_gpio_free;
 	pdata->gchip.get_direction = ti_sn_bridge_gpio_get_direction;
 	pdata->gchip.direction_input = ti_sn_bridge_gpio_direction_input;
@@ -1500,6 +1783,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 			return ret;
 	}
 
+	if (IS_ENABLED(CONFIG_PWM)) {
+		ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->pwm_aux, "pwm");
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * NOTE: At the end of the AUX channel probe we'll add the aux device
 	 * for the bridge. This is because the bridge can't be used until the
@@ -1543,10 +1832,14 @@ static int __init ti_sn65dsi86_init(void)
 	if (ret)
 		goto err_main_was_registered;
 
-	ret = auxiliary_driver_register(&ti_sn_aux_driver);
+	ret = ti_sn_pwm_register();
 	if (ret)
 		goto err_gpio_was_registered;
 
+	ret = auxiliary_driver_register(&ti_sn_aux_driver);
+	if (ret)
+		goto err_pwm_was_registered;
+
 	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
 	if (ret)
 		goto err_aux_was_registered;
@@ -1555,6 +1848,8 @@ static int __init ti_sn65dsi86_init(void)
 
 err_aux_was_registered:
 	auxiliary_driver_unregister(&ti_sn_aux_driver);
+err_pwm_was_registered:
+	ti_sn_pwm_unregister();
 err_gpio_was_registered:
 	ti_sn_gpio_unregister();
 err_main_was_registered:
@@ -1568,6 +1863,7 @@ static void __exit ti_sn65dsi86_exit(void)
 {
 	auxiliary_driver_unregister(&ti_sn_bridge_driver);
 	auxiliary_driver_unregister(&ti_sn_aux_driver);
+	ti_sn_pwm_unregister();
 	ti_sn_gpio_unregister();
 	i2c_del_driver(&ti_sn65dsi86_driver);
 }
-- 
2.31.0

