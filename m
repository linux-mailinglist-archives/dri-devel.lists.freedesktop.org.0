Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C13FB1B100
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 11:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E910B10E626;
	Tue,  5 Aug 2025 09:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8npn5LE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877710E626
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754386074; x=1785922074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kHzAWdEEyHHxaN1vXjRG8OGUmjIyv0kYOdW3E+6IeS0=;
 b=C8npn5LEGST9eDM6XZjs2d3FDnlH5Q6Flpf7HfPvvtNMWxSJjneQ6OMo
 8ttviix2PoplfTH1utM9yPT9IAdaRAV9Qpe/bKkY2AADKyrPnW5c+hnKr
 h/Ndp+/2b/VnN88C/3uuO3u9J0o2aCR3TPgvida4WQH+RBl6fL2E0YeYe
 sAbWmujenuablVgrfksCVD0aPro8JKSGNLILFp8wyhKpwYa79lo8mQGAH
 GbMtQ5x5gEpvO6sgipWt4jAVGulRYPLeGzU/QRsA6dEJ+A5MikqRFs569
 IuPW0fEY/ogCD8HVaz4FVOhp8NGV6OeIjcNUO88xNNQI1AqdcLPLg02oo A==;
X-CSE-ConnectionGUID: hT0MJ5G2QwKg7XEqxzvc/Q==
X-CSE-MsgGUID: /HBiFhLPQ1We4q8PsFcPaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="74252177"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="74252177"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 02:27:54 -0700
X-CSE-ConnectionGUID: nKR2A65+Q96DGJWV/x6WOg==
X-CSE-MsgGUID: vNNSvW2XTZO2ig975EPUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164341511"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.245.254])
 ([10.245.245.254])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 02:27:50 -0700
Message-ID: <d737c0f0-c0e0-4df5-8246-b484db8d061b@linux.intel.com>
Date: Tue, 5 Aug 2025 11:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] locking: Fix __clear_task_blocked_on() warning from
 __ww_mutex_wound() path
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com,
 K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Suleiman Souhlal <suleiman@google.com>, airlied@gmail.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, kernel-team@android.com
References: <20250801192157.912805-1-jstultz@google.com>
 <20250805001026.2247040-1-jstultz@google.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250805001026.2247040-1-jstultz@google.com>
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

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-08-05 kl. 02:10, skrev John Stultz:
> The __clear_task_blocked_on() helper added a number of sanity
> checks ensuring we hold the mutex wait lock and that the task
> we are clearing blocked_on pointer (if set) matches the mutex.
> 
> However, there is an edge case in the _ww_mutex_wound() logic
> where we need to clear the blocked_on pointer for the task that
> owns the mutex, not the task that is waiting on the mutex.
> 
> For this case the sanity checks aren't valid, so handle this
> by allowing a NULL lock to skip the additional checks.
> 
> K Prateek Nayak and Maarten Lankhorst also pointed out that in
> this case where we don't hold the owner's mutex wait_lock, we
> need to be a bit more careful using READ_ONCE/WRITE_ONCE in both
> the __clear_task_blocked_on() and __set_task_blocked_on()
> implementations to avoid accidentally tripping WARN_ONs if two
> instances race. So do that here as well.
> 
> This issue was easier to miss, I realized, as the test-ww_mutex
> driver only exercises the wait-die class of ww_mutexes. I've
> sent a patch[1] to address this so the logic will be easier to
> test.
> 
> [1]: https://lore.kernel.org/lkml/20250801023358.562525-2-jstultz@google.com/
> 
> Fixes: a4f0b6fef4b0 ("locking/mutex: Add p->blocked_on wrappers for correctness checks")
> Reported-by: syzbot+602c4720aed62576cd79@syzkaller.appspotmail.com
> Reported-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Closes: https://lore.kernel.org/lkml/68894443.a00a0220.26d0e1.0015.GAE@google.com/
> Signed-off-by: John Stultz <jstultz@google.com>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> v2:
> * Rewording of "lock" to "mutex" in commit and comment for
>   clarity
> * Rework __clear_task_blocked_on() to use READ_ONCE and WRITE_ONCE
>   so we don't trip over the WARNING if two instances race, as suggested
>   by K Prateek Nayak and Maarten Lankhorst
> v3:
> * Add READ_ONCE and WRITE_ONCE to __set_task_blocked_on(), to avoid
>   tripping similar warnings as suggested by K Prateek Nayak
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: K Prateek Nayak <kprateek.nayak@amd.com>
> Cc: Suleiman Souhlal <suleiman@google.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: airlied@gmail.com
> Cc: mripard@kernel.org
> Cc: simona@ffwll.ch
> Cc: tzimmermann@suse.de
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel-team@android.com
> ---
>  include/linux/sched.h     | 29 +++++++++++++++++------------
>  kernel/locking/ww_mutex.h |  6 +++++-
>  2 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 40d2fa90df425..62103dd6a48e0 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2144,6 +2144,8 @@ static inline struct mutex *__get_task_blocked_on(struct task_struct *p)
>  
>  static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
>  {
> +	struct mutex *blocked_on = READ_ONCE(p->blocked_on);
> +
>  	WARN_ON_ONCE(!m);
>  	/* The task should only be setting itself as blocked */
>  	WARN_ON_ONCE(p != current);
> @@ -2154,8 +2156,8 @@ static inline void __set_task_blocked_on(struct task_struct *p, struct mutex *m)
>  	 * with a different mutex. Note, setting it to the same
>  	 * lock repeatedly is ok.
>  	 */
> -	WARN_ON_ONCE(p->blocked_on && p->blocked_on != m);
> -	p->blocked_on = m;
> +	WARN_ON_ONCE(blocked_on && blocked_on != m);
> +	WRITE_ONCE(p->blocked_on, m);
>  }
>  
>  static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
> @@ -2166,16 +2168,19 @@ static inline void set_task_blocked_on(struct task_struct *p, struct mutex *m)
>  
>  static inline void __clear_task_blocked_on(struct task_struct *p, struct mutex *m)
>  {
> -	WARN_ON_ONCE(!m);
> -	/* Currently we serialize blocked_on under the mutex::wait_lock */
> -	lockdep_assert_held_once(&m->wait_lock);
> -	/*
> -	 * There may be cases where we re-clear already cleared
> -	 * blocked_on relationships, but make sure we are not
> -	 * clearing the relationship with a different lock.
> -	 */
> -	WARN_ON_ONCE(m && p->blocked_on && p->blocked_on != m);
> -	p->blocked_on = NULL;
> +	if (m) {
> +		struct mutex *blocked_on = READ_ONCE(p->blocked_on);
> +
> +		/* Currently we serialize blocked_on under the mutex::wait_lock */
> +		lockdep_assert_held_once(&m->wait_lock);
> +		/*
> +		 * There may be cases where we re-clear already cleared
> +		 * blocked_on relationships, but make sure we are not
> +		 * clearing the relationship with a different lock.
> +		 */
> +		WARN_ON_ONCE(blocked_on && blocked_on != m);
> +	}
> +	WRITE_ONCE(p->blocked_on, NULL);
>  }
>  
>  static inline void clear_task_blocked_on(struct task_struct *p, struct mutex *m)
> diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
> index 086fd5487ca77..31a785afee6c0 100644
> --- a/kernel/locking/ww_mutex.h
> +++ b/kernel/locking/ww_mutex.h
> @@ -342,8 +342,12 @@ static bool __ww_mutex_wound(struct MUTEX *lock,
>  			 * When waking up the task to wound, be sure to clear the
>  			 * blocked_on pointer. Otherwise we can see circular
>  			 * blocked_on relationships that can't resolve.
> +			 *
> +			 * NOTE: We pass NULL here instead of lock, because we
> +			 * are waking the mutex owner, who may be currently
> +			 * blocked on a different mutex.
>  			 */
> -			__clear_task_blocked_on(owner, lock);
> +			__clear_task_blocked_on(owner, NULL);
>  			wake_q_add(wake_q, owner);
>  		}
>  		return true;

