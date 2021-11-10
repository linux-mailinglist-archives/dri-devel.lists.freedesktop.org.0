Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D844BD81
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA23E6ECAE;
	Wed, 10 Nov 2021 09:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116DA6ECAE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 09:00:47 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id v138so4656484ybb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xrWvBdC5JpCuas3mpPMaBxTtNzpxlF+0ikSKfxkbVt0=;
 b=WDcRsuq6/iA5IvanjMAuNMhPHJCXy2mzX8qF8NEwnoMNgkBSH+L4iLbOzU6UUyVLlS
 b/xLVcEMF/3zZk/OyWDTuh9UfxnaP4u37yeYsVm++k8E9Qm4h8CNtU6fcFOfFlW53/l3
 nPUnoCecOINDpuoqe9ej6uJaOEIfNFlhpOohe/MdkSA6JVjuPOsKj+f/2fv8UB5Xo0fE
 S+wobNMmRyoZPChEhNPLUc9BXcJVQ7asyNxgiNNDedaLHdQ1m0UMqdnS0VMgJX9JvDux
 M5vxTz4IYRuSKAtus4qB4aR3C8VsvW4fPnr9nAez/FInMBJRUY5N5XbdkLsgB8a65KeE
 n5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xrWvBdC5JpCuas3mpPMaBxTtNzpxlF+0ikSKfxkbVt0=;
 b=3agq2v+dk2on+e3vqNMX5l4iWPv7BCpHQH1H36fgCkPnzA+JXzE/twqzXPXgNDG6Ar
 dmHYq9qTga9WXb2H3AJW0hncx7irZWvSDj7s1fDKP+g5XmG7FRfM01Tu9HI0y2FA7FFN
 aadJZGhd58/INAFn/ikYNgaejPFZMl7Wg73CpAgvNVQifN5T6Vkz9nK/CsHS5fHQ+RxM
 Sg2HaIuZNm8TipUQLDZWWYM/1f3a/QKy5Q7CJGVLwhIu9JsicXnrd4MHDnNRdd523jQr
 M7kYNbtW/JW/ge6OYVPXUOPNtDmjPk+rakT/9DylrVON8wIMaFfsAy2CenBoiq66ystd
 BNXg==
X-Gm-Message-State: AOAM531GP0Gt3Xqszl5MvS7olH5mSI2bs85PgV/EAC9SFQuZzEITuxzQ
 tdRuZ8WPZsbvAKOMcF/2PI2NovF80UXdFzoSx0cc5w==
X-Google-Smtp-Source: ABdhPJwVwI+beRyNROt8exrRQgNEvHs86Hx3oV68bhqvsD7BTOxR0V8T59gAO8IcOJcPKrXpG4G/QkWrTJpJ2QL3J3g=
X-Received: by 2002:a25:2157:: with SMTP id h84mr16135560ybh.425.1636534846170; 
 Wed, 10 Nov 2021 01:00:46 -0800 (PST)
MIME-Version: 1.0
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211109213847.GY174703@worktop.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 10 Nov 2021 10:00:35 +0100
Message-ID: <CAKfTPtC_A-_sfQ+rm440oHwd2gUZ222FMwsi-JTkyLPc-x0qrw@mail.gmail.com>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>, Anton Vorontsov <anton@enomsg.org>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 22:38, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 09, 2021 at 12:06:48PM -0800, Sultan Alsawaf wrote:
> > Hi,
> >
> > I encountered a printk deadlock on 5.13 which appears to still affect the latest
> > kernel. The deadlock occurs due to printk being used while having the current
> > CPU's runqueue locked, and the underlying framebuffer console attempting to lock
> > the same runqueue when printk tries to flush the log buffer.
>
> Yes, that's a known 'feature' of some consoles. printk() is in the
> process of being reworked to not call con->write() from the printk()
> calling context, which would go a long way towards fixing this.
>
> >   #27 [ffffc900005b8e28] enqueue_task_fair at ffffffff8129774a  <-- SCHED_WARN_ON(rq->tmp_alone_branch != &rq->leaf_cfs_rq_list);
> >   #28 [ffffc900005b8ec0] activate_task at ffffffff8125625d
> >   #29 [ffffc900005b8ef0] ttwu_do_activate at ffffffff81257943
> >   #30 [ffffc900005b8f28] sched_ttwu_pending at ffffffff8125c71f <-- locks this CPU's runqueue
> >   #31 [ffffc900005b8fa0] flush_smp_call_function_queue at ffffffff813c6833
> >   #32 [ffffc900005b8fd8] generic_smp_call_function_single_interrupt at ffffffff813c7f58
> >   #33 [ffffc900005b8fe0] __sysvec_call_function_single at ffffffff810f1456
> >   #34 [ffffc900005b8ff0] sysvec_call_function_single at ffffffff831ec1bc
> >   --- <IRQ stack> ---
> >   #35 [ffffc9000019fda8] sysvec_call_function_single at ffffffff831ec1bc
> >       RIP: ffffffff831ed06e  RSP: ffffed10438a6a49  RFLAGS: 00000001
> >       RAX: ffff888100d832c0  RBX: 0000000000000000  RCX: 1ffff92000033fd7
> >       RDX: 0000000000000000  RSI: ffff888100d832c0  RDI: ffffed10438a6a49
> >       RBP: ffffffff831ec166   R8: dffffc0000000000   R9: 0000000000000000
> >       R10: ffffffff83400e22  R11: 0000000000000000  R12: ffffffff831ed83e
> >       R13: 0000000000000000  R14: ffffc9000019fde8  R15: ffffffff814d4d9d
> >       ORIG_RAX: ffff88821c53524b  CS: 0001  SS: ef073a2
> >   WARNING: possibly bogus exception frame
> > ----------------------->8-----------------------
> >
> > The catalyst is that CONFIG_SCHED_DEBUG is enabled and the tmp_alone_branch
> > assertion fails (Peter, is this bad?).
>
> Yes, that's not good. IIRC Vincent and Michal were looking at that code
> recently.

Is it the same SCHED_WARN_ON(rq->tmp_alone_branch !=
&rq->leaf_cfs_rq_list); that generates the deadlock on v5.15 too ?

one remaining tmp_alone_branch warning has been fixed in v5.15 with
2630cde26711 ("sched/fair: Add ancestors of unthrottled undecayed cfs_rq")

>
> > I'm not sure what the *correct* solution is here (don't use printk while having
> > a runqueue locked? don't use schedule_work() from the fbcon path? tell printk
> > to use one of its lock-less backends?), so I've cc'd all the relevant folks.
>
> I'm a firm believer in early_printk serial consoles.
