Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9E26CCBB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 22:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16AF6EB2D;
	Wed, 16 Sep 2020 20:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6546EB2D;
 Wed, 16 Sep 2020 20:48:42 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4AE9206BE;
 Wed, 16 Sep 2020 20:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600289321;
 bh=QF1zQJP79WVPgC7BQeqDP3DZhHjaF5z1yd8g5M2I7fo=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=akB9Q04wZh3xRPtHQo3QuvPylihDbICVfThimNTeh+6Dq0zpizzibT3VdQC852Awd
 fuMHbK20SAzoAhLwH6t+euR5PcSNWcJa0SR4ujAxGLaUq8AJQAgfX4YxZ7alYezUvX
 j37+068f8IMjVrTrNXFe4dEm94w3+K/HU0qZ4xJY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 6BBF33522BA0; Wed, 16 Sep 2020 13:48:41 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:48:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
Message-ID: <20200916204841.GC29330@paulmck-ThinkPad-P72>
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <20200916192352.GO5449@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916192352.GO5449@casper.infradead.org>
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
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 08:23:52PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 11:55:24PM +0200, Thomas Gleixner wrote:
> > But just look at any check which uses preemptible(), especially those
> > which check !preemptible():
> 
> hmm.
> 
> +++ b/include/linux/preempt.h
> @@ -180,7 +180,9 @@ do { \
>  
>  #define preempt_enable_no_resched() sched_preempt_enable_no_resched()
>  
> +#ifndef MODULE
>  #define preemptible()  (preempt_count() == 0 && !irqs_disabled())
> +#endif
>  
>  #ifdef CONFIG_PREEMPTION
>  #define preempt_enable() \
> 
> 
> $ git grep -w preemptible drivers
> (slightly trimmed by hand to remove, eg, comments)
> drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
> drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
> drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
> drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
> drivers/firmware/arm_sdei.c:    WARN_ON(preemptible());
> drivers/firmware/efi/efi-pstore.c:                            preemptible(), record->size, record->psi->buf);
> drivers/irqchip/irq-gic-v4.c:   WARN_ON(preemptible());
> drivers/irqchip/irq-gic-v4.c:   WARN_ON(preemptible());
> drivers/scsi/hisi_sas/hisi_sas_main.c:          if (!preemptible())
> drivers/xen/time.c:     BUG_ON(preemptible());
> 
> That only looks like two drivers that need more than WARNectomies.

I could easily imagine someone thinking that these did something in
CONFIG_PREEMPT_NONE=y kernels.  In fact, I could easily imagine myself
making that mistake.  :-/

> Although maybe rcu_read_load_sched_held() or rcu_read_lock_any_held()
> might get called from a module ...

But yes, from the rcutorture module for certain and also from any other
RCU-using module that includes the usual RCU debug checks.

							Thanx, Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
