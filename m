Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B13FBA48
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD7589A86;
	Mon, 30 Aug 2021 16:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85CB89A86;
 Mon, 30 Aug 2021 16:43:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="240547750"
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="240547750"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 09:43:02 -0700
X-IronPort-AV: E=Sophos;i="5.84,363,1620716400"; d="scan'208";a="530497798"
Received: from jasauer1-mobl4.amr.corp.intel.com (HELO intel.com)
 ([10.255.38.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 09:43:00 -0700
Date: Mon, 30 Aug 2021 12:42:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Imre Deak <imre.deak@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <seanpaul@chromium.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/dp: Use max params for panels <
 eDP 1.4
Message-ID: <YS0KkvYfvwbQTjfC@intel.com>
References: <20210820075301.693099-1-kai.heng.feng@canonical.com>
 <YR/ltlF5jRTYzQ3F@intel.com> <YSfRXjuRWa57uxXN@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSfRXjuRWa57uxXN@intel.com>
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

On Thu, Aug 26, 2021 at 01:37:34PM -0400, Rodrigo Vivi wrote:
> On Fri, Aug 20, 2021 at 08:26:14PM +0300, Ville Syrjälä wrote:
> > On Fri, Aug 20, 2021 at 03:52:59PM +0800, Kai-Heng Feng wrote:
> > > Users reported that after commit 2bbd6dba84d4 ("drm/i915: Try to use
> > > fast+narrow link on eDP again and fall back to the old max strategy on
> > > failure"), the screen starts to have wobbly effect.
> > > 
> > > Commit a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for
> > > everything") doesn't help either, that means the affected eDP 1.2 panels
> > > only work with max params.
> > > 
> > > So use max params for panels < eDP 1.4 as Windows does to solve the
> > > issue.
> > > 
> > > v3:
> > >  - Do the eDP rev check in intel_edp_init_dpcd()
> > > 
> > > v2:
> > >  - Check eDP 1.4 instead of DPCD 1.1 to apply max params
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3714
> > > Fixes: 2bbd6dba84d4 ("drm/i915: Try to use fast+narrow link on eDP again and fall back to the old max strategy on failure")
> > > Fixes: a5c936add6a2 ("drm/i915/dp: Use slow and wide link training for everything")
> > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > 
> > Slapped a cc:stable on it and pushed to drm-intel-next. Thanks.
> 
> Since I got a strange failure on CI_DIF_604 that I don't see on CI_DIF_603,
> I'm avoiding the display patches. This one and also
> dab1b47e57e0 ("drm/i915/dp: return proper DPRX link training result")
> 
> I know, it is probably the other one, but I had to remove both patches for
> now and I'm not confident the CI will allow me to test with this one alone.
> 
> If we have -rc8 I will check again later. Otherwise we will have to send
> to the stable mailing list later.

CI didn't run on TGL again, so I couldn't send this patch last week.
And 5.14 got released.

If this is important for 5.14 or any other stable release, please
confirm this is not the one breaking linking training on TGL and then
please send it to the stable mailing list.

https://www.kernel.org/doc/Documentation/process/stable-kernel-rules.rst

Sorry,
Rodrigo.

> 
> > 
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 75d4ebc669411..e0dbd35ae7bc0 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -2445,11 +2445,14 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> > >  	 */
> > >  	if (drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
> > >  			     intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) ==
> > > -			     sizeof(intel_dp->edp_dpcd))
> > > +			     sizeof(intel_dp->edp_dpcd)) {
> > >  		drm_dbg_kms(&dev_priv->drm, "eDP DPCD: %*ph\n",
> > >  			    (int)sizeof(intel_dp->edp_dpcd),
> > >  			    intel_dp->edp_dpcd);
> > >  
> > > +		intel_dp->use_max_params = intel_dp->edp_dpcd[0] < DP_EDP_14;
> > > +	}
> > > +
> > >  	/*
> > >  	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
> > >  	 * for SET_POWER_CAPABLE bit in intel_dp->edp_dpcd[1]
> > > -- 
> > > 2.32.0
> > 
> > -- 
> > Ville Syrjälä
> > Intel
