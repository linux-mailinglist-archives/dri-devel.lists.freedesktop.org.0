Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B89337906
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 17:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5203B6EE52;
	Thu, 11 Mar 2021 16:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7651A6EE4E;
 Thu, 11 Mar 2021 16:17:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 24077948-1500050 for multiple; Thu, 11 Mar 2021 16:17:34 +0000
MIME-Version: 1.0
In-Reply-To: <YEo+6uvS7d0hh6nz@phenom.ffwll.local>
References: <20210305170546.56472-1-jason.ekstrand@intel.com>
 <YEo+6uvS7d0hh6nz@phenom.ffwll.local>
Subject: Re: [Intel-gfx] [PATCH] Revert "drm/i915: Propagate errors on
 awaiting already signaled fences"
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 11 Mar 2021 16:17:32 +0000
Message-ID: <161547945293.13836.11463967700367944674@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-03-11 16:01:46)
> On Fri, Mar 05, 2021 at 11:05:46AM -0600, Jason Ekstrand wrote:
> > This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
> > since that commit, we've been having issues where a hang in one client
> > can propagate to another.  In particular, a hang in an app can propagate
> > to the X server which causes the whole desktop to lock up.
> > 
> > Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
> > Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> > Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
> 
> Yeah I suggested to just go with the revert, so I guess on my to give you
> the explainer to be added to the commit message.

If you took the patch this was copied from and only revert on the
dma-resv, things do not break horribly.

> Error propagation along fences sound like a good idea, but as your bug
> shows, surprising consequences, since propagating errors across security
> boundaries is not a good thing.
> 
> What we do have is track the hangs on the ctx, and report information to
> userspace using RESET_STATS.

And by the fence, which is far more precise.

> That's how arb_robustness works. Also, if my
> understanding is still correct, the EIO from execbuf is when your context
> is banned (because not recoverable or too many hangs). And in all these
> cases it's up to userspace to figure out what is all impacted and should
> be reported to the application, that's not on the kernel to guess and
> automatically propagate.
> 
> What's more, we're also building more features on top of ctx error
> reporting with RESET_STATS ioctl: Encrypted buffers use the same, and the
> userspace fence wait also relies on that mechanism. So it is the path
> going forward for reporting gpu hangs and resets to userspace.

That ioctl is not a solid basis, it never did quite work as expected and
we kept realising the limitations of the information and the accuracy
that it could report.
 
> So all together that's why I think we should just bury this idea again as
> not quite the direction we want to go to, hence why I think the revert is
> the right option here.

No, as shown by igt it's a critical issue that we have to judicially
chose which errors to ignore. And it's not just the ability to subvert
gen7 and gen9, it's the error tracking employed for preempting contexts
among others.  Hence go with the original patch to undo the propagation
along dma-resv.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
