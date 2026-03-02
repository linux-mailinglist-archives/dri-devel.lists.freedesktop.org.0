Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOLvKeerpWmpDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:25:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E826F1DBC6A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDE810E522;
	Mon,  2 Mar 2026 15:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="OjWcn6vK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9558810E522
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:25:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso31982165e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772465122; x=1773069922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+2ah/ixbAU4QGEREsYn+BhbPbrQH9g+qI8tzdOSG8e0=;
 b=OjWcn6vKVYlcnSbKYTxoavKz+pZ3y+q8uVDXVd4kpUPWg4u2xMJ8pmh/QHiEn+uDIk
 xJFES7yAvwM1hH8Ay54BPB27wrbiD0JozytjKqSRF+bMOtbPYCapufW/guH7Wb3pMnkQ
 xDQSI+yNG+Z7nGLXRq5CXMei0z4AMpo8uFo5LrdV46CaqEQRi7WifYFetJuWm5dMcxf7
 FqXsSGA3RZkfbVupYSr1YWeHD256Cl+Zy94KG0rt2gUthwYIuWaVIQOxcFmSoVQCjsGv
 COE9zReQDk8ypsHfNDzu+QVI7vPMv2Y5wOrdCNWc1YnSz/x81Gv00um/IOeuol7N3IzS
 P5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772465122; x=1773069922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+2ah/ixbAU4QGEREsYn+BhbPbrQH9g+qI8tzdOSG8e0=;
 b=RKMjJDOgUjauwvUb4AfAo65h3fYemdWtICQgcqYEKBvhszmyZOVH3sEhYzqbIFXi9V
 VudWtQFhyxz3eZzKaBN+UXQStXY9XWGtcJCGL8GV0bquBUkaXtVmDloxR/8K2gCnzv+T
 JyP86kFMtvOhL869Ihk1nl9Hc6ZZxuJ6e3mj+C36u8HcyN0fYedOHg7sVKJsUn2meo7/
 J6G4zS2psZUsxyAEgVwepflP/bDrkt0MVcl4Enrqiqpozlaapn1aqmX5x2kmXZHZFFLz
 Ne/Zd4HMrKMv4kSVYaIiOZmpoe1CM3wST/NLzwdN4v7dWKXJnML9vStZypf9quv4tPyd
 N1tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO9zpQ5x8dJabLUdzjpreCSgQquB21kcUje7rdGd13tVtAL44igIhk0hGSteI2z/dQ8A6TvUP7CHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWOXFa59eteiG5XehYzUvevEWZ5Is6bo3xYlBvnzgxufiZhckv
 V8qMK00pg0BpvEQVrMBxXRtNwKV1EXI9Lr5kM14j2mRecNrs0kJ2LkrW1LCG+rcV8E4=
X-Gm-Gg: ATEYQzxrWKIXZbYJ6DrA28I6D9xeXmxXtcNKjGIuAwLvIrjAnra3xo16ljFVt+lTcO7
 dCcW7Cdvce0Rt7xTmO8Rs8Zn/vIvRbn96Hicb+NMm3WDd12DVvfLXIAju+wOY6aO4uiNoEeKJq9
 YDCbYMDWsVeQ6qYENvVyWL3P9yeTUi+dj5JsyWjvRr4v7IeWu9ltaYsVoxHaY5M47RiBAibZTra
 JJUwWCYB3bJuDa3Oeg+vJCMmCbQ+GMxgklB+UTPt/8VtXZJql4gfkZUG0qsaQjZVagSWjwVtxj3
 06/PgSzcncsdZQNmPRkAmcBJe1y/fdsF8TS89wLj9euLmPDS4OzH3KPaanSwSkecMw9zeHbB3ow
 3Clcgq71It1fPMU6v96ToMzZbFvDTv8eokx0NrSfH0bqNJbxzUoJT/vp3YL6+BMxa1T1c+8BP5r
 rTuNyjwYRKFUX0W5jS5TacfwmyNx1oaArq1i44jwbD2he+
X-Received: by 2002:a05:600c:c16e:b0:475:ddad:c3a9 with SMTP id
 5b1f17b1804b1-483c99348c5mr226517205e9.13.1772465121744; 
 Mon, 02 Mar 2026 07:25:21 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf673sm164562955e9.19.2026.03.02.07.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 07:25:21 -0800 (PST)
Message-ID: <ff49aade-ba31-43d2-b057-f5af56dd672b@ursulin.net>
Date: Mon, 2 Mar 2026 15:25:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/ttm: Split cgroup charge and resource
 allocation
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
 <20260302-dmemcg-aggressive-protect-v5-4-ffd3a2602309@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260302-dmemcg-aggressive-protect-v5-4-ffd3a2602309@gmx.de>
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
X-Rspamd-Queue-Id: E826F1DBC6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmx.de,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ursulin.net:dkim,ursulin.net:mid,gmx.de:email]
X-Rspamd-Action: no action


On 02/03/2026 12:37, Natalie Vock wrote:
> Coupling resource allocation and cgroup charging is racy when charging
> succeeds, but subsequent resource allocation fails. Certain eviction
> decisions are made on the basis of whether the allocating cgroup is
> protected, i.e. within its min/low limits, but with the charge being
> tied to resource allocation (and uncharged when the resource allocation
> fails), this check is done at a point where the allocation is not actually
> charged to the cgroup.
> 
> This is subtly wrong if the allocation were to cause the cgroup to exceed
> the min/low protection, but it's even more wrong if the same cgroup tries
> allocating multiple buffers concurrently: In this case, the min/low
> protection may pass for all allocation attempts when the real min/low
> protection covers only some, or potentially none of the allocated
> buffers.
> 
> Instead, charge the allocation to the cgroup once and keep the charge
> for as long as we try to allocate a ttm_resource, and only undo the charge
> if allocating the resource is ultimately unsuccessful and we move on to
> a different ttm_place.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       | 45 +++++++++++++++++++++++++----------
>   drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++++++-----------
>   include/drm/ttm/ttm_resource.h     |  6 ++++-
>   3 files changed, 73 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3e62cab51f870..53c4de4bcc1e3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -490,6 +490,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
>   }
>   
>   struct ttm_bo_alloc_state {
> +	/** @charge_pool: The memory pool the resource is charged to */
> +	struct dmem_cgroup_pool_state *charge_pool;
>   	/** @limit_pool: Which pool limit we should test against */
>   	struct dmem_cgroup_pool_state *limit_pool;
>   };
> @@ -544,9 +546,17 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>   		goto out;
>   
>   	evict_walk->evicted++;
> +	if (!evict_walk->alloc_state->charge_pool) {
> +		lret = ttm_resource_try_charge(bo, evict_walk->place,
> +					       &evict_walk->alloc_state->charge_pool, NULL);

Right, this is if charging against the 1st attempted placement failed. 
It is a bit sub-optimal that the two placec doing the charge is split 
like this.

Would it work to use ttm_bo_alloc_at_place() here as well?

Regards,

Tvrtko

> +		if (lret == -EAGAIN)
> +			return -EBUSY;
> +		else if (lret)
> +			return lret;
> +	}
>   	if (evict_walk->res)
>   		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> -					  evict_walk->res, NULL);
> +					  evict_walk->res, evict_walk->alloc_state->charge_pool);
>   	if (lret == 0)
>   		return 1;
>   out:
> @@ -724,10 +734,8 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>   	int ret;
>   
>   	may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> -
> -	ret = ttm_resource_alloc(bo, place, res,
> -				 force_space ? &alloc_state->limit_pool : NULL);
> -
> +	ret = ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
> +				      force_space ? &alloc_state->limit_pool : NULL);
>   	if (ret) {
>   		/*
>   		 * -EAGAIN means the charge failed, which we treat like an
> @@ -737,14 +745,22 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>   		 * attempt.
>   		 */
>   		if (ret == -EAGAIN)
> -			return may_evict ? -EBUSY : -ENOSPC;
> +			ret = may_evict ? -EBUSY : -ENOSPC;
> +		return ret;
> +	}
>   
> +	ret = ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
> +	if (ret) {
>   		if (ret == -ENOSPC && may_evict)
> -			return -EBUSY;
> -
> +			ret = -EBUSY;
>   		return ret;
>   	}
>   
> +	/*
> +	 * Ownership of charge_pool has been transferred to the TTM resource,
> +	 * don't make the caller think we still hold a reference to it.
> +	 */
> +	alloc_state->charge_pool = NULL;
>   	return 0;
>   }
>   
> @@ -799,6 +815,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   				res, &alloc_state);
>   
>   		if (ret == -ENOSPC) {
> +			dmem_cgroup_uncharge(alloc_state.charge_pool, bo->base.size);
>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>   			continue;
>   		} else if (ret == -EBUSY) {
> @@ -807,11 +824,15 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   
>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>   
> -			if (ret == -EBUSY)
> -				continue;
> -			else if (ret)
> -				return;
> +			if (ret) {
> +				dmem_cgroup_uncharge(alloc_state.charge_pool,
> +						bo->base.size);
> +				if (ret == -EBUSY)
> +					continue;
> +				return ret;
> +			}
>   		} else if (ret) {
> +			dmem_cgroup_uncharge(alloc_state.charge_pool, bo->base.size);
>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>   			return ret;
>   		}
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 192fca24f37e4..a8a836f6e376a 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -373,30 +373,52 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>   }
>   EXPORT_SYMBOL(ttm_resource_fini);
>   
> +/**
> + * ttm_resource_try_charge - charge a resource manager's cgroup pool
> + * @bo: buffer for which an allocation should be charged
> + * @place: where the allocation is attempted to be placed
> + * @ret_pool: on charge success, the pool that was charged
> + * @ret_limit_pool: on charge failure, the pool responsible for the failure
> + *
> + * Should be used to charge cgroups before attempting resource allocation.
> + * When charging succeeds, the value of ret_pool should be passed to
> + * ttm_resource_alloc.
> + *
> + * Returns: 0 on charge success, negative errno on failure.
> + */
> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
> +			    const struct ttm_place *place,
> +			    struct dmem_cgroup_pool_state **ret_pool,
> +			    struct dmem_cgroup_pool_state **ret_limit_pool)
> +{
> +	struct ttm_resource_manager *man =
> +		ttm_manager_type(bo->bdev, place->mem_type);
> +
> +	if (!man->cg) {
> +		*ret_pool = NULL;
> +		if (ret_limit_pool)
> +			*ret_limit_pool = NULL;
> +		return 0;
> +	}
> +
> +	return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
> +				      ret_limit_pool);
> +}
> +
>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res_ptr,
> -		       struct dmem_cgroup_pool_state **ret_limit_pool)
> +		       struct dmem_cgroup_pool_state *charge_pool)
>   {
>   	struct ttm_resource_manager *man =
>   		ttm_manager_type(bo->bdev, place->mem_type);
> -	struct dmem_cgroup_pool_state *pool = NULL;
>   	int ret;
>   
> -	if (man->cg) {
> -		ret = dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, ret_limit_pool);
> -		if (ret)
> -			return ret;
> -	}
> -
>   	ret = man->func->alloc(man, bo, place, res_ptr);
> -	if (ret) {
> -		if (pool)
> -			dmem_cgroup_uncharge(pool, bo->base.size);
> +	if (ret)
>   		return ret;
> -	}
>   
> -	(*res_ptr)->css = pool;
> +	(*res_ptr)->css = charge_pool;
>   
>   	spin_lock(&bo->bdev->lru_lock);
>   	ttm_resource_add_bulk_move(*res_ptr, bo);
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 33e80f30b8b82..549b5b796884d 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -456,10 +456,14 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   void ttm_resource_fini(struct ttm_resource_manager *man,
>   		       struct ttm_resource *res);
>   
> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
> +			    const struct ttm_place *place,
> +			    struct dmem_cgroup_pool_state **ret_pool,
> +			    struct dmem_cgroup_pool_state **ret_limit_pool);
>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   		       const struct ttm_place *place,
>   		       struct ttm_resource **res,
> -		       struct dmem_cgroup_pool_state **ret_limit_pool);
> +		       struct dmem_cgroup_pool_state *charge_pool);
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
>   bool ttm_resource_intersects(struct ttm_device *bdev,
>   			     struct ttm_resource *res,
> 

