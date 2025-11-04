Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51CFC31D2A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CEA10E628;
	Tue,  4 Nov 2025 15:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="fbMo2WAo";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="B/j8Nngl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7345010E628
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762269846;
 bh=Md3JXufxJqYTYDD+0LVVo5S
 jqxZHasmKDqpehjHw5dk=; b=fbMo2WAoOTSO/uU6bDOvUwhinhZTOHOaW/et4qJ8N6hq9rRgKL
 jJFDT46tFLjhEuxBQefWD+yVfJ8T2nwnZ5+kxPrEg6FNsfeHcIpdgM7x2BJNnHD/42lusVxeiEN
 xzGmoE1VirB7YKn19rKchyDTu9lM91XLEXwrQeSZ0h/NT3WDluxtwO3/guL+CkqFHfEIDXFnG85
 fqAZgqiIKq+Hv+NlhrT9O7zY+wLq9XeqetWUWps4gswIkMutfeQHhPr7TI0KQwA2NcEi2hQ/kNz
 dIk1iZ8DXibbbYdYKwMIBUjz9MhaW8Ir7/SopS/NOzc1LfzDpjn7bTCvfsMLfYcjjHg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762269846; bh=Md3JXufxJqYTYDD+0LVVo5S
 jqxZHasmKDqpehjHw5dk=; b=B/j8NnglB5dEWa4XIPmntCOh5fE1cR/Z/+Peyo/fB/Qv9AQ3+r
 Nb544jcRoJoMx3GlaVRGbghxkz3rY8QrQ8AQ==;
Message-ID: <c1da66b4-3b71-4d83-8e8e-56151030b691@damsy.net>
Date: Tue, 4 Nov 2025 16:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
 <628cdf3a0c5b783c09fe2a40aca4a4a48c614e66.camel@mailbox.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <628cdf3a0c5b783c09fe2a40aca4a4a48c614e66.camel@mailbox.org>
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



Le 04/11/2025 à 13:43, Philipp Stanner a écrit :
> On Tue, 2025-11-04 at 10:53 +0100, Pierre-Eric Pelloux-Prayer wrote:
>> The Mesa issue referenced below pointed out a possible deadlock:
>>
>> [ 1231.611031]  Possible interrupt unsafe locking scenario:
>>
>> [ 1231.611033]        CPU0                    CPU1
>> [ 1231.611034]        ----                    ----
>> [ 1231.611035]   lock(&xa->xa_lock#17);
>> [ 1231.611038]                                local_irq_disable();
>> [ 1231.611039]                                lock(&fence->lock);
>> [ 1231.611041]                                lock(&xa->xa_lock#17);
>> [ 1231.611044]   <Interrupt>
>> [ 1231.611045]     lock(&fence->lock);
>> [ 1231.611047]
>>                  *** DEADLOCK ***
>>
>> In this example, CPU0 would be any function accessing job->dependencies
>> through the xa_* functions that doesn't disable interrupts (eg:
>> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
>>
>> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
>> callback so in an interrupt context. It will deadlock when trying to
>> grab the xa_lock which is already held by CPU0.
>>
>> Replacing all xa_* usage by their xa_*_irq counterparts would fix
>> this issue, but Christian pointed out another issue: dma_fence_signal
>> takes fence.lock and so does dma_fence_add_callback.
>>
>>    dma_fence_signal() // locks f1.lock
>>    -> drm_sched_entity_kill_jobs_cb()
>>    -> foreach dependencies
>>       -> dma_fence_add_callback() // locks f2.lock
>>
>> This will deadlock if f1 and f2 share the same spinlock.
>>
>> To fix both issues, the code iterating on dependencies and re-arming them
>> is moved out to drm_sched_entity_kill_jobs_work.
>>
>> v2: reworded commit message (Philipp)
>> v3: added Fixes tag (Philipp)
> 
> Thx for the update.
> In the future please put the changelog below between a pair of '---'
> 
> ---
> v2: …
> v3: …
> ---

OK.

> 
> Some things I have unfortunately overlooked below.
> 
>>
>> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
> 
> We should +Cc stable. It's a deadlock after all.

OK.

> 
>> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>>   1 file changed, 19 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index c8e949f4a568..fe174a4857be 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_error);
>>   
>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> +					  struct dma_fence_cb *cb);
> 
> It's far better to move the function up instead. Can you do that?

Since drm_sched_entity_kill_jobs_cb uses drm_sched_entity_kill_jobs and vice 
versa, I'll have to forward declare one of the 2 functions anyway.


> 
>> +
>>
> 
> […]
> 
>> +/* Signal the scheduler finished fence when the entity in question is killed. */
>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> +					  struct dma_fence_cb *cb)
>> +{
>> +	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>> +						 finish_cb);
>> +
>> +	dma_fence_put(f);
> 
> It would be great if we knew what fence is being dropped here and why.
> I know you're just moving the pre-existing code, but if you should
> know, informing about that via comment would be great.
> 

As discussed offline, "f" is simply the fence being signaled, I'm not sure it 
warrants a comment.

Regards,
Pierre-Eric

> Optional.
> 
> 
> Rest of the code looks good. No further objections.
> 
> 
> P.
