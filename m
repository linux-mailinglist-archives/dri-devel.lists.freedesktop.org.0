Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3044BF0F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB416EE9F;
	Wed, 10 Nov 2021 10:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3A86EE9F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:50:44 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A2F1221B13;
 Wed, 10 Nov 2021 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1636541442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HO47rCdGhejVyJEgjF3SBkyM6/8hcrmcNNntgOspooM=;
 b=qMYeTxwU4cq63Q3OW+UKg5QF2lysxwlTmwJqWixHqqENUO4b7wMGaNPHKAxr4Wj7BAW3fz
 jJOWsgoGaDc+mFW5E8ZcK4HByJMKjHuGclCKi/pVQQUsYSc6CIvMleBaN9zM7reHFRcL7z
 6HvQY8mRhBmazXg5zzWpszlEwRpeD3I=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2F76DA3B83;
 Wed, 10 Nov 2021 10:50:42 +0000 (UTC)
Date: Wed, 10 Nov 2021 11:50:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <YYuj/rT+EO3K0LsK@alley>
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
 Anton Vorontsov <anton@enomsg.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Kees Cook <keescook@chromium.org>, John Ogness <john.ogness@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 2021-11-09 12:06:48, Sultan Alsawaf wrote:
> Hi,
> 
> I encountered a printk deadlock on 5.13 which appears to still affect the latest
> kernel. The deadlock occurs due to printk being used while having the current
> CPU's runqueue locked, and the underlying framebuffer console attempting to lock
> the same runqueue when printk tries to flush the log buffer.
> 
> I'm not sure what the *correct* solution is here (don't use printk while having
> a runqueue locked? don't use schedule_work() from the fbcon path? tell printk
> to use one of its lock-less backends?), so I've cc'd all the relevant folks.

At the moment, printk_deferred() could be used here. It defers the
console handling via irq_work().

There is no deferred variant for WARN() at the moment. The following
might work:

#define WARN_DEFERRED(condition, format...) ({		\
	unsigned long flags;				\
							\
	printk_safe_enter_irqsave(flags);		\
	WARN(condition, format...)			\
	printk_safe_exit_irqrestore(flags);		\
})

, where printk_safe_enter_irqsave()/printk_safe_exit_irqrestore(flags)
  are currently used only internally by printk() code and defined
  in the local kernel/printk/internal.h


Be ware that using the deferred variants is a whack a mole approach.
There are many printk() callers that might be called indirectly
and eventually cause deadlocks.

As already said, the plan is to upstream -rt solution and offload
the console work into kthreads. But it goes slowly. We want to
make it a clean way and prevent regressions as much as possible.

Best Regards,
Petr
