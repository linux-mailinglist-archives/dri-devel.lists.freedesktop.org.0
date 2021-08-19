Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D7D3F23E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 01:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F85C6E9C9;
	Thu, 19 Aug 2021 23:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5656E9C9;
 Thu, 19 Aug 2021 23:58:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216676927"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="216676927"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 16:58:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="594979801"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 16:58:18 -0700
Date: Thu, 19 Aug 2021 16:53:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 03/27] drm/i915/guc: Unwind context requests
 in reverse order
Message-ID: <20210819235306.GA16156@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-4-matthew.brost@intel.com>
 <0aab40fb-77e7-2187-66e0-5c981a2083a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aab40fb-77e7-2187-66e0-5c981a2083a7@intel.com>
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

On Thu, Aug 19, 2021 at 04:54:00PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > When unwinding requests on a reset context, if other requests in the
> > context are in the priority list the requests could be resubmitted out
> > of seqno order. Traverse the list of active requests in reverse and
> > append to the head of the priority list to fix this.
> > 
> > Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 32c414aa9009..9ca0ba4ea85a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -805,9 +805,9 @@ __unwind_incomplete_requests(struct intel_context *ce)
> >   	spin_lock_irqsave(&sched_engine->lock, flags);
> >   	spin_lock(&ce->guc_active.lock);
> > -	list_for_each_entry_safe(rq, rn,
> > -				 &ce->guc_active.requests,
> > -				 sched.link) {
> > +	list_for_each_entry_safe_reverse(rq, rn,
> > +					 &ce->guc_active.requests,
> > +					 sched.link) {
> >   		if (i915_request_completed(rq))
> 
> The execlists unwind function has a list_del if the request is completed.
> Any reason not to do that here?
> 

Def isn't needed here as this is done in remove_from_context(), probably
not needed in execlists mode either.


> >   			continue;
> > @@ -824,7 +824,7 @@ __unwind_incomplete_requests(struct intel_context *ce)
> >   		}
> >   		GEM_BUG_ON(i915_sched_engine_is_empty(sched_engine));
> > -		list_add_tail(&rq->sched.link, pl);
> > +		list_add(&rq->sched.link, pl);
> 
> Since you always do both list_del and list_add and it doesn't look like you
> use the fact that the list is empty between the 2 calls, you can merge them
> in a list_move.
>

Can't use a list move here because we drop
spin_lock(&ce->guc_active.lock), that gets fixed later in the series and
at that point we likely can use a list_move.

Matt

> Apart from these nits, the change to navigate the list in reverse and append
> here at the top LGTM.
> 
> Daniele
> 
> >   		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> >   		spin_lock(&ce->guc_active.lock);
> 
