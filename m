Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298940AE19
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 14:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6386E492;
	Tue, 14 Sep 2021 12:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CC06E48C;
 Tue, 14 Sep 2021 12:43:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221651408"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="221651408"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 05:43:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="552451396"
Received: from naumova-mobl-1.ccr.corp.intel.com (HELO [10.252.48.174])
 ([10.252.48.174])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 05:43:05 -0700
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
 <e8a7754e-23e7-0250-5718-101a56d008f0@linux.intel.com>
 <YUBGPdDDjKlxAuXJ@hirez.programming.kicks-ass.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <205e1591-343b-fb77-cfca-9c16af1484bd@linux.intel.com>
Date: Tue, 14 Sep 2021 14:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YUBGPdDDjKlxAuXJ@hirez.programming.kicks-ass.net>
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

Op 14-09-2021 om 08:50 schreef Peter Zijlstra:
> On Mon, Sep 13, 2021 at 10:42:36AM +0200, Maarten Lankhorst wrote:
>
>>> +/**
>>> + * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context
>>> + * @ww: mutex to lock
>>> + * @ww_ctx: optional w/w acquire context
>>> + *
>>> + * Trylocks a mutex with the optional acquire context; no deadlock detection is
>>> + * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
>>> + *
>>> + * Unlike ww_mutex_lock, no deadlock handling is performed. However, if a @ctx is
>>> + * specified, -EALREADY handling may happen in calls to ww_mutex_trylock.
>>> + *
>>> + * A mutex acquired with this function must be released with ww_mutex_unlock.
>>> + */
>>> +int ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ww_ctx)
>>> +{
>>> +	if (!ww_ctx)
>>> +		return mutex_trylock(&ww->base);
>>> +
>>> +	MUTEX_WARN_ON(ww->base.magic != &ww->base);
>>> +
>>> +	if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
>>> +		return -EALREADY;
>> I'm not 100% sure this is a good idea, because it would make the
>> trylock weird.  For i915 I checked manually, because I didn't want to
>> change the function signature. This is probably the other extreme.
>>
>> "if (ww_mutex_trylock())" would look correct, but actually be wrong
>> and lead to double unlock without adjustments.  Maybe we could make a
>> ww_mutex_trylock_ctx_err, which would return -EALREADY or -EBUSY on
>> failure, and 0 on success?  We could keep ww_mutex_trylock without
>> ctx, probably just #define as (!ww_mutex_trylock_ctx_err(lock, NULL))
> Urgh, yeah. Also, I suppose that if we already own it, we'll just fail
> the trylock anyway. Let me take this out.
>
>>> +	/*
>>> +	 * Reset the wounded flag after a kill. No other process can
>>> +	 * race and wound us here, since they can't have a valid owner
>>> +	 * pointer if we don't have any locks held.
>>> +	 */
>>> +	if (ww_ctx->acquired == 0)
>>> +		ww_ctx->wounded = 0;
>> Yeah I guess this needs fixing too. Not completely sure since trylock
>> wouldn't do the whole ww dance, but since it's our first lock,
>> probably best to do so regardless so other users don't trip over it.
> This is actually critical, because if this trylock is the first lock
> acquisition for the context, there won't be any other opportunity to
> reset this value.
>
>>> +
>>> +	if (__mutex_trylock(&ww->base)) {
>>> +		ww_mutex_set_context_fastpath(ww, ww_ctx);
>>> +		mutex_acquire_nest(&ww->base.dep_map, 0, 1, &ww_ctx->dep_map, _RET_IP_);
>>> +		return 1;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL(ww_mutex_trylock);
> Updated version below...
>
> ---
> Subject: kernel/locking: Add context to ww_mutex_trylock()
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Date: Thu, 9 Sep 2021 11:32:18 +0200
>
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> i915 will soon gain an eviction path that trylock a whole lot of locks
> for eviction, getting dmesg failures like below:
>
>   BUG: MAX_LOCK_DEPTH too low!
>   turning off the locking correctness validator.
>   depth: 48  max: 48!
>   48 locks held by i915_selftest/5776:
>    #0: ffff888101a79240 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x88/0x160
>    #1: ffffc900009778c0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_vma_pin.constprop.63+0x39/0x1b0 [i915]
>    #2: ffff88800cf74de8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_vma_pin.constprop.63+0x5f/0x1b0 [i915]
>    #3: ffff88810c7f9e38 (&vm->mutex/1){+.+.}-{3:3}, at: i915_vma_pin_ww+0x1c4/0x9d0 [i915]
>    #4: ffff88810bad5768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>    #5: ffff88810bad60e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>   ...
>    #46: ffff88811964d768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>    #47: ffff88811964e0e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>   INFO: lockdep is turned off.
>
> Fixing eviction to nest into ww_class_acquire is a high priority, but
> it requires a rework of the entire driver, which can only be done one
> step at a time.
>
> As an intermediate solution, add an acquire context to
> ww_mutex_trylock, which allows us to do proper nesting annotations on
> the trylocks, making the above lockdep splat disappear.
>
> This is also useful in regulator_lock_nested, which may avoid dropping
> regulator_nesting_mutex in the uncontended path, so use it there.
>
> TTM may be another user for this, where we could lock a buffer in a
> fastpath with list locks held, without dropping all locks we hold.
>
> [peterz: rework actual ww_mutex_trylock() implementations]
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---

My original patch series with this patch in place still passes i915 selftests, looks good to me. :)

Feel free to apply.


>  drivers/gpu/drm/drm_modeset_lock.c |    2 
>  drivers/regulator/core.c           |    2 
>  include/linux/dma-resv.h           |    2 
>  include/linux/ww_mutex.h           |   15 ------
>  kernel/locking/mutex.c             |   41 +++++++++++++++++
>  kernel/locking/test-ww_mutex.c     |   86 +++++++++++++++++++++++++++----------
>  kernel/locking/ww_rt_mutex.c       |   25 ++++++++++
>  lib/locking-selftest.c             |    2 
>  8 files changed, 137 insertions(+), 38 deletions(-)
>
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -248,7 +248,7 @@ static inline int modeset_lock(struct dr
>  	if (ctx->trylock_only) {
>  		lockdep_assert_held(&ctx->ww_ctx);
>  
> -		if (!ww_mutex_trylock(&lock->mutex))
> +		if (!ww_mutex_trylock(&lock->mutex, NULL))
>  			return -EBUSY;
>  		else
>  			return 0;
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -145,7 +145,7 @@ static inline int regulator_lock_nested(
>  
>  	mutex_lock(&regulator_nesting_mutex);
>  
> -	if (ww_ctx || !ww_mutex_trylock(&rdev->mutex)) {
> +	if (!ww_mutex_trylock(&rdev->mutex, ww_ctx)) {
>  		if (rdev->mutex_owner == current)
>  			rdev->ref_cnt++;
>  		else
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -173,7 +173,7 @@ static inline int dma_resv_lock_slow_int
>   */
>  static inline bool __must_check dma_resv_trylock(struct dma_resv *obj)
>  {
> -	return ww_mutex_trylock(&obj->lock);
> +	return ww_mutex_trylock(&obj->lock, NULL);
>  }
>  
>  /**
> --- a/include/linux/ww_mutex.h
> +++ b/include/linux/ww_mutex.h
> @@ -28,12 +28,10 @@
>  #ifndef CONFIG_PREEMPT_RT
>  #define WW_MUTEX_BASE			mutex
>  #define ww_mutex_base_init(l,n,k)	__mutex_init(l,n,k)
> -#define ww_mutex_base_trylock(l)	mutex_trylock(l)
>  #define ww_mutex_base_is_locked(b)	mutex_is_locked((b))
>  #else
>  #define WW_MUTEX_BASE			rt_mutex
>  #define ww_mutex_base_init(l,n,k)	__rt_mutex_init(l,n,k)
> -#define ww_mutex_base_trylock(l)	rt_mutex_trylock(l)
>  #define ww_mutex_base_is_locked(b)	rt_mutex_base_is_locked(&(b)->rtmutex)
>  #endif
>  
> @@ -339,17 +337,8 @@ ww_mutex_lock_slow_interruptible(struct
>  
>  extern void ww_mutex_unlock(struct ww_mutex *lock);
>  
> -/**
> - * ww_mutex_trylock - tries to acquire the w/w mutex without acquire context
> - * @lock: mutex to lock
> - *
> - * Trylocks a mutex without acquire context, so no deadlock detection is
> - * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
> - */
> -static inline int __must_check ww_mutex_trylock(struct ww_mutex *lock)
> -{
> -	return ww_mutex_base_trylock(&lock->base);
> -}
> +extern int __must_check ww_mutex_trylock(struct ww_mutex *lock,
> +					 struct ww_acquire_ctx *ctx);
>  
>  /***
>   * ww_mutex_destroy - mark a w/w mutex unusable
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
> @@ -736,6 +739,44 @@ __ww_mutex_lock(struct mutex *lock, unsi
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
> +	/*
> +	 * Reset the wounded flag after a kill. No other process can
> +	 * race and wound us here, since they can't have a valid owner
> +	 * pointer if we don't have any locks held.
> +	 */
> +	if (ww_ctx->acquired == 0)
> +		ww_ctx->wounded = 0;
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
> --- a/kernel/locking/test-ww_mutex.c
> +++ b/kernel/locking/test-ww_mutex.c
> @@ -16,6 +16,15 @@
>  static DEFINE_WD_CLASS(ww_class);
>  struct workqueue_struct *wq;
>  
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +#define ww_acquire_init_noinject(a, b) do { \
> +		ww_acquire_init((a), (b)); \
> +		(a)->deadlock_inject_countdown = ~0U; \
> +	} while (0)
> +#else
> +#define ww_acquire_init_noinject(a, b) ww_acquire_init((a), (b))
> +#endif
> +
>  struct test_mutex {
>  	struct work_struct work;
>  	struct ww_mutex mutex;
> @@ -36,7 +45,7 @@ static void test_mutex_work(struct work_
>  	wait_for_completion(&mtx->go);
>  
>  	if (mtx->flags & TEST_MTX_TRY) {
> -		while (!ww_mutex_trylock(&mtx->mutex))
> +		while (!ww_mutex_trylock(&mtx->mutex, NULL))
>  			cond_resched();
>  	} else {
>  		ww_mutex_lock(&mtx->mutex, NULL);
> @@ -109,19 +118,38 @@ static int test_mutex(void)
>  	return 0;
>  }
>  
> -static int test_aa(void)
> +static int test_aa(bool trylock)
>  {
>  	struct ww_mutex mutex;
>  	struct ww_acquire_ctx ctx;
>  	int ret;
> +	const char *from = trylock ? "trylock" : "lock";
>  
>  	ww_mutex_init(&mutex, &ww_class);
>  	ww_acquire_init(&ctx, &ww_class);
>  
> -	ww_mutex_lock(&mutex, &ctx);
> +	if (!trylock) {
> +		ret = ww_mutex_lock(&mutex, &ctx);
> +		if (ret) {
> +			pr_err("%s: initial lock failed!\n", __func__);
> +			goto out;
> +		}
> +	} else {
> +		if (!ww_mutex_trylock(&mutex, &ctx)) {
> +			pr_err("%s: initial trylock failed!\n", __func__);
> +			goto out;
> +		}
> +	}
>  
> -	if (ww_mutex_trylock(&mutex))  {
> -		pr_err("%s: trylocked itself!\n", __func__);
> +	if (ww_mutex_trylock(&mutex, NULL))  {
> +		pr_err("%s: trylocked itself without context from %s!\n", __func__, from);
> +		ww_mutex_unlock(&mutex);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (ww_mutex_trylock(&mutex, &ctx))  {
> +		pr_err("%s: trylocked itself with context from %s!\n", __func__, from);
>  		ww_mutex_unlock(&mutex);
>  		ret = -EINVAL;
>  		goto out;
> @@ -129,17 +157,17 @@ static int test_aa(void)
>  
>  	ret = ww_mutex_lock(&mutex, &ctx);
>  	if (ret != -EALREADY) {
> -		pr_err("%s: missed deadlock for recursing, ret=%d\n",
> -		       __func__, ret);
> +		pr_err("%s: missed deadlock for recursing, ret=%d from %s\n",
> +		       __func__, ret, from);
>  		if (!ret)
>  			ww_mutex_unlock(&mutex);
>  		ret = -EINVAL;
>  		goto out;
>  	}
>  
> +	ww_mutex_unlock(&mutex);
>  	ret = 0;
>  out:
> -	ww_mutex_unlock(&mutex);
>  	ww_acquire_fini(&ctx);
>  	return ret;
>  }
> @@ -150,7 +178,7 @@ struct test_abba {
>  	struct ww_mutex b_mutex;
>  	struct completion a_ready;
>  	struct completion b_ready;
> -	bool resolve;
> +	bool resolve, trylock;
>  	int result;
>  };
>  
> @@ -160,8 +188,13 @@ static void test_abba_work(struct work_s
>  	struct ww_acquire_ctx ctx;
>  	int err;
>  
> -	ww_acquire_init(&ctx, &ww_class);
> -	ww_mutex_lock(&abba->b_mutex, &ctx);
> +	ww_acquire_init_noinject(&ctx, &ww_class);
> +	if (!abba->trylock)
> +		ww_mutex_lock(&abba->b_mutex, &ctx);
> +	else
> +		WARN_ON(!ww_mutex_trylock(&abba->b_mutex, &ctx));
> +
> +	WARN_ON(READ_ONCE(abba->b_mutex.ctx) != &ctx);
>  
>  	complete(&abba->b_ready);
>  	wait_for_completion(&abba->a_ready);
> @@ -181,7 +214,7 @@ static void test_abba_work(struct work_s
>  	abba->result = err;
>  }
>  
> -static int test_abba(bool resolve)
> +static int test_abba(bool trylock, bool resolve)
>  {
>  	struct test_abba abba;
>  	struct ww_acquire_ctx ctx;
> @@ -192,12 +225,18 @@ static int test_abba(bool resolve)
>  	INIT_WORK_ONSTACK(&abba.work, test_abba_work);
>  	init_completion(&abba.a_ready);
>  	init_completion(&abba.b_ready);
> +	abba.trylock = trylock;
>  	abba.resolve = resolve;
>  
>  	schedule_work(&abba.work);
>  
> -	ww_acquire_init(&ctx, &ww_class);
> -	ww_mutex_lock(&abba.a_mutex, &ctx);
> +	ww_acquire_init_noinject(&ctx, &ww_class);
> +	if (!trylock)
> +		ww_mutex_lock(&abba.a_mutex, &ctx);
> +	else
> +		WARN_ON(!ww_mutex_trylock(&abba.a_mutex, &ctx));
> +
> +	WARN_ON(READ_ONCE(abba.a_mutex.ctx) != &ctx);
>  
>  	complete(&abba.a_ready);
>  	wait_for_completion(&abba.b_ready);
> @@ -249,7 +288,7 @@ static void test_cycle_work(struct work_
>  	struct ww_acquire_ctx ctx;
>  	int err, erra = 0;
>  
> -	ww_acquire_init(&ctx, &ww_class);
> +	ww_acquire_init_noinject(&ctx, &ww_class);
>  	ww_mutex_lock(&cycle->a_mutex, &ctx);
>  
>  	complete(cycle->a_signal);
> @@ -581,7 +620,9 @@ static int stress(int nlocks, int nthrea
>  static int __init test_ww_mutex_init(void)
>  {
>  	int ncpus = num_online_cpus();
> -	int ret;
> +	int ret, i;
> +
> +	printk(KERN_INFO "Beginning ww mutex selftests\n");
>  
>  	wq = alloc_workqueue("test-ww_mutex", WQ_UNBOUND, 0);
>  	if (!wq)
> @@ -591,17 +632,19 @@ static int __init test_ww_mutex_init(voi
>  	if (ret)
>  		return ret;
>  
> -	ret = test_aa();
> +	ret = test_aa(false);
>  	if (ret)
>  		return ret;
>  
> -	ret = test_abba(false);
> +	ret = test_aa(true);
>  	if (ret)
>  		return ret;
>  
> -	ret = test_abba(true);
> -	if (ret)
> -		return ret;
> +	for (i = 0; i < 4; i++) {
> +		ret = test_abba(i & 1, i & 2);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = test_cycle(ncpus);
>  	if (ret)
> @@ -619,6 +662,7 @@ static int __init test_ww_mutex_init(voi
>  	if (ret)
>  		return ret;
>  
> +	printk(KERN_INFO "All ww mutex selftests passed\n");
>  	return 0;
>  }
>  
> --- a/kernel/locking/ww_rt_mutex.c
> +++ b/kernel/locking/ww_rt_mutex.c
> @@ -9,6 +9,31 @@
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
> --- a/lib/locking-selftest.c
> +++ b/lib/locking-selftest.c
> @@ -258,7 +258,7 @@ static void init_shared_classes(void)
>  #define WWAF(x)			ww_acquire_fini(x)
>  
>  #define WWL(x, c)		ww_mutex_lock(x, c)
> -#define WWT(x)			ww_mutex_trylock(x)
> +#define WWT(x)			ww_mutex_trylock(x, NULL)
>  #define WWL1(x)			ww_mutex_lock(x, NULL)
>  #define WWU(x)			ww_mutex_unlock(x)
>  


