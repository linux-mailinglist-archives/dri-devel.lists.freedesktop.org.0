Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0899F49E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E924510E0EC;
	Tue, 15 Oct 2024 18:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nfrx72lp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADC710E0EC;
 Tue, 15 Oct 2024 18:00:27 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7b12a02596aso147903085a.2; 
 Tue, 15 Oct 2024 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729015226; x=1729620026; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S1BxdHEZWEliogyG1J+QY5fDw9FHV13egUIB/DvmL3U=;
 b=Nfrx72lpD6gu4JUsnyYssST1yPr0fB4DSrdDD9oMCKLC+1KACSTLx/RM8PtyRTdOr9
 7+G949gNWI0SwsteCWL7ENvyI0C+tfL7rVKpI+WNGY2P0OlmUcVvNxS1yi8dBocjM2DP
 V1VvHulxfw2fYKRsP3Vv2AHxLx0ABT0XxnJngw7oL56Bjcfwf5zYe79t/AudznJJNUTh
 mxinKo4fdCEeN1AB/MSiUhMkwh7DouWDx5DXK9mZIyek95XSnbqsermiviLflZ8mJvMf
 MrCHn1OakDYfwdnuVeHbdMIQfcs9nkSKb2l+6tol8lPFT7cw11JEHZCap4O7ESLcP9oh
 3mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729015226; x=1729620026;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S1BxdHEZWEliogyG1J+QY5fDw9FHV13egUIB/DvmL3U=;
 b=RSIk3AVgEeN6u+CcuBkry6sU4EaY8/8zm2wNuDosUqC1K7axshRY+mrcFvuKaH/VIE
 v+HXJPS/XIzK7bQz55ihkQHYd9hCwU6NgTUJ29ncpvkFZp4AwmPBipBME5sljitNpRur
 XL/O0vbYnwUJxoU0HusHczZ9wHy11hmrvahvGgwPD7d8Mk7tw096q49mmy7V3JfoR0oa
 H5JZFE1Lusb2SEuMuAMzZPh1d8QAmUteYQUrRjx03UqIvspuBqZZca3GY6xsnzeacXCx
 PkWhKUxG9psxoYAHnLf+GFagPJ8azIvmOOWYp8QNvsn26ejXfmsyc6V9rYJC6OKQIORK
 wb8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFldBhMSJNHWJitP/0dFUORJAmnPcGnJtBFFDHsxwg7/LOJOi9q2s6JZz0BrMsZM+8dSI59uZMD8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCF9drE3AYZoEDil731qoOS0pba9d6OhuDcldT+24MHxnBlfuI
 R5vSnya3F07+Z8XfT5f38WKkrQ7IjBqP09fKZvzI/XoVEZUtNbAo
X-Google-Smtp-Source: AGHT+IG3qUIEHF+/l4+dB9oEUoz9L9Ss69/+kPyUP9BPLldKpPPv3PHWPLqsDBOOWldQqXN+GALvpg==
X-Received: by 2002:a05:620a:2682:b0:7ae:6ba2:faba with SMTP id
 af79cd13be357-7b1417f7c6emr131030985a.28.1729015225780; 
 Tue, 15 Oct 2024 11:00:25 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b13639a509sm97324085a.92.2024.10.15.11.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:00:24 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfauth.phl.internal (Postfix) with ESMTP id 180961200043;
 Tue, 15 Oct 2024 14:00:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Tue, 15 Oct 2024 14:00:24 -0400
X-ME-Sender: <xms:t60OZ4He3l78Rere98IL9sk648DpUykLLWYo1PkgYz3NjttLnYgCzw>
 <xme:t60OZxW_ruVhCEM6HbM-1xuMl-Jba2kE2hRUtMrFwVT1WRv6V_0psCYsQ47aZ2Wo1
 sZg6gmZ2jo8FoKnOQ>
X-ME-Received: <xmr:t60OZyKS0B_fFwyCiTFP3AQFOklDMc-NBb87cR0ZJkdmXXWG8da1fqs3c3fx7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegjedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
 udenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeehleevffdujeffgedvlefghffhleek
 ieeifeegveetjedvgeevueffieehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
 lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
 hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomh
 eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehinhhtvghlqdigvgeslhhi
 shhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehpvghtvghriiesih
 hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtgho
 mhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonh
 hgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnheslhgrnhhk
 hhhorhhsthdrshgvpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmh
 gurdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggv
 shhkthhophdrohhrgh
X-ME-Proxy: <xmx:t60OZ6EwVGcgW-7BBveew-JkT-pzRsbM721e4VZvFbKiMl41Udmktg>
 <xmx:uK0OZ-UeOVHeI6lvilkV1RVJb6mqx6GvYf5oOQ8fbg6g4wQb2zQ9Xg>
 <xmx:uK0OZ9OBFnkkdO95VyZmG5C5kiAz2xwvCH-QKpuf1-7okldiSQuaGw>
 <xmx:uK0OZ11qWuL0yF0xQ2AzlVN6sLin5YJbg3CyHvZ7H0VK5mGz2uXcmQ>
 <xmx:uK0OZ3Wke1iSBapnGNHHSRKHk_-o2mCf0u-Fcy6SiJyt_-fQnTHS-S65>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Oct 2024 14:00:23 -0400 (EDT)
Date: Tue, 15 Oct 2024 11:00:02 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Maarten Lankhorst <maarten@lankhorst.se>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
Message-ID: <Zw6touohNwfqs3T0@boqun-archlinux>
References: <20241009092031.6356-1-thomas.hellstrom@linux.intel.com>
 <Zw19sMtnKdyOVQoh@boqun-archlinux>
 <bf7632b74c075f2c430fdb98cefed486b4d9e74f.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf7632b74c075f2c430fdb98cefed486b4d9e74f.camel@linux.intel.com>
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

On Tue, Oct 15, 2024 at 05:27:28PM +0200, Thomas Hellström wrote:
[..]
> > diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
> > index 6f6a5fc85b42..6750321e3e9a 100644
> > --- a/lib/locking-selftest.c
> > +++ b/lib/locking-selftest.c
> > @@ -1720,8 +1720,6 @@ static void ww_test_normal(void)
> >  {
> >         int ret;
> > 
> > -       WWAI(&t);
> > -
> >         /*
> >          * None of the ww_mutex codepaths should be taken in the
> > 'normal'
> >          * mutex calls. The easiest way to verify this is by using
> > the
> > @@ -1770,6 +1768,8 @@ static void ww_test_normal(void)
> >         ww_mutex_base_unlock(&o.base);
> >         WARN_ON(o.ctx != (void *)~0UL);
> > 
> > +       WWAI(&t);
> > +
> >         /* nest_lock */
> >         o.ctx = (void *)~0UL;
> >         ww_mutex_base_lock_nest_lock(&o.base, &t);
> > 
> > Please confirm whether this change is intended.
> 
> This fix looks correct and while this change was not intended, I think
> it makes sense and if this locking order is present in existing code
> apart from this selftest, it's probably easily fixable.
> 
> > 
> > The second is a case as follow:
> > 
> > 	ww_acquire_init(...);
> > 	spin_lock(...);
> > 	ww_mutex_lock(...); // this should trigger a context
> > 			    // invalidation. But the mutex was
> > 			    // initialized by ww_acquire_init() as a
> > 			    // LD_WAIT_INV lock.
> > 
> > The following could fix this:
> > 
> > diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> > index a401a2f31a77..45ff6f7a872b 100644
> > --- a/include/linux/ww_mutex.h
> > +++ b/include/linux/ww_mutex.h
> > @@ -156,8 +156,8 @@ static inline void ww_acquire_init(struct
> > ww_acquire_ctx *ctx,
> >         debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
> >         lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
> >                          &ww_class->acquire_key, 0);
> > -       lockdep_init_map(&ctx->first_lock_dep_map, ww_class-
> > >mutex_name,
> > -                        &ww_class->mutex_key, 0);
> > +       lockdep_init_map_wait(&ctx->first_lock_dep_map, ww_class-
> > >mutex_name,
> > +                             &ww_class->mutex_key, 0,
> > LD_WAIT_SLEEP);
> >         mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
> >         mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx-
> > >dep_map, _RET_IP_);
> >  #endif
> > 
> > A v3 with all these fixed would look good to me, and I can add a
> > Tested-by tag to it. Thanks!
> 
> The fix here is a bit confusing. It looks like this test is crafted to
> fail because we take a sleeping ww_mutex inside a spinlock. But the
> ww_mutex lockdep map is already initialized as LD_WAIT_SLEEP. How come
> the first_lock_dep_map locking mode LD_WAIT_INV is used in the
> ww_mutex_lock()? Is that because of the lockdep hlock refcounting?
> 

No, it's not because of refcounting, actually in this case refcounting
won't happen because there is a spin_lock sitting in between:

held_locks stack:

	ww_lockdep_acquire
	  ww_lockdep_mutex
	    lock_A

because there is a lock_A here, the following "if" will be false for
ww_mutex_lock() in the test case:

	hlock = curr->held_locks + depth - 1;
	if (hlock->class_idx == class_idx && nest_lock) {

The reason why the wait types of 'first_lock_dep_map' matter is because
the lock class it shares with ww_mutex_lock() are registered at
*acquire* time. So because we do

	ww_acquire_init():
	  ...
	  lockdep_init_map(...);
	  ...
	  mutex_acquire_nest(...);
	...
	ww_mutex_lock():
	  __mutex_lock_common():
	    mutex_acquire_nest(...);

in the test case, these two mutex_acquire_nest()s use different
lockdep_maps but share the same key, therefore whoever call
mutex_acquire_nest() registers the lock class with its wait types.

So even though first_lock_dep_map is a fake lock, it has to have the
same wait types as a real mutex.

Does this make sense?

Regards,
Boqun

> Thanks,
> Thomas
> 
> 
> 
> > 
> > Regards,
> > Boqun
> > 
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Cc: Ingo Molnar <mingo@redhat.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Waiman Long <longman@redhat.com>
> > > Cc: Boqun Feng <boqun.feng@gmail.com>
> > > Cc: Maarten Lankhorst <maarten@lankhorst.se>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  include/linux/ww_mutex.h       | 14 ++++++++++++++
> > >  kernel/locking/test-ww_mutex.c |  8 +++++---
> > >  2 files changed, 19 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> > > index bb763085479a..a401a2f31a77 100644
> > > --- a/include/linux/ww_mutex.h
> > > +++ b/include/linux/ww_mutex.h
> > > @@ -65,6 +65,16 @@ struct ww_acquire_ctx {
> > >  #endif
> > >  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > >  	struct lockdep_map dep_map;
> > > +	/**
> > > +	 * @first_lock_dep_map: fake lockdep_map for first locked
> > > ww_mutex.
> > > +	 *
> > > +	 * lockdep requires the lockdep_map for the first locked
> > > ww_mutex
> > > +	 * in a ww transaction to remain in memory until all
> > > ww_mutexes of
> > > +	 * the transaction have been unlocked. Ensure this by
> > > keeping a
> > > +	 * fake locked ww_mutex lockdep map between
> > > ww_acquire_init() and
> > > +	 * ww_acquire_fini().
> > > +	 */
> > > +	struct lockdep_map first_lock_dep_map;
> > >  #endif
> > >  #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > >  	unsigned int deadlock_inject_interval;
> > > @@ -146,7 +156,10 @@ static inline void ww_acquire_init(struct
> > > ww_acquire_ctx *ctx,
> > >  	debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
> > >  	lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
> > >  			 &ww_class->acquire_key, 0);
> > > +	lockdep_init_map(&ctx->first_lock_dep_map, ww_class-
> > > >mutex_name,
> > > +			 &ww_class->mutex_key, 0);
> > >  	mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
> > > +	mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx-
> > > >dep_map, _RET_IP_);
> > >  #endif
> > >  #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > >  	ctx->deadlock_inject_interval = 1;
> > > @@ -185,6 +198,7 @@ static inline void ww_acquire_done(struct
> > > ww_acquire_ctx *ctx)
> > >  static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
> > >  {
> > >  #ifdef CONFIG_DEBUG_LOCK_ALLOC
> > > +	mutex_release(&ctx->first_lock_dep_map, _THIS_IP_);
> > >  	mutex_release(&ctx->dep_map, _THIS_IP_);
> > >  #endif
> > >  #ifdef DEBUG_WW_MUTEXES
> > > diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-
> > > ww_mutex.c
> > > index 10a5736a21c2..5d58b2c0ef98 100644
> > > --- a/kernel/locking/test-ww_mutex.c
> > > +++ b/kernel/locking/test-ww_mutex.c
> > > @@ -62,7 +62,8 @@ static int __test_mutex(unsigned int flags)
> > >  	int ret;
> > >  
> > >  	ww_mutex_init(&mtx.mutex, &ww_class);
> > > -	ww_acquire_init(&ctx, &ww_class);
> > > +	if (flags & TEST_MTX_CTX)
> > > +		ww_acquire_init(&ctx, &ww_class);
> > >  
> > >  	INIT_WORK_ONSTACK(&mtx.work, test_mutex_work);
> > >  	init_completion(&mtx.ready);
> > > @@ -90,7 +91,8 @@ static int __test_mutex(unsigned int flags)
> > >  		ret = wait_for_completion_timeout(&mtx.done,
> > > TIMEOUT);
> > >  	}
> > >  	ww_mutex_unlock(&mtx.mutex);
> > > -	ww_acquire_fini(&ctx);
> > > +	if (flags & TEST_MTX_CTX)
> > > +		ww_acquire_fini(&ctx);
> > >  
> > >  	if (ret) {
> > >  		pr_err("%s(flags=%x): mutual exclusion failure\n",
> > > @@ -679,7 +681,7 @@ static int __init test_ww_mutex_init(void)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	ret = stress(2047, hweight32(STRESS_ALL)*ncpus,
> > > STRESS_ALL);
> > > +	ret = stress(2046, hweight32(STRESS_ALL)*ncpus,
> > > STRESS_ALL);
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -- 
> > > 2.46.0
> > > 
> 
