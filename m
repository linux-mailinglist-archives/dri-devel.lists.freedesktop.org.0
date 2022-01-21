Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77B4958CE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 05:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91C710E26C;
	Fri, 21 Jan 2022 04:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF7710E26C;
 Fri, 21 Jan 2022 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642738257; x=1674274257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E9fg0DSS7ubYY+PFFvMwwnQkisdMdRP9qwsLJAQL18I=;
 b=nNyFMtEelF1+k0CxQ5XqcLhrYjmszWR50PwpSpnFnkFzbHDOUcOlJJlD
 q7D5YiyoKgOadpOyPeGcMWgQ0pAeE4uDXz72XcI1caoFq/8ZZBv7LqtWK
 4ZcfAeaw8YASL5TVMRGQZfWjvIkMtJqN9LMMSM1ah+u2e8lWA/pJFjiNg
 aqayROBnTkSvEcdswslNO0qT/cpxJCeLD3yiw/OCGnUPnCSEXhj3RZ0Fd
 Ee/zJLNZL9Rp5TCesGxE3UQPl9lhEVPW8AZB2U9d1NB5yYaTCMF+lmmZn
 r6hjDqLNWfhKhqMnu/UfINYUIwT0Ol1jC1bTenBFuXa1qAyHMV1O1szgm g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="308891847"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="308891847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:10:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="475801583"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:10:56 -0800
Date: Thu, 20 Jan 2022 20:05:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/guc: Flush G2H handler during a GT reset
Message-ID: <20220121040510.GA4165@jons-linux-dev-box>
References: <20220119212419.23068-1-matthew.brost@intel.com>
 <20220119212419.23068-4-matthew.brost@intel.com>
 <116132f9-b258-975a-6e0d-c6f7efbdd2d5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <116132f9-b258-975a-6e0d-c6f7efbdd2d5@intel.com>
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

On Thu, Jan 20, 2022 at 05:36:22PM -0800, John Harrison wrote:
> On 1/19/2022 13:24, Matthew Brost wrote:
> > Now that the error capture is fully decoupled from fence signalling
> > (request retirement to free memory, which in turn depends on resets) we
> > can safely flush the G2H handler during a GT reset. This is eliminates
> This eliminates
> 
> John.
> 

Yep, will fixup in the next rev.

Matt

> > corner cases where GuC generated G2H (e.g. engine resets) race with a GT
> > reset.
> > 
> > v2:
> >   (John Harrison)
> >    - Fix typo in commit message (s/is/in)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> > ---
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +-----------------
> >   1 file changed, 1 insertion(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 514b3060b141..406dd2e3f5a9 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1396,8 +1396,6 @@ static void guc_flush_destroyed_contexts(struct intel_guc *guc);
> >   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> >   {
> > -	int i;
> > -
> >   	if (unlikely(!guc_submission_initialized(guc))) {
> >   		/* Reset called during driver load? GuC not yet initialised! */
> >   		return;
> > @@ -1414,21 +1412,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> >   	guc_flush_submissions(guc);
> >   	guc_flush_destroyed_contexts(guc);
> > -
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
> >   	scrub_guc_desc_for_outstanding_g2h(guc);
> >   }
> 
