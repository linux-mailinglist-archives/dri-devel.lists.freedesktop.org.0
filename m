Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABED91ECCB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 03:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93F10E004;
	Tue,  2 Jul 2024 01:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="eOVBC2LW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9171B10E004
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 01:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719884776; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=iLwzDls5J/DPEpg3+GepP2HlfzcDD8tMRNQMo/BVG5M8HVmJxS6Z0gROw6/VlLpy9t1zUxiz1GpFMxy7QsTiNZyIE0wPULra6iERJxSeV0t0X+OyMefEJiEwbbfrXDtandRxsdRTurSns/VOZg86D+4KwfddBXwB7pUsHQo9qUY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719884776;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=EQHcqPR7udWUMu3YYJb+49FFMAoeYizeCZJT48BKFwc=; 
 b=RVbx4e7cruUwuhAdmRhmjPr9iIR4InvFxClonGLAwGANLFLi/2+TvRvU9cdG8zA5pJqp72w8INJ3AtD3UvZa4R2EBxQiULW0gwkUjldum7XseVH+EUdIWUunwMYV63BSLD0bH78vmvcepJY3OZlP4rQSzSwTnSansTS6qfRE5do=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719884776; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=EQHcqPR7udWUMu3YYJb+49FFMAoeYizeCZJT48BKFwc=;
 b=eOVBC2LWw74wGxOP5irAyhA4PLQ6YEl5KMdEm5bDzpsnZIVtpukOzt4SxZy5PQic
 93owZKE6dsOPBCn99CX241pKEy2waFg9CFhWJplUPCetKPDeWolIo+rqvvTXQtXTmGm
 ezaRcZYMeXVN/GU9vY6rT4ZFdAs5FBy10YLPp6joBbQ5OmP7idw4swgBgwwBUlYmgMM
 UbA7l9cYOY6I39Y+O62XVW16l7KQDmHA7OHkZLTHiEcDG4wuPyyQz64Q2kCQV6DgFJx
 Xiz0oJxfMDOcKoMfKoO5D9yl76kLaqZoOM2vqAp4E2vuccm+e8pnH9kJ007LHuDgjoR
 to7SgbbB7w==
Received: by mx.zohomail.com with SMTPS id 1719884774681263.7719583932645;
 Mon, 1 Jul 2024 18:46:14 -0700 (PDT)
Message-ID: <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined
 when snooping not available
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Huang Rui <ray.huang@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Jul 2024 09:46:10 +0800
In-Reply-To: <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
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

=E5=9C=A8 2024-07-01=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 13:40 +0200=EF=BC=
=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
> >=20
> > =E4=BA=8E 2024=E5=B9=B46=E6=9C=8830=E6=97=A5 GMT+08:00 03:57:47=EF=BC=
=8CJiaxun Yang
> > <jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
> > >=20
> > > =E5=9C=A82024=E5=B9=B46=E6=9C=8829=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8A=E5=8D=886:22=EF=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > > [...]
> > > > @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct
> > > > ttm_buffer_object *bo,
> > > > struct ttm_resource *res,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0caching =3D res->bus.caching;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Downgrade cached mapp=
ing for non-snooping devices */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!bo->bdev->dma_coher=
ent && caching =3D=3D ttm_cached)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0caching =3D ttm_write_combined;
> > > Hi Icenowy,
> > >=20
> > > Thanks for your patch! You saved many non-coh PCIe host
> > > implementations a day!.
>=20
> Ah, wait a second.
>=20
> Such a thing as non-coherent PCIe implementation doesn't exist. The
> PCIe=20
> specification makes it mandatory for memory access to be cache
> coherent.

Really? I tried to get PCIe spec 2.0, PCI spec 3.0 and PCI-X addendum
1.0, none of this explicitly requires the PCIe controller and the CPU
being fully coherent. The PCI-X spec even says "Note that PCI-X, like
conventional PCI, does not require systems to support coherent caches
for addresses accessed by PCI-X requesters".

In addition, in the perspective of Linux, I think bypassing CPU cache
of shared memory is considered as coherent access too, see
dma_alloc_coherent() function's naming.

>=20
> There are a bunch of non-compliant PCIe implementations which have=20
> broken cache coherency, but those explicitly violate the
> specification=20
> and because of that are not supported.

Regardless of it violating the spec or not, these devices work with
Linux subsystems that use dma_alloc_coherent to allocate DMA buffers
(which is the most common case), and GPU drivers just give out cryptic
error messages like "ring gfx test failed" without any mention of
coherency issues at all, which makes the fact that Linux DRM/TTM
subsystem currently requires PCIe snooping CPU cache more obscure.

>=20
> Regards,
> Christian.
>=20
> > >=20
> > > Unfortunately I don't think we can safely ttm_cached to
> > > ttm_write_comnined, we've
> > > had enough drama with write combine behaviour on all different
> > > platforms.
> > >=20
> > > See drm_arch_can_wc_memory in drm_cache.h.
> > >=20
> > Yes this really sounds like an issue.
> >=20
> > Maybe the behavior of ttm_write_combined should furtherly be
> > decided
> > by drm_arch_can_wc_memory() in case of quirks?
> >=20
> > > Thanks
> > >=20
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ttm_prot_fro=
m_caching(caching, tmp);
> > > > =C2=A0 }
> > > > =C2=A0 EXPORT_SYMBOL(ttm_io_prot);
> > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > index 7b00ddf0ce49f..3335df45fba5e 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct
> > > > ttm_tt *ttm,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_caching caching,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long extra_pages)
> > > > =C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Downgrade cached mapp=
ing for non-snooping devices */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!bo->bdev->dma_coher=
ent && caching =3D=3D ttm_cached)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0caching =3D ttm_write_combined;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm->num_pages =3D =
(PAGE_ALIGN(bo->base.size) >>
> > > > PAGE_SHIFT) + extra_pages;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm->page_flags =3D=
 page_flags;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm->dma_address =
=3D NULL;
> > > > diff --git a/include/drm/ttm/ttm_caching.h
> > > > b/include/drm/ttm/ttm_caching.h
> > > > index a18f43e93abab..f92d7911f50e4 100644
> > > > --- a/include/drm/ttm/ttm_caching.h
> > > > +++ b/include/drm/ttm/ttm_caching.h
> > > > @@ -47,7 +47,8 @@ enum ttm_caching {
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/**
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @ttm_cached: Ful=
ly cached like normal system memory,
> > > > requires that
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * devices snoop the CPU=
 cache on accesses.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * devices snoop the CPU=
 cache on accesses. Downgraded
> > > > to
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ttm_write_combined wh=
en the snooping capaiblity is
> > > > missing.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ttm_cached
> > > > =C2=A0 };
> > > > --=20
> > > > 2.45.2
>=20

