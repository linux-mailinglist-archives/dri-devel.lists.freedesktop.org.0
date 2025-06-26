Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48FAE98A8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 10:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FA810E881;
	Thu, 26 Jun 2025 08:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rOD8XCSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C0710E881
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+ud6iV5NPl2F2/DlWdYFkWuaF+1YrHnhHUZSGglUwY=; b=rOD8XCSu/JCd6FeCWyBar0P2o8
 2u2pHqJ1j5MXThFkjNgMmm/2Syy+WeAEJUKCW4E45YjXa9ESnZ3xml1HzIXBZLwVBKpNaY6qPo4be
 adXSNIFGBoF81HqLTaDC/mBMq1rNaFtU22H2Rcw5mWeZaXEccMzHtxIngao7o8jte0BKACaVkDX8F
 gQekO0qM7jsZqvrzjogp9VDrekbWT9iNAofYMX0+eqvIbfVM/u8KWF2E2Ga1box0x8e5qDjoRKNuY
 Rfx75zGXzlGY+v7KISkV2G9DpuwYRH2XMNToKQSS7EO3wGGCaerjvaULjKAS1nWkUfsICSdbHzsA/
 EEidJd7w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uUiAT-008u9r-FT; Thu, 26 Jun 2025 10:41:13 +0200
Message-ID: <1d24d974-cf92-47cc-ab53-5d205ce9945a@igalia.com>
Date: Thu, 26 Jun 2025 09:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: Fix racy access to
 drm_sched_entity.dependency
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250625143722.55272-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250625143722.55272-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 25/06/2025 15:37, Pierre-Eric Pelloux-Prayer wrote:
> The drm_sched_job_unschedulable trace point can access
> entity->dependency after it was cleared by the callback
> installed in drm_sched_entity_add_dependency_cb, causing:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000020
> Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
> RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0 [gpu_sched]
> 
> To fix this we either need to take a reference of the fence before
> setting up the callbacks, or move the trace_drm_sched_job_unschedulable
> calls into drm_sched_entity_add_dependency_cb where they can be
> done earlier. The former option is the more correct one because with
> the latter we might emit the event and still be able to schedule the
> job if the fence is signaled in-between. Despite that, I've
> implemented the latter, since it's a bit simpler and the extra event
> is not a deal breaker for tools anyway.
> 
> Fixes: 76d97c870f29 (drm/sched: Trace dependencies for GPU jobs)
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 5635b3a826d8..a23b204cac5c 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -401,7 +401,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>    * Add a callback to the current dependency of the entity to wake up the
>    * scheduler when the entity becomes available.
>    */
> -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
> +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity,
> +					       struct drm_sched_job *sched_job)
>   {
>   	struct drm_gpu_scheduler *sched = entity->rq->sched;
>   	struct dma_fence *fence = entity->dependency;
> @@ -429,6 +430,11 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   		fence = dma_fence_get(&s_fence->scheduled);
>   		dma_fence_put(entity->dependency);
>   		entity->dependency = fence;
> +
> +		if (trace_drm_sched_job_unschedulable_enabled() &&
> +		    !dma_fence_is_signaled(fence))
> +			trace_drm_sched_job_unschedulable(sched_job, fence);
> +
>   		if (!dma_fence_add_callback(fence, &entity->cb,
>   					    drm_sched_entity_clear_dep))

Would placing it here be simpler, like this:

--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -430,8 +430,10 @@ static bool 
drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
                 dma_fence_put(entity->dependency);
                 entity->dependency = fence;
                 if (!dma_fence_add_callback(fence, &entity->cb,
-                                           drm_sched_entity_clear_dep))
+                                           drm_sched_entity_clear_dep)) {
+                       trace_drm_sched_job_unschedulable(sched_job, fence);
                         return true;
+               }

                 /* Ignore it when it is already scheduled */
                 dma_fence_put(fence);

Both sched_job and fence references are held on this path (effectively 
for sched_job), so it is safe from that point of view. Makes the "is 
signaled" check not needed because dma_fence_add_callback() told us so. 
And trace_drm_sched_job_unschedulable_enabled() is then not needed too.

>   			return true;
> @@ -438,6 +444,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   		return false;
>   	}
>   
> +	if (trace_drm_sched_job_unschedulable_enabled() &&
> +	    !dma_fence_is_signaled(entity->dependency))
> +		trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
> +
>   	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
>   				    drm_sched_entity_wakeup))

For this path the same thing, since entity->dependency reference is also 
held (taken in drm_sched_job_dependency() and released two lines below 
this hunk).

Regards,

Tvrtko

>   		return true;
> @@ -478,10 +488,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   
>   	while ((entity->dependency =
>   			drm_sched_job_dependency(sched_job, entity))) {
> -		if (drm_sched_entity_add_dependency_cb(entity)) {
> -			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
> +		if (drm_sched_entity_add_dependency_cb(entity, sched_job))
>   			return NULL;
> -		}
>   	}
>   
>   	/* skip jobs from entity that marked guilty */

