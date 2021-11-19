Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F12457514
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 18:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21F56EB68;
	Fri, 19 Nov 2021 17:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17EE6EB68;
 Fri, 19 Nov 2021 17:12:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="258243866"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="258243866"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 09:11:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="506551909"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 09:11:56 -0800
Date: Fri, 19 Nov 2021 09:11:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013 to DG2
Message-ID: <20211119171155.GB2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-6-matthew.d.roper@intel.com>
 <8be6ba7e22774dd2ca42518f0a9af3cf5dd19d1f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8be6ba7e22774dd2ca42518f0a9af3cf5dd19d1f.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 08:36:56AM -0800, Souza, Jose wrote:
> On Tue, 2021-11-16 at 09:48 -0800, Matt Roper wrote:
> > From: Matt Atwood <matthew.s.atwood@intel.com>
> > 
> > Extend existing workaround 1409120013 to DG2.
> > 
> > Cc: José Roberto de Souza <jose.souza@intel.com>
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
> 
> I'm not finding this workaround in the DG2 WA spec page, maybe it was removed because it is not necessary anymore?

Ville raised the same question; I believe this is just an issue with the
query that generates the bspec page from the database; here's my earlier
response:

        >> This seems to be problem with the DG2 query since for some
        >> reason they marked this workaround as
        >> 'driver_change_required' rather than 'driver_permanent_wa' in
        >> the database and that prevents it from showing up in some of
        >> the queries properly.  The DG2-specific ID number to check is
        >> 1409222275.

Since it appears this is currently needed on every version 12 and
version 13 display platform _except_ for ADL-P, I did send a question to
the HW team to confirm that the lack of ADL-P isn't an oversight, but I
haven't heard back yet.


Matt

> 
> >  	if (IS_TIGERLAKE(dev_priv) || IS_ROCKETLAKE(dev_priv) ||
> > -	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv))
> > +	    IS_ALDERLAKE_S(dev_priv) || IS_DG1(dev_priv) || IS_DG2(dev_priv))
> >  		intel_uncore_write(&dev_priv->uncore, ILK_DPFC_CHICKEN,
> >  				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
> >  
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
