Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A817E7B64
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 11:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C88210E982;
	Fri, 10 Nov 2023 10:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301C10E982
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 10:30:12 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 87A2B66073F9;
 Fri, 10 Nov 2023 10:30:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699612211;
 bh=fmIgRldcPaxkMOahz2iminQvGRgsI7UzfHVaQEb2Rgc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SpZSbskcGN1cd5a251hFAMouFuhn7IptHfS0olNAx8thCCPaIGZS3DMtl9V7YgXY1
 xnaI8XSzmJYUPHxXpk7KndsvqGItJXCrH/p/CikmqWVWWwAGUIWr9cr/Ahyy/iJ2H2
 wiZrQNz68fn0djNX1yEgCPbhEe7tvS4vSU+dWlk3w2IknFoPLQTzNBFZfx4YolDO4e
 +Gxy6EDyD6ngJtsMPNAX4o76Qm/5gYTrrGxVntuxT9v17SC/zpJ5XJI6TEMtr0X2id
 /Tj9PLwq574xIw7+8YqWtJm19cfQDF5cv2WHozf1uyccvoR0RQuS4kbCjEMBP284M1
 1v3KUHfjuBuow==
Date: Fri, 10 Nov 2023 11:30:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 14/26] drm/lima: Explicitly get and put drm-shmem pages
Message-ID: <20231110113007.600e72c1@collabora.com>
In-Reply-To: <20231029230205.93277-15-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-15-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:01:53 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> To simplify the drm-shmem refcnt handling, we're moving away from
> the implicit get_pages() that is used by get_pages_sgt(). From now on
> drivers will have to pin pages while they use sgt. Lima driver doesn't
> have shrinker, hence pages are pinned and sgt is valid as long as pages'
> use-count > 0.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/lima/lima_gem.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/lima/lima_gem.h |  1 +
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 988e74f67465..d255f5775dac 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -46,6 +46,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>  			return -ENOMEM;
>  		}
>  
> +		bo->put_pages = true;
>  		bo->base.pages = pages;
>  		refcount_set(&bo->base.pages_use_count, 1);
>  
> @@ -115,6 +116,7 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
>  		return PTR_ERR(shmem);
>  
>  	obj = &shmem->base;
> +	bo = to_lima_bo(obj);
>  
>  	/* Mali Utgard GPU can only support 32bit address space */
>  	mask = mapping_gfp_mask(obj->filp->f_mapping);
> @@ -123,13 +125,19 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
>  	mapping_set_gfp_mask(obj->filp->f_mapping, mask);
>  
>  	if (is_heap) {
> -		bo = to_lima_bo(obj);
>  		err = lima_heap_alloc(bo, NULL);
>  		if (err)
>  			goto out;
>  	} else {
> -		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(shmem);
> +		struct sg_table *sgt;
> +
> +		err = drm_gem_shmem_get_pages(shmem);
> +		if (err)
> +			goto out;
> +
> +		bo->put_pages = true;
>  
> +		sgt = drm_gem_shmem_get_pages_sgt(shmem);
>  		if (IS_ERR(sgt)) {
>  			err = PTR_ERR(sgt);
>  			goto out;

Pretty sure we don't need this put_pages flag. We can either check
ba->base.base.pages or refcount_read(&bo->base.pages_use_count). Or,
even better, if it's just used in the error path of the same function,
simply have a dedicated error path for that case:

	drm_gem_object_put(obj);
	return 0;

err_put_pages:
	if (!is_heap)
		drm_gem_shmem_put_pages(shmem);

err_put_bo:
	drm_gem_object_put(obj);
	return err;
}

> @@ -139,6 +147,9 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
>  	err = drm_gem_handle_create(file, obj, handle);
>  
>  out:
> +	if (err && bo->put_pages)
> +		drm_gem_shmem_put_pages(shmem);
> +
>  	/* drop reference from allocate - handle holds it now */
>  	drm_gem_object_put(obj);
>  
> @@ -152,6 +163,9 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
>  	if (!list_empty(&bo->va))
>  		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
>  
> +	if (bo->put_pages)
> +		drm_gem_shmem_put_pages(&bo->base);

This one can be replaced by

	if (!is_heap || bo->base.base.pages)
		drm_gem_shmem_put_pages(&bo->base);

> +
>  	drm_gem_shmem_free(&bo->base);
>  }
>  
> diff --git a/drivers/gpu/drm/lima/lima_gem.h b/drivers/gpu/drm/lima/lima_gem.h
> index ccea06142f4b..dc5a6d465c80 100644
> --- a/drivers/gpu/drm/lima/lima_gem.h
> +++ b/drivers/gpu/drm/lima/lima_gem.h
> @@ -16,6 +16,7 @@ struct lima_bo {
>  	struct list_head va;
>  
>  	size_t heap_size;
> +	bool put_pages;
>  };
>  
>  static inline struct lima_bo *

