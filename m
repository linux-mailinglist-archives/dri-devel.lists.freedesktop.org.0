Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF8923921
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC7E10E584;
	Tue,  2 Jul 2024 09:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="C6eBbwvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EE510E584
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:07:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719911223; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Lt6LDrIVAKcjjiMxtlB7Jc+QMjW9QDl8p0VT6jAkDetY+pMggET+3x6rItFDnsZJGWXRfyVs6aOmghzWhbOBglkZhye6Uay8CUuKuM+5DF13Z6bOd4Jd6tKcGtviTYOdZK9iCKeUn5n7HUBySSzSO4SnDGKSgb7SY34+XEkGjYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719911223;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XiZHzVujTlnwtWWbOC/rEjmO02LxDk476pkU6n7vRdc=; 
 b=NE2mAvQbEt0WLOO26xeTdzUD7WVb4l8121B2DivIwU2tEtQ1uTBjMs3+OZ1X+QoY29a7g8zZedU4PZ6vFBk5uiGubb3eAtJofqNu7unJ7y48XNt/a4r2xWzLARRNhkSzZPKHY/9OdxRKRvMEj4r4K+uZU/i45RNh5bOTyvun23g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719911223; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=XiZHzVujTlnwtWWbOC/rEjmO02LxDk476pkU6n7vRdc=;
 b=C6eBbwvA5mQ0PLWSqtFoXMx0o/jD2YBrrUNt65GNwBJSY361LezuEC7Uaoz6cznk
 OgTUJGzJF3k+cMuV+iQVvlzHF4mHA24+1RUjcfWtAADU6c1eOM2d2lccFol0azuTFRY
 j1z52ZOelXtLLP7pXto0fb5GU6ssFX+tjfWxwXPSEn/+on2NCOuFDc17hYCvJBdFVw1
 ZT2V+p3xbAtW30tMZYpB04Jc0j/1U3hRTGe4eincBY86GQCkGhkAXIj6mt5HOgwFJ1x
 h8vO7vNNXje+Mvt0Y6niRxxkzhMbTn2hvflTsq/ROx+0acv8PIJM0msRyo4tEDhKyCs
 ZbQ97HdZYg==
Received: by mx.zohomail.com with SMTPS id 1719911221897364.74630557422086;
 Tue, 2 Jul 2024 02:07:01 -0700 (PDT)
Message-ID: <b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined
 when snooping not available
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Huang Rui <ray.huang@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Jul 2024 17:06:58 +0800
In-Reply-To: <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
 <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2024-07-02=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 10:08 +0200=EF=BC=
=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> Am 02.07.24 um 03:46 schrieb Icenowy Zheng:
> > =E5=9C=A8 2024-07-01=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 13:40 +0200=EF=
=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> > > Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
> > > > =E4=BA=8E 2024=E5=B9=B46=E6=9C=8830=E6=97=A5 GMT+08:00 03:57:47=EF=
=BC=8CJiaxun Yang
> > > > <jiaxun.yang@flygoat.com>=C2=A0 =E5=86=99=E9=81=93=EF=BC=9A
> > > > > =E5=9C=A82024=E5=B9=B46=E6=9C=8829=E6=97=A5=E5=85=AD=E6=9C=88 =E4=
=B8=8A=E5=8D=886:22=EF=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > > > > [...]
> > > > > > @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct
> > > > > > ttm_buffer_object *bo,
> > > > > > struct ttm_resource *res,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0caching =3D res->bus.caching;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Downgrade cached =
mapping for non-snooping
> > > > > > devices */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!bo->bdev->dma_c=
oherent && caching =3D=3D
> > > > > > ttm_cached)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0caching =3D ttm_write_combined;
> > > > > Hi Icenowy,
> > > > >=20
> > > > > Thanks for your patch! You saved many non-coh PCIe host
> > > > > implementations a day!.
> > > Ah, wait a second.
> > >=20
> > > Such a thing as non-coherent PCIe implementation doesn't exist.
> > > The
> > > PCIe
> > > specification makes it mandatory for memory access to be cache
> > > coherent.
> > Really? I tried to get PCIe spec 2.0, PCI spec 3.0 and PCI-X
> > addendum
> > 1.0, none of this explicitly requires the PCIe controller and the
> > CPU
> > being fully coherent. The PCI-X spec even says "Note that PCI-X,
> > like
> > conventional PCI, does not require systems to support coherent
> > caches
> > for addresses accessed by PCI-X requesters".
>=20
> See the very first PCI specification, AGP 2.0 and the PCIe extension
> for=20
> non-snooped access.
>=20
> Originally it wasn't well defined what the PCI 1.0 spec meant with=20
> coherency (e.g. snooping vs uncached).
>=20

I think the word in PCI-X addendum could be understood as kind of
clarification, which makes at least PCI-X (and maybe retrospectively
PCI) coherency optional.

> AGP was the first specification which explicitly defined that all AGP
> memory accesses must be non-snooped and all PCI accesses must snoop
> the=20
> CPU caches.

However I don't think the definition of the AGP spec could apply on all
PCI(e) implementations. The AGP spec itself don't apply on
implementations that do not implement AGP (which is the most PCI(e)
implementations today), and it's not in the reference list of the PCIe
spec, so it does no help on this context.

>=20
> PCIe then had an extension which defined the "No Snooping Attribute"
> to=20
> allow emulating the AGP behavior.
>=20
> For the current PCIe 6.1 specification the non-snoop extension was=20
> merged into the base specification.
>=20
> Here see section "2.2.6.5 No Snoop Attribute", e.g. "Hardware
> enforced=20
> cache coherency expected"
>=20
> As well as the notes under section 7.5.3.4 Device Control Register:
>=20
> Enable No Snoop - If this bit is Set, the Function is permitted to
> Set=20
> the No Snoop bit in the Requester
> Attributes of transactions it initiates that do not require hardware=20
> enforced cache coherency (see Section 2.2.6.5 ).
>=20
> To summarize it: Not snooping caches is an extension, snooping caches
> is=20
> mandatory.

I don't get any such new PCIe specifications, but in Section 2.2.6.3 of
PCIe specification 2.0, it declares these attribute bits as "hints"
"Level of support is dependent on target applications", and suggests to
refer to PCI-X 2.0 (which is the document that I referenced the
sentence originally from).

This makes it reasonable that No-Snoop bit is only meaningful in a
coherent implementation, and it becomes just no-op for non-coherent
implementations. If PCIe specification really requires coherent access
by default, this should be mentioned in other parts of the spec,
instead of only get referred by the No-Snoop bit definition.

>=20
> > In addition, in the perspective of Linux, I think bypassing CPU
> > cache
> > of shared memory is considered as coherent access too, see
> > dma_alloc_coherent() function's naming.
>=20
> Yes that's correct, but this is for platform devices. E.g. other I/O=20
> from drivers who doesn't need to work with malloced system memory for
> example.
>=20
> We have quite a bunch of V4L, sound and I also think network devices=20
> which work like that. But those are non-PCI devices.

I think in the Linux kernel most drivers (of course including PCI ones)
use DMA buffer in this way, which makes them natually compatible with
non-coherent PCIe implementations. TTM is one of the few exceptions
here.

>=20
> > > There are a bunch of non-compliant PCIe implementations which
> > > have
> > > broken cache coherency, but those explicitly violate the
> > > specification
> > > and because of that are not supported.
> > Regardless of it violating the spec or not, these devices work with
> > Linux subsystems that use dma_alloc_coherent to allocate DMA
> > buffers
> > (which is the most common case), and GPU drivers just give out
> > cryptic
> > error messages like "ring gfx test failed" without any mention of
> > coherency issues at all, which makes the fact that Linux DRM/TTM
> > subsystem currently requires PCIe snooping CPU cache more obscure.
>=20
> No, they don't even remotely work. You just got very basic tests
> working.
>=20
> Both the Vulkan as well as the OpenGL specification require that you
> can=20
> import "normal" malloced() system memory into the GPU driver.

I am not familiar with Vulkan, however in the OpenGL context I don't
think just importing a memory buffer into the GPU is supported. Most
buffers of OpenGL is declared and allocated on the GPU part, and have
data copied to by either using specific GL functions (e.g. glTexImage*)
or have the GPU side buffer mapped to CPU (with functions like
glMapBuffer). In this case the memory is surely not "normal malloc()ed
memory", but memory originated from the GPU driver.

To map arbitary CPU-allocated buffers, not only the GPU should be able
to fully snoop the CPU cache, but the GPU MMU should have a equal or
smaller page size than the CPU MMU (although in real world cases the
GPU page size is usually 4K and the CPU page size is usually >=3D4K,
which makes this not a big problem, but still not well considered).

In fact, in my daily jobs, I met the situation that the library of some
peripheral (a HW decoder) just passed an arbitary user-space pointer to
the application without any hardware address info (its internal
implementation seems to use dma-buf, but I get no interface for
acquiring the dma-buf information), and I failed to do a zero-copy
optimization of this just because I am not able to import this user-
space pointer to the GPU driver because of no known API importing this
arbitary pointer without further device memory info.

>=20
> This is not possible without a cache coherent platform architecture.
> So=20
> you can't fully support those APIs.

In this case I think the coherency status could be exported to the
userspace, and the userspace side driver could disable certain APIs (I
don't think anything in the core GL 2.1 spec should be affected).

In addition, in the case of AMD GPUs, disabling KFD for non-coherent
devices sounds viable.

>=20
> We exercised this quite extensively already and even have a
> confirmation=20
> from ARM engineers that the approach of attaching just any PCIe root
> to=20
> an ARM IP core is not supported from their side.

This kind of problem should be considered as a kind of platform
implementation, not getting support from just the CPU IP core vendor
isn't a surprise; this do not prevent ARM SoC vendors from implementing
PCIe, from low-end ones such as Allwinner to high-end ones such as you
AMD.

> And if I'm not completely mistaken the RISC-V specification was also=20
> updated to disallow stuff like this.
>=20
> So yes you can have boards which implement non-snooped PCIe, but you
> get=20
> exactly zero support from hardware vendors to run software on it.
>=20

It's a quite usual case for free softwares to get no support from
hardware vendors, and some of them are even developed by reverse
engineering. I don't think it as a blocker for the Linux kernel to
merge as many hardwares' support as possible.

> Regards,
> Christian.
>=20
> > > Regards,
> > > Christian.
> > >=20
> > > > > Unfortunately I don't think we can safely ttm_cached to
> > > > > ttm_write_comnined, we've
> > > > > had enough drama with write combine behaviour on all
> > > > > different
> > > > > platforms.
> > > > >=20
> > > > > See drm_arch_can_wc_memory in drm_cache.h.
> > > > >=20
> > > > Yes this really sounds like an issue.
> > > >=20
> > > > Maybe the behavior of ttm_write_combined should furtherly be
> > > > decided
> > > > by drm_arch_can_wc_memory() in case of quirks?
> > > >=20
> > > > > Thanks
> > > > >=20
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return tt=
m_prot_from_caching(caching, tmp);
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0 EXPORT_SYMBOL(ttm_io_prot);
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > index 7b00ddf0ce49f..3335df45fba5e 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct
> > > > > > ttm_tt *ttm,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_caching caching,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long extra_pages)
> > > > > > =C2=A0=C2=A0 {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Downgrade cached =
mapping for non-snooping
> > > > > > devices */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!bo->bdev->dma_c=
oherent && caching =3D=3D
> > > > > > ttm_cached)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0caching =3D ttm_write_combined;
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm->num_=
pages =3D (PAGE_ALIGN(bo->base.size) >>
> > > > > > PAGE_SHIFT) + extra_pages;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm->page=
_flags =3D page_flags;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm->dma_=
address =3D NULL;
> > > > > > diff --git a/include/drm/ttm/ttm_caching.h
> > > > > > b/include/drm/ttm/ttm_caching.h
> > > > > > index a18f43e93abab..f92d7911f50e4 100644
> > > > > > --- a/include/drm/ttm/ttm_caching.h
> > > > > > +++ b/include/drm/ttm/ttm_caching.h
> > > > > > @@ -47,7 +47,8 @@ enum ttm_caching {
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @ttm_c=
ached: Fully cached like normal system
> > > > > > memory,
> > > > > > requires that
> > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * devices snoop the=
 CPU cache on accesses.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * devices snoop the=
 CPU cache on accesses.
> > > > > > Downgraded
> > > > > > to
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ttm_write_combine=
d when the snooping capaiblity
> > > > > > is
> > > > > > missing.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm_cache=
d
> > > > > > =C2=A0=C2=A0 };
> > > > > > --=20
> > > > > > 2.45.2

