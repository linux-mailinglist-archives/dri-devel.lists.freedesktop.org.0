Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226A7920C8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F71D10E440;
	Tue,  5 Sep 2023 07:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCAD10E440
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:40:55 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C2B766028F5;
 Tue,  5 Sep 2023 08:40:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693899653;
 bh=MMtwZSS4hAHlzfbMlS/VKZ1O76qe9W6PnspTivVDuWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B3JctmSNqpV709VZaf7ywJ4+xd8I1iG3MdkG/7wYLuviVhmz2Ld6WaW645AkFHWYO
 PoEaUo35CD3y/VtNQ8a5cwMwd5BSG7vd2CNXFm8lm+7tU76jnCVCaX6qkYZpuibrgF
 X9tRnaYw/FlTpG3RTzlj3zJTFXk/vmfbGXrDewUpe3Kj5mSgG0wlkdjm6WYKLTsuKL
 eozOt/j1Xp03SoctIPp0bxjsgoAWe/BZQwoG6ktXRyzVLpZjuEfW1qcR9Q66bubC2r
 fJi1Cu580Rq57DNjkSCmPEnPDiZMYTHJVcNDKMIQIVC9HHBbqEYMv81hsigui2Pllj
 2+EM0ZZ+oYyLg==
Date: Tue, 5 Sep 2023 09:40:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 02/20] drm/shmem-helper: Use flag for tracking page
 count bumped by get_pages_sgt()
Message-ID: <20230905094050.3c918a43@collabora.com>
In-Reply-To: <20230903170736.513347-3-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-3-dmitry.osipenko@collabora.com>
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

On Sun,  3 Sep 2023 20:07:18 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Use separate flag for tracking page count bumped by shmem->sgt to avoid
> imbalanced page counter during of drm_gem_shmem_free() time. It's fragile
> to assume that populated shmem->pages at a freeing time means that the
> count was bumped by drm_gem_shmem_get_pages_sgt(), using a flag removes
> the ambiguity.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 11 ++++++++++-
>  drivers/gpu/drm/lima/lima_gem.c        |  1 +
>  include/drm/drm_gem_shmem_helper.h     |  7 +++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 6693d4061ca1..848435e08eb2 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -152,8 +152,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  			sg_free_table(shmem->sgt);
>  			kfree(shmem->sgt);
>  		}
> -		if (shmem->pages)
> +		if (shmem->pages) {
>  			drm_gem_shmem_put_pages(shmem);
> +			drm_WARN_ON(obj->dev, !shmem->got_pages_sgt);
> +		}

Already mentioned in v15, but I keep thinking the following:

		if (shmem->sgt) {
			// existing code in the preceding
			// if (shmem->sgt) branch
			...

			/*
			 * Release the implicit pages ref taken in
			 * drm_gem_shmem_get_pages_sgt_locked().
			 */
			drm_gem_shmem_put_pages(shmem);
		}

does exactly the same without requiring the addition of a new field.

>  
>  		drm_WARN_ON(obj->dev, shmem->pages_use_count);
>  
> @@ -693,6 +695,13 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  	if (ret)
>  		goto err_free_sgt;
>  
> +	/*
> +	 * This flag prevents imbalanced pages_use_count during
> +	 * drm_gem_shmem_free(), where pages_use_count=1 only if
> +	 * drm_gem_shmem_get_pages_sgt() was used by a driver.
> +	 */
> +	shmem->got_pages_sgt = true;
> +
>  	shmem->sgt = sgt;
>  
>  	return sgt;
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 4f9736e5f929..67c39b95e30e 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -48,6 +48,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>  
>  		bo->base.pages = pages;
>  		bo->base.pages_use_count = 1;
> +		bo->base.got_pages_sgt = true;
>  
>  		mapping_set_unevictable(mapping);
>  	}
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index ec70a98a8fe1..a53c0874b3c4 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -73,6 +73,13 @@ struct drm_gem_shmem_object {
>  	 */
>  	unsigned int vmap_use_count;
>  
> +	/**
> +	 * @got_pages_sgt:
> +	 *
> +	 * True if SG table was retrieved using drm_gem_shmem_get_pages_sgt()
> +	 */
> +	bool got_pages_sgt : 1;
> +
>  	/**
>  	 * @imported_sgt:
>  	 *

