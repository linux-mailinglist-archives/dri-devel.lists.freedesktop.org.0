Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F672627DB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5066E9DF;
	Wed,  9 Sep 2020 07:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5DB6E8BA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 19:11:29 +0000 (UTC)
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AD43F295E47;
 Tue,  8 Sep 2020 20:11:26 +0100 (BST)
Date: Tue, 8 Sep 2020 15:11:19 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 5/5] drm/panfrost: add Amlogic GPU integration quirks
Message-ID: <20200908191119.GC10568@kevin>
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-6-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-6-narmstrong@baylibre.com>
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1733970561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1733970561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> This adds the required GPU quirks, including the quirk in the PWR registe=
rs at the GPU
> reset time and the IOMMU quirk for shareability issues observed on G52 in=
 Amlogic G12B SoCs.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 36463c89e966..efde5e2acc35 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -656,7 +656,25 @@ static const struct panfrost_compatible default_data=
 =3D {
>  	.pm_domain_names =3D NULL,
>  };
> =20
> +static const struct panfrost_compatible amlogic_gxm_data =3D {
> +	.num_supplies =3D ARRAY_SIZE(default_supplies),
> +	.supply_names =3D default_supplies,
> +	.vendor_reset_quirk =3D panfrost_gpu_amlogic_reset_quirk,
> +};
> +
> +static const struct panfrost_compatible amlogic_g12a_data =3D {
> +	.num_supplies =3D ARRAY_SIZE(default_supplies),
> +	.supply_names =3D default_supplies,
> +	.vendor_reset_quirk =3D panfrost_gpu_amlogic_reset_quirk,
> +	.pgtbl_quirks =3D IO_PGTABLE_QUIRK_ARM_BROKEN_SH,
> +};
> +
>  static const struct of_device_id dt_match[] =3D {
> +	/* Set first to probe before the generic compatibles */
> +	{ .compatible =3D "amlogic,meson-gxm-mali",
> +	  .data =3D &amlogic_gxm_data, },
> +	{ .compatible =3D "amlogic,meson-g12a-mali",
> +	  .data =3D &amlogic_g12a_data, },
>  	{ .compatible =3D "arm,mali-t604", .data =3D &default_data, },
>  	{ .compatible =3D "arm,mali-t624", .data =3D &default_data, },
>  	{ .compatible =3D "arm,mali-t628", .data =3D &default_data, },
> --=20
> 2.22.0
>=20

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9X11YACgkQ/v5QWgr1
WA1SyhAAgVduu4bMRXVDtE5vLGTa6kOSM3YzDXPkd5eadv5cvcsZCPjzItTlpbV0
TdS7/SVgZZyDkGGCI2YzL5j7cNkso6ffe6y6LrUPkttYFfmsib3VuEUxLZG+evUD
rgq3BlmPI/4++/hmzaBRE8lD3TjhcY7cki3cpoz696GxstugGb2XkXuUpnUwS5f0
J4ZHmc5foIP3BtUUo2WVE2J4Ey0ljCM4pBjFtT72h1PMZDiTPo0nnNzZWbmu7ScM
eNQvFReKPVK9WTLYjpDzB1Da5jDB7ULPCLdQ2Dihb/QdPhjN7Ik47H+p82CxZ+2/
tMvJaPDEH8IzwkJTQojv148r+uWuUQV2Lqllkn4WTLvNwdWeIb8r/rr0ygiDqg9y
/poPMKnL+OIyvL4nBQMc+W1BWB4CPPjBYHEfKA95c2bb1djdsAYyF+uVhsbMbTPQ
q3YlWlJLadtYpSiHIVtVE9ISzE8+c9XnfruhZfniTTGHAI5bsagvYTh3ONdhI/I2
W2zNBiF0mqNBxoyAc14KURy0PMCNfgsvFiS/n+E4uB72NDdHhu7S7CbG96tsUQPX
zf2PrPHCarpFSK1mCr9OCdHWeJ1iWR7gNqrMYgZAzXNKtrqrFjle7KHnxIVU09l3
BxpldnOaHPD32usBXkAmlOWlSGv2qs3AEt5kpOCs8AM6LBZOCLk=
=14Ih
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--

--===============1733970561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1733970561==--
