Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F9710935
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 11:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3DF10E871;
	Thu, 25 May 2023 09:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9710E13B;
 Thu, 25 May 2023 09:51:33 +0000 (UTC)
Received: from 91-155-254-196.elisa-laajakaista.fi ([91.155.254.196]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q27d3-008cQC-Ku;
 Thu, 25 May 2023 12:51:30 +0300
Message-ID: <c11fcc5b7920363e885826d31a4fd01e4dbb00a5.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 May 2023 12:51:28 +0300
In-Reply-To: <20230503113659.16305-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-9-ville.syrjala@linux.intel.com>
 <20230503113659.16305-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [Intel-gfx] [PATCH v2 08/11] drm/i915: Introduce
 crtc_state->enhanced_framing
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

On Wed, 2023-05-03 at 14:36 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Track DP enhanced framing properly in the crtc state instead
> of relying just on the cached DPCD everywhere, and hook it
> up into the state check and dump.
>=20
> v2: Actually set enhanced_framing in .compute_config()
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/g4x_dp.c                 | 10 ++++++++--
>  drivers/gpu/drm/i915/display/intel_crt.c              |  2 ++
>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c  |  5 +++--
>  drivers/gpu/drm/i915/display/intel_ddi.c              | 11 +++++++++--
>  drivers/gpu/drm/i915/display/intel_display.c          |  1 +
>  drivers/gpu/drm/i915/display/intel_display_types.h    |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp.c               |  3 +++
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c |  2 +-
>  8 files changed, 29 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915=
/display/g4x_dp.c
> index 920d570f7594..534546ea7d0b 100644
> --- a/drivers/gpu/drm/i915/display/g4x_dp.c
> +++ b/drivers/gpu/drm/i915/display/g4x_dp.c
> @@ -141,7 +141,7 @@ static void intel_dp_prepare(struct intel_encoder *en=
coder,
> =20
>  		intel_de_rmw(dev_priv, TRANS_DP_CTL(crtc->pipe),
>  			     TRANS_DP_ENH_FRAMING,
> -			     drm_dp_enhanced_frame_cap(intel_dp->dpcd) ?
> +			     pipe_config->enhanced_framing ?
>  			     TRANS_DP_ENH_FRAMING : 0);
>  	} else {
>  		if (IS_G4X(dev_priv) && pipe_config->limited_color_range)
> @@ -153,7 +153,7 @@ static void intel_dp_prepare(struct intel_encoder *en=
coder,
>  			intel_dp->DP |=3D DP_SYNC_VS_HIGH;
>  		intel_dp->DP |=3D DP_LINK_TRAIN_OFF;
> =20
> -		if (drm_dp_enhanced_frame_cap(intel_dp->dpcd))
> +		if (pipe_config->enhanced_framing)
>  			intel_dp->DP |=3D DP_ENHANCED_FRAMING;
> =20
>  		if (IS_CHERRYVIEW(dev_priv))
> @@ -351,6 +351,9 @@ static void intel_dp_get_config(struct intel_encoder =
*encoder,
>  		u32 trans_dp =3D intel_de_read(dev_priv,
>  					     TRANS_DP_CTL(crtc->pipe));
> =20
> +		if (trans_dp & TRANS_DP_ENH_FRAMING)
> +			pipe_config->enhanced_framing =3D true;
> +
>  		if (trans_dp & TRANS_DP_HSYNC_ACTIVE_HIGH)
>  			flags |=3D DRM_MODE_FLAG_PHSYNC;
>  		else
> @@ -361,6 +364,9 @@ static void intel_dp_get_config(struct intel_encoder =
*encoder,
>  		else
>  			flags |=3D DRM_MODE_FLAG_NVSYNC;
>  	} else {
> +		if (tmp & DP_ENHANCED_FRAMING)
> +			pipe_config->enhanced_framing =3D true;
> +
>  		if (tmp & DP_SYNC_HS_HIGH)
>  			flags |=3D DRM_MODE_FLAG_PHSYNC;
>  		else
> diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i=
915/display/intel_crt.c
> index 13519f78cf9f..52af64aa9953 100644
> --- a/drivers/gpu/drm/i915/display/intel_crt.c
> +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> @@ -449,6 +449,8 @@ static int hsw_crt_compute_config(struct intel_encode=
r *encoder,
>  	/* FDI must always be 2.7 GHz */
>  	pipe_config->port_clock =3D 135000 * 2;
> =20
> +	pipe_config->enhanced_framing =3D true;
> +

Just curious, why are you setting it to true by default here?

Otherwise, the changes look reasonable:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
