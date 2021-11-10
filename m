Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6844BE55
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39196EDE8;
	Wed, 10 Nov 2021 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 10 Nov 2021 10:14:49 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37026EDDD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:14:49 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1636538858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6H3iJsYLymZGZdTTPIwaF3WwOUQj7EWnfPhR6PY5oWA=;
 b=i97ffLNgZOCzWFBRclG7GYiqXi7MHOrZxbOXgJo0pTV9VaaVPhnG7NnoN6yM3YQF/vW6FC
 /3gyS9iBsC5urXBvXaYF49NEiCksYHVOTalS1S/1WP1VfMlkHIkSawA/Ap8njZ2dqksKpL
 LqdnqRoK4lkmtv0Nz56XOk+A2fQ6Qr/lejEAUjmBko0vER8YoFp+rdooaaLKYDMEXhtJoH
 jx7lE1sPblbEaXau0X5Qe99u1WmUZbWkd/MsTkgcxhkOaB1uhw+41/cBH3eVL3dFXAOQqw
 J6WbiaGNlGR9igGy7y9MoRYhexo0UfhlV76JID34cVRgrVSIGg+lt80o8j0N5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1636538858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6H3iJsYLymZGZdTTPIwaF3WwOUQj7EWnfPhR6PY5oWA=;
 b=ee6Y2TYLMpo7uGsr+qYoymWA2RnXgQ7bpfSm69n5Kv+JYUF4RpPSJ2gC9dckYjRQ6jAAGr
 HFIj1zE58dGl46AA==
To: Daniel Vetter <daniel@ffwll.ch>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
In-Reply-To: <YYuS1uNhxWOEX1Ci@phenom.ffwll.local>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain>
 <20211109213847.GY174703@worktop.programming.kicks-ass.net>
 <YYuS1uNhxWOEX1Ci@phenom.ffwll.local>
Date: Wed, 10 Nov 2021 11:13:37 +0106
Message-ID: <87fss4wcgm.fsf@jogness.linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Anton Vorontsov <anton@enomsg.org>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Petr Mladek <pmladek@suse.com>,
 Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 mkoutny@suse.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-11-10, Daniel Vetter <daniel@ffwll.ch> wrote:
> I'm a bit out of the loop but from lwn articles my understanding is
> that part of upstreaming from -rt we no longer have the explicit "I'm
> a safe console for direct printing" opt-in. Which I get from a
> backwards compat pov, but I still think for at least fbcon we really
> should never attempt a direct printk con->write, it's just all around
> terrible.

Right now we don't have an explicit "I'm a safe console for direct
printing" option. Right now all printing is direct. But it sounds to me
that we should add this console flag when we introduce kthread printers.

> So yeah for fbcon at least I think we really should throw out direct
> con->write from printk completely.

Even after we introduce kthread printers, there will still be situations
where direct printing is used: booting (before kthreads exist) and
shutdown/suspend/crash situations, when the kthreads may not be
active.

I will introduce a console flag so that consoles can opt-out for direct
printing. (opt-out rather than opt-in is probably easier, since there
are only a few that would need to opt-out).

Since kthread printers do not yet exist (hoping to get them in for
5.17), I am not sure how we should address the reported bug for existing
kernels.

John Ogness
