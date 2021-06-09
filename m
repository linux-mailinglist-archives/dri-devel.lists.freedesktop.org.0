Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7C43A1DE9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 22:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870246EA94;
	Wed,  9 Jun 2021 20:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id D92136EA94;
 Wed,  9 Jun 2021 20:00:12 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id B87917A025C;
 Wed,  9 Jun 2021 22:00:10 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
Date: Wed, 9 Jun 2021 22:00:07 +0200
User-Agent: KMail/1.9.10
References: <202106052143.52488.linux@zary.sk>
 <202106090910.51188.linux@zary.sk>
 <762c1044-6e3a-48fc-95e4-1730b6ef2a2e@amd.com>
In-Reply-To: <762c1044-6e3a-48fc-95e4-1730b6ef2a2e@amd.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <202106092200.08088.linux@zary.sk>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday 09 June 2021 11:21:05 Christian K=C3=B6nig wrote:
> Am 09.06.21 um 09:10 schrieb Ondrej Zary:
> > On Wednesday 09 June 2021, Christian K=C3=B6nig wrote:
> >> Am 09.06.21 um 08:57 schrieb Ondrej Zary:
> >>> [SNIP]
> >>>> Thanks for the heads up. So the problem with my patch is already fix=
ed,
> >>>> isn't it?
> >>> The NULL pointer dereference in nouveau_bo_wr16 introduced in
> >>> 141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
> >>> aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
> >>>
> >>> That's the bug I hit when bisecting the original problem:
> >>> NULL pointer dereference in nouveau_bo_sync_for_device
> >>> It's caused by:
> >>> # first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/tt=
m: merge ttm_dma_tt back into ttm_tt
> >> Good that I've asked :)
> >>
> >> Ok that's a bit strange. e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 was
> >> created mostly automated.
> >>
> >> Do you have the original backtrace of that NULL pointer deref once mor=
e?
> > The original backtrace is here: https://nam11.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Flkml.org%2Flkml%2F2021%2F6%2F5%2F350&amp;data=
=3D04%7C01%7Cchristian.koenig%40amd.com%7Ce905b6bd2aa842ace15508d92b15b96d%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588195000729460%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000&amp;sdata=3DzFqheBbJcOHtYgqG%2Fs63AT1dwuk4REmUDJWHvzaLAlc%3D&am=
p;reserved=3D0
>=20
> And the problem is that ttm_dma->dma_address is NULL, right? Mhm, I=20
> don't see how that can happen since nouveau is using ttm_sg_tt_init().
>=20
> Apart from that what nouveau does here is rather questionable since you=20
> need a coherent architecture for most things anyway, but that's not what=
=20
> we are trying to fix here.
>=20
> Can you try to narrow down if ttm_sg_tt_init is called before calling=20
> this function for the tt object in question?

ttm_sg_tt_init is not called:
[   12.150124] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
[   12.150133] nouveau 0000:01:00.0: DRM: GART: 128 MiB
[   12.150143] nouveau 0000:01:00.0: DRM: BMP version 5.6
[   12.150151] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   12.151362] ttm_tt_init
[   12.151370] ttm_tt_init_fields
[   12.151374] ttm_tt_alloc_page_directory
[   12.151615] BUG: kernel NULL pointer dereference, address: 00000000



=2D-=20
Ondrej Zary
