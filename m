Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C241BDD49
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 15:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21726E086;
	Wed, 29 Apr 2020 13:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E2C6E086
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 13:14:09 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id F36E26000C;
 Wed, 29 Apr 2020 13:13:59 +0000 (UTC)
Date: Wed, 29 Apr 2020 15:13:59 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] sun6i: dsi: fix gcc-4.8
Message-ID: <20200429131359.GJ610776@aptenodytes>
References: <20200428215105.3928459-1-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20200428215105.3928459-1-arnd@arndb.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1854675451=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1854675451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 28 Apr 20, 23:50, Arnd Bergmann wrote:
> Older compilers warn about initializers with incorrect curly
> braces:
>=20
> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c: In function 'sun6i_dsi_encoder_en=
able':
> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:720:8: error: missing braces aroun=
d initializer [-Werror=3Dmissing-braces]
>   union phy_configure_opts opts =3D { 0 };
>         ^
> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:720:8: error: (near initialization=
 for 'opts.mipi_dphy') [-Werror=3Dmissing-braces]
>=20
> Use the GNU empty initializer extension to avoid this.

Looks good to me:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

But maybe use the drm/sun4i: dsi: prefix instead (granted, it wasn't used in
the commit being fixed).

Cheers,

Paul

> Fixes: bb3b6fcb6849 ("sun6i: dsi: Convert to generic phy handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index f6c67dd87a05..aa67cb037e9d 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -718,7 +718,7 @@ static void sun6i_dsi_encoder_enable(struct drm_encod=
er *encoder)
>  	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
>  	struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
>  	struct mipi_dsi_device *device =3D dsi->device;
> -	union phy_configure_opts opts =3D { 0 };
> +	union phy_configure_opts opts =3D { };
>  	struct phy_configure_opts_mipi_dphy *cfg =3D &opts.mipi_dphy;
>  	u16 delay;
>  	int err;
> --=20
> 2.26.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6pfZcACgkQ3cLmz3+f
v9EZuwf/c+11FwGVP8LmF3ZNopR32d3cDoA0mLr1vizGfseJVldesiJUy/VuZI7I
ppIjTfjte/iBHuyGcv8oAc0GQfkJaCvLFlcSkDUGgH5UfPEqxCTGvPLvV0doT77g
MAUZw1EnVM2zHZ9IvjLmmes2/nvRMs/knC4qf8H8VW2LcFbDqUt+P9SioDHMEOzz
ZpKNqa7C6Ll/KK7RljKfhk/i1bzakwyEw5Mv31bMBjJ5QeiP+OnLBDBD6ltBfjM7
f4ODxc85UpxYB9uoRfgQoE2Dk2aN2h2OMTGt7USnEA3HesH1oxRpP7xWpefwHGfY
oHhO7JHJ8TOwoWS/iIN+wsbHxbDpWw==
=QQXf
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--

--===============1854675451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1854675451==--
