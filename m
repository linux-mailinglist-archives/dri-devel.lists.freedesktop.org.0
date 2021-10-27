Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B543D1CA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 21:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855A6E81C;
	Wed, 27 Oct 2021 19:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4331C6E111;
 Wed, 27 Oct 2021 19:39:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="253801545"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="253801545"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 12:22:09 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="555495490"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 12:22:09 -0700
Date: Wed, 27 Oct 2021 12:17:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com
Subject: Re: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Message-ID: <20211027191732.GA16188@jons-linux-dev-box>
References: <20211020214751.34602-1-matthew.brost@intel.com>
 <c9a1cd3e-dc3a-2b2b-ee37-73c0c50f3f60@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9a1cd3e-dc3a-2b2b-ee37-73c0c50f3f60@intel.com>
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

On Tue, Oct 26, 2021 at 02:58:00PM -0700, John Harrison wrote:
> On 10/20/2021 14:47, Matthew Brost wrote:
> > A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
> > execlists. Doing as little as possible to support this interface for
> > execlists - basically just passing submit fences between each request
> > generated and virtual engines are not allowed. This is on par with what
> > is there for the existing (hopefully soon deprecated) bonding interface.
> > 
> > We perma-pin these execlists contexts to align with GuC implementation.
> > 
> > v2:
> >   (John Harrison)
> >    - Drop siblings array as num_siblings must be 1
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++--
> >   drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
> >   .../drm/i915/gt/intel_execlists_submission.c  | 44 ++++++++++++++++++-
> >   drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
> >   5 files changed, 52 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index fb33d0322960..35e87a7d0ea9 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
> >   	struct intel_engine_cs **siblings = NULL;
> >   	intel_engine_mask_t prev_mask;
> > -	/* FIXME: This is NIY for execlists */
> > -	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
> > -		return -ENODEV;
> > -
> >   	if (get_user(slot, &ext->engine_index))
> >   		return -EFAULT;
> > @@ -583,6 +579,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
> >   	if (get_user(num_siblings, &ext->num_siblings))
> >   		return -EFAULT;
> > +	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
> > +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
> > +			num_siblings);
> > +		return -EINVAL;
> > +	}
> > +
> >   	if (slot >= set->num_engines) {
> >   		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
> >   			slot, set->num_engines);
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> > index 5634d14052bc..1bec92e1d8e6 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> > @@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
> >   	__i915_active_acquire(&ce->active);
> > -	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
> > +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
> > +	    intel_context_is_parallel(ce))
> >   		return 0;
> >   	/* Preallocate tracking nodes */
> > @@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
> >   	 * Callers responsibility to validate that this function is used
> >   	 * correctly but we use GEM_BUG_ON here ensure that they do.
> >   	 */
> > -	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
> >   	GEM_BUG_ON(intel_context_is_pinned(parent));
> >   	GEM_BUG_ON(intel_context_is_child(parent));
> >   	GEM_BUG_ON(intel_context_is_pinned(child));
> > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > index bedb80057046..2865b422300d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -927,8 +927,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
> >   static bool ctx_single_port_submission(const struct intel_context *ce)
> >   {
> > -	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
> > -		intel_context_force_single_submission(ce));
> > +	return intel_context_force_single_submission(ce);
> I think this is actually going to break GVT.
> 
> Not so much this change here but the whole use of single submission outside
> of GVT. It looks like the GVT driver overloads the single submission flag to
> tag requests that it owns. If we start using that flag elsewhere when GVT is
> active, I think that will cause much confusion within the GVT code.
> 
> The correct fix would be to create a new flag just for GVT usage alongside
> the single submission one. GVT would then set both but only check for its
> own private flag. The parallel code would obviously only set the existing
> single submission flag.
> 

Ok, see below.

> 
> >   }
> >   static bool can_merge_ctx(const struct intel_context *prev,
> > @@ -2598,6 +2597,46 @@ static void execlists_context_cancel_request(struct intel_context *ce,
> >   				      current->comm);
> >   }
> > +static struct intel_context *
> > +execlists_create_parallel(struct intel_engine_cs **engines,
> > +			  unsigned int num_siblings,
> > +			  unsigned int width)
> > +{
> > +	struct intel_context *parent = NULL, *ce, *err;
> > +	int i;
> > +
> > +	GEM_BUG_ON(num_siblings != 1);
> > +
> > +	for (i = 0; i < width; ++i) {
> > +		ce = intel_context_create(engines[i]);
> > +		if (!ce) {
> > +			err = ERR_PTR(-ENOMEM);
> > +			goto unwind;
> > +		}
> > +
> > +		if (i == 0)
> > +			parent = ce;
> > +		else
> > +			intel_context_bind_parent_child(parent, ce);
> > +	}
> > +
> > +	parent->parallel.fence_context = dma_fence_context_alloc(1);
> > +
> > +	intel_context_set_nopreempt(parent);
> > +	intel_context_set_single_submission(parent);
> Can you explain the need for setting single submission?
> 

I think I can actually pull this out. This was needed when I tried to
truely implement a guarante that all the parallel requests would be
running simultaneously. Couldn't ever to get that working because of the
mess that is the execlists scheduler - a simple wait at the head of
queue until everyone joined just blew up for whatever reason. I don't
believe this servers a purpose anymore, so I'll just drop it.

Matt

> John.
> 
> > +	for_each_child(parent, ce) {
> > +		intel_context_set_nopreempt(ce);
> > +		intel_context_set_single_submission(ce);
> > +	}
> > +
> > +	return parent;
> > +
> > +unwind:
> > +	if (parent)
> > +		intel_context_put(parent);
> > +	return err;
> > +}
> > +
> >   static const struct intel_context_ops execlists_context_ops = {
> >   	.flags = COPS_HAS_INFLIGHT,
> > @@ -2616,6 +2655,7 @@ static const struct intel_context_ops execlists_context_ops = {
> >   	.reset = lrc_reset,
> >   	.destroy = lrc_destroy,
> > +	.create_parallel = execlists_create_parallel,
> >   	.create_virtual = execlists_create_virtual,
> >   };
> > diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > index 56156cf18c41..70f4b309522d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
> >   void lrc_unpin(struct intel_context *ce)
> >   {
> > +	if (unlikely(ce->parallel.last_rq))
> > +		i915_request_put(ce->parallel.last_rq);
> >   	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
> >   		      ce->engine);
> >   }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 1341752dc70e..ddc9a97fcc8f 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2961,8 +2961,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
> >   	GEM_BUG_ON(!intel_context_is_parent(ce));
> >   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> > -	if (ce->parallel.last_rq)
> > -		i915_request_put(ce->parallel.last_rq);
> >   	unpin_guc_id(guc, ce);
> >   	lrc_unpin(ce);
> >   }
> 
