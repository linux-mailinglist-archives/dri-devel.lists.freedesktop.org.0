Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5601664687
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC12D10E11F;
	Tue, 10 Jan 2023 16:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBB210E11F;
 Tue, 10 Jan 2023 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673369458; x=1704905458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qi8Pe7jNLFOeLNURzX/Li6I7sKRLIxRncn3BhQoE1Dg=;
 b=kvKlzAL5ggm5H/HCK3/r4vXrCzXTjsJEvf+6OEVuIpE4CfLAFLz/bCMl
 0kckxjBKLzCzQAC4xZYNJsdEifnmNbnt8gRmQjOry7X7ktn1Kp1qIJ2IB
 NCdmrn5QTdLsTKGH15mBdjoU4HJE4+GhvL5F6DlmcenSk9aM6wi7brDWv
 sNdn1vwQF/LTcvDTBTnng+blL26qDOctXP9CN/iyePxPGhnZ/RCyjVz7S
 pMpqkbX3Nh+0h9RBL9hDmdann0EvcX5uHof+pnEk6Shg+romKy2bk5KyH
 pRHXHb+3rSS1LTEZ4wI8yPgyKFnPu3KzfGpx14jDsTk+Lj+q9TEedWXJ7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="306707800"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="306707800"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 08:50:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="657114982"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="657114982"
Received: from gregoire-mobl3.amr.corp.intel.com (HELO [10.212.88.71])
 ([10.212.88.71])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 08:50:56 -0800
Message-ID: <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
Date: Tue, 10 Jan 2023 16:50:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
 <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
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


On 10/01/2023 15:55, Matthew Brost wrote:
> On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
>>
>> On 10/01/2023 11:28, Tvrtko Ursulin wrote:
>>>
>>>
>>> On 09/01/2023 17:27, Jason Ekstrand wrote:
>>>
>>> [snip]
>>>
>>>>       >>> AFAICT it proposes to have 1:1 between *userspace* created
>>>>      contexts (per
>>>>       >>> context _and_ engine) and drm_sched. I am not sure avoiding
>>>>      invasive changes
>>>>       >>> to the shared code is in the spirit of the overall idea and
>>>> instead
>>>>       >>> opportunity should be used to look at way to refactor/improve
>>>>      drm_sched.
>>>>
>>>>
>>>> Maybe?  I'm not convinced that what Xe is doing is an abuse at all
>>>> or really needs to drive a re-factor.  (More on that later.)
>>>> There's only one real issue which is that it fires off potentially a
>>>> lot of kthreads. Even that's not that bad given that kthreads are
>>>> pretty light and you're not likely to have more kthreads than
>>>> userspace threads which are much heavier.  Not ideal, but not the
>>>> end of the world either.  Definitely something we can/should
>>>> optimize but if we went through with Xe without this patch, it would
>>>> probably be mostly ok.
>>>>
>>>>       >> Yes, it is 1:1 *userspace* engines and drm_sched.
>>>>       >>
>>>>       >> I'm not really prepared to make large changes to DRM scheduler
>>>>      at the
>>>>       >> moment for Xe as they are not really required nor does Boris
>>>>      seem they
>>>>       >> will be required for his work either. I am interested to see
>>>>      what Boris
>>>>       >> comes up with.
>>>>       >>
>>>>       >>> Even on the low level, the idea to replace drm_sched threads
>>>>      with workers
>>>>       >>> has a few problems.
>>>>       >>>
>>>>       >>> To start with, the pattern of:
>>>>       >>>
>>>>       >>>    while (not_stopped) {
>>>>       >>>     keep picking jobs
>>>>       >>>    }
>>>>       >>>
>>>>       >>> Feels fundamentally in disagreement with workers (while
>>>>      obviously fits
>>>>       >>> perfectly with the current kthread design).
>>>>       >>
>>>>       >> The while loop breaks and worker exists if no jobs are ready.
>>>>
>>>>
>>>> I'm not very familiar with workqueues. What are you saying would fit
>>>> better? One scheduling job per work item rather than one big work
>>>> item which handles all available jobs?
>>>
>>> Yes and no, it indeed IMO does not fit to have a work item which is
>>> potentially unbound in runtime. But it is a bit moot conceptual mismatch
>>> because it is a worst case / theoretical, and I think due more
>>> fundamental concerns.
>>>
>>> If we have to go back to the low level side of things, I've picked this
>>> random spot to consolidate what I have already mentioned and perhaps
>>> expand.
>>>
>>> To start with, let me pull out some thoughts from workqueue.rst:
>>>
>>> """
>>> Generally, work items are not expected to hog a CPU and consume many
>>> cycles. That means maintaining just enough concurrency to prevent work
>>> processing from stalling should be optimal.
>>> """
>>>
>>> For unbound queues:
>>> """
>>> The responsibility of regulating concurrency level is on the users.
>>> """
>>>
>>> Given the unbound queues will be spawned on demand to service all queued
>>> work items (more interesting when mixing up with the system_unbound_wq),
>>> in the proposed design the number of instantiated worker threads does
>>> not correspond to the number of user threads (as you have elsewhere
>>> stated), but pessimistically to the number of active user contexts. That
>>> is the number which drives the maximum number of not-runnable jobs that
>>> can become runnable at once, and hence spawn that many work items, and
>>> in turn unbound worker threads.
>>>
>>> Several problems there.
>>>
>>> It is fundamentally pointless to have potentially that many more threads
>>> than the number of CPU cores - it simply creates a scheduling storm.
>>
>> To make matters worse, if I follow the code correctly, all these per user
>> context worker thread / work items end up contending on the same lock or
>> circular buffer, both are one instance per GPU:
>>
>> guc_engine_run_job
>>   -> submit_engine
>>      a) wq_item_append
>>          -> wq_wait_for_space
>>            -> msleep
> 
> a) is dedicated per xe_engine

Hah true, what its for then? I thought throttling the LRCA ring is done via:

   drm_sched_init(&ge->sched, &drm_sched_ops,
		 e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,

Is there something more to throttle other than the ring? It is 
throttling something using msleeps..

> Also you missed the step of programming the ring which is dedicated per xe_engine

I was trying to quickly find places which serialize on something in the 
backend, ringbuffer emission did not seem to do that but maybe I missed 
something.

> 
>>      b) xe_guc_ct_send
>>          -> guc_ct_send
>>            -> mutex_lock(&ct->lock);
>>            -> later a potential msleep in h2g_has_room
> 
> Techincally there is 1 instance per GT not GPU, yes this is shared but
> in practice there will always be space in the CT channel so contention
> on the lock should be rare.

Yeah I used the term GPU to be more understandable to outside audience.

I am somewhat disappointed that the Xe opportunity hasn't been used to 
improve upon the CT communication bottlenecks. I mean those backoff 
sleeps and lock contention. I wish there would be a single thread in 
charge of the CT channel and internal users (other parts of the driver) 
would be able to send their requests to it in a more efficient manner, 
with less lock contention and centralized backoff.

> I haven't read your rather long reply yet, but also FWIW using a
> workqueue has suggested by AMD (original authors of the DRM scheduler)
> when we ran this design by them.

Commit message says nothing about that. ;)

Regards,

Tvrtko
