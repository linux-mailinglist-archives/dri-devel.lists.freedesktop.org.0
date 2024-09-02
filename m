Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5FB968ACC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 17:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9E10E329;
	Mon,  2 Sep 2024 15:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EcJJv+SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B93810E329
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725290451;
 bh=AFNYEOlMJ/zuT0/uCEO/QdaKznsn0hEaVroauUUpLkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EcJJv+SW0HAFOTxQoiPK8uSSmByHDJlUwqLxw1YqzlTmefZSuHbm6n7J3dQ3r4pet
 bctGgwzfk4sTJx2/2FfcpEKhZz7xBxV1QXCh/c86jgh+WT4WKjzRs2sUYn2tg0PfXk
 XTIXpU2+lEcJmBNbh8Lz+Cxj1vW4WPRNhcaacINeyGEKhVScR0lt5qTQahEfXy55fX
 mhd1sZD9mRT8ZCmb0b4FGU7RaCrBgL9B1qeC7TsZehqR7npd4fM9iF8d0HmvPsWB3y
 7eoSxAmXvzIdDN+ReSCLqi0L5VsFsOaI63sV+iJrYBQ3mhABCU/hJqHwJ6F9uBmF1x
 Gw4NcJ/4Ra16w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AE2817E109D;
 Mon,  2 Sep 2024 17:20:51 +0200 (CEST)
Date: Mon, 2 Sep 2024 17:20:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, Grant
 Likely <grant.likely@linaro.org>, kernel@collabora.com,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: flush FW AS caches in slow reset path
Message-ID: <20240902172046.49e16ac3@collabora.com>
In-Reply-To: <6074ec45-7642-4558-83c5-4c9af7e0543d@arm.com>
References: <20240902130237.3440720-1-adrian.larumbe@collabora.com>
 <6074ec45-7642-4558-83c5-4c9af7e0543d@arm.com>
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

On Mon, 2 Sep 2024 16:11:51 +0100
Steven Price <steven.price@arm.com> wrote:

> On 02/09/2024 14:02, Adri=C3=A1n Larumbe wrote:
> > In the off-chance that waiting for the firmware to signal its booted st=
atus
> > timed out in the fast reset path, one must flush the cache lines for the
> > entire FW VM address space before reloading the regions, otherwise stale
> > values eventually lead to a scheduler job timeout.
> >=20
> > Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > Acked-by: Liviu Dudau <liviu.dudau@arm.com> =20
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>=20
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c  |  8 +++++++-
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 21 ++++++++++++++++++---
> >  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
> >  3 files changed, 26 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/pan=
thor/panthor_fw.c
> > index 857f3f11258a..ef232c0c2049 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1089,6 +1089,12 @@ int panthor_fw_post_reset(struct panthor_device =
*ptdev)
> >  		panthor_fw_stop(ptdev);
> >  		ptdev->fw->fast_reset =3D false;
> >  		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
> > +
> > +		ret =3D panthor_vm_flush_all(ptdev->fw->vm);
> > +		if (ret) {
> > +			drm_err(&ptdev->base, "FW slow reset failed (couldn't flush FW's AS=
 l2cache)");
> > +			return ret;
> > +		}
> >  	}
> > =20
> >  	/* Reload all sections, including RO ones. We're not supposed
> > @@ -1099,7 +1105,7 @@ int panthor_fw_post_reset(struct panthor_device *=
ptdev)
> > =20
> >  	ret =3D panthor_fw_start(ptdev);
> >  	if (ret) {
> > -		drm_err(&ptdev->base, "FW slow reset failed");
> > +		drm_err(&ptdev->base, "FW slow reset failed (couldn't start the FW )=
");
> >  		return ret;
> >  	}
> > =20
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> > index d47972806d50..bbc12728437f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -576,6 +576,12 @@ static int mmu_hw_do_operation_locked(struct panth=
or_device *ptdev, int as_nr,
> >  	if (as_nr < 0)
> >  		return 0;
> > =20
> > +	/*
> > +	 * If the AS number is greater than zero, then we can be sure
> > +	 * the device is up and running, so we don't need to explicitly
> > +	 * power it up
> > +	 */
> > +
> >  	if (op !=3D AS_COMMAND_UNLOCK)
> >  		lock_region(ptdev, as_nr, iova, size);
> > =20
> > @@ -874,14 +880,23 @@ static int panthor_vm_flush_range(struct panthor_=
vm *vm, u64 iova, u64 size)
> >  	if (!drm_dev_enter(&ptdev->base, &cookie))
> >  		return 0;
> > =20
> > -	/* Flush the PTs only if we're already awake */
> > -	if (pm_runtime_active(ptdev->base.dev))
> > -		ret =3D mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
> > +	ret =3D mmu_hw_do_operation(vm, iova, size, AS_COMMAND_FLUSH_PT);
> > =20
> >  	drm_dev_exit(cookie);
> >  	return ret;
> >  }
> > =20
> > +/**
> > + * panthor_vm_flush_all() - Flush L2 caches for the entirety of a VM's=
 AS
> > + * @vm: VM whose cache to flush
> > + *
> > + * Return: 0 on success, a negative error code if flush failed.
> > + */
> > +int panthor_vm_flush_all(struct panthor_vm *vm)
> > +{
> > +	return panthor_vm_flush_range(vm, vm->base.mm_start, vm->base.mm_rang=
e);
> > +}
> > +
> >  static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64=
 size)
> >  {
> >  	struct panthor_device *ptdev =3D vm->ptdev;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/pa=
nthor/panthor_mmu.h
> > index f3c1ed19f973..6788771071e3 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> > @@ -31,6 +31,7 @@ panthor_vm_get_bo_for_va(struct panthor_vm *vm, u64 v=
a, u64 *bo_offset);
> >  int panthor_vm_active(struct panthor_vm *vm);
> >  void panthor_vm_idle(struct panthor_vm *vm);
> >  int panthor_vm_as(struct panthor_vm *vm);
> > +int panthor_vm_flush_all(struct panthor_vm *vm);
> > =20
> >  struct panthor_heap_pool *
> >  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create); =20
>=20

