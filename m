Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E397B9A2835
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A4210E0D0;
	Thu, 17 Oct 2024 16:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VMaNl+Oq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C96D10E0D0;
 Thu, 17 Oct 2024 16:14:12 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7b1488fde46so90157685a.2; 
 Thu, 17 Oct 2024 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729181651; x=1729786451; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qrIA087TE9sKV7OJYFqBWdQxAnIRK60lxSsAGREJTNg=;
 b=VMaNl+Oqd+0HNXL3mkq/ri5qQb+IJJ8LPQOyWEQwDYzgqvUb/vgmakD7TF2L9d2HzG
 Hfm7SouTjR0IrDUJ8a0p1qllqkQgroYesTFGFt/mr56loImsCPir5ke51yw8tVG3bI2S
 AZWwmwa3E08nd+Er+BugpcXbdh4xghBT1HHk9Gf/n/EgvQnCxrroBJWcyNsyXz2SSHou
 RwBFfBZcTh+i6veXPX3YSruWNES3kE8MkY4daZsjusSHyZQqvFJGov/fkNfw+o9m2tGi
 hoeFQQ/A4ebqK8mBUuhqblcCPJE7jRtlsJRP7LZhDS3glUYInkVMdhOhUGo7+dqDVVyE
 SSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729181651; x=1729786451;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qrIA087TE9sKV7OJYFqBWdQxAnIRK60lxSsAGREJTNg=;
 b=phKxMg44qKhtqUzmbO0zxBqlHE602eQFeTxAnErf/4OfHrbsSWd3C/hnB56C740FBR
 iyvSMDOzKCnXVNmZB02e2YopHjZfEk8hJd3cRGpnYbKnAuG+LBNS8/hmYpbMArPD89MB
 gLRBAaaSXekDXHIL0i9yZROTOAMzoW79NGMt61hCSI9A1w3gRyM1AIB0OE9fuFCbWtfW
 m0utJct81PKSjwxKiiYA+R/7DH1+netxZwBpjvPiPLW3WpXKSl1U/ZIu8fTaqLzACiDP
 /wXEPxilCERyTGJPOftp+RQZFGqRtKu35f+uPsEWTvMSwXCDQOwdU98ezoUQ43aO20xF
 t3UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEEAoR9KKj1/gUXDVtanOZdg1Mv3FiM6t0j5/OXVr1Go0kOcsAKv7BLK8kr/MA69LN2mV7otTSiUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyCOAgB6UgbXxO+9UukiGqehrd1gCuCB/ORiI7BqIWxyRjP7Y0
 2qn7LULzuQ0feEdSKu1j0FAM7Vgzt0+QZWA6xgdU1KtW/PG3LfqJ
X-Google-Smtp-Source: AGHT+IHemzTHS2ebUjVi10vZGc4EzhCroToRWZbnlxqvt83eW71Tq9pTAqAF8tqvdXNSLX5i+K/O7A==
X-Received: by 2002:a05:620a:1987:b0:7ae:64f4:db46 with SMTP id
 af79cd13be357-7b1418af84fmr1294435785a.64.1729181650841; 
 Thu, 17 Oct 2024 09:14:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b15170d143sm58353785a.14.2024.10.17.09.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 09:14:10 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id D9DD8120006E;
 Thu, 17 Oct 2024 12:14:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 17 Oct 2024 12:14:09 -0400
X-ME-Sender: <xms:0TcRZ48Opa4tOHpEZJBMY68CinrX5izmJD4JbfQKbP-HxcJY5iM7PA>
 <xme:0TcRZwvJJV0KyDtchRHtp37i2WlbYgkUVvCK3NBx1VIC6EBPAjONHafKcai91Wkh-
 Y8F6dU5654Nmn1Pfg>
X-ME-Received: <xmr:0TcRZ-DTOnOb2aavLLi5d1-7VBInkmlTWmTuR3Q4Wi-Wy6TkrjTpANgBqB2Fwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdehuddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
 udenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeehleevffdujeffgedvlefghffhleek
 ieeifeegveetjedvgeevueffieehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
 lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
 hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomh
 eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehinhhtvghlqdigvgeslhhi
 shhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehpvghtvghriiesih
 hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtgho
 mhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonh
 hgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnheslhgrnhhk
 hhhorhhsthdrshgvpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmh
 gurdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggv
 shhkthhophdrohhrgh
X-ME-Proxy: <xmx:0TcRZ4fiysFpmrd_j_e29HIE9zTFuRK4k0UWI0fjVdGmc6cIVpdDqA>
 <xmx:0TcRZ9OBn-3Ft9tTzKRe8DWXodipy93fXBWo5B7rGrAIdBwD__XK6A>
 <xmx:0TcRZyl1-KQvMDiWpv_C2yksNvHBvPCaj4DLNjsMle6D8_QABuoCiw>
 <xmx:0TcRZ_tJdnlCAgaFe8dnqSwt0ZDCNLTNUX_SLYIi0G-B6JTOswL0zw>
 <xmx:0TcRZ7vO6eNmKDUJ087T8AYnzez1XbNgGV9WAc-VgusMqwQs0B4WYw5N>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Oct 2024 12:14:09 -0400 (EDT)
Date: Thu, 17 Oct 2024 09:13:43 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Maarten Lankhorst <maarten@lankhorst.se>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH v3] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
Message-ID: <ZxE3t2ztVYo1ol9T@boqun-archlinux>
References: <20241017151007.92215-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017151007.92215-1-thomas.hellstrom@linux.intel.com>
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

On Thu, Oct 17, 2024 at 05:10:07PM +0200, Thomas Hellström wrote:
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
> v2:
> - Lower the number of locks in the test-ww_mutex
>   stress(STRESS_ALL) test to accommodate the dummy lock
>   introduced in this patch without overflowing lockdep held lock
>   references.
> 
> v3:
> - Adjust the ww_test_normal locking-api selftest to avoid
>   recursive locking (Boqun Feng)
> - Initialize the dummy lock map with LD_WAIT_SLEEP to agree with
>   how the corresponding ww_mutex lockmaps are initialized
>   (Boqun Feng)
> 

Thanks!

> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Maarten Lankhorst <maarten@lankhorst.se>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org

Feel free to use these tags if you need.

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: maarten.lankhorst@linux.intel.com #v1

Tested-by: Boqun Feng <boqun.feng@gmail.com>

Peter, since the v2 of this is actually picked in tip/locking/core, I
assume you are going to drop that pick this v3? Let me know how you want
to proceed, since I have a PR based on tip/locking/core.

Regards,
Boqun

> ---
>  include/linux/ww_mutex.h       | 14 ++++++++++++++
>  kernel/locking/test-ww_mutex.c |  8 +++++---
>  lib/locking-selftest.c         |  4 ++--
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> index bb763085479a..45ff6f7a872b 100644
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
> +	lockdep_init_map_wait(&ctx->first_lock_dep_map, ww_class->mutex_name,
> +			      &ww_class->mutex_key, 0, LD_WAIT_SLEEP);
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
> index 10a5736a21c2..5d58b2c0ef98 100644
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
> @@ -679,7 +681,7 @@ static int __init test_ww_mutex_init(void)
>  	if (ret)
>  		return ret;
>  
> -	ret = stress(2047, hweight32(STRESS_ALL)*ncpus, STRESS_ALL);
> +	ret = stress(2046, hweight32(STRESS_ALL)*ncpus, STRESS_ALL);
>  	if (ret)
>  		return ret;
>  
> diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
> index 6f6a5fc85b42..6750321e3e9a 100644
> --- a/lib/locking-selftest.c
> +++ b/lib/locking-selftest.c
> @@ -1720,8 +1720,6 @@ static void ww_test_normal(void)
>  {
>  	int ret;
>  
> -	WWAI(&t);
> -
>  	/*
>  	 * None of the ww_mutex codepaths should be taken in the 'normal'
>  	 * mutex calls. The easiest way to verify this is by using the
> @@ -1770,6 +1768,8 @@ static void ww_test_normal(void)
>  	ww_mutex_base_unlock(&o.base);
>  	WARN_ON(o.ctx != (void *)~0UL);
>  
> +	WWAI(&t);
> +
>  	/* nest_lock */
>  	o.ctx = (void *)~0UL;
>  	ww_mutex_base_lock_nest_lock(&o.base, &t);
> -- 
> 2.46.0
> 
