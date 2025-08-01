Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A3B17D1B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 09:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26610E3BE;
	Fri,  1 Aug 2025 07:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5gbJJt+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA58110E3BE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754032173; x=1785568173;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QJlOXrjs6/mWtqUdb5qCTqgXhsyN0K59N/VXeVdIKKk=;
 b=m5gbJJt+nRn2HxYo4D0UAOZDvJmoEb7I8k/uzrfG9NDLKeve8Zp6dIgW
 6jPGG95Bo4IKxmuR3kJ/yKeC1/JhMmiDJbOM/RDIXQgEprCweeuZytoif
 tINBjBlsnzNNbnDCoFf4DYsAv4z3nKeyK//sff897N9yagQmAAWJmNvf4
 6IV3FNxiNoXV3lDx3fqCOqu1hbp6ttpGNQ6y2QStUGKOoc+0cMVK1eM4x
 Z6n26TJRw3UcP7nq6a9wQFUzTk9KPmHxZCrrEsh1ilKEkcffOEwKAXHzI
 sW0fM/p+vChRH2TA/pJ+oFT/9yTrV1OymwX23x1u6AEKP+ifl6EwxB0PT w==;
X-CSE-ConnectionGUID: 5Gem5KshSxWAdjNl/FkV0w==
X-CSE-MsgGUID: Sqd6hAb3RMuaTDILsALAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56330722"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56330722"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 00:09:32 -0700
X-CSE-ConnectionGUID: jaaOHqKJRoecVgwlwKAPpg==
X-CSE-MsgGUID: a1q570KTRLqabqaApm7rPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="200644501"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.107])
 ([10.245.244.107])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 00:09:29 -0700
Message-ID: <14ff89fd-d308-47e4-8c3e-157d19f933f3@linux.intel.com>
Date: Fri, 1 Aug 2025 09:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
To: K Prateek Nayak <kprateek.nayak@amd.com>, John Stultz
 <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, airlied@gmail.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, kernel-team@android.com
References: <68894443.a00a0220.26d0e1.0015.GAE@google.com>
 <20250731201337.274382-1-jstultz@google.com>
 <2812bdc6-8d7e-48a3-8f5b-a26cd5d18c32@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <2812bdc6-8d7e-48a3-8f5b-a26cd5d18c32@amd.com>
Content-Type: text/plain; charset=UTF-8
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



Den 2025-08-01 kl. 07:09, skrev K Prateek Nayak:
> Hello John,
> 
> On 8/1/2025 1:43 AM, John Stultz wrote:
> 
> [..snip..]
> 
>> diff --git a/include/linux/sched.h b/include/linux/sched.h
>> index 40d2fa90df425..a9a78f51f7f57 100644
>> --- a/include/linux/sched.h
>> +++ b/include/linux/sched.h
>> @@ -2166,15 +2166,16 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
>>  
>>  static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
>>  {
>> -	WARN_ON_ONCE(!m);
>> -	/* Currently we serialize blocked_on under the mutex::wait_lock */
>> -	lockdep_assert_held_once(&m->wait_lock);
>> -	/*
>> -	 * There may be cases where we re-clear already cleared
>> -	 * blocked_on relationships, but make sure we are not
>> -	 * clearing the relationship with a different lock.
>> -	 */
>> -	WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
>> +	if (m) {
>> +		/* Currently we serialize blocked_on under the mutex::wait_lock */
>> +		lockdep_assert_held_once(&m->wait_lock);
>> +		/*
>> +		 * There may be cases where we re-clear already cleared
>> +		 * blocked_on relationships, but make sure we are not
>> +		 * clearing the relationship with a different lock.
>> +		 */
>> +		WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
> 
> Small concern since we don't hold the "owner->blocked_on->wait_lock" here
> when arriving from __ww_mutex_wound() as Hillf pointed out, can we run
> into a situation like:
> 
>               CPU0                                                               CPU1
>         (Owner of Mutex A,                                              (Trying to acquire Mutex A)
>     trying to acquire Mutex B)
>     ==========================                                          ===========================
> 
>     __mutex_lock_common(B)
>       ... /* B->wait_lock held */
>       set_task_blocked_on(ownerA, B)
>       if (__mutex_trylock(B)) /* Returns true */                        __mutex_lock_common(A)
>         goto acquired; /* Goes to below point */                          ... /* A->wait_lock held */
>       __clear_task_blocked_on(ownerA, B);                                 __ww_mutex_wound(ownerA)
>         WARN_ON_ONCE(m /* Mutex B*/                                         ...
>                      && ownerA->blocked_on /* Mutex B */                    __clear_task_blocked_on(ownerA, NULL)
>                      ...                                                      ownerA->blocked_on = NULL;
>                      && ownerA->blocked_on /* NULL */ != m /* Mutex B */);
>           !!! SPLAT !!!
> 
> 
> At the very least I think we should make a local copy of "p->blocked_on"
> to see a consistent view throughout __clear_task_blocked_on() - task either
> sees it is blocked on the mutex and clear "p->blocked_on", or it sees it is
> blocked on nothing and still clears "p->blocked_on".
> 
> (Tested lightly with syzbot's C reproducer)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 02c340450469..f35d93cca64f 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2165,6 +2165,8 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
>  static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
>  {
>  	if (m) {
> +		struct mutex *blocked_on = p->blocked_on;
> +
>  		/* Currently we serialize blocked_on under the mutex::wait_lock */
>  		lockdep_assert_held_once(&m->wait_lock);
>  		/*
> @@ -2172,7 +2174,7 @@ static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *
>  		 * blocked_on relationships, but make sure we are not
>  		 * clearing the relationship with a different lock.
>  		 */
> -		WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
> +		WARN_ON_ONCE(m && blocked_on && blocked_on != m);
>  	}
>  	p->blocked_on = NULL;
>  }
> ---
> 
> End result is the same, only that we avoid an unnecessary splat in this
> very unlikely case and save ourselves some head scratching later :)
> 
> Thoughts?
If this is required, than it should be blocked_on = READ_ONCE(p->blocked_on);

Also the WARN_ON_ONCE() can have the "m && " part taken out because it's always true now.
> 
>> +	}
>>  	p->blocked_on = NULL;
>>  }
>>  
>> diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
>> index 086fd5487ca77..ef8ef3c28592c 100644
>> --- a/kernel/locking/ww_mutex.h
>> +++ b/kernel/locking/ww_mutex.h
>> @@ -342,8 +342,12 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
>>  			 * When waking up the task to wound, be sure to clear the
>>  			 * blocked_on pointer. Otherwise we can see circular
>>  			 * blocked_on relationships that can't resolve.
>> +			 *
>> +			 * NOTE: We pass NULL here instead of lock, because we
>> +			 * are waking the lock owner, who may be currently blocked
>> +			 * on a different lock.
>>  			 */
>> -			__clear_task_blocked_on(owner, lock);
>> +			__clear_task_blocked_on(owner, NULL);
>>  			wake_q_add(wake_q, owner);
>>  		}
>>  		return true;
> 

