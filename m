Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485C8B9DBF
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AB610E26E;
	Thu,  2 May 2024 15:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 176D610E26E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:48:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7846F2F4;
 Thu,  2 May 2024 08:48:25 -0700 (PDT)
Received: from [10.1.36.41] (e122027.cambridge.arm.com [10.1.36.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3F9D3F73F;
 Thu,  2 May 2024 08:47:58 -0700 (PDT)
Message-ID: <b60348ae-0005-48b5-ae7b-9ff5365f25f4@arm.com>
Date: Thu, 2 May 2024 16:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/panthor: Relax the constraints on the tiler
 chunk size
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240502154025.1425278-1-boris.brezillon@collabora.com>
 <20240502154025.1425278-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502154025.1425278-4-boris.brezillon@collabora.com>
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

On 02/05/2024 16:40, Boris Brezillon wrote:
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
> v3:
> - Add R-bs
> - Fix valid range in the kerneldoc

Sadly the fixed range didn't make it to this posting... ;)

Steve

> 
> v2:
> - Turn the power-of-two constraint into a page-aligned constraint to allow
>   fine-tune of the initial/max heap memory size
> - Fix the panthor_heap_create() kerneldoc
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
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

