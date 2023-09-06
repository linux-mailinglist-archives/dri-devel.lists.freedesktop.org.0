Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA8793AD5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331EC10E60F;
	Wed,  6 Sep 2023 11:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FA410E60A;
 Wed,  6 Sep 2023 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693998834; x=1725534834;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=w4tQP9x9OHpowH+0lZSdAZhSwTZJXOjy/ByWQMgmga0=;
 b=VSVKSXRTREq54ZDtM8QX/Ajwowe8EKeVR1LDwBXk5kDjj9Y1FgjJRBYa
 3iPAhkETWDt65+lPIW2DF9MvJxGSQdfk1Z1xpDYvA91xygDu4WpwYLc9O
 KLFN96kwGMx0Rb/2091KXPCdtiNkmY61SlZzfCsmR+VdHTgzbprjkuxj9
 3jsg1jtkibDKGnzHkjwJAaLP2bvOxgQz3HCVKftfFkkQosHyGj30/huNw
 HSW6tg6isvTXXHWIGcHuQpUW1zwNCYqb971SvDd6c6yxzzzlFYgzc/Z8T
 qa3uU/OgEiEywePMG8lxGvtQtZgNzzA5wFS9QAHQu7yONo77sHTYxVr1H g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379751622"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="379751622"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 04:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884651730"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="884651730"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 04:13:41 -0700
Date: Wed, 6 Sep 2023 14:14:10 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/22] drm/dp_mst: Fix fractional bpp
 scaling in drm_dp_calc_pbn_mode()
Message-ID: <ZPhfAhm4WOyJkOal@ideak-desk.fi.intel.com>
References: <20230824080517.693621-1-imre.deak@intel.com>
 <20230824080517.693621-10-imre.deak@intel.com>
 <ZPVGl4iQEvgtZz3f@intel.com>
 <ZPWv4y2kEgWQFcZw@ideak-desk.fi.intel.com>
 <ZPhYX4Enr_jJXigm@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPhYX4Enr_jJXigm@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 06, 2023 at 01:45:51PM +0300, Ville Syrjälä wrote:
> On Mon, Sep 04, 2023 at 01:22:27PM +0300, Imre Deak wrote:
> > On Mon, Sep 04, 2023 at 05:53:11AM +0300, Ville Syrjälä wrote:
> > > On Thu, Aug 24, 2023 at 11:05:04AM +0300, Imre Deak wrote:
> > > > For fractional bpp values passed to the function in a .4 fixed point
> > > > format, the fractional part is currently ignored due to scaling bpp too
> > > > early. Fix this by scaling the overhead factor instead and to avoid an
> > > > overflow multiplying bpp with the overhead factor instead of the clock
> > > > rate.
> > > > 
> > > > While at it simplify the formula, and pass the expected fixed point bpp
> > > > values in the kunit tests.
> > > > 
> > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c  | 7 ++-----
> > > >  drivers/gpu/drm/tests/drm_dp_mst_helper_test.c | 8 ++++----
> > > >  2 files changed, 6 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > index ed96cfcfa3040..bd0f35a0ea5fb 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > @@ -4712,12 +4712,9 @@ int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
> > > >  	 * factor in the numerator rather than the denominator to avoid
> > > >  	 * integer overflow
> > > >  	 */
> > > > +	u32 bpp_m = (dsc ? 64 / 16 : 64) * 1006 * bpp;
> > > >  
> > > > -	if (dsc)
> > > > -		return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 * 1006),
> > > > -					8 * 54 * 1000 * 1000);
> > > > -
> > > > -	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
> > > > +	return DIV_ROUND_UP_ULL(mul_u32_u32(clock, bpp_m),
> > > >  				8 * 54 * 1000 * 1000);
> > > 
> > > I thought I sorted out this mess already...
> > > https://patchwork.freedesktop.org/patch/535005/?series=117201&rev=3
> > > Apparently I forgot to push that.
> > 
> > Looks ok, can use that instead. I thought clock * bpp could overflow,
> > but probably not in practice.
> 
> 2^32/(16*3*2^4)~=5.6e6 -> 5.6 GHz dotclock. So should be good for
> a few more years.

Right.

> But we can of course move bpp to the other side
> of the mul_u32_u32() as you do here and then we don't have anything
> to worry about as everything else there is constant.

Either way is ok, could also just add a multiply_overflows check if it
makes sense.

> > The test cases below would still need to be fixed.
> 
> I thought I fixed the tests as well? Maybe they changed...

The .dsc = true cases could've been added only later, but there
.expected changes after you pass the correctly shifted bpp.

> > > 
> > > >  }
> > > >  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
> > > > diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> > > > index 545beea33e8c7..ea2182815ebe8 100644
> > > > --- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> > > > +++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> > > > @@ -40,15 +40,15 @@ static const struct drm_dp_mst_calc_pbn_mode_test drm_dp_mst_calc_pbn_mode_cases
> > > >  	},
> > > >  	{
> > > >  		.clock = 332880,
> > > > -		.bpp = 24,
> > > > +		.bpp = 24 << 4,
> > > >  		.dsc = true,
> > > > -		.expected = 50
> > > > +		.expected = 1191
> > > >  	},
> > > >  	{
> > > >  		.clock = 324540,
> > > > -		.bpp = 24,
> > > > +		.bpp = 24 << 4,
> > > >  		.dsc = true,
> > > > -		.expected = 49
> > > > +		.expected = 1161
> > > >  	},
> > > >  };
> > > >  
> > > > -- 
> > > > 2.37.2
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> 
> -- 
> Ville Syrjälä
> Intel
