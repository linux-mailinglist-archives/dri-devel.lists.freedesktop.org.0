Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5112E51A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D376E046;
	Thu,  2 Jan 2020 10:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FB96E046
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 10:54:27 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF7D9215A4;
 Thu,  2 Jan 2020 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577962467;
 bh=Fy88OIUGBdZink3Zu23Vq6yGNZlM5ZZ5JWMt1esy4l0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cnBsvJ05p3Ds7yL0MLHCjR87NT9t5mzkYeGJmJgiMgDmK713FdzWNghkKaALIVWW8
 ny0IgEDcvmNZlpP1KD/cpc1Mfb22aSVqvYBbBCl6JFyO01yO0qH8Db4VwIO8YGlSGX
 A7guAbA1c1PsU6M9qAgFuqHPTe5Z55brL7JTtrX4=
Date: Thu, 2 Jan 2020 11:54:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 2/9] drm/sun4i: tcon: Add TCON LCD support for R40
Message-ID: <20200102105424.kmte7aooh2gkrcnu@gilmour.lan>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
 <20191231130528.20669-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20191231130528.20669-3-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0655106411=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0655106411==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3yo7gd5amqttw6gt"
Content-Disposition: inline


--3yo7gd5amqttw6gt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 31, 2019 at 06:35:21PM +0530, Jagan Teki wrote:
> TCON LCD0, LCD1 in allwinner R40, are used for managing
> LCD interfaces like RGB, LVDS and DSI.
>
> Like TCON TV0, TV1 these LCD0, LCD1 are also managed via
> tcon top.
>
> Add support for it, in tcon driver.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - none
>
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index fad72799b8df..69611d38c844 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -1470,6 +1470,13 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
>  	.has_channel_1		= true,
>  };
>
> +static const struct sun4i_tcon_quirks sun8i_r40_lcd_quirks = {
> +	.supports_lvds		= true,
> +	.has_channel_0		= true,
> +	/* TODO Need to support TCON output muxing via GPIO pins */
> +	.set_mux		= sun8i_r40_tcon_tv_set_mux,

What is this muking about? And why is it a TODO?

Maxime

--3yo7gd5amqttw6gt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg3L4AAKCRDj7w1vZxhR
xRZOAPoCD7Z/HWJ+sNCuLAC4kWMalabFj+9JAxw7wHzW3V/8/AD/Rh1zt1mpPjmK
b5SrQ6eKprPdUtwD1w0Aefuflq6U4QM=
=r3km
-----END PGP SIGNATURE-----

--3yo7gd5amqttw6gt--

--===============0655106411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0655106411==--
