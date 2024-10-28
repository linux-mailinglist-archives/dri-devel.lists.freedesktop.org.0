Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF279B357E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA62F10E507;
	Mon, 28 Oct 2024 15:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9F10E505
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:57:27 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t5S7O-0004aX-M5; Mon, 28 Oct 2024 16:57:22 +0100
Message-ID: <e3049e426581d913c732b7da2497cd40605bc5bb.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] drm/etnaviv: Fix GPUVA range collision when CPU
 page size is not equal to GPU page size
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 16:57:22 +0100
In-Reply-To: <20241025204355.595805-1-sui.jingfeng@linux.dev>
References: <20241025204355.595805-1-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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

Am Samstag, dem 26.10.2024 um 04:43 +0800 schrieb Sui Jingfeng:
> Etnaviv assumes that GPU page size is 4KiB, however, when using
> softpin capable GPUs on a different CPU page size configuration.
> The userspace allocated GPUVA ranges collision, unable to be
> inserted to the specified address hole exactly.
>=20
>=20
> For example, when running glmark2-drm:
>=20
> [kernel space debug log]
>=20
>  etnaviv 0000:03:00.0: Insert bo failed, va: 0xfd38b000, size: 0x4000
>  etnaviv 0000:03:00.0: Insert bo failed, va: 0xfd38a000, size: 0x4000
>=20
> [user space debug log]
>=20
> bo->va =3D 0xfd38c000, bo->size=3D0x100000
> bo->va =3D 0xfd38b000, bo->size=3D0x1000  <-- Insert IOVA fails here.
> bo->va =3D 0xfd38a000, bo->size=3D0x1000
> bo->va =3D 0xfd389000, bo->size=3D0x1000
>=20
>=20
> The root cause is that kernel side BO takes up bigger address space
> than userspace assumes.
>=20
> To solve this problem, we first track the GPU visible size of GEM buffer
> object, then map and unmap the GEM BOs exactly with respect to its GPUVA
> size. Ensure that GPU VA is fully mapped/unmapped, not more and not less.
>=20

Thanks, series applied to etnaviv/next

> v2:
> - Aligned to the GPU page size (Lucas)
>=20
> v1:
> - No GPUVA range wasting (Lucas)
> Link: https://lore.kernel.org/dri-devel/20241004194207.1013744-1-sui.jing=
feng@linux.dev/
>=20
> v0:
> Link: https://lore.kernel.org/dri-devel/20240930221706.399139-1-sui.jingf=
eng@linux.dev/
>=20
> Sui Jingfeng (2):
>   drm/etnaviv: Record GPU visible size of GEM BO separately
>   drm/etnaviv: Map and unmap GPUVA range with respect to the GPUVA size
>=20
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 ++++----
>  drivers/gpu/drm/etnaviv/etnaviv_gem.h |  5 ++++
>  drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 36 +++++++++------------------
>  3 files changed, 22 insertions(+), 30 deletions(-)
>=20

