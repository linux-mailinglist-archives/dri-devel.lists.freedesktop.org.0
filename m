Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604129B923E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BA610E9BF;
	Fri,  1 Nov 2024 13:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/nvMyET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CBB10E2DF;
 Fri,  1 Nov 2024 13:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730468595; x=1762004595;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=yRwKjhcSgfpvoI02LRXx6jkqVbevSG9nk+9Aecvc8cs=;
 b=Z/nvMyETKZELXfW8rfoeOjZsCSSmlVZ/LonTorcg7iYuD58tIT0khQ4t
 Qu96KAhozO9gD9wkKbQEFQx3/gK5TxSeOPXlknQsiFsrbCJbuXe5ckiOH
 fUPtYC99Cgj572xNlWdyfhV3xX+6kBEHF92PAvtGJl2ezdgi5yD86NrSg
 ofwAmTiv605P7u9IwP/J9bpRw/c6EENCDk6NTTs7/hB4t9bxRSWnp1D1i
 Vzw3iCVNg8pTTLIgAdVbxhY7DOnjZQFKfmSgtF938UNArqiOk1Xte0SJ5
 VTFUAFpVUO7ZV47b8DehILKNFkD0bfc8l7CXw+12JUizNCxkij5f5KRXa w==;
X-CSE-ConnectionGUID: FU18R+02Q8yc8B2XBFhNpQ==
X-CSE-MsgGUID: Mrf5O6kWQ0y1ygsqgOY7vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30119595"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="30119595"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:43:14 -0700
X-CSE-ConnectionGUID: CtpAB3qsR6W4H/fE6wenmA==
X-CSE-MsgGUID: WFZ06Jv9TcCfH+msyxeG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="87506784"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:43:07 -0700
Date: Fri, 1 Nov 2024 15:43:40 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Abel Vesa <abel.vesa@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <ZyTbDELVW5vqFoMS@ideak-desk.fi.intel.com>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-1-cafbb9855f40@linaro.org>
 <ZyPxLpykHkO9Xx_R@ideak-desk.fi.intel.com>
 <87msijjol6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msijjol6.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 01, 2024 at 11:22:13AM +0200, Jani Nikula wrote:
> On Thu, 31 Oct 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Thu, Oct 31, 2024 at 05:12:45PM +0200, Abel Vesa wrote:
> >> According to the DisplayPort standard, LTTPRs have two operating
> >> modes:
> >>  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >>    requests, while passes through all other AUX requests
> >>  - transparent - it passes through all AUX requests.
> >> 
> >> Switching between this two modes is done by the DPTX by issuing
> >> an AUX write to the DPCD PHY_REPEATER_MODE register.
> >> 
> >> Add a generic helper that allows switching between these modes.
> >> 
> >> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >> ---
> >>  drivers/gpu/drm/display/drm_dp_helper.c | 17 +++++++++++++++++
> >>  include/drm/display/drm_dp_helper.h     |  1 +
> >>  2 files changed, 18 insertions(+)
> >> 
> >> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> >> index 6ee51003de3ce616c3a52653c2f1979ad7658e21..38d612345986ad54b42228902ea718a089d169c4 100644
> >> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> >> @@ -2694,6 +2694,23 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> >>  }
> >>  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
> >>  
> >> +/**
> >> + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> >> + * @aux: DisplayPort AUX channel
> >> + * @enable: Enable or disable transparent mode
> >> + *
> >> + * Returns 0 on success or a negative error code on failure.
> >
> > Should be "Returns 1 on success".
> 
> But is that a sensible return value?

It matches what the function returns, but yes, would make more sense to
fix the return value instead to be 0 in case of success.

> >
> >> + */
> >> +
> 
> Superfluous newline.
> 
> >> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> >> +{
> >> +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >> +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >> +
> >> +	return drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> >> +}
> >> +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> >> +
> >>  /**
> >>   * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
> >>   * @caps: LTTPR common capabilities
> >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> index 279624833ea9259809428162f4e845654359f8c9..8821ab2d36b0e04d38ccbdddcb703b34de7ed680 100644
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -625,6 +625,7 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
> >>  			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> >>  int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
> >>  int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> >> +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
> >>  int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
> >>  bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> >>  bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> >> 
> >> -- 
> >> 2.34.1
> >> 
> 
> -- 
> Jani Nikula, Intel
