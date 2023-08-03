Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DC76EDEB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 17:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F710E615;
	Thu,  3 Aug 2023 15:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311B110E614;
 Thu,  3 Aug 2023 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691075969; x=1722611969;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IwIp9mAeSUxdMV6gG99jqHSfSygKT6jIXE1MdkAWR2E=;
 b=gegBTgaMZVjDtACOb/yWSqZMipIIw5NMNe2dFdIdKgup9QCSha2Cod23
 tJWClFO1/msSD4CCbpEePNdTKua2UmwbqN3e1sZ9cxRePsoIKFBQggRgr
 fIe7J8IN/cRo3657hbHeGGvFChQZGdqtuTIBf8YXlb3PW4PwqCaAUMn5R
 I0essaXz9Hd1Tyrj04bZqoUIk3XTBm/hinePuOPwkTKz6H7bZa/nyEzSJ
 azZFLatvvGqRxsNsbFCIcFbfx0b0FVxxmcuT3QwehmniEw+vQvmaMzmH+
 nAwzjFLSJpZDfyZUnYyqFuWr4MCsObh55lr9Phsfcqew60qquvovQdnh7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="367363727"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="367363727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 08:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="729635690"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="729635690"
Received: from rrybakov-mobl1.ger.corp.intel.com (HELO [10.213.197.207])
 ([10.213.197.207])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 08:19:24 -0700
Message-ID: <6ce4ae3b-0633-85d4-dc56-091166b24e8d@linux.intel.com>
Date: Thu, 3 Aug 2023 16:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/8] drm/sched: Convert drm scheduler to use a work queue
 rather than kthread
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
 <20230801205103.627779-2-matthew.brost@intel.com>
 <1ac4423c-42cd-490d-245b-bf81ef26900d@linux.intel.com>
 <ZMu9AIygJb7U9IXr@DUT025-TGLU.fm.intel.com>
 <42afed03-ab5d-dad7-52ca-a07f238593a2@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <42afed03-ab5d-dad7-52ca-a07f238593a2@amd.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/08/2023 15:56, Christian König wrote:
> Am 03.08.23 um 16:43 schrieb Matthew Brost:
>> On Thu, Aug 03, 2023 at 11:11:13AM +0100, Tvrtko Ursulin wrote:
>>> On 01/08/2023 21:50, Matthew Brost wrote:
>>> [SNIP]
>>>>        sched->ops = ops;
>>>>        sched->hw_submission_limit = hw_submission;
>>>>        sched->name = name;
>>>> +    sched->run_wq = run_wq ? : system_wq;
>>> I still think it is not nice to implicitly move everyone over to the 
>>> shared
>>> system wq. Maybe even more so with now one at a time execution, since 
>>> effect
>>> on latency can be even greater.
>>>
>> No one that has a stake in this has pushed back that I can recall. Open
>> to feedback stakeholders (maintainers of drivers that use the drm
>> scheduler).
 >
> No objections to using the system_wq here. Drivers can still pass in 
> their own or simply use system_highpri_wq instead.
> 
> Additional to that the system_wq isn't single threaded, it will create 
> as much threads as needed to fully utilize all CPUs.
> 
>>   The i915 doesn't use the DRM scheduler last time I looked.
>> Has that changed?
>>> Have you considered kthread_work as a backend? Maybe it would work to 
>>> have
>>> callers pass in a kthread_worker they create, or provide a drm_sched 
>>> helper
>>> to create one, which would then be passed to drm_sched_init.
>>>
>>> That would enable per driver kthread_worker, or per device, or whatever
>>> granularity each driver would want/need/desire.
>>>
>>> driver init:
>>> struct drm_sched_worker = drm_sched_create_worker(...);
>>>
>>> queue/whatever init:
>>> drm_sched_init(.., worker, ...);
>>>
>> This idea doesn't seem to work for varitey of reasons. Will type it out
>> if needed but not going to spend time on this unless someone with a
>> stake raises this as an issue.
> 
> Agree completely. kthread_work is for real time workers IIRC.

AFAIK it is indicated if one needs to tweak the kthread priority, but 
that is not the only use case.

I am curious to know why the idea does not work for variety of reasons.

>>> You could create one inside drm_sched_init if not passed in, which would
>>> keep the behaviour for existing drivers more similar - they would 
>>> still have
>>> a 1:1 kthread context for their exclusive use.
>>>
>> Part of the idea of a work queue is so a user can't directly create a
>> kthread via an IOCTL (XE_EXEC_QUEUE_CREATE). What you suggesting exposes
>> this issue.
> 
> Yeah, prevent that is indeed a very good idea.

Nope, I wasn't suggesting that at all.

I was suggesting as many kthread_workers (these are threads) as the 
implementation wants. Xe can create one per device. Someone else can 
create one per hw engine, whatever.

One kthread_*work* per entity does not mean one thread per 
XE_EXEC_QUEUE_CREATE. Kthread_work is just a unit of work executed by 
the kthread_worker thread. Same in that conceptual relationship as 
workqueue and workitem.

Difference is it may work better for single-shot re-arming design if 
regression in submission latency concerns any stakeholders.

>>> And I *think* self-re-arming would be less problematic latency wise 
>>> since
>>> kthread_worker consumes everything queued without relinquishing 
>>> control and
>>> execution context would be guaranteed not to be shared with random 
>>> system
>>> stuff.
>>>
>> So this is essentially so we can use a loop? Seems like a lot effort for
>> what is pure speculation. Again if a stakeholder raises an issue we can
>> address then.
> 
> Instead of a loop what you usually do in the worker is to submit one 
> item (if possible) and then re-queue yourself if there is more work to do.
> 
> This way you give others chance to run as well and/or cancel the work 
> etc...

Yeah I was pointing out loop in the worker was bad months ago (or more) 
so it is not about that. Here my point is whether it can be done better 
than silently convert everyone to system_wq.

Hence my proposal is to *keep* closer to the thread semantics for 
everyone and at the same time _allow_ the option of custom 
workqueue/whatever.

Where is the problem there?

Regards,

Tvrtko
