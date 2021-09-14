Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B540A263
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 03:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB66E30D;
	Tue, 14 Sep 2021 01:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B0C6E301;
 Tue, 14 Sep 2021 01:17:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285531604"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285531604"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 18:17:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="551981340"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 18:17:11 -0700
Date: Mon, 13 Sep 2021 18:12:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 06/27] drm/i915/guc: Take engine PM when a
 context is pinned with GuC submission
Message-ID: <20210914011211.GA14967@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-7-matthew.brost@intel.com>
 <a741a93f-7a23-6188-1455-beff457d6189@intel.com>
 <20210910004142.GA36638@jons-linux-dev-box>
 <07d15bba-998c-bd03-e0e9-88394053b610@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07d15bba-998c-bd03-e0e9-88394053b610@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 13, 2021 at 03:26:29PM -0700, John Harrison wrote:
> On 9/9/2021 17:41, Matthew Brost wrote:
> > On Thu, Sep 09, 2021 at 03:46:43PM -0700, John Harrison wrote:
> > > On 8/20/2021 15:44, Matthew Brost wrote:
> > > > Taking a PM reference to prevent intel_gt_wait_for_idle from short
> > > > circuiting while a scheduling of user context could be enabled.
> > > As with earlier PM patch, needs more explanation of what the problem is and
> > > why it is only now a problem.
> > > 
> > > 
> > Same explaination, will add here.
> > 
> > > > v2:
> > > >    (Daniel Vetter)
> > > >     - Add might_lock annotations to pin / unpin function
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/i915/gt/intel_context.c       |  3 ++
> > > >    drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 15 ++++++++
> > > >    drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
> > > >    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
> > > >    drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
> > > >    5 files changed, 73 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > > > index c8595da64ad8..508cfe5770c0 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > > > @@ -240,6 +240,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
> > > >    	if (err)
> > > >    		goto err_post_unpin;
> > > > +	intel_engine_pm_might_get(ce->engine);
> > > > +
> > > >    	if (unlikely(intel_context_is_closed(ce))) {
> > > >    		err = -ENOENT;
> > > >    		goto err_unlock;
> > > > @@ -313,6 +315,7 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub)
> > > >    		return;
> > > >    	CE_TRACE(ce, "unpin\n");
> > > > +	intel_engine_pm_might_put(ce->engine);
> > > >    	ce->ops->unpin(ce);
> > > >    	ce->ops->post_unpin(ce);
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> > > > index 17a5028ea177..3fe2ae1bcc26 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> > > > @@ -9,6 +9,7 @@
> > > >    #include "i915_request.h"
> > > >    #include "intel_engine_types.h"
> > > >    #include "intel_wakeref.h"
> > > > +#include "intel_gt_pm.h"
> > > >    static inline bool
> > > >    intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
> > > > @@ -31,6 +32,13 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
> > > >    	return intel_wakeref_get_if_active(&engine->wakeref);
> > > >    }
> > > > +static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
> > > > +{
> > > > +	if (!intel_engine_is_virtual(engine))
> > > > +		intel_wakeref_might_get(&engine->wakeref);
> > > Why doesn't this need to iterate through the physical engines of the virtual
> > > engine?
> > > 
> > Yea, technically it should. This is just an annotation though to check
> > if we do something horribly wrong in our code. If we use any physical
> > engine in our stack this annotation should pop and we can fix it. I just
> > don't see what making this 100% correct for virtual engines buys us. If
> > you want I can fix this but thinking the more complex we make this
> > annotation the less likely it just gets compiled out with lockdep off
> > which is what we are aiming for.
> But if the annotation is missing a fundamental lock then it is surely not
> actually going to do any good? Not sure if you need to iterate over all
> child engines + parent but it seems like you should be calling might_lock()
> on at least one engine's mutex to feed the lockdep annotation.
> 

These are all inline functions so the compiler to be able to compile
this out if lockdep is disabled. I'll fix this in the next rev.

Matt 

> John.
> 
> > Matt
> > 
> > > John.
> > > 
> > > > +	intel_gt_pm_might_get(engine->gt);
> > > > +}
> > > > +
> > > >    static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
> > > >    {
> > > >    	intel_wakeref_put(&engine->wakeref);
> > > > @@ -52,6 +60,13 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
> > > >    	intel_wakeref_unlock_wait(&engine->wakeref);
> > > >    }
> > > > +static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
> > > > +{
> > > > +	if (!intel_engine_is_virtual(engine))
> > > > +		intel_wakeref_might_put(&engine->wakeref);
> > > > +	intel_gt_pm_might_put(engine->gt);
> > > > +}
> > > > +
> > > >    static inline struct i915_request *
> > > >    intel_engine_create_kernel_request(struct intel_engine_cs *engine)
> > > >    {
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> > > > index a17bf0d4592b..3c173033ce23 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> > > > @@ -31,6 +31,11 @@ static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
> > > >    	return intel_wakeref_get_if_active(&gt->wakeref);
> > > >    }
> > > > +static inline void intel_gt_pm_might_get(struct intel_gt *gt)
> > > > +{
> > > > +	intel_wakeref_might_get(&gt->wakeref);
> > > > +}
> > > > +
> > > >    static inline void intel_gt_pm_put(struct intel_gt *gt)
> > > >    {
> > > >    	intel_wakeref_put(&gt->wakeref);
> > > > @@ -41,6 +46,11 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
> > > >    	intel_wakeref_put_async(&gt->wakeref);
> > > >    }
> > > > +static inline void intel_gt_pm_might_put(struct intel_gt *gt)
> > > > +{
> > > > +	intel_wakeref_might_put(&gt->wakeref);
> > > > +}
> > > > +
> > > >    #define with_intel_gt_pm(gt, tmp) \
> > > >    	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
> > > >    	     intel_gt_pm_put(gt), tmp = 0)
> > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > index dbf919801de2..e0eed70f9b92 100644
> > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > > @@ -1550,7 +1550,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
> > > >    static int guc_context_pin(struct intel_context *ce, void *vaddr)
> > > >    {
> > > > -	return __guc_context_pin(ce, ce->engine, vaddr);
> > > > +	int ret = __guc_context_pin(ce, ce->engine, vaddr);
> > > > +
> > > > +	if (likely(!ret && !intel_context_is_barrier(ce)))
> > > > +		intel_engine_pm_get(ce->engine);
> > > > +
> > > > +	return ret;
> > > >    }
> > > >    static void guc_context_unpin(struct intel_context *ce)
> > > > @@ -1559,6 +1564,9 @@ static void guc_context_unpin(struct intel_context *ce)
> > > >    	unpin_guc_id(guc, ce);
> > > >    	lrc_unpin(ce);
> > > > +
> > > > +	if (likely(!intel_context_is_barrier(ce)))
> > > > +		intel_engine_pm_put_async(ce->engine);
> > > >    }
> > > >    static void guc_context_post_unpin(struct intel_context *ce)
> > > > @@ -2328,8 +2336,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
> > > >    static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
> > > >    {
> > > >    	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> > > > +	int ret = __guc_context_pin(ce, engine, vaddr);
> > > > +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> > > > +
> > > > +	if (likely(!ret))
> > > > +		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> > > > +			intel_engine_pm_get(engine);
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
> > > > +	unpin_guc_id(guc, ce);
> > > > +	lrc_unpin(ce);
> > > > +
> > > > +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> > > > +		intel_engine_pm_put_async(engine);
> > > >    }
> > > >    static void guc_virtual_context_enter(struct intel_context *ce)
> > > > @@ -2366,7 +2396,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
> > > >    	.pre_pin = guc_virtual_context_pre_pin,
> > > >    	.pin = guc_virtual_context_pin,
> > > > -	.unpin = guc_context_unpin,
> > > > +	.unpin = guc_virtual_context_unpin,
> > > >    	.post_unpin = guc_context_post_unpin,
> > > >    	.ban = guc_context_ban,
> > > > diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> > > > index ef7e6a698e8a..dd530ae028e0 100644
> > > > --- a/drivers/gpu/drm/i915/intel_wakeref.h
> > > > +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> > > > @@ -124,6 +124,12 @@ enum {
> > > >    	__INTEL_WAKEREF_PUT_LAST_BIT__
> > > >    };
> > > > +static inline void
> > > > +intel_wakeref_might_get(struct intel_wakeref *wf)
> > > > +{
> > > > +	might_lock(&wf->mutex);
> > > > +}
> > > > +
> > > >    /**
> > > >     * intel_wakeref_put_flags: Release the wakeref
> > > >     * @wf: the wakeref
> > > > @@ -171,6 +177,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
> > > >    			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
> > > >    }
> > > > +static inline void
> > > > +intel_wakeref_might_put(struct intel_wakeref *wf)
> > > > +{
> > > > +	might_lock(&wf->mutex);
> > > > +}
> > > > +
> > > >    /**
> > > >     * intel_wakeref_lock: Lock the wakeref (mutex)
> > > >     * @wf: the wakeref
> 
