Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E26656FA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 10:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48E210E0FF;
	Wed, 11 Jan 2023 09:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5CB10E0FF;
 Wed, 11 Jan 2023 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673428188; x=1704964188;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+8ge6UcBU1Sx1We8+zdcVK2kPkABz43VHUzank8jTNk=;
 b=DwxCGNx9n903RgltA6gR6qqwq6LtkMlUHtS0KoRHFVTtx5ubZ0WhkAWJ
 oMJBfq0GXL9GGFcy0S4NOeE9MTQ9RAvFoSs5VV6MziOcw1RN2oNo2wmU3
 qQDSkFwvBk8iJv7zcU1TKQaUQadrsnVhH86xivItYVDC1JpvdIlJ4P5G4
 YZmUx6z5qdsVf+Lntf1Ah3R/ZJa02FSbufKJqOAGi6SkTW+If4e9tkFOn
 r/+JR3O68ypDpG15MmpvNgiMQxBWz2ARDpoplqzF1gxrdD9qB/dbLLQ6m
 Pu2NFTr8qqGogqxYEDGKGSUwtRyTdh8seeeBZV4547ByX08GjBG/Ay5Vf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409606607"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="409606607"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:09:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="725846677"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="725846677"
Received: from dhuchimu-mobl3.amr.corp.intel.com (HELO [10.212.68.70])
 ([10.212.68.70])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 01:09:46 -0800
Message-ID: <a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com>
Date: Wed, 11 Jan 2023 09:09:45 +0000
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
 <Y72UpKPX6lr/ea7R@DUT025-TGLU.fm.intel.com>
 <Y74NSVeWdiKxdYci@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y74NSVeWdiKxdYci@DUT025-TGLU.fm.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/01/2023 01:13, Matthew Brost wrote:
> On Tue, Jan 10, 2023 at 04:39:00PM +0000, Matthew Brost wrote:
>> On Tue, Jan 10, 2023 at 11:28:08AM +0000, Tvrtko Ursulin wrote:
>>>
>>>
>>> On 09/01/2023 17:27, Jason Ekstrand wrote:
>>>
>>> [snip]
>>>
>>>>       >>> AFAICT it proposes to have 1:1 between *userspace* created
>>>>      contexts (per
>>>>       >>> context _and_ engine) and drm_sched. I am not sure avoiding
>>>>      invasive changes
>>>>       >>> to the shared code is in the spirit of the overall idea and instead
>>>>       >>> opportunity should be used to look at way to refactor/improve
>>>>      drm_sched.
>>>>
>>>>
>>>> Maybe?  I'm not convinced that what Xe is doing is an abuse at all or
>>>> really needs to drive a re-factor.  (More on that later.)  There's only
>>>> one real issue which is that it fires off potentially a lot of kthreads.
>>>> Even that's not that bad given that kthreads are pretty light and you're
>>>> not likely to have more kthreads than userspace threads which are much
>>>> heavier.  Not ideal, but not the end of the world either.  Definitely
>>>> something we can/should optimize but if we went through with Xe without
>>>> this patch, it would probably be mostly ok.
>>>>
>>>>       >> Yes, it is 1:1 *userspace* engines and drm_sched.
>>>>       >>
>>>>       >> I'm not really prepared to make large changes to DRM scheduler
>>>>      at the
>>>>       >> moment for Xe as they are not really required nor does Boris
>>>>      seem they
>>>>       >> will be required for his work either. I am interested to see
>>>>      what Boris
>>>>       >> comes up with.
>>>>       >>
>>>>       >>> Even on the low level, the idea to replace drm_sched threads
>>>>      with workers
>>>>       >>> has a few problems.
>>>>       >>>
>>>>       >>> To start with, the pattern of:
>>>>       >>>
>>>>       >>>    while (not_stopped) {
>>>>       >>>     keep picking jobs
>>>>       >>>    }
>>>>       >>>
>>>>       >>> Feels fundamentally in disagreement with workers (while
>>>>      obviously fits
>>>>       >>> perfectly with the current kthread design).
>>>>       >>
>>>>       >> The while loop breaks and worker exists if no jobs are ready.
>>>>
>>>>
>>>> I'm not very familiar with workqueues. What are you saying would fit
>>>> better? One scheduling job per work item rather than one big work item
>>>> which handles all available jobs?
>>>
>>> Yes and no, it indeed IMO does not fit to have a work item which is
>>> potentially unbound in runtime. But it is a bit moot conceptual mismatch
>>> because it is a worst case / theoretical, and I think due more fundamental
>>> concerns.
>>>
>>> If we have to go back to the low level side of things, I've picked this
>>> random spot to consolidate what I have already mentioned and perhaps expand.
>>>
>>> To start with, let me pull out some thoughts from workqueue.rst:
>>>
>>> """
>>> Generally, work items are not expected to hog a CPU and consume many cycles.
>>> That means maintaining just enough concurrency to prevent work processing
>>> from stalling should be optimal.
>>> """
>>>
>>> For unbound queues:
>>> """
>>> The responsibility of regulating concurrency level is on the users.
>>> """
>>>
>>> Given the unbound queues will be spawned on demand to service all queued
>>> work items (more interesting when mixing up with the system_unbound_wq), in
>>> the proposed design the number of instantiated worker threads does not
>>> correspond to the number of user threads (as you have elsewhere stated), but
>>> pessimistically to the number of active user contexts. That is the number
>>> which drives the maximum number of not-runnable jobs that can become
>>> runnable at once, and hence spawn that many work items, and in turn unbound
>>> worker threads.
>>>
>>> Several problems there.
>>>
>>> It is fundamentally pointless to have potentially that many more threads
>>> than the number of CPU cores - it simply creates a scheduling storm.
>>>
>>
>> We can use a different work queue if this is an issue, have a FIXME
>> which indicates we should allow the user to pass in the work queue.
>>
>>> Unbound workers have no CPU / cache locality either and no connection with
>>> the CPU scheduler to optimize scheduling patterns. This may matter either on
>>> large systems or on small ones. Whereas the current design allows for
>>> scheduler to notice userspace CPU thread keeps waking up the same drm
>>> scheduler kernel thread, and so it can keep them on the same CPU, the
>>> unbound workers lose that ability and so 2nd CPU might be getting woken up
>>> from low sleep for every submission.
>>>
>>
>> I guess I don't understand kthread vs. workqueue scheduling internals.
>>   
> 
> Looked into this and we are not using unbound workers rather we are just
> using the system_wq which is indeed bound. Again we can change this so a
> user can just pass in worker too. After doing a of research bound
> workers allows the scheduler to use locality too avoid that exact
> problem your reading.
> 
> TL;DR I'm not buying any of these arguments although it is possible I am
> missing something.

Well you told me it's using unbound.. message id 
Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com:

"""
Right now the system_unbound_wq is used which does have a limit on the
number of threads, right? I do have a FIXME to allow a worker to be
passed in similar to TDR.
"""

With bound workers you will indeed get CPU locality. I am not sure what 
it will do in terms of concurrency. If it will serialize work items to 
fewer spawned workers that will be good for the CT contention issue, but 
may negatively affect latency. And possibly preemption / time slicing 
decisions since the order of submitting to the backend will not be in 
the order of context priority, hence high prio may be submitted right 
after low and immediately trigger preemption.

Anyway, since you are not buying any arguments on paper perhaps you are 
more open towards testing. If you would adapt gem_wsim for Xe you would 
be able to spawn N simulated transcode sessions on any Gen11+ machine 
and try it out.

For example:

gem_wsim -w benchmarks/wsim/media_load_balance_fhd26u7.wsim -c 36 -r 600

That will run you 36 parallel transcoding sessions streams for 600 
frames each. No client setup needed whatsoever apart from compiling IGT.

In the past that was quite a handy tool to identify scheduling issues, 
or validate changes against. All workloads with the media prefix have 
actually been hand crafted by looking at what real media pipelines do 
with real data. Few years back at least.

It could show you real world behaviour of the kworkers approach and it 
could also enable you to cross reference any power and performance 
changes relative to i915. Background story there is that media servers 
like to fit N streams to a server and if a change comes along which 
suddenly makes only N-1 stream fit before dropping out of realtime, 
that's a big problem.

If you will believe me there is value in that kind of testing I am happy 
to help you add Xe support to the tool, time permitting so possibly 
guidance only at the moment.

Regards,

Tvrtko
