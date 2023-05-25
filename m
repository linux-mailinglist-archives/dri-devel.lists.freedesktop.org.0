Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A2E7107B3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA7910E809;
	Thu, 25 May 2023 08:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A34F10E7F8;
 Thu, 25 May 2023 08:37:19 +0000 (UTC)
Received: from 91-155-254-196.elisa-laajakaista.fi ([91.155.254.196]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q26TD-008cKg-TS;
 Thu, 25 May 2023 11:37:17 +0300
Message-ID: <4e3be3e8a391f69c12de3b803ca3203711e77b3c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 May 2023 11:37:10 +0300
In-Reply-To: <20230502143906.2401-7-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-7-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [Intel-gfx] [PATCH 06/11] drm/i915: Fix FEC state dump
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
> Stop dumping state while reading it out. We have a proper
> place for that stuff.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  .../gpu/drm/i915/display/intel_crtc_state_dump.c    |  2 ++
>  drivers/gpu/drm/i915/display/intel_ddi.c            | 13 +++----------
>  2 files changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drive=
rs/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 0cdcaa49656f..91242ffe0768 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -257,6 +257,8 @@ void intel_crtc_state_dump(const struct intel_crtc_st=
ate *pipe_config,
>  		intel_dump_m_n_config(pipe_config, "dp m2_n2",
>  				      pipe_config->lane_count,
>  				      &pipe_config->dp_m2_n2);
> +		drm_dbg_kms(&i915->drm, "fec: %s\n",
> +			    str_enabled_disabled(pipe_config->fec_enable));
>  	}
> =20
>  	drm_dbg_kms(&i915->drm, "framestart delay: %d, MSA timing delay: %d\n",
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 41cfa28166e4..4246133950fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3725,17 +3725,10 @@ static void intel_ddi_read_func_ctl(struct intel_=
encoder *encoder,
>  		intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder,
>  					       &pipe_config->dp_m2_n2);
> =20
> -		if (DISPLAY_VER(dev_priv) >=3D 11) {
> -			i915_reg_t dp_tp_ctl =3D dp_tp_ctl_reg(encoder, pipe_config);
> -
> +		if (DISPLAY_VER(dev_priv) >=3D 11)
>  			pipe_config->fec_enable =3D
> -				intel_de_read(dev_priv, dp_tp_ctl) & DP_TP_CTL_FEC_ENABLE;
> -
> -			drm_dbg_kms(&dev_priv->drm,
> -				    "[ENCODER:%d:%s] Fec status: %u\n",
> -				    encoder->base.base.id, encoder->base.name,
> -				    pipe_config->fec_enable);
> -		}
> +				intel_de_read(dev_priv,
> +					      dp_tp_ctl_reg(encoder, pipe_config)) & DP_TP_CTL_FEC_ENABLE;
> =20
>  		if (dig_port->lspcon.active && dig_port->dp.has_hdmi_sink)
>  			pipe_config->infoframes.enable |=3D

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
