Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC430917791
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 06:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA7710E308;
	Wed, 26 Jun 2024 04:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="daq1cBCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BEF10E308
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:47:54 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52cdfb69724so4201631e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 21:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719377273; x=1719982073; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+PgSJ6POkPtoOAQEeHCUxhxxRps1uKvxSPxKcb7C4Co=;
 b=daq1cBCbO83ZAB8QBEWGKZiyedFBMmFkha9HjLKsBxBlWQdOvHy1wzQiLV+mSnat7z
 Uswx/bADIJVQqHyF2i7p+nuAWW4uG1b3nCCSkz/G6l0S7MeI3qn8uqnaibrVSqvRSEvi
 x7dj+R4aNMvJKP2c707nfwFKvPZq8rhQPCVGhz1fG/OHiC2qXv3reraZpslH1Wh00n8A
 1CC1Gbwvl0JkbLUdKR0KYOrGTHIkwu2i1mRA+sR/JAAkclPmkGCvtvawvkfWs8BMBShJ
 s02ENSAnfoxeOB2QewXM7TsxScBEJraAFLvrpK/2dkAji4tzQO9bI1sSmysdyiDkmpPi
 TbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719377273; x=1719982073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+PgSJ6POkPtoOAQEeHCUxhxxRps1uKvxSPxKcb7C4Co=;
 b=OFckKCWJ+ddiCw8iZ/cIhKTS2OCUlNZqDcKx4Y5D/4I5hDmmpYC0tj8tdSmrfR3qHq
 BKt6anKqx8gECkF2Uwy/Qlycanr7FYTiohKL2XLeNir7Q0/YSXgFo0K9Cor0ri739Ebj
 wipuLSiNofM9wUqc6JFuQ+8v15Py08YeiyxhH8+9TCeUKV5QRcYOEskAwn+j44mfoTab
 +aMtnVKQz4Y2VHLLtADAfwwPIWm4FTAyJLul7D+yIlq6/uM2qUDtrztIyjt0+45/cEGo
 4kp2W80CzI/o3aneSsjzWAb7w1OVDBDkVAWrJAy7/eqtMuMDJeGkMnhFU+uyH2drEi2M
 PXXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLC5u9mnya1/nrG/We4sCQYC7RxWTg4Zl44f1vXYFNdbBjBHn9/OjV/GJEYF/zpDVpi5A+lQ7DZMEZUtDA7LId8wDnd1rqiM8hy5AgpOdk
X-Gm-Message-State: AOJu0YxN4nqJ1lNAiuGf9kAnMzLHk9uWxRR3RQMhtJDqC4WgLr8RNyzA
 debxKXKBxogopYd9LFTCfA0NmfdVdm7xvu6nCZYQ9kx8mmIj+ABltQzN9GQ2wj8=
X-Google-Smtp-Source: AGHT+IFE0Y1NVhy2a77+brStCv2Ph0dkQPC58LEcT6K5UT68IWZjqVDe1wI0IYgZvMfjB7sgsYbJOQ==
X-Received: by 2002:a05:6512:39c6:b0:52b:c12e:b226 with SMTP id
 2adb3069b0e04-52ce1862c2bmr6501890e87.68.1719377272519; 
 Tue, 25 Jun 2024 21:47:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdaaca776sm1311706e87.211.2024.06.25.21.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 21:47:52 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:47:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 2/2] drm/bridge: add support for TI TDP158
Message-ID: <bgp36sjj5hvldl4tqtjt7q6eva553hkek55easqpugzhdmcjv2@uhafklf25rit>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-2-a3b344707fa7@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-tdp158-v2-2-a3b344707fa7@freebox.fr>
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

On Tue, Jun 25, 2024 at 06:38:13PM GMT, Marc Gonzalez wrote:
> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> 
> The default settings work fine for our use-case.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/bridge/Kconfig     |   6 +++
>  drivers/gpu/drm/bridge/Makefile    |   1 +
>  drivers/gpu/drm/bridge/ti-tdp158.c | 103 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 110 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index c621be1a99a89..0859f85cb4b69 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -368,6 +368,12 @@ config DRM_TI_DLPC3433
>  	  It supports up to 720p resolution with 60 and 120 Hz refresh
>  	  rates.
>  
> +config DRM_TI_TDP158
> +	tristate "TI TDP158 HDMI/TMDS bridge"
> +	depends on OF
> +	help
> +	  Texas Instruments TDP158 HDMI/TMDS Bridge driver

Please run ./scripts/checkpatch.pl on your patch.

> +
>  config DRM_TI_TFP410
>  	tristate "TI TFP410 DVI/HDMI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 7df87b582dca3..3daf803ce80b6 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
>  obj-$(CONFIG_DRM_TI_DLPC3433) += ti-dlpc3433.o
>  obj-$(CONFIG_DRM_TI_SN65DSI83) += ti-sn65dsi83.o
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
> +obj-$(CONFIG_DRM_TI_TDP158) += ti-tdp158.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
>  obj-$(CONFIG_DRM_NWL_MIPI_DSI) += nwl-dsi.o
> diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
> new file mode 100644
> index 0000000000000..b65132e3598fc
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-tdp158.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2024 Freebox SAS
> + */
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <linux/i2c.h>
> +
> +struct tdp158 {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next;
> +	struct gpio_desc *enable; // Operation Enable - pin 36
> +	struct regulator *vcc; // 3.3V
> +	struct regulator *vdd; // 1.1V
> +};
> +
> +static void tdp158_enable(struct drm_bridge *bridge, struct drm_bridge_state *prev)
> +{
> +	int err;
> +	struct tdp158 *tdp158 = bridge->driver_private;
> +
> +	if ((err = regulator_enable(tdp158->vcc)))
> +		pr_err("%s: vcc: %d", __func__, err);

- dev_err
- please expand error messages
- ERROR: do not use assignment in if condition

> +
> +	if ((err = regulator_enable(tdp158->vdd)))
> +		pr_err("%s: vdd: %d", __func__, err);
> +
> +	gpiod_set_value_cansleep(tdp158->enable, 1);
> +}
> +
> +static void tdp158_disable(struct drm_bridge *bridge, struct drm_bridge_state *prev)
> +{
> +	struct tdp158 *tdp158 = bridge->driver_private;
> +
> +	gpiod_set_value_cansleep(tdp158->enable, 0);
> +	regulator_disable(tdp158->vdd);
> +	regulator_disable(tdp158->vcc);
> +}
> +
> +static int tdp158_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
> +{
> +	struct tdp158 *tdp158 = bridge->driver_private;

empty line

> +	return drm_bridge_attach(bridge->encoder, tdp158->next, bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);

No. Pass flags directly.

> +}
> +
> +static const struct drm_bridge_funcs tdp158_bridge_funcs = {
> +	.attach = tdp158_attach,
> +	.atomic_enable = tdp158_enable,
> +	.atomic_disable = tdp158_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +static int tdp158_bridge_probe(struct i2c_client *client)
> +{
> +	struct tdp158 *tdp158;
> +	struct device *dev = &client->dev;
> +
> +	tdp158 = devm_kzalloc(dev, sizeof(*tdp158), GFP_KERNEL);
> +	if (!tdp158)
> +		return -ENOMEM;
> +
> +	tdp158->next = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

Missing `select DRM_PANEL_BRIDGE`

> +	if (IS_ERR(tdp158->next))
> +		return dev_err_probe(dev, PTR_ERR(tdp158->next), "next");

This results in a cryptic message 'foo: ESOMETHING: next'. Please
expand.

> +
> +	tdp158->vcc = devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(tdp158->vcc))
> +		return dev_err_probe(dev, PTR_ERR(tdp158->vcc), "vcc");
> +
> +	tdp158->vdd = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(tdp158->vdd))
> +		return dev_err_probe(dev, PTR_ERR(tdp158->vdd), "vdd");
> +
> +	tdp158->enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(tdp158->enable))
> +		return dev_err_probe(dev, PTR_ERR(tdp158->enable), "enable");
> +
> +	tdp158->bridge.of_node = dev->of_node;
> +	tdp158->bridge.funcs = &tdp158_bridge_funcs;
> +	tdp158->bridge.driver_private = tdp158;
> +
> +	return devm_drm_bridge_add(dev, &tdp158->bridge);
> +}
> +
> +static const struct of_device_id tdp158_bridge_match_table[] = {
> +	{ .compatible = "ti,tdp158" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tdp158_bridge_match_table);
> +
> +static struct i2c_driver tdp158_bridge_driver = {
> +	.probe = tdp158_bridge_probe,
> +	.driver = {
> +		.name = "tdp158-bridge",
> +		.of_match_table = tdp158_bridge_match_table,
> +	},
> +};
> +module_i2c_driver(tdp158_bridge_driver);
> +
> +MODULE_DESCRIPTION("TI TDP158 driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
