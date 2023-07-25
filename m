Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F97A760B43
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C8810E39F;
	Tue, 25 Jul 2023 07:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E194410E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:14:52 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0534C6606FD7;
 Tue, 25 Jul 2023 08:14:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690269291;
 bh=2Up7Q4ggLqZwRNdv/plAaqb8BMBgbL4oTYcjSdMQnow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GLcosbsF9805iCbE8eMvWlBaeBQxI53nor3WoWEKfZ5Hj/OXrrl3yEPPnLRW+TpRz
 iKuHpSPyTIWyXIT29oO+7L7G+HITZzPd4GlWnb38HINfGIiom/lq3+h9ArzmviwEKp
 WbXCLx+qEhV5lJie++W+SiYk79wKqF3enWPkKVXfXpkajuostTzGKwBGQ2bOnV3sKw
 BWOYiHqmLRPWxmky2VY5WkUB3em82QbGqEQD5rASxpWTChzgkqoQL72TsEvfif2TWq
 5lPoW74N+x6kXkS6Qp1yk9zEYkaG60R5mPY5EfQv8zb7R5eCfTbNAoVM1tb9i+za3d
 tdd/dDLnHluxA==
Date: Tue, 25 Jul 2023 09:14:48 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v14 01/12] drm/shmem-helper: Factor out pages
 alloc/release from drm_gem_shmem_get/put_pages()
Message-ID: <20230725091448.7ac0c4aa@collabora.com>
In-Reply-To: <20230722234746.205949-2-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
 <20230722234746.205949-2-dmitry.osipenko@collabora.com>
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

On Sun, 23 Jul 2023 02:47:35 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Factor out pages allocation from drm_gem_shmem_get_pages() into
> drm_gem_shmem_acquire_pages() function and similar for the put_pages()
> in a preparation for addition of shrinker support to drm-shmem.
> 
> Once shrinker will be added, the pages_use_count>0 will no longer determine
> whether pages are pinned because pages could be swapped out by the shrinker
> and then pages_use_count will be greater than 0 in this case. We will add
> new pages_pin_count in a later patch.
> 
> The new common drm_gem_shmem_acquire/release_pages() will be used by
> shrinker code for performing the page swapping.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 65 ++++++++++++++++++++------
>  1 file changed, 52 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index a783d2245599..267153853e2c 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -165,21 +165,26 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
>  
> -static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +static int
> +drm_gem_shmem_acquire_pages(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct page **pages;
>  
>  	dma_resv_assert_held(shmem->base.resv);

Not directly related to this patch, but can we start using _locked
suffixes for any function that's expecting the dma-resv lock to be held?

>  
> -	if (shmem->pages_use_count++ > 0)
> -		return 0;
> +	if (shmem->madv < 0) {
> +		drm_WARN_ON(obj->dev, shmem->pages);
> +		return -ENOMEM;
> +	}
> +
> +	if (drm_WARN_ON(obj->dev, !shmem->pages_use_count))
> +		return -EINVAL;
>  
>  	pages = drm_gem_get_pages(obj);
>  	if (IS_ERR(pages)) {
>  		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
>  			    PTR_ERR(pages));
> -		shmem->pages_use_count = 0;
>  		return PTR_ERR(pages);
>  	}
>  
> @@ -198,6 +203,48 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  	return 0;
>  }
>  
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +{
> +	int err;
> +
> +	dma_resv_assert_held(shmem->base.resv);
> +
> +	if (shmem->madv < 0)
> +		return -ENOMEM;
> +
> +	if (shmem->pages_use_count++ > 0)
> +		return 0;
> +
> +	err = drm_gem_shmem_acquire_pages(shmem);
> +	if (err)
> +		goto err_zero_use;
> +
> +	return 0;
> +
> +err_zero_use:
> +	shmem->pages_use_count = 0;
> +
> +	return err;
> +}
> +
> +static void
> +drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +
> +	dma_resv_assert_held(shmem->base.resv);
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
>  /*
>   * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
>   * @shmem: shmem GEM object
> @@ -216,15 +263,7 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>  	if (--shmem->pages_use_count > 0)
>  		return;
>  
> -#ifdef CONFIG_X86
> -	if (shmem->map_wc)
> -		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
> -#endif
> -
> -	drm_gem_put_pages(obj, shmem->pages,
> -			  shmem->pages_mark_dirty_on_put,
> -			  shmem->pages_mark_accessed_on_put);
> -	shmem->pages = NULL;
> +	drm_gem_shmem_release_pages(shmem);
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_put_pages);
>  

