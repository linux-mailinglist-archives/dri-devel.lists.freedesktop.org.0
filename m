Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B950454D6E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 19:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F906E81F;
	Wed, 17 Nov 2021 18:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95996E7E2;
 Wed, 17 Nov 2021 18:51:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="297450041"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="297450041"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:51:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="472839433"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:51:41 -0800
Date: Wed, 17 Nov 2021 10:51:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013 to
 DG2
Message-ID: <20211117185139.GD2020422@mdroper-desk1.amr.corp.intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-6-matthew.d.roper@intel.com>
 <YZVNR9i5nkJZIORP@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZVNR9i5nkJZIORP@intel.com>
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

On Wed, Nov 17, 2021 at 08:43:19PM +0200, Ville Syrj�l� wrote:
> On Tue, Nov 16, 2021 at 09:48:18AM -0800, Matt Roper wrote:
> > From: Matt Atwood <matthew.s.atwood@intel.com>
> > 
> > Extend existing workaround 1409120013 to DG2.
> 
> I don't see this listed for DG2.

This seems to be problem with the DG2 query since for some reason they
marked this workaround as 'driver_change_required' rather than
'driver_permanent_wa' in the database and that prevents it from showing
up in some of the queries properly.  The DG2-specific ID number
to check is 1409222275.


Matt

> 
> > 
> > Cc: Jos� Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/intel_pm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> > index 89dc7f69baf3..e721c421cc58 100644
> > --- a/drivers/gpu/drm/i915/intel_pm.c
> > +++ b/drivers/gpu/drm/i915/intel_pm.c
> > @@ -7444,9 +7444,9 @@ static void icl_init_clock_gating(struct drm_i915_private *dev_priv)
> >  
> >  static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
> >  {
> > -	/* Wa_1409120013:tgl,rkl,adl-s,dg1 */
> > +	/* Wa_1409120013:tgl,rkl,adl-s,dg1,dg2 */
> >  	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv) ||
> > -	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv))
> > +	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv) || IS_DG2(dev_priv))
> >  		intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN,
> >  				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
> >  
> > -- 
> > 2.33.0
> 
> -- 
> Ville Syrj�l�
> Intel

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
