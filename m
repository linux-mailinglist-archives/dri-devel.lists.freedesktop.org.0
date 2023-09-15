Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7767A175F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 09:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1E010E167;
	Fri, 15 Sep 2023 07:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FF710E167
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 07:27:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1721B6607326;
 Fri, 15 Sep 2023 08:27:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694762873;
 bh=YMYjtrrkf8T9IjXqAxdfDX4QRVZqiwOsrCaZpTx70xg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ToXMSRFiOqX74YLFMRGj6dsDbWl7RvH/a5lC+ySzYZPEgPmEAxRjkn5nafDVeyFoS
 /tmOKxFF3h/4iHcLnytcSrh9Yk+nXka8vSaM7fjv+x5q9ZE7F15Rgt5XJioNHjIUc1
 gC3vrHXNDfoqRJ3h5XHw9cS+GnHCn9IyzPzSGTAUINgmJNrZx7xf0e8VxbrApbP1xy
 SO8GkscB8VV79QVdopjmWE0Ney+pUN97ptNBp8m5acEG5UateTRpHOhRuqtNKeOYFU
 +OKmaQr/Yfs80o9d9R3zWa+Cv63jc4oHlBTaN51v3B1RaPAsPUX50LjfIExOCt8OtM
 5XI/RVmAnwwZA==
Date: Fri, 15 Sep 2023 09:27:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v17 12/18] drm/shmem-helper: Prepare
 drm_gem_shmem_free() to shrinker addition
Message-ID: <20230915092750.17e88b23@collabora.com>
In-Reply-To: <20230914232721.408581-13-dmitry.osipenko@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
 <20230914232721.408581-13-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Sep 2023 02:27:15 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Prepare drm_gem_shmem_free() to addition of memory shrinker support
> to drm-shmem by adding and using variant of put_pages() that doesn't
> touch reservation lock. Reservation shouldn't be touched because lockdep
> will trigger a bogus warning about locking contention with fs_reclaim
> code paths that can't happen during the time when GEM is freed and
> lockdep doesn't know about that.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 55 +++++++++++++++++---------
>  1 file changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8a8eab4d0332..4959f51b647a 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -128,6 +128,41 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>  
> +static void
> +__drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)

Could we find more descriptive names to replace those __ prefixes?
drm_gem_shmem_free_pages(), drm_gem_shmem_drop_pages()?

> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +
> +#ifdef CONFIG_X86
> +	if (shmem->map_wc)
> +		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> +#endif
> +
> +	drm_gem_put_pages(obj, shmem->pages,
> +			  shmem->pages_mark_dirty_on_put,
> +			  shmem->pages_mark_accessed_on_put);
> +	shmem->pages = NULL;
> +}
> +
> +static void
> +__drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)

Maybe drm_gem_shmem_put_pages_no_lock_check()? But honestly, I'm not
sure we want to make it a function since it's only going to be needed in
drm_gem_shmem_free(). I think we can just inline

	if (refcount_dec_and_test(&shmem->pages_use_count))
		__drm_gem_shmem_release_pages(shmem);

there.

> +{
> +	/*
> +	 * Destroying the object is a special case.  Acquiring the obj
> +	 * lock in drm_gem_shmem_put_pages_locked() can cause a locking
> +	 * order inversion between reservation_ww_class_mutex and fs_reclaim
> +	 * when called from drm_gem_shmem_free().
> +	 *
> +	 * This deadlock is not actually possible, because no one should
> +	 * be already holding the lock when drm_gem_shmem_free() is called.
> +	 * Unfortunately lockdep is not aware of this detail.  So when the
> +	 * refcount drops to zero, make sure that the reservation lock
> +	 * isn't touched here.
> +	 */
> +	if (refcount_dec_and_test(&shmem->pages_use_count))
> +		__drm_gem_shmem_release_pages(shmem);
> +}
> +
>  /**
>   * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>   * @shmem: shmem GEM object to free
> @@ -142,8 +177,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  	if (obj->import_attach) {
>  		drm_prime_gem_destroy(obj, shmem->sgt);
>  	} else {
> -		dma_resv_lock(shmem->base.resv, NULL);
> -
>  		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
>  
>  		if (shmem->sgt) {
> @@ -153,11 +186,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  			kfree(shmem->sgt);
>  		}
>  		if (shmem->pages)
> -			drm_gem_shmem_put_pages_locked(shmem);
> +			__drm_gem_shmem_put_pages(shmem);
>  
>  		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
> -
> -		dma_resv_unlock(shmem->base.resv);
>  	}
>  
>  	drm_gem_object_release(obj);
> @@ -207,21 +238,9 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>   */
>  void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  {
> -	struct drm_gem_object *obj = &shmem->base;
> -
>  	dma_resv_assert_held(shmem->base.resv);
>  
> -	if (refcount_dec_and_test(&shmem->pages_use_count)) {
> -#ifdef CONFIG_X86
> -		if (shmem->map_wc)
> -			set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> -#endif
> -
> -		drm_gem_put_pages(obj, shmem->pages,
> -				  shmem->pages_mark_dirty_on_put,
> -				  shmem->pages_mark_accessed_on_put);
> -		shmem->pages = NULL;
> -	}
> +	__drm_gem_shmem_put_pages(shmem);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>  

