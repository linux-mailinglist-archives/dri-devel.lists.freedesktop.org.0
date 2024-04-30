Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2647B8B7B9E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 17:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B60D11209E;
	Tue, 30 Apr 2024 15:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA0381120A2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 15:31:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D5512F4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:32:24 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0675C3F793
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:31:57 -0700 (PDT)
Date: Tue, 30 Apr 2024 16:31:54 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/4] drm/panthor: Make sure the tiler initial/max
 chunks are consistent
Message-ID: <ZjEO6ncmAcmfU0G-@e110455-lin.cambridge.arm.com>
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430112852.486424-3-boris.brezillon@collabora.com>
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

On Tue, Apr 30, 2024 at 01:28:50PM +0200, Boris Brezillon wrote:
> It doesn't make sense to have a maximum number of chunks smaller than
> the initial number of chunks attached to the context.
> 
> Fix the uAPI header to reflect the new constraint, and mention the
> undocumented "initial_chunk_count > 0" constraint while at it.
> 
> v2:
> - Fix the check
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 3 +++
>  include/uapi/drm/panthor_drm.h         | 8 ++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index c3c0ba744937..3be86ec383d6 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -281,6 +281,9 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>  	if (initial_chunk_count == 0)
>  		return -EINVAL;
>  
> +	if (initial_chunk_count > max_chunks)
> +		return -EINVAL;
> +

Is is just me that feels like a lost opportunity to merge the check with the one above?

	if (!initial_chunk_count || initial_chunk_count > max_chunks)
		return -EINVAL;


Otherwise, Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  	if (hweight32(chunk_size) != 1 ||
>  	    chunk_size < SZ_256K || chunk_size > SZ_2M)
>  		return -EINVAL;
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index dadb05ab1235..5db80a0682d5 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -895,13 +895,17 @@ struct drm_panthor_tiler_heap_create {
>  	/** @vm_id: VM ID the tiler heap should be mapped to */
>  	__u32 vm_id;
>  
> -	/** @initial_chunk_count: Initial number of chunks to allocate. */
> +	/** @initial_chunk_count: Initial number of chunks to allocate. Must be at least one. */
>  	__u32 initial_chunk_count;
>  
>  	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
>  	__u32 chunk_size;
>  
> -	/** @max_chunks: Maximum number of chunks that can be allocated. */
> +	/**
> +	 * @max_chunks: Maximum number of chunks that can be allocated.
> +	 *
> +	 * Must be at least @initial_chunk_count.
> +	 */
>  	__u32 max_chunks;
>  
>  	/**
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
