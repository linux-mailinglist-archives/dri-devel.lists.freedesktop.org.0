Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E508B9BFE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B89210F5C5;
	Thu,  2 May 2024 14:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FA7710F5A4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:03:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A58B2F4;
 Thu,  2 May 2024 07:04:18 -0700 (PDT)
Received: from [10.1.36.41] (e122027.cambridge.arm.com [10.1.36.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11C733F73F;
 Thu,  2 May 2024 07:03:51 -0700 (PDT)
Message-ID: <791a81bf-323c-40dc-ab51-2d909adcb90b@arm.com>
Date: Thu, 2 May 2024 15:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panthor: Fix an off-by-one in the heap context
 retrieval logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Eric Smith <eric.smith@collabora.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240430112852.486424-5-boris.brezillon@collabora.com>
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

On 30/04/2024 12:28, Boris Brezillon wrote:
> ID 0 is reserved to encode 'no-tiler-heap', the heap ID range is
> [1:MAX_HEAPS_PER_POOL], which we occasionally need to turn into an index
> in the [0:MAX_HEAPS_PER_POOL-1] when we want to access the context object.

This might be a silly question, but do we need ID 0 to be
"no-tiler-heap"? Would it be easier to e.g. use a negative number for
that situation and avoid all the off-by-one problems?

I'm struggling to find the code which needs the 0 value to be special -
where is it exactly that we encode this "no-tiler-heap" value?

Steve

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
>  	struct panthor_heap_chunk *chunk, *tmp, *removed = NULL;
>  	struct panthor_heap *heap;
>  	int ret;
>  
> -	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
> -		return -EINVAL;
> +	if (heap_id < 0)
> +		return heap_id;
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
>  	struct panthor_heap_chunk *chunk;
>  	struct panthor_heap *heap;
>  	int ret;
>  
> -	if (offset > U32_MAX || heap_id >= MAX_HEAPS_PER_POOL)
> -		return -EINVAL;
> +	if (heap_id < 0)
> +		return heap_id;
>  
>  	down_read(&pool->lock);
>  	heap = xa_load(&pool->xa, heap_id);

