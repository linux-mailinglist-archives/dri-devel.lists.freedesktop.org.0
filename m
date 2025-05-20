Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D6ABD829
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 14:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5598D10E509;
	Tue, 20 May 2025 12:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfUmK4ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8456D10E4CB;
 Tue, 20 May 2025 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747743955; x=1779279955;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0NHPkCk3tWvkekT2v/09VO9uplyB315so8ejz4VmUj0=;
 b=HfUmK4msPTLIVaJbplqMeKgM0FczainWYa4KP7IL8kV6oWFeaLHWvvMs
 PPanC8OVZyG6VC4H7pRiu9KeSUGfoUiXhAI6cOlxm9dCgtdLlVUAXbwGP
 USDfvL+TM8wG9K47At5Df4fwNSjNzWlRjoCJsMWC0X0NdZXgzo3IsnA6c
 2DNfbXNXU7aSRraUUUN8hW/U5kLDFCcVnY/6Agaf1j646/ffdu5UocG1b
 TLoKpgRUCvcJ3gN2rJK78u7KTGgsMWP3oqhgjPEE9S3HjMaAgo9lndsyU
 6vV9dmIX3kNYCTWSZAT4K4++Ju5kOnNG/qcXNTTfxZKQp8PZ1/ikFlE8b w==;
X-CSE-ConnectionGUID: tQTrhvy7RWCReX7PELLCWA==
X-CSE-MsgGUID: Hh/qYSEMTw+pHrnl7RmH0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="59905232"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="59905232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 05:25:51 -0700
X-CSE-ConnectionGUID: wuSkxgcNTaWmaXtuFXZZbQ==
X-CSE-MsgGUID: CVn6Bo5HS7uNttvZ6aY6pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140597397"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 05:25:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/dp: Allow HBR3 without TPS4 support for eDP
 panels
In-Reply-To: <20250520072023.1661211-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250520072023.1661211-1-ankit.k.nautiyal@intel.com>
Date: Tue, 20 May 2025 15:25:47 +0300
Message-ID: <87jz6btqno.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 20 May 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> Commit 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support
> TPS4") introduced a blanket rejection of HBR3 link rate when the sink does
> not support TPS4. While this was intended to address instability observed
> on certain eDP panels [1], the TPS4 requirement is only mandated for DPRX
> and not for eDPRX.
>
> This change inadvertently causes blank screens on some eDP panels that do
> not advertise TPS4 support, and require HBR3 to operate at their fixed
> native resolution.
>
> To restore functionality for such panels do not reject HBR3 when sink
> doesn't support TPS4. Instead reject HBR3 for specific panel that are
> not able to handle HBR3 [1].
>
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969
>
> Fixes: 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support =
TPS4")
> Cc: stable@vger.kernel.org
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++-----------
>  include/drm/display/drm_dp_helper.h     |  7 +++++++
>  3 files changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index f2a6559a2710..bf66489c9202 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2526,6 +2526,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] =
=3D {
>  	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK=
_EXPANSION_REQUIRES_DSC) },
>  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MA=
X_LINK_RATE */
>  	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BI=
T(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
> +	/* Novatek panel */
> +	{ OUI(0x38, 0xEC, 0x11), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBR3) =
},
>  };
>=20=20
>  #undef OUI
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 21297bc4cc00..0bfc84cbd50d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -184,13 +184,13 @@ static int max_dprx_rate(struct intel_dp *intel_dp)
>  		max_rate =3D drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RA=
TE]);
>=20=20
>  	/*
> -	 * Some broken eDP sinks illegally declare support for
> -	 * HBR3 without TPS4, and are unable to produce a stable
> -	 * output. Reject HBR3 when TPS4 is not available.
> +	 * Some broken eDP sinks declare support for HBR3 but are unable to
> +	 * produce a stable output. For these panel reject HBR3.
>  	 */
> -	if (max_rate >=3D 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
> +	if (max_rate >=3D 810000 &&
> +	    drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR3)) {

This does work, but I was thinking the quirk would be that the max is
HBR2. Same thing, but more generic? DP_DPCD_QUIRK_MAX_HBR2 maybe?

With that, you could drop the max_rate >=3D 810000 from here. (Though the
next check below does need the rate check as it stops the loop.)

>  		drm_dbg_kms(display->drm,
> -			    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
> +			    "[ENCODER:%d:%s] Rejecting HBR3 due to DP_DPCD_QUIRK_HBR3\n",
>  			    encoder->base.base.id, encoder->base.name);
>  		max_rate =3D 540000;
>  	}
> @@ -4296,15 +4296,14 @@ intel_edp_set_sink_rates(struct intel_dp *intel_d=
p)
>=20=20
>  			if (rate =3D=3D 0)
>  				break;
> -
>  			/*
> -			 * Some broken eDP sinks illegally declare support for
> -			 * HBR3 without TPS4, and are unable to produce a stable
> -			 * output. Reject HBR3 when TPS4 is not available.
> +			 * Some broken eDP sinks declare support for HBR3 but are unable to
> +			 * produce a stable output. For these panel reject HBR3.
>  			 */
> -			if (rate >=3D 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
> +			if (rate >=3D 810000 &&
> +			    drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR3)) {
>  				drm_dbg_kms(display->drm,
> -					    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
> +					    "[ENCODER:%d:%s] Rejecting HBR3 due to DP_DPCD_QUIRK_HBR3\n",
>  					    encoder->base.base.id, encoder->base.name);
>  				break;
>  			}
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index e4ca35143ff9..5e60a37b61ce 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -814,6 +814,13 @@ enum drm_dp_quirk {
>  	 * requires enabling DSC.
>  	 */
>  	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
> +
> +	/**
> +	 * @DP_DPCD_QUIRK_HBR3:
> +	 *
> +	 * The device supports HBR3 but is unable to produce stable output.

I think DP_DPCD_QUIRK_MAX_HBR2 is easier to explain too.

What do you think?

BR,
Jani.



> +	 */
> +	DP_DPCD_QUIRK_HBR3,
>  };
>=20=20
>  /**

--=20
Jani Nikula, Intel
