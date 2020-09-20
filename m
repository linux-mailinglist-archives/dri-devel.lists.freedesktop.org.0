Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD24271C22
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DEA6E237;
	Mon, 21 Sep 2020 07:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2316E096;
 Sun, 20 Sep 2020 17:40:44 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600623642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ka0n+28OJXKPQLIVVR5Idhk3egkf6ni8LHSNLSNto8=;
 b=QNCArf/vGifXO0hggd/oZT3co789XMX68FBpCZc9ELpUzjSb976p4qnrJXsUs4Wtn54Oe5
 cREp7rnAnzQ2lkpB3S51Szog5eqcRviWtdYmN6anOoL9fmTtcQqDtDSWpVqORSo+xe9eNI
 ov8P0XhtU/ulbV28ywMlU0xr6kjRfIcVtmCVZ2FKw+DGK6aL/ezJuFiklF8NhXvAMiIh49
 yrsZFHHw6uzr03zNYpu3ftPmTuZ7RyM2m1FWCRDFflQbJ/wuC7iq3YbPgWy/7QFdvivYSQ
 /Lqxr0wjpHyMFoiBEk4JJ16r2HL2cAu9GKsxBmw9WWw39VkpbDCGdel1jZCIGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600623642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ka0n+28OJXKPQLIVVR5Idhk3egkf6ni8LHSNLSNto8=;
 b=pomJJyR0iiUjZA6jjfbK7rYJBQcHpFL04sHLhdkrrobwFUG9h3ONNeKC4FHSzSIeasL6F6
 5LIRCzwKaerEOICg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
Date: Sun, 20 Sep 2020 19:40:41 +0200
Message-ID: <87eemwcpnq.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:45 +0000
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
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 20 2020 at 09:57, Linus Torvalds wrote:
> On Sun, Sep 20, 2020 at 1:49 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> Btw, looking at the stack code, Ithink your new implementation of it
> is a bit scary:
>
>    static inline int kmap_atomic_idx_push(void)
>    {
>   -       int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
>   +       int idx = current->kmap_ctrl.idx++;
>
> and now that 'current->kmap_ctrl.idx' is not atomic wrt
>
>  (a) NMI's (this may be ok, maybe we never do kmaps in NMIs, and with
> nesting I think it's fine anyway - the NMI will undo whatever it did)

Right. Nesting should be a non issue, but I don't think we have
kmap_atomic() in NMI context.

>  (b) the prev/next switch
>
> And that (b) part worries me. You do the kmap_switch_temporary() to
> switch the entries, but you do that *separately* from actually
> switching 'current' to the new value.
>
> So kmap_switch_temporary() looks safe, but I don't think it actually
> is. Because while it first unmaps the old entries and then remaps the
> new ones, an interrupt can come in, and at that point it matters what
> is *CURRENT*.
>
> And regardless of whether 'current' is 'prev' or 'next', that
> kmap_switch_temporary() loop may be doing the wrong thing, depending
> on which one had the deeper stack. The interrupt will be using
> whatever "current->kmap_ctrl.idx" is, but that might overwrite entries
> that are in the process of being restored (if current is still 'prev',
> but kmap_switch_temporary() is in the "restore @next's kmaps" pgase),
> or it might stomp on entries that have been pte_clear()'ed by the
> 'prev' thing.

Duh yes. Never thought about that.

> Alternatively, that process counter would need about a hundred lines
> of commentary about exactly why it's safe. Because I don't think it
> is.

I think the more obvious solution is to split the whole exercise:


  schedule()
     prepare_switch()
        unmap()

    switch_to()

    finish_switch()
        map()

That's safe because neither the unmap() nor the map() code changes
kmap_ctrl.idx. So if there is an interrupt coming in between unmap() and
switch_to() then a kmap_local() there will use the next entry. So we
could even do the unmap() with interrupts enabled (preemption disabled).
Same for the map() part.

To explain that we need only a few lines of commentry methinks.

Thanks,

        tglx

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
