Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5233E8544
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C9489BF3;
	Tue, 10 Aug 2021 21:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3442489B62;
 Tue, 10 Aug 2021 21:29:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202181227"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="202181227"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 14:29:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; d="scan'208";a="460533920"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 14:29:26 -0700
Date: Tue, 10 Aug 2021 21:29:25 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 10/46] drm/i915/guc: Take engine PM when a context is
 pinned with GuC submission
Message-ID: <20210810212925.GA198893@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-11-matthew.brost@intel.com>
 <YRE6bodEDhb6zj8M@phenom.ffwll.local>
 <20210809181137.GA123494@DUT151-ICLU.fm.intel.com>
 <YRIgJidfbYF0fkKU@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRIgJidfbYF0fkKU@phenom.ffwll.local>
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

On Tue, Aug 10, 2021 at 08:43:50AM +0200, Daniel Vetter wrote:
> On Mon, Aug 09, 2021 at 06:11:37PM +0000, Matthew Brost wrote:
> > On Mon, Aug 09, 2021 at 04:23:42PM +0200, Daniel Vetter wrote:
> > > On Tue, Aug 03, 2021 at 03:29:07PM -0700, Matthew Brost wrote:
> > > > Taking a PM reference to prevent intel_gt_wait_for_idle from short
> > > > circuiting while a scheduling of user context could be enabled.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/Makefile                 |  1 +
> > > >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
> > > >  2 files changed, 34 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > > > index 903de270f2db..5e3a1e2095b0 100644
> > > > --- a/drivers/gpu/drm/i915/Makefile
> > > > +++ b/drivers/gpu/drm/i915/Makefile
> > > > @@ -103,6 +103,7 @@ gt-y += \
> > > >  	gt/intel_gt_clock_utils.o \
> > > >  	gt/intel_gt_irq.o \
> > > >  	gt/intel_gt_pm.o \
> > > > +	gt/intel_gt_pm_unpark_work.o \
> > > 
> > > This file isn't here?
> > > 
> > 
> > Yep, included this in the wrong patch. Should be in:
> > https://patchwork.freedesktop.org/patch/448462/?series=92789&rev=2
> > 
> > > Also pm stuff tends to have very nasty locking requirements, doing special
> > > stuff like this in the backend tends to lead to really big surprises. I
> > > think two options to make sure our locking design stays consistent:
> > > - Lift this to generic code.
> > 
> > Not sure I'm following this, intel_engine_pm_get/put are generic calls.
> > Those calls should have all the correct annoations. If they don't we can
> > add them.
> 
> But you only call them in the GuC backend, not in all of them. Which is an
> inconsistency in locking, and unfortunately runtime pm is extremely nasty,
> so having potentially very divergent locking behind the same interface in
> the same driver is a recipe for an unmaintainable mess.
> 
> Iow, if the high-level code runs on execlist or the ringbuffer backend we
> still need to go through at least the lockdep motions of what you're
> adding here.
> 
> This is similar in spirit to all the might_sleep/might_lock calls we have
> all over the kernel where in many cases something doesn't happen, but we
> need to make sure it's allowed to have a consistent design.
> 
> So essentially in the intel_context_pin and all these functions put a
> intel_engine_pm_might_get (which compiles out without debugging enabled),
> unconditionally, across all platforms and sched backends.
> 

Ok, I see your point here. We currently don't have a
intel_engine_pm_might_get but I think this translates to roughly:

might_lock(engine_pm_wf_mutex)
intel_gt_pm_might_get

Will dig in a big a more and add the annotations to the next rev.

Matt

> In general I think backend specific locking (irrespective of what kind of
> backend or interface you implement) is a pretty bad idea in the kernel,
> and needs to be avoided if at all possible. Avoid here means "pull the
> might_lock/might_sleep/might_whatever checks into generic code".
> -Daniel
> 
> > Matt
> > 
> > > - expose some engine_pm_migt_get/put() calls which do have the right set
> > >   of might_lock annoations, and call those in the generic code.
> > > 
> > > Imo the worst kernel abstractions are those where all implementations
> > > look&act the same, except for locking. Unfortunately i915-gem code is full
> > > of this stuff, and we need to stop this by enlisting lockdep to check the
> > > contracts for us.
> > > -Daniel
> > > 
> > > >  	gt/intel_gt_pm_irq.o \
> > > >  	gt/intel_gt_requests.o \
> > > >  	gt/intel_gtt.o \
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index 7fe4d1559a81..c5d9548bfd00 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -2056,7 +2056,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
> > > >  
> > > >  static int guc_context_pin(struct intel_context *ce, void *vaddr)
> > > >  {
> > > > -	return __guc_context_pin(ce, ce->engine, vaddr);
> > > > +	int ret = __guc_context_pin(ce, ce->engine, vaddr);
> > > > +
> > > > +	if (likely(!ret && !intel_context_is_barrier(ce)))
> > > > +		intel_engine_pm_get(ce->engine);
> > > > +
> > > > +	return ret;
> > > >  }
> > > >  
> > > >  static void guc_context_unpin(struct intel_context *ce)
> > > > @@ -2067,6 +2072,9 @@ static void guc_context_unpin(struct intel_context *ce)
> > > >  
> > > >  	unpin_guc_id(guc, ce, true);
> > > >  	lrc_unpin(ce);
> > > > +
> > > > +	if (likely(!intel_context_is_barrier(ce)))
> > > > +		intel_engine_pm_put(ce->engine);
> > > >  }
> > > >  
> > > >  static void guc_context_post_unpin(struct intel_context *ce)
> > > > @@ -3002,8 +3010,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
> > > >  static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
> > > >  {
> > > >  	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> > > > +	int ret = __guc_context_pin(ce, engine, vaddr);
> > > > +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> > > > +
> > > > +	if (likely(!ret))
> > > > +		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> > > > +			intel_engine_pm_get(engine);
> > > >  
> > > > -	return __guc_context_pin(ce, engine, vaddr);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void guc_virtual_context_unpin(struct intel_context *ce)
> > > > +{
> > > > +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> > > > +	struct intel_engine_cs *engine;
> > > > +	struct intel_guc *guc = ce_to_guc(ce);
> > > > +
> > > > +	GEM_BUG_ON(context_enabled(ce));
> > > > +	GEM_BUG_ON(intel_context_is_barrier(ce));
> > > > +
> > > > +	unpin_guc_id(guc, ce, true);
> > > > +	lrc_unpin(ce);
> > > > +
> > > > +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> > > > +		intel_engine_pm_put(engine);
> > > >  }
> > > >  
> > > >  static void guc_virtual_context_enter(struct intel_context *ce)
> > > > @@ -3040,7 +3070,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
> > > >  
> > > >  	.pre_pin = guc_virtual_context_pre_pin,
> > > >  	.pin = guc_virtual_context_pin,
> > > > -	.unpin = guc_context_unpin,
> > > > +	.unpin = guc_virtual_context_unpin,
> > > >  	.post_unpin = guc_context_post_unpin,
> > > >  
> > > >  	.ban = guc_context_ban,
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
