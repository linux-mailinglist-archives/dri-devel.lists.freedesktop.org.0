Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F065A08B24
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836F210F023;
	Fri, 10 Jan 2025 09:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Cr6iFfX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A97310F023
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ZfyGC+mBWkydzzK3WoYpGfhAwS6HDQDlSCKHS1J2jc=; b=Cr6iFfX5lxt1v1IVOsNfiDXEPr
 x9oAxoTr5hH8/20kYbjvcmkMU9xm8rPQngJ5SbUX2IWJz9bI5sW6G7cwaS2Nla+TQWeILhko/HMKM
 q//Ri8cMVjWxOJ3ULiLonJf4zAkne0jb4kTzA/7p3w+AxQsCsJqfSOyfuckyx3XmuXlCZY/nR1rz4
 u9KV21xkgf+7UZMCkFNlAyAwG4l7o5QqYimushU7N4wIaUIYq7afXzZvjmXHIC8wYr/T0EB+lGxHH
 MkfGkBNAH7eOTlPxvX+B/33svT1W3zPjq5/Kff2M8ZSfLr7WUak70lDYzQX9q2YxEqVp3dEyPJJ/0
 aOI76qdw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tWB8H-00Dt3J-Dc; Fri, 10 Jan 2025 10:16:45 +0100
Message-ID: <10052b1d-647d-40c8-a69a-ebea4d9aff99@igalia.com>
Date: Fri, 10 Jan 2025 09:16:44 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z4AqiSBnJshH0PRU@lstrano-desk.jf.intel.com>
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


On 09/01/2025 19:59, Matthew Brost wrote:
> On Wed, Jan 08, 2025 at 06:55:16PM +0000, Tvrtko Ursulin wrote:
>>
>> On 08/01/2025 16:57, Danilo Krummrich wrote:
>>> On Wed, Jan 08, 2025 at 03:13:39PM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 08/01/2025 08:31, Danilo Krummrich wrote:
>>>>> On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>
>>>>> "Deadline scheduler and other ideas"
>>>>>
>>>>> There's a few patches that could be sent outside the scope of this series, e.g.
>>>>> the first one.
>>>>>
>>>>> I think it would make sense to do so.
>>>>
>>>> For now I'll keep them at the head of this RFC and as they get acked or
>>>> r-b-ed I can easily send them standalone or re-ordered. Until then having
>>>> the series separate would make the RFC not standalone.
>>>>
>>>>>> <tldr>
>>>>>> Replacing FIFO with a flavour of deadline driven scheduling and removing round-
>>>>>> robin. Connecting the scheduler with dma-fence deadlines. First draft and
>>>>>> testing by different drivers and feedback would be nice. I was only able to test
>>>>>> it with amdgpu. Other drivers may not even compile.
>>>>>
>>>>> What are the results from your tests with amdgpu? Do you have some measurements?
>>>>
>>>> We already covered this in the thread with Philipp to a degree. Tl;dr; the
>>>> main idea is whether we simplify the code and at least not regress.
>>>>
>>>> I don't expect improvements on the amdgpu side with the workloads like games
>>>> and benchmarks. I did not measure anything significant apart that priorities
>>>> seem to work with the run queues removed.
>>>
>>> I appreaciate the effort, and generally I like the idea, but I also must admit
>>> that this isn't the most convincing motiviation for such an integral change
>>> (especially the "at least not regress" part).
>>
>> It is challenging yes. But for completeness the full context of what you
>> quoted (if you also read my replies to Philipp) was *if* we can shrink the
>> code base, add some fairness to FIFO, *and* not regress then those three
>> added together would IMHO not be bad. We shouldn't be scared to touch it
>> because only touching it you can truly understand the gotchas which any
>> amount of kerneldoc will not help with.
>>> I'd still like to encourage you to send the small cleanups separately, get them
>>> in soon and leave the deadline scheduler as a separate RFC.
>>>
>>> Meanwhile, Philipp is working on getting documentation straight and digging into
>>> all the FIXMEs of the scheduler getting to a cleaner baseline. And with your
>>> cleanups you're already helping with that.
>>>
>>> For now, I'd prefer to leave the deadline scheduler stuff for when things are a
>>> bit more settled and / or drivers declare the need.
>>
>> I just sent v2:
>>
>> About motivation for the documenting efforts:
>>
>>   13 files changed, 424 insertions(+), 576 deletions(-)
>>
>> Fewer lines to document. ;)
>>
>> On a serious note, I ordered the series (mostly*) so you can read it in
>> order and for patches/ideas you like please say and I can extract and send
>> separately if you want. I am reluctant to extract things beforehand, before
>> knowing which ones people will like and so far there is only one with acks.
>>
>> *)
>> Mostly because perhaps "drm/sched: Queue all free credits in one worker
>> invocation" could be interesting to move before the most.
>>
> 
> I looked into this. When I originally changed the scheduler from a
> kthread to a worker, I designed it the way your patch implements it:
> looping in the worker until credits run out or no jobs are available.
> 
> If I recall correctly, the feedback from Christian (or Luben?) was to
> rely on the work queue's requeuing mechanism to submit more than one
> job. From a latency perspective, there might be a small benefit, but
> it's more likely that if you queue two jobs back-to-back, even when
> relying on the work queue's rescheduling, the first job will still be
> running on the hardware, nullifying any potential latency improvement.
> 
>  From a fairness perspective, multiplexing across multiple work queues
> one job at a time makes a bit more sense, in my opinion.

You mean multiplexing across multiple _entities_? Because work queue is 
only one. That it unchanged with my patch. Ie. it is not changing to 
pick jobs from a single entity but still picks a job at a time from the 
top entity. And top entity can change as jobs are popped. What remains 
is the question of why burn CPU cycles and do it in a roundabout way if 
it is very easy to do it directly and at the same time avoid that 
unconditional final wakeup when queues are empty.

Regards,

Tvrtko

>>>> Where something could show is if someone is aware of a workload where normal
>>>> prio starves low. Since one part of the idea is that with the "deadline"
>>>> scheme those should work a little bit more balanced.
>>>>
>>>> Also again, feedback (including testing feedback from other drivers) would
>>>> be great, and ideas of which workloads to test.
>>>
>>> Unfortunately, there's not much I can tell from the Nouveau side of things,
>>> since we're using the firmware scheduler scheme (one entity per scheduler) and
>>> hence the scheduling strategy isn't that relevant.
>>
>> Yeah. Hopefully someone with more appropriate hardware gets intrigued to try
>> it out, or to suggest interesting workloads.
>>
>> Until then I happy to keep it alive in the background and as said you can
>> pick and choose the parts you like.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>>
>>>> Btw I will send a respin in a day or so which will clean up some things and
>>>> adds some more tiny bits.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>
