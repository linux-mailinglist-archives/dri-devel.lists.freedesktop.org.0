Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBFB8B9BFC
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 16:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FC010EF8D;
	Thu,  2 May 2024 14:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2744510EF8D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 14:03:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 235B22F4;
 Thu,  2 May 2024 07:04:11 -0700 (PDT)
Received: from [10.1.36.41] (e122027.cambridge.arm.com [10.1.36.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7052F3F73F;
 Thu,  2 May 2024 07:03:44 -0700 (PDT)
Message-ID: <84b8595c-db43-4dbe-bb1f-51c117db8f39@arm.com>
Date: Thu, 2 May 2024 15:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/panthor: Fix tiler OOM handling to allow
 incremental rendering
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Antonino Maniscalco <antonino.maniscalco@collabora.com>, kernel@collabora.com
References: <20240430112852.486424-1-boris.brezillon@collabora.com>
 <20240430112852.486424-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240430112852.486424-2-boris.brezillon@collabora.com>
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
> From: Antonino Maniscalco <antonino.maniscalco@collabora.com>
> 
> If the kernel couldn't allocate memory because we reached the maximum
> number of chunks but no render passes are in flight
> (panthor_heap_grow() returning -ENOMEM), we should defer the OOM
> handling to the FW by returning a NULL chunk. The FW will then call
> the tiler OOM exception handler, which is supposed to implement
> incremental rendering (execute an intermediate fragment job to flush
> the pending primitives, release the tiler memory that was used to
> store those primitives, and start over from where it stopped).
> 
> Instead of checking for both ENOMEM and EBUSY, make panthor_heap_grow()
> return ENOMEM no matter the reason of this allocation failure, the FW
> doesn't care anyway.
> 
> v2:
> - Make panthor_heap_grow() return -ENOMEM for all kind of allocation
>   failures
> - Document the panthor_heap_grow() semantics
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Antonino Maniscalco <antonino.maniscalco@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_heap.c  | 12 ++++++++----
>  drivers/gpu/drm/panthor/panthor_sched.c |  7 ++++++-
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 143fa35f2e74..c3c0ba744937 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -410,6 +410,13 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
>   * @renderpasses_in_flight: Number of render passes currently in-flight.
>   * @pending_frag_count: Number of fragment jobs waiting for execution/completion.
>   * @new_chunk_gpu_va: Pointer used to return the chunk VA.
> + *
> + * Return:
> + * - 0 if a new heap was allocated
> + * - -ENOMEM if the tiler context reached the maximum number of chunks
> + *   or if too many render passes are in-flight
> + *   or if the allocation failed
> + * - -EINVAL if any of the arguments passed to panthor_heap_grow() is invalid
>   */
>  int panthor_heap_grow(struct panthor_heap_pool *pool,
>  		      u64 heap_gpu_va,
> @@ -439,10 +446,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>  	 * handler provided by the userspace driver, if any).
>  	 */
>  	if (renderpasses_in_flight > heap->target_in_flight ||
> -	    (pending_frag_count > 0 && heap->chunk_count >= heap->max_chunks)) {
> -		ret = -EBUSY;
> -		goto out_unlock;
> -	} else if (heap->chunk_count >= heap->max_chunks) {
> +	    heap->chunk_count >= heap->max_chunks) {
>  		ret = -ENOMEM;
>  		goto out_unlock;
>  	}
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index b3a51a6de523..fd928362d45e 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1354,7 +1354,12 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
>  					pending_frag_count, &new_chunk_va);
>  	}
>  
> -	if (ret && ret != -EBUSY) {
> +	/* If the heap context doesn't have memory for us, we want to let the
> +	 * FW try to reclaim memory by waiting for fragment jobs to land or by
> +	 * executing the tiler OOM exception handler, which is supposed to
> +	 * implement incremental rendering.
> +	 */
> +	if (ret && ret != -ENOMEM) {
>  		drm_warn(&ptdev->base, "Failed to extend the tiler heap\n");
>  		group->fatal_queues |= BIT(cs_id);
>  		sched_queue_delayed_work(sched, tick, 0);

