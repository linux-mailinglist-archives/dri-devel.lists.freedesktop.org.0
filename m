Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6013773DB91
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 11:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F9E10E1E2;
	Mon, 26 Jun 2023 09:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67E10E1CC;
 Mon, 26 Jun 2023 09:40:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EAF59660710F;
 Mon, 26 Jun 2023 10:40:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687772418;
 bh=nrhR8oq2efpkrpJAJZoiEhcI2s3TuRKvjkM4txfnivA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RE40B/BKGYWRgmT2p5cXPbnaGINdFGsssda3ob0DpmbfJCSTTyuz9mCbatF9Dc9hJ
 bJ2n9Mx/+GNqXQa5ZwqgYNdE3tNjXHIOjfz3lK3lgZ86xE0peje8c0NtBke4fefm5G
 j2kKocSrtjvSmF5uZebPKA71KkAAtDQR1eYZuD1/t2sg+ysFEQusImuLjMFI7vRRHK
 u3AvocNF6F3GeDm7rFzxIUDIz2TNCfU8OxnPxEHmZoaGO+w97ief4Zb4Z+GqcgNYXN
 3ulORtyxiypa+SY+ZNAtytfqQ5S1GUYiY6Jc85Hy/KB+c0yOaoxuPuzRoszNYaw3da
 0n29csgLj575g==
Date: Mon, 26 Jun 2023 11:40:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 6/6] drm/shmem-helper: Switch to reservation lock
Message-ID: <20230626114014.2c837255@collabora.com>
In-Reply-To: <20230529223935.2672495-7-dmitry.osipenko@collabora.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
 <20230529223935.2672495-7-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, 30 May 2023 01:39:35 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Replace all drm-shmem locks with a GEM reservation lock. This makes locks
> consistent with dma-buf locking convention where importers are responsible
> for holding reservation lock for all operations performed over dma-bufs,
> preventing deadlock between dma-buf importers and exporters.

I've rebased some of my work on drm-misc-next this morning and noticed
that the drm_gem_shmem_get_pages() I was using to pin pages no longer
exists, so I ended looking at this patch to check what I should use
instead, and I have a few questions/comments.

> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 210 ++++++++----------
>  drivers/gpu/drm/lima/lima_gem.c               |   8 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   7 +-
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   6 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  19 +-
>  include/drm/drm_gem_shmem_helper.h            |  14 +-
>  6 files changed, 116 insertions(+), 148 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 4ea6507a77e5..a783d2245599 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -88,8 +88,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>  	if (ret)
>  		goto err_release;
>  
> -	mutex_init(&shmem->pages_lock);
> -	mutex_init(&shmem->vmap_lock);
>  	INIT_LIST_HEAD(&shmem->madv_list);
>  
>  	if (!private) {
> @@ -141,11 +139,13 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  
> -	drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> -
>  	if (obj->import_attach) {
>  		drm_prime_gem_destroy(obj, shmem->sgt);
>  	} else {
> +		dma_resv_lock(shmem->base.resv, NULL);
> +
> +		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> +
>  		if (shmem->sgt) {
>  			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
>  					  DMA_BIDIRECTIONAL, 0);
> @@ -154,22 +154,24 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  		}
>  		if (shmem->pages)
>  			drm_gem_shmem_put_pages(shmem);
> -	}
>  
> -	drm_WARN_ON(obj->dev, shmem->pages_use_count);
> +		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> +
> +		dma_resv_unlock(shmem->base.resv);
> +	}
>  
>  	drm_gem_object_release(obj);
> -	mutex_destroy(&shmem->pages_lock);
> -	mutex_destroy(&shmem->vmap_lock);
>  	kfree(shmem);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
>  
> -static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)

I find this name change confusing, because the function requires the
GEM resv lock to be held, and the _locked suffix was making it pretty
clear.

>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct page **pages;
>  
> +	dma_resv_assert_held(shmem->base.resv);
> +
>  	if (shmem->pages_use_count++ > 0)
>  		return 0;
>  
> @@ -197,35 +199,16 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>  }
>  
>  /*
> - * drm_gem_shmem_get_pages - Allocate backing pages for a shmem GEM object
> + * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
>   * @shmem: shmem GEM object
>   *
> - * This function makes sure that backing pages exists for the shmem GEM object
> - * and increases the use count.
> - *
> - * Returns:
> - * 0 on success or a negative error code on failure.
> + * This function decreases the use count and puts the backing pages when use drops to zero.
>   */
> -int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)

Same comment about the name change. That's even more confusing since
this function was previously taking care of the locking. Also not sure
why you'd want to expose this _put() helper when the _get() helper is
private.

>  {
>  	struct drm_gem_object *obj = &shmem->base;
> -	int ret;
>  
> -	drm_WARN_ON(obj->dev, obj->import_attach);
> -
> -	ret = mutex_lock_interruptible(&shmem->pages_lock);
> -	if (ret)
> -		return ret;
> -	ret = drm_gem_shmem_get_pages_locked(shmem);
> -	mutex_unlock(&shmem->pages_lock);
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(drm_gem_shmem_get_pages);
> -
> -static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
> -{
> -	struct drm_gem_object *obj = &shmem->base;
> +	dma_resv_assert_held(shmem->base.resv);
>  
>  	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
>  		return;
> @@ -243,20 +226,25 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  			  shmem->pages_mark_accessed_on_put);
>  	shmem->pages = NULL;
>  }
> +EXPORT_SYMBOL(drm_gem_shmem_put_pages);
>  
> -/*
> - * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
> - * @shmem: shmem GEM object
> - *
> - * This function decreases the use count and puts the backing pages when use drops to zero.
> - */
> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
> -	mutex_lock(&shmem->pages_lock);
> -	drm_gem_shmem_put_pages_locked(shmem);
> -	mutex_unlock(&shmem->pages_lock);
> +	int ret;
> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	ret = drm_gem_shmem_get_pages(shmem);
> +
> +	return ret;
> +}
> +
> +static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	drm_gem_shmem_put_pages(shmem);
>  }
> -EXPORT_SYMBOL(drm_gem_shmem_put_pages);
>  
>  /**
>   * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
> @@ -271,10 +259,17 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
>  int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
> +	int ret;
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> -	return drm_gem_shmem_get_pages(shmem);
> +	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
> +	if (ret)
> +		return ret;

I think here is the major problem I have with this patch: you've made
drm_gem_shmem_{get_pages,pin}() private, which forces me to call
drm_gem_shmem_pin() in a path where I already acquired the resv lock
(using the drm_exec infra proposed by Christian). That would
probably work if you were letting ret == -EALREADY go through, but I'm
wondering if it wouldn't be preferable to expose
drm_gem_shmem_pin_locked().

> +	ret = drm_gem_shmem_pin_locked(shmem);
> +	dma_resv_unlock(shmem->base.resv);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_pin);
>  
> @@ -291,12 +286,29 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> -	drm_gem_shmem_put_pages(shmem);
> +	dma_resv_lock(shmem->base.resv, NULL);
> +	drm_gem_shmem_unpin_locked(shmem);
> +	dma_resv_unlock(shmem->base.resv);
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_unpin);

If we want to be consistent, let's just expose drm_gem_shmem_unpin()
and drm_gem_shmem_pin() and keep drm_gem_shmem_{get,put}_pages()
private, or even better, rename them drm_gem_shmem_{pin,unpin}_locked()
insert of having drm_gem_shmem_{pin,unpin}_locked() wrappers that just
forward the call to drm_gem_shmem_{get,put}_pages().

>  
> -static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
> -				     struct iosys_map *map)
> +/*
> + * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
> + * @shmem: shmem GEM object
> + * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
> + *       store.
> + *
> + * This function makes sure that a contiguous kernel virtual address mapping
> + * exists for the buffer backing the shmem GEM object. It hides the differences
> + * between dma-buf imported and natively allocated objects.
> + *
> + * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
> +		       struct iosys_map *map)

Same problem with this renaming: it's confusing because this function
was previously taking care of the locking, and it's no longer the case.
That's actually true for other public functions your patching, but I
won't go over all of them.

I know this patch has been under discussion for quite some time, and has
been validated by other devs/maintainers, but I'd like to understand the
reasoning behind these decisions. Not the decision to replace all locks
by dma_resv, which I kinda understand, but the decision to change the
behavior of functions without making the name reflect the new behavior
(_locked prefix), or the fact we now prohibit some functions to
succeed when the dma_resv lock is taken by the driver beforehand (which,
unless I'm mistaken, will happen in the VM_BIND logic, and can happen
in the SUBMIT ioctl too depending on the driver).

Regards,

Boris

