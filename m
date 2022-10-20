Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC46062D0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCB110E091;
	Thu, 20 Oct 2022 14:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C84110E091;
 Thu, 20 Oct 2022 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666275549; x=1697811549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=r0/6bEpNWnincCbo4hb4LRSHOsCw+9ljYVh46KXBLWk=;
 b=cbJgODwz6lRCtwzUjlsJljgh9niraMxYfUDxx+ahQzrpiG+8HXjoXDZu
 Wp9AxnaFvWCkE0GBEGomhCSdLjsKLRLBKZ0eLDsJZ3+oMsoeYvM05eKHe
 emaQq808IQ7J+8ir1tPtCDMZ3DU0cmxg4c4K+HWY5XE0bnaTr9u16XJAm
 7DWvuEI0VyuaPVqC08/qMZZQQu3HnKC9cOke/E3pSmWbGN+dCbRr1KqoK
 pTv20hdEoYa+bMob9AY5y/gpJswDK8Q9XhZaCn5vPKkIqpLvZxsPzGaFJ
 M9i0+tgvQPvZmFIzYmSiaipQbsJPDh6fyO6EsBQTnnczzsWKkpPSWrqI8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="370931239"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="370931239"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="734864395"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="734864395"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 20 Oct 2022 07:18:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Oct 2022 17:18:51 +0300
Date: Thu, 20 Oct 2022 17:18:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Stop using kthread_stop()
Message-ID: <Y1FYy8gj38GDYzCu@intel.com>
References: <20221020130841.3845791-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020130841.3845791-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 02:08:41PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Since a7c01fa93aeb ("signal: break out of wait loops on kthread_stop()")
> kthread_stop() started asserting a pending signal which wreaks havoc with
> a few of our selftests. Mainly because they are not fully expecting to
> handle signals, but also cutting the intended test runtimes short due
> signal_pending() now returning true (via __igt_timeout), which therefore
> breaks both the patterns of:
> 
>   kthread_run()
>   ..sleep for igt_timeout_ms to allow test to exercise stuff..
>   kthread_stop()
> 
> And check for errors recorded in the thread.
> 
> And also:
> 
>     Main thread  |   Test thread
>   ---------------+------------------------------
>   kthread_run()  |
>   kthread_stop() |  do stuff until __igt_timeout
> 		 |  -- exits early due signal --
> 
> Where this kthread_stop() was assume would have a "join" semantics, which
> it would have had if not the new signal assertion issue.
> 
> To recap, threads are now likely to catch a previously impossible
> ERESTARTSYS or EINTR, marking the test as failed, or have a pointlessly
> short run time.
> 
> To work around this start using kthread_work(er) API which provides
> an explicit way of waiting for threads to exit. And for cases where
> parent controls the test duration we add explicit signaling which threads
> will now use instead of relying on kthread_should_stop().
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  .../drm/i915/gem/selftests/i915_gem_context.c | 118 ++++----
>  drivers/gpu/drm/i915/gt/selftest_execlists.c  |  48 ++--
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  51 ++--
>  drivers/gpu/drm/i915/selftests/i915_request.c | 252 +++++++++++-------
>  4 files changed, 281 insertions(+), 188 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index c6ad67b90e8a..d8864444432b 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -179,97 +179,108 @@ static int live_nop_switch(void *arg)
>  }
>  
>  struct parallel_switch {
> -	struct task_struct *tsk;
> +	struct kthread_worker *worker;
> +	struct kthread_work work;
>  	struct intel_context *ce[2];
> +	int result;
>  };
>  
> -static int __live_parallel_switch1(void *data)
> +static void __live_parallel_switch1(struct kthread_work *work)
>  {
> -	struct parallel_switch *arg = data;
> +	struct parallel_switch *arg =
> +		container_of(work, typeof(*arg), work);
>  	IGT_TIMEOUT(end_time);
>  	unsigned long count;
>  
>  	count = 0;
> +	arg->result = 0;
>  	do {
>  		struct i915_request *rq = NULL;
> -		int err, n;
> +		int n;
>  
> -		err = 0;
> -		for (n = 0; !err && n < ARRAY_SIZE(arg->ce); n++) {
> +		for (n = 0; !arg->result && n < ARRAY_SIZE(arg->ce); n++) {
>  			struct i915_request *prev = rq;
>  
>  			rq = i915_request_create(arg->ce[n]);
>  			if (IS_ERR(rq)) {
>  				i915_request_put(prev);
> -				return PTR_ERR(rq);
> +				arg->result = PTR_ERR(rq);
> +				break;
>  			}
>  
>  			i915_request_get(rq);
>  			if (prev) {
> -				err = i915_request_await_dma_fence(rq, &prev->fence);
> +				arg->result =
> +					i915_request_await_dma_fence(rq,
> +								     &prev->fence);
>  				i915_request_put(prev);
>  			}
>  
>  			i915_request_add(rq);
>  		}
> +
> +		if (IS_ERR_OR_NULL(rq))
> +			break;
> +
>  		if (i915_request_wait(rq, 0, HZ) < 0)
> -			err = -ETIME;
> +			arg->result = -ETIME;
> +
>  		i915_request_put(rq);
> -		if (err)
> -			return err;
>  
>  		count++;
> -	} while (!__igt_timeout(end_time, NULL));
> +	} while (!arg->result && !__igt_timeout(end_time, NULL));
>  
> -	pr_info("%s: %lu switches (sync)\n", arg->ce[0]->engine->name, count);
> -	return 0;
> +	pr_info("%s: %lu switches (sync) <%d>\n",
> +		arg->ce[0]->engine->name, count, arg->result);
>  }
>  
> -static int __live_parallel_switchN(void *data)
> +static void __live_parallel_switchN(struct kthread_work *work)
>  {
> -	struct parallel_switch *arg = data;
> +	struct parallel_switch *arg =
> +		container_of(work, typeof(*arg), work);
>  	struct i915_request *rq = NULL;
>  	IGT_TIMEOUT(end_time);
>  	unsigned long count;
>  	int n;
>  
>  	count = 0;
> +	arg->result = 0;
>  	do {
> -		for (n = 0; n < ARRAY_SIZE(arg->ce); n++) {
> +		for (n = 0; !arg->result && n < ARRAY_SIZE(arg->ce); n++) {
>  			struct i915_request *prev = rq;
> -			int err = 0;
>  
>  			rq = i915_request_create(arg->ce[n]);
>  			if (IS_ERR(rq)) {
>  				i915_request_put(prev);
> -				return PTR_ERR(rq);
> +				arg->result = PTR_ERR(rq);
> +				break;
>  			}
>  
>  			i915_request_get(rq);
>  			if (prev) {
> -				err = i915_request_await_dma_fence(rq, &prev->fence);
> +				arg->result =
> +					i915_request_await_dma_fence(rq,
> +								     &prev->fence);
>  				i915_request_put(prev);
>  			}
>  
>  			i915_request_add(rq);
> -			if (err) {
> -				i915_request_put(rq);
> -				return err;
> -			}
>  		}
>  
>  		count++;
> -	} while (!__igt_timeout(end_time, NULL));
> -	i915_request_put(rq);
> +	} while (!arg->result && !__igt_timeout(end_time, NULL));
>  
> -	pr_info("%s: %lu switches (many)\n", arg->ce[0]->engine->name, count);
> -	return 0;
> +	if (!IS_ERR_OR_NULL(rq))
> +		i915_request_put(rq);
> +
> +	pr_info("%s: %lu switches (many) <%d>\n",
> +		arg->ce[0]->engine->name, count, arg->result);
>  }
>  
>  static int live_parallel_switch(void *arg)
>  {
>  	struct drm_i915_private *i915 = arg;
> -	static int (* const func[])(void *arg) = {
> +	static void (* const func[])(struct kthread_work *) = {
>  		__live_parallel_switch1,
>  		__live_parallel_switchN,
>  		NULL,
> @@ -277,7 +288,7 @@ static int live_parallel_switch(void *arg)
>  	struct parallel_switch *data = NULL;
>  	struct i915_gem_engines *engines;
>  	struct i915_gem_engines_iter it;
> -	int (* const *fn)(void *arg);
> +	void (* const *fn)(struct kthread_work *);
>  	struct i915_gem_context *ctx;
>  	struct intel_context *ce;
>  	struct file *file;
> @@ -348,9 +359,22 @@ static int live_parallel_switch(void *arg)
>  		}
>  	}
>  
> +	for (n = 0; n < count; n++) {
> +		struct kthread_worker *worker;
> +
> +		if (!data[n].ce[0])
> +			continue;
> +
> +		worker = kthread_create_worker(0, "igt/parallel:%s",
> +					       data[n].ce[0]->engine->name);
> +		if (IS_ERR(worker))
> +			goto out;
> +
> +		data[n].worker = worker;
> +	}
> +
>  	for (fn = func; !err && *fn; fn++) {
>  		struct igt_live_test t;
> -		int n;
>  
>  		err = igt_live_test_begin(&t, i915, __func__, "");
>  		if (err)
> @@ -360,30 +384,17 @@ static int live_parallel_switch(void *arg)
>  			if (!data[n].ce[0])
>  				continue;
>  
> -			data[n].tsk = kthread_run(*fn, &data[n],
> -						  "igt/parallel:%s",
> -						  data[n].ce[0]->engine->name);
> -			if (IS_ERR(data[n].tsk)) {
> -				err = PTR_ERR(data[n].tsk);
> -				break;
> -			}
> -			get_task_struct(data[n].tsk);
> +			data[n].result = 0;
> +			kthread_init_work(&data[n].work, *fn);
> +			kthread_queue_work(data[n].worker, &data[n].work);
>  		}
>  
> -		yield(); /* start all threads before we kthread_stop() */
> -
>  		for (n = 0; n < count; n++) {
> -			int status;
> -
> -			if (IS_ERR_OR_NULL(data[n].tsk))
> -				continue;
> -
> -			status = kthread_stop(data[n].tsk);
> -			if (status && !err)
> -				err = status;
> -
> -			put_task_struct(data[n].tsk);
> -			data[n].tsk = NULL;
> +			if (data[n].ce[0]) {
> +				kthread_flush_work(&data[n].work);
> +				if (data[n].result && !err)
> +					err = data[n].result;
> +			}
>  		}
>  
>  		if (igt_live_test_end(&t))
> @@ -399,6 +410,9 @@ static int live_parallel_switch(void *arg)
>  			intel_context_unpin(data[n].ce[m]);
>  			intel_context_put(data[n].ce[m]);
>  		}
> +
> +		if (data[n].worker)
> +			kthread_destroy_worker(data[n].worker);
>  	}
>  	kfree(data);
>  out_file:
> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> index 56b7d5b5fea0..2c7c053a8808 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
> @@ -3473,12 +3473,14 @@ static int random_priority(struct rnd_state *rnd)
>  
>  struct preempt_smoke {
>  	struct intel_gt *gt;
> +	struct kthread_work work;
>  	struct i915_gem_context **contexts;
>  	struct intel_engine_cs *engine;
>  	struct drm_i915_gem_object *batch;
>  	unsigned int ncontext;
>  	struct rnd_state prng;
>  	unsigned long count;
> +	int result;
>  };
>  
>  static struct i915_gem_context *smoke_context(struct preempt_smoke *smoke)
> @@ -3538,34 +3540,31 @@ static int smoke_submit(struct preempt_smoke *smoke,
>  	return err;
>  }
>  
> -static int smoke_crescendo_thread(void *arg)
> +static void smoke_crescendo_work(struct kthread_work *work)
>  {
> -	struct preempt_smoke *smoke = arg;
> +	struct preempt_smoke *smoke = container_of(work, typeof(*smoke), work);
>  	IGT_TIMEOUT(end_time);
>  	unsigned long count;
>  
>  	count = 0;
>  	do {
>  		struct i915_gem_context *ctx = smoke_context(smoke);
> -		int err;
>  
> -		err = smoke_submit(smoke,
> -				   ctx, count % I915_PRIORITY_MAX,
> -				   smoke->batch);
> -		if (err)
> -			return err;
> +		smoke->result = smoke_submit(smoke, ctx,
> +					     count % I915_PRIORITY_MAX,
> +					     smoke->batch);
>  
>  		count++;
> -	} while (count < smoke->ncontext && !__igt_timeout(end_time, NULL));
> +	} while (!smoke->result && count < smoke->ncontext &&
> +		 !__igt_timeout(end_time, NULL));
>  
>  	smoke->count = count;
> -	return 0;
>  }
>  
>  static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
>  #define BATCH BIT(0)
>  {
> -	struct task_struct *tsk[I915_NUM_ENGINES] = {};
> +	struct kthread_worker *worker[I915_NUM_ENGINES] = {};
>  	struct preempt_smoke *arg;
>  	struct intel_engine_cs *engine;
>  	enum intel_engine_id id;
> @@ -3576,6 +3575,8 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
>  	if (!arg)
>  		return -ENOMEM;
>  
> +	memset(arg, 0, I915_NUM_ENGINES * sizeof(*arg));

kcalloc()?

> +
>  	for_each_engine(engine, smoke->gt, id) {
>  		arg[id] = *smoke;
>  		arg[id].engine = engine;
> @@ -3583,31 +3584,28 @@ static int smoke_crescendo(struct preempt_smoke *smoke, unsigned int flags)
>  			arg[id].batch = NULL;
>  		arg[id].count = 0;
>  
> -		tsk[id] = kthread_run(smoke_crescendo_thread, arg,
> -				      "igt/smoke:%d", id);
> -		if (IS_ERR(tsk[id])) {
> -			err = PTR_ERR(tsk[id]);
> +		worker[id] = kthread_create_worker(0, "igt/smoke:%d", id);
> +		if (IS_ERR(worker[id])) {
> +			err = PTR_ERR(worker[id]);
>  			break;
>  		}
> -		get_task_struct(tsk[id]);
> -	}
>  
> -	yield(); /* start all threads before we kthread_stop() */
> +		kthread_init_work(&arg[id].work, smoke_crescendo_work);
> +		kthread_queue_work(worker[id], &arg[id].work);
> +	}
>  
>  	count = 0;
>  	for_each_engine(engine, smoke->gt, id) {
> -		int status;
> -
> -		if (IS_ERR_OR_NULL(tsk[id]))
> +		if (IS_ERR_OR_NULL(worker[id]))
>  			continue;
>  
> -		status = kthread_stop(tsk[id]);
> -		if (status && !err)
> -			err = status;
> +		kthread_flush_work(&arg[id].work);
> +		if (arg[id].result && !err)
> +			err = arg[id].result;
>  
>  		count += arg[id].count;
>  
> -		put_task_struct(tsk[id]);
> +		kthread_destroy_worker(worker[id]);
>  	}
>  
>  	pr_info("Submitted %lu crescendo:%x requests across %d engines and %d contexts\n",
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 7f3bb1d34dfb..71263058a7b0 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -866,10 +866,13 @@ static int igt_reset_active_engine(void *arg)
>  }
>  
>  struct active_engine {
> -	struct task_struct *task;
> +	struct kthread_worker *worker;
> +	struct kthread_work work;
>  	struct intel_engine_cs *engine;
>  	unsigned long resets;
>  	unsigned int flags;
> +	bool stop;
> +	int result;
>  };
>  
>  #define TEST_ACTIVE	BIT(0)
> @@ -900,10 +903,10 @@ static int active_request_put(struct i915_request *rq)
>  	return err;
>  }
>  
> -static int active_engine(void *data)
> +static void active_engine(struct kthread_work *work)
>  {
>  	I915_RND_STATE(prng);
> -	struct active_engine *arg = data;
> +	struct active_engine *arg = container_of(work, typeof(*arg), work);
>  	struct intel_engine_cs *engine = arg->engine;
>  	struct i915_request *rq[8] = {};
>  	struct intel_context *ce[ARRAY_SIZE(rq)];
> @@ -913,16 +916,17 @@ static int active_engine(void *data)
>  	for (count = 0; count < ARRAY_SIZE(ce); count++) {
>  		ce[count] = intel_context_create(engine);
>  		if (IS_ERR(ce[count])) {
> -			err = PTR_ERR(ce[count]);
> -			pr_err("[%s] Create context #%ld failed: %d!\n", engine->name, count, err);
> +			arg->result = PTR_ERR(ce[count]);
> +			pr_err("[%s] Create context #%ld failed: %d!\n",
> +			       engine->name, count, arg->result);
>  			while (--count)
>  				intel_context_put(ce[count]);
> -			return err;
> +			return;
>  		}
>  	}
>  
>  	count = 0;
> -	while (!kthread_should_stop()) {
> +	while (!READ_ONCE(arg->stop)) {
>  		unsigned int idx = count++ & (ARRAY_SIZE(rq) - 1);
>  		struct i915_request *old = rq[idx];
>  		struct i915_request *new;
> @@ -967,7 +971,7 @@ static int active_engine(void *data)
>  		intel_context_put(ce[count]);
>  	}
>  
> -	return err;
> +	arg->result = err;
>  }
>  
>  static int __igt_reset_engines(struct intel_gt *gt,
> @@ -1022,7 +1026,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  
>  		memset(threads, 0, sizeof(*threads) * I915_NUM_ENGINES);
>  		for_each_engine(other, gt, tmp) {
> -			struct task_struct *tsk;
> +			struct kthread_worker *worker;
>  
>  			threads[tmp].resets =
>  				i915_reset_engine_count(global, other);
> @@ -1036,19 +1040,21 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  			threads[tmp].engine = other;
>  			threads[tmp].flags = flags;
>  
> -			tsk = kthread_run(active_engine, &threads[tmp],
> -					  "igt/%s", other->name);
> -			if (IS_ERR(tsk)) {
> -				err = PTR_ERR(tsk);
> -				pr_err("[%s] Thread spawn failed: %d!\n", engine->name, err);
> +			worker = kthread_create_worker(0, "igt/%s",
> +						       other->name);
> +			if (IS_ERR(worker)) {
> +				err = PTR_ERR(worker);
> +				pr_err("[%s] Worker create failed: %d!\n",
> +				       engine->name, err);
>  				goto unwind;
>  			}
>  
> -			threads[tmp].task = tsk;
> -			get_task_struct(tsk);
> -		}
> +			threads[tmp].worker = worker;
>  
> -		yield(); /* start all threads before we begin */
> +			kthread_init_work(&threads[tmp].work, active_engine);
> +			kthread_queue_work(threads[tmp].worker,
> +					   &threads[tmp].work);
> +		}
>  
>  		st_engine_heartbeat_disable_no_pm(engine);
>  		GEM_BUG_ON(test_and_set_bit(I915_RESET_ENGINE + id,
> @@ -1197,17 +1203,20 @@ static int __igt_reset_engines(struct intel_gt *gt,
>  		for_each_engine(other, gt, tmp) {
>  			int ret;
>  
> -			if (!threads[tmp].task)
> +			if (!threads[tmp].worker)
>  				continue;
>  
> -			ret = kthread_stop(threads[tmp].task);
> +			WRITE_ONCE(threads[tmp].stop, true);
> +			kthread_flush_work(&threads[tmp].work);

Could perhaps optimize things a bit flagging all the threads
to stop before doing any flush_work()s. And maybe also do all
the init stuff before queuing any works. But dunno if that's
worth the hassle.

Looks reasonable enough to me.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
Ville Syrjälä
Intel
