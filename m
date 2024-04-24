Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0B8B0E2A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C241136B3;
	Wed, 24 Apr 2024 15:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HfpivaRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37911219C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DAFF61BCE;
 Wed, 24 Apr 2024 15:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F210C32782;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713972570;
 bh=+I0k9irurYo8iMwuEvIjsJgMlSBeO8N+51A0MydUeNo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=HfpivaRbk+VFb1RNHyiQM2i4UbhqgZQ/G+HRAvgeNH6F5zSwLsVkNL7YUm8R66zuU
 B/DtFDLzTQTrHV/aAWhKCluOvdFfX4vk2xisyEPA4Y/dcUBDnNK8N3N2/9qUPpSd/x
 D0Da3Y3NX+LZWuzFFPoOpygp9+RGrDKf7CQvNsRvzJjdS9GQ4RrrvjylEbPRmOJ+11
 vFSSrCfYrhWAVYMmb4ASrWp2F0kqrEi2EPnl4uEWnCqIAj6FrXks/V+whXlgkfdkGA
 OcI8oMN1IxDxfshvBUx+9DoZ3rbCM2GYMFDIQlIJSp2UjuyUNS60pwwGSuOt6hiFr7
 yaG5ZMMzVGzrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 25795C18E72;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Wed, 24 Apr 2024 23:29:07 +0800
Subject: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
In-Reply-To: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, Junhao Xie <bigfoot@classfun.cn>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713972563; l=10699;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=CRcoW1mNXLjSj7yu6IPFB73/snxRikqcgHYHMDdEkwo=;
 b=0N44s6Ip71stYnYGddQwOa5dxgVjSVSMTHPbo+EoTLvkpZuJ5W2a1wSB++1m/yk2CaszoRELD
 hLgbF8OcWabBPx72e2/K7O7YkUBDttDHnX0pvE8bX7JdKoZKdGN/wSt
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
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
Reply-To: wuxilin123@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Junhao Xie <bigfoot@classfun.cn>

Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.

Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
---
 drivers/pwm/Kconfig      |  10 ++
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-sn3112.c | 336 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 1dd7921194f5..e21c37c7991e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -553,6 +553,16 @@ config PWM_SL28CPLD
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-sl28cpld.
 
+config PWM_SN3112
+	tristate "SI-EN SN3112 PWM driver"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Generic PWM framework driver for SI-EN SN3112 LED controller.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-sn3112.
+
 config PWM_SPEAR
 	tristate "STMicroelectronics SPEAr PWM support"
 	depends on PLAT_SPEAR || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 90913519f11a..6aab2d113159 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_PWM_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
+obj-$(CONFIG_PWM_SN3112)	+= pwm-sn3112.o
 obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
 obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
 obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
diff --git a/drivers/pwm/pwm-sn3112.c b/drivers/pwm/pwm-sn3112.c
new file mode 100644
index 000000000000..38ef948602a3
--- /dev/null
+++ b/drivers/pwm/pwm-sn3112.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for SN3112 12-channel 8-bit PWM LED controller
+ *
+ * Copyright (c) 2024 Junhao Xie <bigfoot@classfun.cn>
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/regmap.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#define SN3112_CHANNELS 12
+#define SN3112_REG_ENABLE 0x00
+#define SN3112_REG_PWM_VAL 0x04
+#define SN3112_REG_PWM_EN 0x13
+#define SN3112_REG_APPLY 0x16
+#define SN3112_REG_RESET 0x17
+
+struct sn3112 {
+	struct device *pdev;
+	struct regmap *regmap;
+	struct mutex lock;
+	struct regulator *vdd;
+	uint8_t pwm_val[SN3112_CHANNELS];
+	uint8_t pwm_en_reg[3];
+	bool pwm_en[SN3112_CHANNELS];
+#if IS_ENABLED(CONFIG_GPIOLIB)
+	struct gpio_desc *sdb;
+#endif
+};
+
+static int sn3112_write_reg(struct sn3112 *priv, unsigned int reg,
+			    unsigned int val)
+{
+	int err;
+
+	dev_dbg(priv->pdev, "request regmap_write 0x%x 0x%x\n", reg, val);
+	err = regmap_write(priv->regmap, reg, val);
+	if (err)
+		dev_warn_ratelimited(
+			priv->pdev,
+			"regmap_write to register 0x%x failed: %pe\n", reg,
+			ERR_PTR(err));
+
+	return err;
+}
+
+static int sn3112_set_en_reg(struct sn3112 *priv, unsigned int channel,
+			     bool enabled, bool write)
+{
+	unsigned int reg, bit;
+
+	if (channel >= SN3112_CHANNELS)
+		return -EINVAL;
+
+	/* LED_EN1: BIT5:BIT3 = OUT3:OUT1 */
+	if (channel >= 0 && channel <= 2)
+		reg = 0, bit = channel + 3;
+	/* LED_EN2: BIT5:BIT0 = OUT9:OUT4 */
+	else if (channel >= 3 && channel <= 8)
+		reg = 1, bit = channel - 3;
+	/* LED_EN3: BIT2:BIT0 = OUT12:OUT10 */
+	else if (channel >= 9 && channel <= 11)
+		reg = 2, bit = channel - 9;
+	else
+		return -EINVAL;
+
+	dev_dbg(priv->pdev, "channel %u enabled %u\n", channel, enabled);
+	dev_dbg(priv->pdev, "reg %u bit %u\n", reg, bit);
+	if (enabled)
+		set_bit(bit, (ulong *)&priv->pwm_en_reg[reg]);
+	else
+		clear_bit(bit, (ulong *)&priv->pwm_en_reg[reg]);
+	dev_dbg(priv->pdev, "set enable reg %u to %u\n", reg,
+		priv->pwm_en_reg[reg]);
+
+	if (!write)
+		return 0;
+	return sn3112_write_reg(priv, SN3112_REG_PWM_EN + reg,
+				priv->pwm_en_reg[reg]);
+}
+
+static int sn3112_set_val_reg(struct sn3112 *priv, unsigned int channel,
+			      uint8_t val, bool write)
+{
+	if (channel >= SN3112_CHANNELS)
+		return -EINVAL;
+	priv->pwm_val[channel] = val;
+	dev_dbg(priv->pdev, "set value reg %u to %u\n", channel,
+		priv->pwm_val[channel]);
+
+	if (!write)
+		return 0;
+	return sn3112_write_reg(priv, SN3112_REG_PWM_VAL + channel,
+				priv->pwm_val[channel]);
+}
+
+static int sn3112_write_all(struct sn3112 *priv)
+{
+	int i, ret;
+
+	/* regenerate enable register values */
+	for (i = 0; i < SN3112_CHANNELS; i++) {
+		ret = sn3112_set_en_reg(priv, i, priv->pwm_en[i], false);
+		if (ret != 0)
+			return ret;
+	}
+
+	/* use random value to clear all registers */
+	ret = sn3112_write_reg(priv, SN3112_REG_RESET, 0x66);
+	if (ret != 0)
+		return ret;
+
+	/* set software enable register */
+	ret = sn3112_write_reg(priv, SN3112_REG_ENABLE, 1);
+	if (ret != 0)
+		return ret;
+
+	/* rewrite pwm value register */
+	for (i = 0; i < SN3112_CHANNELS; i++) {
+		ret = sn3112_write_reg(priv, SN3112_REG_PWM_VAL + i,
+				       priv->pwm_val[i]);
+		if (ret != 0)
+			return ret;
+	}
+
+	/* rewrite pwm enable register */
+	for (i = 0; i < 3; i++) {
+		ret = sn3112_write_reg(priv, SN3112_REG_PWM_EN + i,
+				       priv->pwm_en_reg[i]);
+		if (ret != 0)
+			return ret;
+	}
+
+	/* use random value to apply changes */
+	ret = sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
+	if (ret != 0)
+		return ret;
+
+	dev_dbg(priv->pdev, "reinitialized\n");
+	return 0;
+}
+
+static int sn3112_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct sn3112 *priv = pwmchip_get_drvdata(chip);
+
+	if (pwm->hwpwm >= SN3112_CHANNELS)
+		return -EINVAL;
+
+	dev_dbg(priv->pdev, "sn3112 request channel %u\n", pwm->hwpwm);
+	pwm->args.period = 1000000;
+	return 0;
+}
+
+static int sn3112_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	u64 val = 0;
+	struct sn3112 *priv = pwmchip_get_drvdata(chip);
+
+	if (pwm->hwpwm >= SN3112_CHANNELS)
+		return -EINVAL;
+
+	if (state->polarity != PWM_POLARITY_NORMAL)
+		return -EINVAL;
+
+	if (state->period <= 0)
+		return -EINVAL;
+
+	val = mul_u64_u64_div_u64(state->duty_cycle, 0xff, state->period);
+	dev_dbg(priv->pdev, "duty_cycle %llu period %llu\n", state->duty_cycle,
+		state->period);
+	dev_dbg(priv->pdev, "set channel %u value to %llu\n", pwm->hwpwm, val);
+	dev_dbg(priv->pdev, "set channel %u enabled to %u\n", pwm->hwpwm,
+		state->enabled);
+
+	mutex_lock(&priv->lock);
+	sn3112_set_en_reg(priv, pwm->hwpwm, state->enabled, true);
+	sn3112_set_val_reg(priv, pwm->hwpwm, val, true);
+	sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
+	mutex_unlock(&priv->lock);
+
+	return 0;
+}
+
+static const struct pwm_ops sn3112_pwm_ops = {
+	.apply = sn3112_pwm_apply,
+	.request = sn3112_pwm_request,
+};
+
+static const struct regmap_config sn3112_regmap_i2c_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 24,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int sn3112_pwm_probe(struct i2c_client *client)
+{
+	struct pwm_chip *chip;
+	struct sn3112 *priv;
+	int ret, i;
+
+	dev_dbg(&client->dev, "probing\n");
+	chip = devm_pwmchip_alloc(&client->dev, SN3112_CHANNELS, sizeof(*priv));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+	priv = pwmchip_get_drvdata(chip);
+	priv->pdev = &client->dev;
+
+	/* initialize sn3112 (chip does not support read command) */
+	for (i = 0; i < SN3112_CHANNELS; i++)
+		priv->pwm_en[i] = false;
+	for (i = 0; i < SN3112_CHANNELS; i++)
+		priv->pwm_val[i] = 0;
+	for (i = 0; i < 3; i++)
+		priv->pwm_en_reg[i] = 0;
+
+	/* enable sn5112 power vdd */
+	priv->vdd = devm_regulator_get(priv->pdev, "vdd");
+	if (IS_ERR(priv->vdd)) {
+		ret = PTR_ERR(priv->vdd);
+		dev_err(priv->pdev, "Unable to get vdd regulator: %d\n", ret);
+		return ret;
+	}
+
+#if IS_ENABLED(CONFIG_GPIOLIB)
+	/* sn5112 hardware shutdown pin */
+	priv->sdb = devm_gpiod_get_optional(priv->pdev, "sdb", GPIOD_OUT_LOW);
+	if (PTR_ERR(priv->sdb) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+#endif
+
+	/* enable sn5112 power vdd */
+	ret = regulator_enable(priv->vdd);
+	if (ret < 0) {
+		dev_err(priv->pdev, "Unable to enable regulator: %d\n", ret);
+		return ret;
+	}
+
+	priv->regmap = devm_regmap_init_i2c(client, &sn3112_regmap_i2c_config);
+	if (IS_ERR(priv->regmap)) {
+		ret = PTR_ERR(priv->regmap);
+		dev_err(priv->pdev, "Failed to initialize register map: %d\n",
+			ret);
+		return ret;
+	}
+
+	i2c_set_clientdata(client, chip);
+	mutex_init(&priv->lock);
+
+	chip->ops = &sn3112_pwm_ops;
+	ret = pwmchip_add(chip);
+	if (ret < 0)
+		return ret;
+
+#if IS_ENABLED(CONFIG_GPIOLIB)
+	/* disable hardware shutdown pin */
+	if (priv->sdb)
+		gpiod_set_value(priv->sdb, 0);
+#endif
+
+	/* initialize registers */
+	ret = sn3112_write_all(priv);
+	if (ret != 0) {
+		dev_err(priv->pdev, "Failed to initialize sn3112: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(&client->dev,
+		 "Found SI-EN SN3112 12-channel 8-bit PWM LED controller\n");
+	return 0;
+}
+
+static void sn3112_pwm_remove(struct i2c_client *client)
+{
+	struct pwm_chip *chip = i2c_get_clientdata(client);
+	struct sn3112 *priv = pwmchip_get_drvdata(chip);
+
+	dev_dbg(priv->pdev, "remove\n");
+
+	/* set software enable register */
+	sn3112_write_reg(priv, SN3112_REG_ENABLE, 0);
+
+	/* use random value to apply changes */
+	sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
+
+#if IS_ENABLED(CONFIG_GPIOLIB)
+	/* enable hardware shutdown pin */
+	if (priv->sdb)
+		gpiod_set_value(priv->sdb, 1);
+#endif
+
+	/* power-off sn5112 power vdd */
+	regulator_disable(priv->vdd);
+
+	pwmchip_remove(chip);
+}
+
+static const struct i2c_device_id sn3112_id[] = {
+	{ "sn3112", 0 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i2c, sn3112_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id sn3112_dt_ids[] = {
+	{ .compatible = "si-en,sn3112-pwm", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sn3112_dt_ids);
+#endif
+
+static struct i2c_driver sn3112_i2c_driver = {
+	.driver = {
+		.name = "sn3112-pwm",
+		.of_match_table = of_match_ptr(sn3112_dt_ids),
+	},
+	.probe = sn3112_pwm_probe,
+	.remove = sn3112_pwm_remove,
+	.id_table = sn3112_id,
+};
+
+module_i2c_driver(sn3112_i2c_driver);
+
+MODULE_AUTHOR("BigfootACA <bigfoot@classfun.cn>");
+MODULE_DESCRIPTION("PWM driver for SI-EN SN3112");
+MODULE_LICENSE("GPL");

-- 
2.44.0


