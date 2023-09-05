Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5797920A4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656AA10E151;
	Tue,  5 Sep 2023 07:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA52F10E151
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:05:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CA2476607186;
 Tue,  5 Sep 2023 08:05:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693897519;
 bh=DODM7tDkvnS6WtMrv9SJt6na9080Dp7Q1IcJy05+nKk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SA5nPv8GfJeHqV0kh7lO3NEpO46/9ae3AwDyn1wvh+557sYb6gxnTEpYwWsYYKvLl
 QBnHsYmlP0KA2CPlmqrJHCTe+F3b+QbGy/vzaZhp4nfrv8vooARJMWmLxGrVkWFB9A
 qrMOU5VVHQUfoq5YoUGnlYItmh/qxDbQa0xSxWxBs8YbTmKlBPtWIxuA62ru0knEgc
 eiL9V1zxTPev0CWeZgATBzk2EEq6NT4QDzDsNQuKQvbpLiUhVAmj8ACIJnlgGg054D
 D+Z9fpIeb97lzwbLS1FYiaRtZFtaz33MXU3ANRis76LKiOxfQ03x93C7Xo4ceGag+Y
 bzj28UT6psUVg==
Date: Tue, 5 Sep 2023 09:05:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 14/20] drm/shmem-helper: Use refcount_t for
 vmap_use_count
Message-ID: <20230905090516.174c3524@collabora.com>
In-Reply-To: <20230903170736.513347-15-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-15-dmitry.osipenko@collabora.com>
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

On Sun,  3 Sep 2023 20:07:30 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Use refcount_t helper for vmap_use_count to make refcounting consistent
> with pages_use_count and pages_pin_count that use refcount_t. This will
> allow to optimize unlocked vmappings by skipping reservation locking if
> refcnt > 1

nit: this optimization doesn't exist in practice, because the resv
lock is taken by the core, and ->v[un]map() are called with this lock
held.

> and also makes vmapping to benefit from the refcount_t's
> overflow checks.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

I agree with your 2 other points (consistency with other refcounting
primitives and safeness provided by refcount_t) so

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

but I'd recommend rephrasing/dropping the part mentioning the lock-free
optimization.

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 28 +++++++++++---------------
>  include/drm/drm_gem_shmem_helper.h     |  2 +-
>  2 files changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 899f655a65bb..4633a418faba 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -144,7 +144,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  	} else if (!shmem->imported_sgt) {
>  		dma_resv_lock(shmem->base.resv, NULL);
>  
> -		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
> +		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
>  
>  		if (shmem->sgt) {
>  			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
> @@ -345,23 +345,25 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  
>  		dma_resv_assert_held(shmem->base.resv);
>  
> -		if (shmem->vmap_use_count++ > 0) {
> +		if (refcount_inc_not_zero(&shmem->vmap_use_count)) {
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
> +			refcount_set(&shmem->vmap_use_count, 1);
> +		}
>  	}
>  
>  	if (ret) {
> @@ -374,8 +376,6 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  err_put_pages:
>  	if (!obj->import_attach)
>  		drm_gem_shmem_unpin_locked(shmem);
> -err_zero_use:
> -	shmem->vmap_use_count = 0;
>  
>  	return ret;
>  }
> @@ -403,14 +403,10 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  	} else {
>  		dma_resv_assert_held(shmem->base.resv);
>  
> -		if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
> -			return;
> -
> -		if (--shmem->vmap_use_count > 0)
> -			return;
> -
> -		vunmap(shmem->vaddr);
> -		drm_gem_shmem_unpin_locked(shmem);
> +		if (refcount_dec_and_test(&shmem->vmap_use_count)) {
> +			vunmap(shmem->vaddr);
> +			drm_gem_shmem_unpin_locked(shmem);
> +		}
>  	}
>  
>  	shmem->vaddr = NULL;
> @@ -656,7 +652,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  
>  	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
>  	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
> -	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
> +	drm_printf_indent(p, indent, "vmap_use_count=%u\n", refcount_read(&shmem->vmap_use_count));
>  	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_print_info);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 396958a98c34..63e91e8f2d5c 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -81,7 +81,7 @@ struct drm_gem_shmem_object {
>  	 * Reference count on the virtual address.
>  	 * The address are un-mapped when the count reaches zero.
>  	 */
> -	unsigned int vmap_use_count;
> +	refcount_t vmap_use_count;
>  
>  	/**
>  	 * @got_pages_sgt:

