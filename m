Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2B61DED1
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 22:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FD110E0F7;
	Sat,  5 Nov 2022 21:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD2210E0F7;
 Sat,  5 Nov 2022 21:45:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8A73FCE069C;
 Sat,  5 Nov 2022 21:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BDDC433D6;
 Sat,  5 Nov 2022 21:45:44 +0000 (UTC)
Date: Sat, 5 Nov 2022 17:45:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4a 00/38] timers: Use timer_shutdown*() before freeing
 timers
Message-ID: <20221105174542.21bd7e86@rorschach.local.home>
In-Reply-To: <CAHk-=wjkkomrdcrAxxFijs-Lih6vHze+A2TgM+v7-Z7ZkXT+WA@mail.gmail.com>
References: <20221105060024.598488967@goodmis.org>
 <CAHk-=wi95dGkg7DiuOZ27gGW+mxJipn9ykB6LHB-HrbbLG6OMQ@mail.gmail.com>
 <20221105123642.596371c7@rorschach.local.home>
 <Y2bPlllkHo5DUmLY@zx2c4.com>
 <CAHk-=wjkkomrdcrAxxFijs-Lih6vHze+A2TgM+v7-Z7ZkXT+WA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-staging@lists.linux.dev,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-leds@vger.kernel.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 lvs-devel@vger.kernel.org, linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 bridge@lists.linux-foundation.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org, cgroups@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-parisc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linaro-mm-sig@lists.linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 5 Nov 2022 14:13:14 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> And trying "when != ptr->timer" actually does the right thing in that
> it gets rid of the case where the timer is modified outside of the
> del_timer() case, *but* it also causes odd other changes to the
> output.
> 
> Look at what it generates for that
> 
>    drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> 
> file, which finds a lot of triggers with the "when !=  ptr->timer",
> but only does one without it.

I added an expression, and it appears to work:

At least for this case.

@@
expression E;
identifier ptr, timer, rfield, slab;
@@
(
-       del_timer(&ptr->timer);
+       timer_shutdown(&ptr->timer);
|
-       del_timer_sync(&ptr->timer);
+       timer_shutdown_sync(&ptr->timer);
)
  ... when != ptr->timer.function = E;
(
        kfree_rcu(ptr, rfield);
|
        kmem_cache_free(slab, ptr);
|
        kfree(ptr);
)

Now I need to add return and goto cases here.

-- Steve
