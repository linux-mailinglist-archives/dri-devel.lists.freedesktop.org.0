Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2597C45A90
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCF610E2BF;
	Mon, 10 Nov 2025 09:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E8CE10E2BF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:34:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A4742B;
 Mon, 10 Nov 2025 01:33:58 -0800 (PST)
Received: from [10.57.72.117] (unknown [10.57.72.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5E8B3F63F;
 Mon, 10 Nov 2025 01:34:04 -0800 (PST)
Message-ID: <1c84e306-7e60-4f3e-b2b1-4ee2c2dc37fb@arm.com>
Date: Mon, 10 Nov 2025 09:34:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Flush shmem writes before mapping buffers
 CPU-uncached
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20251107171214.1186299-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251107171214.1186299-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/11/2025 17:12, Boris Brezillon wrote:
> The shmem layer zeroes out the new pages using cached mappings, and if
> we don't CPU-flush we might leave dirty cachelines behind, leading to
> potential data leaks and/or asynchronous buffer corruption when dirty
> cachelines are evicted.
> 
> Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index f369cc3e2a5f..2c12c1c58e2b 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -281,6 +281,23 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  
>  	panthor_gem_debugfs_set_usage_flags(bo, 0);
>  
> +	/* If this is a write-combine mapping, we query the sgt to force a CPU
> +	 * cache flush (dma_map_sgtable() is called when the sgt is created).
> +	 * This ensures the zero-ing is visible to any uncached mapping created
> +	 * by vmap/mmap.
> +	 * FIXME: Ideally this should be done when pages are allocated, not at
> +	 * BO creation time.
> +	 */
> +	if (shmem->map_wc) {
> +		struct sg_table *sgt;
> +
> +		sgt = drm_gem_shmem_get_pages_sgt(shmem);
> +		if (IS_ERR(sgt)) {
> +			ret = PTR_ERR(sgt);
> +			goto out_put_gem;
> +		}
> +	}
> +
>  	/*
>  	 * Allocate an id of idr table where the obj is registered
>  	 * and handle has the id what user can see.
> @@ -289,6 +306,7 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	if (!ret)
>  		*size = bo->base.base.size;
>  
> +out_put_gem:
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
>  

