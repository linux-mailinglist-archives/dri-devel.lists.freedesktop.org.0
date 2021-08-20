Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BBE3F3414
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 20:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECC96EB0A;
	Fri, 20 Aug 2021 18:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0747A6EB07;
 Fri, 20 Aug 2021 18:47:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="197079892"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="197079892"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 11:47:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="680376415"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 11:47:23 -0700
Date: Fri, 20 Aug 2021 11:42:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 10/27] drm/i915/guc: Don't enable scheduling
 on a banned context, guc_id invalid, not registered
Message-ID: <20210820184211.GA19591@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-11-matthew.brost@intel.com>
 <ee8d2276-99cb-e7aa-7a60-97f0774105a4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee8d2276-99cb-e7aa-7a60-97f0774105a4@intel.com>
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

On Fri, Aug 20, 2021 at 11:42:38AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > When unblocking a context, do not enable scheduling if the context is
> > banned, guc_id invalid, or not registered.
> > 
> > Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index d61f906105ef..e53a4ef7d442 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1586,6 +1586,9 @@ static void guc_context_unblock(struct intel_context *ce)
> >   	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   	if (unlikely(submission_disabled(guc) ||
> > +		     intel_context_is_banned(ce) ||
> > +		     context_guc_id_invalid(ce) ||
> > +		     !lrc_desc_registered(guc, ce->guc_id) ||
> >   		     !intel_context_is_pinned(ce) ||
> >   		     context_pending_disable(ce) ||
> >   		     context_blocked(ce) > 1)) {
> 
> This is getting to a lot of conditions. Maybe we can simplify it a bit? E.g

Yea, this some defensive programming to cover all the basis if another
async operation (ban, reset, unpin) happens when this op is in flight.
Probably some of the conditions are not needed but being extra safe
here.

> it should be possible to check context_blocked, context_banned and
> context_pending_disable as a single op:
> 
> #define SCHED_STATE_MULTI_BLOCKED_MASK \  /* 2 or more blocks */
>     (SCHED_STATE_BLOCKED_MASK & ~SCHED_STATE_BLOCKED)
> #define SCHED_STATE_NO_UNBLOCK \
>     SCHED_STATE_MULTI_BLOCKED_MASK | \
>     SCHED_STATE_PENDING_DISABLE | \
>     SCHED_STATE_BANNED

Good idea, let me move this to helper in the next spin.

Matt

> 
> Not a blocker.
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Daniele
> 
> 
