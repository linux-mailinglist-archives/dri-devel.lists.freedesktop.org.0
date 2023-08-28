Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDEE78AF3D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 13:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B20F10E2A1;
	Mon, 28 Aug 2023 11:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F206D10E2A1;
 Mon, 28 Aug 2023 11:46:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EC92F660719F;
 Mon, 28 Aug 2023 12:46:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693223217;
 bh=t2fCeu+OfukEEpqeGoqYnE46rRWxUmeM0L2SCqoD4uQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AVRJUVWZMWdkkNkIwwQjHv2g46uUBb/77nyHYnON5KmS3tg1oGugPtkkG4iy1uFnG
 kTlb7OcbTpp1xrWuUx1KJtpRSrF1SGbMkVsAeizaiKACfM9cB68eq5B66FxW/z0+7+
 rahTU6MwaXdpYMvnA/jTzBi28EoNNGrm4GKtg7sBMn6mw2AUMannZ0SwQa2OdVBM8v
 FDYapcT8+ESaQfWnpqZaOOsfWDIrV80adNPo2nlmyNaIV7hhiCZq6dzw4BFYNW34Vp
 tnh+hpKP8Z/thw5o3hGvTMbyi34lpKi1lsc4s0MRM+WhRqdPxxGwXrcw3Kt75gWZGY
 ss6gwo1Ls2YNw==
Date: Mon, 28 Aug 2023 13:46:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 12/23] drm/shmem-helper: Add and use pages_pin_count
Message-ID: <20230828134654.7a2c6414@collabora.com>
In-Reply-To: <20230827175449.1766701-13-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-13-dmitry.osipenko@collabora.com>
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

On Sun, 27 Aug 2023 20:54:38 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Add separate pages_pin_count for tracking of whether drm-shmem pages are
> moveable or not. With the addition of memory shrinker support to drm-shmem,
> the pages_use_count will no longer determine whether pages are hard-pinned
> in memory, but whether pages exit and are soft-pinned (and could be swapped
> out). The pages_pin_count > 1 will hard-pin pages in memory.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 22 +++++++++++++++++-----
>  include/drm/drm_gem_shmem_helper.h     | 10 ++++++++++
>  2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d545d3d227d7..1a7e5c332fd8 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -234,14 +234,22 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  
>  	dma_resv_assert_held(shmem->base.resv);
>  
> +	if (kref_get_unless_zero(&shmem->pages_pin_count))
> +		return 0;
> +
>  	ret = drm_gem_shmem_get_pages_locked(shmem);
> +	if (!ret)
> +		kref_init(&shmem->pages_pin_count);
>  
>  	return ret;
>  }
>  
> -static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
> +static void drm_gem_shmem_kref_unpin_pages(struct kref *kref)
>  {
> -	dma_resv_assert_held(shmem->base.resv);
> +	struct drm_gem_shmem_object *shmem;
> +
> +	shmem = container_of(kref, struct drm_gem_shmem_object,
> +			     pages_pin_count);
>  
>  	drm_gem_shmem_put_pages_locked(shmem);
>  }
> @@ -263,6 +271,9 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> +	if (kref_get_unless_zero(&shmem->pages_pin_count))
> +		return 0;
> +
>  	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
>  	if (ret)
>  		return ret;
> @@ -286,9 +297,10 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
>  
>  	drm_WARN_ON(obj->dev, obj->import_attach);
>  
> -	dma_resv_lock(shmem->base.resv, NULL);
> -	drm_gem_shmem_unpin_locked(shmem);
> -	dma_resv_unlock(shmem->base.resv);
> +	if (kref_put_dma_resv(&shmem->pages_pin_count,
> +			      drm_gem_shmem_kref_unpin_pages,
> +			      obj->resv, NULL))
> +		dma_resv_unlock(obj->resv);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
>  
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index ec2d8b24e3cf..afb7cd671e2a 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -39,6 +39,16 @@ struct drm_gem_shmem_object {
>  	 */
>  	unsigned int pages_use_count;
>  
> +	/**
> +	 * @pages_pin_count:
> +	 *
> +	 * Reference count on the pinned pages table.
> +	 * The pages allowed to be evicted and purged by memory
> +	 * shrinker only when the count is zero, otherwise pages
> +	 * are hard-pinned in memory.
> +	 */
> +	struct kref pages_pin_count;

I know it's tempting to use kref for the pages use/pin count, but I'm
wondering if we wouldn't be better using a refcount_t, which provides
overflow/underflow protection while still letting us control how we
want to handle the locking for 0 <-> 1 transitions. By doing that, we
avoid introducing core locking changes that might be more
controversial/longer to get accepted. Besides, I suspect the resulting
code (the one using a refcount_t) won't be more verbose/complicated (no
release functions needed if you don't use kref_put(), which makes
things closer to what we have right now).

> +
>  	/**
>  	 * @madv: State for madvise
>  	 *

