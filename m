Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C205C3F83F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 11:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DDA10EA75;
	Fri,  7 Nov 2025 10:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oXSl2Cx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D036610EA72;
 Fri,  7 Nov 2025 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XKdn+Xj1gOnE7ZvuS+Eu3smLhABwegmjFrOFhjYnzqk=; b=oXSl2Cx2snJ5WwIbG2h/SLuuRy
 DYw1YoYbmmQ7gEXUlDSbmiU/2zMfM/GR0NPC/CBgsasYkhODayzYatsTyMWHl3ZL00xj37wBAvjRa
 2usJWFQ1eVLyIp6SfjeqvA96FttmKJwM5vGnHB2Y1QXur77Nq1fzdVN/tTMr4zV4opUvqXTKIlbQf
 nabkLyJ8GYQvB4HjIaKAEB6aCs2+yWdYtLgHibOfoiX6CIZj9vdjLnksnrYxjONc66L8KVft2WBEr
 Z4/cNwbmvFbXo1DKJtAuNtXjzjlT8YGwLmA9E2t2WskZYzTAU3MyFw2y/LG5HLSjIJRmHNPllONDj
 1AQjdH6w==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vHJsN-003PGZ-Ot; Fri, 07 Nov 2025 11:39:27 +0100
Message-ID: <9950dd13-d5c1-4b34-b3f9-2528a1ffb989@igalia.com>
Date: Fri, 7 Nov 2025 10:39:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/amdgpu: increment sched score on entity
 selection
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251107090425.23199-1-pierre-eric.pelloux-prayer@amd.com>
 <20251107090425.23199-2-pierre-eric.pelloux-prayer@amd.com>
 <5717c024-0200-4b23-a25b-681ef0937d6f@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <5717c024-0200-4b23-a25b-681ef0937d6f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 07/11/2025 10:26, Christian König wrote:
> On 11/7/25 10:04, Pierre-Eric Pelloux-Prayer wrote:
>> For hw engines that can't load balance jobs, entities are
>> "statically" load balanced: on their first submit, they select
>> the best scheduler based on its score.
>> The score is made up of 2 parts:
>> * the job queue depth (how much jobs are executing/waiting)
>> * the number of entities assigned
>>
>> The second part is only relevant for the static load balance:
>> it's a way to consider how many entities are attached to this
>> scheduler, knowing that if they ever submit jobs they will go
>> to this one.
>>
>> For rings that can load balance jobs freely, idle entities
>> aren't a concern and shouldn't impact the scheduler's decisions.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 22 +++++++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>>   2 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> index afedea02188d..4d91cbcbcf25 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> @@ -209,6 +209,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>>   	struct amdgpu_ctx_entity *entity;
>>   	enum drm_sched_priority drm_prio;
>>   	unsigned int hw_prio, num_scheds;
>> +	struct amdgpu_ring *aring;
>>   	int32_t ctx_prio;
>>   	int r;
>>   
>> @@ -239,11 +240,13 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>>   			goto error_free_entity;
>>   	}
>>   
>> -	/* disable load balance if the hw engine retains context among dependent jobs */
>> -	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
>> -	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
>> -	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
>> -	    hw_ip == AMDGPU_HW_IP_UVD) {
>> +	sched = scheds[0];
>> +	aring = container_of(sched, struct amdgpu_ring, sched);
>> +
>> +	if (aring->funcs->engine_retains_context) {
>> +		/* Disable load balancing between multiple schedulers if the hw
>> +		 * engine retains context among dependent jobs.
>> +		 */
>>   		sched = drm_sched_pick_best(scheds, num_scheds);
>>   		scheds = &sched;
>>   		num_scheds = 1;
>> @@ -258,6 +261,12 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>>   	if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
>>   		goto cleanup_entity;
>>   
>> +	if (aring->funcs->engine_retains_context) {
>> +		aring = container_of(sched, struct amdgpu_ring, sched);
>> +		entity->sched_score = aring->sched_score;
>> +		atomic_inc(entity->sched_score);
>> +	}
>> +
>>   	return 0;
>>   
>>   cleanup_entity:
>> @@ -514,6 +523,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>>   			if (!ctx->entities[i][j])
>>   				continue;
>>   
>> +			if (ctx->entities[i][j]->sched_score)
>> +				atomic_dec(ctx->entities[i][j]->sched_score);
>> +
>>   			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>>   		}
>>   	}
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>> index 090dfe86f75b..f7b44f96f374 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>>   	uint32_t		hw_ip;
>>   	uint64_t		sequence;
>>   	struct drm_sched_entity	entity;
>> +	atomic_t		*sched_score;
> 
> I would rather prefer to not have that additional member here.
> 
> Additional to that we are messing with the internals of the scheduler here and should probably have two clean functions to increase/decrease the score.

Don't forget it is a driver owned atomic_t so I think it is fine driver 
manipulates it on its own.

Regards,

Tvrtko


> Regards,
> Christian.
> 
>>   	struct dma_fence	*fences[];
>>   };
>>   
> 

