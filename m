Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDF07C98C1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 13:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C440610E0A0;
	Sun, 15 Oct 2023 11:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Sun, 15 Oct 2023 11:06:06 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17B10E0A0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 11:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 5B2C2FB06;
 Sun, 15 Oct 2023 12:59:25 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7l20BZCmacd; Sun, 15 Oct 2023 12:59:24 +0200 (CEST)
Date: Sun, 15 Oct 2023 12:59:22 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Pick different reset sequence
Message-ID: <ZSvGCvniKkT-YPkJ@qwark.sigxcpu.org>
References: <20230211171748.36692-1-frank@oltmanns.dev>
 <20230211171748.36692-2-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211171748.36692-2-frank@oltmanns.dev>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Sat, Feb 11, 2023 at 06:17:48PM +0100, Frank Oltmanns wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Switching to a different reset sequence, enabling IOVCC before enabling
> VCC.
> 
> There also needs to be a delay after enabling the supplies and before
> deasserting the reset. The datasheet specifies 1ms after the supplies
> reach the required voltage. Use 10-20ms to also give the power supplies
> some time to reach the required voltage, too.
> 
> This fixes intermittent panel initialization failures and screen
> corruption during resume from sleep on panel xingbangda,xbd599 (e.g.
> used in PinePhone).
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Reported-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 25 ++++++++++---------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 6747ca237ced..45695aa51f62 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -411,29 +411,30 @@ static int st7703_prepare(struct drm_panel *panel)
>  		return 0;
>  
>  	dev_dbg(ctx->dev, "Resetting the panel\n");
> -	ret = regulator_enable(ctx->vcc);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	ret = regulator_enable(ctx->iovcc);
>  	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
> +		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
>  		return ret;
>  	}
> -	ret = regulator_enable(ctx->iovcc);
> +
> +	ret = regulator_enable(ctx->vcc);
>  	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
> -		goto disable_vcc;
> +		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
> +		regulator_disable(ctx->iovcc);
> +		return ret;
>  	}
>  
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -	usleep_range(20, 40);
> +	/* Give power supplies time to stabilize before deasserting reset. */
> +	usleep_range(10000, 20000);
> +
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> -	msleep(20);
> +	usleep_range(15000, 20000);
>  
>  	ctx->prepared = true;
>  
>  	return 0;
> -
> -disable_vcc:
> -	regulator_disable(ctx->vcc);
> -	return ret;
>  }
>  
>  static const u32 mantix_bus_formats[] = {

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

> -- 
> 2.39.1
> 
