Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE08B1E04
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58E10E830;
	Thu, 25 Apr 2024 09:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5919910E830
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:28:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1EC61063;
 Thu, 25 Apr 2024 02:29:20 -0700 (PDT)
Received: from [10.57.56.40] (unknown [10.57.56.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCBF23F64C;
 Thu, 25 Apr 2024 02:28:51 -0700 (PDT)
Message-ID: <f0094aef-a190-41ba-91bd-006eb0e1bf69@arm.com>
Date: Thu, 25 Apr 2024 10:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panthor: Make sure the tiler initial/max chunks
 are consistent
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
 <20240425071837.529039-3-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240425071837.529039-3-boris.brezillon@collabora.com>
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

On 25/04/2024 08:18, Boris Brezillon wrote:
> It doesn't make sense to have a maximum number of chunks smaller than
> the initial number of chunks attached to the context.
> 
> Fix the uAPI header to reflect the new constraint, and mention the
> undocumented "initial_chunk_count > 0" constraint while at it.
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 3 +++
>  include/uapi/drm/panthor_drm.h         | 8 ++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 143fa35f2e74..8728c9bb76e4 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -281,6 +281,9 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>  	if (initial_chunk_count == 0)
>  		return -EINVAL;
>  
> +	if (initial_chunk_count < max_chunks)
> +		return -EINVAL;
> +
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

