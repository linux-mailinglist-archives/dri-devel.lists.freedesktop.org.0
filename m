Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E5271C13
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB126E217;
	Mon, 21 Sep 2020 07:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AF36E0CA;
 Sun, 20 Sep 2020 17:24:52 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600622689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELUNMLCQYXoHQWzGjHTiBi/GvrgBrzUdsStDgdETjPA=;
 b=tzqY9X8fLvmtivfsbNK0pUu8YiUj7NKf7+bQzIN33nK/SwghNMa2rz52k7m9LEaGnDxB4p
 5uJRP8jzSGhdLLpPzoF07YS1dppzeAHFuaRXBxkQ6eQFewoBrpPutv3yBGdR9YKqd5UnMc
 Lfw64Wh81l4jTzfijbUVM/G1PeB+l9wpVjsRPd3Xz3aQUHw9+Bu78ZLn5k1aNaH9Pkc5ms
 Lg9Dct8esi3AxOTl0URAWW4pIL6LMaz6yDqISWtV082sZby+eUJYHhPHZSuxMGdcllbxYl
 qQ/7nvxbGePtOn6SDA8Bi+zAxXBj+TvBWAwr7ALWt4wsGLJLJU/NhQ4k2+3KDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600622689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ELUNMLCQYXoHQWzGjHTiBi/GvrgBrzUdsStDgdETjPA=;
 b=Ajg419VRwVNBaCnESvnWBGYX1dQ8DDFprO3wwe5+UvEno+/XgboH3A5bxhtY6hr785JAXL
 VPGuKWoChMzzg9BQ==
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <20200920082353.GG438822@phenom.ffwll.local>
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
 <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
 <87pn6hc6g1.fsf@nanos.tec.linutronix.de>
 <20200920082353.GG438822@phenom.ffwll.local>
Date: Sun, 20 Sep 2020 19:24:49 +0200
Message-ID: <87h7rscqe6.fsf@nanos.tec.linutronix.de>
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
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 20 2020 at 10:23, Daniel Vetter wrote:

> On Sun, Sep 20, 2020 at 08:23:26AM +0200, Thomas Gleixner wrote:
>> On Sat, Sep 19 2020 at 12:37, Daniel Vetter wrote:
>> > On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> >> I think it should be the case, but I want to double check: Will
>> >> copy_*_user be allowed within a kmap_temporary section? This would
>> >> allow us to ditch an absolute pile of slowpaths.
>> >
>> > (coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
>> > page fault you get a short read/write. This looks like it would remove
>> > the need to handle these in a slowpath, since page faults can now be
>> > served in this new kmap_temporary sections. But this sounds too good
>> > to be true, so I'm wondering what I'm missing.
>> 
>> In principle we could allow pagefaults, but not with the currently
>> proposed interface which can be called from any context. Obviously if
>> called from atomic context it can't handle user page faults.
>  
> Yeah that's clear, but does the implemention need to disable pagefaults
> unconditionally?

As I wrote in the other reply it's not required and the final interface
will neither disable preemption nor pagefaults (except for the atomic
wrapper around it).

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
