Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ADE26AA84
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6686E8AF;
	Tue, 15 Sep 2020 17:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F16E8AD;
 Tue, 15 Sep 2020 17:25:52 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC9D520678;
 Tue, 15 Sep 2020 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600190751;
 bh=zAnK9MdJHBLYi0RM5uCLYkcfWnZYrpv2oBo/jSvr9uY=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Ykvmjz+uTRDK4muYb7ZaU4DA//3YkvSNNe72xuNxHLx5WYlF6vS8rMYi7/p95sA0e
 ZPdUkNpigzrHNbl4M/6ZTzpu5fGsQWXGQS5l9WSBuK+ES7WGVLX9Rtn/w5xojTk3HA
 SqvN6NXO/B4lR6nWQIM4LgYias8O7Oiya2Sq1o2E=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id B8FC535226B7; Tue, 15 Sep 2020 10:25:50 -0700 (PDT)
Date: Tue, 15 Sep 2020 10:25:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
Message-ID: <20200915172550.GO29330@paulmck-ThinkPad-P72>
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Segall <bsegall@google.com>,
 Linux-MM <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Brian Cain <bcain@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 01:59:15PM -0700, Linus Torvalds wrote:
> On Mon, Sep 14, 2020 at 1:45 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > Recently merged code does:
> >
> >          gfp = preemptible() ? GFP_KERNEL : GFP_ATOMIC;
> >
> > Looks obviously correct, except for the fact that preemptible() is
> > unconditionally false for CONFIF_PREEMPT_COUNT=n, i.e. all allocations in
> > that code use GFP_ATOMIC on such kernels.
> 
> I don't think this is a good reason to entirely get rid of the no-preempt thing.
> 
> The above is just garbage. It's bogus. You can't do it.
> 
> Blaming the no-preempt code for this bug is extremely unfair, imho.
> 
> And the no-preempt code does help make for much better code generation
> for simple spinlocks.
> 
> Where is that horribly buggy recent code? It's not in that exact
> format, certainly, since 'grep' doesn't find it.

It would be convenient for that "gfp =" code to work, as this would
allow better cache locality while invoking RCU callbacks, and would
further provide better robustness to callback floods.  The full story
is quite long, but here are alternatives have not yet been proven to be
abject failures:

1.	Use workqueues to do the allocations in a clean context.
	While waiting for the allocations, the callbacks are queued
	in the old cache-busting manner.  This functions correctly,
	but in the meantime (which on busy systems can be some time)
	the cache locality and robustness are lost.

2.	Provide the ability to allocate memory in raw atomic context.
	This is extremely effective, especially when used in combination
	with #1 above, but as you might suspect, the MM guys don't like
	it much.

In contrast, with Thomas's patch series, call_rcu() and kvfree_rcu()
could just look at preemptible() to see whether or not it was safe to
allocate memory, even in !PREEMPT kernels -- and in the common case,
it almost always would be safe.  It is quite possible that this approach
would work in isolation, or failing that, that adding #1 above would do
the trick.

I understand that this is all very hand-wavy, and I do apologize for that.
If you really want the full sad story with performance numbers and the
works, let me know!

							Thanx, Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
