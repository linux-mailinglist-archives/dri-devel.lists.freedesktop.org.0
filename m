Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB14A665728
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30C310E555;
	Wed, 11 Jan 2023 09:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F0210E4F3;
 Wed, 11 Jan 2023 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673428630; x=1704964630;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mlCe+j3sO4q/9+XMVqj8tpjjZT/EmCvheQVd2MvwBCU=;
 b=Ibf8LOoDxqn6m0XodqniSHtZYXaXyKA8597lYcmGNmpATeoM7cg+0M2r
 76zih6qK6fKsrQGBqvm+TORkiT2u8dLHWxcr9ivB81+Rnor/a4QYYzioz
 QxhPrZ5gIuSLdKnnKVaoEuBaIldRjqHoi+eSBoPy9MpgP5UiQDyfH5d9z
 E0CsO+nildKLA8ZQMoygxyTz5VeerP1VtmWBJAnSguA36b7FYuQXBiGpR
 Kx59PF3plSuQ2+JCSdNlhkti7fN+48ArbI0HL3+rn94ILoENPJTvgB2rB
 TrdJDx7hQ6EK7G5tNK8TWwvI4oi7JGAgyp5zDeoK9HB0ke20g4OLZj9Z8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322068338"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="322068338"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:17:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="689713278"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="689713278"
Received: from dhuchimu-mobl3.amr.corp.intel.com (HELO [10.212.68.70])
 ([10.212.68.70])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:17:03 -0800
Message-ID: <703310df-21c8-57ac-8b27-4ae342265df1@linux.intel.com>
Date: Wed, 11 Jan 2023 09:17:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
 <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
 <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
 <Y722HdwGKB8swy0B@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y722HdwGKB8swy0B@DUT025-TGLU.fm.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/01/2023 19:01, Matthew Brost wrote:
> On Tue, Jan 10, 2023 at 04:50:55PM +0000, Tvrtko Ursulin wrote:
>>
>> On 10/01/2023 15:55, Matthew Brost wrote:
>>> On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 10/01/2023 11:28, Tvrtko Ursulin wrote:
>>>>>
>>>>>
>>>>> On 09/01/2023 17:27, Jason Ekstrand wrote:
>>>>>
>>>>> [snip]
>>>>>
>>>>>>        >>> AFAICT it proposes to have 1:1 between *userspace* created
>>>>>>       contexts (per
>>>>>>        >>> context _and_ engine) and drm_sched. I am not sure avoiding
>>>>>>       invasive changes
>>>>>>        >>> to the shared code is in the spirit of the overall idea and
>>>>>> instead
>>>>>>        >>> opportunity should be used to look at way to refactor/improve
>>>>>>       drm_sched.
>>>>>>
>>>>>>
>>>>>> Maybe?  I'm not convinced that what Xe is doing is an abuse at all
>>>>>> or really needs to drive a re-factor.  (More on that later.)
>>>>>> There's only one real issue which is that it fires off potentially a
>>>>>> lot of kthreads. Even that's not that bad given that kthreads are
>>>>>> pretty light and you're not likely to have more kthreads than
>>>>>> userspace threads which are much heavier.  Not ideal, but not the
>>>>>> end of the world either.  Definitely something we can/should
>>>>>> optimize but if we went through with Xe without this patch, it would
>>>>>> probably be mostly ok.
>>>>>>
>>>>>>        >> Yes, it is 1:1 *userspace* engines and drm_sched.
>>>>>>        >>
>>>>>>        >> I'm not really prepared to make large changes to DRM scheduler
>>>>>>       at the
>>>>>>        >> moment for Xe as they are not really required nor does Boris
>>>>>>       seem they
>>>>>>        >> will be required for his work either. I am interested to see
>>>>>>       what Boris
>>>>>>        >> comes up with.
>>>>>>        >>
>>>>>>        >>> Even on the low level, the idea to replace drm_sched threads
>>>>>>       with workers
>>>>>>        >>> has a few problems.
>>>>>>        >>>
>>>>>>        >>> To start with, the pattern of:
>>>>>>        >>>
>>>>>>        >>>    while (not_stopped) {
>>>>>>        >>>     keep picking jobs
>>>>>>        >>>    }
>>>>>>        >>>
>>>>>>        >>> Feels fundamentally in disagreement with workers (while
>>>>>>       obviously fits
>>>>>>        >>> perfectly with the current kthread design).
>>>>>>        >>
>>>>>>        >> The while loop breaks and worker exists if no jobs are ready.
>>>>>>
>>>>>>
>>>>>> I'm not very familiar with workqueues. What are you saying would fit
>>>>>> better? One scheduling job per work item rather than one big work
>>>>>> item which handles all available jobs?
>>>>>
>>>>> Yes and no, it indeed IMO does not fit to have a work item which is
>>>>> potentially unbound in runtime. But it is a bit moot conceptual mismatch
>>>>> because it is a worst case / theoretical, and I think due more
>>>>> fundamental concerns.
>>>>>
>>>>> If we have to go back to the low level side of things, I've picked this
>>>>> random spot to consolidate what I have already mentioned and perhaps
>>>>> expand.
>>>>>
>>>>> To start with, let me pull out some thoughts from workqueue.rst:
>>>>>
>>>>> """
>>>>> Generally, work items are not expected to hog a CPU and consume many
>>>>> cycles. That means maintaining just enough concurrency to prevent work
>>>>> processing from stalling should be optimal.
>>>>> """
>>>>>
>>>>> For unbound queues:
>>>>> """
>>>>> The responsibility of regulating concurrency level is on the users.
>>>>> """
>>>>>
>>>>> Given the unbound queues will be spawned on demand to service all queued
>>>>> work items (more interesting when mixing up with the system_unbound_wq),
>>>>> in the proposed design the number of instantiated worker threads does
>>>>> not correspond to the number of user threads (as you have elsewhere
>>>>> stated), but pessimistically to the number of active user contexts. That
>>>>> is the number which drives the maximum number of not-runnable jobs that
>>>>> can become runnable at once, and hence spawn that many work items, and
>>>>> in turn unbound worker threads.
>>>>>
>>>>> Several problems there.
>>>>>
>>>>> It is fundamentally pointless to have potentially that many more threads
>>>>> than the number of CPU cores - it simply creates a scheduling storm.
>>>>
>>>> To make matters worse, if I follow the code correctly, all these per user
>>>> context worker thread / work items end up contending on the same lock or
>>>> circular buffer, both are one instance per GPU:
>>>>
>>>> guc_engine_run_job
>>>>    -> submit_engine
>>>>       a) wq_item_append
>>>>           -> wq_wait_for_space
>>>>             -> msleep
>>>
>>> a) is dedicated per xe_engine
>>
>> Hah true, what its for then? I thought throttling the LRCA ring is done via:
>>
> 
> This is a per guc_id 'work queue' which is used for parallel submission
> (e.g. multiple LRC tail values need to written atomically by the GuC).
> Again in practice there should always be space.

Speaking of guc id, where does blocking when none are available happen 
in the non parallel case?

>>    drm_sched_init(&ge->sched, &drm_sched_ops,
>> 		 e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
>>
>> Is there something more to throttle other than the ring? It is throttling
>> something using msleeps..
>>
>>> Also you missed the step of programming the ring which is dedicated per xe_engine
>>
>> I was trying to quickly find places which serialize on something in the
>> backend, ringbuffer emission did not seem to do that but maybe I missed
>> something.
>>
> 
> xe_ring_ops vfunc emit_job is called to write the ring.

Right but does it serialize between different contexts, I didn't spot 
that it does in which case it wasn't relevant to the sub story.

>>>
>>>>       b) xe_guc_ct_send
>>>>           -> guc_ct_send
>>>>             -> mutex_lock(&ct->lock);
>>>>             -> later a potential msleep in h2g_has_room
>>>
>>> Techincally there is 1 instance per GT not GPU, yes this is shared but
>>> in practice there will always be space in the CT channel so contention
>>> on the lock should be rare.
>>
>> Yeah I used the term GPU to be more understandable to outside audience.
>>
>> I am somewhat disappointed that the Xe opportunity hasn't been used to
>> improve upon the CT communication bottlenecks. I mean those backoff sleeps
>> and lock contention. I wish there would be a single thread in charge of the
>> CT channel and internal users (other parts of the driver) would be able to
>> send their requests to it in a more efficient manner, with less lock
>> contention and centralized backoff.
>>
> 
> Well the CT backend was more or less a complete rewrite. Mutexes
> actually work rather well to ensure fairness compared to the spin locks
> used in the i915. This code was pretty heavily reviewed by Daniel and
> both of us landed a big mutex for all of the CT code compared to the 3
> or 4 spin locks used in the i915.

Are the "nb" sends gone? But that aside, I wasn't meaning just the 
locking but the high level approach. Never  mind.

>>> I haven't read your rather long reply yet, but also FWIW using a
>>> workqueue has suggested by AMD (original authors of the DRM scheduler)
>>> when we ran this design by them.
>>
>> Commit message says nothing about that. ;)
>>
> 
> Yea I missed that, will fix in the next rev. Just dug through my emails
> and Christian suggested a work queue and Andrey also gave some input on
> the DRM scheduler design.
> 
> Also in the next will likely update the run_wq to be passed in by the
> user.

Yes, and IMO that may need to be non-optional.

Regards,

Tvrtko
