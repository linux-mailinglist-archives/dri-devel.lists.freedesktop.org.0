Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F77920A1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839D010E437;
	Tue,  5 Sep 2023 07:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CD110E437
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:00:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 365506607186;
 Tue,  5 Sep 2023 08:00:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693897245;
 bh=gjw9UsrNPHk8NsvI3Oc7dZ/ykpTFR6C89yjJF8x2PtY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TklyJm3Xf4ziPLu+DDAeO6JEJmBgfqyHvJ3IgIdNCNGQv4gZclrLe1Uqf/rxjVoBv
 izkDBxZiWCQ0kbdLKfj0hr0devreAViZeeO6JkzAc60n0zyAknpFIAgiw5WqyFxZX5
 U51hQm6g27B2PCJob8hjEt961QmwOgv19nzTYTJFEIOsDdgD2+YDGHGVtqmvBfNMAm
 Z03ZmBN5CpD4Gwo473BeQ6ZeaKZb7J84L9J69tqZfzhXd0WF1C6wtw1yO3OTjipAoo
 kvMBWVI+LvSeLys/WWYmV5fbDB1XibBuug8mdgZ8IlF61ss9wke8n2JhdVd9VjYb8H
 gQcTWAKR2VZCw==
Date: Tue, 5 Sep 2023 09:00:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 13/20] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
Message-ID: <20230905090042.3a7b7557@collabora.com>
In-Reply-To: <20230903170736.513347-14-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-14-dmitry.osipenko@collabora.com>
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

On Sun,  3 Sep 2023 20:07:29 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> The vmapped pages shall be pinned in memory and previously get/put_pages()
> were implicitly hard-pinning/unpinning the pages. This will no longer be
> the case with addition of memory shrinker because pages_use_count > 0 won't
> determine anymore whether pages are hard-pinned (they will be soft-pinned),
> while the new pages_pin_count will do the hard-pinning. Switch the
> vmap/vunmap() to use pin/unpin() functions in a preparation of addition
> of the memory shrinker support to drm-shmem.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 ++++++++++++-------
>  include/drm/drm_gem_shmem_helper.h     |  2 +-
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d93ebfef20c7..899f655a65bb 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -257,6 +257,14 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  	return ret;
>  }
>  
> +static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> +{
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	if (refcount_dec_and_test(&shmem->pages_pin_count))
> +		drm_gem_shmem_put_pages_locked(shmem);
> +}
> +
>  /**
>   * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
>   * @shmem: shmem GEM object
> @@ -304,10 +312,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>  		return;
>  
>  	dma_resv_lock(shmem->base.resv, NULL);
> -
> -	if (refcount_dec_and_test(&shmem->pages_pin_count))
> -		drm_gem_shmem_put_pages_locked(shmem);
> -
> +	drm_gem_shmem_unpin_locked(shmem);
>  	dma_resv_unlock(shmem->base.resv);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
> @@ -345,7 +350,7 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  			return 0;
>  		}
>  
> -		ret = drm_gem_shmem_get_pages_locked(shmem);
> +		ret = drm_gem_shmem_pin_locked(shmem);
>  		if (ret)
>  			goto err_zero_use;
>  
> @@ -368,7 +373,7 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  
>  err_put_pages:
>  	if (!obj->import_attach)
> -		drm_gem_shmem_put_pages_locked(shmem);
> +		drm_gem_shmem_unpin_locked(shmem);
>  err_zero_use:
>  	shmem->vmap_use_count = 0;
>  
> @@ -405,7 +410,7 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  			return;
>  
>  		vunmap(shmem->vaddr);
> -		drm_gem_shmem_put_pages_locked(shmem);
> +		drm_gem_shmem_unpin_locked(shmem);
>  	}
>  
>  	shmem->vaddr = NULL;
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index bd545428a7ee..396958a98c34 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -137,7 +137,7 @@ int drm_gem_shmem_madvise_locked(struct drm_gem_shmem_object *shmem, int madv);
>  static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem)
>  {
>  	return (shmem->madv > 0) &&
> -		!shmem->vmap_use_count && shmem->sgt &&
> +		!refcount_read(&shmem->pages_pin_count) && shmem->sgt &&
>  		!shmem->base.dma_buf && !shmem->base.import_attach;
>  }
>  

