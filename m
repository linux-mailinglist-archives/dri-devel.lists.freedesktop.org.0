Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18ED2ABE5
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996338979E;
	Sun, 26 May 2019 19:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912548979E
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 19:19:52 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0A271240003;
 Sun, 26 May 2019 19:19:40 +0000 (UTC)
Date: Sun, 26 May 2019 21:19:40 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
Subject: Re: [PATCH] drm/sun4i: fix warning PTR_ERR_OR_ZERO can be used
Message-ID: <20190526191940.ddr2yd7szfidtiu2@flea>
References: <20190525072509.GA6979@hari-Inspiron-1545>
MIME-Version: 1.0
In-Reply-To: <20190525072509.GA6979@hari-Inspiron-1545>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0936635736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0936635736==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wbyhtjebfo7bq6wk"
Content-Disposition: inline


--wbyhtjebfo7bq6wk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

On Sat, May 25, 2019 at 12:55:09PM +0530, Hariprasad Kelam wrote:
> fix below warnings reported by coccicheck
>
> ./drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c:174:1-3: WARNING:
> PTR_ERR_OR_ZERO can be used
> ./drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c:236:1-3: WARNING:
> PTR_ERR_OR_ZERO can be used
> ./drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:285:1-3: WARNING:
> PTR_ERR_OR_ZERO can be used
> ./drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c:142:1-3: WARNING:
> PTR_ERR_OR_ZERO can be used
> ./drivers/gpu/drm/sun4i/sun4i_dotclock.c:198:1-3: WARNING:
> PTR_ERR_OR_ZERO can be used
>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_dotclock.c      | 4 +---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  | 4 +---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c      | 4 +---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 4 +---
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 4 +---
>  5 files changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> index 2a15f2f..e0fd19d 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> @@ -195,10 +195,8 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
>  	dclk->hw.init = &init;
>
>  	tcon->dclk = clk_register(dev, &dclk->hw);
> -	if (IS_ERR(tcon->dclk))
> -		return PTR_ERR(tcon->dclk);
>
> -	return 0;
> +	return PTR_ERR_OR_ZERO(tcon->dclk);

Unfortunately, that was on purpose. It's much easier to extend if we
ever need to change anything there.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--wbyhtjebfo7bq6wk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOrmzAAKCRDj7w1vZxhR
xYHIAQCHJXC7nn+WNDI2HEnEBKzcFG+IbWIX34bHIZfhK4AnGgEAgZHJJQ6EF1xn
m34W2K3bjCbJ19Re4AH0OQy4fDUa5Ag=
=640m
-----END PGP SIGNATURE-----

--wbyhtjebfo7bq6wk--

--===============0936635736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0936635736==--
