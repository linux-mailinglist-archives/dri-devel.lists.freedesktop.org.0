Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D90197CF0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 15:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE916E15A;
	Mon, 30 Mar 2020 13:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772736E15A;
 Mon, 30 Mar 2020 13:31:00 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38D5E20716;
 Mon, 30 Mar 2020 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585575060;
 bh=qSfFw4Xt6kcV5uLecfdNYj4mpU1Cl5FKqVHHOIVmkPY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Q9HcMfLecFcko618lmMeqPiJEzubwJ5u1Ip9reIi2mnZqgzVRMJaX2TNq65jD7Uzk
 91bigtJdPi+s48g83dv16HPxcg/D++utxWRP6/E0kgB5tIa8zTJxcBxS3FvNJtbXRY
 KI3iTHxlNifbgQ0WIqlzhPtdUzwwROHTBhEsprZY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 01D8835226F8; Mon, 30 Mar 2020 06:30:59 -0700 (PDT)
Date: Mon, 30 Mar 2020 06:30:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: rcu_barrier() no longer allowed within mmap_sem?
Message-ID: <20200330133059.GH19865@paulmck-ThinkPad-P72>
References: <CAKMK7uGQ49JGetk3-VmHxXR0HVEoQgVxSZvX9Z0b5so8y+13cA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGQ49JGetk3-VmHxXR0HVEoQgVxSZvX9Z0b5so8y+13cA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Namhyung Kim <namhyung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jiri Olsa <jolsa@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 03:00:35PM +0200, Daniel Vetter wrote:
> Hi all, for all = rcu, cpuhotplug and perf maintainers
> 
> We've hit an interesting new lockdep splat in our drm/i915 CI:
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_17096/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-gtt.html#dmesg-warnings861
> 
> Summarizing away the driver parts we have
> 
> < gpu locks which are held within mm->mmap_sem in various gpu fault handlers >
> 
> -> #4 (&mm->mmap_sem#2){++++}:
> <4> [604.892615] __might_fault+0x63/0x90
> <4> [604.892617] _copy_to_user+0x1e/0x80
> <4> [604.892619] perf_read+0x200/0x2b0
> <4> [604.892621] vfs_read+0x96/0x160
> <4> [604.892622] ksys_read+0x9f/0xe0
> <4> [604.892623] do_syscall_64+0x4f/0x220
> <4> [604.892624] entry_SYSCALL_64_after_hwframe+0x49/0xbe
> <4> [604.892625]
> -> #3 (&cpuctx_mutex){+.+.}:
> <4> [604.892626] __mutex_lock+0x9a/0x9c0
> <4> [604.892627] perf_event_init_cpu+0xa4/0x140
> <4> [604.892629] perf_event_init+0x19d/0x1cd
> <4> [604.892630] start_kernel+0x362/0x4e4
> <4> [604.892631] secondary_startup_64+0xa4/0xb0
> <4> [604.892631]
> -> #2 (pmus_lock){+.+.}:
> <4> [604.892633] __mutex_lock+0x9a/0x9c0
> <4> [604.892633] perf_event_init_cpu+0x6b/0x140
> <4> [604.892635] cpuhp_invoke_callback+0x9b/0x9d0
> <4> [604.892636] _cpu_up+0xa2/0x140
> <4> [604.892637] do_cpu_up+0x61/0xa0
> <4> [604.892639] smp_init+0x57/0x96
> <4> [604.892639] kernel_init_freeable+0x87/0x1dc
> <4> [604.892640] kernel_init+0x5/0x100
> <4> [604.892642] ret_from_fork+0x24/0x50
> <4> [604.892642]
> -> #1 (cpu_hotplug_lock.rw_sem){++++}:
> <4> [604.892643] cpus_read_lock+0x34/0xd0
> <4> [604.892644] rcu_barrier+0xaa/0x190
> <4> [604.892645] kernel_init+0x21/0x100
> <4> [604.892647] ret_from_fork+0x24/0x50
> <4> [604.892647]
> -> #0 (rcu_state.barrier_mutex){+.+.}:
> <4> [604.892649] __lock_acquire+0x1328/0x15d0
> <4> [604.892650] lock_acquire+0xa7/0x1c0
> <4> [604.892651] __mutex_lock+0x9a/0x9c0
> <4> [604.892652] rcu_barrier+0x23/0x190
> <4> [604.892680] i915_gem_object_unbind+0x29d/0x3f0 [i915]
> <4> [604.892707] i915_gem_object_pin_to_display_plane+0x141/0x270 [i915]
> <4> [604.892737] intel_pin_and_fence_fb_obj+0xec/0x1f0 [i915]
> <4> [604.892767] intel_plane_pin_fb+0x3f/0xd0 [i915]
> <4> [604.892797] intel_prepare_plane_fb+0x13b/0x5c0 [i915]
> <4> [604.892798] drm_atomic_helper_prepare_planes+0x85/0x110
> <4> [604.892827] intel_atomic_commit+0xda/0x390 [i915]
> <4> [604.892828] drm_atomic_helper_set_config+0x57/0xa0
> <4> [604.892830] drm_mode_setcrtc+0x1c4/0x720
> <4> [604.892830] drm_ioctl_kernel+0xb0/0xf0
> <4> [604.892831] drm_ioctl+0x2e1/0x390
> <4> [604.892833] ksys_ioctl+0x7b/0x90
> <4> [604.892835] __x64_sys_ioctl+0x11/0x20
> <4> [604.892835] do_syscall_64+0x4f/0x220
> <4> [604.892836] entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> The last backtrace boils down to i915 driver code which holds the same
> locks we are holding within mm->mmap_sem, and then ends up calling
> rcu_barrier(). From what I can see i915 is just the messenger here,
> any driver with this pattern of a lock held within mmap_sem which also
> has a path of calling rcu_barrier while holding that lock should be
> hitting this splat.
> 
> Two questions:
> - This suggests that calling rcu_barrier() isn't ok anymore while
> holding mmap_sem, or anything that has a dependency upon mmap_sem. I
> guess that's not the idea, please confirm.
> - Assuming this depedency is indeed not intended, where should the
> loop be broken? It goes through perf, cpuhotplug and rcu subsystems,
> and I don't have a clue about any of those.

Indeed, rcu_barrier() excludes CPU hotplug in order to eliminate a number
of interesting races.

Am I interpreting the above trace correctly in thinking that the various
calls to cpus_read_lock() are with mmap_sem held?  If so, can the calls
to rcu_barrier() be moved out from under the regions of code protected
by cpus_read_lock()?  Invoking rcu_barrier() with cpus_read_lock() held
is an immediate self-deadlock.

Or is rcu_barrier() somehow indirectly sometimes acquiring mmap_sem
or pmus_lock?  (Not seeing it myself, but...)

							Thanx, Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
