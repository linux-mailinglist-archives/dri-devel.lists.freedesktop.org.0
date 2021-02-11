Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237273196A0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 00:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38536EE83;
	Thu, 11 Feb 2021 23:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0A6EE82;
 Thu, 11 Feb 2021 23:30:38 +0000 (UTC)
IronPort-SDR: D34TRK3KXb2G93bisIM60noMm8t/QahgVlUNikkRsEEjVO7YC41UkTEveoGb1KFeSLygpyXN3A
 pygLghZtQZkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="267177920"
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; d="scan'208";a="267177920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 15:30:38 -0800
IronPort-SDR: B57FWrFYk3VPVhRoTkcZ5weZr9LrEurIJG/IzPDTFzp7+TTZx98V58j7KHGcvKDFA5/iYwZ39c
 IEzbv2NB0fMw==
X-IronPort-AV: E=Sophos;i="5.81,172,1610438400"; d="scan'208";a="381226333"
Received: from avinigue-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.209.142.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 15:30:37 -0800
Date: Thu, 11 Feb 2021 18:30:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v5 4/4] drm/i915/gen9_bc: Add W/A for missing
 STRAP config on TGP PCH + CML combos
Message-ID: <20210211233035.GA320726@intel.com>
References: <20210209212832.1401815-1-lyude@redhat.com>
 <20210209212832.1401815-5-lyude@redhat.com>
 <20210211032358.GD82362@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210211032358.GD82362@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Yijun Shen <Yijun.Shen@dell.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 10:23:58PM -0500, Rodrigo Vivi wrote:
> On Tue, Feb 09, 2021 at 04:28:31PM -0500, Lyude Paul wrote:
> > Apparently the new gen9_bc platforms that Intel has introduced don't
> > provide us with a STRAP config register to read from for initializing DDI
> > B, C, and D detection. So, workaround this by hard-coding our strap config
> > in intel_setup_outputs().
> > 
> > Changes since v4:
> > * Split this into it's own commit
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > [originally from Tejas's work]
> > Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index beed08c00b6c..4dee37f8659d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -11943,7 +11943,14 @@ static void intel_setup_outputs(struct drm_i915_private *dev_priv)
> >  
> >  		/* DDI B, C, D, and F detection is indicated by the SFUSE_STRAP
> >  		 * register */
> > -		found = intel_de_read(dev_priv, SFUSE_STRAP);
> > +		if (HAS_PCH_TGP(dev_priv)) {
> > +			/* W/A due to lack of STRAP config on TGP PCH*/
> > +			found = (SFUSE_STRAP_DDIB_DETECTED |
> > +				 SFUSE_STRAP_DDIC_DETECTED |
> > +				 SFUSE_STRAP_DDID_DETECTED);
> 
> we have somewhere in this function these forced fuse straps for gen9 platform...
> don't we have a ways to combine them?
> 
> Afterall, the reason that we need these forced bits is
> because it is a gen9, not because it is a TGP...

just ignore my non-sense comment... I confused with the 
/* WaIgnoreDDIAStrap: skl */
above...
thought it was for all the ports... not just for port A...


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > +		} else {
> > +			found = intel_de_read(dev_priv, SFUSE_STRAP);
> > +		}
> >  
> >  		if (found & SFUSE_STRAP_DDIB_DETECTED)
> >  			intel_ddi_init(dev_priv, PORT_B);
> > -- 
> > 2.29.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
