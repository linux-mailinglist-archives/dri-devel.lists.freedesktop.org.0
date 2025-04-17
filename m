Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E21A921BA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC06210EB3F;
	Thu, 17 Apr 2025 15:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JgAOZhTv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4910EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:33:23 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so704437f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744904002; x=1745508802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HJU0YKLI3O3XfSZX1Z7o87cRZxiutDHxVPjCfrI5PcM=;
 b=JgAOZhTv9WDg6ToJ6LtmHDX14twW7Zh8wVyVyM4LCj8e1ho9jNjbyEvfuJqAYoJYQq
 7d7+T/5QEPycV6AU+Sk3fAxt27NDY9BAglml+Ia+sXwbSJENry2HQquox0i8Bd3GMOyZ
 nfqVATmZxxoTpLwn1IE/klEcQ9kMOMdCMO0NcuQ4k9bCVgtWhh5Xsjnun2lC3EHmpqn6
 +VXM9Ze1RxrB455Tk+yKddOeKFrUEpCgJK2s1rLCGZBX7R5b/+5NyvJXDhxLg0Jpl7m8
 NP5cweNkb5K5XMyJUsa+zTJUOiwlO0GzCZaJ4qxwJXSeuWkVxyWj8eZsUJPEJFZjDLFG
 36zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744904002; x=1745508802;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HJU0YKLI3O3XfSZX1Z7o87cRZxiutDHxVPjCfrI5PcM=;
 b=A5H1ZEOCobBoIJi2K2FLuHcTGANU51J7ny29GoKttp272MX+FuR6aLHBD7SDzJD2E9
 frlY1kbHGNPc2NBe247/9LNjsv/Iiy0StYvSj+05flo0OROPam1YEl7zL9Yx5TuOmwx7
 YS7pYUnLymQU0HBIdYQpuzlklcw5NvWhxUENlhEYxPNQmVNGMM0V1+sN1N1GDjFmFjY3
 FBbSjMWjr9KKE/S9c443VJhtoLs/MOKBNeLmhDJw78tMCa/+laPzdylY8kl46nbiiicx
 Jk8dzz0Eju5KNqt2mG2nnUJS/5PZEu5JK1LbpusU7ipmHQsKZ3EIs5/uhmI1zcpxZaAL
 IJpA==
X-Gm-Message-State: AOJu0YyjKlBGNT0Rtf7GdjMonItXdVAU2UeKi7gxAcbiOLpdryQOIC4R
 OV7uRngnj8q0c5bogggpqdfQohuD846XEEXcW5zBVuuPwi6g4I7myOVWJIPaQpTncJSOVlkzILl
 g
X-Gm-Gg: ASbGncu1GTjiS32Pzl9fuFJIU1cRXqbNWhbcvqOA11TNM28Hc0I+E58Ge/Mr1ZHYtSo
 Wiuns2FYMX7pZ74PfBlhgcMliaUWQ1LzjoKsMn/Ncm4yTddBkHVTs3RPNoSbQ2hJsyIhjFoL6Kh
 ha9bxmgXzh86Pmr5wn/TTYUTfi08sO3Bl82srnRtdDutjdyn7RWnxTg7esnR7LYQMoiEmDOI6t3
 ml1Yhr9Rw5HFnlkJ8X0pW/lC3llcHudpLBIRO6dM4dQbJXQNWvdVu/RHCtuvvYD2rzcHfzkJj5W
 SseLde3/c3WuzGDp/b31QQHBYJ3gNVLgahIKiCwIrGxj8XMvrwNC0CooSLv174/x5Y1Xj7s6LqA
 ddoOJeINrYOZOGLA=
X-Google-Smtp-Source: AGHT+IHl/iJqSPWLXHFLfXn1RWvFeEQD5851u9lh41q0RF/5itUaj3iomTMY3WyXh953wOfL5h54rA==
X-Received: by 2002:a05:6000:144f:b0:39c:1257:ccae with SMTP id
 ffacd0b85a97d-39ee5ba01e5mr6361648f8f.57.1744904002001; 
 Thu, 17 Apr 2025 08:33:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546?
 ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9640fdsm20429438f8f.7.2025.04.17.08.33.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:33:21 -0700 (PDT)
Message-ID: <422dd45d-dab3-4bff-a0c2-669deb6d081d@linaro.org>
Date: Thu, 17 Apr 2025 17:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/2] drm/panel: Add Visionox G2647FB105 panel driver
To: Alexander Baransky <sanyapilot496@gmail.com>, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414172637.197792-1-sanyapilot496@gmail.com>
 <20250414172637.197792-3-sanyapilot496@gmail.com>
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
In-Reply-To: <20250414172637.197792-3-sanyapilot496@gmail.com>
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

On 14/04/2025 19:26, Alexander Baransky wrote:
> Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
> support found in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
> 
> Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-visionox-g2647fb105.c | 280 ++++++++++++++++++
>   3 files changed, 290 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index e059b06e0239..8b73f1e8bef4 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -996,6 +996,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>   	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>   	  Video Mode panel
>   
> +config DRM_PANEL_VISIONOX_G2647FB105
> +	tristate "Visionox G2647FB105"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Visionox
> +	  G2647FB105 (2340x1080@60Hz) AMOLED DSI cmd mode panel.
> +
>   config DRM_PANEL_VISIONOX_R66451
>   	tristate "Visionox R66451"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 1bb8ae46b59b..911400bca51a 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -101,6 +101,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM692E5) += panel-visionox-rm692e5.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> new file mode 100644
> index 000000000000..413849f7b4de
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + *   Copyright (c) 2025, Alexander Baransky <sanyapilot496@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct visionox_g2647fb105 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +};
> +
> +static const struct regulator_bulk_data visionox_g2647fb105_supplies[] = {
> +	{ .supply = "vdd3p3" },
> +	{ .supply = "vddio" },
> +	{ .supply = "vsn" },
> +	{ .supply = "vsp" },
> +};
> +
> +static inline
> +struct visionox_g2647fb105 *to_visionox_g2647fb105(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_g2647fb105, panel);
> +}
> +
> +static void visionox_g2647fb105_reset(struct visionox_g2647fb105 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int visionox_g2647fb105_on(struct visionox_g2647fb105 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xdd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_g2647fb105_off(struct visionox_g2647fb105 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_g2647fb105_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	visionox_g2647fb105_reset(ctx);
> +
> +	ret = visionox_g2647fb105_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int visionox_g2647fb105_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = visionox_g2647fb105_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(visionox_g2647fb105_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode visionox_g2647fb105_mode = {
> +	.clock = (1080 + 28 + 4 + 36) * (2340 + 8 + 4 + 4) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 28,
> +	.hsync_end = 1080 + 28 + 4,
> +	.htotal = 1080 + 28 + 4 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 8,
> +	.vsync_end = 2340 + 8 + 4,
> +	.vtotal = 2340 + 8 + 4 + 4,
> +	.width_mm = 69,
> +	.height_mm = 149,
> +};
> +
> +static int visionox_g2647fb105_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &visionox_g2647fb105_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_g2647fb105_panel_funcs = {
> +	.prepare = visionox_g2647fb105_prepare,
> +	.unprepare = visionox_g2647fb105_unprepare,
> +	.get_modes = visionox_g2647fb105_get_modes,
> +};
> +
> +static int visionox_g2647fb105_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops visionox_g2647fb105_bl_ops = {
> +	.update_status = visionox_g2647fb105_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +visionox_g2647fb105_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 1023,
> +		.max_brightness = 2047,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &visionox_g2647fb105_bl_ops, &props);
> +}
> +
> +static int visionox_g2647fb105_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_g2647fb105 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(visionox_g2647fb105_supplies),
> +					    visionox_g2647fb105_supplies,
> +					    &ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_g2647fb105_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = visionox_g2647fb105_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void visionox_g2647fb105_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_g2647fb105 *ctx = mipi_dsi_get_drvdata(dsi);
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id visionox_g2647fb105_of_match[] = {
> +	{ .compatible = "visionox,g2647fb105" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, visionox_g2647fb105_of_match);
> +
> +static struct mipi_dsi_driver visionox_g2647fb105_driver = {
> +	.probe = visionox_g2647fb105_probe,
> +	.remove = visionox_g2647fb105_remove,
> +	.driver = {
> +		.name = "panel-visionox-g2647fb105",
> +		.of_match_table = visionox_g2647fb105_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(visionox_g2647fb105_driver);
> +
> +MODULE_AUTHOR("Alexander Baransky <sanyapilot496@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for Visionox G2647FB105 AMOLED DSI panel");
> +MODULE_LICENSE("GPL");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
