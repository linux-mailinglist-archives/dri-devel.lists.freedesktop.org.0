Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D50AD414E09
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 18:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDE06EC39;
	Wed, 22 Sep 2021 16:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628989E98;
 Wed, 22 Sep 2021 16:23:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="246077688"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="246077688"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 09:21:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="436285110"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 09:21:35 -0700
Date: Wed, 22 Sep 2021 09:16:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 17/27] drm/i915/guc: Implement multi-lrc reset
Message-ID: <20210922161629.GA4220@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-18-matthew.brost@intel.com>
 <174cb140-6d0c-5862-1cdb-79aa17c3a8e3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174cb140-6d0c-5862-1cdb-79aa17c3a8e3@intel.com>
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

On Mon, Sep 20, 2021 at 03:44:18PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> 
>     Update context and full GPU reset to work with multi-lrc. The idea is
>     parent context tracks all the active requests inflight for itself and
>     its' children. The parent context owns the reset replaying / canceling
> 
> its' -> its
> 
> 
>     requests as needed.
> 
>     Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>     ---
>      drivers/gpu/drm/i915/gt/intel_context.c       | 11 ++--
>      .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 63 +++++++++++++------
>      2 files changed, 51 insertions(+), 23 deletions(-)
> 
>     diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>     index 00d1aee6d199..5615be32879c 100644
>     --- a/drivers/gpu/drm/i915/gt/intel_context.c
>     +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>     @@ -528,20 +528,21 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
> 
>      struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>      {
>     +       struct intel_context *parent = intel_context_to_parent(ce);
>             struct i915_request *rq, *active = NULL;
>             unsigned long flags;
> 
>             GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
> 
> Should this not check the parent as well/instead?
> 

I don't think so. The 'ce' could be a not parallel context, a parent
context, or a child context. 

> And to be clear, this can be called on regular contexts (where ce == parent)
> and on both the parent or child contexts of multi-LRC contexts (where ce may or
> may not match parent)?
>

Right. The parent owns the parent->guc_state.lock/requests and search
that list for the first non-completed request that matches submitted
'ce'.
 
> 
> 
> 
>     -       spin_lock_irqsave(&ce->guc_state.lock, flags);
>     -       list_for_each_entry_reverse(rq, &ce->guc_state.requests,
>     +       spin_lock_irqsave(&parent->guc_state.lock, flags);
>     +       list_for_each_entry_reverse(rq, &parent->guc_state.requests,
>                                         sched.link) {
>     -               if (i915_request_completed(rq))
>     +               if (i915_request_completed(rq) && rq->context == ce)
> 
> 'rq->context == ce' means:
> 
>  1. single-LRC context, rq is owned by ce
>  2. multi-LRC context, ce is child, rq really belongs to ce but is being
>     tracked by parent
>  3. multi-LRC context, ce is parent, rq really is owned by ce
> 
> So when 'rq->ce != ce', it means that the request is owned by a different child
> to 'ce' but within the same multi-LRC group. So we want to ignore that request
> and keep searching until we find one that is really owned by the target ce?
>

All correct.
 
> 
>                             break;
> 
>     -               active = rq;
>     +               active = (rq->context == ce) ? rq : active;
> 
> Would be clearer to say 'if(rq->ce != ce) continue;' and leave 'active = rq;'
> alone?
>

Yes, that is probably cleaner.
 
> And again, the intention is to ignore requests that are owned by other members
> of the same multi-LRC group?
> 
> Would be good to add some documentation to this function to explain the above
> (assuming my description is correct?).
>

Will add a comment explaining this.
 
> 
>             }
>     -       spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>     +       spin_unlock_irqrestore(&parent->guc_state.lock, flags);
> 
>             return active;
>      }
>     diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     index f0b60fecf253..e34e0ea9136a 100644
>     --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>     @@ -670,6 +670,11 @@ static int rq_prio(const struct i915_request *rq)
>             return rq->sched.attr.priority;
>      }
> 
>     +static inline bool is_multi_lrc(struct intel_context *ce)
>     +{
>     +       return intel_context_is_parallel(ce);
>     +}
>     +
>      static bool is_multi_lrc_rq(struct i915_request *rq)
>      {
>             return intel_context_is_parallel(rq->context);
>     @@ -1179,10 +1184,13 @@ __unwind_incomplete_requests(struct intel_context *ce)
> 
>      static void __guc_reset_context(struct intel_context *ce, bool stalled)
>      {
>     +       bool local_stalled;
>             struct i915_request *rq;
>             unsigned long flags;
>             u32 head;
>     +       int i, number_children = ce->guc_number_children;
> 
> If this is a child context, does it not need to pull the child count from the
> parent? Likewise the list/link pointers below? Or does each child context have
> a full list of its siblings + parent?
> 

This function shouldn't be called by a child. Will add
GEM_BUG_ON(intel_context_is_child(ce)) to this function.

> 
>             bool skip = false;
>     +       struct intel_context *parent = ce;
> 
>             intel_context_get(ce);
> 
>     @@ -1209,25 +1217,34 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>             if (unlikely(skip))
>                     goto out_put;
> 
>     -       rq = intel_context_find_active_request(ce);
>     -       if (!rq) {
>     -               head = ce->ring->tail;
>     -               stalled = false;
>     -               goto out_replay;
>     -       }
>     +       for (i = 0; i < number_children + 1; ++i) {
>     +               if (!intel_context_is_pinned(ce))
>     +                       goto next_context;
>     +
>     +               local_stalled = false;
>     +               rq = intel_context_find_active_request(ce);
>     +               if (!rq) {
>     +                       head = ce->ring->tail;
>     +                       goto out_replay;
>     +               }
> 
>     -       if (!i915_request_started(rq))
>     -               stalled = false;
>     +               GEM_BUG_ON(i915_active_is_idle(&ce->active));
>     +               head = intel_ring_wrap(ce->ring, rq->head);
> 
>     -       GEM_BUG_ON(i915_active_is_idle(&ce->active));
>     -       head = intel_ring_wrap(ce->ring, rq->head);
>     -       __i915_request_reset(rq, stalled);
>     +               if (i915_request_started(rq))
> 
> Why change the ordering of the started test versus the wrap/reset call? Is it
> significant? Why is it now important to be reversed?
>

Off the top of my head I'm not sure what the ordering is changed. I'll
have to double check on this.
 
> 
>     +                       local_stalled = true;
> 
>     +               __i915_request_reset(rq, local_stalled && stalled);
>      out_replay:
>     -       guc_reset_state(ce, head, stalled);
>     -       __unwind_incomplete_requests(ce);
>     +               guc_reset_state(ce, head, local_stalled && stalled);
>     +next_context:
>     +               if (i != number_children)
>     +                       ce = list_next_entry(ce, guc_child_link);
> 
> Can this not be put in to the step clause of the for statement?
> 

Maybe? Does list_next_entry blow up on that last entry? Idk? If not,
then yes this can be added to the loop. Will double check on this.

> 
>     +       }
>     +
>     +       __unwind_incomplete_requests(parent);
>      out_put:
>     -       intel_context_put(ce);
>     +       intel_context_put(parent);
> 
> As above, I think this function would benefit from some comments to explain
> exactly what is being done and why.
>

Sure. Will add some comments.

Matt
 
> John.
> 
> 
>      }
> 
>      void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
>     @@ -1248,7 +1265,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> 
>                     xa_unlock(&guc->context_lookup);
> 
>     -               if (intel_context_is_pinned(ce))
>     +               if (intel_context_is_pinned(ce) &&
>     +                   !intel_context_is_child(ce))
>                             __guc_reset_context(ce, stalled);
> 
>                     intel_context_put(ce);
>     @@ -1340,7 +1358,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
> 
>                     xa_unlock(&guc->context_lookup);
> 
>     -               if (intel_context_is_pinned(ce))
>     +               if (intel_context_is_pinned(ce) &&
>     +                   !intel_context_is_child(ce))
>                             guc_cancel_context_requests(ce);
> 
>                     intel_context_put(ce);
>     @@ -2031,6 +2050,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>             u16 guc_id;
>             bool enabled;
> 
>     +       GEM_BUG_ON(intel_context_is_child(ce));
>     +
>             spin_lock_irqsave(&ce->guc_state.lock, flags);
> 
>             incr_context_blocked(ce);
>     @@ -2068,6 +2089,7 @@ static void guc_context_unblock(struct intel_context *ce)
>             bool enable;
> 
>             GEM_BUG_ON(context_enabled(ce));
>     +       GEM_BUG_ON(intel_context_is_child(ce));
> 
>             spin_lock_irqsave(&ce->guc_state.lock, flags);
> 
>     @@ -2099,11 +2121,14 @@ static void guc_context_unblock(struct intel_context *ce)
>      static void guc_context_cancel_request(struct intel_context *ce,
>                                            struct i915_request *rq)
>      {
>     +       struct intel_context *block_context =
>     +               request_to_scheduling_context(rq);
>     +
>             if (i915_sw_fence_signaled(&rq->submit)) {
>                     struct i915_sw_fence *fence;
> 
>                     intel_context_get(ce);
>     -               fence = guc_context_block(ce);
>     +               fence = guc_context_block(block_context);
>                     i915_sw_fence_wait(fence);
>                     if (!i915_request_completed(rq)) {
>                             __i915_request_skip(rq);
>     @@ -2117,7 +2142,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
>                      */
>                     flush_work(&ce_to_guc(ce)->ct.requests.worker);
> 
>     -               guc_context_unblock(ce);
>     +               guc_context_unblock(block_context);
>                     intel_context_put(ce);
>             }
>      }
>     @@ -2143,6 +2168,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>             intel_wakeref_t wakeref;
>             unsigned long flags;
> 
>     +       GEM_BUG_ON(intel_context_is_child(ce));
>     +
>             guc_flush_submissions(guc);
> 
>             spin_lock_irqsave(&ce->guc_state.lock, flags);
> 
> 
> SECURITY NOTE: file ~/.netrc must not be accessible by others
