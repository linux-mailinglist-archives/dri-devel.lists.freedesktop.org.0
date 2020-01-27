Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB44149FAF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B2B6EA40;
	Mon, 27 Jan 2020 08:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9376EA40
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 08:16:52 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id EA3203A26BB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 08:14:44 +0000 (UTC)
Received: from aptenodytes (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D6AE0100016;
 Mon, 27 Jan 2020 08:14:19 +0000 (UTC)
Date: Mon, 27 Jan 2020 09:14:19 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH] Revert "drm/sun4i: drv: Allow framebuffer modifiers in
 mode config"
Message-ID: <20200127081419.GA25668@aptenodytes>
References: <20200126065937.9564-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20200126065937.9564-1-jernej.skrabec@siol.net>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0551255853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0551255853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Sun 26 Jan 20, 07:59, Jernej Skrabec wrote:
> This reverts commit 9db9c0cf5895e4ddde2814360cae7bea9282edd2.
>=20
> Setting mode_config.allow_fb_modifiers manually is completely
> unnecessary. It is set automatically by drm_universal_plane_init() based
> on the fact if modifier list is provided or not. Even more, it breaks
> DE2 and DE3 as they don't support any modifiers beside linear. Modifiers
> aware applications can be confused by provided empty modifier list - at
> least linear modifier should be included, but it's not for DE2 and DE3.

Makes sense and it's apparently the norm to not report any modifier blob
when only linear is supported, so let's stick to that.

Note that when the reverted patch was applied, the core didn't set
allow_fb_modifiers on its own yet. But it does now so let's rely on it inst=
ead.

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Fixes: 9db9c0cf5895 ("drm/sun4i: drv: Allow framebuffer modifiers in mode=
 config")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 5ae67d526b1d..328272ff77d8 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -85,7 +85,6 @@ static int sun4i_drv_bind(struct device *dev)
>  	}
> =20
>  	drm_mode_config_init(drm);
> -	drm->mode_config.allow_fb_modifiers =3D true;
> =20
>  	ret =3D component_bind_all(drm->dev, drm);
>  	if (ret) {
> --=20
> 2.25.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl4um9sACgkQ3cLmz3+f
v9GVMgf+Kc3KZDcNNctctpvlPceDVaF7D4PqnI4YqaMprQkDYXgo2FwW/lu16lNQ
NrFx8PXex2bkporLkE2jcJRIA9B1A0Wbfoy86MagAJtCtFCgCaQIXM+Y/7yGSbn6
wfDytjFPdpngw7hZrfh9AljDP6w907SmNvvugVTG6eEKH8xRtYl3NYDFDvms1Fns
2jQTT67palIJs10fIPCfTU0HJd2fN92lqVDiwzx0HReR4nCqVA4BTd6wxn5sieiQ
iI3AIXJawMv0xdUs0idpRfKavaPoRWVxolUPg4Umr1RHJmxV/HS4ERRK+T4KlJmk
EdW2EIlo4bmuFeFhog1Q8X1XURDJ1g==
=lFH+
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

--===============0551255853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0551255853==--
