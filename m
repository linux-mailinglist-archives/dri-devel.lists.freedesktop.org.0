Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF299C05C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 08:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DB310E276;
	Mon, 14 Oct 2024 06:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FTjVl/cE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFB710E276
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 06:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728888599;
 bh=W3t6fEkFjSDs3TvwzCtEzUOPSsrYWr1E2n20/Ja2yrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FTjVl/cEK/69dbbSsOv/0XgKwKL6UAOEwJ/Ic7M41o3HCpJXNsiMZTQUjnviAMfwE
 xP9UhWexBaeCTLH060DobN190leXFju1sd0UMPBQpcogbHmHiVVE57k4dEfpdZDQli
 562MklDSp1pUPHiydlvKHd0sse2O1eEMyLm2jscK+wS3klhThI+3ll4WFLF1pvPdg0
 YDRWTPuWt4LTEJsU2cHV5Tx5H2+j4XxPsX0KbdmoNpBrKuMRUViNfkeg+/nxHuVX3u
 Qe10oHjw6x1KsFSZmIIKVOQKboG9/wGSYrfWipnGki5Kt/Z3xrFWo2+G39ApDHjn6W
 kQYY1qzFBnwCA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FD1B17E107A;
 Mon, 14 Oct 2024 08:49:59 +0200 (CEST)
Date: Mon, 14 Oct 2024 08:49:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix firmware initialization on systems
 with a page size > 4k
Message-ID: <20241014084953.37a417fd@collabora.com>
In-Reply-To: <ynenorrf3kf3a5hmxfocjge3ytbydx42dmat53ywqaphjuc56k@lcgbdggi63ve>
References: <20241008084744.82688-1-boris.brezillon@collabora.com>
 <ff6196b6-f385-4d54-b34b-ce8f6d8d0f0a@arm.com>
 <ynenorrf3kf3a5hmxfocjge3ytbydx42dmat53ywqaphjuc56k@lcgbdggi63ve>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Oct 2024 18:58:45 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Hi Boris,
>=20
> On 09.10.2024 09:10, Steven Price wrote:
> > On 08/10/2024 09:47, Boris Brezillon wrote: =20
> > > The system and GPU MMU page size might differ, which becomes a
> > > problem for FW sections that need to be mapped at explicit address
> > > since our PAGE_SIZE alignment might cover a VA range that's
> > > expected to be used for another section.
> > >=20
> > > Make sure we never map more than we need.
> > >=20
> > > Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
> >=20
> > Reviewed-by: Steven Price <steven.price@arm.com>
> >  =20
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_fw.c  |  3 +--
> > >  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
> > >  drivers/gpu/drm/panthor/panthor_mmu.c |  6 +++---
> > >  3 files changed, 12 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/p=
anthor/panthor_fw.c
> > > index ef232c0c2049..293846400296 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > > @@ -515,8 +515,7 @@ static int panthor_fw_load_section_entry(struct p=
anthor_device *ptdev,
> > >  		return -EINVAL;
> > >  	}
> > > =20
> > > -	if ((hdr.va.start & ~PAGE_MASK) !=3D 0 ||
> > > -	    (hdr.va.end & ~PAGE_MASK) !=3D 0) {
> > > +	if (!IS_ALIGNED(hdr.va.start, SZ_4K) || !IS_ALIGNED(hdr.va.end, SZ_=
4K)) {
> > >  		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not p=
age aligned: 0x%x-0x%x\n",
> > >  			hdr.va.start, hdr.va.end);
> > >  		return -EINVAL;
> > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/=
panthor/panthor_gem.c
> > > index c60b599665d8..2c8d6e2c7232 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > @@ -44,8 +44,7 @@ void panthor_kernel_bo_destroy(struct panthor_kerne=
l_bo *bo)
> > >  			to_panthor_bo(bo->obj)->exclusive_vm_root_gem !=3D panthor_vm_roo=
t_gem(vm)))
> > >  		goto out_free_bo;
> > > =20
> > > -	ret =3D panthor_vm_unmap_range(vm, bo->va_node.start,
> > > -				     panthor_kernel_bo_size(bo));
> > > +	ret =3D panthor_vm_unmap_range(vm, bo->va_node.start, bo->va_node.s=
ize);
> > >  	if (ret)
> > >  		goto out_free_bo;
> > > =20
> > > @@ -95,10 +94,16 @@ panthor_kernel_bo_create(struct panthor_device *p=
tdev, struct panthor_vm *vm,
> > >  	}
> > >  	bo =3D to_panthor_bo(&obj->base);
> > > -	size =3D obj->base.size;
> > >  	kbo->obj =3D &obj->base;
> > >  	bo->flags =3D bo_flags;
> > > =20
> > > +	/* The system and GPU MMU page size might differ, which becomes a
> > > +	 * problem for FW sections that need to be mapped at explicit addre=
ss
> > > +	 * since our PAGE_SIZE alignment might cover a VA range that's
> > > +	 * expected to be used for another section.
> > > +	 * Make sure we never map more than we need.
> > > +	 */ =20
>=20
> I was wondering, this must be a relatively common situation for other DRM
> drivers, so maybe the DRM shmem core should have a BO creation function t=
hat
> lets you specify an exact page alignment?

So, there's a difference between the MMU page granularity and the system
page size. The BO allocation granularity will always be the system page
size, because gem_shmem can't allocate partial pages.

>=20
> > > +	size =3D ALIGN(size, SZ_4K); =20
>=20
> I was thinking, if we know that the FW's page size is always 4KiB, maybe =
we could do
>=20
> #define CSF_FW_PAGESIZE SZ_4K
>=20
> somewhere in panthor_fw.h to make things clearer?

That I can do. If we want it to be fully dynamic, we can even make it a
panthor_mmu_get_page_size() helper which queries the pgsize_bitmap of
the io_pgtable to get the minimum granularity.
