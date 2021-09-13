Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA840873C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 10:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A3D6EC89;
	Mon, 13 Sep 2021 08:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFB26E11A;
 Mon, 13 Sep 2021 08:42:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="201118786"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="201118786"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 01:42:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="551510733"
Received: from einfeld-mobl.ger.corp.intel.com (HELO [10.252.46.222])
 ([10.252.46.222])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 01:42:38 -0700
Subject: Re: [PATCH v2] kernel/locking: Add context to ww_mutex_trylock.
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
 <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
 <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
 <YTnETRSy9H0CRdpc@hirez.programming.kicks-ass.net>
 <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
 <YTtznr85mg5xXouP@hirez.programming.kicks-ass.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <e8a7754e-23e7-0250-5718-101a56d008f0@linux.intel.com>
Date: Mon, 13 Sep 2021 10:42:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTtznr85mg5xXouP@hirez.programming.kicks-ass.net>
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

Op 10-09-2021 om 17:02 schreef Peter Zijlstra:
> On Thu, Sep 09, 2021 at 11:32:18AM +0200, Maarten Lankhorst wrote:
>> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
>> index d456579d0952..791c28005eef 100644
>> --- a/kernel/locking/mutex.c
>> +++ b/kernel/locking/mutex.c
>> @@ -736,6 +736,44 @@ __ww_mutex_lock(struct mutex *lock, unsigned int state, unsigned int subclass,
>>  	return __mutex_lock_common(lock, state, subclass, NULL, ip, ww_ctx, true);
>>  }
>>  
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
>> +
>>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>  void __sched
>>  mutex_lock_nested(struct mutex *lock, unsigned int subclass)
>> diff --git a/kernel/locking/ww_rt_mutex.c b/kernel/locking/ww_rt_mutex.c
>> index 3f1fff7d2780..c4cb863edb4c 100644
>> --- a/kernel/locking/ww_rt_mutex.c
>> +++ b/kernel/locking/ww_rt_mutex.c
>> @@ -50,6 +50,18 @@ __ww_rt_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx,
>>  	return ret;
>>  }
>>  
>> +int __sched
>> +ww_mutex_trylock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
>> +{
>> +	int locked = rt_mutex_trylock(&lock->base);
>> +
>> +	if (locked && ctx)
>> +		ww_mutex_set_context_fastpath(lock, ctx);
>> +
>> +	return locked;
>> +}
>> +EXPORT_SYMBOL(ww_mutex_trylock);
>> +
>>  int __sched
>>  ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
>>  {
> That doesn't look right, how's this for you?
>
> ---
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -94,6 +94,9 @@ static inline unsigned long __owner_flag
>  	return owner & MUTEX_FLAGS;
>  }
>  
> +/*
> + * Returns: __mutex_owner(lock) on failure or NULL on success.
> + */
>  static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, bool handoff)
>  {
>  	unsigned long owner, curr = (unsigned long)current;
> @@ -736,6 +739,47 @@ __ww_mutex_lock(struct mutex *lock, unsi
>  	return __mutex_lock_common(lock, state, subclass, NULL, ip, ww_ctx, true);
>  }
>  
> +/**
> + * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context
> + * @ww: mutex to lock
> + * @ww_ctx: optional w/w acquire context
> + *
> + * Trylocks a mutex with the optional acquire context; no deadlock detection is
> + * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
> + *
> + * Unlike ww_mutex_lock, no deadlock handling is performed. However, if a @ctx is
> + * specified, -EALREADY handling may happen in calls to ww_mutex_trylock.
> + *
> + * A mutex acquired with this function must be released with ww_mutex_unlock.
> + */
> +int ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ww_ctx)
> +{
> +	if (!ww_ctx)
> +		return mutex_trylock(&ww->base);
> +
> +	MUTEX_WARN_ON(ww->base.magic != &ww->base);
> +
> +	if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
> +		return -EALREADY;

I'm not 100% sure this is a good idea, because it would make the trylock weird.
For i915 I checked manually, because I didn't want to change the function signature. This is probably the other extreme.

"if (ww_mutex_trylock())" would look correct, but actually be wrong and lead to double unlock without adjustments.
Maybe we could make a ww_mutex_trylock_ctx_err, which would return -EALREADY or -EBUSY on failure, and 0 on success?
We could keep ww_mutex_trylock without ctx, probably just #define as (!ww_mutex_trylock_ctx_err(lock, NULL))

> +	/*
> +	 * Reset the wounded flag after a kill. No other process can
> +	 * race and wound us here, since they can't have a valid owner
> +	 * pointer if we don't have any locks held.
> +	 */
> +	if (ww_ctx->acquired == 0)
> +		ww_ctx->wounded = 0;

Yeah I guess this needs fixing too. Not completely sure since trylock wouldn't do the whole
ww dance, but since it's our first lock, probably best to do so regardless so other users don't trip over it.

> +
> +	if (__mutex_trylock(&ww->base)) {
> +		ww_mutex_set_context_fastpath(ww, ww_ctx);
> +		mutex_acquire_nest(&ww->base.dep_map, 0, 1, &ww_ctx->dep_map, _RET_IP_);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ww_mutex_trylock);
> +
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  void __sched
>  mutex_lock_nested(struct mutex *lock, unsigned int subclass)
> --- a/kernel/locking/ww_rt_mutex.c
> +++ b/kernel/locking/ww_rt_mutex.c
> @@ -9,6 +9,34 @@
>  #define WW_RT
>  #include "rtmutex.c"
>  
> +int ww_mutex_trylock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx)
> +{
> +	struct rt_mutex *rtm = &lock->base;
> +
> +	if (!ww_ctx)
> +		return rt_mutex_trylock(rtm);
> +
> +	if (unlikely(ww_ctx == READ_ONCE(lock->ctx)))
> +		return -EALREADY;
> +
> +	/*
> +	 * Reset the wounded flag after a kill. No other process can
> +	 * race and wound us here, since they can't have a valid owner
> +	 * pointer if we don't have any locks held.
> +	 */
> +	if (ww_ctx->acquired == 0)
> +		ww_ctx->wounded = 0;
> +
> +	if (__rt_mutex_trylock(&rtm->rtmutex)) {
> +		ww_mutex_set_context_fastpath(lock, ww_ctx);
> +		mutex_acquire_nest(&rtm->dep_map, 0, 1, ww_ctx->dep_map, _RET_IP_);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ww_mutex_trylock);
> +
>  static int __sched
>  __ww_rt_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx,
>  		   unsigned int state, unsigned long ip)


