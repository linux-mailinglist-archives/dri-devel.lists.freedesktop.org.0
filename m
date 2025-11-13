Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACEC59641
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6C10E907;
	Thu, 13 Nov 2025 18:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i0CbDAF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EA110E907;
 Thu, 13 Nov 2025 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763057523;
 bh=eggkhC6mk5737Q6dXVCr1HI04S4YU8Wm2zybbQQ4foA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i0CbDAF6pCbWEMlJpLb//tNQ6Yv1i+dHQZGVPCJnVkweoEGmlw48d5tZDmSxx333M
 nt4GoO0PyuP0bNbEwDVNY98cz438MWKbbxMjCD7dmmefRgQpXVVnQ321Rz9W4WBxr9
 hD6NU3aIKykDFuGCJs028cshFoa/0CsSJCbdMtxLP+mtf94jPIFPj5LS8mnmIvR5fB
 VrmSy0RLe/MFKL5HKfC7rc6/pcdLWGaZinio6jRZGnk50KKHbPwVoPEHabv3b9fBOs
 x+gim+uMWamOOdj/T5PsKDWrMKn3cf9SwpobDBglRpuOtLPfsW2D8s5CBr4bNlbnV2
 BuHRmPPV7+XRQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9222917E127F;
 Thu, 13 Nov 2025 19:12:02 +0100 (CET)
Date: Thu, 13 Nov 2025 19:11:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v8 07/11] drm/gem: Get rid of *_with_mnt helpers
Message-ID: <20251113191158.43328c47@fedora>
In-Reply-To: <20251113170008.79587-8-loic.molinari@collabora.com>
References: <20251113170008.79587-1-loic.molinari@collabora.com>
 <20251113170008.79587-8-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Thu, 13 Nov 2025 18:00:03 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> drm_gem_object_init_with_mnt() and drm_gem_shmem_create_with_mnt() can
> be removed now that the drivers use the new drm_gem_huge_mnt_create()
> and drm_gem_has_huge_mnt() helpers.
>=20
> v5:
> - use drm_gem_has_huge_mnt() helper
> - compile out shmem_file_setup_with_mnt() call in builds with
>   CONFIG_TRANSPARENT_HUGEPAGE=3Dn
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c              | 38 ++++++++------------------
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 38 ++++++--------------------
>  drivers/gpu/drm/v3d/v3d_bo.c           |  5 ----
>  include/drm/drm_gem.h                  |  3 --
>  include/drm/drm_gem_shmem_helper.h     |  3 --
>  5 files changed, 20 insertions(+), 67 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index bbca2ab9e9a5..1b0b5813acef 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -171,31 +171,33 @@ drm_gem_init(struct drm_device *dev)
>  }
> =20
>  /**
> - * drm_gem_object_init_with_mnt - initialize an allocated shmem-backed G=
EM
> - * object in a given shmfs mountpoint
> + * drm_gem_object_init - initialize an allocated shmem-backed GEM object
>   *
>   * @dev: drm_device the object should be initialized for
>   * @obj: drm_gem_object to initialize
>   * @size: object size
> - * @gemfs: tmpfs mount where the GEM object will be created. If NULL, use
> - * the usual tmpfs mountpoint (`shm_mnt`).
>   *
>   * Initialize an already allocated GEM object of the specified size with
> - * shmfs backing store.
> + * shmfs backing store. A huge mountpoint can be used by calling
> + * drm_gem_huge_mnt_create() beforehand.
>   */
> -int drm_gem_object_init_with_mnt(struct drm_device *dev,
> -				 struct drm_gem_object *obj, size_t size,
> -				 struct vfsmount *gemfs)
> +int drm_gem_object_init(struct drm_device *dev, struct drm_gem_object *o=
bj,
> +			size_t size)
>  {
>  	struct file *filp;
> =20
>  	drm_gem_private_object_init(dev, obj, size);
> =20
> -	if (gemfs)
> -		filp =3D shmem_file_setup_with_mnt(gemfs, "drm mm object", size,
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	if (drm_gem_has_huge_mnt(dev))
> +		filp =3D shmem_file_setup_with_mnt(dev->huge_mnt,
> +						 "drm mm object", size,
>  						 VM_NORESERVE);
>  	else
>  		filp =3D shmem_file_setup("drm mm object", size, VM_NORESERVE);
> +#else
> +	filp =3D shmem_file_setup("drm mm object", size, VM_NORESERVE);
> +#endif

I keep thinking it'd be simpler with a drm_gem_get_huge_mnt() helper:

static inline struct vfsmount *
drm_gem_get_huge_mnt(struct drm_device *dev)
{
#ifdef CONFIG_TRANSPARENT_HUGEPAGE
	return dev->huge_mnt;
#else
	return NULL;
#endif
}

so we can avoid those #ifdef CONFIG_TRANSPARENT_HUGEPAGE in a few other
places.

For this one that would give you something like:

	if (drm_gem_get_huge_mnt(dev))
		filp =3D shmem_file_setup_with_mnt(drm_gem_get_huge_mnt(dev),
						 "drm mm object", size,
						 VM_NORESERVE);
	else
		filp =3D shmem_file_setup("drm mm object", size, VM_NORESERVE);

> =20
>  	if (IS_ERR(filp))
>  		return PTR_ERR(filp);
> @@ -204,22 +206,6 @@ int drm_gem_object_init_with_mnt(struct drm_device *=
dev,
> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_gem_object_init_with_mnt);
> -
> -/**
> - * drm_gem_object_init - initialize an allocated shmem-backed GEM object
> - * @dev: drm_device the object should be initialized for
> - * @obj: drm_gem_object to initialize
> - * @size: object size
> - *
> - * Initialize an already allocated GEM object of the specified size with
> - * shmfs backing store.
> - */
> -int drm_gem_object_init(struct drm_device *dev, struct drm_gem_object *o=
bj,
> -			size_t size)
> -{
> -	return drm_gem_object_init_with_mnt(dev, obj, size, NULL);
> -}
>  EXPORT_SYMBOL(drm_gem_object_init);
> =20
>  /**
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 81f4ac7cb8f6..43a80f3fcfd9 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -50,7 +50,7 @@ static const struct drm_gem_object_funcs drm_gem_shmem_=
funcs =3D {
>  };
> =20
>  static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_s=
hmem_object *shmem,
> -				size_t size, bool private, struct vfsmount *gemfs)
> +				size_t size, bool private)
>  {
>  	struct drm_gem_object *obj =3D &shmem->base;
>  	int ret =3D 0;
> @@ -62,7 +62,7 @@ static int __drm_gem_shmem_init(struct drm_device *dev,=
 struct drm_gem_shmem_obj
>  		drm_gem_private_object_init(dev, obj, size);
>  		shmem->map_wc =3D false; /* dma-buf mappings use always writecombine */
>  	} else {
> -		ret =3D drm_gem_object_init_with_mnt(dev, obj, size, gemfs);
> +		ret =3D drm_gem_object_init(dev, obj, size);
>  	}
>  	if (ret) {
>  		drm_gem_private_object_fini(obj);
> @@ -103,13 +103,12 @@ static int __drm_gem_shmem_init(struct drm_device *=
dev, struct drm_gem_shmem_obj
>   */
>  int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obje=
ct *shmem, size_t size)
>  {
> -	return __drm_gem_shmem_init(dev, shmem, size, false, NULL);
> +	return __drm_gem_shmem_init(dev, shmem, size, false);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_init);
> =20
>  static struct drm_gem_shmem_object *
> -__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
> -		       struct vfsmount *gemfs)
> +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>  {
>  	struct drm_gem_shmem_object *shmem;
>  	struct drm_gem_object *obj;
> @@ -129,7 +128,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t=
 size, bool private,
>  		obj =3D &shmem->base;
>  	}
> =20
> -	ret =3D __drm_gem_shmem_init(dev, shmem, size, private, gemfs);
> +	ret =3D __drm_gem_shmem_init(dev, shmem, size, private);
>  	if (ret) {
>  		kfree(obj);
>  		return ERR_PTR(ret);
> @@ -150,31 +149,10 @@ __drm_gem_shmem_create(struct drm_device *dev, size=
_t size, bool private,
>   */
>  struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev=
, size_t size)
>  {
> -	return __drm_gem_shmem_create(dev, size, false, NULL);
> +	return __drm_gem_shmem_create(dev, size, false);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
> =20
> -/**
> - * drm_gem_shmem_create_with_mnt - Allocate an object with the given siz=
e in a
> - * given mountpoint
> - * @dev: DRM device
> - * @size: Size of the object to allocate
> - * @gemfs: tmpfs mount where the GEM object will be created
> - *
> - * This function creates a shmem GEM object in a given tmpfs mountpoint.
> - *
> - * Returns:
> - * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded ne=
gative
> - * error code on failure.
> - */
> -struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_de=
vice *dev,
> -							   size_t size,
> -							   struct vfsmount *gemfs)
> -{
> -	return __drm_gem_shmem_create(dev, size, false, gemfs);
> -}
> -EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
> -
>  /**
>   * drm_gem_shmem_release - Release resources associated with a shmem GEM=
 object.
>   * @shmem: shmem GEM object
> @@ -861,7 +839,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device=
 *dev,
>  	size_t size =3D PAGE_ALIGN(attach->dmabuf->size);
>  	struct drm_gem_shmem_object *shmem;
> =20
> -	shmem =3D __drm_gem_shmem_create(dev, size, true, NULL);
> +	shmem =3D __drm_gem_shmem_create(dev, size, true);
>  	if (IS_ERR(shmem))
>  		return ERR_CAST(shmem);
> =20
> @@ -909,7 +887,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_=
map(struct drm_device *dev,
> =20
>  	size =3D PAGE_ALIGN(attach->dmabuf->size);
> =20
> -	shmem =3D __drm_gem_shmem_create(dev, size, true, NULL);
> +	shmem =3D __drm_gem_shmem_create(dev, size, true);
>  	if (IS_ERR(shmem)) {
>  		ret =3D PTR_ERR(shmem);
>  		goto fail_detach;
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 3bc714ea6392..d3b68ee05dbb 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -153,12 +153,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev,=
 struct drm_file *file_priv,
>  	struct v3d_bo *bo;
>  	int ret;
> =20
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -	shmem_obj =3D drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -						  dev->huge_mnt);
> -#else
>  	shmem_obj =3D drm_gem_shmem_create(dev, unaligned_size);
> -#endif
>  	if (IS_ERR(shmem_obj))
>  		return ERR_CAST(shmem_obj);
>  	bo =3D to_v3d_bo(&shmem_obj->base);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 58fa1e6b9773..75276a12208e 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -529,9 +529,6 @@ void drm_gem_object_release(struct drm_gem_object *ob=
j);
>  void drm_gem_object_free(struct kref *kref);
>  int drm_gem_object_init(struct drm_device *dev,
>  			struct drm_gem_object *obj, size_t size);
> -int drm_gem_object_init_with_mnt(struct drm_device *dev,
> -				 struct drm_gem_object *obj, size_t size,
> -				 struct vfsmount *gemfs);
>  void drm_gem_private_object_init(struct drm_device *dev,
>  				 struct drm_gem_object *obj, size_t size);
>  void drm_gem_private_object_fini(struct drm_gem_object *obj);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shm=
em_helper.h
> index 589f7bfe7506..6b6478f5ca24 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -109,9 +109,6 @@ struct drm_gem_shmem_object {
> =20
>  int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obje=
ct *shmem, size_t size);
>  struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev=
, size_t size);
> -struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_de=
vice *dev,
> -							   size_t size,
> -							   struct vfsmount *gemfs);
>  void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
> =20

