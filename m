Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF678AE08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 12:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115C210E285;
	Mon, 28 Aug 2023 10:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49D010E284;
 Mon, 28 Aug 2023 10:55:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7620966003AF;
 Mon, 28 Aug 2023 11:55:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693220122;
 bh=Y7Xrnk37ffMwXDwhIRgKCNKpNEyURXK76bZ+LzfgfJU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MPiXj4Dfk5SQk9okZJLs4FFEgbmsCH+Ofpf9s5uOSQ+2Hglnf69hWQ3QDk0kzlimG
 ZyABf43UGCrYR3vWBsYQJFl8oMMxcbJ4cRaUqyHAidpFv3HEcHM6qsdXJrEz92lK2e
 DKo+BLfmEI8k8rGRj1zyB2yO3ij0HO7xp5/PZLdtZeOEldKanV/O4dbkIPTUFEsqPr
 aS2mj0tOQuwG9hIIra+CJeabSiilp//N9n4emdtuEKqlG1bMv3YVV67h9n0o81i+JL
 awXZ15YqYk1iey6l99RiKDegI6Vtxtu43LgaD7cdR7A8oBEVIBKov1TNsaVQrWOFVw
 ZWAn5Z1jUZNBA==
Date: Mon, 28 Aug 2023 12:55:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 02/23] drm/shmem-helper: Use flag for tracking page
 count bumped by get_pages_sgt()
Message-ID: <20230828125518.7b926fc6@collabora.com>
In-Reply-To: <20230827175449.1766701-3-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-3-dmitry.osipenko@collabora.com>
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

On Sun, 27 Aug 2023 20:54:28 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Use separate flag for tracking page count bumped by shmem->sgt to avoid
> imbalanced page counter during of drm_gem_shmem_free() time. It's fragile
> to assume that populated shmem->pages at a freeing time means that the
> count was bumped by drm_gem_shmem_get_pages_sgt(), using a flag removes
> the ambiguity.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
>  drivers/gpu/drm/lima/lima_gem.c        | 1 +
>  include/drm/drm_gem_shmem_helper.h     | 7 +++++++
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 78d9cf2355a5..db20b9123891 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -152,7 +152,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
>  			sg_free_table(shmem->sgt);
>  			kfree(shmem->sgt);
>  		}
> -		if (shmem->pages)
> +		if (shmem->got_sgt)
>  			drm_gem_shmem_put_pages(shmem);

Can't we just move this drm_gem_shmem_put_pages() call in the
if (shmem->sgt) block?

>  
>  		drm_WARN_ON(obj->dev, shmem->pages_use_count);
> @@ -687,6 +687,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  	if (ret)
>  		goto err_free_sgt;
>  
> +	shmem->got_sgt = true;
>  	shmem->sgt = sgt;
>  
>  	return sgt;
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 4f9736e5f929..28602302c281 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -89,6 +89,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>  	}
>  
>  	*bo->base.sgt = sgt;
> +	bo->base.got_sgt = true;
>  
>  	if (vm) {
>  		ret = lima_vm_map_bo(vm, bo, old_size >> PAGE_SHIFT);
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index ec70a98a8fe1..f87124629bb5 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -73,6 +73,13 @@ struct drm_gem_shmem_object {
>  	 */
>  	unsigned int vmap_use_count;
>  
> +	/**
> +	 * @got_sgt:
> +	 *
> +	 * True if SG table was retrieved using drm_gem_shmem_get_pages_sgt()
> +	 */
> +	bool got_sgt : 1;
> +
>  	/**
>  	 * @imported_sgt:
>  	 *

