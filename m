Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45641E7F32
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 15:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47A6E8FA;
	Fri, 29 May 2020 13:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27C26E8FA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 13:49:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C57BC2A4598;
 Fri, 29 May 2020 14:49:26 +0100 (BST)
Date: Fri, 29 May 2020 15:49:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/shmem-helpers: Simplify dma-buf importing
Message-ID: <20200529154923.0027b7f9@collabora.com>
In-Reply-To: <20200520180232.956489-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-10-daniel.vetter@ffwll.ch>
 <20200520180232.956489-1-daniel.vetter@ffwll.ch>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 May 2020 20:02:32 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
 
> @@ -695,36 +702,16 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>  				    struct sg_table *sgt)
>  {
>  	size_t size = PAGE_ALIGN(attach->dmabuf->size);
> -	size_t npages = size >> PAGE_SHIFT;
>  	struct drm_gem_shmem_object *shmem;
> -	int ret;
>  
>  	shmem = drm_gem_shmem_create(dev, size);
>  	if (IS_ERR(shmem))
>  		return ERR_CAST(shmem);
>  
> -	shmem->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> -	if (!shmem->pages) {
> -		ret = -ENOMEM;
> -		goto err_free_gem;
> -	}
> -
> -	ret = drm_prime_sg_to_page_addr_arrays(sgt, shmem->pages, NULL, npages);
> -	if (ret < 0)
> -		goto err_free_array;
> -
>  	shmem->sgt = sgt;
> -	shmem->pages_use_count = 1; /* Permanently pinned from our point of view */

Keep the above line and that should be good.

>  
>  	DRM_DEBUG_PRIME("size = %zu\n", size);
>  
>  	return &shmem->base;
> -
> -err_free_array:
> -	kvfree(shmem->pages);
> -err_free_gem:
> -	drm_gem_object_put(&shmem->base);
> -
> -	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
