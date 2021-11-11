Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9144D329
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 09:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307196E95A;
	Thu, 11 Nov 2021 08:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA816E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 08:28:03 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636619281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhZvEsWQota4q77s+urSnI/dc/KS4PVviHnz9T+ZBLI=;
 b=zxeCK3x2qPG1H0FI+d02YQKAzXvODf+N0FcmajK0bIiT8YksXK+jPHZUr7Fkt5Mg2OI1IU
 m3MHqGYDTcBazKiapSpDkUw8XEyrrij2XvCgNYrr8A4px09a2Usk1mK3l75kJjzg53s/03
 osCXpF71fnqT5SBQA1ZUCJkdMP71du3egG24JgIZ5+EYHp56OQTPWlQDmwqzkQRU6BTe6w
 aY7bVT8Wuzi9KSHnQplpL+pW4esIhhednxIDnttsR+xbrHS6xInlKOp8EFEpX0cJx4r+p3
 ITSc2lUk65ua42lYTvllKvP8YnO1906EZ9cA2UVKx7DwliS0PIEgErwSFPfpnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636619281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhZvEsWQota4q77s+urSnI/dc/KS4PVviHnz9T+ZBLI=;
 b=8olYsRkMhkQVAaV/05y5wam89kU1Av69szldbJaSE09rlzjgSzB6WcLdDEC0HqXeSstmKA
 vBAGvvTfgD+XjHCA==
To: Sultan Alsawaf <sultan@kerneltoast.com>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
In-Reply-To: <YYwlnEQO0raDwS86@sultan-box.localdomain>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <YYuS1uNhxWOEX1Ci@phenom.ffwll.local>
 <87fss4wcgm.fsf@jogness.linutronix.de>
 <YYwlnEQO0raDwS86@sultan-box.localdomain>
Date: Thu, 11 Nov 2021 09:34:00 +0106
Message-ID: <87k0hfqepb.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Anton Vorontsov <anton@enomsg.org>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-10, Sultan Alsawaf <sultan@kerneltoast.com> wrote:
> On Wed, Nov 10, 2021 at 11:13:37AM +0106, John Ogness wrote:
>> Even after we introduce kthread printers, there will still be
>> situations where direct printing is used: booting (before kthreads
>> exist) and shutdown/suspend/crash situations, when the kthreads may
>> not be active.
>
> Although I'm unaware of any ongoing kthread printer work, I'm curious
> to know how a kthread approach wouldn't employ a try_to_wake_up() from
> directly inside printk(), since the try_to_wake_up() hit from inside
> the fbcon code is what caused my deadlock.

The kthread approach triggers irq_work from printk(). The kthread
printer is then woken from the irq_work.

John Ogness
