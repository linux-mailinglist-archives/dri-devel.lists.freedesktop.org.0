Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B68B769B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 15:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605710E82B;
	Tue, 30 Apr 2024 13:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nmfsjB78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E6310E348
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714482516;
 bh=zJaFrlnoGBbQvKHQGS9MskMg0nKWsqL45+YJqvknPAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmfsjB78PNg4ZSsjpnD51AJosCVa1g2iv1fUxwAYpFhhvpkpM6Bf56AhbAPKuWZWc
 ygKARFPVnKIQlZDpYSNYoDABR5uREudTYNC9MYdgNYNSClIxUr7VJ+yzTuazhZQneM
 GlldV45NYYhYPy2l/1wSm1Fr0N0CCSpjUjcTaDG/TR49J+xYYe+zkLdc9zQDJl+J37
 AXb9hEQik0jTh8O0eMUXsaUhAYDlYMCoVx5y1lDM8Sde3/M8jLIG9TKd3KNnfaAVs8
 /km2a0yex/uwWxlK5TYKumBQVPHYI7IITpud2MPKlHL4bH11x+QHFB2g8BgDgms497
 vg+brlRl8tEoQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1FEAB378203F;
 Tue, 30 Apr 2024 13:08:36 +0000 (UTC)
Date: Tue, 30 Apr 2024 14:08:35 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/4] drm/panthor: Relax the constraints on the tiler
 chunk size
Message-ID: <arfscr3mzmxezf7icupfr7urjfnujp5yogxfzrkmetuyhdztrg@zem4tqbphyab>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-4-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430112852.486424-4-boris.brezillon@collabora.com>
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

Hi Boris,

On 30.04.2024 13:28, Boris Brezillon wrote:
> The field used to store the chunk size if 12 bits wide, and the encoding
> is chunk_size = chunk_header.chunk_size << 12, which gives us a
> theoretical [4k:8M] range. This range is further limited by
> implementation constraints, and all known implementations seem to
> impose a [128k:8M] range, so do the same here.
> 
> We also relax the power-of-two constraint, which doesn't seem to
> exist on v10. This will allow userspace to fine-tune initial/max
> tiler memory on memory-constrained devices.
> 
> v2:
> - Turn the power-of-two constraint into a page-aligned constraint to allow
>   fine-tune of the initial/max heap memory size
> - Fix the panthor_heap_create() kerneldoc
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 8 ++++----
>  include/uapi/drm/panthor_drm.h         | 6 +++++-
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3be86ec383d6..683bb94761bc 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -253,8 +253,8 @@ int panthor_heap_destroy(struct panthor_heap_pool *pool, u32 handle)
>   * @pool: Pool to instantiate the heap context from.
>   * @initial_chunk_count: Number of chunk allocated at initialization time.
>   * Must be at least 1.
> - * @chunk_size: The size of each chunk. Must be a power of two between 256k
> - * and 2M.
> + * @chunk_size: The size of each chunk. Must be page-aligned and lie in the
> + * [128k:2M] range.

Probably a typo, but I guess this should be [128k:8M] ?

>   * @max_chunks: Maximum number of chunks that can be allocated.
>   * @target_in_flight: Maximum number of in-flight render passes.
>   * @heap_ctx_gpu_va: Pointer holding the GPU address of the allocated heap
> @@ -284,8 +284,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>  	if (initial_chunk_count > max_chunks)
>  		return -EINVAL;
>  
> -	if (hweight32(chunk_size) != 1 ||
> -	    chunk_size < SZ_256K || chunk_size > SZ_2M)
> +	if (!IS_ALIGNED(chunk_size, PAGE_SIZE) ||
> +	    chunk_size < SZ_128K || chunk_size > SZ_8M)
>  		return -EINVAL;
>  
>  	down_read(&pool->lock);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 5db80a0682d5..b8220d2e698f 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -898,7 +898,11 @@ struct drm_panthor_tiler_heap_create {
>  	/** @initial_chunk_count: Initial number of chunks to allocate. Must be at least one. */
>  	__u32 initial_chunk_count;
>  
> -	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
> +	/**
> +	 * @chunk_size: Chunk size.
> +	 *
> +	 * Must be page-aligned and lie in the [128k:8M] range.
> +	 */
>  	__u32 chunk_size;
>  
>  	/**
> -- 
> 2.44.0


Adrian Larumbe
