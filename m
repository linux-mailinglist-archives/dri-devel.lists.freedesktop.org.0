Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45413D521
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 08:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7305D6EC15;
	Thu, 16 Jan 2020 07:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75606EC0D;
 Thu, 16 Jan 2020 07:40:27 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19896700-1500050 for multiple; Thu, 16 Jan 2020 07:40:22 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
 <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
Message-ID: <157916041994.14122.8524532515240369595@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Date: Thu, 16 Jan 2020 07:40:19 +0000
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
Cc: intel-gfx@lists.freedesktop.org, David Laight <David.Laight@aculab.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-01-16 06:52:42)
> On Wed, Jan 15, 2020 at 08:52:45PM +0000, Chris Wilson wrote:
> > Since we may try and flush the cachelines associated with large buffers
> > (an 8K framebuffer is about 128MiB, even before we try HDR), this leads
> > to unacceptably long latencies (when using a voluntary CONFIG_PREEMPT).
> > If we call cond_resched() between each sg chunk, that it about every 128
> > pages, we have a natural break point in which to check if the process
> > needs to be rescheduled. Naturally, this means that drm_clflush_sg() can
> > only be called from process context -- which is true at the moment. The
> > other clflush routines remain usable from atomic context.
> > 
> > Even though flushing large objects takes a demonstrable amount to time
> > to flush all the cachelines, clflush is still preferred over a
> > system-wide wbinvd as the latter has unpredictable latencies affecting
> > the whole system not just the local task.
> > 
> > Reported-by: David Laight <David.Laight@ACULAB.COM>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: David Laight <David.Laight@ACULAB.COM>
> 
> The original bug report is complaining about latencies for SCHED_RT
> threads, on a system that doesn't even use CONFIG_PREEMPT. I'm not sure
> it's terribly valid to cater to that use-case - all the desktop distros
> seem a lot more reasonable. So firmly *shrug* from my side ...

Yeah, I had the same immediate response to the complaint), but otoh we've
inserted cond_resched() before when it looks like may consume entire
jiffies inside a loop. At the very minimum, we should have a
might_sleep() here and a reminder that this can be very slow (remember
byt?).
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
