Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75A6EE18
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 08:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F0A6E866;
	Sat, 20 Jul 2019 06:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16DB6E866
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 06:58:35 +0000 (UTC)
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1F06B20008;
 Sat, 20 Jul 2019 06:58:31 +0000 (UTC)
Date: Sat, 20 Jul 2019 08:58:30 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH v6 11/22] clk: sunxi-ng: a64: Add minimum rate for PLL_MIPI
Message-ID: <20190720065830.zn3txpyduakywcva@flea>
References: <20190605064933.6bmskkxzzgn35xz7@flea>
 <CAMty3ZCCP=oCqm5=49BsjwoxdDETgBfU_5g8fQ=bz=iWApV0tw@mail.gmail.com>
 <20190614142406.ybdiqfppo5mc5bgq@flea>
 <CAMty3ZB45cHx3WeXnywBh2_UA_bTmFs6yBTqLWA1BNf4fQtVvQ@mail.gmail.com>
 <20190625144930.5hegt6bkzqzykjid@flea>
 <CAMty3ZCmj0Rz7MMhLqihsvLQi+1CHf0fAoJQ4QN65xB-bwxaJw@mail.gmail.com>
 <20190703114933.u3x4ej3v7ocewvif@flea>
 <CAOf5uw=ZEvMV1hFQE986rNG_ctpReGbjbZzv0m=OzKPdBh57uQ@mail.gmail.com>
 <20190711100100.cty3s6rs3w27low6@flea>
 <CAOf5uw=3fiMuhcj3kDtCaGNTsxHKRrYb79MXZ+yUZtmf0jU10A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOf5uw=3fiMuhcj3kDtCaGNTsxHKRrYb79MXZ+yUZtmf0jU10A@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0341558703=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0341558703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r4qilfqhu2adyooy"
Content-Disposition: inline


--r4qilfqhu2adyooy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2019 at 07:43:16PM +0200, Michael Nazzareno Trimarchi wrote:
> > > tcon-pixel clock is the rate that you want to achive on display side
> > > and if you have 4 lanes 32bit or lanes and different bit number that
> > > you need to have a clock that is able to put outside bits and speed
> > > equal to pixel-clock * bits / lanes. so If you want a pixel-clock of
> > > 40 mhz and you have 32bits and 4 lanes you need to have a clock of
> > > 40 * 32 / 4 in no-burst mode. I think that this is done but most of
> > > the display.
> >
> > So this is what the issue is then?
> >
> > This one does make sense, and you should just change the rate in the
> > call to clk_set_rate in sun4i_tcon0_mode_set_cpu.
> >
> > I'm still wondering why that hasn't been brought up in either the
> > discussion or the commit log before though.
> >
> Something like this?
>
> drivers/gpu/drm/sun4i/sun4i_tcon.c     | 20 +++++++++++---------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  2 --
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 64c43ee6bd92..42560d5c327c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -263,10 +263,11 @@ static int sun4i_tcon_get_clk_delay(const struct
> drm_display_mode *mode,
>  }
>
>  static void sun4i_tcon0_mode_set_common(struct sun4i_tcon *tcon,
> -                                       const struct drm_display_mode *mode)
> +                                       const struct drm_display_mode *mode,
> +                                       u32 tcon_mul)
>  {
>         /* Configure the dot clock */
> -       clk_set_rate(tcon->dclk, mode->crtc_clock * 1000);
> +       clk_set_rate(tcon->dclk, mode->crtc_clock * tcon_mul * 1000);
>
>         /* Set the resolution */
>         regmap_write(tcon->regs, SUN4I_TCON0_BASIC0_REG,
> @@ -335,12 +336,13 @@ static void sun4i_tcon0_mode_set_cpu(struct
> sun4i_tcon *tcon,
>         u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
>         u8 lanes = device->lanes;
>         u32 block_space, start_delay;
> -       u32 tcon_div;
> +       u32 tcon_div, tcon_mul;
>
> -       tcon->dclk_min_div = SUN6I_DSI_TCON_DIV;
> -       tcon->dclk_max_div = SUN6I_DSI_TCON_DIV;
> +       tcon->dclk_min_div = 4;
> +       tcon->dclk_max_div = 127;
>
> -       sun4i_tcon0_mode_set_common(tcon, mode);
> +       tcon_mul = bpp / lanes;
> +       sun4i_tcon0_mode_set_common(tcon, mode, tcon_mul);
>
>         /* Set dithering if needed */
>         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> @@ -366,7 +368,7 @@ static void sun4i_tcon0_mode_set_cpu(struct
> sun4i_tcon *tcon,
>          */
>         regmap_read(tcon->regs, SUN4I_TCON0_DCLK_REG, &tcon_div);
>         tcon_div &= GENMASK(6, 0);
> -       block_space = mode->htotal * bpp / (tcon_div * lanes);
> +       block_space = mode->htotal * tcon_div * tcon_mul;
>         block_space -= mode->hdisplay + 40;
>
>         regmap_write(tcon->regs, SUN4I_TCON0_CPU_TRI0_REG,
> @@ -408,7 +410,7 @@ static void sun4i_tcon0_mode_set_lvds(struct
> sun4i_tcon *tcon,
>
>         tcon->dclk_min_div = 7;
>         tcon->dclk_max_div = 7;
> -       sun4i_tcon0_mode_set_common(tcon, mode);
> +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
>
>         /* Set dithering if needed */
>         sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
> @@ -487,7 +489,7 @@ static void sun4i_tcon0_mode_set_rgb(struct
> sun4i_tcon *tcon,
>
>         tcon->dclk_min_div = 6;
>         tcon->dclk_max_div = 127;
> -       sun4i_tcon0_mode_set_common(tcon, mode);
> +       sun4i_tcon0_mode_set_common(tcon, mode, 1);
>
>         /* Set dithering if needed */
>         sun4i_tcon0_mode_set_dithering(tcon, connector);
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> index 5c3ad5be0690..a07090579f84 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
> @@ -13,8 +13,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mipi_dsi.h>
>
> -#define SUN6I_DSI_TCON_DIV     4
> -
>  struct sun6i_dsi {
>         struct drm_connector    connector;
>         struct drm_encoder      encoder;

I had more something like this in mind:
http://code.bulix.org/nlp5a4-803511

You really don't need to change the divider range (or this is another
issue that the one you mentionned).

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--r4qilfqhu2adyooy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTK7lgAKCRDj7w1vZxhR
xVa+AP0bfQya4jtzGyWV49lA0eZyoDZnw2AUlmXF1CQyK/h/ywD/TqhlriaoZJCZ
lSmIH7BxD5GMElLjo35ndu9pK23JYwU=
=dJ5o
-----END PGP SIGNATURE-----

--r4qilfqhu2adyooy--

--===============0341558703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0341558703==--
