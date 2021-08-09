Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0081F3E4CB0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 21:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D3189180;
	Mon,  9 Aug 2021 19:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC8889180;
 Mon,  9 Aug 2021 19:06:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="195026834"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="195026834"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:06:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="671020580"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:06:58 -0700
Date: Mon, 9 Aug 2021 19:06:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 21/46] drm/i915/guc: Add
 guc_child_context_destroy
Message-ID: <20210809190657.GA123873@DUT151-ICLU.fm.intel.com>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-22-matthew.brost@intel.com>
 <YRFLbB2Ayzf+KDz/@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRFLbB2Ayzf+KDz/@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 05:36:12PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:18PM -0700, Matthew Brost wrote:
> > Since child contexts do not own the guc_ids or GuC context registration,
> > child contexts can simply be freed on destroy. Add
> > guc_child_context_destroy context operation to do this.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 2d8296bcc583..850edeff9230 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -2828,6 +2828,13 @@ static void destroy_worker_func(struct work_struct *w)
> >  		intel_gt_pm_unpark_work_add(gt, destroy_worker);
> >  }
> >  
> > +/* Future patches will use this function */
> > +__maybe_unused
> 
> Pure bikeshed, but for something this small just squash it in with the
> first user. This kinda does nothing alone.
> -Daniel
> 

Sure.

Matt

> > +static void guc_child_context_destroy(struct kref *kref)
> > +{
> > +	__guc_context_destroy(container_of(kref, struct intel_context, ref));
> > +}
> > +
> >  static void guc_context_destroy(struct kref *kref)
> >  {
> >  	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
