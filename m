Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F941F500
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 20:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FCE6EEAD;
	Fri,  1 Oct 2021 18:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D326EEA4;
 Fri,  1 Oct 2021 18:33:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="205686864"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="205686864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 11:33:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="619325258"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 11:33:26 -0700
Date: Fri, 1 Oct 2021 11:33:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 CQ Tang <cq.tang@intel.com>
Subject: Re: [PATCH] drm/i915: Use fixed offset for PTEs location
Message-ID: <20211001183325.GE3389343@mdroper-desk1.amr.corp.intel.com>
References: <20210926201005.1450-1-michal.wajdeczko@intel.com>
 <20210930220118.GZ3389343@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930220118.GZ3389343@mdroper-desk1.amr.corp.intel.com>
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

On Thu, Sep 30, 2021 at 03:01:19PM -0700, Matt Roper wrote:
> On Sun, Sep 26, 2021 at 10:10:05PM +0200, Michal Wajdeczko wrote:
> > We assumed that for all modern GENs the PTEs and register space are
> > split in the GTTMMADR BAR, but while it is true, we should rather use
> > fixed offset as it is defined in the specification.
> > 
> > Bspec: 4409, 4457, 4604, 11181, 9027, 13246, 13321, 44980
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: CQ Tang <cq.tang@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Matches the descriptions on all the various bspec pages.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

And applied to drm-intel-gt-next.  Thanks for the patch.


Matt

> 
> > ---
> >  drivers/gpu/drm/i915/gt/intel_ggtt.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > index ba7c7ed89fa8..f17383e76eb7 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> > @@ -813,6 +813,21 @@ static unsigned int chv_get_total_gtt_size(u16 gmch_ctrl)
> >  	return 0;
> >  }
> >  
> > +static unsigned int gen6_gttmmadr_size(struct drm_i915_private *i915)
> > +{
> > +	/*
> > +	 * GEN6: GTTMMADR size is 4MB and GTTADR starts at 2MB offset
> > +	 * GEN8: GTTMMADR size is 16MB and GTTADR starts at 8MB offset
> > +	 */
> > +	GEM_BUG_ON(GRAPHICS_VER(i915) < 6);
> > +	return (GRAPHICS_VER(i915) < 8) ? SZ_4M : SZ_16M;
> > +}
> > +
> > +static unsigned int gen6_gttadr_offset(struct drm_i915_private *i915)
> > +{
> > +	return gen6_gttmmadr_size(i915) / 2;
> > +}
> > +
> >  static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
> >  {
> >  	struct drm_i915_private *i915 = ggtt->vm.i915;
> > @@ -821,8 +836,8 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
> >  	u32 pte_flags;
> >  	int ret;
> >  
> > -	/* For Modern GENs the PTEs and register space are split in the BAR */
> > -	phys_addr = pci_resource_start(pdev, 0) + pci_resource_len(pdev, 0) / 2;
> > +	GEM_WARN_ON(pci_resource_len(pdev, 0) != gen6_gttmmadr_size(i915));
> > +	phys_addr = pci_resource_start(pdev, 0) + gen6_gttadr_offset(i915);
> >  
> >  	/*
> >  	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
