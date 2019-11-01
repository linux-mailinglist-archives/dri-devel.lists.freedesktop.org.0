Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF31EC0E7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 10:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078406F7A9;
	Fri,  1 Nov 2019 09:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB5A6F7A9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 09:56:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so8433809wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 02:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Y+ZH/JIJbeZRc6g3SFTtiWzkXeFR6nZHbFUanZj2uC4=;
 b=bvlYsABzSMyPRaEseQr4Q9+jZF3n8jgxBUn5n91/lhAIFWd8dN+qC5VM80f0VlUnRZ
 8BGC7w1nyRJwBjW4OEv/rXdVBgP5MIXZtA8yrgmQZoA8+NOnWAg1GGti/5c+K6PAOB6l
 ElZn/EQg56SpTy4ULcxn0uxSCSzaeJCX54Ao4iBuD7q2XA8odLNdl5vN8Wn4Ib/mBIXd
 pXzYhUkHIMjO967LEhDii9s7H3Jxwh7zGGYULFqSM+gdXhUFmhCWgkeG1cO/Yk+3hcVc
 Yrb8YTFMmL2mtXs2n7VvT2WbpOwCl+v/dJ4SWxKWVVtOMOXNEheJLYwuGjwvW3b+gAgJ
 I7wA==
X-Gm-Message-State: APjAAAVZPEQMgDaEw+NAAtMk0P81ORyWzN42XmrUqkgsKjJzW1Ff0R+h
 u4A5HSGcn4w/IwiCACEY9VU=
X-Google-Smtp-Source: APXvYqzs/K3zu1v1L+gJ3mSPmNB/8JL0IDhEiAjTAGr+YQur9vH4iIhczEBqOrue9xs80Fk5RGOVUQ==
X-Received: by 2002:a1c:b1c3:: with SMTP id a186mr9641268wmf.10.1572602215988; 
 Fri, 01 Nov 2019 02:56:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v16sm7042158wrc.84.2019.11.01.02.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 02:56:54 -0700 (PDT)
Date: Fri, 1 Nov 2019 10:56:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 01/12] memory: tegra: Add gr2d and gr3d to DRM IOMMU group
Message-ID: <20191101095653.GC1167505@ulmo>
References: <20191028123718.3890217-1-thierry.reding@gmail.com>
 <20191028123718.3890217-2-thierry.reding@gmail.com>
 <ecafd917-bcf7-0f3e-2423-6b79793d56a2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ecafd917-bcf7-0f3e-2423-6b79793d56a2@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Y+ZH/JIJbeZRc6g3SFTtiWzkXeFR6nZHbFUanZj2uC4=;
 b=YIE20UaWKhT/B/GWsiIgVcq5e7OlvEFpXJXYJ6NXS2moO6sOYOzbF4wMatTW8xvsjM
 yIWpBd+F/Tzc3ybpbRCiTifskqpxGkJdNB0iTLbhgnRY0IMbHKyTIRFwJtdYttNeiOTn
 2TLJXzfwXmNMeIRuuZ35K4FM/a2SWzX+gyrxpNWiEPDhW0dKevJzjc6vIP3pUhnbLdbo
 vOH2h2WZ/H1Bv2QpcpbiJUrZWN02+ipt7+wXJpNofIuxI9bCxna+b8cKudG9qYti1+4l
 V1pxvDxiv+GtIpZRGl6sd7bfQbnNq5HO0k95pAZL9H1I6r9AlA6j/qPiF+b/+xv+LPy3
 QZtQ==
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
Cc: linux-tegra@vger.kernel.org, Sachin Nikam <snikam@nvidia.com>,
 Puneet Saxena <puneets@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0889760758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0889760758==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 06:05:48PM +0300, Dmitry Osipenko wrote:
> 28.10.2019 15:37, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > All of the devices making up the Tegra DRM device want to share a single
> > IOMMU domain. Put them into a single group to allow them to do that.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/memory/tegra/tegra114.c | 10 ++++++----
> >  drivers/memory/tegra/tegra124.c |  8 +++++---
> >  drivers/memory/tegra/tegra30.c  | 11 +++++++----
> >  3 files changed, 18 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/teg=
ra114.c
> > index ac8351b5beeb..48ef01c3ff90 100644
> > --- a/drivers/memory/tegra/tegra114.c
> > +++ b/drivers/memory/tegra/tegra114.c
> > @@ -909,16 +909,18 @@ static const struct tegra_smmu_swgroup tegra114_s=
wgroups[] =3D {
> >  	{ .name =3D "tsec",      .swgroup =3D TEGRA_SWGROUP_TSEC,      .reg =
=3D 0x294 },
> >  };
> > =20
> > -static const unsigned int tegra114_group_display[] =3D {
> > +static const unsigned int tegra114_group_drm[] =3D {
> >  	TEGRA_SWGROUP_DC,
> >  	TEGRA_SWGROUP_DCB,
> > +	TEGRA_SWGROUP_G2,
> > +	TEGRA_SWGROUP_NV,
> >  };
> > =20
> >  static const struct tegra_smmu_group_soc tegra114_groups[] =3D {
> >  	{
> > -		.name =3D "display",
> > -		.swgroups =3D tegra114_group_display,
> > -		.num_swgroups =3D ARRAY_SIZE(tegra114_group_display),
> > +		.name =3D "drm",
> > +		.swgroups =3D tegra114_group_drm,
> > +		.num_swgroups =3D ARRAY_SIZE(tegra114_group_drm),
> >  	},
> >  };
> > =20
> > diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/teg=
ra124.c
> > index 5d0ccb2be206..62b30b1b9677 100644
> > --- a/drivers/memory/tegra/tegra124.c
> > +++ b/drivers/memory/tegra/tegra124.c
> > @@ -974,16 +974,18 @@ static const struct tegra_smmu_swgroup tegra124_s=
wgroups[] =3D {
> >  	{ .name =3D "vi",        .swgroup =3D TEGRA_SWGROUP_VI,        .reg =
=3D 0x280 },
> >  };
> > =20
> > -static const unsigned int tegra124_group_display[] =3D {
> > +static const unsigned int tegra124_group_drm[] =3D {
> >  	TEGRA_SWGROUP_DC,
> >  	TEGRA_SWGROUP_DCB,
> > +	TEGRA_SWGROUP_GPU,
> > +	TEGRA_SWGROUP_VIC,
> >  };
> > =20
> >  static const struct tegra_smmu_group_soc tegra124_groups[] =3D {
> >  	{
> >  		.name =3D "display",
> > -		.swgroups =3D tegra124_group_display,
> > -		.num_swgroups =3D ARRAY_SIZE(tegra124_group_display),
> > +		.swgroups =3D tegra124_group_drm,
> > +		.num_swgroups =3D ARRAY_SIZE(tegra124_group_drm),
> >  	},
>=20
> The "display" -> "drm" group's renaming is missed for T124.

Good catch! Fixed now.

Thanks,
Thierry

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl28AWUACgkQ3SOs138+
s6Hgeg//cE3dME4iIyDtptvAGYmKg/XaVbnA2XacCB42XLQuejaNf+Py0656pl9S
HyvF4syLPuA5yP4gZk3LnTU+iaEk6FEFK4W7fJ4ymQUfVkfIY+BrHYcygNbAQTk5
WvrvUhct8FrswisLeCbmMBaJWSv3tybQRTTU97RQVltj90+EhdY8I6F4Wz5bRlP8
ED3qAJPigoYlok9VCQh8iS2Ji1chle8/tcqWjZpP+hBawoIZ8Lt7KGe+OUVNJ8DG
m/9e8OXr00NhTIwlKgjxAr9qRUJN2Yi6cWcZtzkWRTajV4fjpUNEQZvM6MBi2D+S
Fb6dt8tLK7ujr0Cp/cmUcejxhTO8bOBF1uNUGbY1EU4QCseqgBp0noivhpNginPO
Y2/cIurgJ2IQpj736gD0utRyDRJw5Hmdta4KLTURFCGY9bJYv9/2XXxrHmKAjHP6
aWA6xWQkprTXI25FtCTcFTLHMRoGFbUWQLpTs0V8SSTrsQ62kROQVlnN8JMMT829
pUNsHYGm6o9kCpCvBJa1N+n8f4L4L7rWw05vktZj9r0iyry6lLeM2qdjw8Y8MEr5
gvwS6LSljib3qXsi4suDUFzuT75FwYdVM6GwwyeIDTc7ey4//1c+QH71OVp2m0/D
8jf78o6yw5sHvF81xEXT2lVjH1xIZkpb6jKqedeUa+NvsQyLT+k=
=Fin/
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--

--===============0889760758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0889760758==--
