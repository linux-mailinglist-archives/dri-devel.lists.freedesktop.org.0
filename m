Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D05826D3C7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 08:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F536E0DD;
	Thu, 17 Sep 2020 06:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD806E0DD;
 Thu, 17 Sep 2020 06:39:08 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8342D21D24;
 Thu, 17 Sep 2020 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600324747;
 bh=ul//1MPvzGwsu0j/p6Y16UQQiQFQ34KaxNZPDGcZMVQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HDt8uQM0v8B/UcBUZbIv1V0sfKfg2cFRlslsx0aSuVlSNygrWMCPE06Ap0aIBnne9
 jOW9Uv/SlRT9HO7xJczWkND5TP4anIACsyt+gRfv80tTSyzF19Y5+nRJzk0jTTcgKS
 cRwHGrtoYvMmr2fWMoLBFjS+SFN38ppdbKXJOIio=
Received: by mail-ot1-f52.google.com with SMTP id q21so908257ota.8;
 Wed, 16 Sep 2020 23:39:07 -0700 (PDT)
X-Gm-Message-State: AOAM531zG9eEvZ4tJHNg1fl64xGeNd80ImwWwp1yKuLambOqaq4i8jGS
 RQ6TOG0TsZpi40NSCEIwu67o3dgRcG2tEUkB+Tc=
X-Google-Smtp-Source: ABdhPJzDVArhOd+kLFt2rL9MQKKEsWovIySrg3UJwo0Iv+0lzRuvHpB/w00LX+tWqnD2g7LiiG7vR8NQyDodmLekHG0=
X-Received: by 2002:a9d:6193:: with SMTP id g19mr18298736otk.108.1600324745877; 
 Wed, 16 Sep 2020 23:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de>
 <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
 <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de>
 <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
 <CAKMK7uHAk9-Vy2cof0ws=DrcD52GHiCDiyHbjLd19CgpBU2rKQ@mail.gmail.com>
 <20200916152956.GV29330@paulmck-ThinkPad-P72>
 <CAHk-=wjsMycgMHJrCmeetR3r+K5bpSRtmVWfd8iaoQCYd_VYAg@mail.gmail.com>
In-Reply-To: <CAHk-=wjsMycgMHJrCmeetR3r+K5bpSRtmVWfd8iaoQCYd_VYAg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Sep 2020 09:38:54 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHbKVY_3s_DX_iv0gDbM+mcnP2Eh9ZkeXMPA9sZQVvapw@mail.gmail.com>
Message-ID: <CAMj1kXHbKVY_3s_DX_iv0gDbM+mcnP2Eh9ZkeXMPA9sZQVvapw@mail.gmail.com>
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

On Wed, 16 Sep 2020 at 21:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But something like a driver list walking thing should not be doing
> different things behind peoples back depending on whether they hold
> spinlocks or not. It should either just work regardless, or there
> should be a flag (or special interface) for the "you're being called
> in a crtitical region".
>
> Because dynamically changing behavior really is very confusing.
>

By the same reasoning, I don't think a generic crypto library should
be playing tricks with preemption en/disabling under the hood when
iterating over some data that is all directly accessible via the
linear map on the platforms that most people care about. And using
kmap_atomic() unconditionally achieves exactly that.

As I argued before, the fact that kmap_atomic() can be called from an
atomic context, and the fact that its implementation on HIGHMEM
platforms requires preemption to be disabled until the next kunmap()
are two different things, and I don't agree with your assertion that
the name kmap_atomic() implies the latter semantics. If we can avoid
disabling preemption on HIGHMEM, as Thomas suggests, we surely don't
need it on !HIGHMEM either, and given that kmap_atomic() is preferred
today anyway, we can just merge the two implementations. Are there any
existing debug features that could help us spot [ab]use of things like
raw per-CPU data within kmap_atomic regions?

Re your point about deprecating HIGHMEM: some work is underway on ARM
to implement a 3.75/3.75 GB kernel/user split on recent LPAE capable
hardware (which shouldn't suffer from the performance issues that
plagued the 4/4 split on i686), and so hopefully, there is a path
forward for ARM that does not rely on HIGHMEM as it does today.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
