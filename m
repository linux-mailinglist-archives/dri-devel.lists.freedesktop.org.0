Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3B42071D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84706E192;
	Mon,  4 Oct 2021 08:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793636E185;
 Mon,  4 Oct 2021 08:13:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="206140459"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="206140459"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 01:12:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="482815518"
Received: from shearne-mobl.ger.corp.intel.com (HELO [10.213.208.122])
 ([10.213.208.122])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 01:12:41 -0700
Subject: Re: [RFC 1/6] sched: Add nice value change notifier
To: Peter Zijlstra <peterz@infradead.org>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
 <20210930171552.501553-2-tvrtko.ursulin@linux.intel.com>
 <20210930183316.GC4323@worktop.programming.kicks-ass.net>
 <4aca656d-678f-4d61-38a4-d2e7a8fd89ab@linux.intel.com>
 <5c71ec04-9148-0587-c495-11dbd8f77d67@linux.intel.com>
 <YVct0D9kB1KtrwZ3@hirez.programming.kicks-ass.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <01a968c9-c427-f4c7-44d5-2f47f939f9eb@linux.intel.com>
Date: Mon, 4 Oct 2021 09:12:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVct0D9kB1KtrwZ3@hirez.programming.kicks-ass.net>
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


On 01/10/2021 16:48, Peter Zijlstra wrote:
> On Fri, Oct 01, 2021 at 11:32:16AM +0100, Tvrtko Ursulin wrote:
>>
>> On 01/10/2021 10:04, Tvrtko Ursulin wrote:
>>>
>>> Hi Peter,
>>>
>>> On 30/09/2021 19:33, Peter Zijlstra wrote:
>>>> On Thu, Sep 30, 2021 at 06:15:47PM +0100, Tvrtko Ursulin wrote:
>>>>>    void set_user_nice(struct task_struct *p, long nice)
>>>>>    {
>>>>>        bool queued, running;
>>>>> -    int old_prio;
>>>>> +    int old_prio, ret;
>>>>>        struct rq_flags rf;
>>>>>        struct rq *rq;
>>>>> @@ -6913,6 +6945,9 @@ void set_user_nice(struct task_struct *p,
>>>>> long nice)
>>>>>         */
>>>>>        p->sched_class->prio_changed(rq, p, old_prio);
>>>>> +    ret = atomic_notifier_call_chain(&user_nice_notifier_list,
>>>>> nice, p);
>>>>> +    WARN_ON_ONCE(ret != NOTIFY_DONE);
>>>>> +
>>>>>    out_unlock:
>>>>>        task_rq_unlock(rq, p, &rf);
>>>>>    }
>>>>
>>>> No, we're not going to call out to exported, and potentially unbounded,
>>>> functions under scheduler locks.
>>>
>>> Agreed, that's another good point why it is even more hairy, as I have
>>> generally alluded in the cover letter.
>>>
>>> Do you have any immediate thoughts on possible alternatives?
>>>
>>> Like for instance if I did a queue_work from set_user_nice and then ran
>>> a notifier chain async from a worker? I haven't looked at yet what
>>> repercussion would that have in terms of having to cancel the pending
>>> workers when tasks exit. I can try and prototype that and see how it
>>> would look.
>>
>> Hm or I simply move calling the notifier chain to after task_rq_unlock? That
>> would leave it run under the tasklist lock so probably still quite bad.
> 
> Hmm? That's for normalize_rt_tasks() only, right? Just don't have it
> call the notifier in that special case (that's a magic sysrq thing
> anyway).

You mean my talk about tasklist_lock? No, it is also on the syscall part 
I am interested in as well. Call chain looks like this:

sys_setpriority()
{
   ...
   rcu_read_lock();
   read_lock(&tasklist_lock);
   ...
   set_one_prio()
     set_user_nice()
     {
       ...
       task_rq_lock();
         -> my notifier from this RFC [1]
       task_rq_unlock();
         -> I can move the notifier here for _some_ improvement [2]
     }
   ...
   read_unlock(&tasklist_lock);
   rcu_read_unlock();
}

So this RFC had the notifier call chain at [1], which I understood was 
the thing you initially pointed was horrible, being under a scheduler lock.

I can trivially move it to [2] but that still leaves it under the 
tasklist lock. I don't have a good feel how much better that would be. 
If not good enough then I will look for a smarter solution with less 
opportunity for global impact.

Regards,

Tvrtko
