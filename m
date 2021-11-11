Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB2344D407
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 10:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859C96E9FE;
	Thu, 11 Nov 2021 09:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EF76E9FE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 09:27:10 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5B54C1FD29;
 Thu, 11 Nov 2021 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1636622827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pl6aAvDoTx6EdeF3PlSqs4c8bMd7axYmKzOYDsF5224=;
 b=En04iaVMWrZRqB7CcOMiYmOz7s7M5ASxSf/5/slytEjXMAyyLB7xo155L8gXz04268QjUf
 MqZSRmmG478bkrPYtZs4dne43QMHz+h6EDa8HvEIC1+X+Ao26+F2SQ0UwmFG33a0q06jiJ
 uBC5LH7JDN2wEmUYYqQGljwjQFsGyi0=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C9647A3B84;
 Thu, 11 Nov 2021 09:27:06 +0000 (UTC)
Date: Thu, 11 Nov 2021 10:27:06 +0100
From: Petr Mladek <pmladek@suse.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Anton Vorontsov <anton@enomsg.org>, Ben Segall <bsegall@google.com>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 David Airlie <airlied@linux.ie>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 John Ogness <john.ogness@linutronix.de>,
 Juri Lelli <juri.lelli@redhat.com>,
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tony Luck <tony.luck@intel.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, mkoutny@suse.com
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <YYzh6rxX6tY8/d+L@alley>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <YYuS1uNhxWOEX1Ci@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYuS1uNhxWOEX1Ci@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 2021-11-10 10:37:26, Daniel Vetter wrote:
> On Tue, Nov 09, 2021 at 10:38:47PM +0100, Peter Zijlstra wrote:
> > On Tue, Nov 09, 2021 at 12:06:48PM -0800, Sultan Alsawaf wrote:
> > > Hi,
> > > 
> > > I encountered a printk deadlock on 5.13 which appears to still affect the latest
> > > kernel. The deadlock occurs due to printk being used while having the current
 > > > CPU's runqueue locked, and the underlying framebuffer console attempting to lock
> > > the same runqueue when printk tries to flush the log buffer.
> > 
> > Yes, that's a known 'feature' of some consoles. printk() is in the
> > process of being reworked to not call con->write() from the printk()
> > calling context, which would go a long way towards fixing this.
> 
> And it's getting worse by the year:
> - direct scanout displays (i.e. just a few mmio writes and it will show
>   up) are on the way out at least in laptops, everyone gets self-refresh
>   (dp psr) under software control, so without being able to kick a kthread
>   off nothing shows up except more oopses

printk() tries to avoid this problem by waking processes via
irq_vork(). For example, it is used for waking userspace log
daemons, see wake_up_klogd().

There is one hidden wake_up_process() in up() of @console_sem.
It is "less" critical because it calls the wake_up() only when
there is another process waiting for console_lock(). It must
be a non-printk caller because printk() uses trylock and does
not add waiters. So, there is a non-trivial chance to avoid
the deadlock and the messages.

I wonder if fbdev might use the same trick.

> - because of the impendence mismatch between fbdev and drm-kms we even go
>   ever more this direction for dumb framebuffers, including the firmware
>   boot-up framebuffer simpledrm. This could perhaps be fixed with a new
>   dedicate console driver directly on top of drm-kms, but that's on the
>   wishlist for years and I don't see anyone typing that.
> 
> So yeah for fbcon at least I think we really should throw out direct
> con->write from printk completely.

Yup, that would be great.

Well, I guess that it would be available only for a panic mode when it
will not race with other users?

Best Regards,
Petr
