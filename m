Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E09A81EE3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 09:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3630E10E7F4;
	Wed,  9 Apr 2025 07:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Co6A1xRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B5110E7F4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 07:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744185519;
 bh=9OwpPAtClWlMtvf7MBL7jZcCqTq/xq396C20+WSwSiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Co6A1xRc5EeDeCYxUJxoeDF7OvCXTJE8jR5NmyLXNsxcK/4jcQWyiw2U6qPWyA3O8
 oVM3rl4XvAC64CpjNWDvYkuBYbHpyzsoZ4mVVYmcH6lidEY1Ft/GrgOYV84eF81ecc
 uKxjcXYUxzFcZ6Sm8wknkihjfdMk3ZXavwXA4djPt9KUlrgTUiIrwZlTQJL9PkxgFV
 XDUGVYgOV7oEjtweqBShsUwRvi7+afCwuzAJRYz8HZdrE8REsq9g3XoFR9LmIBz+7Z
 NUn29bkh7kHv2fFEHcjFaq6WO5NyhsSQCZWWKwwfgWbwz2jmTu95YChU1g6J+1GhO0
 tRit6wYXyLyhw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AB4917E0809;
 Wed,  9 Apr 2025 09:58:38 +0200 (CEST)
Date: Wed, 9 Apr 2025 09:58:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/4] drm/panthor: Introduce BO labeling
Message-ID: <20250409095834.3d6a6206@collabora.com>
In-Reply-To: <20250408222427.1214330-2-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
 <20250408222427.1214330-2-adrian.larumbe@collabora.com>
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

On Tue,  8 Apr 2025 23:24:21 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a new character string Panthor BO field, and a function that allows
> setting it from within the driver.
>=20
> Driver takes care of freeing the string when it's replaced or no longer
> needed at object destruction time, but allocating it is the responsibility
> of callers.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

One minor thing below, but this looks good otherwise

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 38 +++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 17 ++++++++++++
>  2 files changed, 55 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 8244a4e6c2a2..7d017f9d1d52 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -18,6 +18,14 @@ static void panthor_gem_free_object(struct drm_gem_obj=
ect *obj)
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem =3D bo->exclusive_vm_root_gem;
> =20
> +	/*
> +	 * Label might have been allocated with kstrdup_const(),
> +	 * we need to take that into account when freeing the memory
> +	 */
> +	kfree_const(bo->label.str);
> +
> +	mutex_destroy(&bo->label.lock);
> +
>  	drm_gem_free_mmap_offset(&bo->base.base);
>  	mutex_destroy(&bo->gpuva_list_lock);
>  	drm_gem_shmem_free(&bo->base);
> @@ -196,6 +204,7 @@ struct drm_gem_object *panthor_gem_create_object(stru=
ct drm_device *ddev, size_t
>  	obj->base.map_wc =3D !ptdev->coherent;
>  	mutex_init(&obj->gpuva_list_lock);
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> +	mutex_init(&obj->label.lock);
> =20
>  	return &obj->base.base;
>  }
> @@ -247,3 +256,32 @@ panthor_gem_create_with_handle(struct drm_file *file,
> =20
>  	return ret;
>  }
> +
> +void
> +panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label)
> +{
> +	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +	const char *old_label;
> +
> +	mutex_lock(&bo->label.lock);
> +	old_label =3D bo->label.str;
> +	bo->label.str =3D label;
> +	mutex_unlock(&bo->label.lock);

Since you started using scoped_guard, maybe use it here too:

	scoped_guard(mutex, &bo->label.lock) {
		old_label =3D bo->label.str;
		bo->label.str =3D label;
	}

> +
> +	kfree(old_label);
> +}
> +
> +void
> +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char=
 *label)
> +{
> +	const char *str;
> +
> +	str =3D kstrdup_const(label, GFP_KERNEL);
> +	if (!str) {
> +		/* Failing to allocate memory for a label isn't a fatal condition */
> +		drm_warn(bo->obj->dev, "Not enough memory to allocate BO label");
> +		return;
> +	}
> +
> +	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 5749ef2ebe03..0582826b341a 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -46,6 +46,20 @@ struct panthor_gem_object {
> =20
>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>  	u32 flags;
> +
> +	/**
> +	 * @label: BO tagging fields. The label can be assigned within the
> +	 * driver itself or through a specific IOCTL.
> +	 */
> +	struct {
> +		/**
> +		 * @label.str: Pointer to NULL-terminated string,
> +		 */
> +		const char *str;
> +
> +		/** @lock.str: Protects access to the @label.str field. */
> +		struct mutex lock;
> +	} label;
>  };
> =20
>  /**
> @@ -91,6 +105,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  			       struct panthor_vm *exclusive_vm,
>  			       u64 *size, u32 flags, uint32_t *handle);
> =20
> +void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *la=
bel);
> +void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const=
 char *label);
> +
>  static inline u64
>  panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
>  {

