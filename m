Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916AC460AC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 11:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBCE10E2D7;
	Mon, 10 Nov 2025 10:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 569CD10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:48:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A1A5FEC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 02:48:17 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 906003F66E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 02:48:24 -0800 (PST)
Date: Mon, 10 Nov 2025 10:48:20 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Flush shmem writes before mapping buffers
 CPU-uncached
Message-ID: <aRHC9PVV38ORvzDs@e110455-lin.cambridge.arm.com>
References: <20251107171214.1186299-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107171214.1186299-1-boris.brezillon@collabora.com>
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

On Fri, Nov 07, 2025 at 06:12:14PM +0100, Boris Brezillon wrote:
> The shmem layer zeroes out the new pages using cached mappings, and if
> we don't CPU-flush we might leave dirty cachelines behind, leading to
> potential data leaks and/or asynchronous buffer corruption when dirty
> cachelines are evicted.
> 
> Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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
> -- 
> 2.51.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
