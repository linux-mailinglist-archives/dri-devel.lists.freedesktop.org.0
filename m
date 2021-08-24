Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5E3F6201
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 17:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FA389A83;
	Tue, 24 Aug 2021 15:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFE189A83;
 Tue, 24 Aug 2021 15:49:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204473399"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="204473399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 08:49:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="643226969"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 08:49:32 -0700
Date: Tue, 24 Aug 2021 08:44:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 17/27] drm/i915/guc: Flush G2H work queue during reset
Message-ID: <20210824154422.GA9697@jons-linux-dev-box>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-18-matthew.brost@intel.com>
 <f57ccb87-c6d7-1510-d43d-090490fd902a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f57ccb87-c6d7-1510-d43d-090490fd902a@intel.com>
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

On Fri, Aug 20, 2021 at 05:25:41PM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 8/18/2021 11:16 PM, Matthew Brost wrote:
> > It isn't safe to scrub for missing G2H or continue with the reset until
> > all G2H processing is complete. Flush the G2H work queue during reset to
> > ensure it is done running.
> 
> Might be worth moving this patch closer to "drm/i915/guc: Process all G2H
> message at once in work queue".
> 

Sure.

> > Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 ++----------------
> >   1 file changed, 2 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 4cf5a565f08e..9a53bae367b1 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -714,8 +714,6 @@ static void guc_flush_submissions(struct intel_guc *guc)
> >   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> >   {
> > -	int i;
> > -
> >   	if (unlikely(!guc_submission_initialized(guc))) {
> >   		/* Reset called during driver load? GuC not yet initialised! */
> >   		return;
> > @@ -731,20 +729,8 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> >   	guc_flush_submissions(guc);
> > -	/*
> > -	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> > -	 * each pass as interrupt have been disabled. We always scrub for
> > -	 * outstanding G2H as it is possible for outstanding_submission_g2h to
> > -	 * be incremented after the context state update.
> > -	 */
> > -	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
> > -		intel_guc_to_host_event_handler(guc);
> > -#define wait_for_reset(guc, wait_var) \
> > -		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
> > -		do {
> > -			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> > -		} while (!list_empty(&guc->ct.requests.incoming));
> > -	}
> > +	flush_work(&guc->ct.requests.worker);
> > +
> 
> We're now not waiting in the requests anymore, just ensuring that the
> processing of the ones we already received is done. Is this intended? We do
> still handle the remaining oustanding submission in the scrub so it's
> functionally correct, but the commit message doesn't state the change in
> waiting behavior, so wanted to double check it was planned.
> 

Yes, it is planned as scrub code should be able to cope with any missing
G2H. Will update the commit message to reflect that.

Matt

> Daniele
> 
> >   	scrub_guc_desc_for_outstanding_g2h(guc);
> >   }
> 
