Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9293B0FD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 14:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627E810E6A0;
	Wed, 24 Jul 2024 12:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="fhVhrl9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D270710E6A7;
 Wed, 24 Jul 2024 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6J6/mCNap2U38NHjqHLrKE4y+Xj/p/3fvwoIUdiyQks=; b=fhVhrl9/nejY93MygJ055QBCdi
 ZIF736PfMqnvAuyabZN57XAf5Fqvlg8FjHxqkWjva739sISm6WP26aPl5jt/8Fwnu8B+bNS5Lim0Q
 RW8dni0aAHR33LU+zIaPhYrDz6HTOnFmqMo7quJV4+PWX1wDMkkmDuzNph1X8CB8MWTrJnF7FJsWv
 g5qWfIP+38/h4biPzaZjbQYa08Iz6ByEI4MjE436qg2kOFazACkY+c54oTCoOLVp7l2IEyONppfpc
 EGFG9MtYCsGnBv/0QAilWyTbziJpctvWxeNiYATTgx6rqGwgHl7yhRWKeLrfgsHnS6bYZxRNPGfNT
 8MlXJr6A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sWbIo-00000007pAr-2cMJ; Wed, 24 Jul 2024 12:41:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 36AAD3003EA; Wed, 24 Jul 2024 14:41:05 +0200 (CEST)
Date: Wed, 24 Jul 2024 14:41:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org,
 linux-perf-users@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] drm/i915/pmu: Lazy unregister
Message-ID: <20240724124105.GB13387@noisy.programming.kicks-ass.net>
References: <20240722210648.80892-1-lucas.demarchi@intel.com>
 <20240722210648.80892-7-lucas.demarchi@intel.com>
 <be3871bd-fc25-482e-b4d4-91afc4d5b5a5@ursulin.net>
 <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xsuzfv4rzb4c25sibt5gjskn7xyfwf33wgwaw4nkz5jlnvl2ke@ekur5xvhec3z>
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

On Tue, Jul 23, 2024 at 10:30:08AM -0500, Lucas De Marchi wrote:
> On Tue, Jul 23, 2024 at 09:03:25AM GMT, Tvrtko Ursulin wrote:
> > 
> > On 22/07/2024 22:06, Lucas De Marchi wrote:
> > > Instead of calling perf_pmu_unregister() when unbinding, defer that to
> > > the destruction of i915 object. Since perf itself holds a reference in
> > > the event, this only happens when all events are gone, which guarantees
> > > i915 is not unregistering the pmu with live events.
> > > 
> > > Previously, running the following sequence would crash the system after
> > > ~2 tries:
> > > 
> > > 	1) bind device to i915
> > > 	2) wait events to show up on sysfs
> > > 	3) start perf  stat -I 1000 -e i915/rcs0-busy/
> > > 	4) unbind driver
> > > 	5) kill perf
> > > 
> > > Most of the time this crashes in perf_pmu_disable() while accessing the
> > > percpu pmu_disable_count. This happens because perf_pmu_unregister()
> > > destroys it with free_percpu(pmu->pmu_disable_count).
> > > 
> > > With a lazy unbind, the pmu is only unregistered after (5) as opposed to
> > > after (4). The downside is that if a new bind operation is attempted for
> > > the same device/driver without killing the perf process, i915 will fail
> > > to register the pmu (but still load successfully). This seems better
> > > than completely crashing the system.
> > 
> > So effectively allows unbind to succeed without fully unbinding the
> > driver from the device? That sounds like a significant drawback and if
> > so, I wonder if a more complicated solution wouldn't be better after
> > all. Or is there precedence for allowing userspace keeping their paws on
> > unbound devices in this way?
> 
> keeping the resources alive but "unplunged" while the hardware
> disappeared is a common thing to do... it's the whole point of the
> drmm-managed resource for example. If you bind the driver and then
> unbind it while userspace is holding a ref, next time you try to bind it
> will come up with a different card number. A similar thing that could be
> done is to adjust the name of the event - currently we add the mangled
> pci slot.
> 
> That said, I agree a better approach would be to allow
> perf_pmu_unregister() to do its job even when there are open events. On
> top of that (or as a way to help achieve that), make perf core replace
> the callbacks with stubs when pmu is unregistered - that would even kill
> the need for i915's checks on pmu->closed (and fix the lack thereof in
> other drivers).
> 
> It can be a can of worms though and may be pushed back by perf core
> maintainers, so it'd be good have their feedback.

I don't think I understand the problem. I also don't understand drivers
much -- so that might be the problem.

So the problem appears to be that the device just disappears without
warning? How can a GPU go away like that?

Since you have a notion of this device, can't you do this stubbing you
talk about? That is, if your internal device reference becomes NULL, let
the PMU methods preserve the state like no-ops.

And then when the last event goes away, tear down the whole thing.

Again, I'm not sure I'm following.
