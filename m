Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDAC269F44
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE2D6E855;
	Tue, 15 Sep 2020 07:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4221 seconds by postgrey-1.36 at gabe;
 Mon, 14 Sep 2020 21:55:28 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01886E5D4;
 Mon, 14 Sep 2020 21:55:28 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600120524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P98RI5+x85ZIOTD3Swat6HzJBudR4USSg0DSBuPQYlw=;
 b=hH9FYfj9DQJgslBAq+lFx+a3bfT/lIVYWHizRDv1sHkem67GYxpW96SdzpQkucjGarnE+M
 fld5Lw29xJarEYiaUD4vuyzGvHaSSKqXk6qxyQup6A6bzrwHnnmSmCxo6yE/vPqfiXt0dD
 R3pV6vuirJkXQ/z5VHHP3RKtA3FyXadYEGVpatQGuSs+ToljOeUzNBQNQ6fUtHgMCvxdJA
 HGeFbenx9Fch23dD9CVHcFHCh2ZUgCX2NA5eXP/LYI0hb9YFgVRkOq3lQYpvKQmLDTr2hy
 B9Jnvxymnsb7eDLHVb5DKLd1ZQ+CotthRBFCF28eXaCTJZZtyMZBvSDp8Ip8jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600120524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P98RI5+x85ZIOTD3Swat6HzJBudR4USSg0DSBuPQYlw=;
 b=YEE8eG0C2SZUbvfqTo7e2bqeeV6BT6id2YPrIOx3R8QOC3vypPq4XP5Xw+lbm3gssIjlYI
 Hvox4aqD3LDjRKDg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
In-Reply-To: <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
Date: Mon, 14 Sep 2020 23:55:24 +0200
Message-ID: <871rj4owfn.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

On Mon, Sep 14 2020 at 13:59, Linus Torvalds wrote:
> On Mon, Sep 14, 2020 at 1:45 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Recently merged code does:
>>
>>          gfp = preemptible() ? GFP_KERNEL : GFP_ATOMIC;
>>
>> Looks obviously correct, except for the fact that preemptible() is
>> unconditionally false for CONFIF_PREEMPT_COUNT=n, i.e. all allocations in
>> that code use GFP_ATOMIC on such kernels.
>
> I don't think this is a good reason to entirely get rid of the
> no-preempt thing.

I did not say that this is a good reason. It just illustrates the
problem.

> The above is just garbage. It's bogus. You can't do it.
>
> Blaming the no-preempt code for this bug is extremely unfair, imho.

I'm not blaming the no-preempt code. I'm blaming inconsistency and there
is no real good argument for inconsistent behaviour, TBH.

> And the no-preempt code does help make for much better code generation
> for simple spinlocks.

Yes it does generate better code, but I tried hard to spot a difference
in various metrics exposed by perf. It's all in the noise and I only
can spot a difference when the actual preemption check after the
decrement which still depends on CONFIG_PREEMPT is in place, but that's
not the case for PREEMPT_NONE or PREEMPT_VOLUNTARY kernels where the
decrement is just a decrement w/o any conditional behind it.

> Where is that horribly buggy recent code? It's not in that exact
> format, certainly, since 'grep' doesn't find it.

Bah, that was stuff in next which got dropped again.

But just look at any check which uses preemptible(), especially those
which check !preemptible():

In the X86 #GP handler we have:

	/*
	 * To be potentially processing a kprobe fault and to trust the result
	 * from kprobe_running(), we have to be non-preemptible.
	 */
	if (!preemptible() &&
	    kprobe_running() &&
	    kprobe_fault_handler(regs, X86_TRAP_GP))
		goto exit;

and a similar check in the S390 code in kprobe_exceptions_notify(). That
all magically 'works' because that code might have been actually tested
with lockdep enabled which enforces PREEMPT_COUNT...

The SG code has some interesting usage as well:

		if (miter->__flags & SG_MITER_ATOMIC) {
			WARN_ON_ONCE(preemptible());
			kunmap_atomic(miter->addr);

How is that WARN_ON_ONCE() supposed to catch anything? Especially as
calling code does:

	flags = SG_MITER_TO_SG;
	if (!preemptible())
		flags |= SG_MITER_ATOMIC;

which is equally useless on kernels which have PREEMPT_COUNT=n.

There are bugs which are related to in_atomic() or other in_***() usage
all over the place as well.

Inconsistency at the core level is a clear recipe for disaster and at
some point we have to bite the bullet and accept that consistency is
more important than the non measurable 3 cycles?

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
