Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EDA3F9215
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 03:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5258B6E8E7;
	Fri, 27 Aug 2021 01:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386286E047;
 Fri, 27 Aug 2021 01:42:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="303453400"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="303453400"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 18:41:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="426978158"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 18:41:59 -0700
Date: Thu, 26 Aug 2021 18:36:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/27] drm/i915/guc: Fix outstanding G2H accounting
Message-ID: <20210827013650.GA9019@jons-linux-dev-box>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-3-matthew.brost@intel.com>
 <3fde98f9-b408-63cf-ea31-779bf477b68e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fde98f9-b408-63cf-ea31-779bf477b68e@intel.com>
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

On Thu, Aug 26, 2021 at 04:09:59PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/25/2021 8:23 PM, Matthew Brost wrote:
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
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 23 ++++++++++---------
> >   1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 69faa39da178..03a86da6011e 100644
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
> > @@ -360,11 +366,12 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
> >   {
> >   	int err;
> > -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> > -
> > -	if (!err && g2h_len_dw)
> > +	if (g2h_len_dw)
> >   		atomic_inc(&guc->outstanding_submission_g2h);
> > +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> > +	GEM_BUG_ON(g2h_len_dw && err == -EBUSY);
> 
> AFAICS having a return g2h is not tied to not returning EBUSY, the only way
> to avoid  EBUSY seems to be for loop to be true. maybe have instead:
> 
> GEM_BUG_ON(g2h_len_dw && !loop);
> 
> earlier on?
> 

Yep, that is better. Can you respin this for me while I'm out?

Matt

> Daniele
> 
> > +
> >   	return err;
> >   }
> > @@ -616,7 +623,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   		init_sched_state(ce);
> >   		if (pending_enable || destroyed || deregister) {
> > -			atomic_dec(&guc->outstanding_submission_g2h);
> > +			decr_outstanding_submission_g2h(guc);
> >   			if (deregister)
> >   				guc_signal_context_fence(ce);
> >   			if (destroyed) {
> > @@ -635,7 +642,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   				intel_engine_signal_breadcrumbs(ce->engine);
> >   			}
> >   			intel_context_sched_disable_unpin(ce);
> > -			atomic_dec(&guc->outstanding_submission_g2h);
> > +			decr_outstanding_submission_g2h(guc);
> >   			spin_lock_irqsave(&ce->guc_state.lock, flags);
> >   			guc_blocked_fence_complete(ce);
> >   			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > @@ -2583,12 +2590,6 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
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
