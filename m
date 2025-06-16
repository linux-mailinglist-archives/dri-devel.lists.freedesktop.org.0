Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8590ADABE7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA5110E2FC;
	Mon, 16 Jun 2025 09:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S1jHGuKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212D810E301;
 Mon, 16 Jun 2025 09:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WRwp9aXxZSnCtM+EfIL8dTN51HB7qZk8VAN25kzBSE0=; b=S1jHGuKgueZ7rC9f3pExYaMny9
 jTQTJ2TBjuXeTQ0nW5zuuGeaJ1BhH8ms+KO4Ge0CcOPci5f9Ar2sntYbA+7KIIo5RWei/hoXQp8TY
 O9SnI9bPz7O72zZaeFlBPYvXjHIe6yhyvZuafY3a+G/n5E3JqwQgRuyuqfktZw5nlQH0qr2MyiH7u
 GNrLgW+ug8UJxJ/fGMgU0cdCYGzSOcpYydrslDgVTiP4Gq6FnfuNmdcjlu7VKVfWzUEK7MxDBPT58
 Bs0CtBiDSjRpOJHjcCp2ZRSvnc4kpuIoQbZw//7hlg/o0P6931W/1xJt9JWkh7N7fq0l+RyxsRbWu
 LfD2EZ+w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uR67Z-0042xJ-Oz; Mon, 16 Jun 2025 11:27:17 +0200
Message-ID: <18cd6b1f-8872-4a16-9ceb-50fd1ecfea39@igalia.com>
Date: Mon, 16 Jun 2025 10:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250603093130.100159-2-phasta@kernel.org>
 <20250603093130.100159-3-phasta@kernel.org>
 <62ff8ddb-b2f1-4e52-a026-290561ab5337@igalia.com>
 <f4f326a0ecb98a9996919c3f827b3247b8207feb.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f4f326a0ecb98a9996919c3f827b3247b8207feb.camel@mailbox.org>
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


On 12/06/2025 15:20, Philipp Stanner wrote:
> On Thu, 2025-06-12 at 15:17 +0100, Tvrtko Ursulin wrote:
>>
>> On 03/06/2025 10:31, Philipp Stanner wrote:
>>> Since its inception, the GPU scheduler can leak memory if the
>>> driver
>>> calls drm_sched_fini() while there are still jobs in flight.
>>>
>>> The simplest way to solve this in a backwards compatible manner is
>>> by
>>> adding a new callback, drm_sched_backend_ops.cancel_job(), which
>>> instructs the driver to signal the hardware fence associated with
>>> the
>>> job. Afterwards, the scheduler can savely use the established
>>> free_job()
>>> callback for freeing the job.
>>>
>>> Implement the new backend_ops callback cancel_job().
>>>
>>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Please just add the link to the patch here (it is only in the cover
>> letter):
>>
>> Link:
>> https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/
> 
> That I can do, sure

Cool, with that, for this patch:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

>> And you probably want to take the unit test modifications from the
>> same
>> patch too. You could put them in the same patch or separate.
> 
> Necessary adjustments for the unit tests are already implemented and
> are waiting for review separately, since this can be done independently
> from this entire series:
> 
> https://lore.kernel.org/dri-devel/20250605134154.191764-2-phasta@kernel.org/

For me it would make most sense to fold that into 2/6 from this series. 
I don't see it making sense as standalone. So if you could repost the 
series with it integrated I will give it a spin and can review that 
patch at least.

Regards,

Tvrtko

> 
> Thx
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++-----
>>> -----
>>>    include/drm/gpu_scheduler.h            |  9 +++++++
>>>    2 files changed, 30 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index d20726d7adf0..3f14f1e151fa 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1352,6 +1352,18 @@ int drm_sched_init(struct drm_gpu_scheduler
>>> *sched, const struct drm_sched_init_
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_init);
>>>    
>>> +static void drm_sched_kill_remaining_jobs(struct drm_gpu_scheduler
>>> *sched)
>>> +{
>>> +	struct drm_sched_job *job, *tmp;
>>> +
>>> +	/* All other accessors are stopped. No locking necessary.
>>> */
>>> +	list_for_each_entry_safe_reverse(job, tmp, &sched-
>>>> pending_list, list) {
>>> +		sched->ops->cancel_job(job);
>>> +		list_del(&job->list);
>>> +		sched->ops->free_job(job);
>>> +	}
>>> +}
>>> +
>>>    /**
>>>     * drm_sched_fini - Destroy a gpu scheduler
>>>     *
>>> @@ -1359,19 +1371,11 @@ EXPORT_SYMBOL(drm_sched_init);
>>>     *
>>>     * Tears down and cleans up the scheduler.
>>>     *
>>> - * This stops submission of new jobs to the hardware through
>>> - * drm_sched_backend_ops.run_job(). Consequently,
>>> drm_sched_backend_ops.free_job()
>>> - * will not be called for all jobs still in
>>> drm_gpu_scheduler.pending_list.
>>> - * There is no solution for this currently. Thus, it is up to the
>>> driver to make
>>> - * sure that:
>>> - *
>>> - *  a) drm_sched_fini() is only called after for all submitted
>>> jobs
>>> - *     drm_sched_backend_ops.free_job() has been called or that
>>> - *  b) the jobs for which drm_sched_backend_ops.free_job() has not
>>> been called
>>> - *     after drm_sched_fini() ran are freed manually.
>>> - *
>>> - * FIXME: Take care of the above problem and prevent this function
>>> from leaking
>>> - * the jobs in drm_gpu_scheduler.pending_list under any
>>> circumstances.
>>> + * This stops submission of new jobs to the hardware through
>>> &struct
>>> + * drm_sched_backend_ops.run_job. If &struct
>>> drm_sched_backend_ops.cancel_job
>>> + * is implemented, all jobs will be canceled through it and
>>> afterwards cleaned
>>> + * up through &struct drm_sched_backend_ops.free_job. If
>>> cancel_job is not
>>> + * implemented, memory could leak.
>>>     */
>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    {
>>> @@ -1401,6 +1405,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
>>> *sched)
>>>    	/* Confirm no work left behind accessing device structures
>>> */
>>>    	cancel_delayed_work_sync(&sched->work_tdr);
>>>    
>>> +	/* Avoid memory leaks if supported by the driver. */
>>> +	if (sched->ops->cancel_job)
>>> +		drm_sched_kill_remaining_jobs(sched);
>>> +
>>>    	if (sched->own_submit_wq)
>>>    		destroy_workqueue(sched->submit_wq);
>>>    	sched->ready = false;
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index e62a7214e052..81dcbfc8c223 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -512,6 +512,15 @@ struct drm_sched_backend_ops {
>>>             * and it's time to clean it up.
>>>    	 */
>>>    	void (*free_job)(struct drm_sched_job *sched_job);
>>> +
>>> +	/**
>>> +	 * @cancel_job: Used by the scheduler to guarantee
>>> remaining jobs' fences
>>> +	 * get signaled in drm_sched_fini().
>>> +	 *
>>> +	 * Drivers need to signal the passed job's hardware fence
>>> with
>>> +	 * -ECANCELED in this callback. They must not free the
>>> job.
>>> +	 */
>>> +	void (*cancel_job)(struct drm_sched_job *sched_job);
>>>    };
>>>    
>>>    /**
>>
> 

