Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0927C049
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A306E1F1;
	Tue, 29 Sep 2020 09:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB5A6E152
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:00:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k18so3942390wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=l8n+Qtmools068Op1SBkscZ3rmiXf/OnO40zpDWJvQs=;
 b=HSfJ7A4FNQbt4jfghWagnZ0q3COkKg8qz4BPThTLTJ7eDRMt1DvHHeb7XKEZ522gOH
 eWGtprOnXgZp5uEMLqACAESKMKR8I99jBaCAbi8CJzl/OnYlzX1P6crhIyasKLf4c1bf
 2XybbZVEohhAC+dLedQmm8E/GOTp7GyR5iP8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=l8n+Qtmools068Op1SBkscZ3rmiXf/OnO40zpDWJvQs=;
 b=dEXTHURvUtt7GD4aqKUqTNeOmcpBK6JrbJf9MmvUTf4kTnQvdJI3nv9lWeZBiWSiJg
 s/gPDGhdZ+7ajmWb4WoWiWABEH47TviGh6B40Kx7HWxf9/Xaw7pt28cHfx2xgEUJDXrq
 M7EdV8s+qjGh1qbrM/CyD2SlJyDFRD3IrM6On5/vRlznbD/FJxvN87z9Av3r3NrUemsw
 PPwFRAQf/W1bX2qEMQ1kqY0Kli4VijXye3jBx+vMgGMA/s6/6J745TvK2sXoHPuHQCv8
 iZa1hJtB37TevreyV27W08BIpW3n5H8NUmxY4NZqumKF8i2El7j7b6jLc1k+vRuQ+jyf
 B+cg==
X-Gm-Message-State: AOAM532G7N/ExvLUj/1ivfPNGX8FHgcx4T5XHsQXKO3SEHHxNIdas+wK
 uQVQPkg7Af0vNcnYhHzgJvggsg==
X-Google-Smtp-Source: ABdhPJxYoSwWp1/Rwj6+DAZKjozJGei8dnC1WhCd/eu2wZIqXPLzEpFDxM+EMdAcXI41uJyANz2nYw==
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr3465483wme.127.1601370007530; 
 Tue, 29 Sep 2020 02:00:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z191sm1552480wme.40.2020.09.29.02.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:00:06 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:00:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [patch 00/13] preempt: Make preempt count unconditional
Message-ID: <20200929090003.GG438822@phenom.ffwll.local>
Mail-Followup-To: Michal Hocko <mhocko@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>,
 Ard Biesheuvel <ardb@kernel.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linux-xtensa@linux-xtensa.org, Shuah Khan <shuah@kernel.org>,
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
 Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <871rj4owfn.fsf@nanos.tec.linutronix.de>
 <CAHk-=wj0eUuVQ=hRFZv_nY7g5ZLt7Fy3K7SMJL0ZCzniPtsbbg@mail.gmail.com>
 <87bli75t7v.fsf@nanos.tec.linutronix.de>
 <CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com>
 <CAKMK7uHAk9-Vy2cof0ws=DrcD52GHiCDiyHbjLd19CgpBU2rKQ@mail.gmail.com>
 <20200916152956.GV29330@paulmck-ThinkPad-P72>
 <CAKMK7uGFyfhEyt=jmdk2jDO-hq0_Pf0ck+cKSELHjr2U3rPuYQ@mail.gmail.com>
 <20200916205840.GD29330@paulmck-ThinkPad-P72>
 <CAKMK7uHL2dMv80b8uBXr=BqHD2TQeODQQM1MGYhAfCYbX7sLrA@mail.gmail.com>
 <20200929081938.GC22035@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929081938.GC22035@dhcp22.suse.cz>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Brian Cain <bcain@codeaurora.org>,
 linux-hexagon@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 10:19:38AM +0200, Michal Hocko wrote:
> On Wed 16-09-20 23:43:02, Daniel Vetter wrote:
> > I can
> > then figure out whether it's better to risk not spotting issues with
> > call_rcu vs slapping a memalloc_noio_save/restore around all these
> > critical section which force-degrades any allocation to GFP_ATOMIC at
> 
> did you mean memalloc_noreclaim_* here?

Yeah I picked the wrong one of that family of functions.

> > most, but has the risk that we run into code that assumes "GFP_KERNEL
> > never fails for small stuff" and has a decidedly less tested fallback
> > path than rcu code.
> 
> Even if the above then please note that memalloc_noreclaim_* or
> PF_MEMALLOC should be used with an extreme care. Essentially only for
> internal memory reclaimers. It grants access to _all_ the available
> memory so any abuse can be detrimental to the overall system operation.
> Allocation failure in this mode means that we are out of memory and any
> code relying on such an allocation has to carefuly consider failure.
> This is not a random allocation mode.

Agreed, that's why I don't like having these kind of automagic critical
sections. It's a bit a shotgun approach. Paul said that the code would
handle failures, but the problem is that it applies everywhere.

Anyway my understanding is that call_rcu will be reworked and gain a pile
of tricks so that these problems for the callchains leading to call_rcu
all disappear.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
