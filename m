Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08378B139E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 21:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DEA10E393;
	Wed, 24 Apr 2024 19:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Te0Y4dOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8992410E393
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 19:37:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2db101c11feso2123801fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713987449; x=1714592249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZRQMK46HDuhLKU1QrN81gmIGPmB/RJZ6AB3Yod7zVCo=;
 b=Te0Y4dOPs+UFneHlWYde36FAJFY89l9cWZEKon2IOm9+bzbjgxxICn9VXZNkeFK0ey
 RQ12Ct8tPu8UkgTB1WL4NXeOESB7jcga5Hg5NyTWS7oqyc39fLACuMo8jWVjVVZ70Ldk
 GpmSQ3rGD/iu+LNSKZmPEA1EHEpTYKfJvvHUh/wHUHgAgiVxN2iBSlemlO4lfsZwYeZT
 XGyyPihhkwajeaJg6iui4ybWrjXTFdJBK/p11gWzCGgV5cGIfIj8Go43U0yLBrvwgSxj
 SPlY3iv1K8Ti9d2ODgs+vQMzAuobmo76x/wvwg+qg7o5gbUK/7LU06NqtIVDfyzEKxGn
 kvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713987449; x=1714592249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRQMK46HDuhLKU1QrN81gmIGPmB/RJZ6AB3Yod7zVCo=;
 b=j2C9opsMQ963aI95b+RaePMdPwYv6mu4izlzn5wq/eRLYsdyDfcPXPGb2QEYVSmtNL
 ESwYM3BgE7UffoOiWiS93aJO69EbLVS9e1mKUYX78kOwdnJQcxOmE7bc79LZnIkF4Jq/
 sJwR0YB962IDO5QNYGwUuNAb00kkoKuiMB2Ypzs4KLnLJqC2p02Z8gzHnMqiP/59VmXH
 tBuI6/IrWQeEglla+Rofy0KzHAImJLjkGHuXOaASaajyajSViOJQjCUtXmJgEgSkm0Yb
 QOp72Wa57CT0m5rGyi9Jre0scJWTE1XDjZG+645IPSwjCCEAnEHv7cT4pHRYaPhOQmfe
 Jy+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUv4mG/ygGdm3BXOVXj5ClyS8ufNPLtUZfxjQNSyY+h4cC/tF770qFG0bujLwEgtxvWxU4SFGhu2QnFBXctNe2vjXtHMYKuDSw/W4Bx78e
X-Gm-Message-State: AOJu0YzntbARiGdj478OiB2UNPt/7J/4+1D1cwsyyo1RjNFDC3A7VhIH
 AY9/m1Em/hZe99+5Rtqy6CHCsZ+uekoUqbSY4LXhQNSKWWAYJdPBSvP2SQRXgR8=
X-Google-Smtp-Source: AGHT+IGiRoHTTiEuE65JavqIJ1EiDt4nqgFHQU16wmeKJ3TTmtXrar1F+DhjaKBxGWJDHzT3hwV9pw==
X-Received: by 2002:a2e:3506:0:b0:2dc:f13f:8a96 with SMTP id
 z6-20020a2e3506000000b002dcf13f8a96mr187145ljz.5.1713987449211; 
 Wed, 24 Apr 2024 12:37:29 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 by7-20020a05651c1a0700b002dd2046afd8sm1361992ljb.97.2024.04.24.12.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 12:37:28 -0700 (PDT)
Message-ID: <af62742c-8d6d-4fa9-b2e4-f83253e6e388@linaro.org>
Date: Wed, 24 Apr 2024 21:37:25 +0200
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
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
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



On 4/24/24 17:29, Xilin Wu via B4 Relay wrote:
> From: Junhao Xie <bigfoot@classfun.cn>
> 
> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
> 
> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> ---

[...]

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
> +	return sn3112_write_reg(priv, SN3112_REG_PWM_EN + reg,
> +				priv->pwm_en_reg[reg]);

This looks like a weird reimplementation of regmap_update_bits


> +}
> +
> +static int sn3112_set_val_reg(struct sn3112 *priv, unsigned int channel,
> +			      uint8_t val, bool write)
> +{
> +	if (channel >= SN3112_CHANNELS)
> +		return -EINVAL;
> +	priv->pwm_val[channel] = val;
> +	dev_dbg(priv->pdev, "set value reg %u to %u\n", channel,
> +		priv->pwm_val[channel]);
> +
> +	if (!write)
> +		return 0;

There's only a single call, with write == true

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

if (ret) is the same as if (ret != 0)

[...]

> +
> +	/* use random value to apply changes */
> +	ret = sn3112_write_reg(priv, SN3112_REG_APPLY, 0x66);

"a random value"? sounds suspicious..

> +	if (ret != 0)
> +		return ret;
> +
> +	dev_dbg(priv->pdev, "reinitialized\n");

Please remove such "got here" messages once you're done with testing
the driver locally

[...]

> +
> +#if IS_ENABLED(CONFIG_GPIOLIB)

I'm not sure this would be ever disabled on any embedded system nowadays.
Especially with I2C.

[...]

> +
> +	dev_info(&client->dev,
> +		 "Found SI-EN SN3112 12-channel 8-bit PWM LED controller\n");

This sort of message only makes sense if there's a CHIP_ID register that
you can actually validate. If you bind this driver to a device at the same
expected address, it will say it's there even if it's not.


> +	return 0;
> +}
> +
> +static void sn3112_pwm_remove(struct i2c_client *client)
> +{
> +	struct pwm_chip *chip = i2c_get_clientdata(client);
> +	struct sn3112 *priv = pwmchip_get_drvdata(chip);
> +
> +	dev_dbg(priv->pdev, "remove\n");
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

devm_pwmchip_add?

Konrad
