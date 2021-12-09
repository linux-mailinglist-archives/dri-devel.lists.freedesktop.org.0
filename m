Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B02146F487
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 21:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B9110E251;
	Thu,  9 Dec 2021 20:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2B310E247;
 Thu,  9 Dec 2021 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639080164; x=1670616164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8W3uF+WvkzI5MoIcJ8uxIBtACctu1CfzNs7oIrUMd8A=;
 b=d52Lehdb0RvmNsdyX36MSKyara3jgzXg/0scsxiL+9gPlLMjz1chaDrX
 9cIbAchhkWa6IZLO3+9kbQV1bMPkvtNuvSE0tSQOeaGYGIyZIsZKBVXyJ
 6SIq6l2AysvBKta1+jwmpVl7hgiKbmYhzMyCWeaHtOur+E55CULgSGJFr
 ByiIDJ1di01uhHGcvz+Ir/xaV55nfhkBQhdLJdCkL58rUpc0nx7fELcoK
 KAq6CRISDyjMJ9Dj6jNaBNqWLulRNmr9qlvBvNvVnquErgN4X52Kds0iR
 LvTJiGQDF/1z3RKmvOoHWBC9xTnFvLwPpA5tt9niWhoOs6UNUH1VCLsDM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238420638"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="238420638"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 12:02:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="503630673"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 12:02:43 -0800
Date: Thu, 9 Dec 2021 11:57:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/i915/guc: Remove racey GEM_BUG_ON
Message-ID: <20211209195719.GA21632@jons-linux-dev-box>
References: <20211209185141.21292-1-matthew.brost@intel.com>
 <a6b95ad6-4c50-ff97-99ac-dc2a75625de9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6b95ad6-4c50-ff97-99ac-dc2a75625de9@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 11:26:09AM -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 12/9/2021 10:51 AM, Matthew Brost wrote:
> > A full GT can race with the last context put resulting in the context
> > ref count being zero but the destroyed bit not yet being set. Remove
> > GEM_BUG_ON in scrub_guc_desc_for_outstanding_g2h that asserts the
> > destroyed bit must be set in ref count is zero.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 9b7b4f4e0d91..0f99bb83293a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1040,8 +1040,6 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
> >   		spin_unlock(&ce->guc_state.lock);
> > -		GEM_BUG_ON(!do_put && !destroyed);
> > -
> 
> Do we need to re-queue/flush the destroyer work to make sure it runs before
> we reset, or is it ok for that to run in parallel?
> 

The code in the put path will either see the reset or that it isn't
registered and destroy the context without any interaction with the GuC.

Matt

> Daniele
> 
> >   		if (pending_enable || destroyed || deregister) {
> >   			decr_outstanding_submission_g2h(guc);
> >   			if (deregister)
> 
