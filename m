Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74039A695A9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 18:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A38B10E556;
	Wed, 19 Mar 2025 17:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hJgFV9uS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9A610E556
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742403620;
 bh=bBeAhJfRgT/3NLto0EFsbmzhcgqyruiEHRojJ8OA0WA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hJgFV9uSrOdod34Ui0hcOHZOxhPCgtwC1344CZM8GfBQ6J+5a7qatroJkC360DEBf
 QURTCD+/hG8GYVEYEa0PNPhQDqdHXcCaqmC7R6IX4bV904NSOlnx7Hwvyz+Y7mndtJ
 9xempKeH7ZkImGdW7kEapDiF8WYRaLU3Lu9dliD7Whb8W2oMtSBVpiHRx9BkR5zvne
 k36fPIiACBCS+EwW7+1WSvK4O1II6zZayWvcky5wHgb8Hq9dj/7/iZors5+VCghX1Y
 ySPEADOrw6lejK60ysKEZh2IklRyDcs/2mUojasRVoB2A/FN5yVCqFNaqdxpMHaEWw
 QHiYra9GUVKvw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A8DD17E0385;
 Wed, 19 Mar 2025 18:00:20 +0100 (CET)
Date: Wed, 19 Mar 2025 18:00:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panthor: Display heap chunk entries in
 DebugFS GEMS file
Message-ID: <20250319180013.4d0165c1@collabora.com>
In-Reply-To: <20250319150953.1634322-5-adrian.larumbe@collabora.com>
References: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
 <20250319150953.1634322-5-adrian.larumbe@collabora.com>
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

On Wed, 19 Mar 2025 15:03:19 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Expand the driver's DebugFS GEMS file to display entries for the heap
> chunks' GEM objects, both those allocated at heap creation time through an
> ioctl(), or in response to a tiler OOM event.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c  | 22 +++++++++++-----------
>  drivers/gpu/drm/panthor/panthor_gem.h  |  2 ++
>  drivers/gpu/drm/panthor/panthor_heap.c |  3 +++
>  3 files changed, 16 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index f7eb413d88e7..252979473fdf 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -22,16 +22,6 @@ static void panthor_gem_debugfs_bo_init(struct panthor=
_gem_object *bo)
>  	get_task_comm(bo->gems.creator.process_name, current->group_leader);
>  }
> =20
> -static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> -{
> -	struct panthor_device *ptdev =3D  container_of(bo->base.base.dev,
> -						     struct panthor_device, base);
> -
> -	mutex_lock(&ptdev->gems.lock);
> -	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> -	mutex_unlock(&ptdev->gems.lock);
> -}
> -
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
>  {
>  	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> @@ -44,10 +34,20 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_=
gem_object *bo)
>  	list_del_init(&bo->gems.node);
>  	mutex_unlock(&ptdev->gems.lock);
>  }
> +
> +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev =3D  container_of(bo->base.base.dev,
> +						     struct panthor_device, base);
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
>  #else
>  static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> -static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}

Let's just define all these helpers as inline functions in
panthor_gem.h in patch 3.

>  #endif
> =20
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 7c896ec35801..e132f14bbef8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -132,6 +132,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *la=
bel);
>  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const=
 char *label);
> =20
> +void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo);
> +
>  static inline u64
>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>  {
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/pan=
thor/panthor_heap.c
> index db0285ce5812..73cf43eb4a7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -180,6 +180,9 @@ static int panthor_alloc_heap_chunk(struct panthor_de=
vice *ptdev,
>  	heap->chunk_count++;
>  	mutex_unlock(&heap->lock);
> =20
> +	panthor_gem_kernel_bo_set_label(chunk->bo, "\"Tiler heap chunk\"");
> +	panthor_gem_debugfs_bo_add(to_panthor_bo(chunk->bo->obj));

I'd be tempted to label all the kernel BOs, not just the heap chunks,
and if we do that, we're probably better off changing the
kernel_bo_create() prototype to pass a label.

> +
>  	return 0;
> =20
>  err_destroy_bo:

