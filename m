Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE352D1F0
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 14:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C0F11A263;
	Thu, 19 May 2022 12:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AA211A268
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 12:01:19 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nreqD-0008Ph-Ox; Thu, 19 May 2022 14:01:17 +0200
Message-ID: <bc6ec2126514387aa62dd32e6de03ed7b00f7bf5.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/bridge: tc358767: Make sure Refclk clock are
 enabled
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Thu, 19 May 2022 14:01:15 +0200
In-Reply-To: <20220519114751.69852-1-marex@denx.de>
References: <20220519114751.69852-1-marex@denx.de>
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

Am Donnerstag, dem 19.05.2022 um 13:47 +0200 schrieb Marek Vasut:
> The Refclk may be supplied by SoC clock output instead of crystal
> oscillator, make sure the clock are enabled before any other action
> is performed with the bridge chip, otherwise it may either fail to
> operate at all, or miss reset GPIO toggle.
> 
> Fixes: 7caff0fc4296e ("drm/bridge: tc358767: Add DPI to eDP bridge driver")
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> V2: Use devm_add_action_or_reset() to add clock disable hook instead
>     of wall of failpath
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++++-------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 45ea829d56601..b2ef01303be23 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2033,6 +2033,13 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>  	return -EINVAL;
>  }
>  
> +static void tc_clk_disable(void *data)
> +{
> +	struct clk *refclk = data;
> +
> +	clk_disable_unprepare(refclk);
> +}
> +
>  static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  {
>  	struct device *dev = &client->dev;
> @@ -2049,6 +2056,22 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
> +	ret = devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
> +	if (ret)
> +		return ret;
> +
> +	clk_prepare_enable(tc->refclk);
> +
> +	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
> +	usleep_range(10, 15);
> +
>  	/* Shut down GPIO is optional */
>  	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
>  	if (IS_ERR(tc->sd_gpio))
> @@ -2069,13 +2092,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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


