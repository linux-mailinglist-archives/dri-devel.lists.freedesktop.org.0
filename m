Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D56197DB6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 15:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6AA6E395;
	Mon, 30 Mar 2020 13:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D3A6E0A2;
 Mon, 30 Mar 2020 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iKhZXgftDGmAxrAyzuUZ0II6kxBjrrnhDkeJI23ZPuk=; b=stkTU0XaBsPQ9gLT7F1OSv2r8T
 MwO0gEyYbNpZAldaghGnbpyLa7yWgs5GToM7+yFda4Nm5jczSvC1dLaCWJ9hyX5HGBJ7BSbhWBffa
 2UIFyJh4tZfRvUnqcIz8IAHdE9Cu9oIueK1va8cLUF93rW9GfeCdxfRQuwgNL/FQHa+yKLl+GmQyA
 0j+WyTHLHUomuxzkGgtwuHTFlyTvJQ+CENI/7nE5TUgrIKDZIO8nv98sbo+vT9KF3H2Zjz8hytsN5
 XlI8vBqpHIToFb+IB9gvKOewYpOwg8uXg3d/l/KWmNCY5Y7p0ouXzsXxKHQU4ncV02vWT9kFnV30h
 hZDk5WtQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIuvn-0005Lc-JC; Mon, 30 Mar 2020 13:58:23 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 43936300F28;
 Mon, 30 Mar 2020 15:58:19 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0A4CD2038CEED; Mon, 30 Mar 2020 15:58:19 +0200 (CEST)
Date: Mon, 30 Mar 2020 15:58:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: rcu_barrier() no longer allowed within mmap_sem?
Message-ID: <20200330135818.GO20696@hirez.programming.kicks-ass.net>
References: <CAKMK7uGQ49JGetk3-VmHxXR0HVEoQgVxSZvX9Z0b5so8y+13cA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGQ49JGetk3-VmHxXR0HVEoQgVxSZvX9Z0b5so8y+13cA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
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

I wonder what is new here; the 1-4 chain there has been true for a long
time, see also the comment at perf_event_ctx_lock_nested().

That said; it _might_ be possible to break 3->4, that is, all the
copy_{to,from}_user() usage in perf can be lifted out from under the
various locks by re-arranging code, but I have a nagging feeling there
was more to it than that. Of course, while I did document the locking
rules, I seem to have forgotten to comment on exactly why these rules
are as they are.. oh well.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
