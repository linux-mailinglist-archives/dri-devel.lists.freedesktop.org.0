Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31D91777B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 06:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CFA10E072;
	Wed, 26 Jun 2024 04:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sc+RoOiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA09010E072
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:41:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cdebf9f6fso4912159e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 21:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719376908; x=1719981708; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v6VrmvF1EJw2vDb/7UUnrTBd5gZX6m6TMzhdMWuYfd4=;
 b=Sc+RoOiWWI7sk6iCa261y/pCMeFVGxtZJkImHYet/j6zFEGB5bXy0Y2kingXCGbZ1G
 6kWCZJbM/rI45navK2cEsbXIuw8jcPjEjy91j5LRFfmWqisWlMwOtO03VwMdv/pQVSPH
 q4kb2Sjmh8Bx5lCnP6MJ2QeNaivcnMZ/V1Os1vhiJofl8B99b7VAJIoWYPzGRvmocCZL
 tPemj5gI1vwvjFt6ELckyW6hHETSI8w81zZgnQNgP0KJoF+W/5TFDSC1RUEuteJel1Gm
 cvNzKBtiacVxC5lJ0DAfhHE9xgpEUd1J8uhLRando2hfMkbFL9Vcjx1aDmUtCt83AkX/
 z4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719376908; x=1719981708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6VrmvF1EJw2vDb/7UUnrTBd5gZX6m6TMzhdMWuYfd4=;
 b=DKumF/lk4D1YRo8fyPSxQtuNV8RTcWARBLaUmDuUs+PYjR1DqqddOSmNg5aknXdcH2
 DiFDxjNb+CQY8kPb4DxfongNkMeUmKIVmBzFXLu/K48ua3UnTO3n4wkO1ewhpcJfgP0o
 JloiTQ2WJlTF0MT80flEMJ27OY6mVlHekWBpBWie92nv3LQmY0Hwn45oJbi1xXZxs56A
 uQ9z3lAvlbmLoV5Nx8/1ZrTPGIGL4+mj/8DLuFN7thzm0/w3i64WVRbnaxn925CqiDnu
 5Tlpj8B7PPii8Xi0+fKPtVOq7uum9pvmhSJVFuld1REA+n1aLoTKz+XJU3dyTabcvZmG
 Q5zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAWEo080Zs/16wDZO2BsSkErawtbZpW7Zs4Vg2fEPWshL9ECVf72XlFW3vOBQRs7Vhy1AumYLGggZzWmAxJMSXZnkEzc2HpAYkMarioxeQ
X-Gm-Message-State: AOJu0YzZNyzvKrVT0Z7BiqC3LkQ9g4zV++AZ1JUHg9w8eqQLNHClTmjb
 nan8u7Ejg7mvyO7cpY2o665eglU+ygfsxFDrQPRyiKnAGmHvcis+sZvf5IwAgfM=
X-Google-Smtp-Source: AGHT+IGsPvTEV/zY3vz8LeZ6Bq0ihdlVV6nREOwO4yNrOoETXjQ9wCWuwcfszKVFWDMu4FBqt13fsQ==
X-Received: by 2002:a05:6512:3054:b0:52d:215b:9028 with SMTP id
 2adb3069b0e04-52d215b914dmr2204420e87.60.1719376907560; 
 Tue, 25 Jun 2024 21:41:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd643e419sm1416456e87.243.2024.06.25.21.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 21:41:47 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:41:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panel: add lincoln lcd197 support
Message-ID: <irzer3be5fj2rg2bmc2oqxqtaw6jybbdkgv3jgxpyhdvojwv24@e4i2v6d454nz>
References: <20240625142552.1000988-1-jbrunet@baylibre.com>
 <20240625142552.1000988-4-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625142552.1000988-4-jbrunet@baylibre.com>
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

On Tue, Jun 25, 2024 at 04:25:50PM GMT, Jerome Brunet wrote:
> Add support for the Lincoln LCD197 1080x1920 DSI panel.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  11 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-lincoln-lcd197.c | 333 +++++++++++++++++++
>  3 files changed, 345 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-lincoln-lcd197.c
> 

[...]

> +
> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xB9, 0xFF, 0x83, 0x99);

- Please use lowercase hex instead
- Please consider switching to _multi() functions.


> +	usleep_range(200, 300);

This will require new helper msm_dsi_usleep_range(ctx, 200, 300);

> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xB6, 0x92, 0x92);
> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xCC, 0x00);
> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xBF, 0x40, 0x41, 0x50, 0x49);
> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xC6, 0xFF, 0xF9);
> +	mipi_dsi_dcs_write_seq(lcd->dsi, 0xC0, 0x25, 0x5A);
> +	mipi_dsi_dcs_write_seq(lcd->dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x02);
> +
> +	err = mipi_dsi_dcs_exit_sleep_mode(lcd->dsi);
> +	if (err < 0) {
> +		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> +		goto poweroff;
> +	}
> +	msleep(120);
> +
> +	err = mipi_dsi_dcs_read(lcd->dsi, MIPI_DCS_GET_DISPLAY_ID, display_id, 3);

This probably needs new _multi helper too.

> +	if (err < 0) {
> +		dev_err(panel->dev, "Failed to read display id: %d\n", err);
> +	} else {
> +		dev_dbg(panel->dev, "Display id: 0x%02x-0x%02x-0x%02x\n",
> +			display_id[0], display_id[1], display_id[2]);
> +	}
> +
> +	lcd->prepared = true;

Should not be required anymore.

> +
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value_cansleep(lcd->enable_gpio, 0);
> +	gpiod_set_value_cansleep(lcd->reset_gpio, 1);
> +	regulator_disable(lcd->supply);
> +
> +	return err;
> +}
> +

> +
> +static const struct drm_display_mode default_mode = {
> +	.clock = 154002,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 20,
> +	.hsync_end = 1080 + 20 + 6,
> +	.htotal = 1080 + 204,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 4,
> +	.vsync_end = 1920 + 4 + 4,
> +	.vtotal = 1920 + 79,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
> +static int lincoln_lcd197_panel_get_modes(struct drm_panel *panel,
> +					  struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &default_mode);
> +	if (!mode) {
> +		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
> +			default_mode.hdisplay, default_mode.vdisplay,
> +			drm_mode_vrefresh(&default_mode));
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	connector->display_info.width_mm = 79;
> +	connector->display_info.height_mm = 125;

drm_connector_helper_get_modes_fixed()

> +
> +	return 1;
> +}
> +


> +
> +static void lincoln_lcd197_panel_shutdown(struct mipi_dsi_device *dsi)
> +{
> +	struct lincoln_lcd197_panel *lcd = mipi_dsi_get_drvdata(dsi);
> +
> +	drm_panel_disable(&lcd->panel);
> +	drm_panel_unprepare(&lcd->panel);
> +}

I think the agreement was that there should be no need for the panel's
shutdown, the DRM driver should shutdown the panel.


-- 
With best wishes
Dmitry
