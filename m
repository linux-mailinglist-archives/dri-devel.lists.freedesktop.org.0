Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F4C0A85F
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 13:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39310E062;
	Sun, 26 Oct 2025 12:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="ZYv1kfvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9865D10E062
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1761483378; x=1762088178; i=natalie.vock@gmx.de;
 bh=b9pOLJD8s2D1NEIJCyFpXAgrTZKXeobbnooSip1UEzc=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZYv1kfvC78ccAh94JJZuS0UiaQ23qJSUQjmEWIZ+Bb9nqoOTwt9IGhYt1rTOe7IA
 R7qJg8Pq5MA741qpNrsq6mFYwxRMd2NNGLRGhwoR8ftfW+CNG6j34Hi1ml/rVB1Tp
 W9nIOrYjvyNeqITb4WUiNkJVQw6dEIkpLP/qwPEAn0trbuTn/v6DJ9DDEM30cU+an
 i3p6SXBAtr56awfwVb2M1t226GMvgNl0GUbUV9FW5a1Ao33dxTor5g+sGhiWzcvV+
 VciEPI7bORdu8U6fz501RBslbOm/uwoZU9o53XgShFIdn103oDp+75xM4vRAzn+uJ
 JMY7edtj/fChWImi6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.91.201.165]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1uGtvS04BQ-00smwy; Sun, 26
 Oct 2025 13:56:18 +0100
Message-ID: <bb112ec0-e920-4f23-9bb8-16b591eae128@gmx.de>
Date: Sun, 26 Oct 2025 13:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/ttm: Be more aggressive when allocating below
 protection limit
To: Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
 <20251015-dmemcg-aggressive-protect-v2-4-36644fb4e37f@gmx.de>
 <1ebc018f-fee0-4813-8e2e-7a704d3334b0@lankhorst.se>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <1ebc018f-fee0-4813-8e2e-7a704d3334b0@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xqoCqlL5agbLgr2mY0SY4z5gPs1TCgFEhr4e0urgBt1mw+RzAWH
 vA2ucUYxkEivtE566WXw6SGOR0WLgVZJJIRvRJwWMnZN2013khCF7W4z4AM2hS+j7xm9Ru5
 2nUXpgoMG0iYxkPzqe5Faz9LmmM2ZyYn7joMjQhSdIQcIA1wc2YgVsuQ91HOvE+E25J3fs7
 WDCZcKmkYZatqecKpA75A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:49hikTeLkB0=;XxnU9XNN7nX/bYTp78vpdFf9HeW
 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
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

Hi,

On 10/24/25 14:14, Maarten Lankhorst wrote:
> Hey,
>=20
> Den 2025-10-15 kl. 15:57, skrev Natalie Vock:
>> When the cgroup's memory usage is below the low/min limit and allocatio=
n
>> fails, try evicting some unprotected buffers to make space. Otherwise,
>> application buffers may be forced to go into GTT even though usage is
>> below the corresponding low/min limit, if other applications filled VRA=
M
>> with their allocations first.
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c       | 43 ++++++++++++++++++++++++++++-=
=2D----
>>   drivers/gpu/drm/ttm/ttm_resource.c | 48 +++++++++++++++++++++++++++--=
=2D--------
>>   include/drm/ttm/ttm_resource.h     |  6 ++++-
>>   3 files changed, 76 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
>> index 829d99479883594f8be5b9ceed4cc53c4864ace5..7f7872ab2090cc8db188e08=
ddfdcd12fe924f743 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -490,8 +490,12 @@ int ttm_bo_evict_first(struct ttm_device *bdev, st=
ruct ttm_resource_manager *man
>>   }
>>  =20
>>   struct ttm_bo_alloc_state {
>> +	/** @charge_pool: The memory pool the resource is charged to */
>> +	struct dmem_cgroup_pool_state *charge_pool;
>>   	/** @limit_pool: Which pool limit we should test against */
>>   	struct dmem_cgroup_pool_state *limit_pool;
>> +	/** @only_evict_unprotected: If eviction should be restricted to unpr=
otected BOs */
>> +	bool only_evict_unprotected;
> I'm not entirely sure we should put 'low' and 'min' limits together here=
.

I think putting 'low' and 'min' together here is accurate. When the=20
allocation is covered by the 'low' limit, but not the 'min' limit, we=20
should evict only allocations that are covered by neither (which is what=
=20
this flag controls).

However maybe we should allow evicting allocations covered by 'low' when=
=20
the new allocation is covered by 'min' in ttm_resource_alloc_at_place=20
down below (because 'min' is a stronger guarantee). We could do this=20
simply by setting 'only_evict_unprotected' to false, since memory=20
covered by 'min' can never get evicted anyway.

>>   };
>>  =20
>>   /**
>> @@ -546,7 +550,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *wal=
k, struct ttm_buffer_object *
>>   	evict_walk->evicted++;
>>   	if (evict_walk->res)
>>   		lret =3D ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
>> -					  evict_walk->res, NULL);
>> +					  evict_walk->res, evict_walk->alloc_state->charge_pool);
>>   	if (lret =3D=3D 0)
>>   		return 1;
>>   out:
>> @@ -589,7 +593,7 @@ static int ttm_bo_evict_alloc(struct ttm_device *bd=
ev,
>>   	lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>>  =20
>>   	/* One more attempt if we hit low limit? */
>> -	if (!lret && evict_walk.hit_low) {
>> +	if (!lret && evict_walk.hit_low && !state->only_evict_unprotected) {
>>   		evict_walk.try_low =3D true;
>>   		lret =3D ttm_lru_walk_for_evict(&evict_walk.walk, bdev, man, 1);
>>   	}
>> @@ -610,7 +614,8 @@ static int ttm_bo_evict_alloc(struct ttm_device *bd=
ev,
>>   	} while (!lret && evict_walk.evicted);
>>  =20
>>   	/* We hit the low limit? Try once more */
>> -	if (!lret && evict_walk.hit_low && !evict_walk.try_low) {
>> +	if (!lret && evict_walk.hit_low && !evict_walk.try_low &&
>> +			!state->only_evict_unprotected) {
>>   		evict_walk.try_low =3D true;
>>   		goto retry;
>>   	}
>> @@ -719,20 +724,40 @@ static int ttm_bo_alloc_at_place(struct ttm_buffe=
r_object *bo,
>>   				 struct ttm_resource **res,
>>   				 struct ttm_bo_alloc_state *alloc_state)
>>   {
>> -	bool may_evict;
>> +	bool may_evict, is_protected =3D false;
>>   	int ret;
>>  =20
>>   	may_evict =3D (force_space && place->mem_type !=3D TTM_PL_SYSTEM);
>> +	ret =3D ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
>> +				      force_space ? &alloc_state->limit_pool : NULL);
>> +	if (ret) {
>> +		/*
>> +		 * -EAGAIN means the charge failed, which we treat like an
>> +		 * allocation failure. Allocation failures are indicated
>> +		 * by -ENOSPC, so return that instead.
>> +		 */
>> +		if (ret =3D=3D -EAGAIN && !may_evict)
>> +			ret =3D -ENOSPC;
>> +		return ret;
>> +	}
>>  =20
>> -	ret =3D ttm_resource_alloc(bo, place, res,
>> -				 force_space ? &alloc_state->limit_pool : NULL);
>> +	is_protected =3D dmem_cgroup_below_min(NULL, alloc_state->charge_pool=
) ||
>> +		       dmem_cgroup_below_low(NULL, alloc_state->charge_pool);
>> +	ret =3D ttm_resource_alloc(bo, place, res, alloc_state->charge_pool);
>> +	alloc_state->only_evict_unprotected =3D !may_evict && is_protected;
>=20
> This probably deserves a comment to explaing it's ok if we haven't hit l=
ow/min yet to evict from
> those cgroups that did those limits already. It took me a bit of time to=
 understand the idea.

Yeah, that's a bit non-obvious. I'll add a comment.

Thanks,
Natalie

>=20
>>  =20
>>   	if (ret) {
>> -		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) && may_evict)
>> +		if ((ret =3D=3D -ENOSPC || ret =3D=3D -EAGAIN) &&
>> +				(may_evict || is_protected))
>>   			ret =3D -EBUSY;
>>   		return ret;
>>   	}
>>  =20
>> +	/*
>> +	 * Ownership of charge_pool has been transferred to the TTM resource,
>> +	 * don't make the caller think we still hold a reference to it.
>> +	 */
>> +	alloc_state->charge_pool =3D NULL;
>>   	return 0;
>>   }
>>  =20
>> @@ -787,6 +812,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_=
object *bo,
>>   				res, &alloc_state);
>>  =20
>>   		if (ret =3D=3D -ENOSPC) {
>> +			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>   			continue;
>>   		} else if (ret =3D=3D -EBUSY) {
>> @@ -796,11 +822,14 @@ static int ttm_bo_alloc_resource(struct ttm_buffe=
r_object *bo,
>>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>  =20
>>   			if (ret) {
>> +				dmem_cgroup_pool_state_put(
>> +						alloc_state.charge_pool);
>>   				if (ret !=3D -ENOSPC && ret !=3D -EBUSY)
>>   					return ret;
>>   				continue;
>>   			}
>>   		} else if (ret) {
>> +			dmem_cgroup_pool_state_put(alloc_state.charge_pool);
>>   			dmem_cgroup_pool_state_put(alloc_state.limit_pool);
>>   			return ret;
>>   		}
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/t=
tm_resource.c
>> index e2c82ad07eb44b5e88bf5b5db1ef54dd6d27823b..fcfa8b51b033745f46a01e4=
0a9dc83e0c69165fc 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -372,30 +372,52 @@ void ttm_resource_fini(struct ttm_resource_manage=
r *man,
>>   }
>>   EXPORT_SYMBOL(ttm_resource_fini);
>>  =20
>> +/**
>> + * ttm_resource_try_charge - charge a resource manager's cgroup pool
>> + * @bo: buffer for which an allocation should be charged
>> + * @place: where the allocation is attempted to be placed
>> + * @ret_pool: on charge success, the pool that was charged
>> + * @ret_limit_pool: on charge failure, the pool responsible for the fa=
ilure
>> + *
>> + * Should be used to charge cgroups before attempting resource allocat=
ion.
>> + * When charging succeeds, the value of ret_pool should be passed to
>> + * ttm_resource_alloc.
>> + *
>> + * Returns: 0 on charge success, negative errno on failure.
>> + */
>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>> +			    const struct ttm_place *place,
>> +			    struct dmem_cgroup_pool_state **ret_pool,
>> +			    struct dmem_cgroup_pool_state **ret_limit_pool)
>> +{
>> +	struct ttm_resource_manager *man =3D
>> +		ttm_manager_type(bo->bdev, place->mem_type);
>> +
>> +	if (!man->cg) {
>> +		*ret_pool =3D NULL;
>> +		if (ret_limit_pool)
>> +			*ret_limit_pool =3D NULL;
>> +		return 0;
>> +	}
>> +
>> +	return dmem_cgroup_try_charge(man->cg, bo->base.size, ret_pool,
>> +				      ret_limit_pool);
>> +}
>> +
>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>   		       const struct ttm_place *place,
>>   		       struct ttm_resource **res_ptr,
>> -		       struct dmem_cgroup_pool_state **ret_limit_pool)
>> +		       struct dmem_cgroup_pool_state *charge_pool)
>>   {
>>   	struct ttm_resource_manager *man =3D
>>   		ttm_manager_type(bo->bdev, place->mem_type);
>> -	struct dmem_cgroup_pool_state *pool =3D NULL;
>>   	int ret;
>>  =20
>> -	if (man->cg) {
>> -		ret =3D dmem_cgroup_try_charge(man->cg, bo->base.size, &pool, ret_li=
mit_pool);
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>>   	ret =3D man->func->alloc(man, bo, place, res_ptr);
>> -	if (ret) {
>> -		if (pool)
>> -			dmem_cgroup_uncharge(pool, bo->base.size);
>> +	if (ret)
>>   		return ret;
>> -	}
>>  =20
>> -	(*res_ptr)->css =3D pool;
>> +	(*res_ptr)->css =3D charge_pool;
>>  =20
>>   	spin_lock(&bo->bdev->lru_lock);
>>   	ttm_resource_add_bulk_move(*res_ptr, bo);
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resou=
rce.h
>> index e52bba15012f78e352f392232ac2e89a83afd311..3aef7efdd7cfb8fd93071db=
85e632b975b53cf81 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -442,10 +442,14 @@ void ttm_resource_init(struct ttm_buffer_object *=
bo,
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>   		       struct ttm_resource *res);
>>  =20
>> +int ttm_resource_try_charge(struct ttm_buffer_object *bo,
>> +			    const struct ttm_place *place,
>> +			    struct dmem_cgroup_pool_state **ret_pool,
>> +			    struct dmem_cgroup_pool_state **ret_limit_pool);
>>   int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>   		       const struct ttm_place *place,
>>   		       struct ttm_resource **res,
>> -		       struct dmem_cgroup_pool_state **ret_limit_pool);
>> +		       struct dmem_cgroup_pool_state *charge_pool);
>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resou=
rce **res);
>>   bool ttm_resource_intersects(struct ttm_device *bdev,
>>   			     struct ttm_resource *res,
>>
>=20

