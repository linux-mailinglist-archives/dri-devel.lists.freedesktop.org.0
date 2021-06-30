Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D83B8932
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 21:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD066EA78;
	Wed, 30 Jun 2021 19:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AD46EA78
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 19:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=whcJQgwr8DoeHtWWkaXWmi8uY3gLtHRcDcBtQybYEqE=; b=LUmNKNj6iigl3hYG+3R3c+WjId
 3kFMspz4a5zzIVDyJiJ0J4Ic3WgS2TgR5CrCrEHnc2mW3oPTVX4JYOnOcVdoo6fRyxCmvNGPesTyr
 SH4reAlgBHz2g3o7yv2xo8UL6hZcqo8Ft/Z4yQba27lcuGG+SGeJvRjeL8bccp83stqHATV/2/On+
 LOluS/sAJ5drGWfhQtnGOnvShCetrth4sbOVOkrnHQK9hw5jZNE0SZSdnRiXEqwD0Pp6OWNPOXuMy
 4C8E5GCekZwcQDbWuuQ1gfahqfQY5+p/ffdzusQm3qWzI5M0MiLG2D1F7yZo9TDgG9L3A4BB5pXQ5
 v1fMz4YQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64722
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lyfyQ-0005BQ-6J; Wed, 30 Jun 2021 21:34:14 +0200
Subject: Re: [PATCH 2/2 v2] drm/panel: ws2401: Add driver for WideChips WS2401
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210630182804.3628410-1-linus.walleij@linaro.org>
 <20210630182804.3628410-2-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <e73f47eb-2ef3-9214-93e2-1915732bccb9@tronnes.org>
Date: Wed, 30 Jun 2021 21:34:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630182804.3628410-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: phone-devel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 30.06.2021 20.28, skrev Linus Walleij:
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
> 
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
> 
> The display optionally supports internal backlight control, but can
> also use an external backlight.
> 
> This driver re-uses the DBI infrastructure to communicate with the
> display.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

> diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c

> +static void ws2401_read_mtp_id(struct ws2401 *ws)
> +{
> +	struct mipi_dbi *dbi = &ws->dbi;
> +	u8 id1, id2, id3;
> +	int ret;
> +
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 1\n");
> +		return;
> +	}
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id1);

Didn't spot this earlier, but you're reading ID2 and ID3 into id1.

> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 2\n");
> +		return;
> +	}
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id1);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 3\n");
> +		return;
> +	}
> +	dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
> +}

> +static int ws2401_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct ws2401 *ws;
> +	int ret;
> +
> +	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
> +	if (!ws)
> +		return -ENOMEM;
> +	ws->dev = dev;
> +
> +	/*
> +	 * VCI   is the analog voltage supply
> +	 * VCCIO is the digital I/O voltage supply
> +	 */
> +	ws->regulators[0].supply = "vci";
> +	ws->regulators[1].supply = "vccio";
> +	ret = devm_regulator_bulk_get(dev,
> +				      ARRAY_SIZE(ws->regulators),
> +				      ws->regulators);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ws->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ws->reset)) {
> +		ret = PTR_ERR(ws->reset);
> +		return dev_err_probe(dev, ret, "no RESET GPIO\n");
> +	}
> +
> +	ret = mipi_dbi_spi_init(spi, &ws->dbi, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> +	ws->dbi.read_commands = ws2401_dbi_read_commands;
> +
> +	ws2401_power_on(ws);
> +	ws2401_read_mtp_id(ws);
> +	ws2401_power_off(ws);
> +
> +	drm_panel_init(&ws->panel, dev, &ws2401_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	ret = drm_panel_of_backlight(&ws->panel);

I still don't see how internal backlight should work, have you tried it?

Tracking down the call chain, drm_panel_of_backlight() can only return
0, -EINVAL, -ENOMEM and -EPROBE_DEFER. It returns 0 whether the
backlight property exists or not.

I would do something like this:

	if (ret)
		return dev_err_probe(dev, ret, "failed to get backlight");

	if (!ws->panel.backlight) {
> +		dev_dbg(dev, "no external backlight, using internal backlight\n");
> +		ws->bl = devm_backlight_device_register(dev, "ws2401", dev, ws,
> +							&ws2401_bl_ops, &ws2401_bl_props);
> +		if (IS_ERR(ws->bl))
> +			return dev_err_probe(dev, PTR_ERR(ws->bl),
> +					     "failed to register backlight device\n");
> +		ws->panel.backlight = ws->bl;
> +	} else {
> +		dev_dbg(dev, "using external backlight\n");
> +	}
> +
> +	spi_set_drvdata(spi, ws);
> +
> +	drm_panel_add(&ws->panel);
> +	dev_dbg(dev, "added panel\n");
> +
> +	return 0;
> +}

Noralf.
