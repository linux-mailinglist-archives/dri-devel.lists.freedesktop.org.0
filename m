Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AF93F3403
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 20:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3A6EB14;
	Fri, 20 Aug 2021 18:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4637C6EAF0;
 Fri, 20 Aug 2021 18:42:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="197078938"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="197078938"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 11:42:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="682499649"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 11:42:02 -0700
Date: Fri, 20 Aug 2021 11:36:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 09/27] drm/i915/guc: Kick tasklet after
 queuing a request
Message-ID: <20210820183650.GA19561@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-10-matthew.brost@intel.com>
 <668d3590-04d6-277e-97b9-93784e6f7878@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <668d3590-04d6-277e-97b9-93784e6f7878@intel.com>
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

On Fri, Aug 20, 2021 at 11:31:56AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > Kick tasklet after queuing a request so it submitted in a timely manner.
> > 
> > Fixes: 3a4cdf1982f0 ("drm/i915/guc: Implement GuC context operations for new inteface")
> 
> Is this actually a bug or just a performance issue? in the latter case I
> don't think we need a fixes tag.
> 

Basically the tasklet won't get queued in certain ituations until the
heartbeat ping. Didn't notice it as the tasklet is only used during flow
control or after a full GT reset which both are rather rare. We can
probably drop the fixes tag as GuC submission isn't on by default is
still works without this fix.

> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 8f7a11e65ef5..d61f906105ef 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1050,6 +1050,7 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
> >   	list_add_tail(&rq->sched.link,
> >   		      i915_sched_lookup_priolist(sched_engine, prio));
> >   	set_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> > +	tasklet_hi_schedule(&sched_engine->tasklet);
> 
> the caller of queue_request() already has a tasklet_hi_schedule in another
> branch of the if/else statement. Maybe we can have the caller own the kick
> to keep it in one place? Not a blocker.
>

I guess it could be:

bool kick = need_taklet()

if (kick)
	queue_requst()
else
	kick = bypass()
if (kick)
	kick_tasklet()

Idk, it that is better? I'll think on this and decide before the next
post.

Matt

> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Daniele
> 
> >   }
> >   static int guc_bypass_tasklet_submit(struct intel_guc *guc,
> 
