Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C05E4A53
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305AB6E9C6;
	Fri, 25 Oct 2019 11:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C386E9C6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:48:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so1969092wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 04:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7KuIQnbIH4eq0Z4v/apv5JM8TWS/D1JK9tx+WpcCKAM=;
 b=XHwP5z9wRJJ6lQKiXDPMVmItFbKB6rgFAWcVtBPBviDfxh6V9dd9AC0AZNLBY03KpX
 +0iieY2HPax4fw8MbX0p+HMx839qOa5GgbI6vHvZ6+FU1lotsrGc+IzG5zRAmAeWtK5/
 Xka24Df18Yd/SOQ1IOuAo14nit1flmG25a2JCQ+/nYDJ0zdiZJ9wtXQC7x6klcTRtiNi
 aXKocv66MXS57p4deco0cojaJ110Ru1b1sFzjecrLN/q02ika1TwuPcj4Me/AJs33myb
 VxQ+s+pZtpN7+gLy53OffaE0zm9MeiKhF6CrJFDV8pMJeimp5XmGwygsEpd/OFAi62Ym
 zSAg==
X-Gm-Message-State: APjAAAWLWeX7k7yaBbjhnhkUSEyy5p/SES13g0Goo20sI7ndsXW5bsKy
 vyHnRpgKMPr32GpXDSe1ELU=
X-Google-Smtp-Source: APXvYqx3bwpdPsPNU0UWpoz70XuATqb8VIQGZcJMIgD9tkoeQORGnFcDLKDnuIK7tD63949d+19pjg==
X-Received: by 2002:a5d:6203:: with SMTP id y3mr2687709wru.142.1572004112435; 
 Fri, 25 Oct 2019 04:48:32 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id w9sm2111485wrt.85.2019.10.25.04.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 04:48:29 -0700 (PDT)
Date: Fri, 25 Oct 2019 13:48:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Message-ID: <20191025114828.GA937752@ulmo>
References: <45926d95-3e7a-c56b-402a-2b2c6475c5db@gmail.com>
 <20191024135018.GD2924027@ulmo>
 <38a67df0-2ede-e7fe-8eca-6c4491cdcc7b@gmail.com>
 <20191024155620.GG2924027@ulmo>
 <bfc6c17d-f2df-32d0-67d6-2f763c81d7fc@gmail.com>
 <7f7ecf90-531c-69ae-9011-684666ed8743@gmail.com>
 <ef2ccc90-be93-3cfb-6b8b-2a406dd8d362@gmail.com>
 <026bbeb0-1539-2b62-a447-60c1bc041f5a@gmail.com>
 <20191024172813.GA281291@ulmo>
 <a3be52ac-6cb2-81f8-f1f5-1d6440cdbfba@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a3be52ac-6cb2-81f8-f1f5-1d6440cdbfba@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7KuIQnbIH4eq0Z4v/apv5JM8TWS/D1JK9tx+WpcCKAM=;
 b=W10TQeY0jW+b+JrTIIoMgYV+a/owrKIH2DQTSOKx1U8JVOTY51axV1HLvJqQ/1DPM4
 4nTYpJrswhM9MVre4SrpXcC96LZm9melG/5QKtU6WqczYHI70Q1IchideUjmht8S5iZN
 LQE+TFiBlo8s4exZAB4b9X3cTeniYClPZt6TjeOOwfkvhomCvcUuB4loDdULG01EZImA
 m1DS4GGeZJWU1DB567yLPNiUQ827wrFoLKpXgAtqAyQYboxlj6MDCv0UxGcyq8WSf+Ze
 UjNLdXiGZJsvGcTiul5f2UbJKhVQA84qh1xvxADPsH96Q7UiCiMu8TX2rdkO/etHfkke
 eAdg==
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
Content-Type: multipart/mixed; boundary="===============0295360837=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0295360837==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 09:46:58PM +0300, Dmitry Osipenko wrote:
> 24.10.2019 20:28, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Oct 24, 2019 at 07:31:19PM +0300, Dmitry Osipenko wrote:
> >> 24.10.2019 19:21, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> 24.10.2019 19:09, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> 24.10.2019 18:57, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> 24.10.2019 18:56, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>> On Thu, Oct 24, 2019 at 06:47:23PM +0300, Dmitry Osipenko wrote:
> >>>>>>> 24.10.2019 16:50, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>>> On Thu, Oct 24, 2019 at 04:28:41PM +0300, Dmitry Osipenko wrote:
> >>>>>>>>> 24.10.2019 14:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>>>>>>> On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrot=
e:
> >>>>>>>>>>> This should should fire up on the DRM's driver module re-load=
er because
> >>>>>>>>>>> there won't be enough available domains on older Tegra SoCs.
> >>>>>>>>>>>
> >>>>>>>>>>> Cc: stable <stable@vger.kernel.org>
> >>>>>>>>>>> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach=
")
> >>>>>>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
> >>>>>>>>>>>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
> >>>>>>>>>>>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
> >>>>>>>>>>>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
> >>>>>>>>>>>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
> >>>>>>>>>>>  5 files changed, 14 insertions(+), 10 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> I think I understand what this is trying to do, but the commit=
 message
> >>>>>>>>>> does not help at all. So what's really going on here is that w=
e need to
> >>>>>>>>>> detach the device from the group regardless of whether we're s=
haring the
> >>>>>>>>>> group or not, just like we attach groups to the shared domain =
whether
> >>>>>>>>>> they share the same group or not.
> >>>>>>>>>
> >>>>>>>>> Yes, the commit's message could be improved.
> >>>>>>>>>
> >>>>>>>>>> But in that case, I wonder if it's even worth splitting groups=
 the way
> >>>>>>>>>> we are right now. Wouldn't it be better to just put all the de=
vices into
> >>>>>>>>>> the same group and be done with it?
> >>>>>>>>>>
> >>>>>>>>>> The current code gives me headaches every time I read it, so i=
f we can
> >>>>>>>>>> just make it so that all the devices under the DRM device shar=
e the same
> >>>>>>>>>> group, this would become a lot easier to deal with. I'm not re=
ally
> >>>>>>>>>> convinced that it makes much sense to keep them on separate do=
mains,
> >>>>>>>>>> especially given the constraints on the number of domains avai=
lable on
> >>>>>>>>>> earlier Tegra devices.
> >>>>>>>>>>
> >>>>>>>>>> Note that sharing a group will also make it much easier for th=
ese to use
> >>>>>>>>>> the DMA API if it is backed by an IOMMU.
> >>>>>>>>>
> >>>>>>>>> Probably I'm blanking on everything about IOMMU now.. could you=
 please
> >>>>>>>>> remind me what "IOMMU group" is?
> >>>>>>>>>
> >>>>>>>>> Isn't it that each IOMMU group relates to the HW ID (SWGROUP)? =
But then
> >>>>>>>>> each display controller has its own SWGROUP.. and thus that sha=
ring just
> >>>>>>>>> doesn't make any sense, hm.
> >>>>>>>>
> >>>>>>>> IOMMU groups are not directly related to SWGROUPs. But by defaul=
t the
> >>>>>>>> IOMMU framework will share a domain between members of the same =
IOMMU
> >>>>>>>> group.
> >>>>>>>
> >>>>>>> Ah, I re-figured out that again. The memory controller drivers are
> >>>>>>> defining a single "IOMMU group" for both of the display controlle=
rs.
> >>>>>>>
> >>>>>>>> Seems like that's really what we want here, so that when we do
> >>>>>>>> use the DMA API, all the devices part of the DRM device get atta=
ched to
> >>>>>>>> the same IOMMU domain, yet if we don't want to use the DMA API w=
e only
> >>>>>>>> need to detach the one group from the backing.
> >>>>>>>
> >>>>>>> Yes, it should be okay to put all DRM devices into the same group=
, like
> >>>>>>> it is done now for the displays. It also should resolve problem w=
ith the
> >>>>>>> domains shortage on T30 since now there are maximum 3 domains in =
use:
> >>>>>>> host1x, drm and vde.
> >>>>>>>
> >>>>>>> I actually just checked that the original problem still exists
> >>>>>>> and this change solves it as well:
> >>>>>>>
> >>>>>>> ---
> >>>>>>> diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegr=
a/tegra30.c
> >>>>>>> index 5a0f6e0a1643..e71096498436 100644
> >>>>>>> --- a/drivers/memory/tegra/tegra30.c
> >>>>>>> +++ b/drivers/memory/tegra/tegra30.c
> >>>>>>> @@ -1021,6 +1021,9 @@ static const struct tegra_smmu_swgroup
> >>>>>>> tegra30_swgroups[] =3D {
> >>>>>>>  static const unsigned int tegra30_group_display[] =3D {
> >>>>>>>  	TEGRA_SWGROUP_DC,
> >>>>>>>  	TEGRA_SWGROUP_DCB,
> >>>>>>> +	TEGRA_SWGROUP_G2,
> >>>>>>> +	TEGRA_SWGROUP_NV,
> >>>>>>> +	TEGRA_SWGROUP_NV2,
> >>>>>>>  };
> >>>>>>>
> >>>>>>>  static const struct tegra_smmu_group_soc tegra30_groups[] =3D {
> >>>>>>> ---
> >>>>>>>
> >>>>>>> Please let me know whether you're going to make a patch or if I s=
hould
> >>>>>>> do it.
> >>>>>>
> >>>>>> I've been testing with a similar change and couldn't find any
> >>>>>> regressions. I've also made the same modifications for Tegra114 and
> >>>>>> Tegra124.
> >>>>>>
> >>>>>> Are you saying that none of these patches are needed anymore? Or d=
o we
> >>>>>> still need a patch to fix detaching? I'm thinking that maybe we can
> >>>>>> drastrically simplify the detachment now by dropping the shared
> >>>>>> parameter altogether.
> >>>>>>
> >>>>>> Let me draft a patch and send out the whole set for testing.
> >>>>>
> >>>>> Seems it's still not ideal because I noticed this in KMSG:
> >>>>>
> >>>>> [    0.703185] Failed to attached device 54200000.dc to IOMMU_mappi=
ng
> >>>>> [    0.710404] Failed to attached device 54240000.dc to IOMMU_mappi=
ng
> >>>>> [    0.719347] Failed to attached device 54140000.gr2d to IOMMU_map=
ping
> >>>>> [    0.719569] Failed to attached device 54180000.gr3d to IOMMU_map=
ping
> >>>>>
> >>>>> which comes from the implicit IOMMU backing.
> >>>>
> >>>> And the error comes from here:
> >>>>
> >>>> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/iommu/iommu=
=2Ec#L1655
> >>>
> >>> So the detaching still should be needed, but at the moment the ARM32
> >>> DMA-mapping code is simply not suitable for the case of having multip=
le
> >>> devices in the same group. I'm wondering whether there are any real
> >>> users for the implicit IOMMU backing on ARM32 at all :/
> >>>
> >>
> >> Apparently the "Failed to attached device 54200000.dc" was always in t=
he
> >> log (I rarely testing the default multi-platform config), it's just the
> >> message is a pr_warn that I wasn't paying attention because it is
> >> colored like pr_info in dmesg :)
> >=20
> > Yeah, so the above isn't a complete solution. In order to actually use
> > the DMA API backed by an IOMMU, some additional patches are needed. I
> > have all of those in a local tree and I've already sent out a couple of
> > them. It's taking a while because they all need to be applied in small
> > iterations to make sure things don't break midway.
>=20
> I'd like to have an immediate interim solution.

To clarify: when I said "isn't a complete solution", what I meant is
that it's not a complete solution to make the implicit IOMMU backing
work with the DMA API. That's what I've got a patch set ready for.

But you said earlier that this change (i.e. putting all DRM devices into
the same IOMMU group) fixes the issue that you were seeing, right? So
that would be an immediate, interim solution, wouldn't it?

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2y4QkACgkQ3SOs138+
s6HJSBAAvXwKxredsBq8uCRcCehd17p3T85zGWNY9dQC5p+tspr7FG072UXNOb9h
z3R/c9qeZHjHfcNzQ8uyBJ8HDRNfaWLKO8ARKtW8vPUvxIEXLNdjxRm3ZldC8gOj
Q+67NAwijWQJa5LTQ5qXa8jWOMPkUInWMRbfEN4ZDEpcB0s9wPm78qvSMs/JoO6C
8VcnzPeJ8wNR9V2hogjHF3VrPpIhCgAs2ZWDLaqH9r74dEGBtHwEuhdH8HJ80wRf
VOTou8HQkpbI7TmQhy4O/uWLzC3pKZTPcIXODLyVtynb0vC/klVNJQwd92jnwLPF
22Q3chvSUBPb3r+8Lhu7fiby4KvsRGjEDYtkSqca/T73pcjN/ItYdxY/xM6JggYf
6UZJydgGtPW1PA0Iep+2aM9leY1XAdTuYy2pj1g0xeqtReNW/0GDzimF4SCIo7Nx
iPsyd57BuxaPWsgICor/aOdqeNCd9+Of4FZOKWfKsFHG8RW0RcrxwCufbmjG4wla
mqnt0loUKhMjHPWgZ1T4qIankC6qvo3o8GvvX60EuujrB/go2abDFBeDrfbeNNIL
t988IRl82yDUH9xTtDfk+i7Jqqcxa8ABgzN4Yy/sYPuEMDwNII1KnuhdeVBQ76DA
URSSzQLAMYAIxXEpLaH9E/n33swIBP0hzkqXlPbLGNzdOxkBOFQ=
=EoTj
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--

--===============0295360837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0295360837==--
