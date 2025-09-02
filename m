Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A98B3F745
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF1E10E5B1;
	Tue,  2 Sep 2025 07:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NbcPLt/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BAC10E5C8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wJ61FIB/NmPV7dswnNYnMoUac/R593vmjpM+oAD5/gE=; b=NbcPLt/kcNxKZuGOZ1NxUhKfUy
 eyIJiAUbh0Pv9Y/rUPDndpT4OWbCOyeMxCJAZ/KpmJv4UBrrwSc0+bkPmQnfdPd6k8GVdgXL6SlqC
 X79vT0hJ+vkzbC0kGTthKy6DOgOUM7m6nkBjKhdiwLb2g4ZkwWoujfTVR1nK8CrIHVKjosbHPwQrl
 3t4qWtWQuneOdGgwDG5587KaY/kcqxzwdjXcYNN5Bl7MgfLeCDmtbZ9d7tqLSwe3fqoRE/oI98cRx
 P2rwl+gVYVyvMCYT3HYFaphqZJF6Mtogzmk71V+VTunFiI2J0ZIXyTqLgFKYMXLHGVTTvM0HbWt/8
 EsZgXyiA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1utLvA-005bRr-Kw; Tue, 02 Sep 2025 09:59:16 +0200
Message-ID: <b9f7a493-5611-4450-a26a-10b03d1dc313@igalia.com>
Date: Tue, 2 Sep 2025 08:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Fix racy access to
 drm_sched_entity.dependency
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250901124032.1955-1-pierre-eric.pelloux-prayer@amd.com>
 <da59f28c7d8b3d83833aa0494b3b198335cf588f.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <da59f28c7d8b3d83833aa0494b3b198335cf588f.camel@mailbox.org>
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


On 02/09/2025 08:27, Philipp Stanner wrote:
> On Mon, 2025-09-01 at 14:40 +0200, Pierre-Eric Pelloux-Prayer wrote:
>> The drm_sched_job_unschedulable trace point can access
>> entity->dependency after it was cleared by the callback
>> installed in drm_sched_entity_add_dependency_cb, causing:
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000020
>> [...]
>> Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
>> RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0 [gpu_sched]
>>
>> To fix this we either need to keep a reference to the fence before
>> setting up the callbacks, or move the trace_drm_sched_job_unschedulable
>> calls into drm_sched_entity_add_dependency_cb where they can be
>> done earlier.
>>
>> Fixes: 76d97c870f29 ("drm/sched: Trace dependencies for GPU jobs")
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Applied to drm-misc-next

Shouldn't it have been drm-misc-fixes?

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 8867b95ab089..3d06f72531ba 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -391,7 +391,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>    * Add a callback to the current dependency of the entity to wake up the
>>    * scheduler when the entity becomes available.
>>    */
>> -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>> +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity,
>> +					       struct drm_sched_job *sched_job)
>>   {
>>   	struct drm_gpu_scheduler *sched = entity->rq->sched;
>>   	struct dma_fence *fence = entity->dependency;
>> @@ -421,6 +422,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>   		entity->dependency = fence;
>>   	}
>>   
>> +	if (trace_drm_sched_job_unschedulable_enabled() &&
>> +	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &entity->dependency->flags))
>> +		trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
>> +
>>   	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
>>   				    drm_sched_entity_wakeup))
>>   		return true;
>> @@ -461,10 +466,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   
>>   	while ((entity->dependency =
>>   			drm_sched_job_dependency(sched_job, entity))) {
>> -		if (drm_sched_entity_add_dependency_cb(entity)) {
>> -			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
>> +		if (drm_sched_entity_add_dependency_cb(entity, sched_job))
>>   			return NULL;
>> -		}
>>   	}
>>   
>>   	/* skip jobs from entity that marked guilty */
> 

