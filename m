Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B5B1A62C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF5B10E5A0;
	Mon,  4 Aug 2025 15:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PHTPRGWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8385C10E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:38:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-459ddada9b1so7437775e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321901; x=1754926701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=RuZJgIfgTL3a4Vbdyn0QdNZsRVGwKt5kxHHqiCuaBIk=;
 b=PHTPRGWae6lqedU4VcaiHWtgev2GI5w0aRyVC3WVquxwic9iW1o1xD9zb4zY3jH345
 hX/1ua87X2owRC06YZGqUQqO9n4q7oZoVGbqSTiIdrniL6FqL8i+hVaIzlYj6E2mY9L0
 ZBsEuj0oZJtgB8Ff2kKzF4svskjPGrmu27eqpXao4Wff+BQFhVDO0aetvK307b7VfhSy
 j2SPg5j/AL976pRhDyJv9AEcaUbFrI4zVfrwAt7UkZiQk4VwYAgA4gmQF00p5sbP+lBH
 IDs2+ORdcaKANG6XOUjv9I6zAusZ29zxG/zLRFmX23FcZpU9ILreViSRPgSKqihFO7Ri
 JRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321901; x=1754926701;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RuZJgIfgTL3a4Vbdyn0QdNZsRVGwKt5kxHHqiCuaBIk=;
 b=SJ7ij1D+/uBO/zBjd/gcWVpjVR1+zBnozBlLrcGnhp40N3AHnvtUgfUrAYC5QflZdV
 PmNeiU0PPBGUFwnJ1tVxfbtitDqJiidEGhVgGyT0CBbHfNIklap7xDXAqcpQCNAtFgZf
 kIddn2Ap1Ndq92+SE9kgytrUfUX37SOf9nu8T9i7tPpXTO7Ehn1BFy29ZixKZdpUynCX
 BcnYQ2T7MRrURaKZgwJg3MRXe9DoWpW764Gn/NM58p9rNjzlPTknm/B4nzQ9KFxlFliP
 bVn2euus/h8klXRKybomKFPZ6XLzxNICDziAzGgMjwEvfpqsoZPlw4CyeKUkA1AEFbzS
 jtqA==
X-Gm-Message-State: AOJu0YwzmCxpJXku7uA1SaAxQUxKxlhnT+UCVl3EAmZJNAKC1K9Prr3h
 7OzRn/xMH37PfbNmPGjIxGtXTAQRjdO4xTlHn0El4hZ8811vGy+lMveqKpzjMIPoB1Q=
X-Gm-Gg: ASbGncuw/R30oXM05+hJNyOBf2c0XYLUViPB7rTYmo6BZqmcj9fZyC7ut00YZtLpGvn
 uku1QuUOrIISQ27aolcBHxetV2iYusOvXKDqI8FYWXWYpVeEU8/y50DphS7Ognpc+8LktL8Qx0T
 N6fUA3KWjpvnd/w6nAXAEbuoE1HIPhQqHPnU8A8nuuCv87lnck/tshlIQZYhTgnLyWwt31DNFcT
 YmO+untKA3jyzY+4mvUNHBsFcXlL4IkUNWPxxitbrUxWZHYKwvi3tv8kF5je5HWMo79UZVyydSz
 wLo0umLT9hUKBz5hmO7nTUIVf5UgjIMJHXwOXnPPVUkOPd5lyOxhp+WS/weIK/pI4CTmCPEOlW0
 0jU5CiPgJgcTOpW+6d5b4x2SggF8S97qiJFYft8t4xD6drawpMbAdYKmcDx2TOwzHWLVAb1IH2o
 U=
X-Google-Smtp-Source: AGHT+IHol+qcEjxojKykA71/Gco++moX952Sl8OOfLp+7W4fhoQO3dxlDIdvYUevVJA6HsBL8gCXEg==
X-Received: by 2002:a05:600c:1554:b0:456:1442:86e with SMTP id
 5b1f17b1804b1-458b6b3308emr76314095e9.21.1754321900963; 
 Mon, 04 Aug 2025 08:38:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45910e182besm74137825e9.32.2025.08.04.08.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:38:20 -0700 (PDT)
Message-ID: <abe91bb3-3295-4534-b224-ecfafb477573@linaro.org>
Date: Mon, 4 Aug 2025 17:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm: bridge: Add waveshare DSI2DPI unit driver
To: Joseph Guo <qijian.guo@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, victor.liu@nxp.com
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
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
In-Reply-To: <20250804-waveshare-v2-3-0a1b3ce92a95@nxp.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/08/2025 04:07, Joseph Guo wrote:
> Waveshare touchscreen consists of a DPI panel and a driver board.
> The waveshare driver board consists of ICN6211 and a MCU to
> convert DSI to DPI and control the backlight.
> This driver treats the MCU and ICN6211 board as a whole unit.
> It can support all resolution waveshare DSI2DPI based panel,
> the timing table should come from 'panel-dpi' panel in the device tree.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig         |  11 ++
>   drivers/gpu/drm/bridge/Makefile        |   1 +
>   drivers/gpu/drm/bridge/waveshare-dsi.c | 210 +++++++++++++++++++++++++++++++++
>   3 files changed, 222 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index cb3b797fcea1c73e83c9187fef6582296b340305..26fec25c61ed7d950c094e0224f1196946079485 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -472,4 +472,15 @@ config DRM_ITE_IT6161
>   	help
>   	  ITE IT6161 bridge chip driver.
>   
> +config DRM_WAVESHARE_BRIDGE
> +	tristate "Waveshare DSI bridge"
> +	depends on OF
> +	select DRM_PANEL_BRIDGE
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select REGMAP_I2C
> +	help
> +	  Driver for waveshare DSI to DPI bridge board.
> +	  Please say Y if you have such hardware
> +
>   endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index d1db90688a150fdc3a5fd40acebe740798c452b0..3caa4d8f71675804328aa5a51ec67b2587938621 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -48,3 +48,4 @@ obj-$(CONFIG_DRM_ITE_IT6263) += it6263.o
>   obj-$(CONFIG_DRM_ITE_IT6161) += it6161.o
>   obj-$(CONFIG_DRM_SEC_MIPI_DSIM) += sec-dsim.o
>   obj-$(CONFIG_DRM_NXP_SEIKO_43WVFIG) += nxp-seiko-43wvfig.o
> +obj-$(CONFIG_DRM_WAVESHARE_BRIDGE) += waveshare-dsi.o
> diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..efb3a2fc501b5725b02f49862526d1704a3a4b7b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -0,0 +1,210 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Copyright 2025 NXP
> + * Based on panel-raspberrypi-touchscreen by Broadcom
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +struct ws_bridge {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct backlight_device *backlight;
> +	struct device *dev;
> +	struct regmap *reg_map;
> +};
> +
> +static const struct regmap_config ws_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.disable_debugfs = true,
> +};
> +
> +static struct ws_bridge *bridge_to_ws_bridge(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct ws_bridge, bridge);
> +}
> +
> +static int ws_bridge_attach_dsi(struct ws_bridge *ws)
> +{
> +	struct device_node *dsi_host_node;
> +	struct mipi_dsi_host *host;
> +	struct mipi_dsi_device *dsi;
> +	const struct mipi_dsi_device_info info = {
> +		.type = "ws-bridge",
> +		.channel = 0,
> +		.node = NULL,
> +	};
> +	struct device *dev = ws->dev;
> +	int ret;
> +
> +	dsi_host_node = of_graph_get_remote_node(dev->of_node, 0, 0);
> +	if (!dsi_host_node) {
> +		dev_err(dev, "Failed to get remote port\n");
> +		return -ENODEV;
> +	}
> +
> +	host = of_find_mipi_dsi_host_by_node(dsi_host_node);
> +
> +	of_node_put(dsi_host_node);
> +	if (!host)
> +		return dev_err_probe(dev, -EPROBE_DEFER, "Failed to find dsi_host\n");
> +
> +	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> +
> +	if (IS_ERR(dsi))
> +		return dev_err_probe(dev, PTR_ERR(dsi), "Failed to create dsi device\n");
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->lanes = 2;
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to attach dsi to host\n");
> +
> +	return 0;
> +}
> +
> +static int ws_bridge_bridge_attach(struct drm_bridge *bridge,
> +				   enum drm_bridge_attach_flags flags)
> +{
> +	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> +	int ret;
> +
> +	ret = ws_bridge_attach_dsi(ws);
> +	if (ret)
> +		return ret;
> +
> +	return drm_bridge_attach(ws->bridge.encoder, ws->next_bridge,
> +				 &ws->bridge, flags);
> +}
> +
> +static void ws_bridge_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> +
> +	regmap_write(ws->reg_map, 0xad, 0x01);
> +	backlight_enable(ws->backlight);
> +}
> +
> +static void ws_bridge_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct ws_bridge *ws = bridge_to_ws_bridge(bridge);
> +
> +	backlight_disable(ws->backlight);
> +	regmap_write(ws->reg_map, 0xad, 0x00);
> +}
> +
> +static const struct drm_bridge_funcs ws_bridge_bridge_funcs = {
> +	.enable = ws_bridge_bridge_enable,
> +	.disable = ws_bridge_bridge_disable,
> +	.attach = ws_bridge_bridge_attach,
> +};
> +
> +static int ws_bridge_bl_update_status(struct backlight_device *bl)
> +{
> +	struct ws_bridge *ws = bl_get_data(bl);
> +
> +	regmap_write(ws->reg_map, 0xab, 0xff - backlight_get_brightness(bl));
> +	regmap_write(ws->reg_map, 0xaa, 0x01);
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops ws_bridge_bl_ops = {
> +	.update_status = ws_bridge_bl_update_status,
> +};
> +
> +static struct backlight_device *ws_bridge_create_backlight(struct ws_bridge *ws)
> +{
> +	struct device *dev = ws->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 255,
> +		.max_brightness = 255,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, ws,
> +					      &ws_bridge_bl_ops, &props);
> +}
> +
> +static int ws_bridge_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev = &i2c->dev;
> +	struct ws_bridge *ws;
> +	struct drm_panel *panel;
> +	int ret;
> +	struct backlight_device *backlight;
> +
> +	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
> +	if (!ws)
> +		return -ENOMEM;
> +
> +	ws->dev = dev;
> +
> +	ws->reg_map = devm_regmap_init_i2c(i2c, &ws_regmap_config);
> +	if (IS_ERR(ws->reg_map))
> +		return dev_err_probe(dev, PTR_ERR(ws->reg_map), "Failed to allocate regmap\n");
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, -1, &panel, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to find remote panel\n");
> +
> +	ws->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(ws->next_bridge))
> +		return PTR_ERR(ws->next_bridge);
> +
> +	ws->backlight = ws_bridge_create_backlight(ws);
> +	if (IS_ERR(backlight)) {
> +		ret = PTR_ERR(backlight);
> +		dev_err(dev, "Failed to create backlight: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_write(ws->reg_map, 0xc0, 0x01);
> +	regmap_write(ws->reg_map, 0xc2, 0x01);
> +	regmap_write(ws->reg_map, 0xac, 0x01);
> +
> +	ws->bridge.funcs = &ws_bridge_bridge_funcs;
> +	ws->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +	ws->bridge.of_node = dev->of_node;
> +	devm_drm_bridge_add(dev, &ws->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ws_bridge_of_ids[] = {
> +	{.compatible = "waveshare,dsi2dpi",},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, ws_bridge_of_ids);
> +
> +static struct i2c_driver ws_bridge_driver = {
> +	.driver = {
> +		.name = "ws_dsi2dpi",
> +		.of_match_table = ws_bridge_of_ids,
> +	},
> +	.probe = ws_bridge_probe,
> +};
> +module_i2c_driver(ws_bridge_driver);
> +
> +MODULE_AUTHOR("Joseph Guo <qijian.guo@nxp.com>");
> +MODULE_DESCRIPTION("Waveshare DSI2DPI bridge driver");
> +MODULE_LICENSE("GPL");
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
