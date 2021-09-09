Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBC404515
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 07:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5A76E159;
	Thu,  9 Sep 2021 05:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C346E14F;
 Thu,  9 Sep 2021 05:38:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="284389226"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="284389226"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 22:38:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="548340145"
Received: from shishpan-mobl2.ccr.corp.intel.com (HELO [10.252.43.251])
 ([10.252.43.251])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 22:38:08 -0700
Subject: Re: [PATCH] kernel/locking: Add context to ww_mutex_trylock.
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
 <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
Date: Thu, 9 Sep 2021 07:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Op 08-09-2021 om 12:14 schreef Peter Zijlstra:
> On Tue, Sep 07, 2021 at 03:20:44PM +0200, Maarten Lankhorst wrote:
>> i915 will soon gain an eviction path that trylock a whole lot of locks
>> for eviction, getting dmesg failures like below:
>>
>> BUG: MAX_LOCK_DEPTH too low!
>> turning off the locking correctness validator.
>> depth: 48  max: 48!
>> 48 locks held by i915_selftest/5776:
>>  #0: ffff888101a79240 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x88/0x160
>>  #1: ffffc900009778c0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_vma_pin.constprop.63+0x39/0x1b0 [i915]
>>  #2: ffff88800cf74de8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_vma_pin.constprop.63+0x5f/0x1b0 [i915]
>>  #3: ffff88810c7f9e38 (&vm->mutex/1){+.+.}-{3:3}, at: i915_vma_pin_ww+0x1c4/0x9d0 [i915]
>>  #4: ffff88810bad5768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>>  #5: ffff88810bad60e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>> ...
>>  #46: ffff88811964d768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>>  #47: ffff88811964e0e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>> INFO: lockdep is turned off.
>> As an intermediate solution, add an acquire context to ww_mutex_trylock,
>> which allows us to do proper nesting annotations on the trylocks, making
>> the above lockdep splat disappear.
> Fair enough I suppose.
>
>> +/**
>> + * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context
>> + * @lock: mutex to lock
>> + * @ctx: optional w/w acquire context
>> + *
>> + * Trylocks a mutex with the optional acquire context; no deadlock detection is
>> + * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
>> + *
>> + * Unlike ww_mutex_lock, no deadlock handling is performed. However, if a @ctx is
>> + * specified, -EALREADY and -EDEADLK handling may happen in calls to ww_mutex_lock.
>> + *
>> + * A mutex acquired with this function must be released with ww_mutex_unlock.
>> + */
>> +int __sched
>> +ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ctx)
>> +{
>> +	bool locked;
>> +
>> +	if (!ctx)
>> +		return mutex_trylock(&ww->base);
>> +
>> +#ifdef CONFIG_DEBUG_MUTEXES
>> +	DEBUG_LOCKS_WARN_ON(ww->base.magic != &ww->base);
>> +#endif
>> +
>> +	preempt_disable();
>> +	locked = __mutex_trylock(&ww->base);
>> +
>> +	if (locked) {
>> +		ww_mutex_set_context_fastpath(ww, ctx);
>> +		mutex_acquire_nest(&ww->base.dep_map, 0, 1, &ctx->dep_map, _RET_IP_);
>> +	}
>> +	preempt_enable();
>> +
>> +	return locked;
>> +}
>> +EXPORT_SYMBOL(ww_mutex_trylock);
> You'll need a similar hunk in ww_rt_mutex.c

What tree has that file?

