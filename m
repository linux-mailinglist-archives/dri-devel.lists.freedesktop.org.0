Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B709641CDB6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 23:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BEA6E22F;
	Wed, 29 Sep 2021 21:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83FF6E22F;
 Wed, 29 Sep 2021 21:03:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="212124159"
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="212124159"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 14:03:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="479419055"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 14:03:10 -0700
Date: Wed, 29 Sep 2021 13:58:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 25/27] drm/i915/guc: Handle errors in
 multi-lrc requests
Message-ID: <20210929205819.GA10003@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-26-matthew.brost@intel.com>
 <9c27ba5e-cf18-006f-b63a-908a863d52f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c27ba5e-cf18-006f-b63a-908a863d52f7@intel.com>
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

On Wed, Sep 29, 2021 at 01:44:10PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > If an error occurs in the front end when multi-lrc requests are getting
> > generated we need to skip these in the backend but we still need to
> > emit the breadcrumbs seqno. An issues arrises because with multi-lrc
> arrises -> arises
> 

Yep.

> > breadcrumbs there is a handshake between the parent and children to make
> > forwad progress. If all the requests are not present this handshake
> forwad -> forward
> 

Yep.

> > doesn't work. To work around this, if multi-lrc request has an error we
> > skip the handshake but still emit the breadcrumbs seqno.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++++++++++++++-
> >   1 file changed, 58 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 2ef38557b0f0..61e737fd1eee 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -3546,8 +3546,8 @@ static int emit_bb_start_child_no_preempt_mid_batch(struct i915_request *rq,
> >   }
> >   static u32 *
> > -emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> > -						 u32 *cs)
> > +__emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> > +						   u32 *cs)
> >   {
> >   	struct intel_context *ce = rq->context;
> >   	u8 i;
> > @@ -3575,6 +3575,41 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> >   				  get_children_go_addr(ce),
> >   				  0);
> > +	return cs;
> > +}
> > +
> > +/*
> > + * If this true, a submission of multi-lrc requests had an error and the
> > + * requests need to be skipped. The front end (execuf IOCTL) should've called
> > + * i915_request_skip which squashes the BB but we still need to emit the fini
> > + * breadrcrumbs seqno write. At this point we don't know how many of the
> > + * requests in the multi-lrc submission were generated so we can't do the
> > + * handshake between the parent and children (e.g. if 4 requests should be
> > + * generated but 2nd hit an error only 1 would be seen by the GuC backend).
> > + * Simply skip the handshake, but still emit the breadcrumbd seqno, if an error
> > + * has occurred on any of the requests in submission / relationship.
> > + */
> > +static inline bool skip_handshake(struct i915_request *rq)
> > +{
> > +	return test_bit(I915_FENCE_FLAG_SKIP_PARALLEL, &rq->fence.flags);
> > +}
> > +
> > +static u32 *
> > +emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> > +						 u32 *cs)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +
> > +	GEM_BUG_ON(!intel_context_is_parent(ce));
> > +
> > +	if (unlikely(skip_handshake(rq))) {
> > +		memset(cs, 0, sizeof(u32) *
> > +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> > +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> Why -6? There are 12 words about to be written. Indeed the value of
> emit_..._dw is '12 + 4*num_children'. This should only be skipping over the
> 4*children, right? As it stands, it will skip all but the last six words,
> then write an extra twelve words and thus overflow the reservation by six.
> Unless I am totally confused?
> 

Let me decode the length:

'Wait on children' (in __emit_fini_breadcrumb_parent_no_preempt_mid_batch) = 4 * num_children
'Turn on preemption' (in __emit_fini_breadcrumb_parent_no_preempt_mid_batch) = 2
'Tell children go' (in __emit_fini_breadcrumb_parent_no_preempt_mid_batch) = 4
'Emit fini breadcrumb' (in emit_fini_breadcrumb_child_no_preempt_mid_batch) = 4
'User interrupt' (in emit_fini_breadcrumb_child_no_preempt_mid_batch) = 2

So for a total (emit_fini_breadcrumb_dw) we have '12 + 4 * num_children'

We want skip everything in __emit_fini_breadcrumb_parent_no_preempt_mid_batch, so that is
'6 + 4 * num_children' or 'emit_fini_breadcrumb_dw - 6'

Make sense?

> I assume there is some reason why the amount of data written must exactly
> match the space reserved? It's a while since I've looked at the ring buffer
> code!
> 

I think it because the ring space is reserved at request creation time
but the fini breadcrumbs are not written until submission time.

> Seems like it would be clearer to not split the semaphore writes out but
> have them right next to the skip code that is meant to replicate them but
> with no-ops.
>

I guess that works too, I personally like the way it is but if you
insist I can change it.

> > +	} else {
> > +		cs = __emit_fini_breadcrumb_parent_no_preempt_mid_batch(rq, cs);
> > +	}
> > +
> >   	/* Emit fini breadcrumb */
> >   	cs = gen8_emit_ggtt_write(cs,
> >   				  rq->fence.seqno,
> > @@ -3591,7 +3626,8 @@ emit_fini_breadcrumb_parent_no_preempt_mid_batch(struct i915_request *rq,
> >   }
> >   static u32 *
> > -emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs)
> > +__emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> > +						  u32 *cs)
> >   {
> >   	struct intel_context *ce = rq->context;
> > @@ -3617,6 +3653,25 @@ emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq, u32 *cs
> >   	*cs++ = get_children_go_addr(ce->parent);
> >   	*cs++ = 0;
> > +	return cs;
> > +}
> > +
> > +static u32 *
> > +emit_fini_breadcrumb_child_no_preempt_mid_batch(struct i915_request *rq,
> > +						u32 *cs)
> > +{
> > +	struct intel_context *ce = rq->context;
> > +
> > +	GEM_BUG_ON(!intel_context_is_child(ce));
> > +
> > +	if (unlikely(skip_handshake(rq))) {
> > +		memset(cs, 0, sizeof(u32) *
> > +		       (ce->engine->emit_fini_breadcrumb_dw - 6));
> > +		cs += ce->engine->emit_fini_breadcrumb_dw - 6;
> > +	} else {
> > +		cs = __emit_fini_breadcrumb_child_no_preempt_mid_batch(rq, cs);
> > +	}
> Same points as above - why -6 not -12 and would be clearer to keep the
> no-ops and the writes adjacent.
>

Same as above we are NOP the length of
__emit_fini_breadcrumb_child_no_preempt_mid_batch and still want the
emit breadcrumbs below.

Matt

 
> John.
> 
> > +
> >   	/* Emit fini breadcrumb */
> >   	cs = gen8_emit_ggtt_write(cs,
> >   				  rq->fence.seqno,
> 
