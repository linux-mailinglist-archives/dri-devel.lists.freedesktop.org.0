Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A529BEF83
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 14:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A08610E2DE;
	Wed,  6 Nov 2024 13:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qIvaZ/bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8046B10E2DE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 13:54:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso78724075e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2024 05:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730901282; x=1731506082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iIbwFT4SCUMumif7gepjn5EYZ9GZDHKic5/CpUlhIho=;
 b=qIvaZ/bfhL46wYEBeVNGq4KG7c56dGo1eLU+l1W+7yLB/JaAXsqO4/cqxWL4afa0GS
 WcYnIVHxEtMPNiSQ/Oe6WfASEYv4EhjwHYcgewdHRFQj/msXiSSXfUsKmqyu6pCS6p7L
 w3m8KEck1bkN7sEkTjA1YW6lExk567vMyvC3hj5jBNJddio3BStcI24ELbyWJ5kPbfk0
 Qw/innlBaxU7qnIekPXI21X2z8kRHVYMj18l6us3/U8/9hKwYikZohYvcORNS+1AHgQT
 FLf0idF1huE3EK7JpM7OyF9AqQ5n/+yKsTWurPrG7Y6bpRuF4v7+CARncBq7AD7I94Ta
 J96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730901282; x=1731506082;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iIbwFT4SCUMumif7gepjn5EYZ9GZDHKic5/CpUlhIho=;
 b=Bh5zCDUkoZ5I8VrJkq4MCo3RakZ7fLW9LoOCkZmAlqurmomoCeiwAY8oVuL7FuOAg6
 RvzzR8VLEQV6vKaolBJJZK0/YGR8/Y/vhbI0g9VspX5Bftb9vPp9WSsogH7FyHx3zrgA
 ctj533Zd0F0RR5brL1qQv06zoK/f/x7wV7bCeqiZe7araMHuVfrPwVTMysPoQURD91+s
 bckAQAZ8P1UQ6jH/Tqf9C+KexWNhYuwoMswFlJ7EGAcNZDKNuD/vYgQM8dpZlxRmZDSg
 0g6g5vCsAi3IDMASHSvVTfOi/zzzMn7wFKa8Fpc9DZ7ziwnJ0Sb47ZBwqBDTaVuO2lmh
 UKJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM5p6zl2QVuOfN0VxnZXoOEoLTDJlsO/6/BvVjfVplraYuFeQfzqmM/ZrkizmdE22fcLsx05U2fZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0VrGt2FAox+B/ONGu4ob+LVbgXH1vtkoiYVQuMtZWPNZNU7IL
 mR1nDWJaDXJ2VVp/6ginHEPv6Fx1LTEbC5cbBKkvFMMG7RysHFyKzPN1vXnkqvI=
X-Google-Smtp-Source: AGHT+IExlp14LamzJibkBVml6vvGyDOOLZgznO+UzTiI8EtaITHrO3KHcV9jCeTx8IkfVkzBkZKxZQ==
X-Received: by 2002:a05:600c:1c06:b0:430:57e8:3c7e with SMTP id
 5b1f17b1804b1-4328327e00cmr193973875e9.28.1730901281787; 
 Wed, 06 Nov 2024 05:54:41 -0800 (PST)
Received: from [172.16.23.252] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116ae82sm19172284f8f.93.2024.11.06.05.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 05:54:41 -0800 (PST)
Message-ID: <881f2820-ff18-4d60-8bf3-f8cca1be5914@linaro.org>
Date: Wed, 6 Nov 2024 14:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller
 bridge
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-2-heiko@sntech.de>
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
In-Reply-To: <20241106123304.422854-2-heiko@sntech.de>
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

Hi,

On 06/11/2024 13:33, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> DSI2 host controller, based on the Rockchip version from the driver
> rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
> 
> While the driver is heavily modelled after the previous IP, the register
> set of this DSI2 controller is completely different and there are also
> additional properties like the variable-width phy interface.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/gpu/drm/bridge/synopsys/Kconfig       |    6 +
>   drivers/gpu/drm/bridge/synopsys/Makefile      |    1 +
>   .../gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 1034 +++++++++++++++++
>   include/drm/bridge/dw_mipi_dsi2.h             |   94 ++
>   4 files changed, 1135 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
>   create mode 100644 include/drm/bridge/dw_mipi_dsi2.h
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
> index ca416dab156d..f3ab2f985f8c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> @@ -59,3 +59,9 @@ config DRM_DW_MIPI_DSI
>   	select DRM_KMS_HELPER
>   	select DRM_MIPI_DSI
>   	select DRM_PANEL_BRIDGE
> +
> +config DRM_DW_MIPI_DSI2
> +	tristate
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
> index 9869d9651ed1..9dc376d220ad 100644
> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_DW_HDMI_CEC) += dw-hdmi-cec.o
>   obj-$(CONFIG_DRM_DW_HDMI_QP) += dw-hdmi-qp.o
>   
>   obj-$(CONFIG_DRM_DW_MIPI_DSI) += dw-mipi-dsi.o
> +obj-$(CONFIG_DRM_DW_MIPI_DSI2) += dw-mipi-dsi2.o
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> new file mode 100644
> index 000000000000..43738fe3cb93
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> @@ -0,0 +1,1034 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2024, Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * Modified by Heiko Stuebner <heiko.stuebner@cherry.de>
> + * This generic Synopsys DesignWare MIPI DSI2 host driver is based on the
> + * Rockchip version from rockchip/dw-mipi-dsi2.c converted to use bridge APIs.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/bridge/dw_mipi_dsi2.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +#define UPDATE(v, h, l)			(((v) << (l)) & GENMASK((h), (l)))

I'm not super fan of this macro, overall I thinkg you should switch to
regmap and make use of regmap_update_bits and drop dsi2_write/read wrappers
to readl/writel.

> +
> +#define DSI2_PWR_UP			0x000c
> +#define RESET				0
> +#define POWER_UP			BIT(0)
> +#define CMD_TX_MODE(x)			UPDATE(x,  24,  24)
> +#define DSI2_SOFT_RESET			0x0010
> +#define SYS_RSTN			BIT(2)
> +#define PHY_RSTN			BIT(1)
> +#define IPI_RSTN			BIT(0)
> +#define INT_ST_MAIN			0x0014
> +#define DSI2_MODE_CTRL			0x0018
> +#define DSI2_MODE_STATUS		0x001c
> +#define DSI2_CORE_STATUS		0x0020
> +#define PRI_RD_DATA_AVAIL		BIT(26)
> +#define PRI_FIFOS_NOT_EMPTY		BIT(25)
> +#define PRI_BUSY			BIT(24)
> +#define CRI_RD_DATA_AVAIL		BIT(18)
> +#define CRT_FIFOS_NOT_EMPTY		BIT(17)
> +#define CRI_BUSY			BIT(16)
> +#define IPI_FIFOS_NOT_EMPTY		BIT(9)
> +#define IPI_BUSY			BIT(8)
> +#define CORE_FIFOS_NOT_EMPTY		BIT(1)
> +#define CORE_BUSY			BIT(0)
> +#define MANUAL_MODE_CFG			0x0024
> +#define MANUAL_MODE_EN			BIT(0)
> +#define DSI2_TIMEOUT_HSTX_CFG		0x0048
> +#define TO_HSTX(x)			UPDATE(x, 15, 0)
> +#define DSI2_TIMEOUT_HSTXRDY_CFG	0x004c
> +#define TO_HSTXRDY(x)			UPDATE(x, 15, 0)
> +#define DSI2_TIMEOUT_LPRX_CFG		0x0050
> +#define TO_LPRXRDY(x)			UPDATE(x, 15, 0)
> +#define DSI2_TIMEOUT_LPTXRDY_CFG	0x0054
> +#define TO_LPTXRDY(x)			UPDATE(x, 15, 0)
> +#define DSI2_TIMEOUT_LPTXTRIG_CFG	0x0058
> +#define TO_LPTXTRIG(x)			UPDATE(x, 15, 0)
> +#define DSI2_TIMEOUT_LPTXULPS_CFG	0x005c
> +#define TO_LPTXULPS(x)			UPDATE(x, 15, 0)
> +#define DSI2_TIMEOUT_BTA_CFG		0x60
> +#define TO_BTA(x)			UPDATE(x, 15, 0)
> +

<snip>

> +
> +static struct dw_mipi_dsi2 *
> +__dw_mipi_dsi2_probe(struct platform_device *pdev,
> +		     const struct dw_mipi_dsi2_plat_data *plat_data)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *apb_rst;
> +	struct dw_mipi_dsi2 *dsi2;
> +	int ret;
> +
> +	dsi2 = devm_kzalloc(dev, sizeof(*dsi2), GFP_KERNEL);
> +	if (!dsi2)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dsi2->dev = dev;
> +	dsi2->plat_data = plat_data;
> +
> +	if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
> +	    !plat_data->phy_ops->get_timing)
> +		return dev_err_ptr_probe(dev, -ENODEV, "Phy not properly configured\n");
> +
> +	if (!plat_data->base) {
> +		dsi2->base = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(dsi2->base))
> +			return ERR_PTR(-ENODEV);
> +	} else {
> +		dsi2->base = plat_data->base;
> +	}
> +
> +	dsi2->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(dsi2->pclk))
> +		return dev_err_cast_probe(dev, dsi2->pclk, "Unable to get pclk\n");
> +
> +	dsi2->sys_clk = devm_clk_get(dev, "sys");
> +	if (IS_ERR(dsi2->sys_clk))
> +		return dev_err_cast_probe(dev, dsi2->sys_clk, "Unable to get sys_clk\n");
> +
> +	/*
> +	 * Note that the reset was not defined in the initial device tree, so
> +	 * we have to be prepared for it not being found.
> +	 */
> +	apb_rst = devm_reset_control_get_optional_exclusive(dev, "apb");
> +	if (IS_ERR(apb_rst))
> +		return dev_err_cast_probe(dev, apb_rst, "Unable to get reset control\n");
> +
> +	if (apb_rst) {
> +		ret = clk_prepare_enable(dsi2->pclk);
> +		if (ret) {
> +			dev_err(dev, "%s: Failed to enable pclk\n", __func__);
> +			return ERR_PTR(ret);
> +		}
> +
> +		reset_control_assert(apb_rst);
> +		usleep_range(10, 20);
> +		reset_control_deassert(apb_rst);
> +
> +		clk_disable_unprepare(dsi2->pclk);
> +	}
> +
> +	pm_runtime_enable(dev);
> +
> +	dsi2->dsi_host.ops = &dw_mipi_dsi2_host_ops;
> +	dsi2->dsi_host.dev = dev;
> +	ret = mipi_dsi_host_register(&dsi2->dsi_host);
> +	if (ret) {
> +		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
> +		pm_runtime_disable(dev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	dsi2->bridge.driver_private = dsi2;
> +	dsi2->bridge.funcs = &dw_mipi_dsi2_bridge_funcs;
> +	dsi2->bridge.of_node = pdev->dev.of_node;
> +
> +	return dsi2;
> +}
> +
> +static void __dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2)
> +{
> +	mipi_dsi_host_unregister(&dsi2->dsi_host);
> +
> +	pm_runtime_disable(dsi2->dev);
> +}
> +
> +/*
> + * Probe/remove API, used from platforms based on the DRM bridge API.
> + */
> +struct dw_mipi_dsi2 *
> +dw_mipi_dsi2_probe(struct platform_device *pdev,
> +		   const struct dw_mipi_dsi2_plat_data *plat_data)
> +{
> +	return __dw_mipi_dsi2_probe(pdev, plat_data);
> +}
> +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_probe);
> +
> +void dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2)
> +{
> +	__dw_mipi_dsi2_remove(dsi2);
> +}
> +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_remove);

Since it's not use yet, you should probably drop those since it's dead
code.

> +
> +/*
> + * Bind/unbind API, used from platforms based on the component framework.
> + */
> +int dw_mipi_dsi2_bind(struct dw_mipi_dsi2 *dsi2, struct drm_encoder *encoder)
> +{
> +	return drm_bridge_attach(encoder, &dsi2->bridge, NULL, 0);
> +}
> +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_bind);
> +
> +void dw_mipi_dsi2_unbind(struct dw_mipi_dsi2 *dsi2)
> +{
> +}
> +EXPORT_SYMBOL_GPL(dw_mipi_dsi2_unbind);
> +
> +MODULE_AUTHOR("Guochun Huang <hero.huang@rock-chips.com>");
> +MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@cherry.de>");
> +MODULE_DESCRIPTION("DW MIPI DSI2 host controller driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:dw-mipi-dsi2");
> diff --git a/include/drm/bridge/dw_mipi_dsi2.h b/include/drm/bridge/dw_mipi_dsi2.h
> new file mode 100644
> index 000000000000..ef5479b35028
> --- /dev/null
> +++ b/include/drm/bridge/dw_mipi_dsi2.h
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024, Fuzhou Rockchip Electronics Co., Ltd
> + *
> + * Authors: Guochun Huang <hero.huang@rock-chips.com>
> + *          Heiko Stuebner <heiko.stuebner@cherry.de>
> + */
> +
> +#ifndef __DW_MIPI_DSI2__
> +#define __DW_MIPI_DSI2__
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_modes.h>
> +
> +struct drm_display_mode;
> +struct drm_encoder;
> +struct dw_mipi_dsi2;
> +struct mipi_dsi_device;
> +struct platform_device;
> +
> +enum dw_mipi_dsi2_phy_type {
> +	DW_MIPI_DSI2_DPHY,
> +	DW_MIPI_DSI2_CPHY,
> +};
> +
> +struct dw_mipi_dsi2_phy_iface {
> +	int ppi_width;
> +	enum dw_mipi_dsi2_phy_type phy_type;
> +};
> +
> +struct dw_mipi_dsi2_phy_timing {
> +	u32 data_hs2lp;
> +	u32 data_lp2hs;
> +};
> +
> +struct dw_mipi_dsi2_phy_ops {
> +	int (*init)(void *priv_data);
> +	void (*power_on)(void *priv_data);
> +	void (*power_off)(void *priv_data);
> +	void (*get_interface)(void *priv_data, struct dw_mipi_dsi2_phy_iface *iface);
> +	int (*get_lane_mbps)(void *priv_data,
> +			     const struct drm_display_mode *mode,
> +			     unsigned long mode_flags, u32 lanes, u32 format,
> +			     unsigned int *lane_mbps);
> +	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
> +			  struct dw_mipi_dsi2_phy_timing *timing);
> +	int (*get_esc_clk_rate)(void *priv_data, unsigned int *esc_clk_rate);
> +};
> +
> +struct dw_mipi_dsi2_host_ops {
> +	int (*attach)(void *priv_data,
> +		      struct mipi_dsi_device *dsi);
> +	int (*detach)(void *priv_data,
> +		      struct mipi_dsi_device *dsi);
> +};
> +
> +struct dw_mipi_dsi2_plat_data {
> +	void __iomem *base;
> +	unsigned int max_data_lanes;
> +
> +	enum drm_mode_status (*mode_valid)(void *priv_data,
> +					   const struct drm_display_mode *mode,
> +					   unsigned long mode_flags,
> +					   u32 lanes, u32 format);
> +
> +	bool (*mode_fixup)(void *priv_data, const struct drm_display_mode *mode,
> +			   struct drm_display_mode *adjusted_mode);
> +
> +	u32 *(*get_input_bus_fmts)(void *priv_data,
> +				   struct drm_bridge *bridge,
> +				   struct drm_bridge_state *bridge_state,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state,
> +				   u32 output_fmt,
> +				   unsigned int *num_input_fmts);
> +
> +	const struct dw_mipi_dsi2_phy_ops *phy_ops;
> +	const struct dw_mipi_dsi2_host_ops *host_ops;
> +
> +	void *priv_data;
> +};
> +
> +struct dw_mipi_dsi2 *dw_mipi_dsi2_probe(struct platform_device *pdev,
> +					const struct dw_mipi_dsi2_plat_data *plat_data);
> +void dw_mipi_dsi2_remove(struct dw_mipi_dsi2 *dsi2);
> +int dw_mipi_dsi2_bind(struct dw_mipi_dsi2 *dsi2, struct drm_encoder *encoder);
> +void dw_mipi_dsi2_unbind(struct dw_mipi_dsi2 *dsi2);
> +
> +#endif /* __DW_MIPI_DSI2__ */

Overall the driver is very close to dw-mipi-dsi, si it's overall good!

Thanks,
Neil
