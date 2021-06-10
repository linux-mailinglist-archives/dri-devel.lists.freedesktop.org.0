Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB07D3A3050
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD4B6E4C7;
	Thu, 10 Jun 2021 16:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF46E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DsuXOYEpStmYHjHet2t4PBPL/C0QMO3rH0jmj3qa7v4=; b=CMQOHZUia4vYZrIAkshYrczXQ3
 zU+nxVva1j8Gom9Tjk3AC8Qa+w1wU/NuT8pmHZ6G95p6eQ4jGRvOlH3Iak0Uj4YrB+DA0CIO5pntq
 Z2LauMjwuvUfADWUlTYa+aT0Bi9K1YFzSLwAblp1bx4OswUmKVgaw6H83THW2LuxhnWlLqVy3mP2a
 xS2xEM6lUbLA229Qh3yNGy4gDXj9wbDhyGKeAMPkZGOkcXTv5B+6AnnehchoOGg/pu7ouUSI/VTr6
 z3M+VpvpRNYDg/9PJI4Kjsb9iT31IHnw03aB9QPRvuTnMazooDgYC4l2goXam9zoL1TVhgnYkNjJM
 9pM/ZdSQ==;
Received: from [2a01:799:95f:4600:1d9c:bc7e:a70c:463] (port=50924)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lrNKp-0006dG-8i; Thu, 10 Jun 2021 18:15:11 +0200
Subject: Re: [PATCH v4] drm/panel: db7430: Add driver for Samsung DB7430
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210610132501.315086-1-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <61750bfe-74f4-b425-f312-4bf791ad18c6@tronnes.org>
Date: Thu, 10 Jun 2021 18:15:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210610132501.315086-1-linus.walleij@linaro.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Doug Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 10.06.2021 15.25, skrev Linus Walleij:
> This adds a new driver for the Samsung DB7430 DPI display
> controller as controlled over SPI.
> 
> Right now the only panel product we know that is using this
> display controller is the LMS397KF04 but there may be more.
> 
> This is the first regular panel driver making use of the
> MIPI DBI helper library. The DBI "device" portions can not
> be used because that code assumes the use of a single
> regulator and specific timings around the reset pulse that
> do not match the DB7430 datasheet.
> 
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Managed to make use of the in-kernel DBI support to
>   conjure and send 9bit DBI SPI messages.

When I moved the DBI code out of tinydrm I split it up into an interface
part and a framebuffer part so panel drivers could use the interface
part like you have done here.

> - This cuts out a bit of overhead.
> - Deeper integration with the DBI library is not done, as
>   assumes too much about the device, such as being used
>   as a stand-alone framebuffer (this device is not).

> diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
> new file mode 100644
> index 000000000000..c11b3da65896
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c

> +/**
> + * struct db7430 - state container for a panel controlled by the DB7430
> + * controller
> + */
> +struct db7430 {
> +	/** @dev: the container device */
> +	struct device *dev;
> +	/** @dbi: the DBI bus abstraction handle */
> +	struct mipi_dbi dbi;
> +	/** @panel: the DRM panel instance for this device */
> +	struct drm_panel panel;
> +	/** @width: the width of this panel in mm */
> +	u32 width;
> +	/** @height: the height of this panel in mm */
> +	u32 height;
> +	/** @reset: reset GPIO line */
> +	struct gpio_desc *reset;

You can use dbi->reset.

> +	/** @regulators: VCCIO and VIO supply regulators */
> +	struct regulator_bulk_data regulators[2];
> +};

> +static int db7430_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct db7430 *db;
> +	int ret;
> +
> +	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
> +	if (!db)
> +		return -ENOMEM;
> +	db->dev = dev;
> +
> +	/*
> +	 * VCI   is the analog voltage supply
> +	 * VCCIO is the digital I/O voltage supply
> +	 */
> +	db->regulators[0].supply = "vci";
> +	db->regulators[1].supply = "vccio";
> +	ret = devm_regulator_bulk_get(dev,
> +				      ARRAY_SIZE(db->regulators),
> +				      db->regulators);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	db->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(db->reset)) {
> +		ret = PTR_ERR(db->reset);
> +		return dev_err_probe(dev, ret, "no RESET GPIO\n");
> +	}
> +
> +	spi->bits_per_word = 9;

Do you need to set this? The DBI helper sets it on the SPI transfer if
the SPI controller supports 9-bit or uses emulation code if not.

> +	/* Preserve e.g. SPI_3WIRE setting */
> +	spi->mode |= SPI_MODE_3;

You can use the DT properties 'spi-cpha' and 'spi-cpol' to set this.

> +	ret = spi_setup(spi);

So I don't think you need to call spi_setup() here.

This code as-is will fail on a SPI controller that doesn't support 9
bits per word, and the emulation code in the DBI helper won't be utilised.

With the comments considered:

Acked-by: Noralf Trønnes <noralf@tronnes.org>

Noralf.

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "spi setup failed\n");
> +
> +	ret = mipi_dbi_spi_init(spi, &db->dbi, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> +
> +	drm_panel_init(&db->panel, dev, &db7430_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	/* FIXME: if no external backlight, use internal backlight */
> +	ret = drm_panel_of_backlight(&db->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add backlight\n");
> +
> +	spi_set_drvdata(spi, db);
> +
> +	drm_panel_add(&db->panel);
> +	dev_dbg(dev, "added panel\n");
> +
> +	return 0;
> +}
