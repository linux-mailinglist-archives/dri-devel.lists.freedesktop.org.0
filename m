Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC9729349
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 10:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4867C10E127;
	Fri,  9 Jun 2023 08:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122D810E127;
 Fri,  9 Jun 2023 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686299771; x=1717835771;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4PWeI2YdqvEcWjPNjDUO90VPoEGU//3oJ+ybFCUP0wc=;
 b=Jq4l3K0fIr7r7LKSnhTlqTGj/ys7w0IHXHy+en3QFfkBklMI/c2fWgeR
 t656xrbI9XJt4vmFaoQ+CDDOc5qBPA8ySLq5Jc5HEYtUH6WiQ7Piu0DAG
 EtsKYuIu3NoCjaNgwXvCB96L751PKqWlPwijrtFmoGB3VJCyfP/3mOK93
 HKxXXIhPiqJwlAKZtTT2I6RbpfDVCh6XqvWb53u1fm4/qcExYxCRtD3Jf
 UOxgnyItbAwerRqsFCq2f0wajc6nTVp2PcOqvU67zuB2E6mCwRHsUE/jb
 G45tMh72gG4oNVmHD734jaFLCoz05Z7J4DHfbDB3KWURigKau2CS0sS9a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337909126"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="337909126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="1040427846"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="1040427846"
Received: from skolhe-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.254])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:36:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: Cable type identification for DP2.1
In-Reply-To: <20230609055435.299584-1-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230609055435.299584-1-animesh.manna@intel.com>
Date: Fri, 09 Jun 2023 11:35:59 +0300
Message-ID: <874jnhrq1c.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Jun 2023, Animesh Manna <animesh.manna@intel.com> wrote:
> For DP alt mode display driver get the information
> about cable speed and cable type through TCSS_DDI_STATUS
> register which will be updated by type-c platform driver.
> Accodingly Update dpcd 0x110 with cable information before
> link training start. This change came part of DP2.1 SCR.

No need to refer to the SCR anymore, as DP 2.1 is out.

There are a bunch of detailed comments inline.

High level, this should probably be done much earlier. See Table 5-21 in
DP 2.1. We need to read DPCD 0x2217 before writing 0x110. The DPRX
updates 0x2217 before asserting hotplug, so we should probably read it
at detect where we read all other DPCD too.

How early is TCSS_DDI_STATUS available, should we read that at hotplug
too? For USB-C we should write to DPCD 0x110 the least common
denominator between DPCD 0x2217 and 0x110.

Another question which I didn't find an answer to yet, does writing
0x110 impact what the RPRX reports for capabilities i.e. can we proceed
with link training normally from there, *or* should we limit the
sink_rates/common_rates based on TCSS_DDI_STATUS and DPCD 0x2217
i.e. filter out UHBR as needed.

Please read bspec and DP 2.1 further to find answers.

>
> Note: This patch is not tested due to unavailability of
> cable. Sending as RFC for design review.
>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 57 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_tc.c  | 10 +++++
>  drivers/gpu/drm/i915/display/intel_tc.h  |  1 +
>  drivers/gpu/drm/i915/i915_reg.h          |  5 +++
>  include/drm/display/drm_dp.h             |  9 ++++
>  5 files changed, 82 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 70d44edd8c6e..3a0f6a3c9f98 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2208,6 +2208,55 @@ static void intel_dp_sink_set_msa_timing_par_ignore_state(struct intel_dp *intel
>  			    str_enable_disable(enable));
>  }
>  
> +#define CABLE_SPEED_SHIFT 4
> +
> +enum dp_cable_speed {
> +	DP_CABLE_HBR3 = 1,
> +	DP_CABLE_UHBR10,
> +	DP_CABLE_GEN3_UHBR20,
> +	DP_CABLE_GEN4_UHBR20
> +};
> +
> +static void intel_dp_set_cable_attributes(struct intel_dp *intel_dp,
> +					  u8 cable_attributes)

There are two "domains" for the cable information, the hardware register
and the DPCD register. However, cable_attributes is neither, but also
not helpful, which makes this function cumbersome.

Usually in cases like this, you'd pick one or the other, *or* if you
want to have a generic middle ground, you'd make it helpful and easy to
use and understand (e.g. a struct).

In this case, I'd just pick the DPCD as the format, because it's
platform independent and the whole thing is simple enough.

So this function would really reduce down to a single DPCD write.

> +{
> +	u8 cable_speed;
> +	bool active_cable, retimer;
> +	u8 cable_attr_dpcd;
> +
> +	cable_speed = cable_attributes >> CABLE_SPEED_SHIFT;
> +
> +	switch (cable_speed) {
> +	case DP_CABLE_HBR3:
> +		cable_attr_dpcd = 0;
> +		break;
> +	case DP_CABLE_UHBR10:
> +		cable_attr_dpcd = 1;
> +		break;
> +	case DP_CABLE_GEN3_UHBR20:
> +	case DP_CABLE_GEN4_UHBR20:
> +		cable_attr_dpcd = 2;
> +		break;
> +	default:
> +		cable_attr_dpcd = 0;
> +		break;
> +	}
> +
> +	active_cable = (cable_attributes << TCSS_DDI_STATUS_CABLE_ATTR_SHIFT) &
> +		       TCSS_DDI_STATUS_ACTIVE_CABLE;
> +	retimer = (cable_attributes << TCSS_DDI_STATUS_CABLE_ATTR_SHIFT) &
> +		  TCSS_DDI_STATUS_RETIMER_REDRIVER;
> +	if (retimer && active_cable)
> +		cable_attr_dpcd |= DP_CABLE_TYPE_RETIMER_ACTIVE;
> +	else if (active_cable)
> +		cable_attr_dpcd |= DP_CABLE_TYPE_LRD_ACTIVE;
> +	else
> +		cable_attr_dpcd |= DP_CABLE_TYPE_PASSIVE;
> +
> +	drm_dp_dpcd_writeb(&intel_dp->aux, DP_CABLE_ATTRIBUTES_UPDATED_BY_TX,
> +			   cable_attr_dpcd);
> +}
> +
>  static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
>  					const struct intel_crtc_state *crtc_state)
>  {
> @@ -2414,6 +2463,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  {
>  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>  	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
>  
>  	intel_dp_set_link_params(intel_dp,
>  				 crtc_state->port_clock,
> @@ -2480,6 +2530,13 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	intel_dp_check_frl_training(intel_dp);
>  	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
>  
> +	if (intel_tc_port_in_dp_alt_mode(dig_port)) {
> +		u8 cable_attributes;
> +
> +		cable_attributes = intel_tc_get_cable_attributes(dig_port);
> +		intel_dp_set_cable_attributes(intel_dp, cable_attributes);
> +	}
> +
>  	/*
>  	 * 6. The rest of the below are substeps under the bspec's "Enable and
>  	 * Train Display Port" step.  Note that steps that are specific to
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index 3ebf41859043..6b10a8839563 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -260,6 +260,16 @@ assert_tc_port_power_enabled(struct intel_tc_port *tc)
>  		    !intel_display_power_is_enabled(i915, tc_port_power_domain(tc)));
>  }
>  
> +u8 intel_tc_get_cable_attributes(struct intel_digital_port *dig_port)
> +{
> +	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> +	enum tc_port tc_port = intel_port_to_tc(i915, dig_port->base.port);

So I think this function should return the information in DPCD 0x110
format.

Read the register, convert to DPCD format, return. Make this the single
point of conversion between the two, and don't pass intermediate info
around.

Whoever calls this should then have DPCD 0x2217 and the info returned by
this function, and find the least common denominator, and update 0x110
accordingly. And *maybe* also update sink_rates/common_rates
accordingly.

> +
> +	return (intel_de_read(i915, TCSS_DDI_STATUS(tc_port)) &
> +		TCSS_DDI_STATUS_CABLE_ATTR_MASK) >>
> +		TCSS_DDI_STATUS_CABLE_ATTR_SHIFT;
> +}
> +
>  u32 intel_tc_port_get_lane_mask(struct intel_digital_port *dig_port)
>  {
>  	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.h b/drivers/gpu/drm/i915/display/intel_tc.h
> index 3b16491925fa..edafe92844b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.h
> +++ b/drivers/gpu/drm/i915/display/intel_tc.h
> @@ -43,5 +43,6 @@ int intel_tc_port_init(struct intel_digital_port *dig_port, bool is_legacy);
>  void intel_tc_port_cleanup(struct intel_digital_port *dig_port);
>  
>  bool intel_tc_cold_requires_aux_pw(struct intel_digital_port *dig_port);
> +u8 intel_tc_get_cable_attributes(struct intel_digital_port *dig_port);
>  
>  #endif /* __INTEL_TC_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0523418129c5..991ecf082b5c 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6576,6 +6576,11 @@ enum skl_power_gate {
>  #define TCSS_DDI_STATUS(tc)			_MMIO(_PICK_EVEN(tc, \
>  								 _TCSS_DDI_STATUS_1, \
>  								 _TCSS_DDI_STATUS_2))
> +#define  TCSS_DDI_STATUS_CABLE_ATTR_SHIFT	9
> +#define  TCSS_DDI_STATUS_CABLE_ATTR_MASK	REG_GENMASK(14, 9)

This "cable attr" thing defines something that I think should not be
used, a field in a register where you can't even use the other defines
to parse. Please remove it, and replace with mask and values for
CABLE_SPEED.

This reflects the comment on cable_attributes parameter in
intel_dp_set_cable_attributes().

> +#define  TCSS_DDI_STATUS_ACTIVE_CABLE		REG_BIT(11)
> +#define  TCSS_DDI_STATUS_CABLE_TYPE		REG_BIT(10)
> +#define  TCSS_DDI_STATUS_RETIMER_REDRIVER	REG_BIT(9)

Usually I promote following the spec for macro naming, but the above two
are silly.

I think the options are:

1) just define them for what they are:

#define  TCSS_DDI_STATUS_CABLE_TYPE_OPTICAL	REG_BIT(10)
#define  TCSS_DDI_STATUS_RETIMER		REG_BIT(9)

2) consider them reg fields:

#define  TCSS_DDI_STATUS_CABLE_TYPE		REG_GENMASK(10, 10)
#define  TCSS_DDI_STATUS_CABLE_TYPE_ELECTRICAL	REG_FIELD_PREP(TCSS_DDI_STATUS_CABLE_TYPE, 0)
#define  TCSS_DDI_STATUS_CABLE_TYPE_OPTICAL	REG_FIELD_PREP(TCSS_DDI_STATUS_CABLE_TYPE, 1)

#define  TCSS_DDI_STATUS_RETIMER_REDRIVER	REG_GENMASK(9, 9)
#define  TCSS_DDI_STATUS_REDRIVER		REG_FIELD_PREP(TCSS_DDI_STATUS_RETIMER_REDRIVER, 0)
#define  TCSS_DDI_STATUS_RETIMER		REG_FIELD_PREP(TCSS_DDI_STATUS_RETIMER_REDRIVER, 1)

I think the latter is just too verbose, so I'd go for 1).

>  #define  TCSS_DDI_STATUS_READY			REG_BIT(2)
>  #define  TCSS_DDI_STATUS_HPD_LIVE_STATUS_TBT	REG_BIT(1)
>  #define  TCSS_DDI_STATUS_HPD_LIVE_STATUS_ALT	REG_BIT(0)
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index b046f79f4744..dde715d567c2 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -654,6 +654,13 @@
>  # define DP_LANE13_POST_CURSOR2_SET_MASK    (3 << 4)
>  # define DP_LANE13_MAX_POST_CURSOR2_REACHED (1 << 6)
>  
> +#define DP_CABLE_ATTRIBUTES_UPDATED_BY_TX   0x110

Please use _DPTX suffix like in the spec.

/* 2.1 */ missing at the end.

The UHBR capabilities bits should be defined here.

> +# define DP_CABLE_TYPE_MASK		    (0x7 << 3)
> +# define DP_CABLE_TYPE_UNKNOWN		    (0x0 << 3)
> +# define DP_CABLE_TYPE_PASSIVE		    (0x1 << 3)
> +# define DP_CABLE_TYPE_LRD_ACTIVE	    (0x2 << 3)
> +# define DP_CABLE_TYPE_RETIMER_ACTIVE	    (0x3 << 3)

The values could just be decimal instead of hex.

> +
>  #define DP_MSTM_CTRL			    0x111   /* 1.2 */
>  # define DP_MST_EN			    (1 << 0)
>  # define DP_UP_REQ_EN			    (1 << 1)
> @@ -1139,6 +1146,8 @@
>  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_32_MS             0x05
>  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_64_MS             0x06
>  
> +#define DP_CABLE_ATTRIBUTES_UPDATED_BY_RX               0x2217 /* 2.1 */

Please use _DPRX suffix like in the spec.

> +
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
>  #define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250

-- 
Jani Nikula, Intel Open Source Graphics Center
