Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0386D3773
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 12:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ADF10E2A0;
	Sun,  2 Apr 2023 10:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0135C10E2A0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 10:55:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Pq9sW6T1fz9sVx;
 Sun,  2 Apr 2023 12:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1680432911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGmLL2lif/lN1JO6yxqqMUbCCQ09GzfW7zKPJU5P/qA=;
 b=B53XDWj8eAlOkkTpZqQh0vAT+uK+slZGNpNqeRmmbjiB3J0NWX56+wQF62EussCLl8zDKW
 m5KnuZ10WixAhM111aPX4gVET5pbzPjBITADUpWWIKjCERRQ1aaYprjCcV/52/JU5MoJnS
 L36CnY7LVREDx/PR8iugWLYT3S0LJspLg3zL2XdpOyCjVNui/7ktJX3Yhra0kav6S9cxch
 +WENgzLr/+iVvFculnbm2sloiGCTYMSy7NWFFZtOcaHvMMEdXySRz6j2S3vhCiiemUv4Wc
 HZpDlHWIaPqv8k/NE7QWye0VOaZjmUWS0+WM7cVPf4eC4oGqS/gVtYTF45DEbA==
References: <20230331110245.43527-1-me@crly.cz>
 <20230331110245.43527-4-me@crly.cz>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Roman Beranek <me@crly.cz>
Subject: Re: [PATCH 3/3] drm: sun4i: calculate proper DCLK rate for DSI
Date: Sun, 02 Apr 2023 12:49:08 +0200
In-reply-to: <20230331110245.43527-4-me@crly.cz>
Message-ID: <87h6tya70h.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman,

On 2023-03-31 at 13:02:45 +0200, Roman Beranek <me@crly.cz> wrote:
> In DSI mode, TCON0's data clock is required to run at 1/4 the per-lane
> bit rate.
>
> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 36 +++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index eec26b1faa4b..b263de7a8237 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -291,18 +291,6 @@ static int sun4i_tcon_get_clk_delay(const struct drm_display_mode *mode,
>  	return delay;
>  }
>
> -static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> -					const struct drm_display_mode *mode)
> -{
> -	/* Configure the dot clock */
> -	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> -
> -	/* Set the resolution */
> -	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> -		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
> -		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
> -}
> -
>  static void sun4i_tcon0_mode_set_dithering(struct sun4i_tcon *tcon,
>  					   const struct drm_connector *connector)
>  {
> @@ -367,10 +355,18 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
>  	u32 block_space, start_delay;
>  	u32 tcon_div;
>
> +	/*
> +	 * dclk is required to run at 1/4 the DSI per-lane bit rate.
> +	 */
>  	tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
>  	tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
> +	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000 * (bpp / lanes)
> +						  / SUN6I_DSI_TCON_DIV);

When apply this to drm-next my panel stays dark. I haven't figured out
yet why, though. The other two patches in this series work fine, i.e.
they have no effect as they are just a refactoring.

I'm testing this on my pinephone. It's the same with the patch I
submitted. For whatever reason, it no longer works on drm-next.

At the time I'm writing this, drm-next is at 82bbec189ab3 "Merge
v6.3-rc4 into drm-next".

Does it work for you? And if so, on which commit are you basing this
series?

Thanks,
  Frank


>
> -	sun4i_tcon0_mode_set_common(tcon, mode);
> +	/* Set the resolution */
> +	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> +		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
> +		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
>
>  	/* Set dithering if needed */
>  	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> @@ -438,7 +434,12 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
>
>  	tcon->dclk_min_div = 7;
>  	tcon->dclk_max_div = 7;
> -	sun4i_tcon0_mode_set_common(tcon, mode);
> +	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> +
> +	/* Set the resolution */
> +	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> +		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
> +		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
>
>  	/* Set dithering if needed */
>  	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> @@ -515,7 +516,12 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
>
>  	tcon->dclk_min_div = tcon->quirks->dclk_min_div;
>  	tcon->dclk_max_div = 127;
> -	sun4i_tcon0_mode_set_common(tcon, mode);
> +	clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> +
> +	/* Set the resolution */
> +	regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> +		     SUN4I_TCON0_BASIC0_X(mode->crtc_hdisplay) |
> +		     SUN4I_TCON0_BASIC0_Y(mode->crtc_vdisplay));
>
>  	/* Set dithering if needed */
>  	sun4i_tcon0_mode_set_dithering(tcon, connector);


--
--
Frank Oltmanns
