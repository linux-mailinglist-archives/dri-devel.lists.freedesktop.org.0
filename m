Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A090C73C56
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 12:38:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A842F10E065;
	Thu, 20 Nov 2025 11:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="no12kTDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D429510E065;
 Thu, 20 Nov 2025 11:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=jNLf4kEyrJhIhQxXhV/wDZHhRdsSXxNMp9YKHK4/GJo=; b=no12kTDykFte+1geNs0ouoXEhA
 0KDViRftSYjtcf2o89myhfE6bM/Fgjp3RI6JLzzZiPU0hB1QTZVc/BvwpiKeGwKdjM3Y+6U+frsLO
 Iv96orLFcqKyn5T09CI8EeIsq/+YDQ3KOfiApJfxUME75IYbzUSxLvZMu87NHHwukv0b/F29Cwhv1
 bVlpwkUe5S319+YNzpGbvPY7A19OXBnb2sVdopKcB55I3pZKmKEQ7wuP2ttEc7Ib6AB6LtVVrfDDA
 WbFQEt0nCSywb1K7LSX80KeRM66Ktj2uV6Su/54JCq6sIBNXnh4Qy2pU+Qj9etPIScNe/uXUWMmhp
 rLZhIs0g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vM27w-0000000ENxS-33Ll; Thu, 20 Nov 2025 10:43:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 197173002A6; Thu, 20 Nov 2025 12:38:24 +0100 (CET)
Date: Thu, 20 Nov 2025 12:38:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH 1/2] kernel/locking/ww_mutex: Add per-lock lock-check
 helpers
Message-ID: <20251120113824.GJ4067720@noisy.programming.kicks-ass.net>
References: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
 <20251120110341.2425-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120110341.2425-2-thomas.hellstrom@linux.intel.com>
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

On Thu, Nov 20, 2025 at 12:03:40PM +0100, Thomas Hellström wrote:
> Code using ww_mutexes typically by design have a number of
> such mutexes sharing the same ww_class, and within a ww transaction
> they are all lockdep annotated using a nest_lock which means
> that multiple ww_mutexes of the same lockdep class may be locked at
> the same time. That means that lock_is_held() returns true and
> lockdep_assert_held() doesn't fire as long as there is a *single*
> ww_mutex held of the same class. IOW within a WW transaction.
> 
> Code using these mutexes typically want to assert that individual
> ww_mutexes are held. Not that any ww_mutex of the same class is
> held.
> 
> Introduce functions that can be used for that.
> 
> RFC: Placement of the functions? lockdep.c? Are the #ifdefs testing for
> the correct config?

Yeah, I think so.

Ack on this.

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  include/linux/ww_mutex.h | 18 ++++++++++++++++++
>  kernel/locking/mutex.c   | 10 ++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> index 45ff6f7a872b..7bc0f533dea6 100644
> --- a/include/linux/ww_mutex.h
> +++ b/include/linux/ww_mutex.h
> @@ -380,4 +380,22 @@ static inline bool ww_mutex_is_locked(struct ww_mutex *lock)
>  	return ww_mutex_base_is_locked(&lock->base);
>  }
>  
> +#ifdef CONFIG_PROVE_LOCKING
> +
> +bool ww_mutex_held(struct ww_mutex *lock);
> +
> +#else /* CONFIG_PROVE_LOCKING */
> +
> +static inline bool ww_mutex_held(struct ww_mutex *lock)
> +{
> +	return true;
> +}
> +
> +#endif /* CONFIG_PROVE_LOCKING */
> +
> +static inline void ww_mutex_assert_held(struct ww_mutex *lock)
> +{
> +	lockdep_assert(ww_mutex_held(lock));
> +}
> +
>  #endif
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index de7d6702cd96..37868b739efd 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -1174,3 +1174,13 @@ int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock)
>  	return 1;
>  }
>  EXPORT_SYMBOL(atomic_dec_and_mutex_lock);
> +
> +#ifdef CONFIG_PROVE_LOCKING
> +
> +bool ww_mutex_held(struct ww_mutex *lock)
> +{
> +	return __ww_mutex_owner(&lock->base) == current;
> +}
> +EXPORT_SYMBOL(ww_mutex_held);
> +
> +#endif /* CONFIG_PROVE_LOCKING */
> -- 
> 2.51.1
> 
