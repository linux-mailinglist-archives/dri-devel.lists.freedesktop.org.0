Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91255269F31
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC80D6E84F;
	Tue, 15 Sep 2020 07:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECBA6E088;
 Tue, 15 Sep 2020 06:24:25 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kI4Mf-0007aN-HK; Tue, 15 Sep 2020 16:22:54 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 16:22:53 +1000
Date: Tue, 15 Sep 2020 16:22:53 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
Message-ID: <20200915062253.GA26275@gondor.apana.org.au>
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
 <CAMj1kXHrDU50D08TwLfzz2hCK+8+C7KGPF99PphXtsOYZ-ff1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXHrDU50D08TwLfzz2hCK+8+C7KGPF99PphXtsOYZ-ff1g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
	linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-arch <linux-arch@vger.kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Brian Cain <bcain@codeaurora.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-@freedesktop.org>,
	David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mel Gorman <mgorman@suse.de>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Matt Turner <mattst88@gmail.com>,
	Valentin Schneider <valentin.schneider@arm.com>,
	linux-xtensa@linux-xtensa.org, Shuah Khan <shuah@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jeff Dike <jdike@addtoit.com>,
	linux-um <linux-um@lists.infradead.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	alpha <linux-alpha@vger.kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 09:20:59AM +0300, Ard Biesheuvel wrote:
>
> The documentation of kmap_atomic() states the following:
> 
>  * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
>  * gives a more generic (and caching) interface. But kmap_atomic can
>  * be used in IRQ contexts, so in some (very limited) cases we need
>  * it.
> 
> so if this is no longer accurate, perhaps we should fix it?

This hasn't been accurate for at least ten years :)

> But another reason I tried to avoid kmap_atomic() is that it disables
> preemption unconditionally, even on 64-bit architectures where HIGHMEM
> is irrelevant. So using kmap_atomic() here means that the bulk of
> WireGuard packet encryption runs with preemption disabled, essentially
> for legacy reasons.

Agreed.  We should definitely fix that.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
