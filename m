Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61A78BF39
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016110E098;
	Tue, 29 Aug 2023 07:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4010E098
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:30:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8359814;
 Tue, 29 Aug 2023 09:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693294140;
 bh=6coby2Zrn+T1EWdaRlC59vK9Z/8thlEKdraVQp4Nfnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YeE0XWgyvoZAjCR1NivQlghZcHSbpo0czFWIQYMgdNUU3tbDE+c3ziZcJVykKIOmy
 rqn/JKj7ZhsLsAaIDhFA8fhHHDGpUdBn9s1BDYx4k+izSIY0u72HtqX7Q2g0yTPvLn
 VMv5XvCtp0kIGYhTobdo26B9f59/TGCQu+nHi02w=
Date: Tue, 29 Aug 2023 10:30:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Message-ID: <20230829073031.GA2302@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-6-biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

On Sun, Aug 13, 2023 at 07:05:10PM +0100, Biju Das wrote:
> The ADV7533 and ADV7535 have DSI support. Add a feature bit has_dsi to
> struct adv7511_chip_info for handling configuration related to DSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index b29d11cae932..2a017bb31a14 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -339,6 +339,7 @@ struct adv7511_chip_info {
>  	unsigned long max_lane_freq;
>  	const char * const *supply_names;
>  	unsigned int num_supplies;
> +	unsigned has_dsi:1;

As you're not short of space here, I'd make this a bool.

>  };
>  
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f6f15c1b0882..66b3f8fcf67d 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  	 */
>  	regcache_sync(adv7511->regmap);
>  
> -	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
> +	if (adv7511->info->has_dsi)
>  		adv7533_dsi_power_on(adv7511);
>  	adv7511->powered = true;
>  }
> @@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
>  static void adv7511_power_off(struct adv7511 *adv7511)
>  {
>  	__adv7511_power_off(adv7511);
> -	if (adv7511->info->type == ADV7533 || adv7511->info->type == ADV7535)
> +	if (adv7511->info->has_dsi)
>  		adv7533_dsi_power_off(adv7511);
>  	adv7511->powered = false;
>  }
> @@ -786,7 +786,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>  	else
>  		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
>  
> -	if (adv7511->info->type == ADV7511)
> +	if (!adv7511->info->has_dsi)

While this is functionally equivalent, is the register below really
related to DSI ? If not, I'd rather not check the has_dsi field here but
keep checking the type.

>  		regmap_update_bits(adv7511->regmap, 0xfb,
>  				   0x6, low_refresh_rate << 1);
>  	else
> @@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid(struct drm_bridge *bridge,
>  {
>  	struct adv7511 *adv = bridge_to_adv7511(bridge);
>  
> -	if (adv->info->type == ADV7533 || adv->info->type == ADV7535)
> +	if (adv->info->has_dsi)
>  		return adv7533_mode_valid(adv, mode);
>  	else
>  		return adv7511_mode_valid(adv, mode);
> @@ -1086,7 +1086,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>  		goto err;
>  	}
>  
> -	if (adv->info->type == ADV7533 || adv->info->type == ADV7535) {
> +	if (adv->info->has_dsi) {

Same comment here, this doesn't seem logically right.

>  		ret = adv7533_patch_cec_registers(adv);
>  		if (ret)
>  			goto err;
> @@ -1245,7 +1245,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  		goto uninit_regulators;
>  	dev_dbg(dev, "Rev. %d\n", val);
>  
> -	if (info->type == ADV7511)
> +	if (!info->has_dsi)

And here too.

>  		ret = regmap_register_patch(adv7511->regmap,
>  					    adv7511_fixed_registers,
>  					    ARRAY_SIZE(adv7511_fixed_registers));
> @@ -1316,7 +1316,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>  
>  	adv7511_audio_init(dev, adv7511);
>  
> -	if (info->type == ADV7533 || info->type == ADV7535) {
> +	if (info->has_dsi) {
>  		ret = adv7533_attach_dsi(adv7511);
>  		if (ret)
>  			goto err_unregister_audio;
> @@ -1370,7 +1370,8 @@ static const struct adv7511_chip_info adv7533_chip_info = {
>  	.max_mode_clock = 80000,
>  	.max_lane_freq = 800000,
>  	.supply_names = adv7533_supply_names,
> -	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
> +	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
> +	.has_dsi = 1
>  };
>  
>  static const struct adv7511_chip_info adv7535_chip_info = {
> @@ -1378,7 +1379,8 @@ static const struct adv7511_chip_info adv7535_chip_info = {
>  	.max_mode_clock = 148500,
>  	.max_lane_freq = 891000,
>  	.supply_names = adv7533_supply_names,
> -	.num_supplies = ARRAY_SIZE(adv7533_supply_names)
> +	.num_supplies = ARRAY_SIZE(adv7533_supply_names),
> +	.has_dsi = 1
>  };
>  
>  static const struct i2c_device_id adv7511_i2c_ids[] = {

-- 
Regards,

Laurent Pinchart
