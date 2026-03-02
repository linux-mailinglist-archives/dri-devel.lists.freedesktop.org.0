Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDeqFiWopWngCwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:09:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B91DB7C1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687FD89153;
	Mon,  2 Mar 2026 15:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XjIrwnx5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269A789153
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diqmFZJoieYJw79Zu0FyzOxk6KbsVjc/pkMqJvLgG2I=; b=XjIrwnx55exUbIhDFQLw6OJxA5
 3cwkhAvTER77dbY1nwKoNHYz4CBO1Hcx68rirfvUpGwt8mgzJR5tnBazdrc2gbIRYf2tYnaq6+zKP
 +VYMeg7h/nzhQa2fK6UGnUJRF5mprDLIZgDVfLMJGF4SsuZn8WZ0ANaWgsyZeIuwvepzP6bKHTd7n
 CO84afoMG8yv4w47qj/Z5CS+Li+4AM+pM3Gu5Zx5EF9swjzZ3CvWbyXv+gIMfV+or6T1YewocmgwM
 bSHTTBJMQtDCLHkeXCLIKEibrP0uxUHI4RGlboz6u3qY9+TMCe0wDxO2MPDPHORmA6Aii4ONfDoG3
 RN0q+Oqw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vx4tA-007wTQ-1O; Mon, 02 Mar 2026 16:08:52 +0100
Message-ID: <777db230-9fd8-4c2f-87bf-75d9733eaf88@igalia.com>
Date: Mon, 2 Mar 2026 15:08:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/ttm: Extract code for attempting allocation in
 a place
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
 <20260302-dmemcg-aggressive-protect-v5-3-ffd3a2602309@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260302-dmemcg-aggressive-protect-v5-3-ffd3a2602309@gmx.de>
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
X-Rspamd-Queue-Id: A23B91DB7C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.844];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email,gmx.de:email]
X-Rspamd-Action: no action


On 02/03/2026 12:37, Natalie Vock wrote:
> Move all code for attempting allocation for a specific place to
> ttm_bo_alloc_place. With subsequent patches, this logic is going to get
> more complicated, so it helps readability to have this separate.
> 
> ttm_bo_alloc_at_place takes a pointer to a struct ttm_bo_alloc_state.
> This struct holds various state produced by the allocation (e.g. cgroup
> resource associated with the allocation) that the caller needs to keep
> track of (and potentially dispose of). This is just the limiting cgroup
> pool for now, but future patches will add more state needing to be tracked.
> 
> ttm_bo_alloc_at_place also communicates via return codes if eviction
> using ttm_bo_evict_alloc should be attempted. This is preparation for
> attempting eviction in more cases than just force_space being set.
> 
> No functional change intended.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 104 +++++++++++++++++++++++++++++++++----------
>   1 file changed, 81 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index acb9197db8798..3e62cab51f870 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -489,6 +489,11 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
>   	return ret;
>   }
>   
> +struct ttm_bo_alloc_state {
> +	/** @limit_pool: Which pool limit we should test against */
> +	struct dmem_cgroup_pool_state *limit_pool;
> +};
> +
>   /**
>    * struct ttm_bo_evict_walk - Parameters for the evict walk.
>    */
> @@ -504,12 +509,13 @@ struct ttm_bo_evict_walk {
>   	/** @evicted: Number of successful evictions. */
>   	unsigned long evicted;
>   
> -	/** @limit_pool: Which pool limit we should test against */
> -	struct dmem_cgroup_pool_state *limit_pool;
>   	/** @try_low: Whether we should attempt to evict BO's with low watermark threshold */
>   	bool try_low;
>   	/** @hit_low: If we cannot evict a bo when @try_low is false (first pass) */
>   	bool hit_low;
> +
> +	/** @alloc_state: State associated with the allocation attempt. */
> +	struct ttm_bo_alloc_state *alloc_state;
>   };
>   
>   static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
> @@ -518,8 +524,9 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>   		container_of(walk, typeof(*evict_walk), walk);
>   	s64 lret;
>   
> -	if (!dmem_cgroup_state_evict_valuable(evict_walk->limit_pool, bo->resource->css,
> -					      evict_walk->try_low, &evict_walk->hit_low))
> +	if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state->limit_pool,
> +					      bo->resource->css, evict_walk->try_low,
> +					      &evict_walk->hit_low))
>   		return 0;
>   
>   	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_walk->place))
> @@ -561,7 +568,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>   			      struct ttm_operation_ctx *ctx,
>   			      struct ww_acquire_ctx *ticket,
>   			      struct ttm_resource **res,
> -			      struct dmem_cgroup_pool_state *limit_pool)
> +			      struct ttm_bo_alloc_state *state)
>   {
>   	struct ttm_bo_evict_walk evict_walk = {
>   		.walk = {
> @@ -574,7 +581,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bdev,
>   		.place = place,
>   		.evictor = evictor,
>   		.res = res,
> -		.limit_pool = limit_pool,
> +		.alloc_state = state,
>   	};
>   	s64 lret;
>   
> @@ -689,6 +696,58 @@ static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
>   	return dma_resv_reserve_fences(bo->base.resv, 1);
>   }
>   
> +
> +/**
> + * ttm_bo_alloc_at_place - Attempt allocating a BO's backing store in a place
> + *
> + * @bo: The buffer to allocate the backing store of
> + * @place: The place to attempt allocation in
> + * @ctx: ttm_operation_ctx associated with this allocation
> + * @force_space: If we should evict buffers to force space
> + * @res: On allocation success, the resulting struct ttm_resource.
> + * @alloc_state: Object holding allocation state such as charged cgroups.
> + *
> + * Returns:
> + * -EBUSY: No space available, but allocation should be retried with ttm_bo_evict_alloc.
> + * -ENOSPC: No space available, allocation should not be retried.
> + * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
> + *
> + */
> +static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
> +				 const struct ttm_place *place,
> +				 struct ttm_operation_ctx *ctx,
> +				 bool force_space,
> +				 struct ttm_resource **res,
> +				 struct ttm_bo_alloc_state *alloc_state)
> +{
> +	bool may_evict;
> +	int ret;
> +
> +	may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> +
> +	ret = ttm_resource_alloc(bo, place, res,
> +				 force_space ? &alloc_state->limit_pool : NULL);
> +
> +	if (ret) {
> +		/*
> +		 * -EAGAIN means the charge failed, which we treat like an
> +		 * allocation failure. Therefore, return an error code indicating
> +		 * the allocation failed - either -EBUSY if the allocation should
> +		 * be retried with eviction, or -ENOSPC if there should be no second
> +		 * attempt.
> +		 */
> +		if (ret == -EAGAIN)
> +			return may_evict ? -EBUSY : -ENOSPC;
> +
> +		if (ret == -ENOSPC && may_evict)
> +			return -EBUSY;
> +
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * ttm_bo_alloc_resource - Allocate backing store for a BO
>    *
> @@ -725,9 +784,8 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   
>   	for (i = 0; i < placement->num_placement; ++i) {
>   		const struct ttm_place *place = &placement->placement[i];
> -		struct dmem_cgroup_pool_state *limit_pool = NULL;
> +		struct ttm_bo_alloc_state alloc_state = {};
>   		struct ttm_resource_manager *man;
> -		bool may_evict;
>   
>   		man = ttm_manager_type(bdev, place->mem_type);
>   		if (!man || !ttm_resource_manager_used(man))
> @@ -737,25 +795,25 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   				    TTM_PL_FLAG_FALLBACK))
>   			continue;
>   
> -		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> -		ret = ttm_resource_alloc(bo, place, res, force_space ? &limit_pool : NULL);
> -		if (ret) {
> -			if (ret != -ENOSPC && ret != -EAGAIN) {
> -				dmem_cgroup_pool_state_put(limit_pool);
> -				return ret;
> -			}
> -			if (!may_evict) {
> -				dmem_cgroup_pool_state_put(limit_pool);
> -				continue;
> -			}
> +		ret = ttm_bo_alloc_at_place(bo, place, ctx, force_space,
> +				res, &alloc_state);
>   
> +		if (ret == -ENOSPC) {
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +			continue;
> +		} else if (ret == -EBUSY) {
>   			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
> -						 ticket, res, limit_pool);
> -			dmem_cgroup_pool_state_put(limit_pool);
> +						 ticket, res, &alloc_state);
> +
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +
>   			if (ret == -EBUSY)
>   				continue;
> -			if (ret)
> -				return ret;
> +			else if (ret)
> +				return;

return ret;

Regards,

Tvrtko

> +		} else if (ret) {
> +			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
> +			return ret;
>   		}
>   
>   		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
> 

