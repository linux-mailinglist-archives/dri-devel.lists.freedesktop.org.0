Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C4C1CDE0D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 17:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5E86E4B1;
	Mon, 11 May 2020 15:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D86B6E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 15:03:10 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id o7so15356191oif.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7qV0qj2vY3QMnSRpzrXrBmdMrKIn2fose2w49TIcUwA=;
 b=a72v2AhlK0RMWvywkFLjZmfhzZvIhJmPEoTvBRAk/SnK/GdMXVYpYNlhlUjfan9HTI
 AYtNSsKZ6jFvdDP3utjWR5R1FanExkscDVG4oyyb4sjLyrHCghImpPzcEV6eLXWps7gE
 LW8KG+jisGg9a8JULKt2vAZ1gfNW/YVyhRCxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qV0qj2vY3QMnSRpzrXrBmdMrKIn2fose2w49TIcUwA=;
 b=SDMpEXwkz0vJ5a0d1rRx8bYQwB/krD/zcIWPif2UaZ6GgqCa5tK7w2VCm1y2M9TqFh
 vISDzFOnNz7STNX4TXeaIhoxlzYGEj7KjKKM1DqC28EOzPD8QyP7xHbiqafuf1EutqM0
 5dekDkT7AiLS2VqrQHj+XYvKQmR3l00BGUzpPn9yvNvpdcBatKE11ua7Gex/ztOkh0Q/
 XFLvYlTh3T2YtRmfbQUo7lMxDwbtUKTtraUl0RcWRg/dtgk3bzwGzzNBvJdMCOuMwDya
 k2JL84NEgTcDuEyscgPX18KDB+Rh3dKbSR7gYEKNJ4FBihH5Gfw18w5MmrkNLiw8QGdU
 98dA==
X-Gm-Message-State: AGi0Pubb8SKwrG1/0Ghve58YAhm+cMbfC7SfbhjpV5hqU1Hi/NkcuYa3
 nx8vEswr5K1Z3toT/cLtnlMDRFl6L4zrNyfg7a1+Vg==
X-Google-Smtp-Source: APiQypJyBxpFVBJJmxojQB9sRbIOUW8mGmPu1/0vDgQqL0jXLAatzNPx3bnAkXEfHiEEDH2+PiwShECoXmBHDelm2zs=
X-Received: by 2002:aca:52d5:: with SMTP id g204mr19998120oib.14.1589209389691; 
 Mon, 11 May 2020 08:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200508204751.155488-1-lyude@redhat.com>
 <20200508204751.155488-2-lyude@redhat.com>
 <20200511144935.GD16815@mtj.duckdns.org>
In-Reply-To: <20200511144935.GD16815@mtj.duckdns.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 11 May 2020 17:02:58 +0200
Message-ID: <CAKMK7uFDp_9SWUtMOfKaSLu3FNq5w=HWDo9FOeRsD204eR327g@mail.gmail.com>
Subject: Re: [RFC v4 01/12] kthread: Add kthread_queue_flush_work()
To: Tejun Heo <tj@kernel.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Liang Chen <cl@rock-chips.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 4:49 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, May 08, 2020 at 04:46:51PM -0400, Lyude Paul wrote:
> > +bool kthread_queue_flush_work(struct kthread_work *work,
> > +                           struct kthread_flush_work *fwork);
> > +void __kthread_flush_work_fn(struct kthread_work *work);
>
> As an exposed interface, this doesn't seem great. What the user wants to say
> is "wait for the current instance of this guy" and the interface is asking
> them to queue an extra work item whose queueing return state should be
> checked and depending on that result wait on its internal completion.
>
> I'm skeptical this is a good idea in general given that unless you define
> "this instance" at the time of queueing the work item which is being
> waited-upon, there's no way to guarantee that the instance you're queueing
> the flush work item on is the instance you want unless the queuer is holding
> external synchronization which prevents the instance from running. That's a
> really confusing semantics to expose in the interface.
>
> What the above means is that the ordering that you want is only defined
> through your own locking and that maybe suggests that the sequencing should
> be implemented on that side too. It may be a bit more code but a sequence
> counter + wait queue might be the better solution here.

Aside from this, flush_$stuff interfaces are very easy to deadlock.
That's why e.g. flush_work() for normal workqueues has lockdep
annotations (lockdep doesn't see through wait/wake_up dependencies
without some help because cross-release didn't land for real). So I
think if we need something like this, it needs to be a lot more
explicit, and come with the right lockdep annotations.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
