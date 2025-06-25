Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292EAE7A5A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300C410E69C;
	Wed, 25 Jun 2025 08:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B7E10E69C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:35:25 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 0036B1F0004F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 08:35:20 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id E2B28AC7A36; Wed, 25 Jun 2025 08:35:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 4EC5EAC7A2F;
 Wed, 25 Jun 2025 08:35:18 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:35:16 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Message-ID: <aFu0xIHURuDttwJn@shepard>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lE79oaprNLAlqRlL"
Content-Disposition: inline
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lE79oaprNLAlqRlL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your work!

On Fri 21 Feb 25, 17:17, Kuba Szczodrzy=C5=84ski wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
>=20
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.

=46rom what I understand of section 5.1.4.2 LVDS Mode Configuration Process
there's two LVDS outputs:
- LVDS0, driven by the combo-phy
- LVDS1, driven by the usual TCON0 LVDS PHY

As far as I understand the LVDS_IF register still has to be configured for
LVDS0. The D1 manual mentions a LVDS1_IF register at offset 0x244 (which I =
don't
see in the T113-S3 manual, but is probably also there), which is liekely us=
ed to
configure LVDS1. Then we find our LVDS_ANA0/ANA1 registers that are likely =
just
used for LVDS1.

While this series adds support for LVDS0 only, it would be good to also be =
able
to support LVDS1, including dual-link modes. So eventually we'd need a way =
to
actually support both cases.

It would be great if you could include these details somewhere so they don'=
t get
lost. And this seems to be the exact same situation as the A133 by the way.

All the best,

Paul

> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.
>=20
> Kuba Szczodrzy=C5=84ski (5):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>=20
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 10 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 40 ++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 65 ++++++++++++++++++-
>  4 files changed, 119 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.25.1
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--lE79oaprNLAlqRlL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbtMQACgkQhP3B6o/u
lQy1gA/+Iu8VPy90JA8o66lrxeIiIPWu6Xc+0rbfnad0J7/iNziGmCOxQ3XaZbd7
W5L9p+yX9ByxxHM5Ijwujnq47fMWfOSXRCtwxN7BR2rlpp9F6RmnI7qxRnv14n74
ygKt4UEbPCsvtLj6X7w76NQK1qotvnQYwwdkoRKM0zKKvah2N49FFgSmue/AI3QZ
rDbK/WWXOdxuEIv8kp6L3zlWLsm9Rdc9NprRjlXzTESyHfFlE7be8hiKs1OLwoh2
jy9PFCzCSSbWx6ePb6pjPq07gVmjQxr4IQys0EHgxWvNeq4d/AdLzzijuiWR9sbM
FfzTvWtV/eSrg1cedRGejZqY9K+rHC1naCmaJaxXppqBcTveO/coAb3Gt3HJh6PL
NU+LWe1mFgKS1iU+PZX8Kz2eRmeqYBxPHNIpgLsqGlnqeHG1yNODCgj84PJF5nN6
1vnELm6+dBfMhg7LYv/N0Z1kaYHAyFPU7F0Cq3L+NHRiqBCZK2nSRnb7DhqNt4Nn
jcQbee+prBnM+tMoH5qtJLQ8vZ37XNZwbmHKOP/f5mzS04YUsWI2cvdSvXReMgLZ
TfJjvNYmIZdarxMFsA6+E0TeZp7l7zLuxMFAO/v83VpxtmRnx5w+kYc4VJG7vAe3
cMlHuxed0U8beaagiB+SYqTPx4VFjBLAw2SY8RYS4HuovYh4v5o=
=RNKR
-----END PGP SIGNATURE-----

--lE79oaprNLAlqRlL--
