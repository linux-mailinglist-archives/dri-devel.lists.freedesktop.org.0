Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B369375F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 13:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DC410E038;
	Sun, 12 Feb 2023 12:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Sun, 12 Feb 2023 12:43:19 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166B10E038
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1676205381; bh=4nowZLlpTXWv7xk9wf/v+8Q3CYeyl/nb8+o+G82YpTw=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=SlDaNtrEGKCrZKQkkhSY/MNI6Dr1HaTx+cSoQESTqDUUBPCR7T07nvbaYPP2p/UiU
 J6eqxopxGaOY7Xur0AFFpr/vnQ4mBUP1l1SXWrX1Cti6nopSga42z8THB9IZJ2OWQI
 dWxVMWXY43+MTQnC/8FLoktx1zEG9ikbDA+2nEd0=
Date: Sun, 12 Feb 2023 13:36:21 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 1/1] drm/panel: st7703: Fix resume of XBD599 panel
Message-ID: <20230212123621.jo56yqlburd6g6ir@core>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Frank Oltmanns <frank@oltmanns.dev>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230212120830.46880-1-frank@oltmanns.dev>
 <20230212120830.46880-2-frank@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212120830.46880-2-frank@oltmanns.dev>
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
Cc: Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 01:08:29PM +0100, Frank Oltmanns wrote:
> In contrast to the JH057N panel, the XBD599 panel does not require a 20
> msec delay after initialization and exiting sleep mode. Therefore, move
> the delay into the already existing device specific initialization
> function.
> 
> Also, the timing contraints after entering and exiting sleep mode differ
> between the two panels:
>  - The JH057N requires a shorter delay than the XDB599 after waking up
>    from sleep mode and before enabling the display.
>  - The XDB599 requires a delay in order to drain the display of charge,
>    which is not required on the JH057N.

There's no difference between the panels here. It's a controller specified
requirement.

https://megous.com/dl/tmp/1ef533ed8a7ce841.png

60ms used in the driver between sleep out and display on is just
incorrect from the datasheet perspective.

You also have to wait 120ms after sleep in (or HW reset) and before shutting
down the panel. If you don't, after a bunch of cycles of this incorrect
power up/down sequence the panel will start blinking weirdly, and the incorrect
power up/down sequence without delays will not be able to recover it. You'll
have to let the panel sit for 5-10 minutes powered off before it starts to
behave itself again.

The documentation for sleep in specifies what's happening during sleep in,
and why this delay is necessary after sleep in:

https://megous.com/dl/tmp/2284b9d0f506b9b8.png

So there needs to be 120ms delay after sleep in and after sleep out,
regardless of which panel is driven by this controller, to ensure the panel
stays operational even when the user is quickly switching it on/off repeatedly.

So I don't think you should be doing panel specific quirks here.

regards,
	o.

> Therefore, introduce panel specific functions for the delays.
> 
> The XDB599 does not require a 20 msec delay between the SETBGP and
> SETVCOM commands. Therefore, remove the delay from the device specific
> initialization function.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> Cc: Ondrej Jirman <megi@xff.cz>
> Reported-by: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 40 ++++++++++++++++---
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 6747ca237ced..a149341c4a8b 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -66,6 +66,8 @@ struct st7703_panel_desc {
>  	unsigned long mode_flags;
>  	enum mipi_dsi_pixel_format format;
>  	int (*init_sequence)(struct st7703 *ctx);
> +	void (*wait_after_sleep_out)(void);
> +	void (*drain_charge)(void);
>  };
>  
>  static inline struct st7703 *panel_to_st7703(struct drm_panel *panel)
> @@ -126,10 +128,24 @@ static int jh057n_init_sequence(struct st7703 *ctx)
>  				   0x18, 0x00, 0x09, 0x0E, 0x29, 0x2D, 0x3C, 0x41,
>  				   0x37, 0x07, 0x0B, 0x0D, 0x10, 0x11, 0x0F, 0x10,
>  				   0x11, 0x18);
> +	msleep(20);
>  
>  	return 0;
>  }
>  
> +static void jh057n_wait_after_sleep_out(void)
> +{
> +	/*
> +	 * Panel is operational 120 msec after reset, i.e. 60 msec after
> +	 * sleep out.
> +	 */
> +	msleep(60);
> +}
> +
> +static void jh057n_drain_charge(void)
> +{
> +}
> +
>  static const struct drm_display_mode jh057n00900_mode = {
>  	.hdisplay    = 720,
>  	.hsync_start = 720 + 90,
> @@ -152,6 +168,8 @@ static const struct st7703_panel_desc jh057n00900_panel_desc = {
>  		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>  	.format = MIPI_DSI_FMT_RGB888,
>  	.init_sequence = jh057n_init_sequence,
> +	.wait_after_sleep_out = jh057n_wait_after_sleep_out,
> +	.drain_charge = jh057n_drain_charge,
>  };
>  
>  static int xbd599_init_sequence(struct st7703 *ctx)
> @@ -273,7 +291,6 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
>  			       0x07, /* VREF_SEL = 4.2V */
>  			       0x07  /* NVREF_SEL = 4.2V */);
> -	msleep(20);
>  
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
>  			       0x2C, /* VCOMDC_F = -0.67V */
> @@ -315,6 +332,18 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  	return 0;
>  }
>  
> +static void xbd599_wait_after_sleep_out(void)
> +{
> +	msleep(120);
> +}
> +
> +static void xbd599_drain_charge(void)
> +{
> +	/* Drain diplay of charge, to work correctly on next power on. */
> +	msleep(120);
> +}
> +
> +
>  static const struct drm_display_mode xbd599_mode = {
>  	.hdisplay    = 720,
>  	.hsync_start = 720 + 40,
> @@ -336,6 +365,8 @@ static const struct st7703_panel_desc xbd599_desc = {
>  	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>  	.format = MIPI_DSI_FMT_RGB888,
>  	.init_sequence = xbd599_init_sequence,
> +	.wait_after_sleep_out = xbd599_wait_after_sleep_out,
> +	.drain_charge = xbd599_drain_charge,
>  };
>  
>  static int st7703_enable(struct drm_panel *panel)
> @@ -350,16 +381,13 @@ static int st7703_enable(struct drm_panel *panel)
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
> +	ctx->desc->wait_after_sleep_out();
>  
>  	ret = mipi_dsi_dcs_set_display_on(dsi);
>  	if (ret)
> @@ -384,6 +412,8 @@ static int st7703_disable(struct drm_panel *panel)
>  	if (ret < 0)
>  		dev_err(ctx->dev, "Failed to enter sleep mode: %d\n", ret);
>  
> +	ctx->desc->drain_charge();
> +
>  	return 0;
>  }
>  
> -- 
> 2.39.1
> 
