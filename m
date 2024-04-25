Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727148B1E07
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 11:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AFB11A30D;
	Thu, 25 Apr 2024 09:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3A8611A30D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:28:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3EC81007;
 Thu, 25 Apr 2024 02:29:24 -0700 (PDT)
Received: from [10.57.56.40] (unknown [10.57.56.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 831F83F64C;
 Thu, 25 Apr 2024 02:28:55 -0700 (PDT)
Message-ID: <db65e8e7-d281-4648-9895-74c5f0438894@arm.com>
Date: Thu, 25 Apr 2024 10:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panthor: Relax the check on the tiler chunk size
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20240425071837.529039-1-boris.brezillon@collabora.com>
 <20240425071837.529039-4-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240425071837.529039-4-boris.brezillon@collabora.com>
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
> The field used to store the chunk size if 12 bits wide, and the encoding
NIT:                                     ^^ is

> is chunk_size = chunk_header.chunk_size << 12, which gives us a
> theoretical [4k:8M] range. This range is further limited by
> implementation constraints, but those shouldn't be enforced kernel side.
> 
> Fixes: 9cca48fa4f89 ("drm/panthor: Add the heap logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

There's also a kerneldoc comment above panthor_heap_create that needs
updating too:

> /**
>  * panthor_heap_create() - Create a heap context
>  * @pool: Pool to instantiate the heap context from.
>  * @initial_chunk_count: Number of chunk allocated at initialization time.
>  * Must be at least 1.
>  * @chunk_size: The size of each chunk. Must be a power of two between 256k
>  * and 2M.

I'm also a little unsure on whether this is the right change. The
"implementation defined" min/max in the hardware docs say 128KiB to
8MiB. I'm not convinced it makes sense to increase the range beyond that.

As far as I'm aware the "must be a power of 2" isn't actually a
requirement (it's certainly not a requirement of the storage format) so
the kernel is already being more restrictive than necessary.

It seems like a good idea to keep the uAPI requirements stricter than
necessary and relax them in the future if we have a good reason (e.g.
new hardware supports a wider range). But matching the existing hardware
range of 128KB-8MB would obviously make sense now.

Steve

> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 2 +-
>  include/uapi/drm/panthor_drm.h         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 8728c9bb76e4..146ea2f57764 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -285,7 +285,7 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>  		return -EINVAL;
>  
>  	if (hweight32(chunk_size) != 1 ||
> -	    chunk_size < SZ_256K || chunk_size > SZ_2M)
> +	    chunk_size < SZ_4K || chunk_size > SZ_8M)
>  		return -EINVAL;
>  
>  	down_read(&pool->lock);
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 5db80a0682d5..80c0716361b9 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -898,7 +898,7 @@ struct drm_panthor_tiler_heap_create {
>  	/** @initial_chunk_count: Initial number of chunks to allocate. Must be at least one. */
>  	__u32 initial_chunk_count;
>  
> -	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
> +	/** @chunk_size: Chunk size. Must be a power of two and lie in the [4k:8M] range. */
>  	__u32 chunk_size;
>  
>  	/**

