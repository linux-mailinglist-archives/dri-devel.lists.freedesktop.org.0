Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B093F4037E4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 12:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABE76E0A6;
	Wed,  8 Sep 2021 10:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1087 seconds by postgrey-1.36 at gabe;
 Wed, 08 Sep 2021 10:32:38 UTC
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3E86E0A6;
 Wed,  8 Sep 2021 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0ciSKTQVg9jB/JRJoAkcU2i5AuVKoWJVYLmKxmFW0dM=; b=l7+Z82aBQnq1R3K5PazXQAzEJP
 IWQoiNUrAooJEXd4P7SHQB1oLoOYQj/Pa+TdliJjR8Peq3rtKnYQxBO8GmQLc53tkcU6/+rM83Ni0
 iaiX5mhUZSyRnbmUfA6FdESgxucQ2TbIasegfBGA9OGCvdY/yHAZDBXaKx45XqcCMYMjWkLFr51rX
 hOqZrx91SyCvnwb3N6si5jbGFBXyChyhywAOaofGZosKzqO+tJNS74AG7sxUhHHydZWZAm29o4xva
 bRb8h5PZkhFxvubcE9o7N31BPpeidvUEHNz5dXUQeNcCYDvguwX5ndYU8OiQ7E6W99kRgqvuUXex4
 JzizeQ7w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNub3-001cTF-BM; Wed, 08 Sep 2021 10:14:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7FD16300332;
 Wed,  8 Sep 2021 12:14:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 681AF2067E684; Wed,  8 Sep 2021 12:14:23 +0200 (CEST)
Date: Wed, 8 Sep 2021 12:14:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/locking: Add context to ww_mutex_trylock.
Message-ID: <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
References: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907132044.157225-1-maarten.lankhorst@linux.intel.com>
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

On Tue, Sep 07, 2021 at 03:20:44PM +0200, Maarten Lankhorst wrote:
> i915 will soon gain an eviction path that trylock a whole lot of locks
> for eviction, getting dmesg failures like below:
> 
> BUG: MAX_LOCK_DEPTH too low!
> turning off the locking correctness validator.
> depth: 48  max: 48!
> 48 locks held by i915_selftest/5776:
>  #0: ffff888101a79240 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x88/0x160
>  #1: ffffc900009778c0 (reservation_ww_class_acquire){+.+.}-{0:0}, at: i915_vma_pin.constprop.63+0x39/0x1b0 [i915]
>  #2: ffff88800cf74de8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_vma_pin.constprop.63+0x5f/0x1b0 [i915]
>  #3: ffff88810c7f9e38 (&vm->mutex/1){+.+.}-{3:3}, at: i915_vma_pin_ww+0x1c4/0x9d0 [i915]
>  #4: ffff88810bad5768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>  #5: ffff88810bad60e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
> ...
>  #46: ffff88811964d768 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
>  #47: ffff88811964e0e8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: i915_gem_evict_something+0x110/0x860 [i915]
> INFO: lockdep is turned off.

> As an intermediate solution, add an acquire context to ww_mutex_trylock,
> which allows us to do proper nesting annotations on the trylocks, making
> the above lockdep splat disappear.

Fair enough I suppose.

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

You'll need a similar hunk in ww_rt_mutex.c
