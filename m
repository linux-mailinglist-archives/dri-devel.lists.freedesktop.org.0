Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A477240D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B3710E28B;
	Mon,  7 Aug 2023 12:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E35E10E288;
 Mon,  7 Aug 2023 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691411415; x=1722947415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IA6vm99nYN9bBFgGHAGn5CJWx5F3Pxs12A9Zq94PDn8=;
 b=GsJ+ImFQTh0whnnOQhI9f7eh8OQ+yiL1o8PggeebW77VbYNWCXqod2Co
 7taQk+O11lYdd5susU3pJvlvZRmShRbXmwly6PGBvNjKAq1HGOPgp6cum
 HN38kjdTTTJhfynjZp6g4qMCWrmkY8HN43n1fJ+RZCkWN9ExPklamwI5H
 B4fbTF4vDPDy7H0+VZ5xEbwM01+++5TFtn2KvkGP/OWIsiTJeWHKJw0V3
 zp/UokHZVlbjf2uAQ7IcNWbfSclvA3cgyV83dEywii6X/o9eSzSOFd592
 Sj78zNPKYO7FbVTO2jX2zG1+MDKN1C1xibk0+MYexmuLszTgXHT/fB+GW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="374207759"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="374207759"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="734087145"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="734087145"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:30:12 -0700
Date: Mon, 7 Aug 2023 15:30:09 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 10/20] drm/i915/dp: Add functions to get min/max src
 input bpc with DSC
Message-ID: <ZNDj0bQ9tODvfw1y@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-11-ankit.k.nautiyal@intel.com>
 <ZMpGoijz4MnEZqeY@intel.com>
 <ff27c5c1-51fc-af95-faf2-b7caf79b984c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff27c5c1-51fc-af95-faf2-b7caf79b984c@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 09:42:34AM +0530, Nautiyal, Ankit K wrote:
> 
> On 8/2/2023 5:35 PM, Lisovskiy, Stanislav wrote:
> > On Fri, Jul 28, 2023 at 09:41:40AM +0530, Ankit Nautiyal wrote:
> > > Separate out functions for getting maximum and minimum input BPC based
> > > on platforms, when DSC is used.
> > > 
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++++++------
> > >   1 file changed, 30 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 7ec8a478e000..f41de126a8d3 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -1535,6 +1535,18 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
> > >   	return -EINVAL;
> > >   }
> > > +static
> > > +u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
> > > +{
> > > +	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> > > +	if (DISPLAY_VER(i915) >= 12)
> > > +		return 12;
> > > +	if (DISPLAY_VER(i915) == 11)
> > > +		return 10;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> > >   {
> > >   	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > > @@ -1542,11 +1554,12 @@ int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
> > >   	u8 dsc_bpc[3] = {0};
> > >   	u8 dsc_max_bpc;
> > > -	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> > > -	if (DISPLAY_VER(i915) >= 12)
> > > -		dsc_max_bpc = min_t(u8, 12, max_req_bpc);
> > > -	else
> > > -		dsc_max_bpc = min_t(u8, 10, max_req_bpc);
> > > +	dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(i915);
> > > +
> > > +	if (!dsc_max_bpc)
> > > +		return dsc_max_bpc;
> > > +
> > > +	dsc_max_bpc = min_t(u8, dsc_max_bpc, max_req_bpc);
> > >   	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
> > >   						       dsc_bpc);
> > > @@ -1674,6 +1687,16 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
> > >   	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
> > >   }
> > > +static
> > > +u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
> > > +{
> > > +	/* Min DSC Input BPC for ICL+ is 8 */
> > > +	if (DISPLAY_VER(i915) >= 11)
> > > +		return 8;
> > > +
> > > +	return 0;
> > So does it mean that for anything below gen 11, there is no limit at all?
> > Also it means that the condition below will never be executed for gen <= 11.
> 
> Hmm. Bspec says min bpc is 8 for DSC, so idea is to have min bpc as 8 when
> DSC is used.
> 
> This is supposed to be called only if DSC is supported, so perhaps HAS_DSC
> can be used?
> 
> return HAS_DSC(dev_priv) ? 8 : 0;
> 
> 
> Regards,
> 
> Ankit

Yeah, I think that might be better, since we actually car about if we support DSC
or not. HAS_DSC should do all the magic, to determine if we support it or not..

Stan

> 
> > 
> > Stan
> > 
> > > +}
> > > +
> > >   int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> > >   				struct intel_crtc_state *pipe_config,
> > >   				struct drm_connector_state *conn_state,
> > > @@ -1707,10 +1730,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> > >   		pipe_bpp = pipe_config->pipe_bpp;
> > >   	}
> > > -	/* Min Input BPC for ICL+ is 8 */
> > > -	if (pipe_bpp < 8 * 3) {
> > > +	if (pipe_bpp < intel_dp_dsc_min_src_input_bpc(dev_priv) * 3) {
> > >   		drm_dbg_kms(&dev_priv->drm,
> > > -			    "No DSC support for less than 8bpc\n");
> > > +			    "Computed BPC less than min supported by source for DSC\n");
> > >   		return -EINVAL;
> > >   	}
> > > -- 
> > > 2.40.1
> > > 
