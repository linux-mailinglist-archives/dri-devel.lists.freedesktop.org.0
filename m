Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BFFA69555
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7E310E0FA;
	Wed, 19 Mar 2025 16:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="T9JsZip/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380910E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 16:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742402978;
 bh=LPfVfrg8hx/lh7QEE3SxWHepoEcZXFl7iXM7aaRLY/w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T9JsZip/+afFVovfMmo8vVTqxiOCARtWRKETM/26vqVlrqfcj0HpdMbogVO8bX6o3
 RUuctXwDD4COnelrpskMueE7VGwC9FuBgS5YsklRbGlWABTybzM9llfUccU7n1Cm2z
 Dw4AVmZ3AASBLo3P0WAE3EU/MYbmjhcxjDZHPnmfak51x7pPW4np2rCh1hCTEPY0kZ
 qnnkk7aD1aFKbsjT58/6S5+hMcmVB78sFr1SR/DPZR1bg/XvqePMd64DWPZYjQ5Vk1
 3bi/nVfdZRgZWxNXNbLyDHna6kadSEiJvpDjBwTaE5cpdEjFaV5DpO+G1nT308FocQ
 mCdAOuGlbc6oA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DE9F17E086B;
 Wed, 19 Mar 2025 17:49:38 +0100 (CET)
Date: Wed, 19 Mar 2025 17:49:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/panthor: Introduce BO labeling
Message-ID: <20250319174934.3efce6e5@collabora.com>
In-Reply-To: <20250319150953.1634322-2-adrian.larumbe@collabora.com>
References: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
 <20250319150953.1634322-2-adrian.larumbe@collabora.com>
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

On Wed, 19 Mar 2025 15:03:16 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a new character string Panthor BO field, and a function that allows
> setting it from within the driver.
>=20
> Driver takes care of freeing the string when it's replaced or no longer
> needed at object destruction time, but allocating it is the responsibility
> of callers.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h | 17 +++++++++++++++++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 8244a4e6c2a2..165c7f4eb920 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -18,6 +18,9 @@ static void panthor_gem_free_object(struct drm_gem_obje=
ct *obj)
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem =3D bo->exclusive_vm_root_gem;
> =20
> +	kfree(bo->label.str);

	/* Label might have been allocated with kstrdup_const(),
	 * we need to take that into account when freeing the memory.
	 */
	kfree_const(bo->label.str);

> +	mutex_destroy(&bo->label.lock);
> +
>  	drm_gem_free_mmap_offset(&bo->base.base);
>  	mutex_destroy(&bo->gpuva_list_lock);
>  	drm_gem_shmem_free(&bo->base);
> @@ -196,6 +199,7 @@ struct drm_gem_object *panthor_gem_create_object(stru=
ct drm_device *ddev, size_t
>  	obj->base.map_wc =3D !ptdev->coherent;
>  	mutex_init(&obj->gpuva_list_lock);
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> +	mutex_init(&obj->label.lock);
> =20
>  	return &obj->base.base;
>  }
> @@ -247,3 +251,23 @@ panthor_gem_create_with_handle(struct drm_file *file,
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
> +
> +	kfree(old_label);
> +}
> +
> +void
> +panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char=
 *label)
> +{
> +	panthor_gem_bo_set_label(bo->obj, kstrdup_const(label, GFP_KERNEL));

You ignore the OOM case. Not sure it can happen in practice, and it's
probably okay if we keep going in that case, because this is just debug
information, but maybe this should be documented here.

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

