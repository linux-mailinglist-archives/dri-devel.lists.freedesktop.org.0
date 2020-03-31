Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73EB1988DB
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 02:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C5A6E508;
	Tue, 31 Mar 2020 00:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A9C6E507;
 Tue, 31 Mar 2020 00:24:57 +0000 (UTC)
IronPort-SDR: XUmbojtpybORhtTgUikPyJ6C0Y18HhveS682Ia+zrnJXWkDdqmcHzAlQczrkIxD4TVTroFo73d
 +lNgO7nRoqgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 17:24:56 -0700
IronPort-SDR: KH3SHm0aQp34+2Z5Lh6YxYWeB1LUtsIEB8Rv1L0KDNbH4BXfMDxzP6uuXBPK/4qv5QJiB0X+kM
 CWfpUMxtaddQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,326,1580803200"; d="scan'208";a="327912934"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga001.jf.intel.com with ESMTP; 30 Mar 2020 17:24:56 -0700
Date: Mon, 30 Mar 2020 17:26:54 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] drm/i915/dp: Attach and set drm connector VRR
 property
Message-ID: <20200331002654.GB6703@intel.com>
References: <20200325012201.11376-1-manasi.d.navare@intel.com>
 <20200325012201.11376-2-manasi.d.navare@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325012201.11376-2-manasi.d.navare@intel.com>
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
Cc: Aditya Swarup <aditya.swarup@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Jani @Ville, this is the one we had discussed on IRC, could you
take a look at this patch?

Manasi

On Tue, Mar 24, 2020 at 06:22:01PM -0700, Manasi Navare wrote:
> From: Aditya Swarup <aditya.swarup@intel.com>
> =

> This function sets the VRR property for connector based
> on the platform support, EDID monitor range and DP sink
> DPCD capability of outputing video without msa
> timing information.
> =

> v2:
> * Just set this in intel_dp_get_modes instead of new hook (Jani)
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Aditya Swarup <aditya.swarup@intel.com>
> Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index ef2e06e292d5..95db4e783893 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5843,6 +5843,23 @@ intel_dp_force(struct drm_connector *connector)
>  	intel_display_power_put(dev_priv, aux_domain, wakeref);
>  }
>  =

> +static bool intel_dp_is_vrr_capable(struct drm_connector *connector)
> +{
> +	struct intel_dp *intel_dp =3D intel_attached_dp(to_intel_connector(conn=
ector));
> +	const struct drm_display_info *info =3D &connector->display_info;
> +	struct drm_i915_private *dev_priv =3D to_i915(connector->dev);
> +
> +	/*
> +	 * DP Sink is capable of Variable refresh video timings if
> +	 * Ignore MSA bit is set in DPCD.
> +	 * EDID monitor range also should be atleast 10 for reasonable
> +	 * Adaptive sync/ VRR end user experience.
> +	 */
> +	return INTEL_GEN(dev_priv) >=3D 12 &&
> +		drm_dp_sink_can_do_video_without_timing_msa(intel_dp->dpcd) &&
> +		info->monitor_range.max_vfreq - info->monitor_range.min_vfreq > 10;
> +}
> +
>  static int intel_dp_get_modes(struct drm_connector *connector)
>  {
>  	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
> @@ -5853,6 +5870,10 @@ static int intel_dp_get_modes(struct drm_connector=
 *connector)
>  		int ret =3D intel_connector_update_modes(connector, edid);
>  		if (ret)
>  			return ret;
> +
> +		if (intel_dp_is_vrr_capable(connector))
> +			drm_connector_set_vrr_capable_property(connector,
> +							       true);
>  	}
>  =

>  	/* if eDP has no EDID, fall back to fixed mode */
> @@ -6880,6 +6901,9 @@ intel_dp_add_properties(struct intel_dp *intel_dp, =
struct drm_connector *connect
>  		connector->state->scaling_mode =3D DRM_MODE_SCALE_ASPECT;
>  =

>  	}
> +
> +	if (INTEL_GEN(dev_priv) >=3D 12)
> +		drm_connector_attach_vrr_capable_property(connector);
>  }
>  =

>  static void intel_dp_init_panel_power_timestamps(struct intel_dp *intel_=
dp)
> -- =

> 2.19.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
