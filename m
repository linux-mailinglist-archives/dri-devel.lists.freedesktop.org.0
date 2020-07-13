Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711721DBAA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 18:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB18A6E2D8;
	Mon, 13 Jul 2020 16:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDA16E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:26:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k6so17203977wrn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 09:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xSGvrXQGHH+/K2bFTeYpVF/ZVPHBzgQj2ANQHQDln/4=;
 b=RmJ7kfNWeCMaZqFmxiS31Mh+O2xlGV0joMzXhMyLQ+TjmXO5aWcG+YS4LBvTew8qjA
 9dS9lNzaf4W9X7aTZ0xrdBcqwOhd2eseauBKFm6fjPnt4uPVeefcYDTyWOPyOigalnYZ
 BoXhqrMDG0PvSJQevPCRysbPWun8HWaG0/wQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xSGvrXQGHH+/K2bFTeYpVF/ZVPHBzgQj2ANQHQDln/4=;
 b=ldLaoT3mM0R+vV8hfWI6ExgVVcrxpM04gXsGsZZOy1ovkf8dzxi97B7PGXRweLCV7S
 Gjhvj7pxncs3vLsH1KmjthXE60IKCl8nE6uRAtuwSAunCuFKU40UP0WEQgo8NiZqZWZ9
 nc4TY53R1KrJuL4Vtduay1U6mQ37TaH7hk1JK52eVwOB7alDWd2O/ZCi53rzdPAFKLhs
 a9kc508LDf8dotM9cJCUSlsLskXExPPFmJx6A1HcW3PqDVciu8TZdK9wye8WhOg/2aQa
 1QF+zWvuHTEiIANJ997zUfkf8MlRmlwDlcID9UhbGHopRWMte0CToeJZlxYNNqkWep/y
 r4gw==
X-Gm-Message-State: AOAM533PzGwjBvzz8odJVe78eGs2a2TGdw6kSzDujtEtcsejq3vE9V4O
 GKDOY0a7pyBZWucRIw7QMBux7A==
X-Google-Smtp-Source: ABdhPJzeM3lh0D8zNPUrOqpS8TLSp4WMznuYzRGtcBnVhKpFX7KMoKhECQEolaNv8wEDCvM4YCY7mQ==
X-Received: by 2002:adf:f0ce:: with SMTP id x14mr123338wro.137.1594657573830; 
 Mon, 13 Jul 2020 09:26:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y7sm24176681wrt.11.2020.07.13.09.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 09:26:12 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:26:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 01/25] dma-fence: basic lockdep annotations
Message-ID: <20200713162610.GS3278063@phenom.ffwll.local>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-2-daniel.vetter@ffwll.ch>
 <20c0a95b-8367-4f26-d058-1cb265255283@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20c0a95b-8367-4f26-d058-1cb265255283@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Wed, Jul 08, 2020 at 04:57:21PM +0200, Christian K=F6nig wrote:
> Could we merge this controlled by a separate config option?
> =

> This way we could have the checks upstream without having to fix all the
> stuff before we do this?

Discussions died out a bit, do you consider this a blocker for the first
two patches, or good for an ack on these?

Like I said I don't plan to merge patches where I know it causes a lockdep
splat with a driver still. At least for now.

Thanks, Daniel

> =

> Thanks,
> Christian.
> =

> Am 07.07.20 um 22:12 schrieb Daniel Vetter:
> > Design is similar to the lockdep annotations for workers, but with
> > some twists:
> > =

> > - We use a read-lock for the execution/worker/completion side, so that
> >    this explicit annotation can be more liberally sprinkled around.
> >    With read locks lockdep isn't going to complain if the read-side
> >    isn't nested the same way under all circumstances, so ABBA deadlocks
> >    are ok. Which they are, since this is an annotation only.
> > =

> > - We're using non-recursive lockdep read lock mode, since in recursive
> >    read lock mode lockdep does not catch read side hazards. And we
> >    _very_ much want read side hazards to be caught. For full details of
> >    this limitation see
> > =

> >    commit e91498589746065e3ae95d9a00b068e525eec34f
> >    Author: Peter Zijlstra <peterz@infradead.org>
> >    Date:   Wed Aug 23 13:13:11 2017 +0200
> > =

> >        locking/lockdep/selftests: Add mixed read-write ABBA tests
> > =

> > - To allow nesting of the read-side explicit annotations we explicitly
> >    keep track of the nesting. lock_is_held() allows us to do that.
> > =

> > - The wait-side annotation is a write lock, and entirely done within
> >    dma_fence_wait() for everyone by default.
> > =

> > - To be able to freely annotate helper functions I want to make it ok
> >    to call dma_fence_begin/end_signalling from soft/hardirq context.
> >    First attempt was using the hardirq locking context for the write
> >    side in lockdep, but this forces all normal spinlocks nested within
> >    dma_fence_begin/end_signalling to be spinlocks. That bollocks.
> > =

> >    The approach now is to simple check in_atomic(), and for these cases
> >    entirely rely on the might_sleep() check in dma_fence_wait(). That
> >    will catch any wrong nesting against spinlocks from soft/hardirq
> >    contexts.
> > =

> > The idea here is that every code path that's critical for eventually
> > signalling a dma_fence should be annotated with
> > dma_fence_begin/end_signalling. The annotation ideally starts right
> > after a dma_fence is published (added to a dma_resv, exposed as a
> > sync_file fd, attached to a drm_syncobj fd, or anything else that
> > makes the dma_fence visible to other kernel threads), up to and
> > including the dma_fence_wait(). Examples are irq handlers, the
> > scheduler rt threads, the tail of execbuf (after the corresponding
> > fences are visible), any workers that end up signalling dma_fences and
> > really anything else. Not annotated should be code paths that only
> > complete fences opportunistically as the gpu progresses, like e.g.
> > shrinker/eviction code.
> > =

> > The main class of deadlocks this is supposed to catch are:
> > =

> > Thread A:
> > =

> > 	mutex_lock(A);
> > 	mutex_unlock(A);
> > =

> > 	dma_fence_signal();
> > =

> > Thread B:
> > =

> > 	mutex_lock(A);
> > 	dma_fence_wait();
> > 	mutex_unlock(A);
> > =

> > Thread B is blocked on A signalling the fence, but A never gets around
> > to that because it cannot acquire the lock A.
> > =

> > Note that dma_fence_wait() is allowed to be nested within
> > dma_fence_begin/end_signalling sections. To allow this to happen the
> > read lock needs to be upgraded to a write lock, which means that any
> > other lock is acquired between the dma_fence_begin_signalling() call and
> > the call to dma_fence_wait(), and still held, this will result in an
> > immediate lockdep complaint. The only other option would be to not
> > annotate such calls, defeating the point. Therefore these annotations
> > cannot be sprinkled over the code entirely mindless to avoid false
> > positives.
> > =

> > Originally I hope that the cross-release lockdep extensions would
> > alleviate the need for explicit annotations:
> > =

> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flwn=
.net%2FArticles%2F709849%2F&amp;data=3D02%7C01%7Cchristian.koenig%40amd.com=
%7Cff1a9dd17c544534eeb808d822b21ba2%7C3dd8961fe4884e608e11a82d994e183d%7C0%=
7C0%7C637297495649621566&amp;sdata=3DpbDwf%2BAG1UZ5bLZeep7VeGVQMnlQhX0TKG1d=
6Ok8GfQ%3D&amp;reserved=3D0
> > =

> > But there's a few reasons why that's not an option:
> > =

> > - It's not happening in upstream, since it got reverted due to too
> >    many false positives:
> > =

> > 	commit e966eaeeb623f09975ef362c2866fae6f86844f9
> > 	Author: Ingo Molnar <mingo@kernel.org>
> > 	Date:   Tue Dec 12 12:31:16 2017 +0100
> > =

> > 	    locking/lockdep: Remove the cross-release locking checks
> > =

> > 	    This code (CONFIG_LOCKDEP_CROSSRELEASE=3Dy and CONFIG_LOCKDEP_COMP=
LETIONS=3Dy),
> > 	    while it found a number of old bugs initially, was also causing to=
o many
> > 	    false positives that caused people to disable lockdep - which is a=
rguably
> > 	    a worse overall outcome.
> > =

> > - cross-release uses the complete() call to annotate the end of
> >    critical sections, for dma_fence that would be dma_fence_signal().
> >    But we do not want all dma_fence_signal() calls to be treated as
> >    critical, since many are opportunistic cleanup of gpu requests. If
> >    these get stuck there's still the main completion interrupt and
> >    workers who can unblock everyone. Automatically annotating all
> >    dma_fence_signal() calls would hence cause false positives.
> > =

> > - cross-release had some educated guesses for when a critical section
> >    starts, like fresh syscall or fresh work callback. This would again
> >    cause false positives without explicit annotations, since for
> >    dma_fence the critical sections only starts when we publish a fence.
> > =

> > - Furthermore there can be cases where a thread never does a
> >    dma_fence_signal, but is still critical for reaching completion of
> >    fences. One example would be a scheduler kthread which picks up jobs
> >    and pushes them into hardware, where the interrupt handler or
> >    another completion thread calls dma_fence_signal(). But if the
> >    scheduler thread hangs, then all the fences hang, hence we need to
> >    manually annotate it. cross-release aimed to solve this by chaining
> >    cross-release dependencies, but the dependency from scheduler thread
> >    to the completion interrupt handler goes through hw where
> >    cross-release code can't observe it.
> > =

> > In short, without manual annotations and careful review of the start
> > and end of critical sections, cross-relese dependency tracking doesn't
> > work. We need explicit annotations.
> > =

> > v2: handle soft/hardirq ctx better against write side and dont forget
> > EXPORT_SYMBOL, drivers can't use this otherwise.
> > =

> > v3: Kerneldoc.
> > =

> > v4: Some spelling fixes from Mika
> > =

> > v5: Amend commit message to explain in detail why cross-release isn't
> > the solution.
> > =

> > v6: Pull out misplaced .rst hunk.
> > =

> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> > Cc: Thomas Hellstrom <thomas.hellstrom@intel.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-rdma@vger.kernel.org
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >   Documentation/driver-api/dma-buf.rst |   6 +
> >   drivers/dma-buf/dma-fence.c          | 161 +++++++++++++++++++++++++++
> >   include/linux/dma-fence.h            |  12 ++
> >   3 files changed, 179 insertions(+)
> > =

> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index 7fb7b661febd..05d856131140 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -133,6 +133,12 @@ DMA Fences
> >   .. kernel-doc:: drivers/dma-buf/dma-fence.c
> >      :doc: DMA fences overview
> > +DMA Fence Signalling Annotations
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > +   :doc: fence signalling annotation
> > +
> >   DMA Fences Functions Reference
> >   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index 656e9ac2d028..0005bc002529 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -110,6 +110,160 @@ u64 dma_fence_context_alloc(unsigned num)
> >   }
> >   EXPORT_SYMBOL(dma_fence_context_alloc);
> > +/**
> > + * DOC: fence signalling annotation
> > + *
> > + * Proving correctness of all the kernel code around &dma_fence throug=
h code
> > + * review and testing is tricky for a few reasons:
> > + *
> > + * * It is a cross-driver contract, and therefore all drivers must fol=
low the
> > + *   same rules for lock nesting order, calling contexts for various f=
unctions
> > + *   and anything else significant for in-kernel interfaces. But it is=
 also
> > + *   impossible to test all drivers in a single machine, hence brute-f=
orce N vs.
> > + *   N testing of all combinations is impossible. Even just limiting t=
o the
> > + *   possible combinations is infeasible.
> > + *
> > + * * There is an enormous amount of driver code involved. For render d=
rivers
> > + *   there's the tail of command submission, after fences are publishe=
d,
> > + *   scheduler code, interrupt and workers to process job completion,
> > + *   and timeout, gpu reset and gpu hang recovery code. Plus for integ=
ration
> > + *   with core mm with have &mmu_notifier, respectively &mmu_interval_=
notifier,
> > + *   and &shrinker. For modesetting drivers there's the commit tail fu=
nctions
> > + *   between when fences for an atomic modeset are published, and when=
 the
> > + *   corresponding vblank completes, including any interrupt processin=
g and
> > + *   related workers. Auditing all that code, across all drivers, is n=
ot
> > + *   feasible.
> > + *
> > + * * Due to how many other subsystems are involved and the locking hie=
rarchies
> > + *   this pulls in there is extremely thin wiggle-room for driver-spec=
ific
> > + *   differences. &dma_fence interacts with almost all of the core mem=
ory
> > + *   handling through page fault handlers via &dma_resv, dma_resv_lock=
() and
> > + *   dma_resv_unlock(). On the other side it also interacts through all
> > + *   allocation sites through &mmu_notifier and &shrinker.
> > + *
> > + * Furthermore lockdep does not handle cross-release dependencies, whi=
ch means
> > + * any deadlocks between dma_fence_wait() and dma_fence_signal() can't=
 be caught
> > + * at runtime with some quick testing. The simplest example is one thr=
ead
> > + * waiting on a &dma_fence while holding a lock::
> > + *
> > + *     lock(A);
> > + *     dma_fence_wait(B);
> > + *     unlock(A);
> > + *
> > + * while the other thread is stuck trying to acquire the same lock, wh=
ich
> > + * prevents it from signalling the fence the previous thread is stuck =
waiting
> > + * on::
> > + *
> > + *     lock(A);
> > + *     unlock(A);
> > + *     dma_fence_signal(B);
> > + *
> > + * By manually annotating all code relevant to signalling a &dma_fence=
 we can
> > + * teach lockdep about these dependencies, which also helps with the v=
alidation
> > + * headache since now lockdep can check all the rules for us::
> > + *
> > + *    cookie =3D dma_fence_begin_signalling();
> > + *    lock(A);
> > + *    unlock(A);
> > + *    dma_fence_signal(B);
> > + *    dma_fence_end_signalling(cookie);
> > + *
> > + * For using dma_fence_begin_signalling() and dma_fence_end_signalling=
() to
> > + * annotate critical sections the following rules need to be observed:
> > + *
> > + * * All code necessary to complete a &dma_fence must be annotated, fr=
om the
> > + *   point where a fence is accessible to other threads, to the point =
where
> > + *   dma_fence_signal() is called. Un-annotated code can contain deadl=
ock issues,
> > + *   and due to the very strict rules and many corner cases it is infe=
asible to
> > + *   catch these just with review or normal stress testing.
> > + *
> > + * * &struct dma_resv deserves a special note, since the readers are o=
nly
> > + *   protected by rcu. This means the signalling critical section star=
ts as soon
> > + *   as the new fences are installed, even before dma_resv_unlock() is=
 called.
> > + *
> > + * * The only exception are fast paths and opportunistic signalling co=
de, which
> > + *   calls dma_fence_signal() purely as an optimization, but is not re=
quired to
> > + *   guarantee completion of a &dma_fence. The usual example is a wait=
 IOCTL
> > + *   which calls dma_fence_signal(), while the mandatory completion pa=
th goes
> > + *   through a hardware interrupt and possible job completion worker.
> > + *
> > + * * To aid composability of code, the annotations can be freely neste=
d, as long
> > + *   as the overall locking hierarchy is consistent. The annotations a=
lso work
> > + *   both in interrupt and process context. Due to implementation deta=
ils this
> > + *   requires that callers pass an opaque cookie from
> > + *   dma_fence_begin_signalling() to dma_fence_end_signalling().
> > + *
> > + * * Validation against the cross driver contract is implemented by pr=
iming
> > + *   lockdep with the relevant hierarchy at boot-up. This means even j=
ust
> > + *   testing with a single device is enough to validate a driver, at l=
east as
> > + *   far as deadlocks with dma_fence_wait() against dma_fence_signal()=
 are
> > + *   concerned.
> > + */
> > +#ifdef CONFIG_LOCKDEP
> > +struct lockdep_map	dma_fence_lockdep_map =3D {
> > +	.name =3D "dma_fence_map"
> > +};
> > +
> > +/**
> > + * dma_fence_begin_signalling - begin a critical DMA fence signalling =
section
> > + *
> > + * Drivers should use this to annotate the beginning of any code secti=
on
> > + * required to eventually complete &dma_fence by calling dma_fence_sig=
nal().
> > + *
> > + * The end of these critical sections are annotated with
> > + * dma_fence_end_signalling().
> > + *
> > + * Returns:
> > + *
> > + * Opaque cookie needed by the implementation, which needs to be passe=
d to
> > + * dma_fence_end_signalling().
> > + */
> > +bool dma_fence_begin_signalling(void)
> > +{
> > +	/* explicitly nesting ... */
> > +	if (lock_is_held_type(&dma_fence_lockdep_map, 1))
> > +		return true;
> > +
> > +	/* rely on might_sleep check for soft/hardirq locks */
> > +	if (in_atomic())
> > +		return true;
> > +
> > +	/* ... and non-recursive readlock */
> > +	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _RET_IP_);
> > +
> > +	return false;
> > +}
> > +EXPORT_SYMBOL(dma_fence_begin_signalling);
> > +
> > +/**
> > + * dma_fence_end_signalling - end a critical DMA fence signalling sect=
ion
> > + *
> > + * Closes a critical section annotation opened by dma_fence_begin_sign=
alling().
> > + */
> > +void dma_fence_end_signalling(bool cookie)
> > +{
> > +	if (cookie)
> > +		return;
> > +
> > +	lock_release(&dma_fence_lockdep_map, _RET_IP_);
> > +}
> > +EXPORT_SYMBOL(dma_fence_end_signalling);
> > +
> > +void __dma_fence_might_wait(void)
> > +{
> > +	bool tmp;
> > +
> > +	tmp =3D lock_is_held_type(&dma_fence_lockdep_map, 1);
> > +	if (tmp)
> > +		lock_release(&dma_fence_lockdep_map, _THIS_IP_);
> > +	lock_map_acquire(&dma_fence_lockdep_map);
> > +	lock_map_release(&dma_fence_lockdep_map);
> > +	if (tmp)
> > +		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _THIS_IP_);
> > +}
> > +#endif
> > +
> > +
> >   /**
> >    * dma_fence_signal_locked - signal completion of a fence
> >    * @fence: the fence to signal
> > @@ -170,14 +324,19 @@ int dma_fence_signal(struct dma_fence *fence)
> >   {
> >   	unsigned long flags;
> >   	int ret;
> > +	bool tmp;
> >   	if (!fence)
> >   		return -EINVAL;
> > +	tmp =3D dma_fence_begin_signalling();
> > +
> >   	spin_lock_irqsave(fence->lock, flags);
> >   	ret =3D dma_fence_signal_locked(fence);
> >   	spin_unlock_irqrestore(fence->lock, flags);
> > +	dma_fence_end_signalling(tmp);
> > +
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL(dma_fence_signal);
> > @@ -210,6 +369,8 @@ dma_fence_wait_timeout(struct dma_fence *fence, boo=
l intr, signed long timeout)
> >   	might_sleep();
> > +	__dma_fence_might_wait();
> > +
> >   	trace_dma_fence_wait_start(fence);
> >   	if (fence->ops->wait)
> >   		ret =3D fence->ops->wait(fence, intr, timeout);
> > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > index 3347c54f3a87..3f288f7db2ef 100644
> > --- a/include/linux/dma-fence.h
> > +++ b/include/linux/dma-fence.h
> > @@ -357,6 +357,18 @@ dma_fence_get_rcu_safe(struct dma_fence __rcu **fe=
ncep)
> >   	} while (1);
> >   }
> > +#ifdef CONFIG_LOCKDEP
> > +bool dma_fence_begin_signalling(void);
> > +void dma_fence_end_signalling(bool cookie);
> > +#else
> > +static inline bool dma_fence_begin_signalling(void)
> > +{
> > +	return true;
> > +}
> > +static inline void dma_fence_end_signalling(bool cookie) {}
> > +static inline void __dma_fence_might_wait(void) {}
> > +#endif
> > +
> >   int dma_fence_signal(struct dma_fence *fence);
> >   int dma_fence_signal_locked(struct dma_fence *fence);
> >   signed long dma_fence_default_wait(struct dma_fence *fence,
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
