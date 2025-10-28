Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE8C131C8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 07:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5874410E58E;
	Tue, 28 Oct 2025 06:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fRFEmSph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5460410E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 06:21:51 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-78125ed4052so6551790b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 23:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761632511; x=1762237311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NgHMpwlHuOnBpxm0zPc6SCzN8kyKP0e1eTZTOVapBjY=;
 b=fRFEmSphHRUedwjQSYD2d5mb+UHoXJuO0u8ySR+sQdRR5mqVk2sx4BZB/S8FHuRY4o
 xXdXtgTdbp0BMof9rpw0pp2H2K9pLJwU8MqiddtfzDdMWyP3Urr7Xaeng61G5saeY2y3
 TBTSipKcr8RYW55njWCRRSB1M1noxcdj7fT0n8bj8YGk/J8gT4ykhocnV5gXsTmyvdqi
 lv7q3SJ5X7VMROxEaPB3EqnGMWCarcT/Rz21oEmnzxdD5AZPNVDlZkh3bvsi7MjKzTOk
 ll48w0l0jmwovHWzo/UEjKfTOK2R/xQriTH9A5xJLbJMOJqwzxlIU7dq6vhnyxIvxEwx
 VNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632511; x=1762237311;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NgHMpwlHuOnBpxm0zPc6SCzN8kyKP0e1eTZTOVapBjY=;
 b=tWi3D8+cKG/4i1WZ3JehSUq0E6HJkwWSqQjPy6S8Ov55eFQNo/RIwCK+BDyyLTZZNu
 WJFyYbyyKv9GisgCJw/Psmr9g+LL7+nZzfJIChakg9e0tUsemaK1+3pxS/uIBHuk9D6i
 80CpuvIbzrM6ZZBCDpqVN5Z6Z8jxUcO19eEH+pd/0y9c2rkanHelI6lOzn3k5TVpm+gz
 R+v/t5vpAfq0Kj68pUiGLWAzT2vUbwSjiGBYGK3E7Bep2kV69jiXJRYU62HT3sbxeAse
 cS2QN15bcX7FHkTeB2tp57f6Xo1eT5ifidFWnCfiK8HSkaUqDJMQ2YDLo5uIEs6Tr35M
 /OjA==
X-Gm-Message-State: AOJu0YypiurYzXryPcgYY4poFDC1twhHbzhJsOyQ9TCVHIqy7b0klcEX
 hL34hxUtOD9o/sTZ9m8HHwMonL1QLpDfu63TjYLu/xh+MOr5usaG/JTU
X-Gm-Gg: ASbGnctJs2g5y2SWZ460rTXGM6z4dat0PSp84lXIcvGv1XrZUodIe/FuI5QV8UuiBUa
 DxcdBSK1JCDhtxDupvjX82anW/tOh2eU8l3zaLvW7qRKCg6sQsoaN/LTFaJ5Ozc8eTGb5MD/4Y2
 9v5sLp/ymmPw5bJwjSt+X6RGqSTfbDG5W9D96YX/BVz4PIhxpLOpCXQQy65nuwNzGP1r3WhNzt8
 gz8jbTuNeeb3j7IKY5UZiPYI5NPPa/a1H9P6lwH9OxQG74RfRab/KNjbtJIiKM4uU9V7wN32x5h
 yQOWdkndp9e5Kz9t2LB/0SDlzY+4vZPXYlP2wapLF170atJgFc+P7iEnBAopWoTtiTugy/+2l/6
 JOluFJpoc/Xx6RwvKEyKAzSBLM2TvTQtGu2MRQI8Ubu4RcbV1LJIazZAE889IKnlAV9wXh79k31
 y6+dvvHmTkUUjPM7+fj3aZapRkBSwNU/zeBYS6Q1xG1Pr2FpOR6Pt+OQ==
X-Google-Smtp-Source: AGHT+IGBe3e5+Mtkfl/Q5HRfo/InytwOscDVZQTNvh7VoFAM12l0xIciWr8qOhdytoE0iNFahacqjw==
X-Received: by 2002:a05:6a00:1907:b0:7a2:83f2:4989 with SMTP id
 d2e1a72fcca58-7a441bc89c9mr3091499b3a.5.1761632510687; 
 Mon, 27 Oct 2025 23:21:50 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:1c69:7897:d90:375b?
 ([2600:8802:702:7400:1c69:7897:d90:375b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012bf4sm10509547b3a.1.2025.10.27.23.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 23:21:50 -0700 (PDT)
Message-ID: <04a39c10-6279-45f9-ad4c-26f959422035@gmail.com>
Date: Mon, 27 Oct 2025 23:21:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
 <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <20251023-s6e3fc2x01-v5-2-8f8852e67417@ixit.cz>
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

On 10/23/2025 1:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> by OnePlus 6T device-tree.
> The reason is because DDIC itself without knowing the panel type used
> with it will not give the driver enough information about the panel used,
> as the panel cannot be autodetected.
> While would be more practical to support the original compatible,
> I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> 
> Based on work of:
>    Casey Connolly <casey@connolly.tech>
>    Joel Selvaraj <foss@joelselvaraj.com>
>    Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Jessica Zhang <jesszhan0024@gmail.com>

> ---
>   MAINTAINERS                                      |   1 +
>   drivers/gpu/drm/panel/Kconfig                    |  13 +
>   drivers/gpu/drm/panel/Makefile                   |   1 +
>   drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 385 +++++++++++++++++++++++
>   4 files changed, 400 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42be36b42c29b..a3296756f5ca3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8065,6 +8065,7 @@ DRM DRIVER FOR SAMSUNG S6E3FC2X01 DDIC
>   M:	David Heidelberg <david@ixit.cz>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
>   
>   DRM DRIVER FOR SAMSUNG S6E3HA8 PANELS
>   M:	Dzmitry Sankouski <dsankouski@gmail.com>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 045ffb2ccd0f0..fadb7f397837e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -801,6 +801,19 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
>   	select DRM_MIPI_DSI
>   	select VIDEOMODE_HELPERS
>   
> +config DRM_PANEL_SAMSUNG_S6E3FC2X01
> +	tristate "Samsung S6E3FC2X01 DSI panel controller"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the
> +	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.
> +	  Currently supported panels:
> +
> +	    Samsung AMS641RW (found in the OnePlus 6T smartphone)
> +
>   config DRM_PANEL_SAMSUNG_S6E3HA2
>   	tristate "Samsung S6E3HA2 DSI video mode panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 0356775a443ad..ae56f64982cfb 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -79,6 +79,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FC2X01) += panel-samsung-s6e3fc2x01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA8) += panel-samsung-s6e3ha8.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
> new file mode 100644
> index 0000000000000..e63080204af77
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Nia Espera <a5b6@riseup.net>
> + * Copyright (c) 2025 David Heidelberg <david@ixit.cz>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/swab.h>
> +#include <linux/backlight.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define MCS_ELVSS_ON            0xb1
> +
> +struct samsung_s6e3fc2x01 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data s6e3fc2x01_supplies[] = {
> +	{ .supply = "vddio" },
> +	{ .supply = "vci" },
> +	{ .supply = "poc" },
> +};
> +
> +static inline
> +struct samsung_s6e3fc2x01 *to_samsung_s6e3fc2x01(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct samsung_s6e3fc2x01, panel);
> +}
> +
> +#define s6e3fc2x01_test_key_on_lvl1(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0xa5, 0xa5)
> +#define s6e3fc2x01_test_key_off_lvl1(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x9f, 0x5a, 0x5a)
> +#define s6e3fc2x01_test_key_on_lvl2(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
> +#define s6e3fc2x01_test_key_off_lvl2(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
> +#define s6e3fc2x01_test_key_on_lvl3(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
> +#define s6e3fc2x01_test_key_off_lvl3(ctx) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
> +
> +static void s6e3fc2x01_reset(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +}
> +
> +static int s6e3fc2x01_on(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x0a);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x01);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 15000, 16000);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x0f);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xeb, 0x17,
> +					       0x41, 0x92,
> +					       0x0e, 0x10,
> +					       0x82, 0x5a);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	/* Column & Page Address Setting */
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 0x0437);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0923);
> +
> +	/* Horizontal & Vertical sync Setting */
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x10, 0x30);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl3(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x67);
> +	s6e3fc2x01_test_key_off_lvl3(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x12);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0x00, 0x01);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x00, 0xc1);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x78);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x90);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0xc6, 0x00, 0x00,
> +				     0x21, 0xed, 0x02, 0x08, 0x06, 0xc1, 0x27,
> +				     0xfc, 0xdc, 0xe4, 0x00, 0xd9, 0xe6, 0xe7,
> +				     0x00, 0xfc, 0xff, 0xea);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MCS_ELVSS_ON, 0x00, 0x00);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e3fc2x01_enable(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e3fc2x01_off(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	s6e3fc2x01_test_key_on_lvl1(&dsi_ctx);
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x82);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 16000, 17000);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_off_lvl1(&dsi_ctx);
> +
> +	s6e3fc2x01_test_key_on_lvl2(&dsi_ctx);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x01);
> +	s6e3fc2x01_test_key_off_lvl2(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 160);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e3fc2x01_disable(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +
> +	s6e3fc2x01_off(ctx);
> +
> +	return 0;
> +}
> +
> +static int s6e3fc2x01_prepare(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	s6e3fc2x01_reset(ctx);
> +
> +	ret = s6e3fc2x01_on(ctx);
> +	if (ret < 0) {
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6e3fc2x01_unprepare(struct drm_panel *panel)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = to_samsung_s6e3fc2x01(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(s6e3fc2x01_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode ams641rw_mode = {
> +	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 72,
> +	.hsync_end = 1080 + 72 + 16,
> +	.htotal = 1080 + 72 + 16 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 32,
> +	.vsync_end = 2340 + 32 + 4,
> +	.vtotal = 2340 + 32 + 4 + 18,
> +	.width_mm = 68,
> +	.height_mm = 145,
> +};
> +
> +static int s6e3fc2x01_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &ams641rw_mode);
> +}
> +
> +static const struct drm_panel_funcs samsung_s6e3fc2x01_panel_funcs = {
> +	.prepare = s6e3fc2x01_prepare,
> +	.enable = s6e3fc2x01_enable,
> +	.disable = s6e3fc2x01_disable,
> +	.unprepare = s6e3fc2x01_unprepare,
> +	.get_modes = s6e3fc2x01_get_modes,
> +};
> +
> +static int s6e3fc2x01_panel_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int err;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (err < 0)
> +		return err;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops s6e3fc2x01_panel_bl_ops = {
> +	.update_status = s6e3fc2x01_panel_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +s6e3fc2x01_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_PLATFORM,
> +		.brightness = 512,
> +		.max_brightness = 1023,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &s6e3fc2x01_panel_bl_ops, &props);
> +}
> +
> +static int s6e3fc2x01_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct samsung_s6e3fc2x01 *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct samsung_s6e3fc2x01, panel,
> +				   &samsung_s6e3fc2x01_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(s6e3fc2x01_supplies),
> +					    s6e3fc2x01_supplies,
> +					    &ctx->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +
> +	/* keep the display on for flicker-free experience */
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
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
> +	ctx->panel.backlight = s6e3fc2x01_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void s6e3fc2x01_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct samsung_s6e3fc2x01 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +
> +static struct mipi_dsi_driver s6e3fc2x01_driver = {
> +	.probe = s6e3fc2x01_probe,
> +	.remove = s6e3fc2x01_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e3fc2x01",
> +		.of_match_table = s6e3fc2x01_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e3fc2x01_driver);
> +
> +MODULE_AUTHOR("David Heidelberg <david@ixit.cz>");
> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FC2X01 DDIC");
> +MODULE_LICENSE("GPL");
> 

