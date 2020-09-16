Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F226D5B7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 10:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9DC6EB74;
	Thu, 17 Sep 2020 08:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18F36EACD;
 Wed, 16 Sep 2020 19:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lu9AW4PaP4+ghxOf92Z5TIuOtrZJHfVdt4GP1kALmko=; b=qie+Isc1xWiVTOH0FpnUHhEdVO
 U/jpqcMvDRllAqn5p1U7GdefAxVM84Yy20b0cEM1bgiBf5hCnk01e9MB0TfKNwOXtWN1U1K+TKZoh
 Bf7eW6kpPKuWJAr92A4pFo4s9J4/zlCT/ZybRGMdVlaWMx2Lk0KLJY3uqYA5myPxU7z9T0QBID7Dv
 QCPTePB01BBKw0BUKhTbux2is2J6jnziOkr8sFb2qrhMyKZ9JnMFHBYx4uJoB16mYi9Z0C/a5HCRA
 DVWm6Js19jJdrChlv68PKTMdyYhgXX++ENCqsExKeuZiA9F/oE7zG8P2cfvR8n7McmH85zDTJUYAn
 sSR0hzAg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kId20-0006tV-87; Wed, 16 Sep 2020 19:23:52 +0000
Date: Wed, 16 Sep 2020 20:23:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
Message-ID: <20200916192352.GO5449@casper.infradead.org>
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871rj4owfn.fsf@nanos.tec.linutronix.de>
X-Mailman-Approved-At: Thu, 17 Sep 2020 08:08:02 +0000
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

On Mon, Sep 14, 2020 at 11:55:24PM +0200, Thomas Gleixner wrote:
> But just look at any check which uses preemptible(), especially those
> which check !preemptible():

hmm.

+++ b/include/linux/preempt.h
@@ -180,7 +180,9 @@ do { \
 
 #define preempt_enable_no_resched() sched_preempt_enable_no_resched()
 
+#ifndef MODULE
 #define preemptible()  (preempt_count() == 0 && !irqs_disabled())
+#endif
 
 #ifdef CONFIG_PREEMPTION
 #define preempt_enable() \


$ git grep -w preemptible drivers
(slightly trimmed by hand to remove, eg, comments)
drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
drivers/firmware/arm_sdei.c:    WARN_ON_ONCE(preemptible());
drivers/firmware/arm_sdei.c:    WARN_ON(preemptible());
drivers/firmware/efi/efi-pstore.c:                            preemptible(), record->size, record->psi->buf);
drivers/irqchip/irq-gic-v4.c:   WARN_ON(preemptible());
drivers/irqchip/irq-gic-v4.c:   WARN_ON(preemptible());
drivers/scsi/hisi_sas/hisi_sas_main.c:          if (!preemptible())
drivers/xen/time.c:     BUG_ON(preemptible());

That only looks like two drivers that need more than WARNectomies.

Although maybe rcu_read_load_sched_held() or rcu_read_lock_any_held()
might get called from a module ...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
