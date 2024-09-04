Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D60A96B3D1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D79110E6B7;
	Wed,  4 Sep 2024 08:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DBSpLNHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F5210E6B7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725436984;
 bh=EvtTAN43MF9IJtI4LMQlHahxmGI3fTgZDyA4IWKhy9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DBSpLNHT8iipmirt/a9Ck4pTN1x4XZzXXYCt8DjWp0BrztNv4xfbG7UuZj95liHRF
 eA+TO50zntwE9XORnLAeD/scs+YIZERvIAcFM0r4XPgflBwuF+QVYfcqhB3ggcx9mp
 ZC9tQnNZ3TWSABLgAR8wfa3Sxt4m/fLor+xcnMbCRi3h8N5l64NMREwBrvER7ddbbv
 UmGb99MCSfeAiHHHnOSfBY7Yqt3uD7q7L9D4lhWck2BMmbDODyydhRUo1kl1RVvSgy
 46fjKRmuT++9dlVXdL9+mo5h2hoUOIG/c7k5wCYCf1ZY8FF2sPKJyhPqq9BdtKsjMA
 GfTJbCGANc4DA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7711717E0F95;
 Wed,  4 Sep 2024 10:03:03 +0200 (CEST)
Date: Wed, 4 Sep 2024 10:03:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 3/4] drm/panthor: enable fdinfo for memory stats
Message-ID: <20240904100300.40ea245d@collabora.com>
In-Reply-To: <20240903202541.430225-4-adrian.larumbe@collabora.com>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
 <20240903202541.430225-4-adrian.larumbe@collabora.com>
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

On Tue,  3 Sep 2024 21:25:37 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Implement drm object's status callback.
>=20
> Also, we consider a PRIME imported BO to be resident if its matching
> dma_buf has an open attachment, which means its backing storage had alrea=
dy
> been allocated.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 38f560864879..c60b599665d8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -145,6 +145,17 @@ panthor_gem_prime_export(struct drm_gem_object *obj,=
 int flags)
>  	return drm_gem_prime_export(obj, flags);
>  }
> =20
> +static enum drm_gem_object_status panthor_gem_status(struct drm_gem_obje=
ct *obj)
> +{
> +	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +	enum drm_gem_object_status res =3D 0;
> +
> +	if (bo->base.base.import_attach || bo->base.pages)
> +		res |=3D DRM_GEM_OBJECT_RESIDENT;
> +
> +	return res;
> +}
> +
>  static const struct drm_gem_object_funcs panthor_gem_funcs =3D {
>  	.free =3D panthor_gem_free_object,
>  	.print_info =3D drm_gem_shmem_object_print_info,
> @@ -154,6 +165,7 @@ static const struct drm_gem_object_funcs panthor_gem_=
funcs =3D {
>  	.vmap =3D drm_gem_shmem_object_vmap,
>  	.vunmap =3D drm_gem_shmem_object_vunmap,
>  	.mmap =3D panthor_gem_mmap,
> +	.status =3D panthor_gem_status,
>  	.export =3D panthor_gem_prime_export,
>  	.vm_ops =3D &drm_gem_shmem_vm_ops,
>  };

