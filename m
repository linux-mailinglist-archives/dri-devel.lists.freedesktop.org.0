Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D76E78BF23
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450010E04F;
	Tue, 29 Aug 2023 07:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3910E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:23:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 450FEB9A;
 Tue, 29 Aug 2023 09:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693293722;
 bh=F5Q/dHI0EyeTG2Zb8dh/B5k7+Cf8DduZ/VOPpwXD+gU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s7yIchT1C4htQv6eASjSFAkr7mobcyYvea5TxY7yI12LRNW6kR60m3eHtnrRfeuI6
 U1i/zNGKovIiHoyp91E+3dfw21tzEYyOFDSlGjg7RvWh+PMVO0oHqDZGdtUOZJh5BR
 yHQfVOW/g262vqu4/uDj4F4P9rFeBFrZj2mvuhHA=
Date: Tue, 29 Aug 2023 10:23:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 2/7] drm: adv7511: Add max_mode_clock variable to struct
 adv7511_chip_info
Message-ID: <20230829072333.GL17083@pendragon.ideasonboard.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
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

On Sun, Aug 13, 2023 at 07:05:07PM +0100, Biju Das wrote:
> The ADV7533 supports a maximum pixel clock of 80MHz whereas it is 148.5MHz
> for ADV7535.  Add max_mode_clock variable to struct adv7511_chip_info to
> handle this difference.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 59e8ef10d72e..f8190442ffca 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -335,6 +335,7 @@ enum adv7511_type {
>  
>  struct adv7511_chip_info {
>  	enum adv7511_type type;
> +	unsigned long max_mode_clock;

unsigned int is enough as the clock is expressed in kHz. To make it
extra clear, you could also name the field max_mode_clock_khz.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  };
>  
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 013d8d640ef4..193b2d5bc7e6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1371,11 +1371,13 @@ static const struct adv7511_chip_info adv7511_chip_info = {
>  };
>  
>  static const struct adv7511_chip_info adv7533_chip_info = {
> -	.type = ADV7533
> +	.type = ADV7533,
> +	.max_mode_clock = 80000
>  };
>  
>  static const struct adv7511_chip_info adv7535_chip_info = {
> -	.type = ADV7535
> +	.type = ADV7535,
> +	.max_mode_clock = 148500
>  };
>  
>  static const struct i2c_device_id adv7511_i2c_ids[] = {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index c452c4dc1c3f..e92b27e0afd1 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,7 +108,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>  	u8 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>  
>  	/* Check max clock for either 7533 or 7535 */
> -	if (mode->clock > (adv->info->type == ADV7533 ? 80000 : 148500))
> +	if (mode->clock > adv->info->max_mode_clock)
>  		return MODE_CLOCK_HIGH;
>  
>  	/* Check max clock for each lane */

-- 
Regards,

Laurent Pinchart
