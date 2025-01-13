Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39AA0B794
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0DA10E670;
	Mon, 13 Jan 2025 12:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JSBO9DDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064810E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dx4wI0/nruDLvsEGiHsvbkhmPZoEdhtyg20aWaO/HKI=; b=JSBO9DDY9n8VyQhaqw4tUQ6gnw
 GlvUKgDb9fvADMYEeiH9mmyP0T8wiT6BKR9lPP5Uo4nQ2RxE9zkMzm/KRpOSBE+WJZkgg43CsN4LU
 MA/biO3m4wrhkbMCQaYV7ODNplWH7P+xppo2cD2ZHCGUlFsRt6cPEARwBV7OtcbKJ5LAjpVjdG+cs
 /KLNA3aT2Z5nGIPdoi5kH4hejPVzR/driBg80+61Nl29EcUENQNSTdueZ8Lf9/dYPHX8KwlNotrMS
 txFFAc8uU0OSs3ztFRBjBbKbbnu2o77li+I2ZiQBJNwyywzX49tgT67bLZyvWDAao9YDjIN+nucGg
 GCQFSh/A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXK24-00FBET-8P; Mon, 13 Jan 2025 13:59:04 +0100
Message-ID: <8fc2af49-7fd1-4553-866f-db9d4da6c970@igalia.com>
Date: Mon, 13 Jan 2025 12:59:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
To: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@redhat.com>, Tvrtko Ursulin <tursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <Z3433G3-_aIMqJbt@pollux> <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
 <Z36udQs86Mn1-T5p@pollux> <e611e9ee-3809-4370-8402-e7c324812bb1@igalia.com>
 <Z4AqiSBnJshH0PRU@lstrano-desk.jf.intel.com>
 <10052b1d-647d-40c8-a69a-ebea4d9aff99@igalia.com>
 <Z4FYog4kkECZSgjk@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z4FYog4kkECZSgjk@lstrano-desk.jf.intel.com>
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


On 10/01/2025 17:28, Matthew Brost wrote:
> On Fri, Jan 10, 2025 at 09:16:44AM +0000, Tvrtko Ursulin wrote:
>>
>> On 09/01/2025 19:59, Matthew Brost wrote:
>>> On Wed, Jan 08, 2025 at 06:55:16PM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 08/01/2025 16:57, Danilo Krummrich wrote:
>>>>> On Wed, Jan 08, 2025 at 03:13:39PM +0000, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 08/01/2025 08:31, Danilo Krummrich wrote:
>>>>>>> On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>
>>>>>>> "Deadline scheduler and other ideas"
>>>>>>>
>>>>>>> There's a few patches that could be sent outside the scope of this series, e.g.
>>>>>>> the first one.
>>>>>>>
>>>>>>> I think it would make sense to do so.
>>>>>>
>>>>>> For now I'll keep them at the head of this RFC and as they get acked or
>>>>>> r-b-ed I can easily send them standalone or re-ordered. Until then having
>>>>>> the series separate would make the RFC not standalone.
>>>>>>
>>>>>>>> <tldr>
>>>>>>>> Replacing FIFO with a flavour of deadline driven scheduling and removing round-
>>>>>>>> robin. Connecting the scheduler with dma-fence deadlines. First draft and
>>>>>>>> testing by different drivers and feedback would be nice. I was only able to test
>>>>>>>> it with amdgpu. Other drivers may not even compile.
>>>>>>>
>>>>>>> What are the results from your tests with amdgpu? Do you have some measurements?
>>>>>>
>>>>>> We already covered this in the thread with Philipp to a degree. Tl;dr; the
>>>>>> main idea is whether we simplify the code and at least not regress.
>>>>>>
>>>>>> I don't expect improvements on the amdgpu side with the workloads like games
>>>>>> and benchmarks. I did not measure anything significant apart that priorities
>>>>>> seem to work with the run queues removed.
>>>>>
>>>>> I appreaciate the effort, and generally I like the idea, but I also must admit
>>>>> that this isn't the most convincing motiviation for such an integral change
>>>>> (especially the "at least not regress" part).
>>>>
>>>> It is challenging yes. But for completeness the full context of what you
>>>> quoted (if you also read my replies to Philipp) was *if* we can shrink the
>>>> code base, add some fairness to FIFO, *and* not regress then those three
>>>> added together would IMHO not be bad. We shouldn't be scared to touch it
>>>> because only touching it you can truly understand the gotchas which any
>>>> amount of kerneldoc will not help with.
>>>>> I'd still like to encourage you to send the small cleanups separately, get them
>>>>> in soon and leave the deadline scheduler as a separate RFC.
>>>>>
>>>>> Meanwhile, Philipp is working on getting documentation straight and digging into
>>>>> all the FIXMEs of the scheduler getting to a cleaner baseline. And with your
>>>>> cleanups you're already helping with that.
>>>>>
>>>>> For now, I'd prefer to leave the deadline scheduler stuff for when things are a
>>>>> bit more settled and / or drivers declare the need.
>>>>
>>>> I just sent v2:
>>>>
>>>> About motivation for the documenting efforts:
>>>>
>>>>    13 files changed, 424 insertions(+), 576 deletions(-)
>>>>
>>>> Fewer lines to document. ;)
>>>>
>>>> On a serious note, I ordered the series (mostly*) so you can read it in
>>>> order and for patches/ideas you like please say and I can extract and send
>>>> separately if you want. I am reluctant to extract things beforehand, before
>>>> knowing which ones people will like and so far there is only one with acks.
>>>>
>>>> *)
>>>> Mostly because perhaps "drm/sched: Queue all free credits in one worker
>>>> invocation" could be interesting to move before the most.
>>>>
>>>
>>> I looked into this. When I originally changed the scheduler from a
>>> kthread to a worker, I designed it the way your patch implements it:
>>> looping in the worker until credits run out or no jobs are available.
>>>
>>> If I recall correctly, the feedback from Christian (or Luben?) was to
>>> rely on the work queue's requeuing mechanism to submit more than one
>>> job. From a latency perspective, there might be a small benefit, but
>>> it's more likely that if you queue two jobs back-to-back, even when
>>> relying on the work queue's rescheduling, the first job will still be
>>> running on the hardware, nullifying any potential latency improvement.
>>>
>>>   From a fairness perspective, multiplexing across multiple work queues
>>> one job at a time makes a bit more sense, in my opinion.
>>
>> You mean multiplexing across multiple _entities_? Because work queue is only
> 
> No, I mean if you have multiple schedulers (work queues) with jobs that
> are to run dequeuing a job a time per scheduler would let the core work
> queue scheduling give a level of fairness.

That doesn't work in the current implementation because entity->rq (ie. 
picked scheduler) cannot change when jobs are queued.

>> one. That it unchanged with my patch. Ie. it is not changing to pick jobs
>> from a single entity but still picks a job at a time from the top entity.
>> And top entity can change as jobs are popped. What remains is the question
>> of why burn CPU cycles and do it in a roundabout way if it is very easy to
>> do it directly and at the same time avoid that unconditional final wakeup
>> when queues are empty.
> 
> Like I said, I had this way initially but the feedback I recieved was to
> dequeue 1 job at time and kick the work queue to reschedule itself.
> Unless everyone opinion has changed, I don't think this is change we
> should make.
> 
> Here are the some references...
> 
> [1] https://patchwork.freedesktop.org/patch/530652/?series=116055&rev=1
> [2] https://patchwork.freedesktop.org/patch/575874/?series=129143&rev=1
> [3] https://patchwork.freedesktop.org/patch/576334/?series=129286&rev=1

Thanks. Aside that the referenced discussion were also about fixing some 
regressions, on the topic of the high level design I spotted two arguments.

One was about the supposed need to "interleave" one-at-a-time run work 
and the same for free work. I don't see why would that be the case and 
besides it is already not universally true when unordered workqueues are 
used.

Second was to bail soone(-er) is scheduler is paused. That's a good 
point and I added it to my local version.

In summary it feels this area should be clarified further.

Regards,

Tvrtko
