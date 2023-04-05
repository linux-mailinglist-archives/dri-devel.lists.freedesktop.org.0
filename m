Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F16D7CBD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72F810E937;
	Wed,  5 Apr 2023 12:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D36810E933;
 Wed,  5 Apr 2023 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680698153; x=1712234153;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SgG8ztXlmafCYYDO/N3L70h9VS6+aMIqsOeZswXpU2w=;
 b=Xfg6yYAZ1URe5iKnZ8mzLFgtBLIQE4A3xVhr9kfTW9StoQl/HrpDGIEH
 noIABlZxkG4gKMVF9ZXYaXa7nRLdHOvdg8KyHyEcSmGTMqJ0FSlZBfpdr
 BbbJGQ6tNwZfmAmwJIQ9mAM0upuYgxn71Z8pIl20x6KgvhpuoYfJJ1hh2
 tUScSpVkP0Y36VWFQPxTqgEN9kX8kB2642LrVYgxVxSjFHMXa4jExNZvi
 HLdWFCjUwy+NIlODmoQSFoVfRsSlB7LqsOndcVX0nGO+cv+UD57Kp1KvK
 lMFlfMi5H8LYTyIW8KoGlSgCSyXhzuSeY/6d2OtD80O+eImJJ3pbW+37p A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322097095"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="322097095"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751242943"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="751242943"
Received: from dcolomor-mobl1.ger.corp.intel.com (HELO [10.249.33.69])
 ([10.249.33.69])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:35:48 -0700
Message-ID: <cece14bb-d3c5-3772-855e-bac0bb7766d7@linux.intel.com>
Date: Wed, 5 Apr 2023 14:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
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
Cc: robdclark@chromium.org, airlied@linux.ie, lina@asahilina.net,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/4/23 21:25, Daniel Vetter wrote:
> On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
>> On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) wrote:
>>> On 4/4/23 15:10, Christian König wrote:
>>>> Am 04.04.23 um 14:54 schrieb Thomas Hellström:
>>>>> Hi, Christian,
>>>>>
>>>>> On 4/4/23 11:09, Christian König wrote:
>>>>>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>>>>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>
>>>>>>> For long-running workloads, drivers either need to open-code
>>>>>>> completion
>>>>>>> waits, invent their own synchronization primitives or internally use
>>>>>>> dma-fences that do not obey the cross-driver dma-fence protocol, but
>>>>>>> without any lockdep annotation all these approaches are error prone.
>>>>>>>
>>>>>>> So since for example the drm scheduler uses dma-fences it is
>>>>>>> desirable for
>>>>>>> a driver to be able to use it for throttling and error
>>>>>>> handling also with
>>>>>>> internal dma-fences tha do not obey the cros-driver
>>>>>>> dma-fence protocol.
>>>>>>>
>>>>>>> Introduce long-running completion fences in form of
>>>>>>> dma-fences, and add
>>>>>>> lockdep annotation for them. In particular:
>>>>>>>
>>>>>>> * Do not allow waiting under any memory management locks.
>>>>>>> * Do not allow to attach them to a dma-resv object.
>>>>>>> * Introduce a new interface for adding callbacks making the
>>>>>>> helper adding
>>>>>>>     a callback sign off on that it is aware that the dma-fence may not
>>>>>>>     complete anytime soon. Typically this will be the
>>>>>>> scheduler chaining
>>>>>>>     a new long-running fence on another one.
>>>>>> Well that's pretty much what I tried before:
>>>>>> https://lwn.net/Articles/893704/
>>>>>>
>> I don't think this quite the same, this explictly enforces that we don't
>> break the dma-fence rules (in path of memory allocations, exported in
>> any way), essentially this just SW sync point reusing dma-fence the
>> infrastructure for signaling / callbacks. I believe your series tried to
>> export these fences to user space (admittedly I haven't fully read your
>> series).
>>
>> In this use case we essentially just want to flow control the ring via
>> the dma-scheduler + maintain a list of pending jobs so the TDR can be
>> used for cleanup if LR entity encounters an error. To me this seems
>> perfectly reasonable but I know dma-femce rules are akin to a holy war.
>>
>> If we return NULL in run_job, now we have to be able to sink all jobs
>> in the backend regardless on ring space, maintain a list of jobs pending
>> for cleanup after errors, and write a different cleanup path as now the
>> TDR doesn't work. Seems very, very silly to duplicate all of this code
>> when the DRM scheduler provides all of this for us. Also if we go this
>> route, now all drivers are going to invent ways to handle LR jobs /w the
>> DRM scheduler.
>>
>> This solution is pretty clear, mark the scheduler as LR, and don't
>> export any fences from the scheduler. If you try to export these fences
>> a blow up happens.
> The problem is if you mix things up. Like for resets you need all the
> schedulers on an engine/set-of-engines to quiescent or things get
> potentially hilarious. If you now have a scheduler in forever limbo, the
> dma_fence guarantees are right out the window.
>
> But the issue you're having is fairly specific if it's just about
> ringspace. I think the dumbest fix is to just block in submit if you run
> out of per-ctx ringspace, and call it a day. This notion that somehow the
> kernel is supposed to provide a bottomless queue of anything userspace
> submits simply doesn't hold up in reality (as much as userspace standards
> committees would like it to), and as long as it doesn't have a real-world
> perf impact it doesn't really matter why we end up blocking in the submit
> ioctl. It might also be a simple memory allocation that hits a snag in
> page reclaim.

So it seems the discussion around the long-running synchronization 
diverged a bit between threads and this thread was hijacked for 
preempt-fences and userptr.

Do I understand it correctly that the recommendation from both Daniel 
and Christian is to *not* use the drm scheduler for long-running compute 
jobs, but track any internal dma-fence dependencies (pipelined clearing 
or whatever) in a separate mechanism and handle unresolved dependencies 
on other long-running jobs using -EWOULDBLOCK?

Thanks,
Thomas





>>>>>> And the reasons why it was rejected haven't changed.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>> Yes, TBH this was mostly to get discussion going how we'd best
>>>>> tackle this problem while being able to reuse the scheduler for
>>>>> long-running workloads.
>>>>>
>>>>> I couldn't see any clear decision on your series, though, but one
>>>>> main difference I see is that this is intended for driver-internal
>>>>> use only. (I'm counting using the drm_scheduler as a helper for
>>>>> driver-private use). This is by no means a way to try tackle the
>>>>> indefinite fence problem.
>>>> Well this was just my latest try to tackle this, but essentially the
>>>> problems are the same as with your approach: When we express such
>>>> operations as dma_fence there is always the change that we leak that
>>>> somewhere.
>>>>
>>>> My approach of adding a flag noting that this operation is dangerous and
>>>> can't be synced with something memory management depends on tried to
>>>> contain this as much as possible, but Daniel still pretty clearly
>>>> rejected it (for good reasons I think).
>>>>
>>>>> We could ofc invent a completely different data-type that abstracts
>>>>> the synchronization the scheduler needs in the long-running case, or
>>>>> each driver could hack something up, like sleeping in the
>>>>> prepare_job() or run_job() callback for throttling, but those waits
>>>>> should still be annotated in one way or annotated one way or another
>>>>> (and probably in a similar way across drivers) to make sure we don't
>>>>> do anything bad.
>>>>>
>>>>>   So any suggestions as to what would be the better solution here
>>>>> would be appreciated.
>>>> Mhm, do we really the the GPU scheduler for that?
>>>>
>> I think we need to solve this within the DRM scheduler one way or
>> another.
> Yeah so if we conclude that the queue really must be bottomless then I
> agree drm-sched should help out sort out the mess. Because I'm guessing
> that every driver will have this issue. But that's a big if.
>
> I guess if we teach the drm scheduler that some jobs are fairly endless
> then maybe it wouldn't be too far-fetched to also teach it to wait for a
> previous one to finish (but not with the dma_fence that preempts, which we
> put into the dma_resv for memory management, but some other struct
> completion). The scheduler already has a concept of not stuffing too much
> stuff into the same queue after all, so this should fit?
> -Daniel
>
>
>>>> I mean in the 1 to 1 case  you basically just need a component which
>>>> collects the dependencies as dma_fence and if all of them are fulfilled
>>>> schedules a work item.
>>>>
>>>> As long as the work item itself doesn't produce a dma_fence it can then
>>>> still just wait for other none dma_fence dependencies.
>>>>
>>>> Then the work function could submit the work and wait for the result.
>>>>
>>>> The work item would then pretty much represent what you want, you can
>>>> wait for it to finish and pass it along as long running dependency.
>>>>
>>>> Maybe give it a funky name and wrap it up in a structure, but that's
>>>> basically it.
>>>>
>>> This very much sounds like a i915_sw_fence for the dependency tracking and
>>> dma_fence_work for the actual work although it's completion fence is a
>>> dma_fence.
>>>
>> Agree this does sound to i915ish as stated below one of mandates in Xe
>> was to use the DRM scheduler. Beyond that as someone who a submission
>> backend in the i915 and Xe, I love how the DRM scheduler works (single
>> entry point), it makes everything so much easier.
>>
>> Matt
>>
>>> Although that goes against the whole idea of a condition for merging the xe
>>> driver would be that we implement some sort of minimal scaffolding for
>>> long-running workloads in the drm scheduler, and the thinking behind that is
>>> to avoid implementing intel-specific solutions like those...
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Thanks,
>>>>>
>>>>> Thomas
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
