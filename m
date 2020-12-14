Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEC02D9B76
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607046E221;
	Mon, 14 Dec 2020 15:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7926E221
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:51:40 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:51:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607961100;
 bh=GjjKET4ROYd7vLP7YotwEKVQ4QwC7/hdTLGB/6/o5f4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=uobXXG+1bulKxufS3tamsopLW/60bCyy4kQztN8qlpVoOSrabZW1sFL7gumWKFRkf
 sTS1WKa2bwKK79gHJWM/2VObyL8UvMuM9kNDf13wWfazubHJt9uAksDY1TBQq6UO4k
 Drey7ipreNwMMtZO1YAO9EoyMDDMzu+XgrijPSetGys3d8abef5o1xjqkI6viohHcw
 Y/S/UBzYsITdu/A1EBC+mwjpg5oCaKhqap/2jWvr+gSZ5dw5a2Zv26OC6T3wPuslh/
 BoM3m2p175BJjmO2Oy9FkaI/F9dU+HDdDDgjt/Nks0PRKtn9jO9SykL8eOmH8WcQDj
 3VF1yfn9XcTEA==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 14/29] drm/omap: dsi: enable HS before sending the frame
Message-ID: <20201214155138.jriutvnibw3pk7qe@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-15-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-15-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1290674386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1290674386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsbhh7tmwgh3viju"
Content-Disposition: inline


--tsbhh7tmwgh3viju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:40PM +0200, Tomi Valkeinen wrote:
> We currently use a single VC for sending commands and pixel data. The
> LP/HS mode for pixel data is correctly set to HS by accident, as we have
> set the VC to HS already earlier.
>=20
> However, if we use a different VC for video data, the VC is in LP mode.
> Fix this by always enabling HS mode before starting a frame update.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 544f5f1eed91..9d210a020916 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3918,6 +3918,8 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int vc)
> =20
>  	dsi_set_ulps_auto(dsi, false);
> =20
> +	dsi_vc_enable_hs(dssdev, vc, true);
> +
>  	/*
>  	 * Send NOP between the frames. If we don't send something here, the
>  	 * updates stop working. This is probably related to DSI spec stating
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--tsbhh7tmwgh3viju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XigoACgkQ2O7X88g7
+ppGUg//WF3Q3gopohSbdLxQ7pIXBQwLeudSwLtH+HvpxfEcqtpXaq0sdiowaQjX
ddD8uPncmyiswc4eAYad/uQzDBMxfxq61Jpj3yACQYYTRuxoLn3cF6SZ8fDyMurJ
gS6csq3HXWy9vzRkAWExfyodwod5jH0oz9Jn2xrDdiCtaWIBGdRGH6FCgW6CUAx+
Rd3Q7Xmq1PJjnaHgGtL+N+tCWRE+yOmpnsfBgpqEx9GXSecsbbZ7pUhxzDTMwy8x
fVJVCaf7LVDr8yd44JOrAeD7HniWdz/BGSodWE6ihlYMoxmc/qw/yWJrGn4jxff+
3Ea8OK6wN/cEOh5gvRXHU3WAIv0O+wVXzdxLubPTWRjMVEen9nsVusA0pmVj+ES8
GpfiWK48wh2LLvuY7ewxAUQus22T/Eb/27GnEr9e8/Ywn9zjTpJZL8DlW6eqwCC+
c9rjdKpQrr4doMTqy/Bb3aNybMAylIgwgRzKgdBM4BrqHuy6GxbBRxSAbwOOMC3P
cO/H5XNHOikCT6YygNOnkxbP3vsSRokAuPX/sShlre5LhVqGjLgPTILupYSjl3RF
SoLp/zE9OzXC4xx2quXS6f+8VJh2hVSohWQnJR2c21cfNMiRBbK1NratjxVwC+8L
U7VErq4c3J3vMR0HPM8Oc6gP1GhEQlwwHxcHZKLTDlQbsHw/oyA=
=V9Nd
-----END PGP SIGNATURE-----

--tsbhh7tmwgh3viju--

--===============1290674386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1290674386==--
