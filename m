Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB74A17A56
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD83D10E1CB;
	Tue, 21 Jan 2025 09:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MblcMP//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9860410E1CB;
 Tue, 21 Jan 2025 09:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5q14k5/ZfJYsaoezG1YzPs6u6Afeulo3mpAyCyk9vbs=; b=MblcMP//h74jf9xBS4UwiFY3Qh
 qkRzth7sGcy6IeDw4r+1sIimvxThsn9qSZ7rmuraqsF9rqRYFz/gvw8dhPzob3Z+FNUKzrfHA4DyA
 eM2B9M8rHUfNJH0Ps5qH9mLcuaMFMpW7ex5YxaT+yetL7dtwCBkkrKne26iQSyIxo1xL25l4QFtow
 bywA0qRCr1kePDQYd5Oq9rdb6fkvMDgvIajO5dL++V2hqEBX+cu11a3FNhOYkcLZBvIY0XM3KGIZh
 eXNG2W+2ErPjaC0s9rfp3OrQNyLC0uzMthALmCn+mh+j1U20NjQFbhBgUwYu2Ur4wCNc0bhXmuANf
 29NE3mug==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1taAid-00024v-PH; Tue, 21 Jan 2025 10:38:47 +0100
Message-ID: <89adedd0-7117-4098-90fb-00c9d20e362c@igalia.com>
Date: Tue, 21 Jan 2025 09:38:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: Add job popping API
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
 <20250120165240.9105-2-tvrtko.ursulin@igalia.com> <Z46ESMfTh_FDm-eM@pollux>
 <4d6cb141-b60a-463c-a72d-6f76dab09525@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <4d6cb141-b60a-463c-a72d-6f76dab09525@amd.com>
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


On 20/01/2025 18:49, Christian König wrote:
> Am 20.01.25 um 18:13 schrieb Danilo Krummrich:
>> On Mon, Jan 20, 2025 at 04:52:37PM +0000, Tvrtko Ursulin wrote:
>>> Idea is to add a helper for popping jobs from the entity with the goal
>>> of making amdgpu use it in the next patch. That way amdgpu will decouple
>>> itself a tiny bit more from scheduler implementation details.
>> I object to adding this function if it's *only* used for something 
>> that looks
>> like an abuse of the API by amdgpu. Let's not make that more convenient.
> 
> Completely agree. Since when do we have that?
> 
> I don't remember agreeing to anything which messes so badly with 
> scheduler internals.

Since 7c6e68c777f1 ("drm/amdgpu: Avoid HW GPU reset for RAS."). Where it 
looks to be implementing a permanently wedged state - drops everything 
submitted so far and claims to be blocking any future submission.

Remove that part instead and let the unsubmitted jobs be cleaned up when 
userspace clients exit? Would need specific hardware to test so it would 
need to be done on the AMD side.

Regards,

Tvrtko

>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>>>   include/drm/gpu_scheduler.h              | 21 +++++++++++++++++++++
>>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 69bcf0e99d57..7c0d266a89ef 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -255,7 +255,7 @@ static void drm_sched_entity_kill(struct 
>>> drm_sched_entity *entity)
>>>       /* The entity is guaranteed to not be used by the scheduler */
>>>       prev = rcu_dereference_check(entity->last_scheduled, true);
>>>       dma_fence_get(prev);
>>> -    while ((job = 
>>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>>> +    while ((job = __drm_sched_entity_pop_job(entity))) {
>>>           struct drm_sched_fence *s_fence = job->s_fence;
>>>           dma_fence_get(&s_fence->finished);
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index a0ff08123f07..092242f2464f 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -611,6 +611,27 @@ void drm_sched_entity_set_priority(struct 
>>> drm_sched_entity *entity,
>>>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>   int drm_sched_entity_error(struct drm_sched_entity *entity);
>>> +/**
>>> + * __drm_sched_entity_pop_job - Low level helper for popping queued 
>>> jobs
>>> + *
>>> + * @entity: scheduler entity
>>> + *
>>> + * Low level helper for popping queued jobs. Drivers should not use it.
>>> + *
>>> + * Returns the job dequeued or NULL.
>>> + */
>>> +static inline struct drm_sched_job *
>>> +__drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>> +{
>>> +    struct spsc_node *node;
>>> +
>>> +    node = spsc_queue_pop(&entity->job_queue);
>>> +    if (!node)
>>> +        return NULL;
>>> +
>>> +    return container_of(node, struct drm_sched_job, queue_node);
>>> +}
>>> +
>>>   struct drm_sched_fence *drm_sched_fence_alloc(
>>>       struct drm_sched_entity *s_entity, void *owner);
>>>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>>> -- 
>>> 2.47.1
>>>
> 
