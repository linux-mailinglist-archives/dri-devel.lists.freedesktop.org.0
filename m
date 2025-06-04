Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E516EACDBB6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3C510E77C;
	Wed,  4 Jun 2025 10:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPXZesX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF96710E6E6;
 Wed,  4 Jun 2025 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749032029; x=1780568029;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TbcMFpHOsgJdnGGY/iCTM/i4pkazg6N7lvJw55HZTv8=;
 b=KPXZesX+/Ay/2s6/1bOQIsCEKvI8rfCmbp3t4Q3jB9UaQ+N6pBL6vrWw
 vF4+tYiZaoUH/IDE0VstJzA0n/ySk62xRD/Ub8rpeFDz9kOMvLptnp2Fm
 UhlIlFc/KxwuUezVhE7PsgWx7ziWHl5xRHOVd2rkpCqV14uFgo/Fn0Z0D
 c6Eh3Bc5c5m0lrv9zWP5MLrvlPSSViqGGsBFTm/rdQ7oDoaTXPzSDtBTX
 mMJqOY/b84gCLOM6WBJU8e698UxBI8Q49T5NDa+YDm73n7vRlSnJaYXpO
 0rtOzCIaZHR+hEAPB4oijyNcBWmuU0BLkk3sZlmDjBUKh57If9ucZHLwN Q==;
X-CSE-ConnectionGUID: 7AsB772gQKm6cIENhLdX5w==
X-CSE-MsgGUID: fevl9O4PQ/yEyipb2zyHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62159931"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="62159931"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:13:49 -0700
X-CSE-ConnectionGUID: TaUVLxhMRFeR8uniTQVPDw==
X-CSE-MsgGUID: QdgOnuVzSQKhnWNwTyVN2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="150295852"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 03:13:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
In-Reply-To: <20250603121543.17842-5-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250603121543.17842-1-imre.deak@intel.com>
 <20250603121543.17842-5-imre.deak@intel.com>
Date: Wed, 04 Jun 2025 13:13:44 +0300
Message-ID: <ffe402bd1afd50b2e3d7ebf72c26de149e6b2258@intel.com>
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

On Tue, 03 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> Reading DPCD registers has side-effects and some of these can cause a
> problem for instance during link training. Based on this it's better to
> avoid the probing quirk done before each DPCD register read, limiting
> this to the monitor which requires it. The only known problematic
> monitor is an external SST sink, so keep the quirk disabled always for
> eDP and MST sinks. Reenable the quirk after a hotplug event and after
> resuming from a power state without hotplug support, until the
> subsequent EDID based detection.

It's a bummer we have to do this in so many places. :(


>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c      | 11 +++++++++--
>  drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
>  drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++++++
>  3 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 208a953b04a2f..d65a18fc1aeb9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5747,6 +5747,11 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
>  	/* Below we depend on display info having been updated */
>  	drm_edid_connector_update(&connector->base, drm_edid);
>=20=20
> +	if (!intel_dp_is_edp(intel_dp))
> +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux,
> +					    drm_edid_has_quirk(&connector->base,
> +							       DRM_EDID_QUIRK_DP_DPCD_PROBE));
> +
>  	vrr_capable =3D intel_vrr_is_capable(connector);
>  	drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
>  		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capa=
ble));
> @@ -5881,6 +5886,7 @@ intel_dp_detect(struct drm_connector *_connector,
>  	intel_dp_print_rates(intel_dp);
>=20=20
>  	if (intel_dp->is_mst) {
> +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, false);
>  		/*
>  		 * If we are in MST mode then this connector
>  		 * won't appear connected or have anything
> @@ -6321,10 +6327,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig=
_port, bool long_hpd)
>  	 * complete the DP tunnel BW request for the latter connector/encoder
>  	 * waiting for this encoder's DPRX read, perform a dummy read here.
>  	 */
> -	if (long_hpd)
> +	if (long_hpd) {
> +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> +
>  		intel_dp_read_dprx_caps(intel_dp, dpcd);
>=20=20
> -	if (long_hpd) {
>  		intel_dp->reset_link_params =3D true;
>  		intel_dp_invalidate_source_oui(intel_dp);
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/dr=
m/i915/display/intel_dp_aux.c
> index bf8e8e0cc19c9..410252ba6fd16 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
>=20=20
>  	intel_dp->aux.transfer =3D intel_dp_aux_transfer;
>  	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
> +
> +	drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, !intel_dp_is_edp(intel_dp));
>  }
>=20=20
>  static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
> diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/d=
rm/i915/display/intel_hotplug.c
> index 74fe398663d63..1093c6c3714c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> @@ -33,6 +33,7 @@
>  #include "intel_display_core.h"
>  #include "intel_display_rpm.h"
>  #include "intel_display_types.h"
> +#include "intel_dp.h"
>  #include "intel_hdcp.h"
>  #include "intel_hotplug.h"
>  #include "intel_hotplug_irq.h"
> @@ -906,9 +907,18 @@ void intel_hpd_poll_enable(struct intel_display *dis=
play)
>   */
>  void intel_hpd_poll_disable(struct intel_display *display)
>  {
> +	struct intel_encoder *encoder;
> +
>  	if (!HAS_DISPLAY(display))
>  		return;
>=20=20
> +	for_each_intel_dp(display->drm, encoder) {
> +		struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> +
> +		if (!intel_dp_is_edp(intel_dp))
> +			drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> +	}
> +
>  	WRITE_ONCE(display->hotplug.poll_enabled, false);
>=20=20
>  	spin_lock_irq(&display->irq.lock);

--=20
Jani Nikula, Intel
