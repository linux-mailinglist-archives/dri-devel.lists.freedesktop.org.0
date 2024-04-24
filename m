Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEDF8B0F2B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27835113C44;
	Wed, 24 Apr 2024 15:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PRef2gp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90476113C44
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:55:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-417e327773cso6413765e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713974128; x=1714578928; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OGygmmw5dUuftK+NtOQ8W0MuuBgiCdR1Jk9PiD/ccZY=;
 b=PRef2gp/N39KuGnuwKvODLcucjHNyE6Fzr2dI4QvlXaHE8P6Hkovz30jRLcamN8NsD
 8CLk6Y01gbqINb9dTc4MS+Ctt6/uDnibl00n0BD4gIGHGytfcBtChid42fEPjeQULEE1
 7Ynm31vBljiix91RfQbYIW+JNn36u1sPE4S4Et9nd3wVAXoQnPaLxrebs4jGA6i4eTII
 SKPdnPyLjEwpuiht88+wkAqGDts6RMrOyjQ+bdE1P6R0i94TjN88OLeg0GbbUPCm3Mr/
 z6EcWJgwTGvipHugXeqJWeIWPdmo+WrEgXLtrzoruH41DPjVv7iASVf3PcoY4GiRRG+u
 FAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713974128; x=1714578928;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OGygmmw5dUuftK+NtOQ8W0MuuBgiCdR1Jk9PiD/ccZY=;
 b=ZNckH6Xqj3RT7dY/JseHXK8/Jkc10n7HpsPml0qrxg4M7zN+WQaKsh367DbB+NfFPS
 ZTvyfVA4UXPov3tz1aTm88zSrPVY6c7pm5tImJh1sjMwqs3U6lnqE1Fy5njKrLiIMxJ1
 k5UByMrHGBnvUOds2f1VDF/7VfrBKbysQ1n/+MN+sOLFdcu5bBhuKI9YroGkACZAL2l3
 fcKNfiCjG5UeGHAHp39CrhSf9ZWdJfh9JaJRtSosfeJRdyLL9FlaXyvFPmhy8Oz7e/yL
 GzG4DbiF5mTJixhkqU1zHco5o+tBd2c4GzWehdHA9LlB0ZluNxfmyGMk3o7U4UmIR/KF
 3PNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/ltPlMYeg6JIIyh9zGX3njMiIdvmG7DEOZSyPU8aFkfngHZAXyoE2m2f+APhuynfZ9T6laOAbZBhhhX8uKgYVrqJGPTVLzNdSUz5zAQT+
X-Gm-Message-State: AOJu0YwbsjHh4hdWdes+0MVTqgQEAmHzfoTgWnJqitltbQFiuoaJ1/JW
 qfYNLvpN9/wuCnINb08KVeHlQbz0VlQR0mkNIQgXgNbQ42/6anNxD1UFXnLF7zg=
X-Google-Smtp-Source: AGHT+IHikMHMOXTMulwB47yle/P1Kf68zYdYPx2oI07Jwtj8DHkg3Wy57Z7buA+x9rEtvYYTZDgcOg==
X-Received: by 2002:adf:e7c1:0:b0:34a:cb2:c52 with SMTP id
 e1-20020adfe7c1000000b0034a0cb20c52mr48257wrn.20.1713974127801; 
 Wed, 24 Apr 2024 08:55:27 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d54cd000000b0034335e47102sm17375359wrv.113.2024.04.24.08.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 08:55:27 -0700 (PDT)
Message-ID: <17d36836-67cb-4d5a-a8b4-ecf1517a0020@linaro.org>
Date: Wed, 24 Apr 2024 16:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
To: wuxilin123@gmail.com, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/04/2024 16:29, Xilin Wu via B4 Relay wrote:
> From: Junhao Xie <bigfoot@classfun.cn>
> 
> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
> 
> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> ---
>   drivers/pwm/Kconfig      |  10 ++
>   drivers/pwm/Makefile     |   1 +
>   drivers/pwm/pwm-sn3112.c | 336 +++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 347 insertions(+)
> 
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 1dd7921194f5..e21c37c7991e 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -553,6 +553,16 @@ config PWM_SL28CPLD
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called pwm-sl28cpld.
>   
> +config PWM_SN3112
> +	tristate "SI-EN SN3112 PWM driver"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Generic PWM framework driver for SI-EN SN3112 LED controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called pwm-sn3112.
> +
>   config PWM_SPEAR
>   	tristate "STMicroelectronics SPEAr PWM support"
>   	depends on PLAT_SPEAR || COMPILE_TEST
> diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> index 90913519f11a..6aab2d113159 100644
> --- a/drivers/pwm/Makefile
> +++ b/drivers/pwm/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_PWM_RZ_MTU3)	+= pwm-rz-mtu3.o
>   obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
>   obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
>   obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
> +obj-$(CONFIG_PWM_SN3112)	+= pwm-sn3112.o
>   obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
>   obj-$(CONFIG_PWM_SPRD)		+= pwm-sprd.o
>   obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
> diff --git a/drivers/pwm/pwm-sn3112.c b/drivers/pwm/pwm-sn3112.c
> new file mode 100644
> index 000000000000..38ef948602a3
> --- /dev/null
> +++ b/drivers/pwm/pwm-sn3112.c
> @@ -0,0 +1,336 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for SN3112 12-channel 8-bit PWM LED controller
> + *
> + * Copyright (c) 2024 Junhao Xie <bigfoot@classfun.cn>
> + *
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>

Includes should be alphabetised

> +
> +#define SN3112_CHANNELS 12
> +#define SN3112_REG_ENABLE 0x00
> +#define SN3112_REG_PWM_VAL 0x04
> +#define SN3112_REG_PWM_EN 0x13
> +#define SN3112_REG_APPLY 0x16
> +#define SN3112_REG_RESET 0x17
> +
> +struct sn3112 {
> +	struct device *pdev;
> +	struct regmap *regmap;
> +	struct mutex lock;
> +	struct regulator *vdd;
> +	uint8_t pwm_val[SN3112_CHANNELS];
> +	uint8_t pwm_en_reg[3];
> +	bool pwm_en[SN3112_CHANNELS];
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	struct gpio_desc *sdb;
> +#endif
> +};
> +
> +static int sn3112_write_reg(struct sn3112 *priv, unsigned int reg,
> +			    unsigned int val)
> +{
> +	int err;
> +
> +	dev_dbg(priv->pdev, "request regmap_write 0x%x 0x%x\n", reg, val);
> +	err = regmap_write(priv->regmap, reg, val);
> +	if (err)
> +		dev_warn_ratelimited(
> +			priv->pdev,
> +			"regmap_write to register 0x%x failed: %pe\n", reg,
> +			ERR_PTR(err));

Multi-line should be encapsulated in {}

if (err) {
	stuff
	goes here
}

> +	return err;
> +}
> +
> +static int sn3112_set_en_reg(struct sn3112 *priv, unsigned int channel,
> +			     bool enabled, bool write)
> +{
> +	unsigned int reg, bit;
> +
> +	if (channel >= SN3112_CHANNELS)
> +		return -EINVAL;
> +
> +	/* LED_EN1: BIT5:BIT3 = OUT3:OUT1 */
> +	if (channel >= 0 && channel <= 2)
> +		reg = 0, bit = channel + 3;
> +	/* LED_EN2: BIT5:BIT0 = OUT9:OUT4 */
> +	else if (channel >= 3 && channel <= 8)
> +		reg = 1, bit = channel - 3;
> +	/* LED_EN3: BIT2:BIT0 = OUT12:OUT10 */
> +	else if (channel >= 9 && channel <= 11)
> +		reg = 2, bit = channel - 9;
> +	else
> +		return -EINVAL;
> +
> +	dev_dbg(priv->pdev, "channel %u enabled %u\n", channel, enabled);
> +	dev_dbg(priv->pdev, "reg %u bit %u\n", reg, bit);
> +	if (enabled)
> +		set_bit(bit, (ulong *)&priv->pwm_en_reg[reg]);
> +	else
> +		clear_bit(bit, (ulong *)&priv->pwm_en_reg[reg]);
> +	dev_dbg(priv->pdev, "set enable reg %u to %u\n", reg,
> +		priv->pwm_en_reg[reg]);
> +
> +	if (!write)
> +		return 0;
newline
> +	return sn3112_write_reg(priv, SN3112_REG_PWM_EN + reg,
> +				priv->pwm_en_reg[reg]);
> +}
> +
> +static int sn3112_set_val_reg(struct sn3112 *priv, unsigned int channel,
> +			      uint8_t val, bool write)
> +{
> +	if (channel >= SN3112_CHANNELS)
> +		return -EINVAL;
newline
> +	priv->pwm_val[channel] = val;
> +	dev_dbg(priv->pdev, "set value reg %u to %u\n", channel,
> +		priv->pwm_val[channel]);
> +
> +	if (!write)
> +		return 0;
newline
> +	return sn3112_write_reg(priv, SN3112_REG_PWM_VAL + channel,
> +				priv->pwm_val[channel]);
> +}
> +
> +static int sn3112_write_all(struct sn3112 *priv)
> +{
> +	int i, ret;
> +
> +	/* regenerate enable register values */
> +	for (i = 0; i < SN3112_CHANNELS; i++) {
> +		ret = sn3112_set_en_reg(priv, i, priv->pwm_en[i], false);
> +		if (ret != 0)
> +			return ret;
> +	}
> +
> +	/* use random value to clear all registers */
> +	ret = sn3112_write_reg(priv, SN3112_REG_RESET, 0x66);
> +	if (ret != 0)
> +		return ret;
> +
> +	/* set software enable register */
> +	ret = sn3112_write_reg(priv, SN3112_REG_ENABLE, 1);
> +	if (ret != 0)
> +		return ret;
> +
> +	/* rewrite pwm value register */
> +	for (i = 0; i < SN3112_CHANNELS; i++) {
> +		ret = sn3112_write_reg(priv, SN3112_REG_PWM_VAL + i,
> +				       priv->pwm_val[i]);
> +		if (ret != 0)
> +			return ret;
> +	}
> +
> +	/* rewrite pwm enable register */
> +	for (i = 0; i < 3; i++) {
> +		ret = sn3112_write_reg(priv, SN3112_REG_PWM_EN + i,
> +				       priv->pwm_en_reg[i]);
> +		if (ret != 0)
> +			return ret;
> +	}
> +
> +	/* use random value to apply changes */
> +	ret = sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
> +	if (ret != 0)
> +		return ret;
> +
> +	dev_dbg(priv->pdev, "reinitialized\n");
> +	return 0;
> +}
> +
> +static int sn3112_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct sn3112 *priv = pwmchip_get_drvdata(chip);
> +
> +	if (pwm->hwpwm >= SN3112_CHANNELS)
> +		return -EINVAL;
> +
> +	dev_dbg(priv->pdev, "sn3112 request channel %u\n", pwm->hwpwm);
> +	pwm->args.period = 1000000;
newline
> +	return 0;
> +}
> +
> +static int sn3112_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			    const struct pwm_state *state)
> +{
> +	u64 val = 0;
> +	struct sn3112 *priv = pwmchip_get_drvdata(chip);
> +
> +	if (pwm->hwpwm >= SN3112_CHANNELS)
> +		return -EINVAL;
> +
> +	if (state->polarity != PWM_POLARITY_NORMAL)
> +		return -EINVAL;
> +
> +	if (state->period <= 0)
> +		return -EINVAL;
> +
> +	val = mul_u64_u64_div_u64(state->duty_cycle, 0xff, state->period);
> +	dev_dbg(priv->pdev, "duty_cycle %llu period %llu\n", state->duty_cycle,
> +		state->period);
> +	dev_dbg(priv->pdev, "set channel %u value to %llu\n", pwm->hwpwm, val);
> +	dev_dbg(priv->pdev, "set channel %u enabled to %u\n", pwm->hwpwm,
> +		state->enabled);
> +
> +	mutex_lock(&priv->lock);
> +	sn3112_set_en_reg(priv, pwm->hwpwm, state->enabled, true);
> +	sn3112_set_val_reg(priv, pwm->hwpwm, val, true);
> +	sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
> +	mutex_unlock(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops sn3112_pwm_ops = {
> +	.apply = sn3112_pwm_apply,
> +	.request = sn3112_pwm_request,
> +};
> +
> +static const struct regmap_config sn3112_regmap_i2c_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 24,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static int sn3112_pwm_probe(struct i2c_client *client)
> +{
> +	struct pwm_chip *chip;
> +	struct sn3112 *priv;
> +	int ret, i;
> +
> +	dev_dbg(&client->dev, "probing\n");
You can probably live without that in an upstream driver..

> +	chip = devm_pwmchip_alloc(&client->dev, SN3112_CHANNELS, sizeof(*priv));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +	priv = pwmchip_get_drvdata(chip);
> +	priv->pdev = &client->dev;
> +
> +	/* initialize sn3112 (chip does not support read command) */
> +	for (i = 0; i < SN3112_CHANNELS; i++)
> +		priv->pwm_en[i] = false;
> +	for (i = 0; i < SN3112_CHANNELS; i++)
> +		priv->pwm_val[i] = 0;
> +	for (i = 0; i < 3; i++)
> +		priv->pwm_en_reg[i] = 0;

Why does pwm_val have a define to constrain the array but pwm_en_reg 
have hard-coded 3 ?

Suggest using a #define for the 3 value for consistency / extensibility.

> +
> +	/* enable sn5112 power vdd */
> +	priv->vdd = devm_regulator_get(priv->pdev, "vdd");
> +	if (IS_ERR(priv->vdd)) {
> +		ret = PTR_ERR(priv->vdd);
> +		dev_err(priv->pdev, "Unable to get vdd regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	/* sn5112 hardware shutdown pin */
> +	priv->sdb = devm_gpiod_get_optional(priv->pdev, "sdb", GPIOD_OUT_LOW);
> +	if (PTR_ERR(priv->sdb) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +#endif
> +
> +	/* enable sn5112 power vdd */
> +	ret = regulator_enable(priv->vdd);
> +	if (ret < 0) {
> +		dev_err(priv->pdev, "Unable to enable regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &sn3112_regmap_i2c_config);
> +	if (IS_ERR(priv->regmap)) {
> +		ret = PTR_ERR(priv->regmap);
> +		dev_err(priv->pdev, "Failed to initialize register map: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	i2c_set_clientdata(client, chip);
> +	mutex_init(&priv->lock);
> +
> +	chip->ops = &sn3112_pwm_ops;
> +	ret = pwmchip_add(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	/* disable hardware shutdown pin */
> +	if (priv->sdb)
> +		gpiod_set_value(priv->sdb, 0);
> +#endif
> +
> +	/* initialize registers */
> +	ret = sn3112_write_all(priv);
> +	if (ret != 0) {
> +		dev_err(priv->pdev, "Failed to initialize sn3112: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(&client->dev,
> +		 "Found SI-EN SN3112 12-channel 8-bit PWM LED controller\n");
newline
> +	return 0;
> +}
> +
> +static void sn3112_pwm_remove(struct i2c_client *client)
> +{
> +	struct pwm_chip *chip = i2c_get_clientdata(client);
> +	struct sn3112 *priv = pwmchip_get_drvdata(chip);
> +
> +	dev_dbg(priv->pdev, "remove\n");
suggest dropping from both probe() and remove()
> +
> +	/* set software enable register */
> +	sn3112_write_reg(priv, SN3112_REG_ENABLE, 0);
> +
> +	/* use random value to apply changes */
> +	sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);
> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)
> +	/* enable hardware shutdown pin */
> +	if (priv->sdb)
> +		gpiod_set_value(priv->sdb, 1);
> +#endif
> +
> +	/* power-off sn5112 power vdd */
> +	regulator_disable(priv->vdd);
> +
> +	pwmchip_remove(chip);
> +}
> +
> +static const struct i2c_device_id sn3112_id[] = {
> +	{ "sn3112", 0 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i2c, sn3112_id);
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id sn3112_dt_ids[] = {
> +	{ .compatible = "si-en,sn3112-pwm", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sn3112_dt_ids);
> +#endif
> +
> +static struct i2c_driver sn3112_i2c_driver = {
> +	.driver = {
> +		.name = "sn3112-pwm",
> +		.of_match_table = of_match_ptr(sn3112_dt_ids),
> +	},
> +	.probe = sn3112_pwm_probe,
> +	.remove = sn3112_pwm_remove,
> +	.id_table = sn3112_id,
> +};
> +
> +module_i2c_driver(sn3112_i2c_driver);
> +
> +MODULE_AUTHOR("BigfootACA <bigfoot@classfun.cn>");
BigFootACA not Xilin Wu ?
> +MODULE_DESCRIPTION("PWM driver for SI-EN SN3112");
> +MODULE_LICENSE("GPL");
> 

Also please consider the following checkpatch errors

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#50:
new file mode 100644

CHECK: struct mutex definition without comment
#83: FILE: drivers/pwm/pwm-sn3112.c:29:
+	struct mutex lock;

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#85: FILE: drivers/pwm/pwm-sn3112.c:31:
+	uint8_t pwm_val[SN3112_CHANNELS];

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#86: FILE: drivers/pwm/pwm-sn3112.c:32:
+	uint8_t pwm_en_reg[3];

CHECK: Lines should not end with a '('
#101: FILE: drivers/pwm/pwm-sn3112.c:47:
+		dev_warn_ratelimited(

CHECK: Prefer kernel type 'u8' over 'uint8_t'
#145: FILE: drivers/pwm/pwm-sn3112.c:91:
+			      uint8_t val, bool write)

