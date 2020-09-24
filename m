Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC60277353
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 15:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC26EB26;
	Thu, 24 Sep 2020 13:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840B06EB14;
 Thu, 24 Sep 2020 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MOgC9OGGeZJDv1+n6/wlwMjXb8lCrwqJ2Nw3weXr+Qc=; b=JsDPpGvHCaRJKTjEp4jfBvIc6f
 pXZLbwXBu5W8wOQFQmAslu3rcVo3QzDGQFkjChuW6FIVMUFcn9IGZif/AfN2U01WzpkVAz+KFjobU
 0jWaSlW3Xn2GQ84V721qkLjzWf+wjf87oufz3kW5JH8rWv+6T3T3JVoKiDNY9dD7MOcGuNMH2PZBs
 SnzOi2M6Zof+/P1qbt2Khez267c1eK7X/9CbdBAMVey/kVf/aLifYALWXQaU/QkCvZXO+P5xD/kVr
 VMyquwF/LWZfEYgUe0JzptxCjKKCYhp2fTxOVreYNbgMOT1pBTJrHrmgCpfvBdVmz9xgyChNoHSwP
 aldNLPLA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLRlA-0003sC-Q7; Thu, 24 Sep 2020 13:58:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 671203007CD;
 Thu, 24 Sep 2020 15:58:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 51F872010B5FA; Thu, 24 Sep 2020 15:58:05 +0200 (CEST)
Date: Thu, 24 Sep 2020 15:58:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200924135805.GN2628@hirez.programming.kicks-ass.net>
References: <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
 <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
 <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
 <20200923115251.7cc63a7e@oasis.local.home>
 <874kno9pr9.fsf@nanos.tec.linutronix.de>
 <20200923171234.0001402d@oasis.local.home>
 <871riracgf.fsf@nanos.tec.linutronix.de>
 <20200924083241.314f2102@gandalf.local.home>
 <20200924124241.GK2628@hirez.programming.kicks-ass.net>
 <20200924095138.5318d242@oasis.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924095138.5318d242@oasis.local.home>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Greentime Hu <green.hu@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@synopsys.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 09:51:38AM -0400, Steven Rostedt wrote:

> > It turns out, that getting selected for pull-balance is exactly that
> > condition, and clearly a migrate_disable() task cannot be pulled, but we
> > can use that signal to try and pull away the running task that's in the
> > way.
> 
> Unless of course that running task is in a migrate disable section
> itself ;-)

See my ramblings here:

  https://lkml.kernel.org/r/20200924082717.GA1362448@hirez.programming.kicks-ass.net

My plan was to have the migrate_enable() of the running task trigger the
migration in that case.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
