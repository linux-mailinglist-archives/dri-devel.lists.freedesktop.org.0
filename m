Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EFC78D5C6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C396710E514;
	Wed, 30 Aug 2023 12:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE28F10E514;
 Wed, 30 Aug 2023 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397272; x=1724933272;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wknXTJNSowivFoG6Q3QnOtfRtWmb4WM/fJwPE+QmP6A=;
 b=lutNCB3In47QfYTPrFSRJUvGRwX+6mZkVd+XaJc38qBBhiCwkfV4gL4Y
 MtFND3CeiMMD0jLkixpEqH9KFaW/eYCEOrqlTHUz6pazPjU3V2UwesjSg
 jOMkiWwORzU0boEt/WY6a8yATGETs7cYpya6IMQVJWOpqgCVg36gZwDrh
 WECrvdcQZlyJesdRMf2dkeSYWOUC4XTswVGRDTiksRNPRuWMozuAvAily
 y7+YgHL0JldLiipcrNvLANUp6xBojItynXB4h6gZkAqbTZryaomxc0IDC
 nUYggQYja8ky4+UgyS+a34FewNr6MCVA3/sZvEY901yojcL+yRpgnfJBj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406622232"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="406622232"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912765516"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="912765516"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:07:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 07/12] drm/i915/dp: Populate connector->ddc
In-Reply-To: <20230829113920.13713-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-8-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:06:58 +0300
Message-ID: <87h6ogzqcd.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Populate connector->ddc, and thus create the "ddc" symlink
> in sysfs for analog DP SST connectors.
>
> Let's also reorder intel_dp_aux_init() vs. drm_connector_init_with_ddc()
> a bit to make sure the i2c aux ch is at least somewhat populated
> before we pass it on, though drm_connector_init_with_ddc() does
> not actually do anything with it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 05694e0b6143..9b35b1d6adbb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5914,7 +5914,7 @@ static bool intel_edp_init_connector(struct intel_d=
p *intel_dp,
>  	}
>=20=20
>  	mutex_lock(&dev_priv->drm.mode_config.mutex);
> -	drm_edid =3D drm_edid_read_ddc(connector, &intel_dp->aux.ddc);
> +	drm_edid =3D drm_edid_read_ddc(connector, connector->ddc);
>  	if (!drm_edid) {
>  		/* Fallback to EDID from ACPI OpRegion, if any */
>  		drm_edid =3D intel_opregion_get_edid(intel_connector);
> @@ -6053,12 +6053,15 @@ intel_dp_init_connector(struct intel_digital_port=
 *dig_port,
>  	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
>  		intel_dp->pps.active_pipe =3D vlv_active_pipe(intel_dp);
>=20=20
> +	intel_dp_aux_init(intel_dp);
> +
>  	drm_dbg_kms(&dev_priv->drm,
>  		    "Adding %s connector on [ENCODER:%d:%s]\n",
>  		    type =3D=3D DRM_MODE_CONNECTOR_eDP ? "eDP" : "DP",
>  		    intel_encoder->base.base.id, intel_encoder->base.name);
>=20=20
> -	drm_connector_init(dev, connector, &intel_dp_connector_funcs, type);
> +	drm_connector_init_with_ddc(dev, connector, &intel_dp_connector_funcs,
> +				    type, &intel_dp->aux.ddc);
>  	drm_connector_helper_add(connector, &intel_dp_connector_helper_funcs);
>=20=20
>  	if (!HAS_GMCH(dev_priv) && DISPLAY_VER(dev_priv) < 12)
> @@ -6066,8 +6069,6 @@ intel_dp_init_connector(struct intel_digital_port *=
dig_port,
>=20=20
>  	intel_connector->polled =3D DRM_CONNECTOR_POLL_HPD;
>=20=20
> -	intel_dp_aux_init(intel_dp);
> -
>  	intel_connector_attach_encoder(intel_connector, intel_encoder);
>=20=20
>  	if (HAS_DDI(dev_priv))

--=20
Jani Nikula, Intel Open Source Graphics Center
