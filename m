Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0F7E7BB0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2161910E933;
	Fri, 10 Nov 2023 11:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D2110E933
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1699614504; x=1699873704;
 bh=ZbNbOL4GuBzgOf8vArIuHjqLWMOQxywLjXgsKNLV2fQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=gYdayvI6iArW2Lc1vzpmdebzgxly+TeDHpsM5s3j3EXJYiWS2q14zMM+C7NlCEJ2s
 JXMSIPqlUzkybjzdo52lpCOIEF/S/obeGJkUr3xxAkxWMjFI6HWsu/1TH/FGr1sthg
 mzPHSSkz7ow/D9WQdP3fU5fhkDHv9J8j0e75NsyRziUBBUxvduUnxZzkrsxfAIfVwU
 YWGbD1qWaThVvZrr1Wqq2D3C3ncsYnmZLu12sdOSFWknb8fe9YBNL6jV4EsLUHmcbm
 YiAL3XBBqvcdxKKlFgmTrxX7OIpY3qiWH11ADMWob5un561F8UHLGRBOFiekaTaBCa
 YHBrWmg453Vlg==
Date: Fri, 10 Nov 2023 11:08:06 +0000
To: Maxime Ripard <mripard@kernel.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <oTp8iN2ODz4pEo4WpvMQ5HWhBfoPYzA4aGKhe04iKaGNo7dn1G3Uw04Nsw6ZKlflcboqsp_gPb-V6mqGCLwT-V68O6JzBYbua56bLq0H51s=@emersion.fr>
In-Reply-To: <hqeyywu2pnava4hdgmjnsktsdkblia4mllrtffl5skocqm7kkx@eqtiltsn44ts>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <bEg7cd-LFy1CzhAIao2Dt0cNFUFEb6D1ZhZN1Rec3w151EjXWpaXsOAs2MmvEPMxQjVhuE0k3qvuryxN6hJp5tJCU1b7EqSKHdTXte-UvmQ=@emersion.fr>
 <hqeyywu2pnava4hdgmjnsktsdkblia4mllrtffl5skocqm7kkx@eqtiltsn44ts>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 9th, 2023 at 20:09, Maxime Ripard <mripard@kernel.org=
> wrote:

> On Thu, Nov 09, 2023 at 03:31:44PM +0000, Simon Ser wrote:
> > > > - What would be a good name for the heap? "vc4" is maybe a bit naiv=
e and
> > > > not precise enough. Something with "cma"? Do we need to plan a nami=
ng
> > > > scheme to accomodate for multiple vc4 devices?
> > >=20
> > > That's a general issue though that happens with pretty much all devic=
es
> > > with a separate node for modesetting and rendering, so I don't think
> > > addressing it only for vc4 make sense, we should make it generic.
> > >=20
> > > So maybe something like "scanout"?
> > >=20
> > > One thing we need to consider too is that the Pi5 will have multiple
> > > display nodes (4(?) iirc) with different capabilities, vc4 being only
> > > one of them. This will impact that solution too.
> >=20
> > I'm not sure trying to find a unique generic name for all split render/=
display
> > SoC is a good idea:
> >=20
> > - For the purposes of replacing DRM dumb buffers usage from v3d, we don=
't
> >   actually need a generic name, it's perfectly fine to hardcode a name =
here
> >   since vc4 is pretty much hardcoded there already.
>=20
> Right. I'm wondering how that will work with drivers like panfrost or
> powervr that will need to interact with different display drivers. We
> will have the same issue for those, but we won't be able to hardcode the
> driver name.

We will be able to hardcode the driver name. In fact, the driver name is
already hardcoded in kmsro today (Mesa creates one kmsro .so per supported
display driver in /usr/lib/dri).

It's just a matter of passing through the actual display device to panfrost=
 in
Mesa and adding a very simple mapping of driver name -> heap name.

> Similarly, if you have multiple display drivers, what "scanout-capable"
> will mean might differ from one device to the other. Some have
> constraints on the memory they can access for example, so you cannot
> just assume that a scanout-capable buffer allocated by vc4 might not be
> scanout-capable for one of the RP1 DSI device.
>=20
> > - As you said, "scanout" may be ill-defined depending on the system. Wh=
at if
> >   a PCIe or USB device is plugged in? What if vkms is loaded? What if t=
here are
> >   multiple platform display devices? What does "scanout" mean then?
> > - A generic solution to advertise what DMA heaps a DRM display device i=
s
> >   compatible with is probably better addressed by populating sysfs with=
 new
> >   files.
>=20
> That would be a good idea indeed
>=20
> >   We've talked with Sima at XDC about adding a symlink pointing to the
> >   DMA heap and extra metadata files describing priorities and such.
> >   However we don't actually need that part for the purposes of v3d --
> >   I think I'd rather defer that until more DMA heaps are plumbed
> >   across the DRM drivers.
>=20
> Honestly, I don't think we can afford to only consider vc4/v3d here. The
> issue you described seem to affect any SoC with a split scanout/GPU,
> which is pretty much all of them? And if they are all affected, we
> should design something that fixes it once and for all.

We don't need any sysfs stuff to fix the primary node and DRM dumb buffer
issues in Mesa's kmsro/renderonly. The sysfs stuff is only required for a f=
ully
generic buffer placement constraint/compatibility uAPI. Which would be supe=
r
useful in compositors, but let's do one step at a time.
