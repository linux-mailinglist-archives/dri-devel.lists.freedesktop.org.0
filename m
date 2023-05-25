Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92247106E4
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8A910E7E8;
	Thu, 25 May 2023 08:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 804 seconds by postgrey-1.36 at gabe;
 Thu, 25 May 2023 08:09:34 UTC
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F9010E7E7;
 Thu, 25 May 2023 08:09:34 +0000 (UTC)
Received: from 91-155-254-196.elisa-laajakaista.fi ([91.155.254.196]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q262N-008cHk-CT;
 Thu, 25 May 2023 11:09:32 +0300
Message-ID: <e73031cb908653d57684775d66771998dedf71b0.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 May 2023 11:09:30 +0300
In-Reply-To: <20230502143906.2401-6-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [Intel-gfx] [PATCH 05/11] drm/i915: Check lane count when
 determining FEC support
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

On Tue, 2023-05-02 at 17:39 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> ICL doesn't support FEC with a x1 DP link. Make sure
> we don't try to enable FEC in such cases.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index b27b4fb71ed7..9ac199444155 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1218,7 +1218,8 @@ static bool intel_dp_source_supports_fec(struct int=
el_dp *intel_dp,
>  	if (DISPLAY_VER(dev_priv) >=3D 12)
>  		return true;
> =20
> -	if (DISPLAY_VER(dev_priv) =3D=3D 11 && encoder->port !=3D PORT_A)
> +	if (DISPLAY_VER(dev_priv) =3D=3D 11 &&
> +	    encoder->port !=3D PORT_A && pipe_config->lane_count !=3D 1)
>  		return true;
> =20
>  	return false;
> @@ -1234,7 +1235,7 @@ static bool intel_dp_supports_fec(struct intel_dp *=
intel_dp,
>  static bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
>  				  const struct intel_crtc_state *crtc_state)
>  {
> -	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP) && !crtc_state->fe=
c_enable)
> +	if (!intel_dp_is_edp(intel_dp) && !crtc_state->fec_enable)

I'm probably missing something, but this change...


>  		return false;
> =20
>  	return intel_dsc_source_support(crtc_state) &&
> @@ -1580,15 +1581,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *i=
ntel_dp,
>  	int pipe_bpp;
>  	int ret;
> =20
> -	pipe_config->fec_enable =3D !intel_dp_is_edp(intel_dp) &&
> -		intel_dp_supports_fec(intel_dp, pipe_config);
> -
> -	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
> -		return -EINVAL;
> -
> -	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format)=
)
> -		return -EINVAL;
> -
>  	if (compute_pipe_bpp)
>  		pipe_bpp =3D intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_reques=
ted_bpc);
>  	else
> @@ -1615,6 +1607,15 @@ int intel_dp_dsc_compute_config(struct intel_dp *i=
ntel_dp,
>  	pipe_config->port_clock =3D limits->max_rate;
>  	pipe_config->lane_count =3D limits->max_lane_count;
> =20
> +	pipe_config->fec_enable =3D !intel_dp_is_edp(intel_dp) &&
> +		intel_dp_supports_fec(intel_dp, pipe_config);
> +
> +	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
> +		return -EINVAL;
> +
> +	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format)=
)
> +		return -EINVAL;
> +
>  	if (intel_dp_is_edp(intel_dp)) {
>  		pipe_config->dsc.compressed_bpp =3D
>  			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,

...and this code move are not explained in the commit message? How are
they related?

--
Cheers,
Luca.
