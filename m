Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EFB842138
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B72112F1F;
	Tue, 30 Jan 2024 10:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D597D112F11;
 Tue, 30 Jan 2024 10:26:07 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlJd-00000001Y0Z-1b1u; Tue, 30 Jan 2024 12:26:05 +0200
Message-ID: <599de90b10596a160c9913fbae571671e1de10f7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:26:04 +0200
In-Reply-To: <cdf8faf272d345de215feb6ececba384ecaecdb4.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <cdf8faf272d345de215feb6ececba384ecaecdb4.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 06/10] drm/dp: switch drm_dp_vsc_sdp_log() to struct
 drm_printer
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> Use the existing drm printer infrastructure instead of local macros.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 17 +++++-------
>  .../drm/i915/display/intel_crtc_state_dump.c  |  5 ++--
>  drivers/gpu/drm/i915/display/intel_display.c  | 27 +++++++++----------
>  include/drm/display/drm_dp_helper.h           |  3 +--
>  4 files changed, 23 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index d72b6f9a352c..1cf51a748022 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2898,22 +2898,19 @@ static const char *dp_content_type_get_name(enum =
dp_content_type content_type)
>  	}
>  }
> =20
> -void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> -			const struct drm_dp_vsc_sdp *vsc)
> +void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_s=
dp *vsc)
>  {
> -#define DP_SDP_LOG(fmt, ...) dev_printk(level, dev, fmt, ##__VA_ARGS__)
> -	DP_SDP_LOG("DP SDP: %s, revision %u, length %u\n", "VSC",
> +	drm_printf(p, "DP SDP: VSC, revision %u, length %u\n",
>  		   vsc->revision, vsc->length);
> -	DP_SDP_LOG("    pixelformat: %s\n",
> +	drm_printf(p, "    pixelformat: %s\n",
>  		   dp_pixelformat_get_name(vsc->pixelformat));
> -	DP_SDP_LOG("    colorimetry: %s\n",
> +	drm_printf(p, "    colorimetry: %s\n",
>  		   dp_colorimetry_get_name(vsc->pixelformat, vsc->colorimetry));
> -	DP_SDP_LOG("    bpc: %u\n", vsc->bpc);
> -	DP_SDP_LOG("    dynamic range: %s\n",
> +	drm_printf(p, "    bpc: %u\n", vsc->bpc);
> +	drm_printf(p, "    dynamic range: %s\n",
>  		   dp_dynamic_range_get_name(vsc->dynamic_range));
> -	DP_SDP_LOG("    content type: %s\n",
> +	drm_printf(p, "    content type: %s\n",
>  		   dp_content_type_get_name(vsc->content_type));
> -#undef DP_SDP_LOG
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drive=
rs/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 49fd100ec98a..4bcf446c75f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -55,10 +55,9 @@ static void
>  intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
>  		      const struct drm_dp_vsc_sdp *vsc)
>  {
> -	if (!drm_debug_enabled(DRM_UT_KMS))
> -		return;
> +	struct drm_printer p =3D drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
> =20
> -	drm_dp_vsc_sdp_log(KERN_DEBUG, i915->drm.dev, vsc);
> +	drm_dp_vsc_sdp_log(&p, vsc);
>  }
> =20
>  static void
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index a92e959c8ac7..e1573e0a2661 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4813,28 +4813,27 @@ pipe_config_infoframe_mismatch(struct drm_i915_pr=
ivate *dev_priv,
>  }
> =20
>  static void
> -pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *dev_priv,
> +pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *i915,
>  				bool fastset, const char *name,
>  				const struct drm_dp_vsc_sdp *a,
>  				const struct drm_dp_vsc_sdp *b)
>  {
> +	struct drm_printer p;
> +
>  	if (fastset) {
> -		if (!drm_debug_enabled(DRM_UT_KMS))
> -			return;
> +		p =3D drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
> =20
> -		drm_dbg_kms(&dev_priv->drm,
> -			    "fastset requirement not met in %s dp sdp\n", name);
> -		drm_dbg_kms(&dev_priv->drm, "expected:\n");
> -		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, a);
> -		drm_dbg_kms(&dev_priv->drm, "found:\n");
> -		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, b);
> +		drm_printf(&p, "fastset requirement not met in %s dp sdp\n", name);
>  	} else {
> -		drm_err(&dev_priv->drm, "mismatch in %s dp sdp\n", name);
> -		drm_err(&dev_priv->drm, "expected:\n");
> -		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, a);
> -		drm_err(&dev_priv->drm, "found:\n");
> -		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, b);
> +		p =3D drm_err_printer(&i915->drm, NULL);
> +
> +		drm_printf(&p, "mismatch in %s dp sdp\n", name);
>  	}
> +
> +	drm_printf(&p, "expected:\n");
> +	drm_dp_vsc_sdp_log(&p, a);
> +	drm_printf(&p, "found:\n");
> +	drm_dp_vsc_sdp_log(&p, b);
>  }
> =20
>  /* Returns the length up to and including the last differing byte */
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index 863b2e7add29..d02014a87f12 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -98,8 +98,7 @@ struct drm_dp_vsc_sdp {
>  	enum dp_content_type content_type;
>  };
> =20
> -void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> -			const struct drm_dp_vsc_sdp *vsc);
> +void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_s=
dp *vsc);
> =20
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
> =20

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
