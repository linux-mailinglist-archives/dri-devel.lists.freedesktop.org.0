Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD831EE16
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 19:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799916EA4D;
	Thu, 18 Feb 2021 18:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135C86E85D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 18:20:18 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id d7so2732802otq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 10:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LW+cagykFz5iFb8nPiRjIJQmpRhv783iN/e7t4nWZ/U=;
 b=iD3hAEkUTgOnjZkNjWHuZJusIXwTmOK8t9sY4PPhEV8I8zjPKof8u9GT+a21Sjf5eS
 rpOZ+qj7kgn7qwALyDSnjzknbE7Gg4MtXdwmIXxkPdhRP8oQ30qmPOnSJoUfuF5mSC6R
 iENFROo52n5qfJEkBpRSGIQgkQYDbA+hpUTRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LW+cagykFz5iFb8nPiRjIJQmpRhv783iN/e7t4nWZ/U=;
 b=pVsx8rNVPPQw0gB+xTUXhHB49jRxhnkxYEzYZ/3e8pNiqnf48eBie18XysPl1xYK4e
 uHLzwfljps8YuIK2ahqHaO+bb5+z6dVqkPsQME8GhnHxPU/pfvkHt7rZWggFsngI38O9
 iU9wyGBVT47tS3VSn2kUu7mLCYZyCCoI0+EqYLV3mLsJdgXOXbCfa33F2BCWypnmHlNn
 Omvn+E9NtvpDtcRhYX6dG1ElorpDWEW/vPl1j3aE+Z5HY6Z/fFelJv0UbabKyGbyG5Lr
 yXhrd71HX7sEsQDiX2oOWf7TYIHc4PshFND+DaCNx7qLhj3XrMD5a83Szn8jkpFg961j
 808A==
X-Gm-Message-State: AOAM530tIncgnGA8O0bT4lahRD5ds5cQECLfZR3KUK73fDoSwpXVI8W6
 zAcwCnOLVk9vaf/xJnJeoxCVNmoZrYaroXXXUkFITQ==
X-Google-Smtp-Source: ABdhPJxk8tjAAQip+qcm0gwts/MMhCZPt/GCRuznpHu7m1KX6jQRroQKimeOXmSvfgFLkLnsDpwc43npQi4KTDmUDcg=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr3894045ota.188.1613672417314; 
 Thu, 18 Feb 2021 10:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20210217165910.3820374-1-nroberts@igalia.com>
 <7f80b184-7277-0f6c-1108-cf41189626df@arm.com>
 <CAKMK7uHPk1G-S6EMRZ8grZU8W6iij_DJR+V2eBGP+79Te6k76A@mail.gmail.com>
 <20210218154538.GA1483@kevin> <bddce2d0-8f93-9263-0185-97fc848ddda6@arm.com>
 <CAL_JsqJ1Q+yRTY7+RduWSK4ZWO4v8Dq02xwNdNpNY0uD402M-g@mail.gmail.com>
 <456aaf72-50ed-f482-d6e1-e131143aa835@arm.com>
 <CAL_Jsq+aYmmz6+RHzSNmaMQqJgkBGk6+7SyrnHQ9uASdcEU3uA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+aYmmz6+RHzSNmaMQqJgkBGk6+7SyrnHQ9uASdcEU3uA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 18 Feb 2021 19:20:06 +0100
Message-ID: <CAKMK7uF_qAL4fhuz-_itvS6BY2ziOnjkyjc-hrXKWmK7Q9ZE6w@mail.gmail.com>
Subject: Re: [PATCH] drm/shmem-helper: Don't remove the offset in
 vm_area_struct pgoff
To: Rob Herring <robh+dt@kernel.org>
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
Cc: Neil Roberts <nroberts@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 18, 2021 at 6:16 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Feb 18, 2021 at 10:51 AM Steven Price <steven.price@arm.com> wrote:
> >
> > On 18/02/2021 16:38, Rob Herring wrote:
> > > On Thu, Feb 18, 2021 at 10:15 AM Steven Price <steven.price@arm.com> wrote:
> > >>
> > >> On 18/02/2021 15:45, Alyssa Rosenzweig wrote:
> > >>>> Yeah plus Cc: stable for backporting and I think an igt or similar for
> > >>>> panfrost to check this works correctly would be pretty good too. Since
> > >>>> if it took us over 1 year to notice this bug it's pretty clear that
> > >>>> normal testing doesn't catch this. So very likely we'll break this
> > >>>> again.
> > >>>
> > >>> Unfortunately there are a lot of kernel bugs which are noticed during actual
> > >>> use (but not CI runs), some of which have never been fixed. I do know
> > >>> the shrinker impl is buggy for us, if this is the fix I'm very happy.
> > >>
> > >> I doubt this will actually "fix" anything - if I understand correctly
> > >> then the sequence which is broken is:
> > >>
> > >>    * allocate BO, mmap to CPU
> > >>    * madvise(DONTNEED)
> > >>    * trigger purge
> > >>    * try to access the BO memory
> > >>
> > >> which is an invalid sequence for user space - the attempt to access
> > >> memory should cause a SIGSEGV. However because drm_vma_node_unmap() is
> > >> unable to find the mappings there may still be page table entries
> > >> present which would provide access to memory the kernel has freed. Which
> > >> is of course a big security hole and so this fix is needed.
> > >>
> > >> In what way do you find the shrinker impl buggy? I'm aware there's some
> > >> dodgy locking (although I haven't worked out how to fix it) - but AFAICT
> > >> it's more deadlock territory rather than lacking in locks. Are there
> > >> correctness issues?
> > >
> > > What's there was largely a result of getting lockdep happy.
> > >
> > >>>> btw for testing shrinkers recommended way is to have a debugfs file
> > >>>> that just force-shrinks everything. That way you avoid all the trouble
> > >>>> that tend to happen when you drive a system close to OOM on linux, and
> > >>>> it's also much faster.
> > >>>
> > >>> 2nding this as a good idea.
> > >>>
> > >>
> > >> Sounds like a good idea to me too. But equally I'm wondering whether the
> > >> best (short term) solution is to actually disable the shrinker. I'm
> > >> somewhat surprised that nobody has got fed up with the "Purging xxx
> > >> bytes" message spam - which makes me think that most people are not
> > >> hitting memory pressure to trigger the shrinker.
> > >
> > > If the shrinker is dodgy, then it's probably good to have the messages
> > > to know if it ran.
> > >
> > >> The shrinker on kbase caused a lot of grief - and the only way I managed
> > >> to get that under control was by writing a static analysis tool for the
> > >> locking, and by upsetting people by enforcing the (rather dumb) rules of
> > >> the tool on the code base. I've been meaning to look at whether sparse
> > >> can do a similar check of locks.
> > >
> > > Lockdep doesn't cover it?
> >
> > Short answer: no ;)

It's pretty good actually, if you correctly annotate things up.

> > The problem with lockdep is that you have to trigger the locking
> > scenario to get a warning out of it. For example you obviously won't get
> > any warnings about the shrinker without triggering the shrinker (which
> > means memory pressure since we don't have the debugfs file to trigger it).
>
> Actually, you don't need debugfs. Writing to /proc/sys/vm/drop_caches
> will do it. Though maybe there's other code path scenarios that
> wouldn't cover.

Huh didn't know, but it's a bit a shotgun, plus it doesn't use
fs_reclaim shrinker annotations, which means you don't have lockdep
checks. I think at least, would need some deadlock and testing.
>
>
> > I have to admit I'm not 100% sure I've seen any lockdep warnings based
> > on buffer objects recently. I can trigger them based on jobs:
> >
> > -----8<------
> > [  265.764474] ======================================================
> > [  265.771380] WARNING: possible circular locking dependency detected
> > [  265.778294] 5.11.0-rc2+ #22 Tainted: G        W
> > [  265.784148] ------------------------------------------------------
> > [  265.791050] kworker/0:3/90 is trying to acquire lock:
> > [  265.796694] c0d982b0 (fs_reclaim){+.+.}-{0:0}, at: __fs_reclaim_acquire+0x0/0x38
> > [  265.804994]
> > [  265.804994] but task is already holding lock:
> > [  265.811513] c49a348c (&js->queue[j].lock){+.+.}-{3:3}, at: panfrost_reset+0x124/0x1cc [panfrost]
> > [  265.821375]
> > [  265.821375] which lock already depends on the new lock.
> > [  265.821375]
> > [  265.830524]
> > [  265.830524] the existing dependency chain (in reverse order) is:
> > [  265.838892]
> > [  265.838892] -> #2 (&js->queue[j].lock){+.+.}-{3:3}:
> > [  265.845996]        mutex_lock_nested+0x18/0x20
> > [  265.850961]        panfrost_scheduler_stop+0x1c/0x94 [panfrost]
> > [  265.857590]        panfrost_reset+0x54/0x1cc [panfrost]
> > [  265.863441]        process_one_work+0x238/0x51c
> > [  265.868503]        worker_thread+0x22c/0x2e0
> > [  265.873270]        kthread+0x128/0x138
> > [  265.877455]        ret_from_fork+0x14/0x38
> > [  265.882028]        0x0
> > [  265.884657]
> > [  265.884657] -> #1 (dma_fence_map){++++}-{0:0}:
> > [  265.891277]        dma_resv_lockdep+0x1b4/0x290
> > [  265.896339]        do_one_initcall+0x5c/0x2e8
> > [  265.901206]        kernel_init_freeable+0x184/0x1d4
> > [  265.906651]        kernel_init+0x8/0x11c
> > [  265.911029]        ret_from_fork+0x14/0x38
> > [  265.915610]        0x0
> > [  265.918247]
> > [  265.918247] -> #0 (fs_reclaim){+.+.}-{0:0}:
> > [  265.924579]        lock_acquire+0x3a4/0x45c
> > [  265.929260]        __fs_reclaim_acquire+0x28/0x38
> > [  265.934523]        slab_pre_alloc_hook.constprop.28+0x1c/0x64
> > [  265.940948]        kmem_cache_alloc_trace+0x38/0x114
> > [  265.946493]        panfrost_job_run+0x60/0x2b4 [panfrost]
> > [  265.952540]        drm_sched_resubmit_jobs+0x88/0xc4 [gpu_sched]
> > [  265.959256]        panfrost_reset+0x174/0x1cc [panfrost]
> > [  265.965196]        process_one_work+0x238/0x51c
> > [  265.970259]        worker_thread+0x22c/0x2e0
> > [  265.975025]        kthread+0x128/0x138
> > [  265.979210]        ret_from_fork+0x14/0x38
> > [  265.983784]        0x0
> > [  265.986412]
> > [  265.986412] other info that might help us debug this:
> > [  265.986412]
> > [  265.995353] Chain exists of:
> > [  265.995353]   fs_reclaim --> dma_fence_map --> &js->queue[j].lock
> > [  265.995353]
> > [  266.007028]  Possible unsafe locking scenario:
> > [  266.007028]
> > [  266.013638]        CPU0                    CPU1
> > [  266.018694]        ----                    ----
> > [  266.023750]   lock(&js->queue[j].lock);
> > [  266.028033]                                lock(dma_fence_map);
> > [  266.034648]                                lock(&js->queue[j].lock);
> > [  266.041746]   lock(fs_reclaim);
> > [  266.045252]
> > [  266.045252]  *** DEADLOCK ***
> > [  266.045252]
> > [  266.051861] 4 locks held by kworker/0:3/90:
> > [  266.056530]  #0: c18096a8 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x18c/0x51c
> > [  266.066258]  #1: c46d5f28 ((work_completion)(&pfdev->reset.work)){+.+.}-{0:0}, at: process_one_work+0x18c/0x51c
> > [  266.077546]  #2: c0dfc5a0 (dma_fence_map){++++}-{0:0}, at: panfrost_reset+0x10/0x1cc [panfrost]
> > [  266.087294]  #3: c49a348c (&js->queue[j].lock){+.+.}-{3:3}, at: panfrost_reset+0x124/0x1cc [panfrost]
> > [  266.097624]
> > [  266.097624] stack backtrace:
> > [  266.102487] CPU: 0 PID: 90 Comm: kworker/0:3 Tainted: G        W         5.11.0-rc2+ #22
> > [  266.111529] Hardware name: Rockchip (Device Tree)
> > [  266.116773] Workqueue: events panfrost_reset [panfrost]
> > [  266.122628] [<c010f0c0>] (unwind_backtrace) from [<c010ad38>] (show_stack+0x10/0x14)
> > [  266.131288] [<c010ad38>] (show_stack) from [<c07c3c28>] (dump_stack+0xa4/0xd0)
> > [  266.139363] [<c07c3c28>] (dump_stack) from [<c0168760>] (check_noncircular+0x6c/0x90)
> > [  266.148116] [<c0168760>] (check_noncircular) from [<c016a2c0>] (__lock_acquire+0xe90/0x16a0)
> > [  266.157549] [<c016a2c0>] (__lock_acquire) from [<c016b5f8>] (lock_acquire+0x3a4/0x45c)
> > [  266.166399] [<c016b5f8>] (lock_acquire) from [<c0247b98>] (__fs_reclaim_acquire+0x28/0x38)
> > [  266.175637] [<c0247b98>] (__fs_reclaim_acquire) from [<c025445c>] (slab_pre_alloc_hook.constprop.28+0x1c/0x64)
> > [  266.186820] [<c025445c>] (slab_pre_alloc_hook.constprop.28) from [<c0255714>] (kmem_cache_alloc_trace+0x38/0x114)
> > [  266.198292] [<c0255714>] (kmem_cache_alloc_trace) from [<bf00d28c>] (panfrost_job_run+0x60/0x2b4 [panfrost])
> > [  266.209295] [<bf00d28c>] (panfrost_job_run [panfrost]) from [<bf00102c>] (drm_sched_resubmit_jobs+0x88/0xc4 [gpu_sched])
> > [  266.221476] [<bf00102c>] (drm_sched_resubmit_jobs [gpu_sched]) from [<bf00d0a0>] (panfrost_reset+0x174/0x1cc [panfrost])
> > [  266.233649] [<bf00d0a0>] (panfrost_reset [panfrost]) from [<c0139fd4>] (process_one_work+0x238/0x51c)
> > [  266.243974] [<c0139fd4>] (process_one_work) from [<c013aaa0>] (worker_thread+0x22c/0x2e0)
> > [  266.253115] [<c013aaa0>] (worker_thread) from [<c013fd64>] (kthread+0x128/0x138)
> > [  266.261382] [<c013fd64>] (kthread) from [<c010011c>] (ret_from_fork+0x14/0x38)
> > [  266.269456] Exception stack(0xc46d5fb0 to 0xc46d5ff8)
> > [  266.275098] 5fa0:                                     00000000 00000000 00000000 00000000
> > [  266.284236] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  266.293373] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > -----8<------
> >
> > And indeed a sleeping in atomic bug:
> > -----8<-----
> > [  289.672380] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:935
> > [  289.681210] rockchip-vop ff930000.vop: [drm:vop_crtc_atomic_flush] *ERROR* VOP vblank IRQ stuck for 10 ms
> > [  289.681880] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 31, name: kworker/0:1
> > [  289.701901] INFO: lockdep is turned off.
> > [  289.706339] irq event stamp: 9414
> > [  289.710095] hardirqs last  enabled at (9413): [<c07cd1cc>] _raw_spin_unlock_irq+0x20/0x40
> > [  289.719381] hardirqs last disabled at (9414): [<c07c9140>] __schedule+0x170/0x698
> > [  289.727855] softirqs last  enabled at (9112): [<c077379c>] reg_todo+0x64/0x51c
> > [  289.736044] softirqs last disabled at (9110): [<c077377c>] reg_todo+0x44/0x51c
> > [  289.744233] CPU: 0 PID: 31 Comm: kworker/0:1 Tainted: G        W         5.11.0-rc2+ #22
> > [  289.753375] Hardware name: Rockchip (Device Tree)
> > [  289.758711] Workqueue: events panfrost_reset [panfrost]
> > [  289.764886] [<c010f0c0>] (unwind_backtrace) from [<c010ad38>] (show_stack+0x10/0x14)
> > [  289.773721] [<c010ad38>] (show_stack) from [<c07c3c28>] (dump_stack+0xa4/0xd0)
> > [  289.781948] [<c07c3c28>] (dump_stack) from [<c01490f8>] (___might_sleep+0x1bc/0x244)
> > [  289.790761] [<c01490f8>] (___might_sleep) from [<c07ca720>] (__mutex_lock+0x34/0x3c4)
> > [  289.799654] [<c07ca720>] (__mutex_lock) from [<c07caac8>] (mutex_lock_nested+0x18/0x20)
> > [  289.808732] [<c07caac8>] (mutex_lock_nested) from [<bf00b704>] (panfrost_gem_free_object+0x20/0x100 [panfrost])
> > [  289.820358] [<bf00b704>] (panfrost_gem_free_object [panfrost]) from [<bf00ccb0>] (kref_put+0x38/0x5c [panfrost])
> > [  289.832247] [<bf00ccb0>] (kref_put [panfrost]) from [<bf00ce0c>] (panfrost_job_cleanup+0x120/0x140 [panfrost])
> > [  289.843936] [<bf00ce0c>] (panfrost_job_cleanup [panfrost]) from [<bf00ccb0>] (kref_put+0x38/0x5c [panfrost])
> > [  289.855435] [<bf00ccb0>] (kref_put [panfrost]) from [<c054acb8>] (dma_fence_signal_timestamp_locked+0x1c0/0x1f8)
> > [  289.867163] [<c054acb8>] (dma_fence_signal_timestamp_locked) from [<c054b1f8>] (dma_fence_signal+0x38/0x58)
> > [  289.878207] [<c054b1f8>] (dma_fence_signal) from [<bf001388>] (drm_sched_job_done+0x58/0x148 [gpu_sched])
> > [  289.889237] [<bf001388>] (drm_sched_job_done [gpu_sched]) from [<bf001524>] (drm_sched_start+0xa4/0xd0 [gpu_sched])
> > [  289.901389] [<bf001524>] (drm_sched_start [gpu_sched]) from [<bf00d0ac>] (panfrost_reset+0x180/0x1cc [panfrost])
> > [  289.913286] [<bf00d0ac>] (panfrost_reset [panfrost]) from [<c0139fd4>] (process_one_work+0x238/0x51c)
> > [  289.923970] [<c0139fd4>] (process_one_work) from [<c013aaa0>] (worker_thread+0x22c/0x2e0)
> > [  289.933257] [<c013aaa0>] (worker_thread) from [<c013fd64>] (kthread+0x128/0x138)
> > [  289.941661] [<c013fd64>] (kthread) from [<c010011c>] (ret_from_fork+0x14/0x38)
> > [  289.949867] Exception stack(0xc2243fb0 to 0xc2243ff8)
> > [  289.955604] 3fa0:                                     00000000 00000000 00000000 00000000
> > [  289.964840] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > [  289.974066] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > -----8<----
> >
> > Certainly here the mutex causing the problem is the shrinker_lock!
> >
> > The above is triggered by chucking a whole ton of jobs which
> > fault at the GPU.
> >
> > Sadly I haven't found time to work out how to untangle the locks.
>
> They are tricky because pretty much any memory allocation can trigger
> things as I recall.

The above should only be possible with my dma_fence annotations, and
yes the point to bugs in the drm/scheduler. They shouldn't matter for
panfrost, and those patches aren't in upstream yet.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
