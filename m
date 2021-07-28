Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88643D8536
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8029A6EC09;
	Wed, 28 Jul 2021 01:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D806EBFB;
 Wed, 28 Jul 2021 01:06:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209446141"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209446141"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 18:06:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="665687327"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 18:06:14 -0700
Date: Wed, 28 Jul 2021 01:06:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 07/15] drm/i915/guc/slpc: Remove BUG_ON in
 guc_submission_disable
Message-ID: <20210728010613.GA50866@DUT151-ICLU.fm.intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-8-vinay.belgaumkar@intel.com>
 <20210728002037.GA50251@DUT151-ICLU.fm.intel.com>
 <5c3a11b6-ca8c-cea0-7a94-e70e01ee9d2c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c3a11b6-ca8c-cea0-7a94-e70e01ee9d2c@intel.com>
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

On Tue, Jul 27, 2021 at 06:01:18PM -0700, Belgaumkar, Vinay wrote:
> 
> 
> On 7/27/2021 5:20 PM, Matthew Brost wrote:
> > On Mon, Jul 26, 2021 at 12:07:52PM -0700, Vinay Belgaumkar wrote:
> > > The assumption when it was added was there would be no wakerefs
> > > held. However, if we fail to enable SLPC, we will still be
> > > holding a wakeref.
> > > 
> > 
> > So this is if intel_guc_slpc_enable() fails, right? Not seeing where the
> > wakeref is taken. It also seems wrong not to drop the wakeref before
> > calling intel_guc_submission_disable, hence the GEM_BUG_ON in this
> > function.
> > 
> > Can you explain this bit more?
> 
> I should change the desc a little. The BUG_ON assumed GT would not be awake
> i.e at shutdown, and there would be 0 GT_PM references. However, this
> slpc_enable is in gt_resume path (gt_init_hw calls uc_init_hw). Here,
> gt_pm_get reference is held, so it will result in BUG_ON when
> submission_disable is called.
> 

Ok, I see the code path. With a better commit message:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Thanks,
> Vinay.
> > 
> > Matt
> > 
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ----
> > >   1 file changed, 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index b6338742a594..48cbd800ca54 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -2523,10 +2523,6 @@ void intel_guc_submission_enable(struct intel_guc *guc)
> > >   void intel_guc_submission_disable(struct intel_guc *guc)
> > >   {
> > > -	struct intel_gt *gt = guc_to_gt(guc);
> > > -
> > > -	GEM_BUG_ON(gt->awake); /* GT should be parked first */
> > > -
> > >   	/* Note: By the time we're here, GuC may have already been reset */
> > >   }
> > > -- 
> > > 2.25.0
> > > 
