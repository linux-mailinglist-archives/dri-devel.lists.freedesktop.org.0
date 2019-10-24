Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A76E3746
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 17:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA12E6E450;
	Thu, 24 Oct 2019 15:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C386E450
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 15:56:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s1so17918170wro.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3FEVQfMU4k8NRH+uUCDudqXkRQhIb1m0V7SnTPPyUQw=;
 b=NAHkf3rYmQ5giNXW5vjKU1cvDw8SZvFsK9/au3U7Ku3Htun55tSjN57gwOmSOH+hMy
 rjFNY+ppsvdfuTV4r/NtsgLgEIVti9XmqlpxgP2JROsAyl2exAmAnM3LknEuhlXtL56c
 nCXbCh88F7BiWTvbaANj7nUgl+tndH2vrbQjbvr69qVxCDQj4qD0QkIIohF6PMXdmCws
 jHBUgOqZ7VwaaGDGTC/YgIn80IO1uOY5rAKokEHPx9eJe8vmkHbHsT9OjfkPLMwdP2fd
 NVHHHGlT5N/SUB33EhCcMA93lknmWMCcQBuAIgNmJvH3LaFOUivOs/aY4RSsfjIgdi1c
 6uLg==
X-Gm-Message-State: APjAAAUAcZ0nfbSm1aiUkW0+lfREqoIQmJZTg8IFWjVDG7fFQlefxHsn
 QBFcpk36zhLposGx5eC43HY=
X-Google-Smtp-Source: APXvYqzakL6vA+MtQfouFvECcGA+jysk9mP3Rsz0RIyo0ketWkejCxwUVgjIvb+/CpBIRzm2oWE+zg==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr4487262wrq.180.1571932584795; 
 Thu, 24 Oct 2019 08:56:24 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id l22sm24162439wrb.45.2019.10.24.08.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 08:56:21 -0700 (PDT)
Date: Thu, 24 Oct 2019 17:56:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Message-ID: <20191024155620.GG2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com>
 <20191024115804.GB2924027@ulmo>
 <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
 <20191024135018.GD2924027@ulmo>
 <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3FEVQfMU4k8NRH+uUCDudqXkRQhIb1m0V7SnTPPyUQw=;
 b=jDbM/pi4pyyEMm0HzKj+pwffwpozZ/uDi4tlWmC465PZpKxCUVpayNhnEmsDQgm0ca
 +XE7C2vR2/H9oaVLE+Prn/AtqoSLY6U7nW/4iQ+aCLs1W26gcXD7r3drQotXX7mc8zQk
 XbR8X9+tfsZcs+E8B3tDxH/0xtr+I7gDA9wKFptzk214jPx9ArCnEu+kkjpWCB3t96af
 zUX81pJNqsNWNG+OfBldMSvX0iPCVIdu+KunUvkYK4eyLmT5TK5tJ2H8VdeE/GfFNuwR
 cHWr+3wwK+GTRBb86ew4ZsXKQCXD+6qClHAjwzBun5l/sI1DusBblnW72b2gR1MzofNT
 2djA==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1928162401=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1928162401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Content-Disposition: inline


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 06:47:23PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 16:50, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Oct 24, 2019 at 04:28:41PM +0300, Dmitry Osipenko wrote:
> >> 24.10.2019 14:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
> >>>> This should should fire up on the DRM's driver module re-loader beca=
use
> >>>> there won't be enough available domains on older Tegra SoCs.
> >>>>
> >>>> Cc: stable <stable@vger.kernel.org>
> >>>> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
> >>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>> ---
> >>>>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
> >>>>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
> >>>>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
> >>>>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
> >>>>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
> >>>>  5 files changed, 14 insertions(+), 10 deletions(-)
> >>>
> >>> I think I understand what this is trying to do, but the commit message
> >>> does not help at all. So what's really going on here is that we need =
to
> >>> detach the device from the group regardless of whether we're sharing =
the
> >>> group or not, just like we attach groups to the shared domain whether
> >>> they share the same group or not.
> >>
> >> Yes, the commit's message could be improved.
> >>
> >>> But in that case, I wonder if it's even worth splitting groups the way
> >>> we are right now. Wouldn't it be better to just put all the devices i=
nto
> >>> the same group and be done with it?
> >>>
> >>> The current code gives me headaches every time I read it, so if we can
> >>> just make it so that all the devices under the DRM device share the s=
ame
> >>> group, this would become a lot easier to deal with. I'm not really
> >>> convinced that it makes much sense to keep them on separate domains,
> >>> especially given the constraints on the number of domains available on
> >>> earlier Tegra devices.
> >>>
> >>> Note that sharing a group will also make it much easier for these to =
use
> >>> the DMA API if it is backed by an IOMMU.
> >>
> >> Probably I'm blanking on everything about IOMMU now.. could you please
> >> remind me what "IOMMU group" is?
> >>
> >> Isn't it that each IOMMU group relates to the HW ID (SWGROUP)? But then
> >> each display controller has its own SWGROUP.. and thus that sharing ju=
st
> >> doesn't make any sense, hm.
> >=20
> > IOMMU groups are not directly related to SWGROUPs. But by default the
> > IOMMU framework will share a domain between members of the same IOMMU
> > group.
>=20
> Ah, I re-figured out that again. The memory controller drivers are
> defining a single "IOMMU group" for both of the display controllers.
>=20
> > Seems like that's really what we want here, so that when we do
> > use the DMA API, all the devices part of the DRM device get attached to
> > the same IOMMU domain, yet if we don't want to use the DMA API we only
> > need to detach the one group from the backing.
>=20
> Yes, it should be okay to put all DRM devices into the same group, like
> it is done now for the displays. It also should resolve problem with the
> domains shortage on T30 since now there are maximum 3 domains in use:
> host1x, drm and vde.
>=20
> I actually just checked that the original problem still exists
> and this change solves it as well:
>=20
> ---
> diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra3=
0.c
> index 5a0f6e0a1643..e71096498436 100644
> --- a/drivers/memory/tegra/tegra30.c
> +++ b/drivers/memory/tegra/tegra30.c
> @@ -1021,6 +1021,9 @@ static const struct tegra_smmu_swgroup
> tegra30_swgroups[] =3D {
>  static const unsigned int tegra30_group_display[] =3D {
>  	TEGRA_SWGROUP_DC,
>  	TEGRA_SWGROUP_DCB,
> +	TEGRA_SWGROUP_G2,
> +	TEGRA_SWGROUP_NV,
> +	TEGRA_SWGROUP_NV2,
>  };
>=20
>  static const struct tegra_smmu_group_soc tegra30_groups[] =3D {
> ---
>=20
> Please let me know whether you're going to make a patch or if I should
> do it.

I've been testing with a similar change and couldn't find any
regressions. I've also made the same modifications for Tegra114 and
Tegra124.

Are you saying that none of these patches are needed anymore? Or do we
still need a patch to fix detaching? I'm thinking that maybe we can
drastrically simplify the detachment now by dropping the shared
parameter altogether.

Let me draft a patch and send out the whole set for testing.

Thierry

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xyaEACgkQ3SOs138+
s6HnnQ/45Iq7p3JKafC7dZfiSyfjIwnyT796I2ftsGsYuTIyx6PgUnFPo14rEC27
/GQU/Ih/ojsx1HuK6/T7DyatN273kKn7UqyyeKj9dt2sl35N99ffNBJyNxoE69K8
2BgH+TZi4Dryp638YhvuHukVgdXqlyb4EFuuVhdo/eCGlx9+uVfAxXuMshtLmENz
/Fikj/6fwNO6AQn6oRxdre4Qp4XU/YSBk1QVN3J1P13NF3O6tp+3s+UN3Ox6hgB4
9owf80JZNPbP6FscSlTHwxba+41duQJ5Y2u0TNFzJwYsIj9kJZ7FFGlaJTE8xU0o
TJCX1t2Jz8AsERHwQnH0UTIBbFc/lKqyxqM4FrRQZOs5udRto5pb/3wSl9+nFfRf
CSf5zTBTREnNMMZXv79HrRQFeIzcrPtOaZHOJp4je+Y04XV4qPk9ZANe+5gcMqxc
9jv60dZSrh4EM1uEeFqJDwesW1huPK9jQXfZoYjXkjIXHL3igqAGrvovGGD2yeO9
S2kDAexj+9XQNvOXxjjF8QMq/pTpyx8E6PRzXkZTtui47pRhWXZYTAPvUKPDu0Zi
hz1w/BQUap3S3axNKa4FaFA1F9E40bY2RRaFXGvPW80pbya9qRJx/p/UuDrqCSY6
RoX9lvDgtj2a+8b9KILk1ZwzyNfkkKhJgbQQpVG+3OPzXcHfyQ==
=Ymgn
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--

--===============1928162401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1928162401==--
