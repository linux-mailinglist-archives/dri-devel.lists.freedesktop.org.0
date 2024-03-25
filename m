Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3B889CAB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C774010E7B1;
	Mon, 25 Mar 2024 11:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZoQmEWsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1D210E7BC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711365889;
 bh=4XSgkF3eFAulLNHCMSnEG6EDJd7Ij4mYOggsH9A/JC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZoQmEWsh2JwlKvpB/RqH3zYu0xo3bhmmkim+Mo2VhCIat//WaWfMYHwSfJuip4zL+
 +d9m9k5qNkCMZ8+ihChl6ELXXCwQh6dmg3kG4BxM6L1c98AV64d1rT7r4LZhlsgzpE
 +tPTIVC/l/vBSF3x5VQWAKNPz63XmoCUQkJ2k0tSHeZwskDNC3hmWXRpJKhrOglVC8
 My9QBsZgb+9KMP6bLY/xEhIM0jnWBcL1A2dOwBKNtHETZwpNK1tqHE+GE5G3lhiN2Q
 pgdCarxOvvjtpYUMvK0YllQWYdAQGA75cUK8vZ7HJjfQu4btxWmaDQlgTfTaLufjia
 7yM0svsrlnA2w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D65F23780626;
 Mon, 25 Mar 2024 11:24:48 +0000 (UTC)
Date: Mon, 25 Mar 2024 12:24:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, "Lukas F . Hartmann" <lukas@mntmn.com>
Subject: Re: [PATCH 1/2] drm/panthor: Fix IO-page mmap() for 32-bit
 userspace on 64-bit kernel
Message-ID: <20240325122447.172bf3f3@collabora.com>
In-Reply-To: <12e77fa0-ba68-4e6f-8683-69c29b2495f2@arm.com>
References: <20240325104111.3553712-1-boris.brezillon@collabora.com>
 <12e77fa0-ba68-4e6f-8683-69c29b2495f2@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 25 Mar 2024 11:12:40 +0000
Steven Price <steven.price@arm.com> wrote:

> On 25/03/2024 10:41, Boris Brezillon wrote:
> > When mapping an IO region, the pseudo-file offset is dependent on the
> > userspace architecture. panthor_device_mmio_offset() abstract that away
> > for us by turning a userspace MMIO offset into its kernel equivalent,
> > but we were not updating vm_area_struct::vm_pgoff accordingly, leading
> > us to attach the MMIO region to the wrong file offset.
> >=20
> > This has implications when we start mixing 64 bit and 32 bit apps, but
> > that's only really a problem when we start having more that 2^43 bytes =
of
> > memory allocated, which is very unlikely to happen.
> >=20
> > What's more problematic is the fact this turns our
> > unmap_mapping_range(DRM_PANTHOR_USER_MMIO_OFFSET) calls, which are
> > supposed to kill the MMIO mapping when entering suspend, into NOPs.
> > Which means we either keep the dummy flush_id mapping active at all
> > times, or we risk a BUS_FAULT if the MMIO region was mapped, and the
> > GPU is suspended after that.
> >=20
> > Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> > Reported-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > Reported-by: Lukas F. Hartmann <lukas@mntmn.com>
> > Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10835
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
>=20
> Pesky 32 bit again ;)
>=20
> Looks fine, although I'm wondering whether you'd consider squashing
> something like the below on top? I think it helps contain the 32 bit
> specific code to the one place.

I like that. I'll steal your changes for v2 and update the commit
message to reflect the fact we no longer need this
panthor_device_mmio_offset() helper.

> Either way:
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
> ---
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index f7f8184b1992..75276cbeba20 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -392,7 +392,7 @@ static const struct vm_operations_struct panthor_mmio=
_vm_ops =3D {
> =20
>  int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_=
struct *vma)
>  {
> -	u64 offset =3D panthor_device_mmio_offset((u64)vma->vm_pgoff << PAGE_SH=
IFT);
> +	u64 offset =3D (u64)vma->vm_pgoff << PAGE_SHIFT;
> =20
>  	switch (offset) {
>  	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
> @@ -406,9 +406,6 @@ int panthor_device_mmap_io(struct panthor_device *ptd=
ev, struct vm_area_struct *
>  		return -EINVAL;
>  	}
> =20
> -	/* Adjust vm_pgoff for 32-bit userspace on 64-bit kernel. */
> -	vma->vm_pgoff =3D offset >> PAGE_SHIFT;
> -
>  	/* Defer actual mapping to the fault handler. */
>  	vma->vm_private_data =3D ptdev;
>  	vma->vm_ops =3D &panthor_mmio_vm_ops;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 8e2922c79aca..99ad576912b3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -373,30 +373,6 @@ static int panthor_request_ ## __name ## _irq(struct=
 panthor_device *ptdev,			\
>  					 pirq);							\
>  }
> =20
> -/**
> - * panthor_device_mmio_offset() - Turn a user MMIO offset into a kernel =
one
> - * @offset: Offset to convert.
> - *
> - * With 32-bit systems being limited by the 32-bit representation of mma=
p2's
> - * pgoffset field, we need to make the MMIO offset arch specific. This f=
unction
> - * converts a user MMIO offset into something the kernel driver understa=
nds.
> - *
> - * If the kernel and userspace architecture match, the offset is unchang=
ed. If
> - * the kernel is 64-bit and userspace is 32-bit, the offset is adjusted =
to match
> - * 64-bit offsets. 32-bit kernel with 64-bit userspace is impossible.
> - *
> - * Return: Adjusted offset.
> - */
> -static inline u64 panthor_device_mmio_offset(u64 offset)
> -{
> -#ifdef CONFIG_ARM64
> -	if (test_tsk_thread_flag(current, TIF_32BIT))
> -		offset +=3D DRM_PANTHOR_USER_MMIO_OFFSET_64BIT - DRM_PANTHOR_USER_MMIO=
_OFFSET_32BIT;
> -#endif
> -
> -	return offset;
> -}
> -
>  extern struct workqueue_struct *panthor_cleanup_wq;
> =20
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 11b3ccd58f85..730dd0c69cb8 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1327,7 +1327,22 @@ static int panthor_mmap(struct file *filp, struct =
vm_area_struct *vma)
>  	if (!drm_dev_enter(file->minor->dev, &cookie))
>  		return -ENODEV;
> =20
> -	if (panthor_device_mmio_offset(offset) >=3D DRM_PANTHOR_USER_MMIO_OFFSE=
T)
> +#ifdef CONFIG_ARM64
> +	/*
> +	 * With 32-bit systems being limited by the 32-bit representation of
> +	 * mmap2's pgoffset field, we need to make the MMIO offset arch
> +	 * specific. This converts a user MMIO offset into something the kernel
> +	 * driver understands.
> +	 */
> +	if (test_tsk_thread_flag(current, TIF_32BIT) &&
> +	    offset >=3D DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
> +		offset +=3D DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
> +			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
> +		vma->vm_pgoff =3D offset >> PAGE_SHIFT;
> +	}
> +#endif
> +
> +	if (offset >=3D DRM_PANTHOR_USER_MMIO_OFFSET)
>  		ret =3D panthor_device_mmap_io(ptdev, vma);
>  	else
>  		ret =3D drm_gem_mmap(filp, vma);
>=20

