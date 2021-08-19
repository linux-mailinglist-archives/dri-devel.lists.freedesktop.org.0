Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E803F2246
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 23:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD27E6E9DE;
	Thu, 19 Aug 2021 21:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26606E9DE;
 Thu, 19 Aug 2021 21:36:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="203852009"
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="203852009"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 14:36:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,335,1620716400"; d="scan'208";a="451782576"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 14:36:08 -0700
Date: Thu, 19 Aug 2021 14:30:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [Intel-gfx] [PATCH 02/27] drm/i915/guc: Fix outstanding G2H
 accounting
Message-ID: <20210819213055.GA11622@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-3-matthew.brost@intel.com>
 <4c984e90-081f-6707-c0ab-def83c7a0a98@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c984e90-081f-6707-c0ab-def83c7a0a98@intel.com>
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

On Thu, Aug 19, 2021 at 02:31:51PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > A small race that could result in incorrect accounting of the number
> > of outstanding G2H. Basically prior to this patch we did not increment
> > the number of outstanding G2H if we encoutered a GT reset while sending
> > a H2G. This was incorrect as the context state had already been updated
> > to anticipate a G2H response thus the counter should be incremented.
> > 
> > Also always use helper when decrementing this value.
> > 
> > Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 ++++++++++---------
> >   1 file changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 69faa39da178..32c414aa9009 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -352,6 +352,12 @@ static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> >   	xa_unlock_irqrestore(&guc->context_lookup, flags);
> >   }
> > +static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> > +{
> > +	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> > +		wake_up_all(&guc->ct.wq);
> > +}
> > +
> >   static int guc_submission_send_busy_loop(struct intel_guc *guc,
> >   					 const u32 *action,
> >   					 u32 len,
> > @@ -360,11 +366,13 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
> >   {
> >   	int err;
> > -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> > -
> > -	if (!err && g2h_len_dw)
> > +	if (g2h_len_dw)
> >   		atomic_inc(&guc->outstanding_submission_g2h);
> > +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> > +	if (err == -EBUSY && g2h_len_dw)
> > +		decr_outstanding_submission_g2h(guc);
> > +
> 
> here you're special casing  -EBUSY, which kind of implies that the caller
> needs to handle this differently, but most callers seem to ignore the return
> code. Is the counter handled somewhere else in case of EBUSY? if so, please
> add a comment about it.
> 

Good catch, this is a dead code path. Will delete.

Matt

> Daniele
> 
> >   	return err;
> >   }
> > @@ -616,7 +624,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   		init_sched_state(ce);
> >   		if (pending_enable || destroyed || deregister) {
> > -			atomic_dec(&guc->outstanding_submission_g2h);
> > +			decr_outstanding_submission_g2h(guc);
> >   			if (deregister)
> >   				guc_signal_context_fence(ce);
> >   			if (destroyed) {
> > @@ -635,7 +643,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   				intel_engine_signal_breadcrumbs(ce->engine);
> >   			}
> >   			intel_context_sched_disable_unpin(ce);
> > -			atomic_dec(&guc->outstanding_submission_g2h);
> > +			decr_outstanding_submission_g2h(guc);
> >   			spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   			guc_blocked_fence_complete(ce);
> >   			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > @@ -2583,12 +2591,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> >   	return ce;
> >   }
> > -static void decr_outstanding_submission_g2h(struct intel_guc *guc)
> > -{
> > -	if (atomic_dec_and_test(&guc->outstanding_submission_g2h))
> > -		wake_up_all(&guc->ct.wq);
> > -}
> > -
> >   int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
> >   					  const u32 *msg,
> >   					  u32 len)
> 
