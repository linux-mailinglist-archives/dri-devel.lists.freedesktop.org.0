Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621B923AFB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 12:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F310E1AB;
	Tue,  2 Jul 2024 10:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="FHCmYi5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7310E1AB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 10:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1719914470; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hwG+VedwzcfPvdhlTgBnuVt5K/rI6Tuuw/rZGp2QvXeLcEGB4Mhke37BFPBLPZo0hQmF+vWMTl/FlAKiqyKHK+u8U8wtVuan1Vsn9n0Js8jsefB8NAC9fiHcRp4lrYZLrIdTI7zq/unQT/nl+iIrssP89QiyQYxb6g9dJkJYW84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1719914470;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lq+cPpQFpajmigEpdnK1tqlgUHHq9wmvoZ7G1CxyHeg=; 
 b=HjxFKPZBuCm6DgD5D/R6VDV6sDGz6vdkmsauZCxmkfocaiYZdq5sVSjh0HYUg6ADq31VELxlBDN88pAebxFowKo9vdtQXjPAh0MqKseS/Gb9jlrjqgkUnkMmX/QcTCCy0og4UNaalXGwLkwAgKK0+bSE3VQGP0PXj0RLbyBvack=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719914470; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=lq+cPpQFpajmigEpdnK1tqlgUHHq9wmvoZ7G1CxyHeg=;
 b=FHCmYi5D4THx6B5y6F5eedkbs9KsIlBTh3IHigtUTr1gCuVrzvgp4BdhtagVo4ZE
 HkPtm5ERa/+Tg5zEzlpmAkXGNjOs/CgSgAVgxTN+hrYt2RF3XCHFVkXCJOCM7mPdxMR
 bjEa/N8iF/vFJIS275ltRxdfV8bZynRP82ps2lRQlteUoQHnZvsGTTdhJ6Yve6sUNlr
 3VJ/P4WqZJDMnAhUgqOgtcWXoZ/5dzqVEqIDPmTPKSclysY+roCR0yzq2wz0KyVM3hQ
 c2oeqjrOijWsJBEcluKpUuxYBREG7Ggein/56HvXF7Q2dYqroYXr1Ahn0Od2wmy2Lv5
 jhXTmxCQQA==
Received: by mx.zohomail.com with SMTPS id 1719914469225554.1334590249544;
 Tue, 2 Jul 2024 03:01:09 -0700 (PDT)
Message-ID: <0db974d40cd8c5dcc723d43c328bac923e0fe33a.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined
 when snooping not available
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Huang Rui <ray.huang@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Jul 2024 18:01:05 +0800
In-Reply-To: <ae7085fd-3bca-4a4a-b465-5e4941011877@amd.com>
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
 <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
 <b9189c97f7efbaa895198113ee5b47012bd8b4dc.camel@icenowy.me>
 <ae7085fd-3bca-4a4a-b465-5e4941011877@amd.com>
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

=E5=9C=A8 2024-07-02=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 11:27 +0200=EF=BC=
=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> Am 02.07.24 um 11:06 schrieb Icenowy Zheng:
> > [SNIP]
> > However I don't think the definition of the AGP spec could apply on
> > all
> > PCI(e) implementations. The AGP spec itself don't apply on
> > implementations that do not implement AGP (which is the most PCI(e)
> > implementations today), and it's not in the reference list of the
> > PCIe
> > spec, so it does no help on this context.
>=20
> No, exactly that is not correct.
>=20
> See as I explained the No-Snoop extension to PCIe was created to help
> with AGP support and later merged into the base PCIe specification.
>=20
> So the AGP spec is now part of the PCIe spec.
> [SNIP]

I don't think AGP spec is part of the PCIe spec, at least not part of
the PCIe spec I was reading. It does not contain the word "AGP" at all,
and despite it has a "Reference Documents" chapter, this chapter didn't
include the AGP spec, unlike PCI spec / PCI-X addendum which are listed
there.

In addition, your logic that No-Snoop is related to AGP only apply when
discussing about the history of PCIe, not when inspecting it from a
synchronic view, which is what new implementers of a spec should do.

> > > We have quite a bunch of V4L, sound and I also think network
> > > devices
> > > which work like that. But those are non-PCI devices.
> > I think in the Linux kernel most drivers (of course including PCI
> > ones)
> > use DMA buffer in this way, which makes them natually compatible
> > with
> > non-coherent PCIe implementations. TTM is one of the few exceptions
> > here.
>=20
> Yes and that is absolutely intentional.
>=20
> See we don't want to support any non-coherent PCIe implementation.
>=20

However, considering users exist for this setup, I here seriously hope
the support to be gained since today.

> [SNIP]
> > > And if I'm not completely mistaken the RISC-V specification was
> > > also
> > > updated to disallow stuff like this.
> > >=20
> > > So yes you can have boards which implement non-snooped PCIe, but
> > > you
> > > get
> > > exactly zero support from hardware vendors to run software on it.
> > >=20
> > It's a quite usual case for free softwares to get no support from
> > hardware vendors, and some of them are even developed by reverse
> > engineering. I don't think it as a blocker for the Linux kernel to
> > merge as many hardwares' support as possible.
>=20
> We seem to have a misunderstanding here, this is not a software
> issue.=20
> The hardware platform is considered broken by the hardware vendor!

I don't think in this case Arm Ltd / RISC-V International is considered
the vendor -- the SoC vendor is. You can rarely get support directly
from the CPU ISA vendor (or CPU IP vendor, which differs mostly in the
RISC-V situation) in the case a SoC or a final product with some SoC is
purchased, and the SoC/product's vendor would rarely declare their
hardware platform as broken.

>=20
> In other words people have stitched together hardware in a way which
> is=20
> not supported by the creator of that hardware.
>=20
> So as long as you can't convince anybody from ARM or the RISC-V team
> or=20
> whoever created that hardware to confirm that the hardware actually=20
> works you won't get any support for that.

The world isn't black-or-white, and the thing contradictory to
"confirmed working" is "not confirmed working" instead of "confirmed
not working". To get the thing really working (or prove it doesn't work
at all by practice) is part of the traditional fun of a hacker.

>=20
> Regards,
> Christian.

