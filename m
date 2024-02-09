Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A344A8500A9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 00:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132310FF7E;
	Fri,  9 Feb 2024 23:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ctn8XT0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEE410FF7E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 23:17:35 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-68c8790aeadso10540436d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 15:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707520655; x=1708125455; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I9DwdqAC/vEyGVgFl5z1ZS2lAeEjC8i0b/6JcFCb+wE=;
 b=ctn8XT0Sy5b7l2sF2G8zGUklLkHTUELot8WUwPQ4HZRXV0xYk04QTybbY8IVpknccn
 4PceCritIottt983emUFRwgwf+1b2ErBziWr1IOBRS/xAPDcbXy8pHmbU2mQmapEc/Lo
 pnmx1UXBdHqXLUTC1IZwrSJiayfoI2Z6PE74NhDK2HxcVQu5J5Vu81bqsqjDJsIZbBQ4
 leFlJBnD4LJRqXGPfUi3iu8SYgrBy2W0eQYT0++YGcRRzZoa5XCrgPs0f0AU4y3I0YQy
 vnU+2EOPyd4YZTuFDUqmENYZl5lruEH9lwZ701xyDLlPF6hQegVTrSaV4OJVDbE+GTxm
 Z9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707520655; x=1708125455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9DwdqAC/vEyGVgFl5z1ZS2lAeEjC8i0b/6JcFCb+wE=;
 b=n3COQhrAncV+OGMmZaltSUHxLxgpKr3LYrbkzsg10+YxLqrxu1RzJr9AAwVn3ffy14
 QFTI6sSxNGpOchkHPqRLwNgQDi3vVGO5IcsPccQWT/HTswtIp0EM+X/s0zJfo8TwlR89
 x8b00HaXtfCpA6xHpgCxlJ7FPY1V61tnhnqlBDh5ru8MHvi3wydnwN2SA2n1OzT7yoPj
 1WUoeN7Mt9EfESKzGSdfHCLnY63ON6lExto9v5rx4o9VUmxUx5v6Mi3KMCgKVW/mpgo8
 QKMxRFqkEJaZKYecEq4pkgiTQxMMzRmDwMVYPX8Y/zBDBXEepbe13LO1AzpkxGhKCI3q
 lZww==
X-Gm-Message-State: AOJu0YwUU3GRP9dBlIGj86U34Fm3WSvLdnJiGl80xRSKCfBFJBEmpD7c
 uPQQKE5BHe3KXB7G0oDr5NH0T8GBhHb0jiRxhsPsp2znVbE5ay3Z
X-Google-Smtp-Source: AGHT+IGxSvvF3nIpebl6SRF2ux+aEAg341MJOiuIAQNe2aD4hmqGRun9ClAjiolLiylofuxasL1BTQ==
X-Received: by 2002:a0c:e3cc:0:b0:68c:ae97:5d2e with SMTP id
 e12-20020a0ce3cc000000b0068cae975d2emr652505qvl.35.1707520654642; 
 Fri, 09 Feb 2024 15:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNNIANMRa0Xy9jaA60TpdY8KpI8WY66Yj28hQfh53biFF+8Y0GnVlB32EjDMk2gePSdM8CTCyvG62Wxa6TR6YtQQA6QQ1NbLR7zgYqsYZfXIQSlbmzeqSV6WLaND5nGdtWWLfDk+OB+LIUHlxJvdPhP7lqc/WcjgirHcEUtxqJvm2TXVpGjnyCly7MF+KWYwQ6OgPEXMiJuYyVcLhkBwZEO4ILoE5NTijbOgdDY86gpjgaVfsZIGQbi5sXdpER+sKQh1hFXY4fMXCli6OfJrIxT6OqMPCKEvVqsK41q1GAQUhBPezLapbmkNYiHWNv96dq0Jc6DkVx/WAlOIY+cQyrPRzykA8px7aacg8jVtUSXgaYL6lppguhB6FVUKFUlCx7gIPb8BeKkB8RDhw23O+xZ5NTOz1aSaSR+X8E6MBqcfU3so6R1C/oeZ7zXvE1sR0LkaqF4pCYgdUhpurGQ7eJW/IXihMx6aGZotGEm2A5OVyysRbVPavUZeqsuOzQP5y8xxrqOKAALsczs5iVa3J74b1CjMU0VRQEK/Je3BqC
Received: from localhost ([2607:fea8:52a3:d200::42b6])
 by smtp.gmail.com with ESMTPSA id
 lq7-20020a0562145b8700b0068ce5582a04sm90653qvb.80.2024.02.09.15.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 15:17:34 -0800 (PST)
Date: Fri, 9 Feb 2024 18:17:32 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/panel: add samsung s6e3fa7 panel driver
Message-ID: <ZcayjJxSKwprA0y_@radian>
References: <20240209001639.387374-6-mailingradian@gmail.com>
 <20240209001639.387374-8-mailingradian@gmail.com>
 <09ef60d6-8404-4a2f-b2f5-8cd77668e4f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09ef60d6-8404-4a2f-b2f5-8cd77668e4f0@quicinc.com>
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

On Thu, Feb 08, 2024 at 05:34:57PM -0800, Jessica Zhang wrote:
> On 2/8/2024 4:16 PM, Richard Acayan wrote:
>> The S6E3FA7 display controller is enabled in every Pixel 3a (non-XL)
>> variant. Add the driver for it, generated by
>> linux-mdss-dsi-panel-driver-generator.
>> 
>> There are other panels connected to the same S6E3FA7 display controller,
>> such as the AMS604NL01 panel, which are incompatible with this driver.
>> Name the device tree compatible after the panel model according to
>> iFixit.
>> 
>> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
>> Link: https://android.googlesource.com/kernel/msm/+/7fda1cd7b64710dafac5f34899611c6d35eb4cd2/arch/arm64/boot/dts/google/dsi-panel-s6e3fa7-1080p-cmd.dtsi
>> Link: https://github.com/msm8953-mainline/linux/blob/v6.6.12-r0/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> Link: https://www.ifixit.com/Guide/Image/meta/muyjtLQTHu6MDkhK
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>   drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 285 ++++++++++++++++++
>>   3 files changed, 295 insertions(+)
>>   create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> 
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index 8f3783742208..a693b03f680e 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -577,6 +577,15 @@ config DRM_PANEL_SAMSUNG_DB7430
>>   	  DB7430 DPI display controller used in such devices as the
>>   	  LMS397KF04 480x800 DPI panel.
>> +config DRM_PANEL_SAMSUNG_S6E3FA7
>> +	tristate "Samsung S6E3FA7 panel driver"
>> +	depends on OF
>> +	depends on DRM_MIPI_DSI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  Say Y here if you want to enable support for the Samsung S6E3FA7
>> +	  1920x2220 panel.
>> +
>>   config DRM_PANEL_SAMSUNG_S6D16D0
>>   	tristate "Samsung S6D16D0 DSI video mode panel"
>>   	depends on OF
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>> index d94a644d0a6c..560b62129f68 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -59,6 +59,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D27A1) += panel-samsung-s6d27a1.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D7AA0) += panel-samsung-s6d7aa0.o
>> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3FA7) += panel-samsung-s6e3fa7.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2) += panel-samsung-s6e3ha2.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> new file mode 100644
>> index 000000000000..10bc8fb5f1f9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> @@ -0,0 +1,285 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Driver for the Samsung S6E3FA7 panel.
>> + *
>> + * Copyright (c) 2022-2024, The Linux Foundation. All rights reserved.
>
>
> Hi Richard,
>
> Not really sure about the copyright dates -- since this is a completely new
> file to this tree, wouldn't the year be just 2024?

That would be more concise, but the original driver was generated and
added to a kernel fork [1] in 2022 and amendments have been made since then.

[1] https://gitlab.com/sdm670-mainline/linux/-/blob/sdm670-v6.2.6/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c?ref_type=tags

>
> The rest LGTM.
>
> Thanks,
>
> Jessica Zhang
>
>> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
>> + * Copyright (c) 2013, The Linux Foundation. All rights reserved.
>> + */ > +
>> +#include <linux/backlight.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +
>> +#include <video/mipi_display.h>
>> +
>> +#include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_modes.h>
>> +#include <drm/drm_panel.h>
>> +
>> +struct s6e3fa7_panel {
>> +	struct drm_panel panel;
>> +	struct mipi_dsi_device *dsi;
>> +	struct gpio_desc *reset_gpio;
>> +};
>> +
>> +static inline struct s6e3fa7_panel *to_s6e3fa7_panel(struct drm_panel *panel)
>> +{
>> +	return container_of(panel, struct s6e3fa7_panel, panel);
>> +}
>> +
>> +static void s6e3fa7_panel_reset(struct s6e3fa7_panel *ctx)
>> +{
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +	usleep_range(1000, 2000);
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 11000);
>> +}
>> +
>> +static int s6e3fa7_panel_on(struct s6e3fa7_panel *ctx)
>> +{
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>> +		return ret;
>> +	}
>> +	msleep(120);
>> +
>> +	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to set tear on: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>> +	mipi_dsi_dcs_write_seq(dsi, 0xf4,
>> +			       0xbb, 0x23, 0x19, 0x3a, 0x9f, 0x0f, 0x09, 0xc0,
>> +			       0x00, 0xb4, 0x37, 0x70, 0x79, 0x69);
>> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
>> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>> +
>> +	ret = mipi_dsi_dcs_set_display_on(dsi);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to set display on: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int s6e3fa7_panel_prepare(struct drm_panel *panel)
>> +{
>> +	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>> +	struct device *dev = &ctx->dsi->dev;
>> +	int ret;
>> +
>> +	s6e3fa7_panel_reset(ctx);
>> +
>> +	ret = s6e3fa7_panel_on(ctx);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
>> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int s6e3fa7_panel_unprepare(struct drm_panel *panel)
>> +{
>> +	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>> +
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s6e3fa7_panel_disable(struct drm_panel *panel)
>> +{
>> +	struct s6e3fa7_panel *ctx = to_s6e3fa7_panel(panel);
>> +	struct mipi_dsi_device *dsi = ctx->dsi;
>> +	struct device *dev = &dsi->dev;
>> +	int ret;
>> +
>> +	ret = mipi_dsi_dcs_set_display_off(dsi);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to set display off: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>> +		return ret;
>> +	}
>> +	msleep(120);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct drm_display_mode s6e3fa7_panel_mode = {
>> +	.clock = (1080 + 32 + 32 + 78) * (2220 + 32 + 4 + 78) * 60 / 1000,
>> +	.hdisplay = 1080,
>> +	.hsync_start = 1080 + 32,
>> +	.hsync_end = 1080 + 32 + 32,
>> +	.htotal = 1080 + 32 + 32 + 78,
>> +	.vdisplay = 2220,
>> +	.vsync_start = 2220 + 32,
>> +	.vsync_end = 2220 + 32 + 4,
>> +	.vtotal = 2220 + 32 + 4 + 78,
>> +	.width_mm = 62,
>> +	.height_mm = 127,
>> +};
>> +
>> +static int s6e3fa7_panel_get_modes(struct drm_panel *panel,
>> +				 struct drm_connector *connector)
>> +{
>> +	struct drm_display_mode *mode;
>> +
>> +	mode = drm_mode_duplicate(connector->dev, &s6e3fa7_panel_mode);
>> +	if (!mode)
>> +		return -ENOMEM;
>> +
>> +	drm_mode_set_name(mode);
>> +
>> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>> +	connector->display_info.width_mm = mode->width_mm;
>> +	connector->display_info.height_mm = mode->height_mm;
>> +	drm_mode_probed_add(connector, mode);
>> +
>> +	return 1;
>> +}
>> +
>> +static const struct drm_panel_funcs s6e3fa7_panel_funcs = {
>> +	.prepare = s6e3fa7_panel_prepare,
>> +	.unprepare = s6e3fa7_panel_unprepare,
>> +	.disable = s6e3fa7_panel_disable,
>> +	.get_modes = s6e3fa7_panel_get_modes,
>> +};
>> +
>> +static int s6e3fa7_panel_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
>> +	u16 brightness = backlight_get_brightness(bl);
>> +	int ret;
>> +
>> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int s6e3fa7_panel_bl_get_brightness(struct backlight_device *bl)
>> +{
>> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
>> +	u16 brightness;
>> +	int ret;
>> +
>> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return brightness;
>> +}
>> +
>> +static const struct backlight_ops s6e3fa7_panel_bl_ops = {
>> +	.update_status = s6e3fa7_panel_bl_update_status,
>> +	.get_brightness = s6e3fa7_panel_bl_get_brightness,
>> +};
>> +
>> +static struct backlight_device *
>> +s6e3fa7_panel_create_backlight(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	const struct backlight_properties props = {
>> +		.type = BACKLIGHT_RAW,
>> +		.brightness = 1023,
>> +		.max_brightness = 1023,
>> +	};
>> +
>> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
>> +					      &s6e3fa7_panel_bl_ops, &props);
>> +}
>> +
>> +static int s6e3fa7_panel_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct s6e3fa7_panel *ctx;
>> +	int ret;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ctx->reset_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>> +				     "Failed to get reset-gpios\n");
>> +
>> +	ctx->dsi = dsi;
>> +	mipi_dsi_set_drvdata(dsi, ctx);
>> +
>> +	dsi->lanes = 4;
>> +	dsi->format = MIPI_DSI_FMT_RGB888;
>> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
>> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>> +
>> +	drm_panel_init(&ctx->panel, dev, &s6e3fa7_panel_funcs,
>> +		       DRM_MODE_CONNECTOR_DSI);
>> +	ctx->panel.prepare_prev_first = true;
>> +
>> +	ctx->panel.backlight = s6e3fa7_panel_create_backlight(dsi);
>> +	if (IS_ERR(ctx->panel.backlight))
>> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>> +				     "Failed to create backlight\n");
>> +
>> +	drm_panel_add(&ctx->panel);
>> +
>> +	ret = mipi_dsi_attach(dsi);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>> +		drm_panel_remove(&ctx->panel);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void s6e3fa7_panel_remove(struct mipi_dsi_device *dsi)
>> +{
>> +	struct s6e3fa7_panel *ctx = mipi_dsi_get_drvdata(dsi);
>> +	int ret;
>> +
>> +	ret = mipi_dsi_detach(dsi);
>> +	if (ret < 0)
>> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>> +
>> +	drm_panel_remove(&ctx->panel);
>> +}
>> +
>> +static const struct of_device_id s6e3fa7_panel_of_match[] = {
>> +	{ .compatible = "samsung,s6e3fa7-ams559nk06" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, s6e3fa7_panel_of_match);
>> +
>> +static struct mipi_dsi_driver s6e3fa7_panel_driver = {
>> +	.probe = s6e3fa7_panel_probe,
>> +	.remove = s6e3fa7_panel_remove,
>> +	.driver = {
>> +		.name = "panel-samsung-s6e3fa7",
>> +		.of_match_table = s6e3fa7_panel_of_match,
>> +	},
>> +};
>> +module_mipi_dsi_driver(s6e3fa7_panel_driver);
>> +
>> +MODULE_AUTHOR("Richard Acayan <mailingradian@gmail.com>");
>> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FA7 command mode DSI panel");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.43.0
>> 
>> 
