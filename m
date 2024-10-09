Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CF996796
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D2A10E6CD;
	Wed,  9 Oct 2024 10:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Redd7Ada";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C60810E6CD;
 Wed,  9 Oct 2024 10:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728470838; x=1760006838;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pju3iGTyQ0tzIJ+XL/zKUcqmAc3tqyNpMoNv9f4SRLw=;
 b=Redd7Adaj1dLdxiAEvuJx6PJxAiQ8ZzYL0Drv86Rvc+gfCirwLHjLDvB
 N3s2FjW3PVdyxrIqTRhLVYtuaFSP9+Ac+HKIewNe9ykLZ/oHGl4Q92Z6/
 eQnjWFac9d2IP2NKTYhHHOAIx8aY91UvmziuJ7UoZIPPtYRyYF0mO3Mux
 z3HnE/2Cb/2NHOG+yeyHCE4BATotc6zsq/FnsUE2xzsPaMcdTLyQdOL+a
 2WO9d1MnNtE3Pb7Xv7c94zYRUwgL1vU96MgrFAYZlSbqBEhsZYmDH/9tz
 BtDzdYI6Tw97mczaSUowrAIruRQPUFtYYTbAakNV37uf1hLefyS52bslS A==;
X-CSE-ConnectionGUID: Tm6Eny30TfCsVkHF9ekp2g==
X-CSE-MsgGUID: ga0xXp5aSMyclszKyxV0rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="50297261"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="50297261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:47:17 -0700
X-CSE-ConnectionGUID: UHVnNWGvQ6eQt6yOLuG2eg==
X-CSE-MsgGUID: tebn4PytQFCSVEOdBuV/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="99532499"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.73])
 ([10.245.244.73])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:47:14 -0700
Message-ID: <d9b1f605-9d4a-456c-9f4b-43681f9c1773@linux.intel.com>
Date: Wed, 9 Oct 2024 12:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241002125611.361001-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241002125611.361001-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey,

I'm pretty sure I've seen this use-after-free in the wild, just never found the root cause since it's so unlikely to trigger on demand.

Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2024-10-02 kl. 14:56, skrev Thomas Hellström:
> When using mutex_acquire_nest() with a nest_lock, lockdep refcounts the
> number of acquired lockdep_maps of mutexes of the same class, and also
> keeps a pointer to the first acquired lockdep_map of a class. That pointer
> is then used for various comparison-, printing- and checking purposes,
> but there is no mechanism to actively ensure that lockdep_map stays in
> memory. Instead, a warning is printed if the lockdep_map is freed and
> there are still held locks of the same lock class, even if the lockdep_map
> itself has been released.
> 
> In the context of WW/WD transactions that means that if a user unlocks
> and frees a ww_mutex from within an ongoing ww transaction, and that
> mutex happens to be the first ww_mutex grabbed in the transaction,
> such a warning is printed and there might be a risk of a UAF.
> 
> Note that this is only problem when lockdep is enabled and affects only
> dereferences of struct lockdep_map.
> 
> Adjust to this by adding a fake lockdep_map to the acquired context and
> make sure it is the first acquired lockdep map of the associated
> ww_mutex class. Then hold it for the duration of the WW/WD transaction.
> 
> This has the side effect that trying to lock a ww mutex *without* a
> ww_acquire_context but where a such context has been acquire, we'd see
> a lockdep splat. The test-ww_mutex.c selftest attempts to do that, so
> modify that particular test to not acquire a ww_acquire_context if it
> is not going to be used.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Maarten Lankhorst <maarten@lankhorst.se>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  include/linux/ww_mutex.h       | 14 ++++++++++++++
>  kernel/locking/test-ww_mutex.c |  6 ++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> index bb763085479a..a401a2f31a77 100644
> --- a/include/linux/ww_mutex.h
> +++ b/include/linux/ww_mutex.h
> @@ -65,6 +65,16 @@ struct ww_acquire_ctx {
>  #endif
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
>  	struct lockdep_map dep_map;
> +	/**
> +	 * @first_lock_dep_map: fake lockdep_map for first locked ww_mutex.
> +	 *
> +	 * lockdep requires the lockdep_map for the first locked ww_mutex
> +	 * in a ww transaction to remain in memory until all ww_mutexes of
> +	 * the transaction have been unlocked. Ensure this by keeping a
> +	 * fake locked ww_mutex lockdep map between ww_acquire_init() and
> +	 * ww_acquire_fini().
> +	 */
> +	struct lockdep_map first_lock_dep_map;
>  #endif
>  #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>  	unsigned int deadlock_inject_interval;
> @@ -146,7 +156,10 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
>  	debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
>  	lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
>  			 &ww_class->acquire_key, 0);
> +	lockdep_init_map(&ctx->first_lock_dep_map, ww_class->mutex_name,
> +			 &ww_class->mutex_key, 0);
>  	mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
> +	mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx->dep_map, _RET_IP_);
>  #endif
>  #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
>  	ctx->deadlock_inject_interval = 1;
> @@ -185,6 +198,7 @@ static inline void ww_acquire_done(struct ww_acquire_ctx *ctx)
>  static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
>  {
>  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	mutex_release(&ctx->first_lock_dep_map, _THIS_IP_);
>  	mutex_release(&ctx->dep_map, _THIS_IP_);
>  #endif
>  #ifdef DEBUG_WW_MUTEXES
> diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
> index 10a5736a21c2..4c2b8b567de5 100644
> --- a/kernel/locking/test-ww_mutex.c
> +++ b/kernel/locking/test-ww_mutex.c
> @@ -62,7 +62,8 @@ static int __test_mutex(unsigned int flags)
>  	int ret;
>  
>  	ww_mutex_init(&mtx.mutex, &ww_class);
> -	ww_acquire_init(&ctx, &ww_class);
> +	if (flags & TEST_MTX_CTX)
> +		ww_acquire_init(&ctx, &ww_class);
>  
>  	INIT_WORK_ONSTACK(&mtx.work, test_mutex_work);
>  	init_completion(&mtx.ready);
> @@ -90,7 +91,8 @@ static int __test_mutex(unsigned int flags)
>  		ret = wait_for_completion_timeout(&mtx.done, TIMEOUT);
>  	}
>  	ww_mutex_unlock(&mtx.mutex);
> -	ww_acquire_fini(&ctx);
> +	if (flags & TEST_MTX_CTX)
> +		ww_acquire_fini(&ctx);
>  
>  	if (ret) {
>  		pr_err("%s(flags=%x): mutual exclusion failure\n",

