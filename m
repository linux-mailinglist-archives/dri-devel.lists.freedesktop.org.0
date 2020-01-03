Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088EB12FF46
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 00:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D8A6E378;
	Fri,  3 Jan 2020 23:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4884C892CC;
 Fri,  3 Jan 2020 23:50:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2020 15:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,392,1571727600"; d="scan'208";a="222297727"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga003.jf.intel.com with ESMTP; 03 Jan 2020 15:50:32 -0800
Date: Fri, 3 Jan 2020 15:51:36 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 8/9] drm/i915/dp: Update the pattern as
 per request
Message-ID: <20200103235136.GC2608@intel.com>
References: <20191230161523.32222-1-animesh.manna@intel.com>
 <20191230161523.32222-9-animesh.manna@intel.com>
 <87sgkytdod.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sgkytdod.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: nidhi1.gupta@intel.com, Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 02, 2020 at 11:23:14AM +0200, Jani Nikula wrote:
> On Mon, 30 Dec 2019, Animesh Manna <animesh.manna@intel.com> wrote:
> > As per request from DP phy compliance test few special
> > test pattern need to set by source. Added function
> > to set pattern in DP_COMP_CTL register. It will be
> > called along with other test parameters like vswing,
> > pre-emphasis programming in atomic_commit_tail path.
> >
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 55 +++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index cbefda9b6204..7c3f65e5d88b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5005,6 +5005,61 @@ static u8 intel_dp_prepare_phytest(struct intel_dp *intel_dp)
> >  	return DP_TEST_ACK;
> >  }
> >  
> > +static inline void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> 
> As a general rule, please only use the inline keyword for static inlines
> in headers. Sometimes, it's useful in small helpers, but usually you
> should just let the compiler decide what gets inlined.
> 
> In this case, the inline probably just hides the compiler warning about
> the unused function.
> 
> BR,
> Jani.
>

Yes I completely agree with Jani here, please do not use inline
other than some one line helpers in header files.
 
> > +{
> > +	struct drm_i915_private *dev_priv =
> > +			to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
> > +	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
> > +	struct drm_dp_phy_test_params *data =
> > +			&intel_dp->compliance.test_data.phytest;
> > +	u32 temp;
> > +
> > +	switch (data->phy_pattern) {
> > +	case DP_PHY_TEST_PATTERN_NONE:
> > +		DRM_DEBUG_KMS("Disable Phy Test Pattern\n");
> > +		I915_WRITE(DDI_DP_COMP_CTL(intel_dig_port->base.port), 0x0);
> > +		break;
> > +	case DP_PHY_TEST_PATTERN_D10_2:
> > +		DRM_DEBUG_KMS("Set D10.2 Phy Test Pattern\n");
> > +		I915_WRITE(DDI_DP_COMP_CTL(intel_dig_port->base.port),
> > +			   DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_D10_2);
> > +		break;
> > +	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
> > +		DRM_DEBUG_KMS("Set Error Count Phy Test Pattern\n");
> > +		I915_WRITE(DDI_DP_COMP_CTL(intel_dig_port->base.port),
> > +			   DDI_DP_COMP_CTL_ENABLE |
> > +			   DDI_DP_COMP_CTL_SCRAMBLED_0);
> > +		break;
> > +	case DP_PHY_TEST_PATTERN_PRBS7:
> > +		DRM_DEBUG_KMS("Set PRBS7 Phy Test Pattern\n");
> > +		I915_WRITE(DDI_DP_COMP_CTL(intel_dig_port->base.port),
> > +			   DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_PRBS7);
> > +		break;
> > +	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
> > +		DRM_DEBUG_KMS("Set 80Bit Custom Phy Test Pattern\n");
> > +		temp = ((data->custom80[0] << 24) | (data->custom80[1] << 16) |
> > +			(data->custom80[2] << 8) | (data->custom80[3]));
> > +		I915_WRITE(DDI_DP_COMP_PAT(intel_dig_port->base.port, 0), temp);
> > +		temp = ((data->custom80[4] << 24) | (data->custom80[5] << 16) |
> > +			(data->custom80[6] << 8) | (data->custom80[7]));
> > +		I915_WRITE(DDI_DP_COMP_PAT(intel_dig_port->base.port, 1), temp);
> > +		temp = ((data->custom80[8] << 8) | data->custom80[9]);
> > +		I915_WRITE(DDI_DP_COMP_PAT(intel_dig_port->base.port, 2), temp);
> > +		I915_WRITE(DDI_DP_COMP_CTL(intel_dig_port->base.port),
> > +			   DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_CUSTOM80);
> > +		break;
> > +	case DP_PHY_TEST_PATTERN_CP2520:
> > +		DRM_DEBUG_KMS("Set HBR2 compliance Phy Test Pattern\n");
> > +		temp = ((data->hbr2_reset[1] << 8) | data->hbr2_reset[0]);
> > +		I915_WRITE(DDI_DP_COMP_CTL(intel_dig_port->base.port),
> > +			   DDI_DP_COMP_CTL_ENABLE | DDI_DP_COMP_CTL_HBR2 |
> > +			   temp);
> > +		break;
> > +	default:
> > +		WARN(1, "Invalid Phy Test PAttern\n");

Small nit here, it should be PHY Pattern

Manasi

> > +	}
> > +}
> > +
> >  static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
> >  {
> >  	u8 test_result = DP_TEST_NAK;
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
