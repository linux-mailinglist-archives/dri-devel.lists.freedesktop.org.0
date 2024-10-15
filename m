Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFB99F123
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 17:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1110E5A8;
	Tue, 15 Oct 2024 15:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="df8HPjO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFA010E5A8;
 Tue, 15 Oct 2024 15:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006056; x=1760542056;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=u+kO1xdcFvcjScccq0lmFujp0mBWTsv2afEepWWGCXk=;
 b=df8HPjO7bSuUU1zS+hprIOcO2L7D774I0mHvPUDPiWCqqfYc2K667y1e
 sdbGqUU92X4MOYUOjhaIsgXglaDr09xPZlm0384fzCGVWhejz59REcBuD
 tmNJ2Dk9BGhkM83O7kG6wlFer5aAtSMU1AZkryQc+ZiXi5CMOxGXmHBSl
 z+JBCDIwdPURT7Q5jR0WBfWu97gC+K2hr3nhUxnr3ml6+iISVR0+WP4GA
 okz2Iom3YhL0SYeZohoI85CEBHRuPeaV4EIxBB4/ymiDG0C8weKJ9lnc7
 OfUKlMTmGhv5xa6O3xnAvVfOQRYhtkRD2U0v2OVkVmBcp2LVYRkdQ0te0 g==;
X-CSE-ConnectionGUID: JlLBM3EmRyqx8KtYbIZj+Q==
X-CSE-MsgGUID: T9LXwisGQ0+Ic4WMmk6Icw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38959923"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="38959923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:27:35 -0700
X-CSE-ConnectionGUID: tuBxWYHRQQKdyoSAPLDiIw==
X-CSE-MsgGUID: w5++fv1ZQHW711q2ac0S9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78102317"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.43])
 ([10.245.246.43])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:27:32 -0700
Message-ID: <bf7632b74c075f2c430fdb98cefed486b4d9e74f.camel@linux.intel.com>
Subject: Re: [PATCH v2] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: intel-xe@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long
 <longman@redhat.com>, Maarten Lankhorst <maarten@lankhorst.se>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 15 Oct 2024 17:27:28 +0200
In-Reply-To: <Zw19sMtnKdyOVQoh@boqun-archlinux>
References: <20241009092031.6356-1-thomas.hellstrom@linux.intel.com>
 <Zw19sMtnKdyOVQoh@boqun-archlinux>
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

On Mon, 2024-10-14 at 13:23 -0700, Boqun Feng wrote:
> Hi Thomas,
>=20
> On Wed, Oct 09, 2024 at 11:20:31AM +0200, Thomas Hellstr=C3=B6m wrote:
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
>=20
> Have you tested your patch with lib/locking-selftests.c? It reported
> two
> errors for me:
>=20
> 	[..]=C2=A0=C2=A0 | Wound/wait tests |
> 	[..]=C2=A0=C2=A0 ---------------------
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ww api failures:=C2=A0 ok=C2=A0 =
|FAILED|=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ww contexts mixing:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=
=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 finishing ww context:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 =
ok=C2=A0
> |=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 locking mismatches:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=
=A0 |=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDEADLK handling:=C2=A0 ok=C2=A0 |=C2=
=A0 ok=C2=A0 |=C2=A0 ok=C2=A0
> |=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=
=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
pinlock nest unlocked:=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 spinlock nest test:=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0 -----------------------------------------------------
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |block | try=C2=
=A0
> |context|
> 	[..]=C2=A0=C2=A0 -----------------------------------------------------
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 context:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=
=A0 |=C2=A0 ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 block:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |=C2=A0 =
ok=C2=A0 |
> 	[..]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 spinlock:=C2=A0 ok=C2=A0 |=C2=A0 ok=C2=A0 |FAILED|
>=20
> The first one is a use case issue, I think and can be fixed similar
> to
> your changes in test-ww_mutex.c:
>=20
> diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
> index 6f6a5fc85b42..6750321e3e9a 100644
> --- a/lib/locking-selftest.c
> +++ b/lib/locking-selftest.c
> @@ -1720,8 +1720,6 @@ static void ww_test_normal(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WWAI(&t);
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * None of the ww_mutex c=
odepaths should be taken in the
> 'normal'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mutex calls. The easie=
st way to verify this is by using
> the
> @@ -1770,6 +1768,8 @@ static void ww_test_normal(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ww_mutex_base_unlock(&o.base);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(o.ctx !=3D (void *)~0U=
L);
>=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WWAI(&t);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* nest_lock */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 o.ctx =3D (void *)~0UL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ww_mutex_base_lock_nest_lock(&=
o.base, &t);
>=20
> Please confirm whether this change is intended.

This fix looks correct and while this change was not intended, I think
it makes sense and if this locking order is present in existing code
apart from this selftest, it's probably easily fixable.

>=20
> The second is a case as follow:
>=20
> 	ww_acquire_init(...);
> 	spin_lock(...);
> 	ww_mutex_lock(...); // this should trigger a context
> 			=C2=A0=C2=A0=C2=A0 // invalidation. But the mutex was
> 			=C2=A0=C2=A0=C2=A0 // initialized by ww_acquire_init() as a
> 			=C2=A0=C2=A0=C2=A0 // LD_WAIT_INV lock.
>=20
> The following could fix this:
>=20
> diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> index a401a2f31a77..45ff6f7a872b 100644
> --- a/include/linux/ww_mutex.h
> +++ b/include/linux/ww_mutex.h
> @@ -156,8 +156,8 @@ static inline void ww_acquire_init(struct
> ww_acquire_ctx *ctx,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debug_check_no_locks_freed((vo=
id *)ctx, sizeof(*ctx));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lockdep_init_map(&ctx->dep_map=
, ww_class->acquire_name,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &w=
w_class->acquire_key, 0);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lockdep_init_map(&ctx->first_lock_d=
ep_map, ww_class-
> >mutex_name,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ww_clas=
s->mutex_key, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lockdep_init_map_wait(&ctx->first_l=
ock_dep_map, ww_class-
> >mutex_name,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &ww_class->mutex_key, 0,
> LD_WAIT_SLEEP);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_acquire(&ctx->dep_map, 0=
, 0, _RET_IP_);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_acquire_nest(&ctx->first=
_lock_dep_map, 0, 0, &ctx-
> >dep_map, _RET_IP_);
> =C2=A0#endif
>=20
> A v3 with all these fixed would look good to me, and I can add a
> Tested-by tag to it. Thanks!

The fix here is a bit confusing. It looks like this test is crafted to
fail because we take a sleeping ww_mutex inside a spinlock. But the
ww_mutex lockdep map is already initialized as LD_WAIT_SLEEP. How come
the first_lock_dep_map locking mode LD_WAIT_INV is used in the
ww_mutex_lock()? Is that because of the lockdep hlock refcounting?

Thanks,
Thomas



>=20
> Regards,
> Boqun
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
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0include/linux/ww_mutex.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14=
 ++++++++++++++
> > =C2=A0kernel/locking/test-ww_mutex.c |=C2=A0 8 +++++---
> > =C2=A02 files changed, 19 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
> > index bb763085479a..a401a2f31a77 100644
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
> > +	lockdep_init_map(&ctx->first_lock_dep_map, ww_class-
> > >mutex_name,
> > +			 &ww_class->mutex_key, 0);
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
> > --=20
> > 2.46.0
> >=20

