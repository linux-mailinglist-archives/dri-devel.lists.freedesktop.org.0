Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E4269766
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 23:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCCB6E5CA;
	Mon, 14 Sep 2020 21:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2996E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 21:07:35 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id j11so2031867ejk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Qs78FMzlt+im4GrVUJu3esmNYK1MSMDWWoqgBiwThs=;
 b=ERO6mM2HDltE439vWz9d9wZL1Z1US74Rep2fFSqw78LuIb7lPia7EGvlr1OC0CVjXq
 SMHEUg44TyaQk6ZJLSPy2HsSiKOu/iozCQgjKu5X4wpxZiRqxlsnhy+mopIISbxgK1FP
 TMlpT1uLwxNI5kovsL0EwxutKi15MuXbWCbt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Qs78FMzlt+im4GrVUJu3esmNYK1MSMDWWoqgBiwThs=;
 b=tV02TrW1iY9n5B5pO6f/5Yqb47RONJMvyTUQz8hZl6M9MxwWSV5MjEgxk3lMEUuNnF
 UQr14fgfW/NLX7o1Vqlm9/1AA4B7T4O5mYLkDEf+zNmoxLYzS70RhztNTulFVPi+kbN/
 hdWLRb+5m2TVpSMJkyOSdaSO8Gnw6FrtU6eZuheK+8gvWJv9jm80Oo+8mWiSTKmzbYdS
 ZHFv5R4wkHDxYJ2g7GucyiejxWfBkz8/ujkUWFZSEeUesfgiKKiIkPPbKoDzDeo3Emba
 2o0xF5U8XHqSTWSK1oSowZZF5xBWLO3w66LJIuveemr+BD7taBmluUydgqZL9VEJAea7
 UW1Q==
X-Gm-Message-State: AOAM5325cUQ0/P/3HEOjOUhqWMmkCbRXjaOpno+HyUXoPW4pm3dRAOaP
 AWHyVAXLQ/LkmMZFMWFqcmKMiBDIVmnl8w==
X-Google-Smtp-Source: ABdhPJygdP/eRKtmMbf4GtFYbzF1xAsy6Zu43T70p+eyFnrbMK5DNEAgyE5DkUlH1aI2Jg2nhh848g==
X-Received: by 2002:a17:907:110f:: with SMTP id
 qu15mr17319905ejb.359.1600117653951; 
 Mon, 14 Sep 2020 14:07:33 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id v18sm10050850edb.26.2020.09.14.14.07.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 14:07:33 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id e16so1113654wrm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 14:07:33 -0700 (PDT)
X-Received: by 2002:a2e:91cd:: with SMTP id u13mr5091065ljg.421.1600117171599; 
 Mon, 14 Sep 2020 13:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200914204209.256266093@linutronix.de>
In-Reply-To: <20200914204209.256266093@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2020 13:59:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
Message-ID: <CAHk-=win80rdof8Pb=5k6gT9j_v+hz-TQzKPVastZDvBe9RimQ@mail.gmail.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
To: Thomas Gleixner <tglx@linutronix.de>
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

On Mon, Sep 14, 2020 at 1:45 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Recently merged code does:
>
>          gfp = preemptible() ? GFP_KERNEL : GFP_ATOMIC;
>
> Looks obviously correct, except for the fact that preemptible() is
> unconditionally false for CONFIF_PREEMPT_COUNT=n, i.e. all allocations in
> that code use GFP_ATOMIC on such kernels.

I don't think this is a good reason to entirely get rid of the no-preempt thing.

The above is just garbage. It's bogus. You can't do it.

Blaming the no-preempt code for this bug is extremely unfair, imho.

And the no-preempt code does help make for much better code generation
for simple spinlocks.

Where is that horribly buggy recent code? It's not in that exact
format, certainly, since 'grep' doesn't find it.

             Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
