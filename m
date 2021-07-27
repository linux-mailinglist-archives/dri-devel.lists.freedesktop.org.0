Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1353D836C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5916EB30;
	Tue, 27 Jul 2021 22:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4226EB2B;
 Tue, 27 Jul 2021 22:50:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209431461"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209431461"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 15:50:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="517137526"
Received: from dut151-iclu.fm.intel.com ([10.105.23.43])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 15:50:31 -0700
Date: Tue, 27 Jul 2021 22:50:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 03/15] drm/i915/guc/slpc: Gate Host RPS when SLPC is
 enabled
Message-ID: <20210727225030.GA49719@DUT151-ICLU.fm.intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-4-vinay.belgaumkar@intel.com>
 <20210727224402.GA49579@DUT151-ICLU.fm.intel.com>
 <b7a66767-507f-ad40-f58b-c61acb87b0e3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7a66767-507f-ad40-f58b-c61acb87b0e3@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 03:48:23PM -0700, Belgaumkar, Vinay wrote:
> 
> 
> On 7/27/2021 3:44 PM, Matthew Brost wrote:
> > On Mon, Jul 26, 2021 at 12:07:48PM -0700, Vinay Belgaumkar wrote:
> > > Also ensure uc_init is called before we initialize RPS so that we
> > > can check for SLPC support. We do not need to enable up/down
> > > interrupts when SLPC is enabled. However, we still need the ARAT
> > > interrupt, which will be enabled separately later.
> > > 
> > 
> > Do we not need a check for rps_uses_slpc in intel_rps_enable? I guessing
> > there is a reason why we don't but can't seem to figure that out.
> 
> Yeah, it's due to this check in there -
> if (rps->max_freq <= rps->min_freq)
>                 /* leave disabled, no room for dynamic reclocking */;
> 
> With slpc, rps->max_freq and rps->min freq remain uninitialized, so the if
> condition just falls through and returns with this-
> if (!enabled)

I'd add a comment explaining that or add an explict check.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>                 return;
> 
> Thanks,
> Vinay.
> 
> > 
> > Matt
> > 
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gt.c  |  2 +-
> > >   drivers/gpu/drm/i915/gt/intel_rps.c | 20 ++++++++++++++++++++
> > >   2 files changed, 21 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > index a64aa43f7cd9..04dd69bcf6cb 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > @@ -41,8 +41,8 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
> > >   	intel_gt_init_timelines(gt);
> > >   	intel_gt_pm_init_early(gt);
> > > -	intel_rps_init_early(&gt->rps);
> > >   	intel_uc_init_early(&gt->uc);
> > > +	intel_rps_init_early(&gt->rps);
> > >   }
> > >   int intel_gt_probe_lmem(struct intel_gt *gt)
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > index 0c8e7f2b06f0..e858eeb2c59d 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > @@ -37,6 +37,13 @@ static struct intel_uncore *rps_to_uncore(struct intel_rps *rps)
> > >   	return rps_to_gt(rps)->uncore;
> > >   }
> > > +static bool rps_uses_slpc(struct intel_rps *rps)
> > > +{
> > > +	struct intel_gt *gt = rps_to_gt(rps);
> > > +
> > > +	return intel_uc_uses_guc_slpc(&gt->uc);
> > > +}
> > > +
> > >   static u32 rps_pm_sanitize_mask(struct intel_rps *rps, u32 mask)
> > >   {
> > >   	return mask & ~rps->pm_intrmsk_mbz;
> > > @@ -167,6 +174,8 @@ static void rps_enable_interrupts(struct intel_rps *rps)
> > >   {
> > >   	struct intel_gt *gt = rps_to_gt(rps);
> > > +	GEM_BUG_ON(rps_uses_slpc(rps));
> > > +
> > >   	GT_TRACE(gt, "interrupts:on rps->pm_events: %x, rps_pm_mask:%x\n",
> > >   		 rps->pm_events, rps_pm_mask(rps, rps->last_freq));
> > > @@ -771,6 +780,8 @@ static int gen6_rps_set(struct intel_rps *rps, u8 val)
> > >   	struct drm_i915_private *i915 = rps_to_i915(rps);
> > >   	u32 swreq;
> > > +	GEM_BUG_ON(rps_uses_slpc(rps));
> > > +
> > >   	if (GRAPHICS_VER(i915) >= 9)
> > >   		swreq = GEN9_FREQUENCY(val);
> > >   	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> > > @@ -861,6 +872,9 @@ void intel_rps_park(struct intel_rps *rps)
> > >   {
> > >   	int adj;
> > > +	if (!intel_rps_is_enabled(rps))
> > > +		return;
> > > +
> > >   	GEM_BUG_ON(atomic_read(&rps->num_waiters));
> > >   	if (!intel_rps_clear_active(rps))
> > > @@ -1829,6 +1843,9 @@ void intel_rps_init(struct intel_rps *rps)
> > >   {
> > >   	struct drm_i915_private *i915 = rps_to_i915(rps);
> > > +	if (rps_uses_slpc(rps))
> > > +		return;
> > > +
> > >   	if (IS_CHERRYVIEW(i915))
> > >   		chv_rps_init(rps);
> > >   	else if (IS_VALLEYVIEW(i915))
> > > @@ -1885,6 +1902,9 @@ void intel_rps_init(struct intel_rps *rps)
> > >   void intel_rps_sanitize(struct intel_rps *rps)
> > >   {
> > > +	if (rps_uses_slpc(rps))
> > > +		return;
> > > +
> > >   	if (GRAPHICS_VER(rps_to_i915(rps)) >= 6)
> > >   		rps_disable_interrupts(rps);
> > >   }
> > > -- 
> > > 2.25.0
> > > 
