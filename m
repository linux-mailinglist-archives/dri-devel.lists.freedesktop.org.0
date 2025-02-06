Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22AA2A2A8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 08:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466EB10E488;
	Thu,  6 Feb 2025 07:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kb1ViJiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD50110E488
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 07:53:05 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso5456625e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738828384; x=1739433184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6m7TXnR8Yp1Zl6pcqMtLySEDyoW+PZY7jbi3ZwdEqTE=;
 b=Kb1ViJiQ6rbvav7B13cB+jbaqeZ/2jmLZv0IPaCvtNUbeoTR3bOC6XuMKWrolaL8Fe
 0cfuFlNrC9h7n+3ZlJ4IW8e+52Q7eNFGP64ZEByhkVI5qtKqX6UyYHaGGLzAXDUdx03A
 qD8b+kwHkVm9oQiZTVD0RPnPwexDZa+nJSUbIws29UP9xiCExsMRWo62tAyKyLFkbV8L
 tj5PPzjTCrTmh6SBlh7eHcBfSgSTmYHZNHGYyQaMsyRE3LZWP2sZ8m8/Nm40iYmSU76o
 wRZWTeiqukYTrPde/BCgXulVdDRX37XqLrWh6O0fKBRqICCWy3NTcPmXBJdhQV6NGDuR
 wFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738828384; x=1739433184;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6m7TXnR8Yp1Zl6pcqMtLySEDyoW+PZY7jbi3ZwdEqTE=;
 b=prRk7BZnP3E7FOcVStVRpcV7/XYojS1s5R/CJNDnbv80gI00gucZ7S6wBQc/y0xqJc
 XSejsmH9+SVPdN+4xXCHVHrLSvBVGP86grS0mEbb5YLTIwguhYg1qzWOPlGvVQwoDGsd
 HxdqcSlRIGNVtr/8AZlq2sPTQKM2dUTJZoL0SKBq7NHf5lIQ+CvjNjsS3ft0OhjWgxpZ
 HARaunCXVbuAS0lXLfsb/6u44iZjg9ECR3cUtMnhXj+k9uAlMXVXx/YEFjazspbIp0Ff
 6pP2JlhYPnCFdl7Hk1h6UCE63EaS4YBJD1BPxP9oNcejRwU3sVv9p4QCVreitTOYCkoj
 h0ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4wwPmOONIlZnRltv3Tgxp3Zq3Wzt4MIvgf3PjlJGWsENOk/wHOKPYTV70Wkyf1xFgsHeIfYdSKkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym9C2X/gQysU5i/T/LDjnxDwZhKNMvK2TAhRoRw2pKAaKL7ySV
 o7lGK7dbtubBMFMOL+SeIQFTh1axnxVAhdSvGkmhWN3kN9lDACqi51LQ3Gu4u+8=
X-Gm-Gg: ASbGncuRkI6tG46xAQ/PEbKezy7Omjt8NWRhZRhxCvIl6shajYTz9Rv9+pcSP6pBpEW
 NuIdjEGVvCk+ZZMyShk+880V0yM9AXuO3fvHtbCCgL+H6v8ygzqn3xxY0BYvimUJjWUtT6Olwzh
 ZbG8ioGCLEAYqIFMxnuLK87qDBIzr6R0e6G+Ae1Aj4xWcOpBLmu6yotQCiMrudMKOgzAy6G4+BN
 GsD3TUOsKMq2HEvNJwsGzZMxAxbY3YLSWCgAHestc0buXcJ2ahwevXChCIWknMnAemXJu0OVRp0
 GsPMTff6cfdB3fGXQIapbP5ms52GSEAeW03T65v6a4+YI3zjt7g668y46HgEgyWAvbBv
X-Google-Smtp-Source: AGHT+IH0RqYwjPbaACsjDyFw9S+aalsLTtgB2h+Skh1qS7c10wBFGD0+SWpJDenUFZCuNvQ5UxMfHQ==
X-Received: by 2002:a05:600c:4ec8:b0:436:9227:915 with SMTP id
 5b1f17b1804b1-4390d434838mr44861015e9.9.1738828384159; 
 Wed, 05 Feb 2025 23:53:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6?
 ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae5c7sm10442625e9.18.2025.02.05.23.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 23:53:03 -0800 (PST)
Message-ID: <2a602642-7c18-4969-ae41-8d24bcacac45@linaro.org>
Date: Thu, 6 Feb 2025 08:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/5] drm: panel: Add a panel driver for the Summit
 display
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>, Nick Chan <towinchenmi@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2025 23:10, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig        |   9 +++
>   drivers/gpu/drm/panel/Makefile       |   1 +
>   drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
>   3 files changed, 142 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d7469c565d1db8b8e974dd6c45d03d9352d99d63..5085a82e4bc695e85cabbc3200859bbe10cb0f91 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -925,6 +925,15 @@ config DRM_PANEL_SIMPLE
>   	  that it can be automatically turned off when the panel goes into a
>   	  low power state.
>   
> +config DRM_PANEL_SUMMIT
> +	tristate "Apple Summit display panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for the "Summit" display panel
> +	  used as a touchbar on certain Apple laptops.
> +
>   config DRM_PANEL_SYNAPTICS_R63353
>   	tristate "Synaptics R63353-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7dcf72646cacff11bab90c78e3b8b1f357e5f14a..10ac2e850f5cd6d6546439de75483466e4015d1a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LS060T1SX01) += panel-sharp-ls060t1sx01.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>   obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
> +obj-$(CONFIG_DRM_PANEL_SUMMIT) += panel-summit.o
>   obj-$(CONFIG_DRM_PANEL_SYNAPTICS_R63353) += panel-synaptics-r63353.o
>   obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>   obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fb084f280c6fa3197b64876edd03172dbdf962b3
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/backlight.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_mode.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <video/mipi_display.h>
> +
> +struct summit_data {
> +	struct mipi_dsi_device *dsi;
> +	struct backlight_device *bl;
> +	struct drm_panel panel;
> +};
> +
> +static int summit_set_brightness(struct device *dev)
> +{
> +	struct summit_data *s_data = dev_get_drvdata(dev);
> +	int level = backlight_get_brightness(s_data->bl);
> +
> +	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, level);
> +}
> +
> +static int summit_bl_update_status(struct backlight_device *dev)
> +{
> +	return summit_set_brightness(&dev->dev);
> +}
> +
> +static const struct backlight_ops summit_bl_ops = {
> +	.update_status	= summit_bl_update_status,
> +};
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +
> +static int summit_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct backlight_properties props = { 0 };
> +	struct device *dev = &dsi->dev;
> +	struct summit_data *s_data;
> +	int ret;
> +
> +	s_data = devm_kzalloc(dev, sizeof(*s_data), GFP_KERNEL);
> +	if (!s_data)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, s_data);
> +	s_data->dsi = dsi;
> +
> +	ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
> +	if (ret)
> +		return ret;
> +	props.type = BACKLIGHT_RAW;
> +
> +	s_data->bl = devm_backlight_device_register(dev, dev_name(dev),
> +						    dev, s_data, &summit_bl_ops, &props);
> +	if (IS_ERR(s_data->bl))
> +		return PTR_ERR(s_data->bl);
> +
> +	drm_panel_init(&s_data->panel, dev, &summit_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	drm_panel_add(&s_data->panel);
> +
> +	return mipi_dsi_attach(dsi);
> +}
> +
> +static void summit_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct summit_data *s_data = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&s_data->panel);
> +}
> +
> +static int summit_suspend(struct device *dev)
> +{
> +	struct summit_data *s_data = dev_get_drvdata(dev);
> +
> +	return mipi_dsi_dcs_set_display_brightness(s_data->dsi, 0);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(summit_pm_ops, summit_suspend,
> +				summit_set_brightness);
> +
> +static const struct of_device_id summit_of_match[] = {
> +	{ .compatible = "apple,summit" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, summit_of_match);
> +
> +static struct mipi_dsi_driver summit_driver = {
> +	.probe = summit_probe,
> +	.remove = summit_remove,
> +	.driver = {
> +		.name = "panel-summit",
> +		.of_match_table = summit_of_match,
> +		.pm = pm_sleep_ptr(&summit_pm_ops),
> +	},
> +};
> +module_mipi_dsi_driver(summit_driver);
> +
> +MODULE_DESCRIPTION("Summit Display Panel Driver");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
