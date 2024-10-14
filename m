Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE499D750
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 21:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F1210E4B0;
	Mon, 14 Oct 2024 19:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="eYN2letm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ADE10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KbqNdN2Y5HnLjsHleGHb9I+pHDMIFEfOOXdWTLleOyI=; b=eYN2letm418fcZiIF65uMquWvb
 R0KLEgeRSkwzeA3ZJlC8gArHw7qAdWi7vGWHZ3qM/Y+P6S4avLoPMr75+oe242O3Q/2C+TGa2yYON
 GJLwBy4u3OrSjKqyNe+0WYLSJG08ZVpb4AMl7V2rAiNU6uQs2T7Od0PWvu9Ek3FxGjb1/zuVfWyI2
 HZF9rwgRYGDgT1Mm/IsXANR8IrKunRiAiZ8EOkoefWAd2wbH+2BZRV/UiIh4Be74vmvYA4zKfLfMq
 EdGDdk5jQVklL5DeNsvziYwTOUL4dwnR6lH4GHf+CBnw1qB6rQfDT7LywxMwL9ujLiFzr0Ff/v1zX
 DIfsshBg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t0Qgx-00000002ZWn-447K; Mon, 14 Oct 2024 19:25:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 503D13004AF; Mon, 14 Oct 2024 21:25:19 +0200 (CEST)
Date: Mon, 14 Oct 2024 21:25:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <20241014192519.GN16066@noisy.programming.kicks-ass.net>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
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

On Mon, Oct 14, 2024 at 01:20:34PM -0500, Lucas De Marchi wrote:
> On Mon, Oct 14, 2024 at 07:32:46PM +0200, Peter Zijlstra wrote:

> > I'm confused.. probably because I still don't have any clue about
> > drivers and the above isn't really telling me much either.
> > 
> > I don't see how you get rid of the try_module_get() we do per event;
> > without that you can't unload the module.
> 
> I don't get rid of the try_module_get(). They serve diffeerent purposes.
> Having a reference to the module prevents the _module_ going away (and
> hence the function pointers we call into from perf). It doesn't prevent
> the module unbinding from the HW.  A module may have N instances if it's
> bound to N devices.
> 
> This can be done today to unbind the HW (integrated graphics) from the
> i915 module:
> 
> 	# echo 0000:00:02.0 > /sys/bus/pci/drivers/i915/unbind
> 
> The ref taken by these new get()/put() are related to preventing the
> data going away - the driver can use that to take a ref on something
> that will survive the unbind.

OK, for some reason I thought to remember that you wanted to be able to
unload the module too.

> > And I don't see how you think it is safe to free a pmu while there are
> > still events around.
> 
> so, we don't actually free it - the pmu is unregistered but the
> `struct pmu` and (possibly) its container are still around after unregister.
> When the get/put are used, the driver can keep the data around, which is
> then free'd when the last reference is put.

Aaaaah, okay. So the implementation knows to nop out all device
interaction when it gets unbound, but the events and pmu data stick
around until they're naturally killed off?

Ah, reading the below patches that is indeed what i915 does. pmu->closed
makes this so.

The dummy thing you posted in this thread, does perf_event_disable() on
all previously created events, and this is not sound. Userspace can do
PERF_EVENT_IOC_ENABLE on them and then things will go side-ways fast.
And I was afraid i915 was doing this same.

> - Subject: [PATCH 3/8] drm/i915/pmu: Fix crash due to use-after-free

So reading that Changelog, you would like a replacement for pmu->closed
as well.

I suppose, one way to go about doing this is to have
perf_pmu_unregister() replace a bunch of methods. Notably you have
pmu->closed in:

  - event_init()
  - read()
  - start()
  - stop()
  - add()

Having perf_pmu_unregister() overwrite those function pointers with
something akin to your pmu->closed would go a long way, right? It would
require using READ_ONCE() for calling the methods, which would make
things a little ugly :/

But I also think we want to force all the events into STATE_ERROR, and
I'm not immediately sure how best to go about doing that. Adding better
return value handling to ->add() is trivial enough, and perhaps calling
perf_pmu_resched() is sufficient to cycle everything.

Let me ponder that a little bit.

