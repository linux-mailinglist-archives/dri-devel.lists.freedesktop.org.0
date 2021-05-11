Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2B37AC1A
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 18:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721466EA77;
	Tue, 11 May 2021 16:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3135A6EA77;
 Tue, 11 May 2021 16:38:41 +0000 (UTC)
IronPort-SDR: /XEDCa+wo9sC5QDkoJjNbS9Q8T++13T5+ypvIh2tHWVWgB226C2ezBS037Ho4URROsGFKK7I+X
 /W6CM0uW4GGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220450286"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="220450286"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 09:38:36 -0700
IronPort-SDR: wel69u0HPrBWaxWOfvDLKn8R7TiRyS44Jo5PG3rY89Nve2xeLL8iGGsbEIbTSnAdvKVAQwKwRL
 P+v06AGhPvGA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="392365181"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 09:38:36 -0700
Date: Tue, 11 May 2021 09:31:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 49/97] drm/i915/guc: Disable engine barriers with GuC
 during unpin
Message-ID: <20210511163116.GA28103@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-50-matthew.brost@intel.com>
 <YJqk0pcx4JruoyXz@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJqk0pcx4JruoyXz@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 05:37:54PM +0200, Daniel Vetter wrote:
> On Thu, May 06, 2021 at 12:14:03PM -0700, Matthew Brost wrote:
> > Disable engine barriers for unpinning with GuC. This feature isn't
> > needed with the GuC as it disables context scheduling before unpinning
> > which guarantees the HW will not reference the context. Hence it is
> > not necessary to defer unpinning until a kernel context request
> > completes on each engine in the context engine mask.
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Instead of these ifs in the code, can we push this barrier business down
> into backends?
> 

Not a bad idea. This is an example of what I think of implict behavior of the
backend creeping into the higher levels.

> Not in this series, but as one of the things to sort out as part of the
> conversion to drm/scheduler.

Agree. After basic GuC submission gets merged maybe we go through the code and
remove all the implict backend assumptions.

Matt

> -Daniel
> 
> > ---
> >  drivers/gpu/drm/i915/gt/intel_context.c    |  2 +-
> >  drivers/gpu/drm/i915/gt/intel_context.h    |  1 +
> >  drivers/gpu/drm/i915/gt/selftest_context.c | 10 ++++++++++
> >  drivers/gpu/drm/i915/i915_active.c         |  3 +++
> >  4 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 1499b8aace2a..7f97753ab164 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -80,7 +80,7 @@ static int intel_context_active_acquire(struct intel_context *ce)
> >  
> >  	__i915_active_acquire(&ce->active);
> >  
> > -	if (intel_context_is_barrier(ce))
> > +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
> >  		return 0;
> >  
> >  	/* Preallocate tracking nodes */
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> > index 92ecbab8c1cd..9b211ca5ecc7 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> > @@ -16,6 +16,7 @@
> >  #include "intel_engine_types.h"
> >  #include "intel_ring_types.h"
> >  #include "intel_timeline_types.h"
> > +#include "uc/intel_guc_submission.h"
> >  
> >  #define CE_TRACE(ce, fmt, ...) do {					\
> >  	const struct intel_context *ce__ = (ce);			\
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
> > index 26685b927169..fa7b99a671dd 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> > @@ -209,7 +209,13 @@ static int __live_active_context(struct intel_engine_cs *engine)
> >  	 * This test makes sure that the context is kept alive until a
> >  	 * subsequent idle-barrier (emitted when the engine wakeref hits 0
> >  	 * with no more outstanding requests).
> > +	 *
> > +	 * In GuC submission mode we don't use idle barriers and we instead
> > +	 * get a message from the GuC to signal that it is safe to unpin the
> > +	 * context from memory.
> >  	 */
> > +	if (intel_engine_uses_guc(engine))
> > +		return 0;
> >  
> >  	if (intel_engine_pm_is_awake(engine)) {
> >  		pr_err("%s is awake before starting %s!\n",
> > @@ -357,7 +363,11 @@ static int __live_remote_context(struct intel_engine_cs *engine)
> >  	 * on the context image remotely (intel_context_prepare_remote_request),
> >  	 * which inserts foreign fences into intel_context.active, does not
> >  	 * clobber the idle-barrier.
> > +	 *
> > +	 * In GuC submission mode we don't use idle barriers.
> >  	 */
> > +	if (intel_engine_uses_guc(engine))
> > +		return 0;
> >  
> >  	if (intel_engine_pm_is_awake(engine)) {
> >  		pr_err("%s is awake before starting %s!\n",
> > diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> > index b1aa1c482c32..9a264898bb91 100644
> > --- a/drivers/gpu/drm/i915/i915_active.c
> > +++ b/drivers/gpu/drm/i915/i915_active.c
> > @@ -968,6 +968,9 @@ void i915_active_acquire_barrier(struct i915_active *ref)
> >  
> >  	GEM_BUG_ON(i915_active_is_idle(ref));
> >  
> > +	if (llist_empty(&ref->preallocated_barriers))
> > +		return;
> > +
> >  	/*
> >  	 * Transfer the list of preallocated barriers into the
> >  	 * i915_active rbtree, but only as proto-nodes. They will be
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
