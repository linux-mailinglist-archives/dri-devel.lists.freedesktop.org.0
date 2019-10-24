Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE89E39FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 19:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669D56E58A;
	Thu, 24 Oct 2019 17:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A976E58A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 17:28:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w9so2219456wmm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 10:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zm62Wqaswjenn5y54IcQdgogQ2yNpEI/BY7greKk8IU=;
 b=ifgd//waNOlxqnvwa0V6bPLSFMTSODeROujFk+IRm8xwz4xzw0y5yM1uDSuIH3Kgxe
 RnzauNaqlo+EYZej8ViIHE430ps1RfeQo4ZOl+AzqjXnJ8eP8nwTmqmkuk8v6NO16QR7
 KRC6TkvpjsZC6Iy6zS2daObW5hruiy0C6J4lb7ZcvM4QFWWuOPJ2vNax4P5UFsYbCKsz
 fToy9BO8DtVhRK4bbmmoUtuoCv0WqYRT6R9wVc1OMLxX66JkBDCwNP9BpliNhJp951oV
 4fsgNPGCR2NC9d+RWeJhJ3j9sTdRAIyFtEVl5UvtV6sBWnxrtnnLn9qdjToHKlVgv50w
 N4Og==
X-Gm-Message-State: APjAAAWcbKPZH3Nd+ECunn1n4ak32aRwKlHaxZ56aAT5fMA8u3RhRdK2
 c2pO8+AQW/v0e54IsXbgp5ERcbjV
X-Google-Smtp-Source: APXvYqzWN3v4FpuSYIjXi+y8geENJPt7OcLK/VzZYmvYH4YxNvxho9FoDs7+lq9K8oOZhvyP+ReIFw==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr5503175wmh.148.1571938097057; 
 Thu, 24 Oct 2019 10:28:17 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 6sm3613445wmd.36.2019.10.24.10.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 10:28:14 -0700 (PDT)
Date: Thu, 24 Oct 2019 19:28:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Message-ID: <20191024172813.GA281291@ulmo>
References: <20190623173743.24088-2-digetx@gmail.com>
 <20191024115804.GB2924027@ulmo>
 <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
 <20191024135018.GD2924027@ulmo>
 <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
 <20191024155620.GG2924027@ulmo>
 <bfc6c17d-f2df-32d0-67d6-2f763c81d7fc@gmail.com>
 <7f7ecf90-531c-69ae-9011-684666ed8743@gmail.com>
 <ef2ccc90-be93-3cfb-6b8b-2a406dd8d362@gmail.com>
 <026bbeb0-1539-2b62-a447-60c1bc041f5a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <026bbeb0-1539-2b62-a447-60c1bc041f5a@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zm62Wqaswjenn5y54IcQdgogQ2yNpEI/BY7greKk8IU=;
 b=FKwUFGQkPVFyQlwHjnhytsVlKaTLDLKeUk50uucVop7wS1k7bGd2rCbXnWrtV8qidc
 0kb6tTpVIDj8IAjYNy6XY1ipqpRoZ+KE2PsAEFUf3aAAUTCFmKGMyjOAzFiOBIumDl/V
 qUhDB4+4CXP9mAn4teArtbNABs0PKNdjqH59nqL5+qZGLAY0Gxg1cxiIEKVeQwbclqIP
 p2fnHTVyuYAe1amO0IgKlyCGFzMAORYvNilTvSSRN5TJvEc4Ho+HjH1rG6Db97CbNTrF
 pX19oJ5SA8+hfXNlm16p/6h4TBE1JtjIEI8Xdy6nkPmxjLvQ2ticlb7/7oF9seil35K8
 5IeA==
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
Content-Type: multipart/mixed; boundary="===============1498642120=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1498642120==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 07:31:19PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 19:21, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 24.10.2019 19:09, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> 24.10.2019 18:57, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 24.10.2019 18:56, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> On Thu, Oct 24, 2019 at 06:47:23PM +0300, Dmitry Osipenko wrote:
> >>>>> 24.10.2019 16:50, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> On Thu, Oct 24, 2019 at 04:28:41PM +0300, Dmitry Osipenko wrote:
> >>>>>>> 24.10.2019 14:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>>> On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
> >>>>>>>>> This should should fire up on the DRM's driver module re-loader=
 because
> >>>>>>>>> there won't be enough available domains on older Tegra SoCs.
> >>>>>>>>>
> >>>>>>>>> Cc: stable <stable@vger.kernel.org>
> >>>>>>>>> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
> >>>>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>>>>>>> ---
> >>>>>>>>>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
> >>>>>>>>>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
> >>>>>>>>>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
> >>>>>>>>>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
> >>>>>>>>>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
> >>>>>>>>>  5 files changed, 14 insertions(+), 10 deletions(-)
> >>>>>>>>
> >>>>>>>> I think I understand what this is trying to do, but the commit m=
essage
> >>>>>>>> does not help at all. So what's really going on here is that we =
need to
> >>>>>>>> detach the device from the group regardless of whether we're sha=
ring the
> >>>>>>>> group or not, just like we attach groups to the shared domain wh=
ether
> >>>>>>>> they share the same group or not.
> >>>>>>>
> >>>>>>> Yes, the commit's message could be improved.
> >>>>>>>
> >>>>>>>> But in that case, I wonder if it's even worth splitting groups t=
he way
> >>>>>>>> we are right now. Wouldn't it be better to just put all the devi=
ces into
> >>>>>>>> the same group and be done with it?
> >>>>>>>>
> >>>>>>>> The current code gives me headaches every time I read it, so if =
we can
> >>>>>>>> just make it so that all the devices under the DRM device share =
the same
> >>>>>>>> group, this would become a lot easier to deal with. I'm not real=
ly
> >>>>>>>> convinced that it makes much sense to keep them on separate doma=
ins,
> >>>>>>>> especially given the constraints on the number of domains availa=
ble on
> >>>>>>>> earlier Tegra devices.
> >>>>>>>>
> >>>>>>>> Note that sharing a group will also make it much easier for thes=
e to use
> >>>>>>>> the DMA API if it is backed by an IOMMU.
> >>>>>>>
> >>>>>>> Probably I'm blanking on everything about IOMMU now.. could you p=
lease
> >>>>>>> remind me what "IOMMU group" is?
> >>>>>>>
> >>>>>>> Isn't it that each IOMMU group relates to the HW ID (SWGROUP)? Bu=
t then
> >>>>>>> each display controller has its own SWGROUP.. and thus that shari=
ng just
> >>>>>>> doesn't make any sense, hm.
> >>>>>>
> >>>>>> IOMMU groups are not directly related to SWGROUPs. But by default =
the
> >>>>>> IOMMU framework will share a domain between members of the same IO=
MMU
> >>>>>> group.
> >>>>>
> >>>>> Ah, I re-figured out that again. The memory controller drivers are
> >>>>> defining a single "IOMMU group" for both of the display controllers.
> >>>>>
> >>>>>> Seems like that's really what we want here, so that when we do
> >>>>>> use the DMA API, all the devices part of the DRM device get attach=
ed to
> >>>>>> the same IOMMU domain, yet if we don't want to use the DMA API we =
only
> >>>>>> need to detach the one group from the backing.
> >>>>>
> >>>>> Yes, it should be okay to put all DRM devices into the same group, =
like
> >>>>> it is done now for the displays. It also should resolve problem wit=
h the
> >>>>> domains shortage on T30 since now there are maximum 3 domains in us=
e:
> >>>>> host1x, drm and vde.
> >>>>>
> >>>>> I actually just checked that the original problem still exists
> >>>>> and this change solves it as well:
> >>>>>
> >>>>> ---
> >>>>> diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/=
tegra30.c
> >>>>> index 5a0f6e0a1643..e71096498436 100644
> >>>>> --- a/drivers/memory/tegra/tegra30.c
> >>>>> +++ b/drivers/memory/tegra/tegra30.c
> >>>>> @@ -1021,6 +1021,9 @@ static const struct tegra_smmu_swgroup
> >>>>> tegra30_swgroups[] =3D {
> >>>>>  static const unsigned int tegra30_group_display[] =3D {
> >>>>>  	TEGRA_SWGROUP_DC,
> >>>>>  	TEGRA_SWGROUP_DCB,
> >>>>> +	TEGRA_SWGROUP_G2,
> >>>>> +	TEGRA_SWGROUP_NV,
> >>>>> +	TEGRA_SWGROUP_NV2,
> >>>>>  };
> >>>>>
> >>>>>  static const struct tegra_smmu_group_soc tegra30_groups[] =3D {
> >>>>> ---
> >>>>>
> >>>>> Please let me know whether you're going to make a patch or if I sho=
uld
> >>>>> do it.
> >>>>
> >>>> I've been testing with a similar change and couldn't find any
> >>>> regressions. I've also made the same modifications for Tegra114 and
> >>>> Tegra124.
> >>>>
> >>>> Are you saying that none of these patches are needed anymore? Or do =
we
> >>>> still need a patch to fix detaching? I'm thinking that maybe we can
> >>>> drastrically simplify the detachment now by dropping the shared
> >>>> parameter altogether.
> >>>>
> >>>> Let me draft a patch and send out the whole set for testing.
> >>>
> >>> Seems it's still not ideal because I noticed this in KMSG:
> >>>
> >>> [    0.703185] Failed to attached device 54200000.dc to IOMMU_mapping
> >>> [    0.710404] Failed to attached device 54240000.dc to IOMMU_mapping
> >>> [    0.719347] Failed to attached device 54140000.gr2d to IOMMU_mappi=
ng
> >>> [    0.719569] Failed to attached device 54180000.gr3d to IOMMU_mappi=
ng
> >>>
> >>> which comes from the implicit IOMMU backing.
> >>
> >> And the error comes from here:
> >>
> >> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/iommu/iommu.c=
#L1655
> >=20
> > So the detaching still should be needed, but at the moment the ARM32
> > DMA-mapping code is simply not suitable for the case of having multiple
> > devices in the same group. I'm wondering whether there are any real
> > users for the implicit IOMMU backing on ARM32 at all :/
> >=20
>=20
> Apparently the "Failed to attached device 54200000.dc" was always in the
> log (I rarely testing the default multi-platform config), it's just the
> message is a pr_warn that I wasn't paying attention because it is
> colored like pr_info in dmesg :)

Yeah, so the above isn't a complete solution. In order to actually use
the DMA API backed by an IOMMU, some additional patches are needed. I
have all of those in a local tree and I've already sent out a couple of
them. It's taking a while because they all need to be applied in small
iterations to make sure things don't break midway.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2x3ysACgkQ3SOs138+
s6HX7w/+NcGyD7sUWbYVe3VStB4pZhCfdh06LafK9634Ipd2gr8xjYfQxk8EdE84
W+1qMDS468vNru5AdRvpJYWDFUYeOUJ1F08Xw/1bzJh+V6W7KkKUQmgdwdYYYP1T
amG9+ECR0xH2XJ+RW6GBzqYuG7NzkSYbU/gte+C3CKrGzoetdBjyOZJAhuWC4KAd
yKUa5IjPsHlmyafXRH8D1j2vAHgj1Rpb8O7HElyZSR2KefTay87rAVqLFNPyKILX
jahT0yOdvMqt3O89onJVipN1h0UOFWfKXm0V9OxaRwCdLzXPZ0J1f5dqxCc/K9XH
SffKNedJPZpZOpXvJ2/ZLGuLaSVcGkbkN2agnRW3rh22FqPn3H7ylc4fZ1LS7Eol
FnEl4pW/iO08icsEw3e27WnLOa93NiMc+/COjeHGrMA9+bQAnovcbZnOvARgjqJY
XYkBqqGsw2xK5i9DxNAx7ygNCwyrQ0AUD3AFEqZHneE7emV6l4u/U+BnmTi5+N9C
Sfc8xk60ng396y2lTrTfXSFZ8inKKFwzuPJWqTbI9o7gQMueQcDGvncw2sbFFbBj
3f/j3yWZJ6MSTD4paBYKW2swyNqlZgdIXC6g3C3hm+e73sodiPX+076elJGq3c6h
z1pG8QuRpIbXyTsnvE2iZK3Zkp6eg7vPDaRwpvEIHttc22v11CA=
=GS+X
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

--===============1498642120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1498642120==--
