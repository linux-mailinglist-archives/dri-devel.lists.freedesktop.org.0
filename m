Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D069C406DF1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 17:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BEC6EA13;
	Fri, 10 Sep 2021 15:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A42B6EA12;
 Fri, 10 Sep 2021 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=trX8c7TNjrxV2L8XG+G06fHZ46kQCJFnfp1PT2gu3oo=; b=czFl5olL2suxV0VuLRYcv8ug46
 9vqm5GoYv8lg88cIaYeSP97KtY0A7RD8Z2Cd/jBLl4QkZZgPOq0sKjIGBEs+QQSPDaQzPwi4I5DS0
 etA4YdMBcnJ/3DytKnwaYS8zTxRaWKnup9WvkJlbPXHTKhIPQSyxF/ZKypmkHVp6jOic1DNQdwS6l
 n2Tz2B3rLuSI+Yz+Zeu24ZqM94jH6Q9e5Bl1KRoMyJEYMtFd6+Eps0rJZaoCfcXr7iCKb/AAosXj0
 2dk61eLq3d0NG8z7jRD5VPxQ+uKmWfsdbUKkzBjN/tZqTwE3mXXLyBtBzMUQLTnI0lJGcNWKrR2yU
 F/AS48YQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOi3N-00B6BR-0W; Fri, 10 Sep 2021 15:03:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DCAAE300047;
 Fri, 10 Sep 2021 17:02:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B9A932BBF8369; Fri, 10 Sep 2021 17:02:54 +0200 (CEST)
Date: Fri, 10 Sep 2021 17:02:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2] kernel/locking: Add context to ww_mutex_trylock.
Message-ID: <YTtznr85mg5xXouP@hirez.programming.kicks-ass.net>
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
 <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
 <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
 <YTnETRSy9H0CRdpc@hirez.programming.kicks-ass.net>
 <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
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

On Thu, Sep 09, 2021 at 11:32:18AM +0200, Maarten Lankhorst wrote:
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index d456579d0952..791c28005eef 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -736,6 +736,44 @@ __ww_mutex_lock(struct mutex *lock, unsigned int state, unsigned int subclass,
>  	return __mutex_lock_common(lock, state, subclass, NULL, ip, ww_ctx, true);
>  }
>  
> +/**
> + * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context
> + * @lock: mutex to lock
> + * @ctx: optional w/w acquire context
> + *
> + * Trylocks a mutex with the optional acquire context; no deadlock detection is
> + * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
> + *
> + * Unlike ww_mutex_lock, no deadlock handling is performed. However, if a @ctx is
> + * specified, -EALREADY and -EDEADLK handling may happen in calls to ww_mutex_lock.
> + *
> + * A mutex acquired with this function must be released with ww_mutex_unlock.
> + */
> +int __sched
> +ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ctx)
> +{
> +	bool locked;
> +
> +	if (!ctx)
> +		return mutex_trylock(&ww->base);
> +
> +#ifdef CONFIG_DEBUG_MUTEXES
> +	DEBUG_LOCKS_WARN_ON(ww->base.magic != &ww->base);
> +#endif
> +
> +	preempt_disable();
> +	locked = __mutex_trylock(&ww->base);
> +
> +	if (locked) {
> +		ww_mutex_set_context_fastpath(ww, ctx);
> +		mutex_acquire_nest(&ww->base.dep_map, 0, 1, &ctx->dep_map, _RET_IP_);
> +	}
> +	preempt_enable();
> +
> +	return locked;
> +}
> +EXPORT_SYMBOL(ww_mutex_trylock);
> +
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  void __sched
>  mutex_lock_nested(struct mutex *lock, unsigned int subclass)

> diff --git a/kernel/locking/ww_rt_mutex.c b/kernel/locking/ww_rt_mutex.c
> index 3f1fff7d2780..c4cb863edb4c 100644
> --- a/kernel/locking/ww_rt_mutex.c
> +++ b/kernel/locking/ww_rt_mutex.c
> @@ -50,6 +50,18 @@ __ww_rt_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx,
>  	return ret;
>  }
>  
> +int __sched
> +ww_mutex_trylock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
> +{
> +	int locked = rt_mutex_trylock(&lock->base);
> +
> +	if (locked && ctx)
> +		ww_mutex_set_context_fastpath(lock, ctx);
> +
> +	return locked;
> +}
> +EXPORT_SYMBOL(ww_mutex_trylock);
> +
>  int __sched
>  ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
>  {

That doesn't look right, how's this for you?

---
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -94,6 +94,9 @@ static inline unsigned long __owner_flag
 	return owner & MUTEX_FLAGS;
 }
 
+/*
+ * Returns: __mutex_owner(lock) on failure or NULL on success.
+ */
 static inline struct task_struct *__mutex_trylock_common(struct mutex *lock, bool handoff)
 {
 	unsigned long owner, curr = (unsigned long)current;
@@ -736,6 +739,47 @@ __ww_mutex_lock(struct mutex *lock, unsi
 	return __mutex_lock_common(lock, state, subclass, NULL, ip, ww_ctx, true);
 }
 
+/**
+ * ww_mutex_trylock - tries to acquire the w/w mutex with optional acquire context
+ * @ww: mutex to lock
+ * @ww_ctx: optional w/w acquire context
+ *
+ * Trylocks a mutex with the optional acquire context; no deadlock detection is
+ * possible. Returns 1 if the mutex has been acquired successfully, 0 otherwise.
+ *
+ * Unlike ww_mutex_lock, no deadlock handling is performed. However, if a @ctx is
+ * specified, -EALREADY handling may happen in calls to ww_mutex_trylock.
+ *
+ * A mutex acquired with this function must be released with ww_mutex_unlock.
+ */
+int ww_mutex_trylock(struct ww_mutex *ww, struct ww_acquire_ctx *ww_ctx)
+{
+	if (!ww_ctx)
+		return mutex_trylock(&ww->base);
+
+	MUTEX_WARN_ON(ww->base.magic != &ww->base);
+
+	if (unlikely(ww_ctx == READ_ONCE(ww->ctx)))
+		return -EALREADY;
+
+	/*
+	 * Reset the wounded flag after a kill. No other process can
+	 * race and wound us here, since they can't have a valid owner
+	 * pointer if we don't have any locks held.
+	 */
+	if (ww_ctx->acquired == 0)
+		ww_ctx->wounded = 0;
+
+	if (__mutex_trylock(&ww->base)) {
+		ww_mutex_set_context_fastpath(ww, ww_ctx);
+		mutex_acquire_nest(&ww->base.dep_map, 0, 1, &ww_ctx->dep_map, _RET_IP_);
+		return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(ww_mutex_trylock);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 void __sched
 mutex_lock_nested(struct mutex *lock, unsigned int subclass)
--- a/kernel/locking/ww_rt_mutex.c
+++ b/kernel/locking/ww_rt_mutex.c
@@ -9,6 +9,34 @@
 #define WW_RT
 #include "rtmutex.c"
 
+int ww_mutex_trylock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx)
+{
+	struct rt_mutex *rtm = &lock->base;
+
+	if (!ww_ctx)
+		return rt_mutex_trylock(rtm);
+
+	if (unlikely(ww_ctx == READ_ONCE(lock->ctx)))
+		return -EALREADY;
+
+	/*
+	 * Reset the wounded flag after a kill. No other process can
+	 * race and wound us here, since they can't have a valid owner
+	 * pointer if we don't have any locks held.
+	 */
+	if (ww_ctx->acquired == 0)
+		ww_ctx->wounded = 0;
+
+	if (__rt_mutex_trylock(&rtm->rtmutex)) {
+		ww_mutex_set_context_fastpath(lock, ww_ctx);
+		mutex_acquire_nest(&rtm->dep_map, 0, 1, ww_ctx->dep_map, _RET_IP_);
+		return 1;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(ww_mutex_trylock);
+
 static int __sched
 __ww_rt_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx,
 		   unsigned int state, unsigned long ip)
