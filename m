Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB3152CDA0
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371711AEF4;
	Thu, 19 May 2022 07:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBB911AED7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 07:57:06 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nrb1s-0001z7-Pw; Thu, 19 May 2022 09:57:04 +0200
Message-ID: <f4b1fb9922b037a8ac13103fb2dae37973506ae5.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] drm/bridge: tc358767: Make sure Refclk clock are
 enabled
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 19 May 2022 09:57:03 +0200
In-Reply-To: <20220518233602.248185-3-marex@denx.de>
References: <20220518233602.248185-1-marex@denx.de>
 <20220518233602.248185-3-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 19.05.2022 um 01:36 +0200 schrieb Marek Vasut:
> The Refclk may be supplied by SoC clock output instead of crystal
> oscillator, make sure the clock are enabled before any other action
> is performed with the bridge chip, otherwise it may either fail to
> operate at all, or miss reset GPIO toggle.
> 
> Fixes: 7caff0fc4296e ("drm/bridge: tc358767: Add DPI to eDP bridge driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 51 ++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index a8bb6de9e600a..4b15acbc73c4e 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2055,10 +2055,24 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	if (ret)
>  		return ret;
>  
> +	tc->refclk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(tc->refclk)) {
> +		ret = PTR_ERR(tc->refclk);
> +		dev_err(dev, "Failed to get refclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	clk_prepare_enable(tc->refclk);
> +
> +	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
> +	usleep_range(10, 15);
> +
>  	/* Shut down GPIO is optional */
>  	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
> -	if (IS_ERR(tc->sd_gpio))
> -		return PTR_ERR(tc->sd_gpio);
> +	if (IS_ERR(tc->sd_gpio)) {
> +		ret = PTR_ERR(tc->sd_gpio);
> +		goto err_clk;
> +	}
>  
>  	if (tc->sd_gpio) {
>  		gpiod_set_value_cansleep(tc->sd_gpio, 0);
> @@ -2067,26 +2081,21 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  
>  	/* Reset GPIO is optional */
>  	tc->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(tc->reset_gpio))
> -		return PTR_ERR(tc->reset_gpio);
> +	if (IS_ERR(tc->reset_gpio)) {
> +		ret = PTR_ERR(tc->reset_gpio);
> +		goto err_clk;
> +	}
>  
>  	if (tc->reset_gpio) {
>  		gpiod_set_value_cansleep(tc->reset_gpio, 1);
>  		usleep_range(5000, 10000);
>  	}
>  
> -	tc->refclk = devm_clk_get(dev, "ref");
> -	if (IS_ERR(tc->refclk)) {
> -		ret = PTR_ERR(tc->refclk);
> -		dev_err(dev, "Failed to get refclk: %d\n", ret);
> -		return ret;
> -	}
> -
>  	tc->regmap = devm_regmap_init_i2c(client, &tc_regmap_config);
>  	if (IS_ERR(tc->regmap)) {
>  		ret = PTR_ERR(tc->regmap);
>  		dev_err(dev, "Failed to initialize regmap: %d\n", ret);
> -		return ret;
> +		goto err_clk;
>  	}
>  
>  	ret = of_property_read_u32(dev->of_node, "toshiba,hpd-pin",
> @@ -2096,7 +2105,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	} else {
>  		if (tc->hpd_pin < 0 || tc->hpd_pin > 1) {
>  			dev_err(dev, "failed to parse HPD number\n");
> -			return ret;
> +			goto err_clk;
>  		}
>  	}
>  
> @@ -2110,7 +2119,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  						"tc358767-irq", tc);
>  		if (ret) {
>  			dev_err(dev, "failed to register dp interrupt\n");
> -			return ret;
> +			goto err_clk;
>  		}
>  
>  		tc->have_irq = true;
> @@ -2119,12 +2128,13 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
>  	if (ret) {
>  		dev_err(tc->dev, "can not read device ID: %d\n", ret);
> -		return ret;
> +		goto err_clk;
>  	}
>  
>  	if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
>  		dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_clk;
>  	}
>  
>  	tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
> @@ -2164,7 +2174,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	if (tc->bridge.type != DRM_MODE_CONNECTOR_DPI) { /* (e)DP output */
>  		ret = tc_aux_link_setup(tc);
>  		if (ret)
> -			return ret;
> +			goto err_clk;
>  	}
>  
>  	tc->bridge.of_node = dev->of_node;
> @@ -2176,11 +2186,15 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		ret = tc_mipi_dsi_host_attach(tc);
>  		if (ret) {
>  			drm_bridge_remove(&tc->bridge);
> -			return ret;
> +			goto err_clk;
>  		}
>  	}
>  
>  	return 0;
> +
> +err_clk:
> +	clk_disable_unprepare(tc->refclk);
> +	return ret;

That's a lot of error paths to disable a effectively always-on clock
when something goes wrong. Could you maybe simplify this by using
devm_add_action_or_reset for the clock disable? Seems like lots of
watchdog drivers do this already if you need some inspiration.

Regards,
Lucas

>  }
>  
>  static int tc_remove(struct i2c_client *client)
> @@ -2188,6 +2202,7 @@ static int tc_remove(struct i2c_client *client)
>  	struct tc_data *tc = i2c_get_clientdata(client);
>  
>  	drm_bridge_remove(&tc->bridge);
> +	clk_disable_unprepare(tc->refclk);
>  
>  	return 0;
>  }


