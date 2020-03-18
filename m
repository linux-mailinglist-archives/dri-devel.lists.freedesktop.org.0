Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0E18A308
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 20:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406476E950;
	Wed, 18 Mar 2020 19:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BECB6E94E;
 Wed, 18 Mar 2020 19:18:19 +0000 (UTC)
IronPort-SDR: N3ltSrg1J2Nbcrsi/GZnTffj9VnyAvLyycTaMPP4V5fx1EaLLPkyGjT1yPBn6wRWM85tSBeJ9p
 uSwYKI7jZsgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 12:18:18 -0700
IronPort-SDR: GPeb1ZSuJC0Z+aM1YIbso+SoDc5uqfcSttvtqtuigzx3TEiVyvNjKhagqnWWIl2egkJ0l2n36Y
 7+PME5tkY9kA==
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="418058563"
Received: from gkern-mobl.ger.corp.intel.com (HELO localhost) ([10.252.54.69])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2020 12:18:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mario Kleiner <mario.kleiner.de@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: Add dpcd link_rate quirk for Apple 15" MBP
 2017 (v3)
In-Reply-To: <20200316042340.4783-1-mario.kleiner.de@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200316042340.4783-1-mario.kleiner.de@gmail.com>
Date: Wed, 18 Mar 2020 21:18:15 +0200
Message-ID: <87a74deako.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Mar 2020, Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
> This fixes a problem found on the MacBookPro 2017 Retina panel.
>
> The panel reports 10 bpc color depth in its EDID, and the
> firmware chooses link settings at boot which support enough
> bandwidth for 10 bpc (324000 kbit/sec = multiplier 0xc),
> but the DP_MAX_LINK_RATE dpcd register only reports
> 2.7 Gbps (multiplier value 0xa) as possible, in direct
> contradiction of what the firmware successfully set up.
>
> This restricts the panel to 8 bpc, not providing the full
> color depth of the panel.
>
> This patch adds a quirk specific to the MBP 2017 15" Retina
> panel to add the additiional 324000 kbps link rate during
> edp setup.
>
> Link to previous discussion of a different attempted fix
> with Ville and Jani:
>
> https://patchwork.kernel.org/patch/11325935/
>
> v2: Follow Jani's proposal of defining quirk_rates[] instead
>     of just appending 324000. This for better clarity.
>
> v3: Rebased onto current drm-tip, as of 16-March-2020. Adapt
>     to new edid_quirks parameter of drm_dp_has_quirk().
>
> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-intel-next-queued, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/drm_dp_helper.c         |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++++++
>  include/drm/drm_dp_helper.h             |  7 +++++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index c6fbe6e6bc9d..8ba4531e808d 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -1238,6 +1238,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>  	{ OUI(0x00, 0x00, 0x00), DEVICE_ID('C', 'H', '7', '5', '1', '1'), false, BIT(DP_DPCD_QUIRK_NO_SINK_COUNT) },
>  	/* Synaptics DP1.4 MST hubs can support DSC without virtual DPCD */
>  	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
> +	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
> +	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>  };
>  
>  #undef OUI
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0a417cd2af2b..ef2e06e292d5 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -164,6 +164,17 @@ static void intel_dp_set_sink_rates(struct intel_dp *intel_dp)
>  	};
>  	int i, max_rate;
>  
> +	if (drm_dp_has_quirk(&intel_dp->desc, 0,
> +			     DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS)) {
> +		/* Needed, e.g., for Apple MBP 2017, 15 inch eDP Retina panel */
> +		static const int quirk_rates[] = { 162000, 270000, 324000 };
> +
> +		memcpy(intel_dp->sink_rates, quirk_rates, sizeof(quirk_rates));
> +		intel_dp->num_sink_rates = ARRAY_SIZE(quirk_rates);
> +
> +		return;
> +	}
> +
>  	max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
>  
>  	for (i = 0; i < ARRAY_SIZE(dp_rates); i++) {
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index c6119e4c169a..9d87cdf2740a 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1548,6 +1548,13 @@ enum drm_dp_quirk {
>  	 * capabilities advertised.
>  	 */
>  	DP_QUIRK_FORCE_DPCD_BACKLIGHT,
> +	/**
> +	 * @DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS:
> +	 *
> +	 * The device supports a link rate of 3.24 Gbps (multiplier 0xc) despite
> +	 * the DP_MAX_LINK_RATE register reporting a lower max multiplier.
> +	 */
> +	DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS,
>  };
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
