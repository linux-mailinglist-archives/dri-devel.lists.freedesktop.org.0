Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38FAB983A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0FC10E9F8;
	Fri, 16 May 2025 09:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dxeL/aXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0E510E9F5;
 Fri, 16 May 2025 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S7aux+kj8gQ8QGSp6GxYHHNN+3p7fRTeAIsrjdB94Os=; b=dxeL/aXj6cnZeJqwkVWIJ5evwn
 fbQbvN9R/Vgmjx96Ox1FQf2bpnrT0Z15I+pmUuYb/fsInl0tht5lqrn/inD9+J6WEkIVHP8eq+B5I
 uztPjcgoT3ypKTSCsPgDN1smqnv6EemP1nKljhfNr5bnBYfjcM0nE2874RHgAYfm0bLlWzhFsXhl6
 +Im7ddUOAuQh3mltfhNkEc3URbN0le+H3f6rDDSvIo/bMwgfzHbSgdDEJ44ceFFnVsXs0s8XqabOP
 iOTs8KgbjzRLFG3oYS5r0EfU3c+mI86jUjYgZyMJOcdfEyoUcqFbHJJCz3jZ0DBwmcf1Q0mu1t7eC
 KS9A6k1w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFqq8-0090ON-50; Fri, 16 May 2025 11:00:46 +0200
Message-ID: <ac454a95-15ed-4de2-8bff-e67bcc9831ec@igalia.com>
Date: Fri, 16 May 2025 10:00:45 +0100
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
 <1d753b0f-4770-4f90-b2fb-48193262d713@igalia.com>
 <b98ac3e08922f5d1a6a83d1caa9f8d1d4a7aaac2.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b98ac3e08922f5d1a6a83d1caa9f8d1d4a7aaac2.camel@mailbox.org>
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


On 14/05/2025 10:19, Philipp Stanner wrote:
> On Wed, 2025-05-14 at 09:30 +0100, Tvrtko Ursulin wrote:
>>
>> On 12/05/2025 09:00, Philipp Stanner wrote:
>>> On Thu, 2025-05-08 at 13:51 +0100, Tvrtko Ursulin wrote:
>>>>
>>>> Hi Philipp,
>>>>
>>>> On 08/05/2025 12:03, Philipp Stanner wrote:
>>>>> On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
>>>>>> The unit tests so far took care manually of avoiding memory
>>>>>> leaks
>>>>>> that
>>>>>> might have occurred when calling drm_sched_fini().
>>>>>>
>>>>>> The scheduler now takes care by itself of avoiding memory
>>>>>> leaks
>>>>>> if
>>>>>> the
>>>>>> driver provides the callback
>>>>>> drm_sched_backend_ops.kill_fence_context().
>>>>>>
>>>>>> Implement that callback for the unit tests. Remove the manual
>>>>>> cleanup
>>>>>> code.
>>>>>
>>>>> @Tvrtko: On a scale from 1-10, how much do you love this patch?
>>>>> :)
>>>>
>>>> Specific patch aside, it is the series as a whole I would like to
>>>> be
>>>> sure there isn't a more elegant way to achieve the same end
>>>> result.
>>>
>>> I count this as a 9/10 \o/
>>
>> :) Yes, sorry, it would a bit lower than that, at least until someone
>> can point out a fatal flaw in my alternative. :)
> 
> There's no fatal flaw in my approach either :)
> 
>>
>>> But jokes aside:
>>>
>>>>
>>>> Like that sketch of a counter proposal I sent for the reasons
>>>> listed
>>>> with it. Which were, AFAIR, to avoid needing to add more state
>>>> machine,
>>>
>>> Well the state machine added is basically just the waitqueue. The
>>> WRITE_ONCE booleans are currently just for correctness and clarity.
>>> I've looked at them and want to remove them all in an other patch,
>>> because I think they're not needed (workqueue handles that)
>>>
>>> But yes, the added state is > 0
>>>
>>>> to avoid mandating drivers have to keep an internal list,
>>>
>>> That's not mandated by the scheduler, but by logic itself. All
>>> drivers
>>> need to have a list of on-flight fences. Otherwise the drivers
>>> would
>>> have no chance of signaling those fences once their GPU tells them
>>> to
>>> do so.
>>
>> Probably it would be hard to signal without tracking of some sort
>> yes,
>> although it wouldn't have to be indexed by fence context, or looked
>> up
>> by it so maybe still simpler.
> 
> Well, the decisive point remains that all drivers must know all on-air
> fences, so they all are able to signal those fences.
> 
>>
>> More importantly I think with this comment I was thinking about the
>> fact
>> that with ops->cancel_job() approach I was able to remove the _done_
>> list tracking from the mock scheduler.
> 
> If the done_list is just about avoiding memory leaks, then I should
> also be able to remove it completely, shouldn't I? In this patch here I
> already remove the leak-related code in drm_mock_sched_fini(), but
> hadn't looked too deeply into what else the done_list does. Is it just
> about the leaks?

Yes, I added it specifically to enable freeing completed jobs before 
calling drm_sched_fini (so mock scheduler does not have to look at the 
scheduler internal sched->job_list). On a glance you should be able to 
remove it too and it looks it should just work. You can peek at my patch 
for how to remove it completely if it helps.

>>> I have now provided two users of the new API, nouveau and the unit
>>> tests. Can you think of a party for which the suggested approach
>>> wouldn't work?
>>
>> I did not think along those lines yet so don't know. I just thought
>> it
>> was too much code to implement a relatively simple thing and that
>> also a
>> few things in the design bothered me.
>>
>> If you look at the diffstat from my proposal and ignore kerneldoc and
>> unit test stats, it literally adds 8 lines to drm_sched_fini() and a
>> single line to gpu_scheduler.h:
>>
>> +       void (*cancel_job)(struct drm_sched_job *sched_job);
>>
>> And in the former after it stops the workers:
>>
>> +       if (sched->ops->cancel_job) {
>> +               struct drm_sched_job *job;
>> +
>> +               list_for_each_entry_reverse(job, &sched-
>>> pending_list,
>> list) {
>> +                       sched->ops->cancel_job(job);
>> +                       sched->ops->free_job(job);
>> +               }
>> +       }
>>
>> To me this looks quite clean. Unless, I say this again, I am missing
>> some fatal flaw why it doesn't work.
> 
> It does work. I've stated that before. But mine works, too. And mine
> doesn't have a hard blocker either, as far as I can see.
> 
> So let's focus on the main differences:
> 
> Your version adds fewer lines of code, that's correct.
> 
> I think cleaning up through just having the driver signal the fences
> all at once is better because
>     1. The very same code path both for "legacy-fini" and "new-fini" is
>        responsible for cleaning up the jobs. Notably, the free_job()
>        callback is only invoked by the same parties as before, primarily
>        the work items. We don't add a new, only sometimes running, code
>        path *that free's jobs*.
>     2. The scheduler's already fractured design doesn't fracture
>        further: the free_job work item remains responsible for calling
>        free_job(). Having just one party being responsible for one thing
>        is a desirable design goal.
>     3. Considering that many drivers generously (ab)use API internals of
>        the scheduler, and considering that there is already ambiguity of
>        who's responsible for handling job lifetimes, I believe it is
>        safer not to add an additional code path that can free jobs, but
>        keep that one path.

All three look the same root argument. I would not be too concerned 
since it is still "one party" - the scheduler internals.

>     4. It reads more cleanly: "We're not canceling a single job here,
>        we're killing all associated jobs now all at once", raising
>        awareness for driver programmers that this is a significant
>        event: we're tearing down while not all of your jobs have
>        finished on your GPU.

It looks we simply may end up not agreeing.

I don't see most of the points above as significant, or even valid as a 
differentiator between the two approaches, while what I object to the 
most is adding of more state machine stuff. Because that is what I think 
makes the scheduler harder to maintain. More flags, more stopping some 
workers while leaving some run, etc.

A new callback to cancel a single job is IMO completely clean. 
Equivalent to how we already have ->timedout_job(), which, in the 
context of the recent discussions, really has the semantics of "cancel 
if it hasn't completed in the meantime". So I even wonder if there could 
be scope to share something with ->cancel_job(). The design or the 
implementation.

Regards,

Tvrtko

>>
>>> Don't get me wrong, your approach does work and it definitely has
>>> its
>>> charm. However, I think what I propose here is syntactically a bit
>>> cleaner because the classical order of a fence first being signaled
>>> in
>>> the driver and then the associated job being freed as usual by the
>>> scheduler is guaranteed. IOW, we primarily rely on the signaling
>>> path.
>>>
>>> Either way, neither your nor my approach would have worked out of
>>> the
>>> box in Nouveau without that driver exploding.
>>
>> What do you mean by this - the latest version of your series does or
>> does not work for nouveau?
> 
> Mine works with Nouveau, but revealed a bug in Nouveau [1]. Yours would
> have ran into that bug, too.
> 
> My point is just that your job-by-job approach wouldn't have been
> superior to my approach in practice, i.e., when implementing it in the
> first "beta tester", Nouveau. Would have been the same problem in
> different color.
> 
> So just because a cancel_job() callback would result in fewer lines of
> code wouldn't mean it's superior in practice. I expect the same to be
> the case for other drivers, especially those who use scheduler
> internals.
> 
> So, summarizing:
>   * My approach works. Your approach works.
>   * It works for all drivers, because they all have a list of fences.
>   * It communicates more clearly to the driver what this is all about.
>   * It keeps the scheduler's design more consistent regarding
>     responsibility / code paths for job life times.
> 
> P.
> 
> [1] https://lore.kernel.org/dri-devel/20250415121900.55719-2-phasta@kernel.org/
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>>    and to align
>>>> better with the existing prototypes in the sched ops table (where
>>>> everything operates on jobs).
>>>
>>> That's not a hard criteria IMO. Those are sched_backend_ops, not
>>> sched_job_backend_ops, and prepare_job() already takes a parameter
>>> other than a job.
>>>
>>>
>>> Cheers,
>>> P.
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>>> ---
>>>>>>     .../gpu/drm/scheduler/tests/mock_scheduler.c  | 34
>>>>>> ++++++++++++-----
>>>>>> --
>>>>>>     1 file changed, 21 insertions(+), 13 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> index f999c8859cf7..a72d26ca8262 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
>>>>>> drm_sched_job *sched_job)
>>>>>>      /* Mock job itself is freed by the kunit framework. */
>>>>>>     }
>>>>>>     
>>>>>> +static void mock_sched_fence_context_kill(struct
>>>>>> drm_gpu_scheduler
>>>>>> *gpu_sched)
>>>>>> +{
>>>>>> + struct drm_mock_scheduler *sched =
>>>>>> drm_sched_to_mock_sched(gpu_sched);
>>>>>> + struct drm_mock_sched_job *job;
>>>>>> + unsigned long flags;
>>>>>> +
>>>>>> + spin_lock_irqsave(&sched->lock, flags);
>>>>>> + list_for_each_entry(job, &sched->job_list, link) {
>>>>>> + spin_lock(&job->lock);
>>>>>> + if (!dma_fence_is_signaled_locked(&job-
>>>>>>> hw_fence)) {
>>>>>> + dma_fence_set_error(&job->hw_fence, -
>>>>>> ECANCELED);
>>>>>> + dma_fence_signal_locked(&job->hw_fence);
>>>>>> + }
>>>>>> + complete(&job->done);
>>>>>> + spin_unlock(&job->lock);
>>>>>> + }
>>>>>> + spin_unlock_irqrestore(&sched->lock, flags);
>>>>>> +}
>>>>>> +
>>>>>>     static const struct drm_sched_backend_ops
>>>>>> drm_mock_scheduler_ops = {
>>>>>>      .run_job = mock_sched_run_job,
>>>>>>      .timedout_job = mock_sched_timedout_job,
>>>>>> - .free_job = mock_sched_free_job
>>>>>> + .free_job = mock_sched_free_job,
>>>>>> + .kill_fence_context = mock_sched_fence_context_kill,
>>>>>>     };
>>>>>>     
>>>>>>     /**
>>>>>> @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
>>>>>> drm_mock_scheduler *sched)
>>>>>>      drm_mock_sched_job_complete(job);
>>>>>>      spin_unlock_irqrestore(&sched->lock, flags);
>>>>>>     
>>>>>> - /*
>>>>>> - * Free completed jobs and jobs not yet processed by the
>>>>>> DRM
>>>>>> scheduler
>>>>>> - * free worker.
>>>>>> - */
>>>>>> - spin_lock_irqsave(&sched->lock, flags);
>>>>>> - list_for_each_entry_safe(job, next, &sched->done_list,
>>>>>> link)
>>>>>> - list_move_tail(&job->link, &list);
>>>>>> - spin_unlock_irqrestore(&sched->lock, flags);
>>>>>> -
>>>>>> - list_for_each_entry_safe(job, next, &list, link)
>>>>>> - mock_sched_free_job(&job->base);
>>>>>> -
>>>>>>      drm_sched_fini(&sched->base);
>>>>>>     }
>>>>>>     
>>>>>
>>>>
>>>
>>
> 

