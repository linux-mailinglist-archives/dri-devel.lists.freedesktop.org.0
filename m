Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2453C8B7D4E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 18:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F19112CEC;
	Tue, 30 Apr 2024 16:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79AE8112CEC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 16:41:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE5D02F4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 09:41:26 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4915E3F762
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 09:41:00 -0700 (PDT)
Date: Tue, 30 Apr 2024 17:40:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Eric Smith <eric.smith@collabora.com>
Subject: Re: [PATCH v2 4/4] drm/panthor: Fix an off-by-one in the heap
 context retrieval logic
Message-ID: <ZjEfFiT7k_1y3agC@e110455-lin.cambridge.arm.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-5-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430112852.486424-5-boris.brezillon@collabora.com>
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

On Tue, Apr 30, 2024 at 01:28:52PM +0200, Boris Brezillon wrote:
> ID 0 is reserved to encode 'no-tiler-heap', the heap ID range is
> [1:MAX_HEAPS_PER_POOL], which we occasionally need to turn into an index
> in the [0:MAX_HEAPS_PER_POOL-1] when we want to access the context object.
> 
> v2:
> - New patch
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Reported-by: Eric Smith <eric.smith@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Eric Smith <eric.smith@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 35 +++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 683bb94761bc..b1a7dbf25fb2 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -109,7 +109,11 @@ static int panthor_heap_ctx_stride(struct panthor_device *ptdev)
>  
>  static int panthor_get_heap_ctx_offset(struct panthor_heap_pool *pool, int id)

Can we make id and the return type here u32? I keep thinking about returning large negative
values here and how they can end up being exploited.

>  {
> -	return panthor_heap_ctx_stride(pool->ptdev) * id;
> +	/* ID 0 is reserved to encode 'no-tiler-heap', the valid range
> +	 * is [1:MAX_HEAPS_PER_POOL], which we need to turn into a
> +	 * [0:MAX_HEAPS_PER_POOL-1] context index, hence the minus one here.
> +	 */
> +	return panthor_heap_ctx_stride(pool->ptdev) * (id - 1);
>  }
>  
>  static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
> @@ -118,6 +122,21 @@ static void *panthor_get_heap_ctx(struct panthor_heap_pool *pool, int id)
>  	       panthor_get_heap_ctx_offset(pool, id);
>  }
>  
> +static int panthor_get_heap_ctx_id(struct panthor_heap_pool *pool,
> +				   u64 heap_ctx_gpu_va)
> +{
> +	u64 offset = heap_ctx_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
> +	u32 heap_idx = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
> +
> +	if (offset > U32_MAX || heap_idx >= MAX_HEAPS_PER_POOL)
> +		return -EINVAL;
> +
> +	/* ID 0 is reserved to encode 'no-tiler-heap', the valid range
> +	 * is [1:MAX_HEAPS_PER_POOL], hence the plus one here.
> +	 */
> +	return heap_idx + 1;
> +}
> +
>  static void panthor_free_heap_chunk(struct panthor_vm *vm,
>  				    struct panthor_heap *heap,
>  				    struct panthor_heap_chunk *chunk)
> @@ -364,14 +383,13 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
>  			      u64 heap_gpu_va,
>  			      u64 chunk_gpu_va)
>  {
> -	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
> -	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
> +	int heap_id = panthor_get_heap_ctx_id(pool, heap_gpu_va);

I would keep heap_id here u32. Why do we need to change it? Also, I don't see how
panthor_get_heap_ctx_id() can ever return negative values unless we expect MAX_HEAPS_PER_POOL
to be S32_MAX at some moment.

>  	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
>  	struct panthor_heap *heap;
>  	int ret;
>  
> -	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
> -		return -EINVAL;
> +	if (heap_id < 0)
> +		return heap_id;

This can then be removed if heap_id is u32.

>  
>  	down_read(&pool->lock);
>  	heap = xa_load(&pool->xa, heap_id);
> @@ -427,14 +445,13 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>  		      u32 pending_frag_count,
>  		      u64 *new_chunk_gpu_va)
>  {
> -	u64 offset = heap_gpu_va - panthor_kernel_bo_gpuva(pool->gpu_contexts);
> -	u32 heap_id = (u32)offset / panthor_heap_ctx_stride(pool->ptdev);
> +	int heap_id = panthor_get_heap_ctx_id(pool, heap_gpu_va);

Again, keep u32 unless you have good reasons ...

>  	struct panthor_heap_chunk *chunk;
>  	struct panthor_heap *heap;
>  	int ret;
>  
> -	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
> -		return -EINVAL;
> +	if (heap_id < 0)
> +		return heap_id;

... and we will not need this.

Best regards,
Liviu


>  
>  	down_read(&pool->lock);
>  	heap = xa_load(&pool->xa, heap_id);
> -- 
> 2.44.0
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
