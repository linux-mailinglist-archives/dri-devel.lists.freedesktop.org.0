Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409F93E9702
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 19:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374276E192;
	Wed, 11 Aug 2021 17:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF136E190;
 Wed, 11 Aug 2021 17:47:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="194771489"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="194771489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 10:47:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="676213708"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 10:47:06 -0700
Date: Wed, 11 Aug 2021 17:47:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 11/46] drm/i915/guc: Don't call
 switch_to_kernel_context with GuC submission
Message-ID: <20210811174705.GA297117@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-12-matthew.brost@intel.com>
 <YRE7NTxl0RIY7EbG@phenom.ffwll.local>
 <20210809182051.GA123521@DUT151-ICLU.fm.intel.com>
 <YRIg7nkYE5/tjxx7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRIg7nkYE5/tjxx7@phenom.ffwll.local>
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

On Tue, Aug 10, 2021 at 08:47:10AM +0200, Daniel Vetter wrote:
> On Mon, Aug 09, 2021 at 06:20:51PM +0000, Matthew Brost wrote:
> > On Mon, Aug 09, 2021 at 04:27:01PM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 03, 2021 at 03:29:08PM -0700, Matthew Brost wrote:
> > > > Calling switch_to_kernel_context isn't needed if the engine PM reference
> > > > is taken while all contexts are pinned. By not calling
> > > > switch_to_kernel_context we save on issuing a request to the engine.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gt/intel_engine_pm.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > > index 1f07ac4e0672..58099de6bf07 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> > > > @@ -162,6 +162,10 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
> > > >  	unsigned long flags;
> > > >  	bool result = true;
> > > >  
> > > > +	/* No need to switch_to_kernel_context if GuC submission */
> > > 
> > > Maybe whack a big FIXME on here that we should unravel this properly.
> > 
> > Sure, can add a FIXME here.
> > 
> > > Currently the execlist backend assumptions are leaked all over the place,
> > > leading to stuff like this. Which means extremely fragile code.
> > >
> > 
> > Yes, this something required for execlists implemented in what should be
> > generic code. 
> > 
> > > I currently don't have a great idea on how exactly we should do that, but
> > > oh well.
> > 
> > Me either, it will be a process.
> > 
> > > 
> > > btw just in case we ever want to make guc lrc properly evictable (which as
> > > the og use-case for this function, way, way back), would we need to fully
> > 
> > Can you explain what you mean by fully evictable? Not getting what you
> > mean in this context.
> > 
> > > unregister them from guc? At least I'm assuming there's no other trick
> > 
> > If scheduling is disabled on the context (currently done on unpin) you are
> > free move anything around as the GuC is guaranteed not to touch the
> > context state. If on re-pin something has moved (e.g. the LRC vaddr is
> > different), you need to unregister and re-register the context with the
> > GuC.
> 
> So at that point GuC also guarantees that it's not left in the hw engine?
> Execlist has this barrier request to fully unload the ctx from the hw, and
> that's also why I cam on the topic of OA.
> 
> > > like the below one.
> > > 
> > > Another aside: How does the perf/OA patching work on GuC?
> > >
> > 
> > Not my area of expertise but perf somewhat a WIP. The plan is for the
> > GuC to write out some stats to HWSP I think? John Harrison is working to
> > get this fully implemented.
> > 
> > OA is working afaik, with Umesh Nerlige Ramappa being the expert here.
> 
> I think it's OA that I'm thinking of here: We have code in i915_perf.c to
> patch all the ctx currently in the system, so that they have a consistent
> OA config. That's also relying on this barrier stuff, and I was wondering
> how that will work with GuC.
> -Daniel
> 

Not an OA expert at all but glanced at the code I don't see anything in
there that prevents it working with GuC submission. We certainly have
this working internally. If you have questions about this I'd reach out to
Umesh Nerlige Ramappa as he likely has the answers.

Matt

> > 
> > Matt
> > 
> > > Anyway, patch looks legit:
> > > 
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > 
> > > 
> > > > +	if (intel_engine_uses_guc(engine))
> > > > +		return true;
> > > > +
> > > >  	/* GPU is pointing to the void, as good as in the kernel context. */
> > > >  	if (intel_gt_is_wedged(engine->gt))
> > > >  		return true;
> > > > -- 
> > > > 2.28.0
> > > > 
> > > 
> > > -- 
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
