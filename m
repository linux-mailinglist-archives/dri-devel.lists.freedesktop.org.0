Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06B5A458F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 10:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C551A10EDF7;
	Mon, 29 Aug 2022 08:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810AF10EDF7;
 Mon, 29 Aug 2022 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661763412; x=1693299412;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9QZnRhMk/tI0Ek+ih6y5il+BQ30Cp/3pZfyZ38uWJu8=;
 b=MVQciuAC1gblMJQIQnDhzQmO9Litkc4kuDal0XRNrDZqUWyuNn9eDrAW
 B6QuCxp8BYMwRlIRaN0vVUp4cHfRHG0rI96e9R5OgMDEkF0AAIAk44A41
 j5A3P75bnOfTPjE+l4Fv0lQESweDXqFLu12ZA9zGbf2QkooCtQV6fGuSU
 CelAvNyCrrte7NhXw0h39ph7sQLZsY7/c6pkaxpA6DDPRZBDfZa03q/or
 TObYN3N/wSeiftf7RtxfYCxvBj2SalFlHazcziX/UgZKOawcAfqWQ+PEV
 BNMeKjUh882++OzF6B7O5a5VogDN38piEcnzZqCYwzXoyKV28GTYBkJPn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="292428209"
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="292428209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:56:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; d="scan'208";a="672302715"
Received: from idecesar-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.198])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2022 01:56:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 11/11] drm/i915: Infer vrefresh range for
 eDP if the EDID omits it
In-Reply-To: <20220826213501.31490-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-12-ville.syrjala@linux.intel.com>
Date: Mon, 29 Aug 2022 11:56:42 +0300
Message-ID: <87zgfnfmwl.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> A bunch of machines seem to have eDP panels where the EDID
> indicates continuous frequency support but fails to actually
> include the range descirptor. This violates the EDID 1.4
> spec, but looks like the Windows driver just hacks around
> this by just assuming that the panel supports a continuous
> refresh rate range that covers all EDID reported modes.
>
> Do the same so that we get VRR support on these machines.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6323
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 45 +++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 8d1559323412..1f3e4824d316 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5207,6 +5207,49 @@ intel_edp_add_properties(struct intel_dp *intel_dp)
>  						       fixed_mode->vdisplay);
>  }
>=20=20
> +/*
> + * Some VRR eDP panels violate the EDID spec and neglect
> + * to include the monitor range descriptor in the EDID.
> + * Cook up the VRR refresh rate limits based on the modes
> + * reported by the panel.
> + */
> +static void
> +intel_edp_infer_vrr_range(struct intel_connector *connector)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> +	struct drm_display_info *info =3D &connector->base.display_info;
> +	const struct edid *edid =3D connector->edid;
> +	const struct drm_display_mode *mode;
> +
> +	if (!HAS_VRR(i915))
> +		return;
> +
> +	if (!edid || edid->revision < 4 ||

connector->edid is actually an error pointer. I made it so way back when
to differentiate between "broken edid" -EINVAL and "no edid" -ENOENT,
but I don't think we ever use that distinction anywhere.

Either ditch the error pointers (in a separate patch) or check for them
here. With that fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +	    !(edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ) ||
> +	    info->vrr_range.min_vfreq || info->vrr_range.max_vfreq)
> +		return;
> +
> +	if (list_empty(&connector->base.probed_modes))
> +		return;
> +
> +	info->vrr_range.min_vfreq =3D ~0;
> +	info->vrr_range.max_vfreq =3D 0;
> +
> +	list_for_each_entry(mode, &connector->base.probed_modes, head) {
> +		int vrefresh =3D drm_mode_vrefresh(mode);
> +
> +		info->vrr_range.min_vfreq =3D min_t(int, vrefresh,
> +						  info->vrr_range.min_vfreq);
> +		info->vrr_range.max_vfreq =3D max_t(int, vrefresh,
> +						  info->vrr_range.max_vfreq);
> +	}
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[CONNECTOR:%d:%s] does not report refresh rate range, assuming: %=
d Hz - %d Hz\n",
> +		    connector->base.base.id, connector->base.name,
> +		    info->vrr_range.min_vfreq, info->vrr_range.max_vfreq);
> +}
> +
>  static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  				     struct intel_connector *intel_connector)
>  {
> @@ -5271,6 +5314,8 @@ static bool intel_edp_init_connector(struct intel_d=
p *intel_dp,
>  	}
>  	intel_connector->edid =3D edid;
>=20=20
> +	intel_edp_infer_vrr_range(intel_connector);
> +
>  	intel_bios_init_panel(dev_priv, &intel_connector->panel,
>  			      encoder->devdata, IS_ERR(edid) ? NULL : edid);

--=20
Jani Nikula, Intel Open Source Graphics Center
