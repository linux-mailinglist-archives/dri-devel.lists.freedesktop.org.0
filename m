Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B514378A980
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 12:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD40D10E06C;
	Mon, 28 Aug 2023 10:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182F10E06C;
 Mon, 28 Aug 2023 10:00:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B9A226607181;
 Mon, 28 Aug 2023 11:00:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693216836;
 bh=jdAjlOCLEGq6B7K+3PQcFTyPGl+kF+eJra2e4ngwQ80=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K/P3ciXuWQaaWe6Go8PTEApuBCeuYZPOKw+5md6zEo71hJz13EVK7Or7Yu9BfIWSF
 DdeV8YttKG6m7IO6gMq/5lVE8rapts5wzeU+Af5RcW1f0OcndggGBW5tQzKzV7y308
 SVY3uplFsar4hPSUf9VP5RDSCjfWyZK+XpxDAvDAjx95+GlJmB+AI5c+hk7XMf1C/0
 T23/sLygho0vj72iAYzmXpPlfaxAL81+RoEtjVSisRIiWbvQepx0D6YXBI/RZBfnls
 8F1cxbx507UIXI+EXjCJAJN99mBnw5Pj+eiPuUInJ881rGdlifNDHhTVfhA7mBeExT
 C/wF73u5SiB0Q==
Date: Mon, 28 Aug 2023 12:00:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 16/23] drm/shmem-helper: Use kref for vmap_use_count
Message-ID: <20230828120032.3d86cb15@collabora.com>
In-Reply-To: <20230827175449.1766701-17-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-17-dmitry.osipenko@collabora.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Aug 2023 20:54:42 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Use kref helper for vmap_use_count to make refcounting consistent with
> pages_use_count and pages_pin_count that use kref. This will allow to
> optimize unlocked vmappings by skipping reservation locking if refcnt > 1.

The core is taking the resv lock before calling ->v[un]map(), so
switching to a kref sounds a bit premature/useless, unless there are
plans to delegate the locking to the drivers. The only thing it brings
is standard overflow/underflow checks. Not really sure it's worth
transitioning to a kref for this field until we have a real use case.

> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 37 ++++++++++++++------------
>  include/drm/drm_gem_shmem_helper.h     |  2 +-
>  2 files changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 17a0177acb5d..d96fee3d6166 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -144,7 +144,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  	} else if (!shmem->imported_sgt) {
>  		dma_resv_lock(shmem->base.resv, NULL);
>  
> -		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> +		drm_WARN_ON(obj->dev, kref_read(&shmem->vmap_use_count));
>  
>  		if (shmem->sgt) {
>  			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
> @@ -359,23 +359,25 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  
>  		dma_resv_assert_held(shmem->base.resv);
>  
> -		if (shmem->vmap_use_count++ > 0) {
> +		if (kref_get_unless_zero(&shmem->vmap_use_count)) {
>  			iosys_map_set_vaddr(map, shmem->vaddr);
>  			return 0;
>  		}
>  
>  		ret = drm_gem_shmem_pin_locked(shmem);
>  		if (ret)
> -			goto err_zero_use;
> +			return ret;
>  
>  		if (shmem->map_wc)
>  			prot = pgprot_writecombine(prot);
>  		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
>  				    VM_MAP, prot);
> -		if (!shmem->vaddr)
> +		if (!shmem->vaddr) {
>  			ret = -ENOMEM;
> -		else
> +		} else {
>  			iosys_map_set_vaddr(map, shmem->vaddr);
> +			kref_init(&shmem->vmap_use_count);
> +		}
>  	}
>  
>  	if (ret) {
> @@ -388,13 +390,22 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  err_put_pages:
>  	if (!obj->import_attach)
>  		drm_gem_shmem_unpin_locked(shmem);
> -err_zero_use:
> -	shmem->vmap_use_count = 0;
>  
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_vmap_locked);
>  
> +static void drm_gem_shmem_kref_vunmap(struct kref *kref)
> +{
> +	struct drm_gem_shmem_object *shmem;
> +
> +	shmem = container_of(kref, struct drm_gem_shmem_object,
> +			     vmap_use_count);
> +
> +	vunmap(shmem->vaddr);
> +	drm_gem_shmem_unpin_locked(shmem);
> +}
> +
>  /*
>   * drm_gem_shmem_vunmap_locked - Unmap a virtual mapping for a shmem GEM object
>   * @shmem: shmem GEM object
> @@ -416,15 +427,7 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  		dma_buf_vunmap(obj->import_attach->dmabuf, map);
>  	} else {
>  		dma_resv_assert_held(shmem->base.resv);
> -
> -		if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
> -			return;
> -
> -		if (--shmem->vmap_use_count > 0)
> -			return;
> -
> -		vunmap(shmem->vaddr);
> -		drm_gem_shmem_unpin_locked(shmem);
> +		kref_put(&shmem->vmap_use_count, drm_gem_shmem_kref_vunmap);
>  	}
>  
>  	shmem->vaddr = NULL;
> @@ -663,7 +666,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  		return;
>  
>  	drm_printf_indent(p, indent, "pages_use_count=%u\n", kref_read(&shmem->pages_use_count));
> -	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
> +	drm_printf_indent(p, indent, "vmap_use_count=%u\n", kref_read(&shmem->vmap_use_count));
>  	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 400ecd63f45f..0e0ccd380f66 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -81,7 +81,7 @@ struct drm_gem_shmem_object {
>  	 * Reference count on the virtual address.
>  	 * The address are un-mapped when the count reaches zero.
>  	 */
> -	unsigned int vmap_use_count;
> +	struct kref vmap_use_count;
>  
>  	/**
>  	 * @got_sgt:

