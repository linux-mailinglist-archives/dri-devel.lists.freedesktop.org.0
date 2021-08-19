Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5033F23F9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 02:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A006E9EC;
	Fri, 20 Aug 2021 00:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041FE6E9EC;
 Fri, 20 Aug 2021 00:03:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="203828000"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="203828000"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 17:03:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="512316873"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 17:03:38 -0700
Date: Thu, 19 Aug 2021 16:58:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 04/27] drm/i915/guc: Don't drop
 ce->guc_active.lock when unwinding context
Message-ID: <20210819235825.GA16207@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-5-matthew.brost@intel.com>
 <274c1930-db30-bacc-8b61-db439f8ec19c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <274c1930-db30-bacc-8b61-db439f8ec19c@intel.com>
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

On Thu, Aug 19, 2021 at 05:01:03PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > Don't drop ce->guc_active.lock when unwinding a context after reset.
> > At one point we had to drop this because of a lock inversion but that is
> > no longer the case. It is much safer to hold the lock so let's do that.
> > 
> > Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Do we have a trybot of this series with GuC enabled? I've checked the
> functions called in the previously unlocked chunk and didn't spot anything
> requiring the lock to be dropped, but I'd feel safer if we had lockdep
> results as well.
> 

RKL uses GuC submission with BAT. This has been thoroughly tested by me
too and no lockdep splats. Can kick off a trybot on the next rev of this
series too.

Matt

> Daniele
> 
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ----
> >   1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 9ca0ba4ea85a..e4a099f8f820 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -812,8 +812,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
> >   			continue;
> >   		list_del_init(&rq->sched.link);
> > -		spin_unlock(&ce->guc_active.lock);
> > -
> >   		__i915_request_unsubmit(rq);
> >   		/* Push the request back into the queue for later resubmission. */
> > @@ -826,8 +824,6 @@ __unwind_incomplete_requests(struct intel_context *ce)
> >   		list_add(&rq->sched.link, pl);
> >   		set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> > -
> > -		spin_lock(&ce->guc_active.lock);
> >   	}
> >   	spin_unlock(&ce->guc_active.lock);
> >   	spin_unlock_irqrestore(&sched_engine->lock, flags);
> 
