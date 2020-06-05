Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25B81EFF29
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 19:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C686E4FF;
	Fri,  5 Jun 2020 17:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278546E4FF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:37:59 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eda82ea0000>; Fri, 05 Jun 2020 10:37:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 05 Jun 2020 10:37:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 05 Jun 2020 10:37:58 -0700
Received: from localhost (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 5 Jun 2020 17:37:53 +0000
Date: Fri, 5 Jun 2020 19:37:50 +0200
From: Thierry Reding <treding@nvidia.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/3] drm/dsi: use stack buffer in mipi_dsi_dcs_write()
Message-ID: <20200605173750.GC1265773@ulmo>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <CACvgo53nBpP_cHp=kvBQJnCacdqPfOVxbTf1_x=KhiCyNzbWuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACvgo53nBpP_cHp=kvBQJnCacdqPfOVxbTf1_x=KhiCyNzbWuQ@mail.gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.13.1 (2019-12-14)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1591378666; bh=MwVorxjQC/AXHjEJT0DP50gb4elANrB0/3lSIluDpaU=;
 h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
 MIME-Version:In-Reply-To:X-NVConfidentiality:User-Agent:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:
 Content-Disposition;
 b=Y4SKpjr6Isv098rzQdVJ0svPyPOJRvV4IFUlRIau/ZMKRzB0jTtxLzDkvCTFbD1Jn
 QYX9OontoPOJ1Vvsiq8oNb9SnowClOGHIXMUFx2tjmdwOhjLGHJ81JMixPGu18BAEL
 uv38XV98GPctgQ4FXUaz021GbHBdlP7duepJwWYw1M5DCKIu8LtO1f3jMprLlJeFin
 vrzu8ZZcjzYXNa7+2SyHUpOARr6epqBsIlkJZ+rHA2opIyPkWWRSzTwio9obk8hfpw
 BjBDTCsIAbyfH9hTm8o/jUBLAl5ZbYOzAznGLHUAGn1gy1XgOqS8BlAxQQ41zouyE1
 F087pTWasd6fg==
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0788024996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0788024996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 05:47:41PM +0100, Emil Velikov wrote:
> On Tue, 5 May 2020 at 17:05, Emil Velikov <emil.l.velikov@gmail.com> wrot=
e:
> >
> > Currently the function heap allocates when we have any payload. Where in
> > many case the payload is 1 byte - ouch.
> >
> > From casual observation, vast majority of the payloads are smaller than
> > 8 bytes - so use a stack array tx[8] to avoid the senseless kmalloc and
> > kfree dance.
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_=
dsi.c
> > index 55531895dde6..b96d5b4629d7 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -748,26 +748,26 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device=
 *dsi, u8 cmd,
> >  {
> >         ssize_t err;
> >         size_t size;
> > +       u8 stack_tx[8];
> >         u8 *tx;
> >
> > -       if (len > 0) {
> > -               size =3D 1 + len;
> > -
> > +       size =3D 1 + len;
> > +       if (len > ARRAY_SIZE(stack_tx) - 1) {
> >                 tx =3D kmalloc(size, GFP_KERNEL);
> >                 if (!tx)
> >                         return -ENOMEM;
> > -
> > -               /* concatenate the DCS command byte and the payload */
> > -               tx[0] =3D cmd;
> > -               memcpy(&tx[1], data, len);
> >         } else {
> > -               tx =3D &cmd;
> > -               size =3D 1;
> > +               tx =3D stack_tx;
> >         }
> >
> > +       /* concatenate the DCS command byte and the payload */
> > +       tx[0] =3D cmd;
> > +       if (data)
> > +               memcpy(&tx[1], data, len);
> > +
> >         err =3D mipi_dsi_dcs_write_buffer(dsi, tx, size);
> >
> > -       if (len > 0)
> > +       if (tx !=3D stack_tx)
> >                 kfree(tx);
> >
> >         return err;
> > --
>=20
> Thierry, others - humble ping.
> Can you check through the series?

I don't see patch 2 of this series anywhere? Did it fall victim to some
filter?

Thierry

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7agu4ACgkQ3SOs138+
s6E50A//eb7elH/9YfwhaTuDpnwripfctO1Qrrc2c4lk0scOdWpJy34QFn18Lpn6
gjhgars0c/41mQFXlOM7VG92K5h2nnno3Lauil04SHGXnkhbxfQxoMpNqnOrrhKY
SjKxT1O3iFKnuRebSsBFKW5W06JrfFvtb1j6hzgrcHAbSnl026oO4PYvZq1Gh6k6
nmlhjCquxuzAYqj1txywBe+ZZ7Ghq57UFQ3fliPKjWXFPkmMG8aTl4nNUZeUOV4l
NTzkQ6mRebr+ioXZP0C1gHU3AnA7teVtE33Y48ZhF5vyWSQgM+07m1YOyb/Z+qj0
2yflsgYOpI3xNv2wAawNfExr4273FOUtM2aMeeuy9pW9K3AfWzHunRhJIfqriJSI
i3PO1+4E4PWpNWMahR+3os+4QO9mP0yGcJd1B78xoDweE9ShpjpgN71XAZkYitGV
7l/VRUY8Ci7q6UZXWrbHuP1s6L0LPDlkQ1FfqduvYMv6k70DWWv1Q+5flUFzqmkR
p/5aqATJ7oK5gkxmyDGRy8ur1lMHAePq3xNgwElRdrwXsZHnAaqSGwDv5Ml/O7Bq
Yo0rYuFl7nrFvBf2tEygqy9Bb8n4bjbmN8g2kgDBGAToKJsc5EVfu7HOBu5vMRbT
BwH/O62yhFDW1KOFXBkkNZMYu7b4nB976T41SF8mkYHU+kGRwsw=
=9tx4
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--

--===============0788024996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0788024996==--
