Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F89FF8F7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 12:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0346A10E6D6;
	Thu,  2 Jan 2025 11:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVQwZRy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BE610E6D6;
 Thu,  2 Jan 2025 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735818608; x=1767354608;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rtJ+33wrV8CxPJoS/qoUKKXiAaxG0aFkSr4paV2ceUY=;
 b=NVQwZRy0334cRXypxxgy0EvWs30CcPrguyf5qP+eA9HeABu4DN27XcPD
 +h14z0FQ00TQZoi4KkWipEAMiyDqPyrqvHYvy8BD5Vsz/+Dnh0GAzryQS
 b19++d8ClxvleUIjqTfExIvGdOLF40n20IM2BWOrJxLstjXyTfXGZVEW1
 6z6JYHeF42eVaG3YWDGkAC0MFWAs55y+Cz2u5UtPyI7J897Hlc4gm0Izz
 hwuo5Nic4e6cOGkQ+sL+MYxilLW3zbF4QklOVI/6BH14qFJEw05F02HTj
 V5GPfQup02wbOitR13EX4zOaZKSVe19k27Bu/2pc6pDxw8TEm9GlaMtI9 Q==;
X-CSE-ConnectionGUID: mf37c1z4SN6XHceI2Am05g==
X-CSE-MsgGUID: s2AdC6+/QqGyVrRFnzo+vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36214627"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36214627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 03:50:08 -0800
X-CSE-ConnectionGUID: +8KvJT3HQqKWimMk09N2DQ==
X-CSE-MsgGUID: Olzd7+CKQu2JSlS7XshT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101323082"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.212])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 03:50:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, imre.deak@intel.com, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH] drm/mst: remove mgr parameter and debug logging from
 drm_dp_get_vc_payload_bw()
In-Reply-To: <20250102101552.315814-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <630bd6e1c0c0fee9a8dde08d224cf8f166fd727e.1734643485.git.jani.nikula@intel.com>
 <20250102101552.315814-1-jani.nikula@intel.com>
Date: Thu, 02 Jan 2025 13:50:02 +0200
Message-ID: <871pxlo2ol.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> The struct drm_dp_mst_topology_mgr *mgr parameter is only used for debug
> logging in case the passed in link rate or lane count are zero. There's
> no further error checking as such, and the function returns 0.
>
> There should be no case where the parameters are zero. The returned
> value is generally used as a divisor, and if we were hitting this, we'd
> be seeing division by zero.
>
> Just remove the debug logging altogether, along with the mgr parameter,
> so that the function can be used in non-MST contexts without the
> topology manager.
>
> v2: Also remove drm_dp_mst_helper_tests_init as unnecessary (Imre)
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Maarten, Maxime, Thomas, ack for merging this via drm-intel along with
the rest of the series?

BR,
Jani.


> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c  | 10 ++--------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c    |  3 +--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c        |  3 +--
>  drivers/gpu/drm/tests/drm_dp_mst_helper_test.c | 17 +----------------
>  include/drm/display/drm_dp_mst_helper.h        |  3 +--
>  5 files changed, 6 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index f8cd094efa3c..06c91c5b7f7c 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3572,8 +3572,7 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
>  }
>  
>  /**
> - * drm_dp_get_vc_payload_bw - get the VC payload BW for an MST link
> - * @mgr: The &drm_dp_mst_topology_mgr to use
> + * drm_dp_get_vc_payload_bw - get the VC payload BW for an MTP link
>   * @link_rate: link rate in 10kbits/s units
>   * @link_lane_count: lane count
>   *
> @@ -3584,17 +3583,12 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
>   *
>   * Returns the BW / timeslot value in 20.12 fixed point format.
>   */
> -fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
> -				    int link_rate, int link_lane_count)
> +fixed20_12 drm_dp_get_vc_payload_bw(int link_rate, int link_lane_count)
>  {
>  	int ch_coding_efficiency =
>  		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(link_rate));
>  	fixed20_12 ret;
>  
> -	if (link_rate == 0 || link_lane_count == 0)
> -		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
> -			    link_rate, link_lane_count);
> -
>  	/* See DP v2.0 2.6.4.2, 2.7.6.3 VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
>  	ret.full = DIV_ROUND_DOWN_ULL(mul_u32_u32(link_rate * link_lane_count,
>  						  ch_coding_efficiency),
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index fffd199999e0..ca091ed291d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -244,8 +244,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		crtc_state->fec_enable = !intel_dp_is_uhbr(crtc_state);
>  	}
>  
> -	mst_state->pbn_div = drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
> -						      crtc_state->port_clock,
> +	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
>  						      crtc_state->lane_count);
>  
>  	max_dpt_bpp = intel_dp_mst_max_dpt_bpp(crtc_state, dsc);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 8097249612bc..62d72b7a8d04 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -992,8 +992,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  	if (!mst_state->pbn_div.full) {
>  		struct nouveau_encoder *outp = mstc->mstm->outp;
>  
> -		mst_state->pbn_div = drm_dp_get_vc_payload_bw(&mstm->mgr,
> -							      outp->dp.link_bw, outp->dp.link_nr);
> +		mst_state->pbn_div = drm_dp_get_vc_payload_bw(outp->dp.link_bw, outp->dp.link_nr);
>  	}
>  
>  	slots = drm_dp_atomic_find_time_slots(state, &mstm->mgr, mstc->port, asyh->dp.pbn);
> diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> index 89cd9e4f4d32..9e0e2fb65944 100644
> --- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> @@ -199,10 +199,8 @@ static const struct drm_dp_mst_calc_pbn_div_test drm_dp_mst_calc_pbn_div_dp1_4_c
>  static void drm_test_dp_mst_calc_pbn_div(struct kunit *test)
>  {
>  	const struct drm_dp_mst_calc_pbn_div_test *params = test->param_value;
> -	/* mgr->dev is only needed by drm_dbg_kms(), but it's not called for the test cases. */
> -	struct drm_dp_mst_topology_mgr *mgr = test->priv;
>  
> -	KUNIT_EXPECT_EQ(test, drm_dp_get_vc_payload_bw(mgr, params->link_rate, params->lane_count).full,
> +	KUNIT_EXPECT_EQ(test, drm_dp_get_vc_payload_bw(params->link_rate, params->lane_count).full,
>  			params->expected.full);
>  }
>  
> @@ -568,21 +566,8 @@ static struct kunit_case drm_dp_mst_helper_tests[] = {
>  	{ }
>  };
>  
> -static int drm_dp_mst_helper_tests_init(struct kunit *test)
> -{
> -	struct drm_dp_mst_topology_mgr *mgr;
> -
> -	mgr = kunit_kzalloc(test, sizeof(*mgr), GFP_KERNEL);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mgr);
> -
> -	test->priv = mgr;
> -
> -	return 0;
> -}
> -
>  static struct kunit_suite drm_dp_mst_helper_test_suite = {
>  	.name = "drm_dp_mst_helper",
> -	.init = drm_dp_mst_helper_tests_init,
>  	.test_cases = drm_dp_mst_helper_tests,
>  };
>  
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index a80ba457a858..e39de161c938 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -867,8 +867,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector *connector,
>  				 struct drm_dp_mst_topology_mgr *mgr,
>  				 struct drm_dp_mst_port *port);
>  
> -fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
> -				    int link_rate, int link_lane_count);
> +fixed20_12 drm_dp_get_vc_payload_bw(int link_rate, int link_lane_count);
>  
>  int drm_dp_calc_pbn_mode(int clock, int bpp);

-- 
Jani Nikula, Intel
