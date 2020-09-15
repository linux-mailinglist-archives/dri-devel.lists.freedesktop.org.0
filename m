Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF018269E59
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 08:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 098B56E02E;
	Tue, 15 Sep 2020 06:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125056E02E;
 Tue, 15 Sep 2020 06:21:12 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7149B221EB;
 Tue, 15 Sep 2020 06:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600150871;
 bh=yHPOwHAJMf2CyGYn5iaGApE31+NbMN1jtYRrQr3OqtY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TmmxknEGZyvx8vlGW5CGW73+O4uXGgraFnOf4HjrP8W3fP+hO00OxomgQPDZMrWul
 TTPtnmKpuFwwNrUFpHPuMsrGwVxISsxidGAMi4sBmKygdDvEVG1y6hO3MT19lxjr8u
 N8b5Mw4ZsilvmmxhDCjXlk2EUymtxsG5fkzIFbZw=
Received: by mail-oi1-f180.google.com with SMTP id y6so2617581oie.5;
 Mon, 14 Sep 2020 23:21:11 -0700 (PDT)
X-Gm-Message-State: AOAM532+rleuT+q+sjDJL5MpNpNpvHzn9N3e68jc9I6gBWI6HZKwLIE7
 OC0rNEd/D54s4SlVBAl9TOOWcqTPI6QlQ+OrDGo=
X-Google-Smtp-Source: ABdhPJyUSykKZBGXRh2yEfSyDpEqCADm2R5enp/Wn0v7qrNEGX7YgMeVQQUInE2Y4YU+sX9Jw9CdsuzBUOw9ncgQn/s=
X-Received: by 2002:aca:d845:: with SMTP id p66mr2094330oig.47.1600150870261; 
 Mon, 14 Sep 2020 23:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
In-Reply-To: <CAHk-=wjOV6f_ddg+QVCF6RUe+pXPhSR2WevnNyOs9oT+q2ihEA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Sep 2020 09:20:59 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHrDU50D08TwLfzz2hCK+8+C7KGPF99PphXtsOYZ-ff1g@mail.gmail.com>
Message-ID: <CAMj1kXHrDU50D08TwLfzz2hCK+8+C7KGPF99PphXtsOYZ-ff1g@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 Herbert Xu <herbert@gondor.apana.org.au>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
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

On Tue, 15 Sep 2020 at 01:43, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Sep 14, 2020 at 3:24 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Ard and Herbert added to participants: see
> > chacha20poly1305_crypt_sg_inplace(), which does
> >
> >         flags = SG_MITER_TO_SG;
> >         if (!preemptible())
> >                 flags |= SG_MITER_ATOMIC;
> >
> > introduced in commit d95312a3ccc0 ("crypto: lib/chacha20poly1305 -
> > reimplement crypt_from_sg() routine").
>
> As far as I can tell, the only reason for this all is to try to use
> "kmap()" rather than "kmap_atomic()".
>
> And kmap() actually has the much more complex "might_sleep()" tests,
> and apparently the "preemptible()" check wasn't even the proper full
> debug check, it was just a complete hack to catch the one that
> triggered.
>

This was not driven by a failing check.

The documentation of kmap_atomic() states the following:

 * The use of kmap_atomic/kunmap_atomic is discouraged - kmap/kunmap
 * gives a more generic (and caching) interface. But kmap_atomic can
 * be used in IRQ contexts, so in some (very limited) cases we need
 * it.

so if this is no longer accurate, perhaps we should fix it?

But another reason I tried to avoid kmap_atomic() is that it disables
preemption unconditionally, even on 64-bit architectures where HIGHMEM
is irrelevant. So using kmap_atomic() here means that the bulk of
WireGuard packet encryption runs with preemption disabled, essentially
for legacy reasons.


> From a quick look, that code should probably just get rid of
> SG_MITER_ATOMIC entirely, and alwayse use kmap_atomic().
>
> kmap_atomic() is actually the faster and proper interface to use
> anyway (never mind that any of this matters on any sane hardware). The
> old kmap() and kunmap() interfaces should generally be avoided like
> the plague - yes, they allow sleeping in the middle and that is
> sometimes required, but if you don't need that, you should never ever
> use them.
>
> We used to have a very nasty kmap_atomic() that required people to be
> very careful and know exactly which atomic entry to use, and that was
> admitedly quite nasty.
>
> So it _looks_ like this code started using kmap() - probably back when
> kmap_atomic() was so cumbersome to use - and was then converted
> (conditionally) to kmap_atomic() rather than just changed whole-sale.
> Is there actually something that wants to use those sg_miter functions
> and sleep?
>
> Because if there is, that choice should come from the outside, not
> from inside lib/scatterlist.c trying to make some bad guess based on
> the wrong thing entirely.
>
>                  Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
