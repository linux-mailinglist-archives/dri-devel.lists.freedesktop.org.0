Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B29A648D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 12:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0141F10E488;
	Mon, 21 Oct 2024 10:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDSUheKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440F610E488;
 Mon, 21 Oct 2024 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729507679; x=1761043679;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SMjnTSr9VUwof+iEmcpuQvv4HwVDZQDp/zIe72N2lng=;
 b=lDSUheKL+Rv4TgTjN2o/sHyXPqvm+LVgw6pTJ2a5zOZJWm8MglV3ufxG
 Ub1sAWs1GnNcchTe2Lhtdq28u/RVB0JrgUpc/f+i7oMd6EduZy8IPzt/W
 V3B4I1PwyYzfb/cCapzIoiBFL8fN3xheUkH0fm/GxSrpc+oi94Y+9zEXT
 98DBpT/YJKtwSup23waWaSjwHiurV5/QalXVt130atEOf64PuSC1p2UDH
 KtUcG9IHgTx1FZUx8Ua+qD/bHieGFf0frnmL2ujM2DrZlyPRMGXHBEgJx
 ZTGX3lnANyKxSRwSYYT95mOjNWPeqctOb79E280Z7xWYNEp3DMSv+3F2v g==;
X-CSE-ConnectionGUID: GbcUvhjUR8Kk1joprIdmOw==
X-CSE-MsgGUID: irYKSnjPSJCaCH2aw+AUXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32790130"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="32790130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:47:58 -0700
X-CSE-ConnectionGUID: byBY8t8sQvej1lNomSCrIg==
X-CSE-MsgGUID: CBSbkv8PT1uk8WECIH9HMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79645959"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.239])
 ([10.245.246.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 03:47:55 -0700
Message-ID: <64aa70d30c25a95bce34c2eeff38dd3e23d48d17.camel@linux.intel.com>
Subject: Re: [PATCH v3] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: intel-xe@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Maarten
 Lankhorst <maarten@lankhorst.se>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com
Date: Mon, 21 Oct 2024 12:47:42 +0200
In-Reply-To: <ZxE3t2ztVYo1ol9T@boqun-archlinux>
References: <20241017151007.92215-1-thomas.hellstrom@linux.intel.com>
 <ZxE3t2ztVYo1ol9T@boqun-archlinux>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Thu, 2024-10-17 at 09:13 -0700, Boqun Feng wrote:
> On Thu, Oct 17, 2024 at 05:10:07PM +0200, Thomas Hellstr=C3=B6m wrote:
> > When using mutex_acquire_nest() with a nest_lock, lockdep refcounts
> > the
> > number of acquired lockdep_maps of mutexes of the same class, and
> > also
> > keeps a pointer to the first acquired lockdep_map of a class. That
> > pointer
> > is then used for various comparison-, printing- and checking
> > purposes,
> > but there is no mechanism to actively ensure that lockdep_map stays
> > in
> > memory. Instead, a warning is printed if the lockdep_map is freed
> > and
> > there are still held locks of the same lock class, even if the
> > lockdep_map
> > itself has been released.
> >=20
> > In the context of WW/WD transactions that means that if a user
> > unlocks
> > and frees a ww_mutex from within an ongoing ww transaction, and
> > that
> > mutex happens to be the first ww_mutex grabbed in the transaction,
> > such a warning is printed and there might be a risk of a UAF.
> >=20
> > Note that this is only problem when lockdep is enabled and affects
> > only
> > dereferences of struct lockdep_map.
> >=20
> > Adjust to this by adding a fake lockdep_map to the acquired context
> > and
> > make sure it is the first acquired lockdep map of the associated
> > ww_mutex class. Then hold it for the duration of the WW/WD
> > transaction.
> >=20
> > This has the side effect that trying to lock a ww mutex *without* a
> > ww_acquire_context but where a such context has been acquire, we'd
> > see
> > a lockdep splat. The test-ww_mutex.c selftest attempts to do that,
> > so
> > modify that particular test to not acquire a ww_acquire_context if
> > it
> > is not going to be used.
> >=20
> > v2:
> > - Lower the number of locks in the test-ww_mutex
> > =C2=A0 stress(STRESS_ALL) test to accommodate the dummy lock
> > =C2=A0 introduced in this patch without overflowing lockdep held lock
> > =C2=A0 references.
> >=20
> > v3:
> > - Adjust the ww_test_normal locking-api selftest to avoid
> > =C2=A0 recursive locking (Boqun Feng)
> > - Initialize the dummy lock map with LD_WAIT_SLEEP to agree with
> > =C2=A0 how the corresponding ww_mutex lockmaps are initialized
> > =C2=A0 (Boqun Feng)
> >=20
>=20
> Thanks!
>=20
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Boqun Feng <boqun.feng@gmail.com>
> > Cc: Maarten Lankhorst <maarten@lankhorst.se>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
>=20
> Feel free to use these tags if you need.
>=20
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Acked-by: maarten.lankhorst@linux.intel.com=C2=A0#v1
>=20
> Tested-by: Boqun Feng <boqun.feng@gmail.com>


Peter, Can you add these 3 tags when picking, or do you want me to send
a v4 with the tags included.

Thanks,
Thomas



>=20
> Peter, since the v2 of this is actually picked in tip/locking/core, I
> assume you are going to drop that pick this v3? Let me know how you
> want
> to proceed, since I have a PR based on tip/locking/core.
>=20
> Regards,
> Boqun
>=20
> > ---
> > =C2=A0include/linux/ww_mutex.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=
 ++++++++++++++
> > =C2=A0kernel/locking/test-ww_mutex.c |=C2=A0 8 +++++---
> > =C2=A0lib/locking-selftest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++--
> > =C2=A03 files changed, 21 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> > index bb763085479a..45ff6f7a872b 100644
> > --- a/include/linux/ww_mutex.h
> > +++ b/include/linux/ww_mutex.h
> > @@ -65,6 +65,16 @@ struct ww_acquire_ctx {
> > =C2=A0#endif
> > =C2=A0#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > =C2=A0	struct lockdep_map dep_map;
> > +	/**
> > +	 * @first_lock_dep_map: fake lockdep_map for first locked
> > ww_mutex.
> > +	 *
> > +	 * lockdep requires the lockdep_map for the first locked
> > ww_mutex
> > +	 * in a ww transaction to remain in memory until all
> > ww_mutexes of
> > +	 * the transaction have been unlocked. Ensure this by
> > keeping a
> > +	 * fake locked ww_mutex lockdep map between
> > ww_acquire_init() and
> > +	 * ww_acquire_fini().
> > +	 */
> > +	struct lockdep_map first_lock_dep_map;
> > =C2=A0#endif
> > =C2=A0#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > =C2=A0	unsigned int deadlock_inject_interval;
> > @@ -146,7 +156,10 @@ static inline void ww_acquire_init(struct
> > ww_acquire_ctx *ctx,
> > =C2=A0	debug_check_no_locks_freed((void *)ctx, sizeof(*ctx));
> > =C2=A0	lockdep_init_map(&ctx->dep_map, ww_class->acquire_name,
> > =C2=A0			 &ww_class->acquire_key, 0);
> > +	lockdep_init_map_wait(&ctx->first_lock_dep_map, ww_class-
> > >mutex_name,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ww_class->mutex_key, 0,
> > LD_WAIT_SLEEP);
> > =C2=A0	mutex_acquire(&ctx->dep_map, 0, 0, _RET_IP_);
> > +	mutex_acquire_nest(&ctx->first_lock_dep_map, 0, 0, &ctx-
> > >dep_map, _RET_IP_);
> > =C2=A0#endif
> > =C2=A0#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > =C2=A0	ctx->deadlock_inject_interval =3D 1;
> > @@ -185,6 +198,7 @@ static inline void ww_acquire_done(struct
> > ww_acquire_ctx *ctx)
> > =C2=A0static inline void ww_acquire_fini(struct ww_acquire_ctx *ctx)
> > =C2=A0{
> > =C2=A0#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +	mutex_release(&ctx->first_lock_dep_map, _THIS_IP_);
> > =C2=A0	mutex_release(&ctx->dep_map, _THIS_IP_);
> > =C2=A0#endif
> > =C2=A0#ifdef DEBUG_WW_MUTEXES
> > diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-
> > ww_mutex.c
> > index 10a5736a21c2..5d58b2c0ef98 100644
> > --- a/kernel/locking/test-ww_mutex.c
> > +++ b/kernel/locking/test-ww_mutex.c
> > @@ -62,7 +62,8 @@ static int __test_mutex(unsigned int flags)
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	ww_mutex_init(&mtx.mutex, &ww_class);
> > -	ww_acquire_init(&ctx, &ww_class);
> > +	if (flags & TEST_MTX_CTX)
> > +		ww_acquire_init(&ctx, &ww_class);
> > =C2=A0
> > =C2=A0	INIT_WORK_ONSTACK(&mtx.work, test_mutex_work);
> > =C2=A0	init_completion(&mtx.ready);
> > @@ -90,7 +91,8 @@ static int __test_mutex(unsigned int flags)
> > =C2=A0		ret =3D wait_for_completion_timeout(&mtx.done,
> > TIMEOUT);
> > =C2=A0	}
> > =C2=A0	ww_mutex_unlock(&mtx.mutex);
> > -	ww_acquire_fini(&ctx);
> > +	if (flags & TEST_MTX_CTX)
> > +		ww_acquire_fini(&ctx);
> > =C2=A0
> > =C2=A0	if (ret) {
> > =C2=A0		pr_err("%s(flags=3D%x): mutual exclusion failure\n",
> > @@ -679,7 +681,7 @@ static int __init test_ww_mutex_init(void)
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > -	ret =3D stress(2047, hweight32(STRESS_ALL)*ncpus,
> > STRESS_ALL);
> > +	ret =3D stress(2046, hweight32(STRESS_ALL)*ncpus,
> > STRESS_ALL);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
> > index 6f6a5fc85b42..6750321e3e9a 100644
> > --- a/lib/locking-selftest.c
> > +++ b/lib/locking-selftest.c
> > @@ -1720,8 +1720,6 @@ static void ww_test_normal(void)
> > =C2=A0{
> > =C2=A0	int ret;
> > =C2=A0
> > -	WWAI(&t);
> > -
> > =C2=A0	/*
> > =C2=A0	 * None of the ww_mutex codepaths should be taken in the
> > 'normal'
> > =C2=A0	 * mutex calls. The easiest way to verify this is by using
> > the
> > @@ -1770,6 +1768,8 @@ static void ww_test_normal(void)
> > =C2=A0	ww_mutex_base_unlock(&o.base);
> > =C2=A0	WARN_ON(o.ctx !=3D (void *)~0UL);
> > =C2=A0
> > +	WWAI(&t);
> > +
> > =C2=A0	/* nest_lock */
> > =C2=A0	o.ctx =3D (void *)~0UL;
> > =C2=A0	ww_mutex_base_lock_nest_lock(&o.base, &t);
> > --=20
> > 2.46.0
> >=20

