Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431BB3EB773
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1066E84E;
	Fri, 13 Aug 2021 15:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9936E84E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 15:12:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so7116910wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5QAxsEtbnvn/hXJqHFZ6oUO86rTKewkZ7v57+dS49I0=;
 b=csxmFj/uOP/YTHGm1kZJjexfrjO260ASkrZ1uUF1fRGTZ157+Gc55B6Rhq9019aUUC
 GOGvP3mpCaxZeZ7StyBkLlNa/jWl9/FAuzOlu9cLpxNzzWl7Nh210bgsVDQFelfGeG/F
 b43DtYGMCLr6AFDLw10LMb02H0NCoyh0tF5uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5QAxsEtbnvn/hXJqHFZ6oUO86rTKewkZ7v57+dS49I0=;
 b=hJDuTMhFwWssdL8Lcja2h6OFlITSvOmHJTqjYw3E/qujyZOWS4QKQmzuWtnCK1k3P4
 rZXEGYD6tCNc8NTUQwNBKVfb3aH2jdKvQv7K7vZrkA2B4en3CbuVfYMpOCiuLiT1rSqG
 P5Y+QNTMeDSa0yH57VIEt+QTBF56cy11I0XAzrHZ1eixrt3HFR9u72+P/sqgFVgSVzrm
 NWVTBgnsjGFqJmfBUv7j/rIiDWuvrUAeVp/DbFUkCt4i1BR/vSqddB7SfsocSzmY2rYr
 x6i1WpVfpl09YU4q6KotPw6XmknNclW3azSEUOA9vYEhRt6mA+Gw0LhgeRDE5QWGDqDZ
 GYKA==
X-Gm-Message-State: AOAM530qXHpy/JGxSzxNtV+LobJ1TWlZD4SSVEby02HPv5SKme2Jh+Qv
 sqoWikLjMM0W0aLt82icvL3JZTRtX8k/Yw==
X-Google-Smtp-Source: ABdhPJxezBZU1lDxCROva8POE4IvHg7Zzv4Fg6yzI76oiSODsggCfbtKrruwHEGBm+qLrFtHDUUS4w==
X-Received: by 2002:a05:600c:26d4:: with SMTP id
 20mr3085947wmv.107.1628867521499; 
 Fri, 13 Aug 2021 08:12:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i21sm1895989wrb.62.2021.08.13.08.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:12:00 -0700 (PDT)
Date: Fri, 13 Aug 2021 17:11:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, gfx-internal-devel@eclists.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/i915/guc: Flush the work queue for GuC generated
 G2H
Message-ID: <YRaLv9VfhCwo7d98@phenom.ffwll.local>
References: <20210811011622.255784-1-matthew.brost@intel.com>
 <20210811011622.255784-6-matthew.brost@intel.com>
 <YRUsEAowykuHCjUM@phenom.ffwll.local>
 <20210812152330.GA480603@DUT151-ICLU.fm.intel.com>
 <YRV6y4vFc2UWE3zp@phenom.ffwll.local>
 <20210812223818.GA649455@DUT151-ICLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812223818.GA649455@DUT151-ICLU.fm.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Thu, Aug 12, 2021 at 10:38:18PM +0000, Matthew Brost wrote:
> On Thu, Aug 12, 2021 at 09:47:23PM +0200, Daniel Vetter wrote:
> > On Thu, Aug 12, 2021 at 03:23:30PM +0000, Matthew Brost wrote:
> > > On Thu, Aug 12, 2021 at 04:11:28PM +0200, Daniel Vetter wrote:
> > > > On Wed, Aug 11, 2021 at 01:16:18AM +0000, Matthew Brost wrote:
> > > > > Flush the work queue for GuC generated G2H messages durinr a GT reset.
> > > > > This is accomplished by spinning on the the list of outstanding G2H to
> > > > > go empty.
> > > > > 
> > > > > Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: <stable@vger.kernel.org>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > index 3cd2da6f5c03..e5eb2df11b4a 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > > @@ -727,6 +727,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> > > > >  			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> > > > >  		} while (!list_empty(&guc->ct.requests.incoming));
> > > > >  	}
> > > > > +
> > > > > +	/* Flush any GuC generated G2H */
> > > > > +	while (!list_empty(&guc->ct.requests.incoming))
> > > > > +		msleep(20);
> > > > 
> > > > flush_work or flush_workqueue, beacuse that comes with lockdep
> > > > annotations. Dont hand-roll stuff like this if at all possible.
> > > 
> > > lockdep puked when used that.
> > 
> > Lockdep tends to be right ... So we definitely want that, but maybe a
> > different flavour, or there's something wrong with the workqueue setup.
> > 
> 
> Here is a dependency chain that lockdep doesn't like.
> 
> fs_reclaim_acquire -> &gt->reset.mutex (shrinker)
> workqueue -> fs_reclaim_acquire (error capture in workqueue)
> &gt->reset.mutex -> workqueue (reset)
> 
> In practice I don't think we couldn't ever hit this but lockdep does
> looks right here. Trying to work out how to fix this. We really need to
> all G2H to done being processed before we proceed during a reset or we
> have races. Have a few ideas of how to handle this but can't convince
> myself any of them are fully safe.

It might be false sharing due to a single workqueue, or a single-threaded
workqueue.

Essentially the lockdep annotations for work_struct track two things:
- dependencies against the specific work item
- dependencies against anything queued on that work queue, if you flush
  the entire queue, or if you flush a work item that's on a
  single-threaded queue.

Because if guc/host communication is inverted like this here, you have a
much bigger problem.

Note that if you pick a different workqueue for your guc work stuff then
you need to make sure that's all properly flushed on suspend and driver
unload.

It might also be that the reset work is on the wrong workqueue.

Either way, this must be fixed, because I've seen too many of these "it
never happens in practice" blow up, plus if your locking scheme is
engineered with quicksand forget about anyone ever understanding it.
-Daniel

> 
> Splat below:
> 
> [  154.625989] ======================================================
> [  154.632195] WARNING: possible circular locking dependency detected
> [  154.638393] 5.14.0-rc5-guc+ #50 Tainted: G     U
> [  154.643991] ------------------------------------------------------
> [  154.650196] i915_selftest/1673 is trying to acquire lock:
> [  154.655621] ffff8881079cb918 ((work_completion)(&ct->requests.worker)){+.+.}-{0:0}, at: __flush_work+0x350/0x4d0
> [  154.665826]
>                but task is already holding lock:
> [  154.671682] ffff8881079cbfb8 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0xf0/0x300 [i915]
> [  154.680659]
>                which lock already depends on the new lock.
> 
> [  154.688857]
>                the existing dependency chain (in reverse order) is:
> [  154.696365]
>                -> #2 (&gt->reset.mutex){+.+.}-{3:3}:
> [  154.702571]        lock_acquire+0xd2/0x300
> [  154.706695]        i915_gem_shrinker_taints_mutex+0x2d/0x50 [i915]
> [  154.712959]        intel_gt_init_reset+0x61/0x80 [i915]
> [  154.718258]        intel_gt_init_early+0xe6/0x120 [i915]
> [  154.723648]        i915_driver_probe+0x592/0xdc0 [i915]
> [  154.728942]        i915_pci_probe+0x43/0x1c0 [i915]
> [  154.733891]        pci_device_probe+0x9b/0x110
> [  154.738362]        really_probe+0x1a6/0x3a0
> [  154.742568]        __driver_probe_device+0xf9/0x170
> [  154.747468]        driver_probe_device+0x19/0x90
> [  154.752114]        __driver_attach+0x99/0x170
> [  154.756492]        bus_for_each_dev+0x73/0xc0
> [  154.760870]        bus_add_driver+0x14b/0x1f0
> [  154.765248]        driver_register+0x67/0xb0
> [  154.769542]        i915_init+0x18/0x8c [i915]
> [  154.773964]        do_one_initcall+0x53/0x2e0
> [  154.778343]        do_init_module+0x56/0x210
> [  154.782639]        load_module+0x25fc/0x29f0
> [  154.786934]        __do_sys_finit_module+0xae/0x110
> [  154.791835]        do_syscall_64+0x38/0xc0
> [  154.795958]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  154.801558]
>                -> #1 (fs_reclaim){+.+.}-{0:0}:
> [  154.807241]        lock_acquire+0xd2/0x300
> [  154.811361]        fs_reclaim_acquire+0x9e/0xd0
> [  154.815914]        kmem_cache_alloc_trace+0x30/0x790
> [  154.820899]        i915_gpu_coredump_alloc+0x53/0x1a0 [i915]
> [  154.826649]        i915_gpu_coredump+0x39/0x560 [i915]
> [  154.831866]        i915_capture_error_state+0xa/0x70 [i915]
> [  154.837513]        intel_guc_context_reset_process_msg+0x174/0x1f0 [i915]
> [  154.844383]        ct_incoming_request_worker_func+0x130/0x1b0 [i915]
> [  154.850898]        process_one_work+0x264/0x590
> [  154.855451]        worker_thread+0x4b/0x3a0
> [  154.859655]        kthread+0x147/0x170
> [  154.863428]        ret_from_fork+0x1f/0x30
> [  154.867548]
>                -> #0 ((work_completion)(&ct->requests.worker)){+.+.}-{0:0}:
> [  154.875747]        check_prev_add+0x90/0xc30
> [  154.880042]        __lock_acquire+0x1643/0x2110
> [  154.884595]        lock_acquire+0xd2/0x300
> [  154.888715]        __flush_work+0x373/0x4d0
> [  154.892920]        intel_guc_submission_reset_prepare+0xf3/0x340 [i915]
> [  154.899606]        intel_uc_reset_prepare+0x40/0x50 [i915]
> [  154.905166]        reset_prepare+0x55/0x60 [i915]
> [  154.909946]        intel_gt_reset+0x11c/0x300 [i915]
> [  154.914984]        do_device_reset+0x13/0x20 [i915]
> [  154.919936]        check_whitelist_across_reset+0x166/0x250 [i915]
> [  154.926212]        live_reset_whitelist.cold+0x6a/0x7a [i915]
> [  154.932037]        __i915_subtests.cold+0x20/0x74 [i915]
> [  154.937428]        __run_selftests.cold+0x96/0xee [i915]
> [  154.942816]        i915_live_selftests+0x2c/0x60 [i915]
> [  154.948125]        i915_pci_probe+0x93/0x1c0 [i915]
> [  154.953076]        pci_device_probe+0x9b/0x110
> [  154.957545]        really_probe+0x1a6/0x3a0
> [  154.961749]        __driver_probe_device+0xf9/0x170
> [  154.966653]        driver_probe_device+0x19/0x90
> [  154.971290]        __driver_attach+0x99/0x170
> [  154.975671]        bus_for_each_dev+0x73/0xc0
> [  154.980053]        bus_add_driver+0x14b/0x1f0
> [  154.984431]        driver_register+0x67/0xb0
> [  154.988725]        i915_init+0x18/0x8c [i915]
> [  154.993149]        do_one_initcall+0x53/0x2e0
> [  154.997527]        do_init_module+0x56/0x210
> [  155.001822]        load_module+0x25fc/0x29f0
> [  155.006118]        __do_sys_finit_module+0xae/0x110
> [  155.011019]        do_syscall_64+0x38/0xc0
> [  155.015139]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  155.020729]
>                other info that might help us debug this:
> 
> [  155.028752] Chain exists of:
>                  (work_completion)(&ct->requests.worker) --> fs_reclaim --> &gt->reset.mutex
> 
> [  155.041294]  Possible unsafe locking scenario:
> 
> [  155.047240]        CPU0                    CPU1
> [  155.051791]        ----                    ----
> [  155.056344]   lock(&gt->reset.mutex);
> [  155.060026]                                lock(fs_reclaim);
> [  155.065706]                                lock(&gt->reset.mutex);
> [  155.071912]   lock((work_completion)(&ct->requests.worker));
> [  155.077595]
>                 *** DEADLOCK ***
> 
> [  155.083534] 2 locks held by i915_selftest/1673:
> [  155.088086]  #0: ffff888103851240 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x8e/0x170
> [  155.096460]  #1: ffff8881079cbfb8 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0xf0/0x300 [i915]
> [  155.105845]
>                stack backtrace:
> [  155.110223] CPU: 6 PID: 1673 Comm: i915_selftest Tainted: G     U            5.14.0-rc5-guc+ #50
> [  155.119035] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U LPDDR4/4x T4 RVP, BIOS TGLSFWI1.R00.3425.A00.2010162309 10/16/2020
> [  155.132530] Call Trace:
> [  155.134999]  dump_stack_lvl+0x57/0x7d
> [  155.138690]  check_noncircular+0x12d/0x150
> [  155.142814]  check_prev_add+0x90/0xc30
> [  155.146587]  __lock_acquire+0x1643/0x2110
> [  155.150618]  lock_acquire+0xd2/0x300
> [  155.154218]  ? __flush_work+0x350/0x4d0
> [  155.158073]  ? __lock_acquire+0x5f3/0x2110
> [  155.162194]  __flush_work+0x373/0x4d0
> [  155.165883]  ? __flush_work+0x350/0x4d0
> [  155.169739]  ? mark_held_locks+0x49/0x70
> [  155.173686]  ? _raw_spin_unlock_irqrestore+0x50/0x70
> [  155.178679]  intel_guc_submission_reset_prepare+0xf3/0x340 [i915]
> [  155.184857]  ? _raw_spin_unlock_irqrestore+0x50/0x70
> [  155.189843]  intel_uc_reset_prepare+0x40/0x50 [i915]
> [  155.194891]  reset_prepare+0x55/0x60 [i915]
> [  155.199145]  intel_gt_reset+0x11c/0x300 [i915]
> [  155.203657]  ? _raw_spin_unlock_irqrestore+0x3d/0x70
> [  155.208641]  ? do_engine_reset+0x10/0x10 [i915]
> [  155.213243]  do_device_reset+0x13/0x20 [i915]
> [  155.217664]  check_whitelist_across_reset+0x166/0x250 [i915]
> [  155.223415]  live_reset_whitelist.cold+0x6a/0x7a [i915]
> [  155.228725]  __i915_subtests.cold+0x20/0x74 [i915]
> [  155.233593]  ? __i915_live_teardown+0x50/0x50 [i915]
> [  155.238644]  ? __intel_gt_live_setup+0x30/0x30 [i915]
> [  155.243773]  __run_selftests.cold+0x96/0xee [i915]
> [  155.248646]  i915_live_selftests+0x2c/0x60 [i915]
> [  155.253425]  i915_pci_probe+0x93/0x1c0 [i915]
> [  155.257854]  ? _raw_spin_unlock_irqrestore+0x3d/0x70
> [  155.262839]  pci_device_probe+0x9b/0x110
> [  155.266785]  really_probe+0x1a6/0x3a0
> [  155.270467]  __driver_probe_device+0xf9/0x170
> [  155.274846]  driver_probe_device+0x19/0x90
> [  155.278968]  __driver_attach+0x99/0x170
> [  155.282824]  ? __device_attach_driver+0xd0/0xd0
> [  155.287376]  ? __device_attach_driver+0xd0/0xd0
> [  155.291928]  bus_for_each_dev+0x73/0xc0
> [  155.295792]  bus_add_driver+0x14b/0x1f0
> [  155.299648]  driver_register+0x67/0xb0
> [  155.303419]  i915_init+0x18/0x8c [i915]
> [  155.307328]  ? 0xffffffffa0188000
> [  155.310669]  do_one_initcall+0x53/0x2e0
> [  155.314525]  ? rcu_read_lock_sched_held+0x4d/0x80
> [  155.319253]  ? kmem_cache_alloc_trace+0x5ad/0x790
> [  155.323982]  do_init_module+0x56/0x210
> [  155.327754]  load_module+0x25fc/0x29f0
> [  155.331528]  ? __do_sys_finit_module+0xae/0x110
> [  155.336081]  __do_sys_finit_module+0xae/0x110
> [  155.340462]  do_syscall_64+0x38/0xc0
> [  155.344060]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  155.349137] RIP: 0033:0x7efc4496389d
> [  155.352735] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 f5 0c 00 f7 d8 64 89 01 48
> [  155.371530] RSP: 002b:00007ffeb3e23218 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [  155.379123] RAX: ffffffffffffffda RBX: 0000557664b72240 RCX: 00007efc4496389d
> [  155.386282] RDX: 0000000000000000 RSI: 0000557664b69610 RDI: 0000000000000004
> [  155.393443] RBP: 0000000000000020 R08: 00007ffeb3e21ff0 R09: 0000557664b682f0
> [  155.400603] R10: 00007ffeb3e23360 R11: 0000000000000246 R12: 0000557664b69610
> [  155.407761] R13: 0000000000000000 R14: 0000557664b6ada0 R15: 0000557664b72240
> 
> > This is the major reason why inventing any wheels locally in the kernel
> > isn't a good idea - aside from the duplicated code because likely there is
> > a solution for whatever you need. There's all the validation tools,
> > careful thought about semantics (especially around races) and all that
> > stuff that you're always missing on your hand-rolled thing. Aside from
> > anything hand-rolled is much harder to read, since intent isn't clear.
> > -Daniel
> > 
> > 
> > > 
> > > Matt
> > > 
> > > > -Daniel
> > > > 
> > > > > +
> > > > >  	scrub_guc_desc_for_outstanding_g2h(guc);
> > > > >  }
> > > > >  
> > > > > -- 
> > > > > 2.32.0
> > > > > 
> > > > 
> > > > -- 
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
