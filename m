Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F6424FC0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 11:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE75A6F3B3;
	Thu,  7 Oct 2021 09:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47556F3B3;
 Thu,  7 Oct 2021 09:09:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="213341403"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="213341403"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 02:09:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="657317449"
Received: from cleane-mobl.ger.corp.intel.com (HELO [10.213.249.175])
 ([10.213.249.175])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 02:09:53 -0700
Subject: Re: [RFC 1/8] sched: Add nice value change notifier
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: "Wanghui (John)" <john.wanghui@huawei.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
 <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
 <CAGsJ_4w5Y4=v93YmTrXJ6hDgjKshxiAZ-ox-Nz_7uRwe4ECtdw@mail.gmail.com>
 <8381e87d-ef7f-4759-569b-f6dabeb02939@linux.intel.com>
 <CAGsJ_4wF1SmDL6eoEXRB-NwGLALkwhj9wLC5JKaQJpaQx1=5ZA@mail.gmail.com>
 <382a4bd5-bb74-5928-be67-afbdc7aa3663@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6818e34e-d41c-67b7-85dd-76d2e47bc078@linux.intel.com>
Date: Thu, 7 Oct 2021 10:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <382a4bd5-bb74-5928-be67-afbdc7aa3663@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 07/10/2021 09:50, Tvrtko Ursulin wrote:
> 
> On 06/10/2021 21:21, Barry Song wrote:
>> On Thu, Oct 7, 2021 at 2:44 AM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> Hi,
>>>
>>> On 06/10/2021 08:58, Barry Song wrote:
>>>> On Wed, Oct 6, 2021 at 5:15 PM Wanghui (John) 
>>>> <john.wanghui@huawei.com> wrote:
>>>>>
>>>>> HI Tvrtko
>>>>>
>>>>> On 2021/10/4 22:36, Tvrtko Ursulin wrote:
>>>>>>     void set_user_nice(struct task_struct *p, long nice)
>>>>>>     {
>>>>>>         bool queued, running;
>>>>>> -     int old_prio;
>>>>>> +     int old_prio, ret;
>>>>>>         struct rq_flags rf;
>>>>>>         struct rq *rq;
>>>>>>
>>>>>> @@ -6915,6 +6947,9 @@ void set_user_nice(struct task_struct *p, 
>>>>>> long nice)
>>>>>>
>>>>>>     out_unlock:
>>>>>>         task_rq_unlock(rq, p, &rf);
>>>>>> +
>>>>>> +     ret = atomic_notifier_call_chain(&user_nice_notifier_list, 
>>>>>> nice, p);
>>>>>> +     WARN_ON_ONCE(ret != NOTIFY_DONE);
>>>>>>     }
>>>>> How about adding a new "io_nice" to task_struct，and move the call 
>>>>> chain to
>>>>> sched_setattr/getattr, there are two benefits:
>>>>
>>>> We already have an ionice for block io scheduler. hardly can this 
>>>> new io_nice
>>>> be generic to all I/O. it seems the patchset is trying to link
>>>> process' nice with
>>>> GPU's scheduler, to some extent, it makes more senses than having a
>>>> common ionice because we have a lot of IO devices in the systems, we 
>>>> don't
>>>> know which I/O the ionice of task_struct should be applied to.
>>>>
>>>> Maybe we could have an ionice dedicated for GPU just like ionice for 
>>>> CFQ
>>>> of bio/request scheduler.
>>>
>>> Thought crossed my mind but I couldn't see the practicality of a 3rd
>>> nice concept. I mean even to start with I struggle a bit with the
>>> usefulness of existing ionice vs nice. Like coming up with practical
>>> examples of usecases where it makes sense to decouple the two 
>>> priorities.
>>>
>>>   From a different angle I did think inheriting CPU nice makes sense for
>>> GPU workloads. This is because today, and more so in the future,
>>> computations on a same data set do flow from one to the other.
>>>
>>> Like maybe a simple example of batch image processing where CPU decodes,
>>> GPU does a transform and then CPU encodes. Or a different mix, doesn't
>>> really matter, since the main point it is one computing pipeline from
>>> users point of view.
>>>
>>
>> I am on it. but I am also seeing two problems here:
>> 1. nice is not global in linux. For example, if you have two cgroups, 
>> cgroup A
>> has more quota then cgroup B. Tasks in B won't win even if it has a 
>> lower nice.
>> cgroups will run proportional-weight time-based division of CPU.
>>
>> 2. Historically, we had dynamic nice which was adjusted based on the 
>> average
>> sleep/running time; right now, we don't have dynamic nice, but virtual 
>> time
>> still make tasks which sleep more preempt other tasks with the same nice
>> or even lower nice.
>> virtual time += physical time/weight by nice
>> so, static nice number doesn't always make sense to decide preemption.
>>
>> So it seems your patch only works under some simple situation for example
>> no cgroups, tasks have similar sleep/running time.
> 
> Yes, I broadly agree with your assessment. Although there are plans for 
> adding cgroup support to i915 scheduling, I doubt as fine grained 
> control and exact semantics as there are on the CPU side will happen.
> 
> Mostly because the drive seems to be for more micro-controller managed 
> scheduling which adds further challenges in connecting the two sides 
> together.
> 
> But when you say it is a problem, I would characterize it more a 
> weakness in terms of being only a subset of possible control. It is 
> still richer (better?) than what currently exists and as demonstrated 
> with benchmarks in my cover letter it can deliver improvements in user 
> experience. If in the mid term future we can extend it with cgroup 
> support then the concept should still apply and get closer to how you 
> described nice works in the CPU world.
> 
> Main question in my mind is whether the idea of adding the 
> sched_attr/priority notifier to the kernel can be justified. Because as 
> mentioned before, everything apart from adjusting currently running GPU 
> jobs could be done purely in userspace. Stack changes would be quite 
> extensive and all, but that is not usually a good enough reason to put 
> something in the kernel. That's why it is an RFC an invitation to discuss.
> 
> Even ionice inherits from nice (see task_nice_ioprio()) so I think 
> argument can be made for drivers as well.

Now that I wrote this, I had a little bit of a light bulb moment. If I 
abandon the idea of adjusting the priority of already submitted work 
items, then I can do much of what I want purely from within the confines 
of i915.

I simply add code to inherit from current task nice on every new work 
item submission. This should probably bring the majority of the benefit 
I measured.

Regards,

Tvrtko
