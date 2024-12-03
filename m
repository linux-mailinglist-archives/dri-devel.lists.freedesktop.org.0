Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36D9E29B4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88DF10EAEE;
	Tue,  3 Dec 2024 17:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA6110EAEE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:44:21 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tIWwX-0003We-RH; Tue, 03 Dec 2024 18:44:13 +0100
Message-ID: <5b5cd19556613e3e1190f23c052120bb3995860e.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/3] drm/etnaviv: Trivial mmu map and ummap cleanups
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 03 Dec 2024 18:44:13 +0100
In-Reply-To: <20241115123246.111346-1-sui.jingfeng@linux.dev>
References: <20241115123246.111346-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Freitag, dem 15.11.2024 um 20:32 +0800 schrieb Sui Jingfeng:
> The 'sg->offset' denotes the offset into a page in bytes, but under drm
> subsystem, there has NO drivers that etnaviv can contact that actually
> touch the 'offset' data member of SG anymore. This means that all DMA
> addresses that sg_dma_address() gives us will be PAGE_SIZE aligned, in
> other words, sg->offset will always equal to 0.
>=20
> But if 'sg->offset !=3D 0' really could happens, then the current impleme=
nt
> might be not correct. Previous commits[1] fix the 'sg->offset =3D=3D 0' c=
ases
> effectively, below is a simple illustration.
>=20
>        One CPU page       Another one CPU page
>   +----+----+----+----+   +----+----+----+----+
>   ||||||              |   ||||||              |
>   +----+----+----+----+   +----+----+----+----+
>   ^    ^                  ^    ^
>   |    |                  |    |
>   |    | .----------------'    |
>   |    | |    .----------------'
>   |    | |    |
>   +----+ +----+ +----+
>   |||||| |||||| |    |  GPU pages, each one is SZ_4K
>   +----+ +----+ +----+
>             Correct implementation.
>=20
> --------------------------------------------------------------
>=20
>        One CPU page       Another one CPU page
>   +----+----+----+----+   +----+----+----+----+
>   |///////////////////|   ||||||              |
>   +----+----+----+----+   +----+----+----+----+
>   ^                   ^   ^    ^
>   |                   |   |    |
>   |      .------------|---'    |
>   |      |    .-------|--------'
>   |      |    |       |
>   |      +----+       |
>   |      ||||||       |
>   |      +----+       |
>   |       IOVA        |  GPUVA range collision if use 'sg_dma_len(sg)'
>   +----+ +----+-------+  directly to map. Because 'sg_dma_len(sg)' is
>   |////|/|////////////|  frequently larger than SZ_4K.
>   +----+ +----+-------+
>             Wrong implementation.
>=20
> If we map the address range with respect to the size of the backing memor=
y,
> it will occupy GPUVA ranges that doesn't belong to. Which results in GPUV=
A
> range collision for different buffers.
>=20
> Patch 0001 of this series give a fix, patch 0002 and 0003
> do trivial cleanup which eliminates unnecessary overheads.

Thanks, applied to etnaviv/next.

Regards,
Lucas

> v2 -> v3
> 	* Reword and improve commit message
> v1 -> v2
> 	* Reword and fix typos and mistakes
>=20
> v1 Link: https://patchwork.freedesktop.org/series/140589/
>=20
> Sui Jingfeng (3):
>   drm/etnaviv: Drop the offset in page manipulation
>   drm/etnaviv: Fix the debug log  of the etnaviv_iommu_map()
>   drm/etnaviv: Improve VA, PA, SIZE alignment checking
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>=20

