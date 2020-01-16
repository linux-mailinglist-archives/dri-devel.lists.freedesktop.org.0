Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134013DCD7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C566ED1E;
	Thu, 16 Jan 2020 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C6D6ED1E;
 Thu, 16 Jan 2020 14:01:24 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19901846-1500050 for multiple; Thu, 16 Jan 2020 14:01:21 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>, David Laight <David.Laight@ACULAB.COM>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <90de9ae911dc481f9c2c62e196b2bacf@AcuMS.aculab.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
 <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
 <157916041994.14122.8524532515240369595@skylake-alporthouse-com>
 <8f6b9daa2af342a79137064203255242@AcuMS.aculab.com>
 <157917771007.2795.953028640868055754@skylake-alporthouse-com>
 <90de9ae911dc481f9c2c62e196b2bacf@AcuMS.aculab.com>
Message-ID: <157918327903.2795.11869462469060447820@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: RE: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Date: Thu, 16 Jan 2020 14:01:19 +0000
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting David Laight (2020-01-16 13:58:44)
> From: Chris Wilson <chris@chris-wilson.co.uk>
> > Sent: 16 January 2020 12:29
> > 
> > Quoting David Laight (2020-01-16 12:26:45)
> > > However there is a call from __i915_gem_objet_set_pages() that
> > > is preceded by a lockdep_assert_held() check - so mustn't sleep.
> > 
> > That is a mutex; it's allowed to sleep. The might_sleep() here should
> > help assuage your fears.
> 
> Gah. Having a mutex called mm.lock isn't entirely obvious when quickly
> reading code.
> 
> From what I was reading earlier it seems that clflush() (and cflushopt)
> are fast (well not stupidly slow) for buffers under 4k.
> I suspect then can do a 'mark pending', but for larger buffers have to
> wait for earlier requests to complete (although the graph carries on
> increasing to the 16k RH margin.
> 
> If may well be that adding a cond_resched() after every 4k page
> will have ~0 performance impact because the first few clflush
> will be a bit faster (less slow).
> 
> I'll do some measurements later this afternoon.
> 
> FWIW does this code need to actually invalidate the cache lines?
> Or is it just forcing a writeback?

It is used for both.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
