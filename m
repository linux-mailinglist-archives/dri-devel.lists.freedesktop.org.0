Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8DC46AAB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1410E270;
	Mon, 10 Nov 2025 12:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=natalie.vock@gmx.de header.b="VKLBs62C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5837110E270
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1762778594; x=1763383394; i=natalie.vock@gmx.de;
 bh=u0DlpRr1AG2ar9SFV6i2Rq3E/bZXeLQ0soFFn0kY0v0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VKLBs62C2SadTR/h5sNOBC6bfTahJcdz8fTna7HsPUyiXNZd90y8Tw9CaePVMmXm
 g8p2L2d8afBU7SAzM/7kAbkXeInVxFW0V7RQaAETCkJ4pOUDhwBzkS4FoeHsZlHC6
 DViwum6Tw4bWX++KnbJwchMubShoMEc2/Gqhr8buf4OrDy92VfyvZ9t5TOk40+TN3
 KFhjlP7+rAW8GDzyHTg2ifRr2EvOoraB25CDorl02llGv1E+KA9z6Vp8/Efu6If5p
 wE9sNNis0Jk8ruxjdGywa3b9E017EeeHaeoXyrP4Bqq48x0Ax5lFaSVSs4brXJFKf
 7Nx2daqtWosG7h+xZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.3] ([109.42.49.68]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgesQ-1vqMt40yya-00jBDw; Mon, 10
 Nov 2025 13:43:14 +0100
Message-ID: <6d19cedc-2e70-4371-9637-80460719c5b4@gmx.de>
Date: Mon, 10 Nov 2025 13:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/ttm: Use common ancestor of evictor and
 evictee as limit pool
To: Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
 <20251015-dmemcg-aggressive-protect-v2-5-36644fb4e37f@gmx.de>
 <a825aed9-c217-4864-807d-9fce40076388@lankhorst.se>
Content-Language: en-US
From: Natalie Vock <natalie.vock@gmx.de>
In-Reply-To: <a825aed9-c217-4864-807d-9fce40076388@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KX1WneHQFVb5WPbwz2GhM/DVXrR17VJ+e/qJ5b1i30CxWAGcAC2
 O81JnT1Xo+AmTtLyEZp8lO36c6bvSZJKZDvFZ445rRSXAw/OstvnP0QltWQ7xipctC/TjZB
 VnpFw4DuvyTRdb2axa+k3u6xP0ScSIkRE8VKElaF8rrqgadKMt2fWFTLUVUlXqRr6EIqJEc
 sdVA5ZpUHR0oXoFPcDXSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SEMadvtdFf8=;5DPn5VT8wIGVi/xzA2z2m4jOyln
 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
 pNUqx1p8HvAHj8lcc=
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

On 10/24/25 14:21, Maarten Lankhorst wrote:
> Hey,
>=20
> Den 2025-10-15 kl. 15:57, skrev Natalie Vock:
>> When checking whether to skip certain buffers because they're protected
>> by dmem.low, we're checking the effective protection of the evictee's
>> cgroup, but depending on how the evictor's cgroup relates to the
>> evictee's, the semantics of effective protection values change.
>>
>> When testing against cgroups from different subtrees, page_counter's
>> recursive protection propagates memory protection afforded to a parent
>> down to the child cgroups, even if the children were not explicitly
>> protected. This prevents cgroups whose parents were afforded no
>> protection from stealing memory from cgroups whose parents were afforde=
d
>> more protection, without users having to explicitly propagate this
>> protection.
>>
>> However, if we always calculate protection from the root cgroup, this
>> breaks prioritization of sibling cgroups: If one cgroup was explicitly
>> protected and its siblings were not, the protected cgroup should get
>> higher priority, i.e. the protected cgroup should be able to steal from
>> unprotected siblings. This only works if we restrict the protection
>> calculation to the subtree shared by evictor and evictee.
>>
>> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
>> index 7f7872ab2090cc8db188e08ddfdcd12fe924f743..bc88941c0aadb9a1d6fbaa4=
70ccdeae4f91c41fb 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -524,13 +524,29 @@ struct ttm_bo_evict_walk {
>>  =20
>>   static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buff=
er_object *bo)
>>   {
>> +	struct dmem_cgroup_pool_state *limit_pool;
>>   	struct ttm_bo_evict_walk *evict_walk =3D
>>   		container_of(walk, typeof(*evict_walk), walk);
>>   	s64 lret;
>>  =20
>> -	if (!dmem_cgroup_state_evict_valuable(evict_walk->alloc_state->limit_=
pool,
>> -					      bo->resource->css, evict_walk->try_low,
>> -					      &evict_walk->hit_low))
>> +	/*
>> +	 * If only_evict_unprotected is set, then we're trying to evict unpro=
tected
>> +	 * buffers in favor of a protected allocation for charge_pool. Explic=
itly skip
>> +	 * buffers belonging to the same cgroup here - that cgroup is definit=
ely protected,
>> +	 * even though dmem_cgroup_state_evict_valuable would allow the evict=
ion because a
>> +	 * cgroup is always allowed to evict from itself even if it is protec=
ted.
>> +	 */
>> +	if (evict_walk->alloc_state->only_evict_unprotected &&
>> +			bo->resource->css =3D=3D evict_walk->alloc_state->charge_pool)
>> +		return 0;
>> +
>> +	limit_pool =3D evict_walk->alloc_state->limit_pool;
>> +	if (!limit_pool)
>> +		limit_pool =3D dmem_cgroup_common_ancestor(bo->resource->css,
>> +							 evict_walk->alloc_state->charge_pool);
>> +
>> +	if (!dmem_cgroup_state_evict_valuable(limit_pool, bo->resource->css,
>> +					      evict_walk->try_low, &evict_walk->hit_low))
>>   		return 0;
>>  =20
>>   	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo, evict_w=
alk->place))
>>
> Patches themselves look good, I think it would help to add a bit more do=
cumentation since
> cgroup related dmem eviction is already complicated, and while I believe=
 those changes are
> correct, it will help others to understand the code in case bugs show up=
.
>=20
> Perhaps even add a global overview of how dmem eviction interacts with T=
TM eviction.
>=20
> This will need review from the TTM maintainers/reviewers too before bein=
g accepted.
>=20
> With the extra documentation added:
> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

Sent out a v3 with extra documentation added[1].

Is this roughly in line with the documentation on cgroup-related dmem=20
eviction you expected? I skipped adding your R-b below the patches for=20
now to give you a chance to look over it again :)

Thanks,
Natalie

[1]=20
https://lore.kernel.org/dri-devel/20251110-dmemcg-aggressive-protect-v3-0-=
219ffcfc54e9@gmx.de/

