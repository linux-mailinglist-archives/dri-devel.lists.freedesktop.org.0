Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF7A78BF2D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6887310E04E;
	Tue, 29 Aug 2023 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C7410E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:25:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92E1B814;
 Tue, 29 Aug 2023 09:23:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693293828;
 bh=S2Eu+NvsyILHT7/I/hCZW90XOSU6bDJ27Wb01VKB8Is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bEdLiOB7BcszVJ+BjJ/gjXvq+Jih+lDSd/xI0xE383mys2aQxq542hOFY27eI0rYg
 xggmzJLOmd2leuIfTB1a5YSzSOQtDSNC1uxo6y3rqhYMZO9y4iTD+wcek/8XRjeqzB
 dBPWVkEgy++V/pXGi1znIPlrZbmwxI0dPDpnWHDA=
Date: Tue, 29 Aug 2023 10:25:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 3/7] drm: adv7511: Add max_lane_freq variable to struct
 adv7511_chip_info
Message-ID: <20230829072519.GM17083@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-4-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 13, 2023 at 07:05:08PM +0100, Biju Das wrote:
> The ADV7533 supports a maximum lane clock of 800MHz whereas it is 891MHz
> for ADV7535.  Add max_lane_freq variable to struct adv7511_chip_info to
> handle this difference.
> 
> While at it, drop the unused local variable max_lane_freq.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index f8190442ffca..0e2c721a856f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -336,6 +336,7 @@ enum adv7511_type {
>  struct adv7511_chip_info {
>  	enum adv7511_type type;
>  	unsigned long max_mode_clock;
> +	unsigned long max_lane_freq;

Same comment as for patch 2/7, you could name the field
max_lane_freq_khz. An unsigned int may be enough too if the calculation
below doesn't overflow.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  };
>  
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 193b2d5bc7e6..29e087e6d721 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1372,12 +1372,14 @@ static const struct adv7511_chip_info adv7511_chip_info = {
>  
>  static const struct adv7511_chip_info adv7533_chip_info = {
>  	.type = ADV7533,
> -	.max_mode_clock = 80000
> +	.max_mode_clock = 80000,
> +	.max_lane_freq = 800000,
>  };
>  
>  static const struct adv7511_chip_info adv7535_chip_info = {
>  	.type = ADV7535,
> -	.max_mode_clock = 148500
> +	.max_mode_clock = 148500,
> +	.max_lane_freq = 891000,
>  };
>  
>  static const struct i2c_device_id adv7511_i2c_ids[] = {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index e92b27e0afd1..c1e744d4f2b1 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -103,7 +103,6 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>  enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  					const struct drm_display_mode *mode)
>  {
> -	unsigned long max_lane_freq;
>  	struct mipi_dsi_device *dsi = adv->dsi;
>  	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>  
> @@ -112,9 +111,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  		return MODE_CLOCK_HIGH;
>  
>  	/* Check max clock for each lane */
> -	max_lane_freq = (adv->info->type == ADV7533 ? 800000 : 891000);
> -
> -	if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> +	if (mode->clock * bpp > adv->info->max_lane_freq * adv->num_dsi_lanes)
>  		return MODE_CLOCK_HIGH;
>  
>  	return MODE_OK;

-- 
Regards,

Laurent Pinchart
