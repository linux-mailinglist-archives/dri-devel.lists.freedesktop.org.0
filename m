Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6DA41E95B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 11:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C746ED72;
	Fri,  1 Oct 2021 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665ED6ED72;
 Fri,  1 Oct 2021 09:04:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="204861621"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="204861621"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 02:04:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="618905648"
Received: from howells-mobl.ger.corp.intel.com (HELO [10.213.208.92])
 ([10.213.208.92])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 02:04:55 -0700
Subject: Re: [RFC 1/6] sched: Add nice value change notifier
To: Peter Zijlstra <peterz@infradead.org>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
 <20210930171552.501553-2-tvrtko.ursulin@linux.intel.com>
 <20210930183316.GC4323@worktop.programming.kicks-ass.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <4aca656d-678f-4d61-38a4-d2e7a8fd89ab@linux.intel.com>
Date: Fri, 1 Oct 2021 10:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930183316.GC4323@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


Hi Peter,

On 30/09/2021 19:33, Peter Zijlstra wrote:
> On Thu, Sep 30, 2021 at 06:15:47PM +0100, Tvrtko Ursulin wrote:
>>   void set_user_nice(struct task_struct *p, long nice)
>>   {
>>   	bool queued, running;
>> -	int old_prio;
>> +	int old_prio, ret;
>>   	struct rq_flags rf;
>>   	struct rq *rq;
>>   
>> @@ -6913,6 +6945,9 @@ void set_user_nice(struct task_struct *p, long nice)
>>   	 */
>>   	p->sched_class->prio_changed(rq, p, old_prio);
>>   
>> +	ret = atomic_notifier_call_chain(&user_nice_notifier_list, nice, p);
>> +	WARN_ON_ONCE(ret != NOTIFY_DONE);
>> +
>>   out_unlock:
>>   	task_rq_unlock(rq, p, &rf);
>>   }
> 
> No, we're not going to call out to exported, and potentially unbounded,
> functions under scheduler locks.

Agreed, that's another good point why it is even more hairy, as I have 
generally alluded in the cover letter.

Do you have any immediate thoughts on possible alternatives?

Like for instance if I did a queue_work from set_user_nice and then ran 
a notifier chain async from a worker? I haven't looked at yet what 
repercussion would that have in terms of having to cancel the pending 
workers when tasks exit. I can try and prototype that and see how it 
would look.

There is of course an example ioprio which solves the runtime 
adjustments via a dedicated system call. But I don't currently feel that 
a third one would be a good solution. At least I don't see a case for 
being able to decouple the priority of CPU and GPU and computations.

Have I opened a large can of worms? :)

Regards,

Tvrtko
