Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD43EA776
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 17:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C568B6E418;
	Thu, 12 Aug 2021 15:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961E66E418
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 15:23:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="237409643"
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="237409643"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 08:23:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; d="scan'208";a="527859147"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 08:23:34 -0700
Date: Thu, 12 Aug 2021 15:23:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: gfx-internal-devel@eclists.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/i915/guc: Flush the work queue for GuC generated
 G2H
Message-ID: <20210812152330.GA480603@DUT151-ICLU.fm.intel.com>
References: <20210811011622.255784-1-matthew.brost@intel.com>
 <20210811011622.255784-6-matthew.brost@intel.com>
 <YRUsEAowykuHCjUM@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRUsEAowykuHCjUM@phenom.ffwll.local>
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

On Thu, Aug 12, 2021 at 04:11:28PM +0200, Daniel Vetter wrote:
> On Wed, Aug 11, 2021 at 01:16:18AM +0000, Matthew Brost wrote:
> > Flush the work queue for GuC generated G2H messages durinr a GT reset.
> > This is accomplished by spinning on the the list of outstanding G2H to
> > go empty.
> > 
> > Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 3cd2da6f5c03..e5eb2df11b4a 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -727,6 +727,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
> >  			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> >  		} while (!list_empty(&guc->ct.requests.incoming));
> >  	}
> > +
> > +	/* Flush any GuC generated G2H */
> > +	while (!list_empty(&guc->ct.requests.incoming))
> > +		msleep(20);
> 
> flush_work or flush_workqueue, beacuse that comes with lockdep
> annotations. Dont hand-roll stuff like this if at all possible.

lockdep puked when used that.

Matt

> -Daniel
> 
> > +
> >  	scrub_guc_desc_for_outstanding_g2h(guc);
> >  }
> >  
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
