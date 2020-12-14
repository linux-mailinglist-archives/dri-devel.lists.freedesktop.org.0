Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0839D2D988E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231D589CF7;
	Mon, 14 Dec 2020 13:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278B089CF7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 13:10:14 +0000 (UTC)
Date: Mon, 14 Dec 2020 14:10:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607951414;
 bh=dKv1H+q20h9wB+EQwZeyqYDNnPUSysxHzXC4mfbm/iw=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=fGxYOCWi2KbOMU80qO83Q7TkHPWueqO1YswJFwEUrYOTxJQyVND4NSefEV0pRF4Sv
 svzmEbDMrIw/4/WF6zc6TudENehBp9Q2meAA+JrtheZIiF96E5yhVBHFlg1HXf69M3
 7egM1Z4iZmt5lYXgilCd6z5Gtakq5OxPOEp23o1scsR6y+glUUh2f4HDQGfXc1R3o1
 BdyTq4QxB30ERlGvxo7CBph0reA83J9B9b0ouaLDx7yCZmldKFY3ed4FpvvAKgHPnB
 3MZ9nVcytwppMxS6YwU3DNJWaPAzmFnacHMncpHJpzVoj519LbTuP7nhCCNPmOGeUm
 R4jUfN/+2SaOw==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 04/29] drm/omap: dsi: set trans_mode according to
 client mode_flags
Message-ID: <20201214131012.fq2372anlaq5em4f@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-5-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0173223832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0173223832==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6athqr4jx65ves64"
Content-Disposition: inline


--6athqr4jx65ves64
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:30PM +0200, Tomi Valkeinen wrote:
> The DSI host driver currently ignores the video mode flags in
> client->mode_flags. Add the code to take the transfer mode from client's
> mode_flags.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index c3592c6db977..7fee9cf8782d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5140,6 +5140,13 @@ static int omap_dsi_host_attach(struct mipi_dsi_ho=
st *host,
>  	dsi->config.lp_clk_min =3D 7000000; // TODO: get from client?
>  	dsi->config.lp_clk_max =3D client->lp_rate;
> =20
> +	if (client->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +		dsi->config.trans_mode =3D OMAP_DSS_DSI_BURST_MODE;
> +	else if (client->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +		dsi->config.trans_mode =3D OMAP_DSS_DSI_PULSE_MODE;
> +	else
> +		dsi->config.trans_mode =3D OMAP_DSS_DSI_EVENT_MODE;
> +
>  	dsi->ulps_auto_idle =3D false;
> =20
>  	return 0;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--6athqr4jx65ves64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XZDMACgkQ2O7X88g7
+poa8RAAqUOJ7cKqVdrqk2uVFqOxHnf0mZaGbceU28OXEjIydmjKKVo17zB4i/6P
PzIhDCgkz7tdbuaaE0N7ZNg9ZnFH5m9PPMHGc6oy88P3E3H4PUSg9I0u72u8mrKo
6v56L4JB2WFd/MsLJhKOkiNZx1ijpAQ6mgsS+dsgGHfBTaRuZTHfG++/HzEDM9mw
pLAHeVcDHV+retGikDFtQ8xVsNWqbd/yGinulXzONugTaAaJlQ76FFJtWunAo+vu
fb6wcdzeET7NSM86jzG/uKFrZQ3c6sycDbeWEreVkMXw1Dx/UV/9MQVa6i3Nie8D
EQSq9HFIrtIonMnxPYTr/2mdCECl6ewjt+yooyToZstU8lzzVZ1UvDEVGL/C5Wrj
FUQzsyqxAGIKly/X7pw9pG7vDVUqT2gNg+4B5PiOyHpQWLSA3H0S3hOG/SO6CPrT
5BgRPj2WRNEOsujg3qGVIqSImvLHOw3VAwi6Dg/11L4YPZrfEny9YbF7YC6YpTpZ
BDdXztPvpQDqKOpMJI0Y7aQ4rkB7lu+UkkZiXHHZVZdNm4wWji9WdLNcLPK41ICg
WgpIn9EIwXQ7KtfGZRPZ8psZJewtQEvKqRBeWuVMqg+9KzJJRkp7+wbjtx6KJA9/
PYaI2S0QG8QlFqQzpIJAu2ukIlFq7nOKLqU21i7wW+DDve3CPFc=
=J6Rp
-----END PGP SIGNATURE-----

--6athqr4jx65ves64--

--===============0173223832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0173223832==--
