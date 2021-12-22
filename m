Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C556747D94D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA23689EA3;
	Wed, 22 Dec 2021 22:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6070897BB;
 Wed, 22 Dec 2021 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640211995; x=1671747995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z9u5JPupDTpNi9vk7joEIGBVams4FlG2Pu4y0nHMFyA=;
 b=WmKqWOVSyEz0RF35qJS9sC28MNYZDF7oZ6NA7FOhYsj34an8ahLpT2wm
 dGkbfIvivuutpAURV29TXasAZyeMcEMichSfk9ezYECRC+RjPPdNZP8qF
 NTfZLoQu1a4VYhSCn5QboNMy1odeqy6K12MeDtaSO5I4ItLt3QZOr4C4X
 4rhaWELGX/cN2dvWdIELR2ixhd7CMP3CIfaAsRKwGmnP8yT+wjIIIqa2t
 qkYUKUv8+1OXOtHcxtB0o5W3QP6tYjMYRc91F/dFFLtC2W65jZcOmk713
 juGYDTuthhKdT0g/pW3JnIIr9pkadZNWpyrrcJ1u/bmOJEWTBcABDENiw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="221394352"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="221394352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 14:26:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="521850659"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 14:26:18 -0800
Date: Wed, 22 Dec 2021 14:21:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Message-ID: <20211222222100.GA29117@jons-linux-dev-box>
References: <20211111212000.2237-1-matthew.brost@intel.com>
 <5169db1b-a97b-27fe-ed03-6fc986c98ea2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5169db1b-a97b-27fe-ed03-6fc986c98ea2@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 06, 2021 at 12:01:04PM -0800, John Harrison wrote:
> On 11/11/2021 13:20, Matthew Brost wrote:
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
> > v3:
> >   (John Harrison)
> >    - Drop single submission
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++--
> >   drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
> >   .../drm/i915/gt/intel_execlists_submission.c  | 40 +++++++++++++++++++
> >   drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
> >   5 files changed, 50 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index ebd775cb1661c..d7bf6c8f70b7b 100644
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
> > index 5634d14052bc9..1bec92e1d8e63 100644
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
> > index ca03880fa7e49..5fd49ee47096d 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > @@ -2598,6 +2598,45 @@ static void execlists_context_cancel_request(struct intel_context *ce,
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
> intel_context_create already checks for null and returns -ENOMEM. This needs
> to check for IS_ERR(ce).
> 

Yep.

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
> > +	for_each_child(parent, ce) {
> > +		intel_context_set_nopreempt(ce);
> > +		intel_context_set_single_submission(ce);
> I thought the single submission thing wasn't wanted anymore?
> 

Yep.

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
> > index 56156cf18c413..70f4b309522d3 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> > @@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
> >   void lrc_unpin(struct intel_context *ce)
> >   {
> > +	if (unlikely(ce->parallel.last_rq))
> > +		i915_request_put(ce->parallel.last_rq);
> Should set this to null after to prevent the possibility of a double put?
> 

Not needed as parallel contexts are perma-pinnned and only unpinned
once in their lifetime.

That being said, will set it to NULL anyways to be safe.

Matt

> John.
> 
> >   	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
> >   		      ce->engine);
> >   }
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 5cc49c0b38897..cd1784953d679 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -3235,8 +3235,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
> >   	GEM_BUG_ON(!intel_context_is_parent(ce));
> >   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
> > -	if (ce->parallel.last_rq)
> > -		i915_request_put(ce->parallel.last_rq);
> >   	unpin_guc_id(guc, ce);
> >   	lrc_unpin(ce);
> >   }
> 
