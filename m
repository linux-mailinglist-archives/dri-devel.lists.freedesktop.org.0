Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A1CA275C5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA6810E69A;
	Tue,  4 Feb 2025 15:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EsAOy7Pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC16E10E69B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:25:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so58706235e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738682716; x=1739287516; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N8Jw0XKdoFMM4j+EK9ZMp2LEZiM2wLK9PqI1gGCAqHg=;
 b=EsAOy7PmcSZx/8z4Ayp6oTK7Is9YVT0Q1b9i9tSAVWrx+yzyexBtfSIl9QPtC6sPEa
 usJi/lFb/ll7S1Za2RdoGT+/EBv2ilSTAggOttVqeVZDmJJNQVEiOk58xaPZFEZ1FMxr
 ER9btyS5Uzy387Tif1QU7DW3xxv1+/qRm1aEpvo0/5jwoGHCvajO6Md003zONBytaNVO
 yG6Ck5zZeD6Y0M9wP4dvh+OTkJsbCoI7F062ROGfmnTsGauhcxxNDkpnPterpZMLZqpW
 F5gvlQQ9PFQojBoJ7EQXCH0W6Ri+Ql2qg2JvrcDThAl+ZCLhHNo5290Sz4cjt9mTSKAD
 dSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738682716; x=1739287516;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N8Jw0XKdoFMM4j+EK9ZMp2LEZiM2wLK9PqI1gGCAqHg=;
 b=k82iv+WpKDS4I0e3q1a9In+2tR3lG7aPmylRwV22Cae02EObLoYarfR0HPcoxRC8Lp
 z4SpscmqR3Nq2NdOJ4npCGcjibrLDc24TYMMjVI/2xL3Usq0zC3f6EShmVten76LaABI
 dTRrv+9mRATiG1qjbUWyb9+dNZtGdycTSdxd7StArhcCsiWumhEOxTnWuRiLSCXs5mDh
 CzPqOP4P8fqojtKb6kPgg5lgoIKqjcpYVmwV0V1DRmLVio6TeOntMJN3Ybx7Raa/F0V0
 fAHUrGZckrnRJ+/ZZEdTLRa9A+sPCtBcoJdfr1dRxMzAq4qbcfGDcyGvNDEa9Q4M0PS2
 3iyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhPnm4rGtHDjzsu8zRRvWerg23ZQ16uNaDLWWkrF6LbomQwYluzjFyRSaCHYEoOoO11tyDsD7CZNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlGjTLRfPLO7oy0fqbkddvTvd3EQgVLlkAqKT0ilXHwfNC9uCI
 Rkmg0SVg0nmhEbRhPiPQWUOFDJJi4lbRK7omgBZMuEbIWC1m7/DH
X-Gm-Gg: ASbGncvYDUoc+l2OogrtDYRSQoW2nzopbAJBjxA6HpKaw+x972fAB8PQrpuEOtiepBg
 LHenBV0GUHYph2JKbwin/S7JkV8lweV3JSDmYbCbg5VxD0uDSzNnJ3ZmsxNkgl5KlgXz0D0KutN
 XEp2oejai6uqX1hPeF6G686yVgpJdpc3HkrJxyQXbJd8Evp/4F5ELelLBh8ay4YCOnQmYjYA6mb
 TzXJmY2RhMFMdDtiaiSX7g6xaPejS9Paz+UwhPcx7tZ7eWLcf46jLw6LlrzkhGd0MxIyogGK6gI
 7+Dgnr6+JAkJ2tesMfKKH8C/B4h35VhtPgasQbR7xOr10j778oQXLU3UHeh38MxtbIV7K86UKqL
 lQw==
X-Google-Smtp-Source: AGHT+IGKwGJ3nMNTbHEkAhz/DretuOIWOdyaN4yCsb0gxLe4J1MazpgEMBan8MQ216Fmr0ITEyKGOA==
X-Received: by 2002:a05:600c:1e02:b0:434:ffd7:6fd2 with SMTP id
 5b1f17b1804b1-438dc3c22d4mr240554345e9.7.1738682715998; 
 Tue, 04 Feb 2025 07:25:15 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38daf27bbf5sm1478204f8f.48.2025.02.04.07.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 07:25:14 -0800 (PST)
Date: Tue, 4 Feb 2025 16:25:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Message-ID: <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hl5zizggcxgo3guk"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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


--hl5zizggcxgo3guk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> Hi Geert,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Geert Uytterhoeven
> > Sent: 03 February 2025 11:06
> > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> >=20
> > Hi Biju,
> >=20
> > Thanks for your patch!
> >=20
> > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wrot=
e:
> > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name=
().
> >=20
> > That's not the only thing this patch does...
> >=20
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >=20
> > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs
> > > tegra_rgb_encoder_helper_funcs =3D {
> > >
> > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > -       struct device_node *np;
> > > +       struct device_node *np _free(device_node) =3D
> >=20
> > Adding the _free()...
>=20
> Yes it fixes a memory leak aswell.
>=20
> >=20
> > > +               of_get_available_child_by_name(dc->dev->of_node,
> > > + "rgb");
> > >         struct tegra_rgb *rgb;
> > >         int err;
> > >
> > > -       np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > -       if (!np || !of_device_is_available(np))
> > > +       if (!np)
> > >                 return -ENODEV;
> >=20
> > ... fixes the reference count in case of an unavailable node...
> >=20
> > >
> > >         rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> >=20
> > ... but as np is stored below, it must not be freed when it goes out of=
 context?
>=20
> OK, But it is used in tegra_output_probe() and never freed.
> Maybe remove should free it??=20

It's not quite as simple as that. tegra_output_probe() can also store
output->dev->of_node in output->of_node, so we'd also need to track a
flag of some sort to denote that this needs to be freed.

Ultimately I'm not sure if it's really worth it. Do we really expect
these nodes to ever be freed (in which case this might leak memory)?
These are built-in devices and there's no code anywhere to remove any
such nodes.

Thierry

--hl5zizggcxgo3guk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeiMVUACgkQ3SOs138+
s6Ed5hAAm9Axms1NNOi6HyezxVvsAFWnJdOLIcS7jT2aYdsczNSLoj3bKgTP9rWf
x7rV40RQ0RVTHl6vOL6L3RF9SK5W6Nxe1KlzbGkcJkOxv3///MizAdHoMPv6vkGA
RTAwX/Uq+qGsypq+J3DM4hsc5790rdzF6OqHDEVZMxGTeh9v5AxyxaayNJf4n4zj
iW/+lr6cPRAkBjqLD+Y3LToPiIwrlhoFjqrY89/XCRVxGndgegdQgtZTQH3BLtM3
egbxZ5LHbMF/T4bzu0qYb1KIwDHzG1GAF41y2y1TZMl+yaXaMXYtNR9wUxSTiMzk
/HBcT1RTznlLiUJawKVmf8yl64EwSX+SCGJ4ExmrDp8qDQLg+qI2ONgAg/qhKxKs
n0QzodzFmSr3leng4/bbXMHFfUwDkUO4liml+N9OnE2kG9gTCIhQ5mecoTcjtOOe
/V0h1DIMBirLUJEZpfKTHpHLwEknZRKRDszOG+wBLR09O5f020cIVxZe/ddP0cxe
0W9+dHyQSApe5KzBenayV0KTepGsea6MmDbqrsoC1N6zVR6PcdQFFosxq/rRIRCh
9L4vDXbLY5qYakaCyv0ewpxnHK1OvIKgup5dQULLURLI010OUVPX+GnG/YFYpoG5
WhVK/fYKOWuL6/yX1Ujn1mdzKV3lwQcKUtyMYLMixvEZzLR8RqE=
=noOW
-----END PGP SIGNATURE-----

--hl5zizggcxgo3guk--
