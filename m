Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109C4BBEA5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D6910E14E;
	Fri, 18 Feb 2022 17:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F339A10E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:49:26 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL7Nl-0004LU-E0; Fri, 18 Feb 2022 18:49:25 +0100
Message-ID: <fcf1f83690ea7faa8b0667840eef7a9f4967cf72.camel@pengutronix.de>
Subject: Re: [PATCH V2 05/11] drm/bridge: tc358767: Move hardware init to
 enable callback
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 18:49:23 +0100
In-Reply-To: <20220218010054.315026-6-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-6-marex@denx.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
> The TC358767/TC358867/TC9595 are all capable of operating either from
> attached Xtal or from DSI clock lane clock. In case the later is used,
> all I2C accesses will fail until the DSI clock lane is running and
> supplying clock to the chip.
> 
> Move all hardware initialization to enable callback to guarantee the
> DSI clock lane is running before accessing the hardware. In case Xtal
> is attached to the chip, this change has no effect.

I'm not sure if that last statement is correct. When the chip is
bridging to eDP, the aux channel and HPD handling is needed to be
functional way before the atomic enable happen. I have no idea how this
would interact with the clock supplied from the DSI lanes. Maybe it
doesn't work at all and proper eDP support always needs a external
reference clock?

I think we should make the "ref" clock a optional clock to properly
describe the fact that the chip can operate without this clock in DSI
input mode and then either do the chip init in the probe routine when
the ref clock is present, or defer it to atomic enable when the ref
clock is absent.

> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> V2: - Rebase on next-20220217
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 111 +++++++++++++++++-------------
>  1 file changed, 63 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 01d11adee6c74..134c4d8621236 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1234,6 +1234,63 @@ static int tc_edp_stream_disable(struct tc_data *tc)
>  	return 0;
>  }
>  
> +static int tc_hardware_init(struct tc_data *tc)
> +{
> +	int ret;
> +
> +	ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
> +	if (ret) {
> +		dev_err(tc->dev, "can not read device ID: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
> +		dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
> +		return -EINVAL;
> +	}
> +
> +	tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
> +
> +	if (!tc->reset_gpio) {
> +		/*
> +		 * If the reset pin isn't present, do a software reset. It isn't
> +		 * as thorough as the hardware reset, as we can't reset the I2C
> +		 * communication block for obvious reasons, but it's getting the
> +		 * chip into a defined state.
> +		 */
> +		regmap_update_bits(tc->regmap, SYSRSTENB,
> +				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> +				0);
> +		regmap_update_bits(tc->regmap, SYSRSTENB,
> +				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> +				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP);
> +		usleep_range(5000, 10000);
> +	}
> +
> +	if (tc->hpd_pin >= 0) {
> +		u32 lcnt_reg = tc->hpd_pin == 0 ? INT_GP0_LCNT : INT_GP1_LCNT;
> +		u32 h_lc = INT_GPIO_H(tc->hpd_pin) | INT_GPIO_LC(tc->hpd_pin);
> +
> +		/* Set LCNT to 2ms */
> +		regmap_write(tc->regmap, lcnt_reg,
> +			     clk_get_rate(tc->refclk) * 2 / 1000);
> +		/* We need the "alternate" mode for HPD */
> +		regmap_write(tc->regmap, GPIOM, BIT(tc->hpd_pin));
> +
> +		if (tc->have_irq) {
> +			/* enable H & LC */
> +			regmap_update_bits(tc->regmap, INTCTL_G, h_lc, h_lc);
> +		}
> +	}
> +
> +	if (tc->have_irq) {
> +		/* enable SysErr */
> +		regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
> +	}
> +
> +	return 0;
> +}
> +
>  static void
>  tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
>  			    struct drm_bridge_state *old_bridge_state)
> @@ -1241,6 +1298,12 @@ tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	struct tc_data *tc = bridge_to_tc(bridge);
>  	int ret;
>  
> +	ret = tc_hardware_init(tc);
> +	if (ret < 0) {
> +		dev_err(tc->dev, "failed to initialize bridge: %d\n", ret);
> +		return;
> +	}
> +
>  	ret = tc_get_display_props(tc);
>  	if (ret < 0) {
>  		dev_err(tc->dev, "failed to read display props: %d\n", ret);
> @@ -1660,9 +1723,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	}
>  
>  	if (client->irq > 0) {
> -		/* enable SysErr */
> -		regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
> -
>  		ret = devm_request_threaded_irq(dev, client->irq,
>  						NULL, tc_irq_handler,
>  						IRQF_ONESHOT,
> @@ -1675,51 +1735,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		tc->have_irq = true;
>  	}
>  
> -	ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
> -	if (ret) {
> -		dev_err(tc->dev, "can not read device ID: %d\n", ret);
> -		return ret;
> -	}
> -
> -	if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
> -		dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
> -		return -EINVAL;
> -	}
> -
> -	tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
> -
> -	if (!tc->reset_gpio) {
> -		/*
> -		 * If the reset pin isn't present, do a software reset. It isn't
> -		 * as thorough as the hardware reset, as we can't reset the I2C
> -		 * communication block for obvious reasons, but it's getting the
> -		 * chip into a defined state.
> -		 */
> -		regmap_update_bits(tc->regmap, SYSRSTENB,
> -				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> -				0);
> -		regmap_update_bits(tc->regmap, SYSRSTENB,
> -				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> -				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP);
> -		usleep_range(5000, 10000);
> -	}
> -
> -	if (tc->hpd_pin >= 0) {
> -		u32 lcnt_reg = tc->hpd_pin == 0 ? INT_GP0_LCNT : INT_GP1_LCNT;
> -		u32 h_lc = INT_GPIO_H(tc->hpd_pin) | INT_GPIO_LC(tc->hpd_pin);
> -
> -		/* Set LCNT to 2ms */
> -		regmap_write(tc->regmap, lcnt_reg,
> -			     clk_get_rate(tc->refclk) * 2 / 1000);
> -		/* We need the "alternate" mode for HPD */
> -		regmap_write(tc->regmap, GPIOM, BIT(tc->hpd_pin));
> -
> -		if (tc->have_irq) {
> -			/* enable H & LC */
> -			regmap_update_bits(tc->regmap, INTCTL_G, h_lc, h_lc);
> -		}
> -	}
> -
>  	ret = tc_aux_link_setup(tc);

The above function is also poking i2c regs, as will any DP AUX
transaction in case of eDP.

Regards,
Lucas

>  	if (ret)
>  		return ret;


