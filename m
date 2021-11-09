Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9219C44B4DB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 22:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6086E893;
	Tue,  9 Nov 2021 21:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D6D6E893
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 21:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hfoJ3mdhOp2wVVmk0izPdp4ZzIGt68u9ejlAidoV8lo=; b=db9/rIn0TZoh+TBuGUP9/OW5of
 PycxW9RB/VkwZeSGcorbwmwTqYGld7zd3DS/IPxU16pe9s9iyIHJr/k1URpNf9gxLrKkr29kSbdrK
 BEs6GVFVPRpx6n6Zyg1Kq0gKncfBo0putXZJKcGzKwlxUJIhxefx9QUJi2LrgrBcTBQcLQ5fJWaET
 U1ilvDKABydsQFPJ63NP1hJE2tfaK+X+LRz9UaROBzo1e1zCPPpYzx7sXtWYX86hcEe6nT6mzEwIG
 piMU7RNEwMe5tDPoEdh0F360CFIQLSl16Eg40x4UKOe4yOJgypGi+uJOb5NR0KOmXEay5AdgNuFVe
 X9sx/Sdw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkYpL-00F8sM-M5; Tue, 09 Nov 2021 21:38:48 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3A03F9862D2; Tue,  9 Nov 2021 22:38:47 +0100 (CET)
Date: Tue, 9 Nov 2021 22:38:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <20211109213847.GY174703@worktop.programming.kicks-ass.net>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Anton Vorontsov <anton@enomsg.org>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 12:06:48PM -0800, Sultan Alsawaf wrote:
> Hi,
> 
> I encountered a printk deadlock on 5.13 which appears to still affect the latest
> kernel. The deadlock occurs due to printk being used while having the current
> CPU's runqueue locked, and the underlying framebuffer console attempting to lock
> the same runqueue when printk tries to flush the log buffer.

Yes, that's a known 'feature' of some consoles. printk() is in the
process of being reworked to not call con->write() from the printk()
calling context, which would go a long way towards fixing this.

>   #27 [ffffc900005b8e28] enqueue_task_fair at ffffffff8129774a  <-- SCHED_WARN_ON(rq->tmp_alone_branch != &rq->leaf_cfs_rq_list);
>   #28 [ffffc900005b8ec0] activate_task at ffffffff8125625d
>   #29 [ffffc900005b8ef0] ttwu_do_activate at ffffffff81257943
>   #30 [ffffc900005b8f28] sched_ttwu_pending at ffffffff8125c71f <-- locks this CPU's runqueue
>   #31 [ffffc900005b8fa0] flush_smp_call_function_queue at ffffffff813c6833
>   #32 [ffffc900005b8fd8] generic_smp_call_function_single_interrupt at ffffffff813c7f58
>   #33 [ffffc900005b8fe0] __sysvec_call_function_single at ffffffff810f1456
>   #34 [ffffc900005b8ff0] sysvec_call_function_single at ffffffff831ec1bc
>   --- <IRQ stack> ---
>   #35 [ffffc9000019fda8] sysvec_call_function_single at ffffffff831ec1bc
>       RIP: ffffffff831ed06e  RSP: ffffed10438a6a49  RFLAGS: 00000001
>       RAX: ffff888100d832c0  RBX: 0000000000000000  RCX: 1ffff92000033fd7
>       RDX: 0000000000000000  RSI: ffff888100d832c0  RDI: ffffed10438a6a49
>       RBP: ffffffff831ec166   R8: dffffc0000000000   R9: 0000000000000000
>       R10: ffffffff83400e22  R11: 0000000000000000  R12: ffffffff831ed83e
>       R13: 0000000000000000  R14: ffffc9000019fde8  R15: ffffffff814d4d9d
>       ORIG_RAX: ffff88821c53524b  CS: 0001  SS: ef073a2
>   WARNING: possibly bogus exception frame
> ----------------------->8-----------------------
> 
> The catalyst is that CONFIG_SCHED_DEBUG is enabled and the tmp_alone_branch
> assertion fails (Peter, is this bad?).

Yes, that's not good. IIRC Vincent and Michal were looking at that code
recently.

> I'm not sure what the *correct* solution is here (don't use printk while having
> a runqueue locked? don't use schedule_work() from the fbcon path? tell printk
> to use one of its lock-less backends?), so I've cc'd all the relevant folks.

I'm a firm believer in early_printk serial consoles.
