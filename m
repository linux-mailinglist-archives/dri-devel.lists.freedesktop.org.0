Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0E078D5C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043D710E50F;
	Wed, 30 Aug 2023 12:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1276910E50D;
 Wed, 30 Aug 2023 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693397135; x=1724933135;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XVvMlYv51fgOB+66z81RRJ3TUZGK8oo1rbz9YksKw3U=;
 b=ewcyn/i36VohDjchFG/4SLBLMOuW/N8NI+DSNpJA/Q8xL+HPY7c3CV3O
 bGUHNsGnz1JHrH3pdgz7oHVDrCNTOg79W2ANqs8Nn3OomgeksVPfKiUSy
 SF/YzknpcHabn7uodSCbwAjOW5N7q+CKGR4PZkFIUm/bDL390HE4vnq4z
 3HLieaJOTbdJw7+96LnX+uidLWzsvR8XJO/JMRu5klB/CZoto6OgvONvi
 mY+YNQ6lNSMiCpq6eZyswfG+aO22ACpZ+TX/AnLbfvOHHSpii54Je1bQ6
 Fi+/HD1KJbGoy0OHDrDQvv3CZ6Es/mqIT5Lud+Cg9XPbgw8CP3F79FHT5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379373399"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="379373399"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:05:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="715886908"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="715886908"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 05:05:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 04/12] drm/i915/lvds: Populate connector->ddc
In-Reply-To: <20230829113920.13713-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-5-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 15:05:30 +0300
Message-ID: <87pm34zqet.fsf@intel.com>
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
> in sysfs for the LVDS port.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_lvds.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/=
i915/display/intel_lvds.c
> index 3ace56979b70..2306e133e3f6 100644
> --- a/drivers/gpu/drm/i915/display/intel_lvds.c
> +++ b/drivers/gpu/drm/i915/display/intel_lvds.c
> @@ -837,7 +837,7 @@ void intel_lvds_init(struct drm_i915_private *i915)
>  	struct intel_encoder *encoder;
>  	i915_reg_t lvds_reg;
>  	u32 lvds;
> -	u8 pin;
> +	u8 ddc_pin;
>=20=20
>  	/* Skip init on machines we know falsely report LVDS */
>  	if (dmi_check_system(intel_no_lvds)) {
> @@ -864,8 +864,8 @@ void intel_lvds_init(struct drm_i915_private *i915)
>  			return;
>  	}
>=20=20
> -	pin =3D GMBUS_PIN_PANEL;
> -	if (!intel_bios_is_lvds_present(i915, &pin)) {
> +	ddc_pin =3D GMBUS_PIN_PANEL;
> +	if (!intel_bios_is_lvds_present(i915, &ddc_pin)) {
>  		if ((lvds & LVDS_PORT_EN) =3D=3D 0) {
>  			drm_dbg_kms(&i915->drm,
>  				    "LVDS is not present in VBT\n");
> @@ -888,8 +888,10 @@ void intel_lvds_init(struct drm_i915_private *i915)
>  	lvds_encoder->attached_connector =3D connector;
>  	encoder =3D &lvds_encoder->base;
>=20=20
> -	drm_connector_init(&i915->drm, &connector->base, &intel_lvds_connector_=
funcs,
> -			   DRM_MODE_CONNECTOR_LVDS);
> +	drm_connector_init_with_ddc(&i915->drm, &connector->base,
> +				    &intel_lvds_connector_funcs,
> +				    DRM_MODE_CONNECTOR_LVDS,
> +				    intel_gmbus_get_adapter(i915, ddc_pin));
>=20=20
>  	drm_encoder_init(&i915->drm, &encoder->base, &intel_lvds_enc_funcs,
>  			 DRM_MODE_ENCODER_LVDS, "LVDS");
> @@ -943,13 +945,10 @@ void intel_lvds_init(struct drm_i915_private *i915)
>  	 * preferred mode is the right one.
>  	 */
>  	mutex_lock(&i915->drm.mode_config.mutex);
> -	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
> -		drm_edid =3D drm_edid_read_switcheroo(&connector->base,
> -						    intel_gmbus_get_adapter(i915, pin));
> -	} else {
> -		drm_edid =3D drm_edid_read_ddc(&connector->base,
> -					     intel_gmbus_get_adapter(i915, pin));
> -	}
> +	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
> +		drm_edid =3D drm_edid_read_switcheroo(&connector->base, connector->bas=
e.ddc);
> +	else
> +		drm_edid =3D drm_edid_read_ddc(&connector->base, connector->base.ddc);
>  	if (drm_edid) {
>  		if (drm_edid_connector_update(&connector->base, drm_edid) ||
>  		    !drm_edid_connector_add_modes(&connector->base)) {

--=20
Jani Nikula, Intel Open Source Graphics Center
