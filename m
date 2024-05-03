Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977C8BA8AD
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 10:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651AC10FA09;
	Fri,  3 May 2024 08:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB0E010F9FA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 08:26:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 283152F4;
 Fri,  3 May 2024 01:26:28 -0700 (PDT)
Received: from [10.1.39.22] (e122027.cambridge.arm.com [10.1.39.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F34E73F73F;
 Fri,  3 May 2024 01:26:01 -0700 (PDT)
Message-ID: <fd7fb2ca-2468-4f1f-a65d-ea617fa32f90@arm.com>
Date: Fri, 3 May 2024 09:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] drm/panthor: Fix an off-by-one in the heap context
 retrieval logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Eric Smith <eric.smith@collabora.com>
References: <20240502165158.1458959-1-boris.brezillon@collabora.com>
 <20240502165158.1458959-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240502165158.1458959-5-boris.brezillon@collabora.com>
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

On 02/05/2024 17:51, Boris Brezillon wrote:
> The heap ID is used to index the heap context pool, and allocating
> in the [1:MAX_HEAPS_PER_POOL] leads to an off-by-one. This was
> originally to avoid returning a zero heap handle, but given the handle
> is formed with (vm_id << 16) | heap_id, with vm_id > 0, we already can't
> end up with a valid heap handle that's zero.
> 
> v4:
> - s/XA_FLAGS_ALLOC1/XA_FLAGS_ALLOC/
> 
> v3:
> - Allocate in the [0:MAX_HEAPS_PER_POOL-1] range
> 
> v2:
> - New patch
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Reported-by: Eric Smith <eric.smith@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Eric Smith <eric.smith@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index b0fc5b9ee847..95a1c6c9f35e 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -323,7 +323,8 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>  	if (!pool->vm) {
>  		ret = -EINVAL;
>  	} else {
> -		ret = xa_alloc(&pool->xa, &id, heap, XA_LIMIT(1, MAX_HEAPS_PER_POOL), GFP_KERNEL);
> +		ret = xa_alloc(&pool->xa, &id, heap,
> +			       XA_LIMIT(0, MAX_HEAPS_PER_POOL - 1), GFP_KERNEL);
>  		if (!ret) {
>  			void *gpu_ctx = panthor_get_heap_ctx(pool, id);
>  
> @@ -543,7 +544,7 @@ panthor_heap_pool_create(struct panthor_device *ptdev, struct panthor_vm *vm)
>  	pool->vm = vm;
>  	pool->ptdev = ptdev;
>  	init_rwsem(&pool->lock);
> -	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC1);
> +	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC);
>  	kref_init(&pool->refcount);
>  
>  	pool->gpu_contexts = panthor_kernel_bo_create(ptdev, vm, bosize,

