Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CFFAB65FF
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 10:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F388010E27C;
	Wed, 14 May 2025 08:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HQ8aBzkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D35310E23A;
 Wed, 14 May 2025 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J4EJOcH+vlC4UCADKWOXQAd1u2Z9w7HxAlnVkfrIfXo=; b=HQ8aBzkJzh+L0MyBPN/SSET9z9
 IboaoWX+7S8scFijWy5q7ZVeVhYKv7r9JrWalVwZEUrzA/OVOYBLxMGoHvxvbX5uEhPO1LEXN5+v/
 Jde6FY5H2uDz8RDNIXxn6jeRy1kd6ojI+9BojZFS3KNX6g9gb5OSwhOLoearuySbyB3X50aOcwZWs
 vZiIZCJ3YSHgodd8thHjzDGoy4jaV1XaZ0GDGvHQke6KeDNX7t5fEmQxv25DsNze/0GMeUkAyKFUI
 ZPfnXypK3HQtCui3M95dEAmFuDDD+hUHVKiZMmpfxhi494K0Ak8cpSIAiIsb5sBgbUl8i6F/e8ESj
 Weo5B72w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uF7Pv-0083Ee-FV; Wed, 14 May 2025 10:30:26 +0200
Message-ID: <1d753b0f-4770-4f90-b2fb-48193262d713@igalia.com>
Date: Wed, 14 May 2025 09:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-8-phasta@kernel.org>
 <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
 <a1c9c680-2927-428c-95e9-2e79d14cec58@igalia.com>
 <84021a2461db55617018050b7c0e07a15dceb634.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <84021a2461db55617018050b7c0e07a15dceb634.camel@mailbox.org>
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


On 12/05/2025 09:00, Philipp Stanner wrote:
> On Thu, 2025-05-08 at 13:51 +0100, Tvrtko Ursulin wrote:
>>
>> Hi Philipp,
>>
>> On 08/05/2025 12:03, Philipp Stanner wrote:
>>> On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
>>>> The unit tests so far took care manually of avoiding memory leaks
>>>> that
>>>> might have occurred when calling drm_sched_fini().
>>>>
>>>> The scheduler now takes care by itself of avoiding memory leaks
>>>> if
>>>> the
>>>> driver provides the callback
>>>> drm_sched_backend_ops.kill_fence_context().
>>>>
>>>> Implement that callback for the unit tests. Remove the manual
>>>> cleanup
>>>> code.
>>>
>>> @Tvrtko: On a scale from 1-10, how much do you love this patch? :)
>>
>> Specific patch aside, it is the series as a whole I would like to be
>> sure there isn't a more elegant way to achieve the same end result.
> 
> I count this as a 9/10 \o/

:) Yes, sorry, it would a bit lower than that, at least until someone 
can point out a fatal flaw in my alternative. :)

> But jokes aside:
> 
>>
>> Like that sketch of a counter proposal I sent for the reasons listed
>> with it. Which were, AFAIR, to avoid needing to add more state
>> machine,
> 
> Well the state machine added is basically just the waitqueue. The
> WRITE_ONCE booleans are currently just for correctness and clarity.
> I've looked at them and want to remove them all in an other patch,
> because I think they're not needed (workqueue handles that)
> 
> But yes, the added state is > 0
> 
>> to avoid mandating drivers have to keep an internal list,
> 
> That's not mandated by the scheduler, but by logic itself. All drivers
> need to have a list of on-flight fences. Otherwise the drivers would
> have no chance of signaling those fences once their GPU tells them to
> do so.

Probably it would be hard to signal without tracking of some sort yes, 
although it wouldn't have to be indexed by fence context, or looked up 
by it so maybe still simpler.

More importantly I think with this comment I was thinking about the fact 
that with ops->cancel_job() approach I was able to remove the _done_ 
list tracking from the mock scheduler.

> I have now provided two users of the new API, nouveau and the unit
> tests. Can you think of a party for which the suggested approach
> wouldn't work?

I did not think along those lines yet so don't know. I just thought it 
was too much code to implement a relatively simple thing and that also a 
few things in the design bothered me.

If you look at the diffstat from my proposal and ignore kerneldoc and 
unit test stats, it literally adds 8 lines to drm_sched_fini() and a 
single line to gpu_scheduler.h:

+       void (*cancel_job)(struct drm_sched_job *sched_job);

And in the former after it stops the workers:

+       if (sched->ops->cancel_job) {
+               struct drm_sched_job *job;
+
+               list_for_each_entry_reverse(job, &sched->pending_list, 
list) {
+                       sched->ops->cancel_job(job);
+                       sched->ops->free_job(job);
+               }
+       }

To me this looks quite clean. Unless, I say this again, I am missing 
some fatal flaw why it doesn't work.

> Don't get me wrong, your approach does work and it definitely has its
> charm. However, I think what I propose here is syntactically a bit
> cleaner because the classical order of a fence first being signaled in
> the driver and then the associated job being freed as usual by the
> scheduler is guaranteed. IOW, we primarily rely on the signaling path.
> 
> Either way, neither your nor my approach would have worked out of the
> box in Nouveau without that driver exploding.

What do you mean by this - the latest version of your series does or 
does not work for nouveau?

Regards,

Tvrtko

> 
>>   and to align
>> better with the existing prototypes in the sched ops table (where
>> everything operates on jobs).
> 
> That's not a hard criteria IMO. Those are sched_backend_ops, not
> sched_job_backend_ops, and prepare_job() already takes a parameter
> other than a job.
> 
> 
> Cheers,
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>    .../gpu/drm/scheduler/tests/mock_scheduler.c  | 34
>>>> ++++++++++++-----
>>>> --
>>>>    1 file changed, 21 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> index f999c8859cf7..a72d26ca8262 100644
>>>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>> @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
>>>> drm_sched_job *sched_job)
>>>>    	/* Mock job itself is freed by the kunit framework. */
>>>>    }
>>>>    
>>>> +static void mock_sched_fence_context_kill(struct
>>>> drm_gpu_scheduler
>>>> *gpu_sched)
>>>> +{
>>>> +	struct drm_mock_scheduler *sched =
>>>> drm_sched_to_mock_sched(gpu_sched);
>>>> +	struct drm_mock_sched_job *job;
>>>> +	unsigned long flags;
>>>> +
>>>> +	spin_lock_irqsave(&sched->lock, flags);
>>>> +	list_for_each_entry(job, &sched->job_list, link) {
>>>> +		spin_lock(&job->lock);
>>>> +		if (!dma_fence_is_signaled_locked(&job-
>>>>> hw_fence)) {
>>>> +			dma_fence_set_error(&job->hw_fence, -
>>>> ECANCELED);
>>>> +			dma_fence_signal_locked(&job->hw_fence);
>>>> +		}
>>>> +		complete(&job->done);
>>>> +		spin_unlock(&job->lock);
>>>> +	}
>>>> +	spin_unlock_irqrestore(&sched->lock, flags);
>>>> +}
>>>> +
>>>>    static const struct drm_sched_backend_ops
>>>> drm_mock_scheduler_ops = {
>>>>    	.run_job = mock_sched_run_job,
>>>>    	.timedout_job = mock_sched_timedout_job,
>>>> -	.free_job = mock_sched_free_job
>>>> +	.free_job = mock_sched_free_job,
>>>> +	.kill_fence_context = mock_sched_fence_context_kill,
>>>>    };
>>>>    
>>>>    /**
>>>> @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
>>>> drm_mock_scheduler *sched)
>>>>    		drm_mock_sched_job_complete(job);
>>>>    	spin_unlock_irqrestore(&sched->lock, flags);
>>>>    
>>>> -	/*
>>>> -	 * Free completed jobs and jobs not yet processed by the
>>>> DRM
>>>> scheduler
>>>> -	 * free worker.
>>>> -	 */
>>>> -	spin_lock_irqsave(&sched->lock, flags);
>>>> -	list_for_each_entry_safe(job, next, &sched->done_list,
>>>> link)
>>>> -		list_move_tail(&job->link, &list);
>>>> -	spin_unlock_irqrestore(&sched->lock, flags);
>>>> -
>>>> -	list_for_each_entry_safe(job, next, &list, link)
>>>> -		mock_sched_free_job(&job->base);
>>>> -
>>>>    	drm_sched_fini(&sched->base);
>>>>    }
>>>>    
>>>
>>
> 

