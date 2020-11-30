Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307B2C8B28
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 18:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6D06E7D7;
	Mon, 30 Nov 2020 17:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF286E7D4;
 Mon, 30 Nov 2020 17:35:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23166016-1500050 for multiple; Mon, 30 Nov 2020 17:35:30 +0000
MIME-Version: 1.0
In-Reply-To: <9ccd22f4-875b-7ac8-253c-06aab009b3e4@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-125-matthew.auld@intel.com>
 <160648535829.2925.3905288434672946602@build.alporthouse.com>
 <9ccd22f4-875b-7ac8-253c-06aab009b3e4@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 124/162] drm/i915/lmem: allocate HWSP in
 lmem
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Mon, 30 Nov 2020 17:35:29 +0000
Message-ID: <160675772908.12351.6595786834675111791@build.alporthouse.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Michel Thierry <michel.thierry@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-30 17:17:16)
> On 27/11/2020 13:55, Chris Wilson wrote:
> > Quoting Matthew Auld (2020-11-27 12:06:40)
> >> From: Michel Thierry <michel.thierry@intel.com>
> > 
> > Rationale goes here.
> > 
> > Is this wise? HWSP is very frequently read by the CPU, and expected to
> > be cached on the CPU.
> > 
> > What do the performance profiles indicate?
> 
> Do you have a recommendation for an existing selftest or IGT to help 
> measure this?
> 
> Also are you suggesting moving this to system memory, or just using a 
> different mapping type, if it's placed in local memory? Or maybe try 
> both? Although I'm pretty sceptical about !wc for local memory.

A lot of worries go out of the window if this can be in system memory
and snooped.

For measuring, I suspect there is a lot of chaff that needs to be
removed before individual microbenchmarks like perf/request discern any
difference; although that would be a starting point. We do a lot of
completion checking during execlists interrupt processing, and there we
(cpu profiles at least) are sensitive to uncached reads.

We can trivially construct a benchmark that only shows the impact of the
WC reads; but the point where I think we would first notice from userspace
is client wakeup latency scaling: benchmarks/gem_latency, which was once
a point of major concern. Nowadays, we can couple that with a second
concern about inducing system latency from interrupt processing time.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
