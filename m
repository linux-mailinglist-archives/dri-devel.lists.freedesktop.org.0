Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA3378C96F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5340810E3CF;
	Tue, 29 Aug 2023 16:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8EC10E3CF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 175D6FB02;
 Tue, 29 Aug 2023 18:16:31 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmPcIvMR29Ee; Tue, 29 Aug 2023 18:16:29 +0200 (CEST)
Date: Tue, 29 Aug 2023 18:16:28 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2 1/1] drm/panel: st7703: Fix timings when
 entering/exiting sleep
Message-ID: <ZO4Z3HanNy0+DNUn@qwark.sigxcpu.org>
References: <20230213123238.76889-1-frank@oltmanns.dev>
 <20230213123238.76889-2-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213123238.76889-2-frank@oltmanns.dev>
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
 Samuel Holland <samuel@sholland.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Feb 13, 2023 at 01:32:38PM +0100, Frank Oltmanns wrote:
> Fix flickering of the pinephone's XDB599 panel that happens after
> resume.
> 
> Extend the delay after issuing the command to exit sleep mode from 60 to
> 120 msec as per the controller's specification.
> 
> Introduce a 120 msec delay after issuing the command to enter sleep
> mode. This is needed in order for the controller to reliably finalize
> the sleep in sequence before switching of power supply.
> 
> In contrast to the JH057N panel, the XBD599 panel does not require a 20
> msec delay after initialization and exiting sleep mode. Therefore, move
> the delay into the already existing device specific initialization
> function.
> 
> The XDB599 does not require a 20 msec delay between the SETBGP and
> SETVCOM commands. Therefore, remove the delay from the device specific
> initialization function.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Cc: Ondrej Jirman <megi@xff.cz>
> Reported-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 6747ca237ced..c49f4ef883fc 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -126,6 +126,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
>  				   0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
>  				   0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
>  				   0x11, 0x18);
> +	msleep(20);
>  
>  	return 0;
>  }
> @@ -273,7 +274,6 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
>  			       0x07, /* VREF_SEL = 4.2V */
>  			       0x07  /* NVREF_SEL = 4.2V */);
> -	msleep(20);
>  
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
>  			       0x2C, /* VCOMDC_F = -0.67V */
> @@ -350,16 +350,14 @@ static int st7703_enable(struct drm_panel *panel)
>  		return ret;
>  	}
>  
> -	msleep(20);
> -
>  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>  	if (ret < 0) {
>  		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
>  		return ret;
>  	}
>  
> -	/* Panel is operational 120 msec after reset */
> -	msleep(60);
> +	/* It takes the controller 120 msec to wake up after sleep. */
> +	msleep(120);
>  
>  	ret = mipi_dsi_dcs_set_display_on(dsi);
>  	if (ret)
> @@ -384,6 +382,9 @@ static int st7703_disable(struct drm_panel *panel)
>  	if (ret < 0)
>  		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
>  
> +	/* It takes the controller 120 msec to enter sleep mode. */
> +	msleep(120);
> +
>  	return 0;
>  }

Tested this patch on a Librem 5 devkit.

Reviewed-by: Guido Günther <agx@sigxcpu.org>
Tested-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

>  
> -- 
> 2.39.1
> 
