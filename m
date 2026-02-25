Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LsnJWsWn2nWYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:34:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB297199AEA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A8510E366;
	Wed, 25 Feb 2026 15:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="KSlgRnLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C782110E366
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:33:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43638a33157so6337290f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 07:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772033637; x=1772638437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cRoBJ5wBmIwmVhoK9FjJRI7xDRFw7wcPEg9WE+yquRI=;
 b=KSlgRnLlVPXTTGElOJvsKDbprEq3nR5xsrq++7TND6rXMqT8BNXfe3Z4clD9+71kk2
 dGWwsK25Ss0QfZPuc3c3I2q0Zj/8lBlHBenOiptmuJdA0AK+zp4hCWyP33EUS7W7zW1O
 0OdkuMl1RcxK9/TYDnx31uFkV/LKX/Gymy6p9PixslBjfvoYjlnC89jCWtHO9ABLcNok
 9+2fQCKWPIehyIJ7v7Crjw8OtEPFQTgdQn7XU42JqZhAGVX1Adak9Dju5+Mz8IZF0Zvx
 M6ZfZFAvhawoj5wEmez0xgkXjPGofXWlpj+Zbxu2Fm3AFsXnSJxG2GQDC/ohucgoVz5U
 95eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772033637; x=1772638437;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRoBJ5wBmIwmVhoK9FjJRI7xDRFw7wcPEg9WE+yquRI=;
 b=eZv5iB1dzQoX85Mj3vLHAymrEBIUIx0RAHbxO8bQJfK8SaDbJDDkaG+gv0v6oVidAx
 yU83QBveI7r2zVfE8eLSjepY4z46ijVL3x2tNiuZJWvPXrm6K15dkBYIka0Q0r87HbSG
 a+/bza3rz6+Qz/HArWKCqsjE38xoe+n68wsXDWBnW0fQjywzj950JxiyADvsxybarbRl
 1uXf3YmNETwwkhr4ZsxpaF4q1z7k6x3pUa8g5Gx0F1ejNPlu1Blt09PsH/Vw54yTF/SN
 QTphEf1jJ2kS57Mldab4/hAqklu/4kinNzN7dF09t5su8lhiThp5mwXLbWZLu6fs2QPm
 OSlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1e3ZYtkwmU4X4uG3g/e5T8Y8gGJFH/xH6JsRneXRDKofCst79ixwwHMu9oLI7YWesGF5O8oljkFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqOr3fIyZJJbVzYMvbIBl1cfMb3hRyCWMT6M7JW5KxvQfFgyKC
 emz6p0MrXhuRhc4xl70NBBy6g1jQJjVj/Y5zDNRMjG9SsOzBdXtYySrtpjygG7Zi1P0=
X-Gm-Gg: ATEYQzxJnpAE/ySfnh94c8uVy4MeVt30j2/or7XLafMTRyGHosEA6YIz3DXcnkrKlCQ
 ooMSJT52xsxhizcEd/+nNhmXItC4Cv9hHWACyff+1HhJHyJYL0JLKvfieV/uJ5MMT4aJC2ggIty
 gFj3M34/NdI5F/2rJtZtWu12E2AbTRhlYsDmmGpQL92GNIgrau1LC7XotAw8qFvByO+dsMkmlQY
 NIiUlGhXokmwsig92R4lMOzMtO08obkiX5VGlu/JkvntEdFI+RD7EPH/XHPf+p9BStIy+8sVM+j
 s6UFlbWUeHIcuk6gdiDKv0Y9JkreliHn641LJidGp2Z2n7Cj6jn9v+CFzKS6uW6mIYIpva43gS1
 uAYOv+s+zRxQQm75s/bQF3dDsIThvPMD0dsOSDUzwBZlRLCyXrf6h20CH+Rc4fgZSzmYtMEd1+x
 2r55alremZn8K7ZSonpcy2yRzPKO1aRbvrQFAXG8vMuHf/EDbgeml89QI=
X-Received: by 2002:a05:6000:1acc:b0:439:8bb9:dae2 with SMTP id
 ffacd0b85a97d-4398bb9df45mr10015275f8f.4.1772033637108; 
 Wed, 25 Feb 2026 07:33:57 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4c60bsm33910443f8f.27.2026.02.25.07.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 07:33:56 -0800 (PST)
Message-ID: <9f726505-cce3-430a-8d16-fd9695dc4577@ursulin.net>
Date: Wed, 25 Feb 2026 15:33:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/ttm: Split cgroup charge and resource
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
References: <20260225-dmemcg-aggressive-protect-v4-0-de847ab35184@gmx.de>
 <20260225-dmemcg-aggressive-protect-v4-4-de847ab35184@gmx.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260225-dmemcg-aggressive-protect-v4-4-de847ab35184@gmx.de>
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
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DB297199AEA
X-Rspamd-Action: no action


On 25/02/2026 12:10, Natalie Vock wrote:
> Coupling resource allocation and cgroup charging is racy when charging
> succeeds, but subsequent resource allocation fails. Certain eviction
> decisions are made on the basis of whether the allocating cgroup is
> protected, i.e. within its min/low limits, but with the charge being
> tied to resource allocation (and uncharged when the resource allocation
> fails), this check is done at a poin where the allocation is not actually

s/poin/point/

> charged to the cgroup.
> 
> This is subtly wrong if the allocation were to cause the cgroup to exceed
> the min/low protection, but it's even more wrong if the same cgroup tries
> allocating multiple buffers concurrently: In this case, the min/low
> protection may pass for all allocation attempts when the real min/low
> protection covers only some, or potentially none of the allocated
> buffers.

Interesting! Do I understand correctly this would be a scenario with 
multi-threaded buffer allocation or there is another path to it?

In any case moving the charge to before allocation makes sense to me. 
With a caveat that I wasn't involved in the dmem cgroup controller 
design so may be missing something.

> Instead, charge the allocation to the cgroup once and keep the charge
> for as long as we try to allocate a ttm_resource, and only undo the charge
> if allocating the resource is ultimately unsuccessful and we move on to
> a different ttm_place.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       | 28 +++++++++++++++-------
>   drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++++++-----------
>   include/drm/ttm/ttm_resource.h     |  6 ++++-
>   3 files changed, 60 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 48dbaaa46824c..a8914d20b0c32 100644
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
> @@ -546,7 +548,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>   	evict_walk->evicted++;
>   	if (evict_walk->res)
>   		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> -					  evict_walk->res, NULL);
> +					  evict_walk->res, evict_walk->alloc_state->charge_pool);
>   	if (lret == 0)
>   		return 1;
>   out:
> @@ -724,10 +726,8 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
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
> @@ -737,14 +737,23 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
>   		 * attempt.
>   		 */
>   		if (ret == -EAGAIN)
> -			return may_evict ? -EBUSY : -ENOSPC;
> +			ret = may_evict ? -EBUSY : -ENOSPC;
> +		return ret;
> +	}
>   
> -		if (ret == -ENOSPC && may_evict)
> -			return -EBUSY;
> +	ret = ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
>   

No need for a blank line here.

> +	if (ret) {
> +		if (ret == -ENOSPC && may_evict)
> +			ret = -EBUSY;

Why did you remove EAGAIN handling from after ttm_resource_alloc()?

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
> @@ -799,6 +808,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   				res, &alloc_state);
>   
>   		if (ret == -ENOSPC) {
> +			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>   			continue;
>   		} else if (ret == -EBUSY) {
> @@ -808,11 +818,13 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>   
>   			if (ret) {
> +				dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>   				if (ret != -EBUSY)
>   					return ret;
>   				continue;
>   			}
>   		} else if (ret) {
> +			dmem_cgroup_pool_state_put(alloc_state.charge_pool);

Is uncharge in the failure case hidden in dmem_cgroup_pool_state_put() 
somehow?

Regards,

Tvrtko

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

