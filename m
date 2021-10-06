Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B79423F90
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 15:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491E6E491;
	Wed,  6 Oct 2021 13:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576C6E491;
 Wed,  6 Oct 2021 13:44:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="224766915"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="224766915"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:44:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="589769972"
Received: from ccronin-mobl.ger.corp.intel.com (HELO [10.213.247.242])
 ([10.213.247.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 06:44:13 -0700
Subject: Re: [RFC 1/8] sched: Add nice value change notifier
To: Barry Song <21cnbao@gmail.com>, "Wanghui (John)" <john.wanghui@huawei.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
 <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
 <CAGsJ_4w5Y4=v93YmTrXJ6hDgjKshxiAZ-ox-Nz_7uRwe4ECtdw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8381e87d-ef7f-4759-569b-f6dabeb02939@linux.intel.com>
Date: Wed, 6 Oct 2021 14:44:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGsJ_4w5Y4=v93YmTrXJ6hDgjKshxiAZ-ox-Nz_7uRwe4ECtdw@mail.gmail.com>
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


Hi,

On 06/10/2021 08:58, Barry Song wrote:
> On Wed, Oct 6, 2021 at 5:15 PM Wanghui (John) <john.wanghui@huawei.com> wrote:
>>
>> HI Tvrtko
>>
>> On 2021/10/4 22:36, Tvrtko Ursulin wrote:
>>>    void set_user_nice(struct task_struct *p, long nice)
>>>    {
>>>        bool queued, running;
>>> -     int old_prio;
>>> +     int old_prio, ret;
>>>        struct rq_flags rf;
>>>        struct rq *rq;
>>>
>>> @@ -6915,6 +6947,9 @@ void set_user_nice(struct task_struct *p, long nice)
>>>
>>>    out_unlock:
>>>        task_rq_unlock(rq, p, &rf);
>>> +
>>> +     ret = atomic_notifier_call_chain(&user_nice_notifier_list, nice, p);
>>> +     WARN_ON_ONCE(ret != NOTIFY_DONE);
>>>    }
>> How about adding a new "io_nice" to task_struct，and move the call chain to
>> sched_setattr/getattr, there are two benefits:
> 
> We already have an ionice for block io scheduler. hardly can this new io_nice
> be generic to all I/O. it seems the patchset is trying to link
> process' nice with
> GPU's scheduler, to some extent, it makes more senses than having a
> common ionice because we have a lot of IO devices in the systems, we don't
> know which I/O the ionice of task_struct should be applied to.
> 
> Maybe we could have an ionice dedicated for GPU just like ionice for CFQ
> of bio/request scheduler.

Thought crossed my mind but I couldn't see the practicality of a 3rd 
nice concept. I mean even to start with I struggle a bit with the 
usefulness of existing ionice vs nice. Like coming up with practical 
examples of usecases where it makes sense to decouple the two priorities.

 From a different angle I did think inheriting CPU nice makes sense for 
GPU workloads. This is because today, and more so in the future, 
computations on a same data set do flow from one to the other.

Like maybe a simple example of batch image processing where CPU decodes, 
GPU does a transform and then CPU encodes. Or a different mix, doesn't 
really matter, since the main point it is one computing pipeline from 
users point of view.

In this example perhaps everything could be handled in userspace so 
that's another argument to be had. Userspace could query the current 
scheduling attributes before submitting work to the processing pipeline 
and adjust using respective uapi.

Downside would be inability to react to changes after the work is 
already running which may not be too serious limitation outside the 
world of multi-minute compute workloads. And latter are probably special 
case enough that would be configured explicitly.

>>
>> 1. Decoupled with fair scheduelr. In our use case, high priority tasks often
>>      use rt scheduler.
> 
> Is it possible to tell GPU RT as we are telling them CFS nice?

Yes of course. We could create a common notification "data packet" which 
would be sent from both entry points and provide more data than just the 
nice value. Consumers (of the notifier chain) could then decide for 
themselves what they want to do with the data.

Regards,

Tvrtko

> 
>> 2. The range of value don't need to be bound to -20~19 or 0~139
>>
> 
> could build a mapping between the priorities of process and GPU. It seems
> not a big deal.
> 
> Thanks
> barry
> 
