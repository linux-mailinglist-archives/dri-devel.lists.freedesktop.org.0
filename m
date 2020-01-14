Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2A13AC2D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 15:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AF56E3F2;
	Tue, 14 Jan 2020 14:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB676E3EE;
 Tue, 14 Jan 2020 14:23:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 06:23:15 -0800
X-IronPort-AV: E=Sophos;i="5.69,433,1571727600"; d="scan'208";a="225231267"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 06:23:11 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 2/5] drm/i915/audio: convert to new drm logging macros.
In-Reply-To: <20200114095107.21197-3-wambui.karugax@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200114095107.21197-1-wambui.karugax@gmail.com>
 <20200114095107.21197-3-wambui.karugax@gmail.com>
Date: Tue, 14 Jan 2020 16:23:09 +0200
Message-ID: <87d0bmktgy.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Jan 2020, Wambui Karuga <wambui.karugax@gmail.com> wrote:
> Converts the printk based logging macros in i915/display/intel_audio.c
> to the struct drm_device based logging macros.

Couple of comments inline.

BR,
Jani.


> This transformation was achieved using the following coccinelle script
> that matches the existence of the struct drm_i915_private device:
>
> @rule1@
> identifier fn, T;
> @@
>
> fn(struct drm_i915_private *T,...) {
> <+...
> (
> -DRM_INFO(
> +drm_info(&T->drm,
> ...)
> |
> -DRM_ERROR(
> +drm_err(&T->drm,
> ...)
> |
> -DRM_WARN(
> +drm_warn(&T->drm,
> ...)
> |
> -DRM_DEBUG(
> +drm_dbg(&T->drm,
> ...)
> |
> -DRM_DEBUG_DRIVER(
> +drm_dbg(&T->drm,
> ...)
> |
> -DRM_DEBUG_KMS(
> +drm_dbg_kms(&T->drm,
> ...)
> )
> ...+>
> }
>
> @rule2@
> identifier fn, T;
> @@
>
> fn(...) {
> ...
> struct drm_i915_private *T = ...;
> <+...
> (
> -DRM_INFO(
> +drm_info(&T->drm,
> ...)
> |
> -DRM_ERROR(
> +drm_err(&T->drm,
> ...)
> |
> -DRM_WARN(
> +drm_warn(&T->drm,
> ...)
> |
> -DRM_DEBUG(
> +drm_dbg(&T->drm,
> ...)
> |
> -DRM_DEBUG_KMS(
> +drm_dbg_kms(&T->drm,
> ...)
> |
> -DRM_DEBUG_DRIVER(
> +drm_dbg(&T->drm,
> ...)
> )
> ...+>
> }
>
> Checkpatch warnings were manually fixed.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c | 71 ++++++++++++----------
>  1 file changed, 40 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index e406719a6716..57208440bf6d 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -315,7 +315,7 @@ static void g4x_audio_codec_disable(struct intel_encoder *encoder,
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>  	u32 eldv, tmp;
>  
> -	DRM_DEBUG_KMS("Disable audio codec\n");
> +	drm_dbg_kms(&dev_priv->drm, "Disable audio codec\n");
>  
>  	tmp = I915_READ(G4X_AUD_VID_DID);
>  	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
> @@ -340,7 +340,8 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
>  	u32 tmp;
>  	int len, i;
>  
> -	DRM_DEBUG_KMS("Enable audio codec, %u bytes ELD\n", drm_eld_size(eld));
> +	drm_dbg_kms(&dev_priv->drm, "Enable audio codec, %u bytes ELD\n",
> +		    drm_eld_size(eld));
>  
>  	tmp = I915_READ(G4X_AUD_VID_DID);
>  	if (tmp == INTEL_AUDIO_DEVBLC || tmp == INTEL_AUDIO_DEVCL)
> @@ -360,7 +361,7 @@ static void g4x_audio_codec_enable(struct intel_encoder *encoder,
>  	I915_WRITE(G4X_AUD_CNTL_ST, tmp);
>  
>  	len = min(drm_eld_size(eld) / 4, len);
> -	DRM_DEBUG_DRIVER("ELD size %d\n", len);
> +	drm_dbg(&dev_priv->drm, "ELD size %d\n", len);

Please convert this to drm_dbg_kms() while at it.

>  	for (i = 0; i < len; i++)
>  		I915_WRITE(G4X_HDMIW_HDMIEDID, *((const u32 *)eld + i));
>  
> @@ -384,9 +385,10 @@ hsw_dp_audio_config_update(struct intel_encoder *encoder,
>  	rate = acomp ? acomp->aud_sample_rate[port] : 0;
>  	nm = audio_config_dp_get_n_m(crtc_state, rate);
>  	if (nm)
> -		DRM_DEBUG_KMS("using Maud %u, Naud %u\n", nm->m, nm->n);
> +		drm_dbg_kms(&dev_priv->drm, "using Maud %u, Naud %u\n", nm->m,
> +			    nm->n);
>  	else
> -		DRM_DEBUG_KMS("using automatic Maud, Naud\n");
> +		drm_dbg_kms(&dev_priv->drm, "using automatic Maud, Naud\n");
>  
>  	tmp = I915_READ(HSW_AUD_CFG(cpu_transcoder));
>  	tmp &= ~AUD_CONFIG_N_VALUE_INDEX;
> @@ -437,13 +439,13 @@ hsw_hdmi_audio_config_update(struct intel_encoder *encoder,
>  
>  	n = audio_config_hdmi_get_n(crtc_state, rate);
>  	if (n != 0) {
> -		DRM_DEBUG_KMS("using N %d\n", n);
> +		drm_dbg_kms(&dev_priv->drm, "using N %d\n", n);
>  
>  		tmp &= ~AUD_CONFIG_N_MASK;
>  		tmp |= AUD_CONFIG_N(n);
>  		tmp |= AUD_CONFIG_N_PROG_ENABLE;
>  	} else {
> -		DRM_DEBUG_KMS("using automatic N\n");
> +		drm_dbg_kms(&dev_priv->drm, "using automatic N\n");
>  	}
>  
>  	I915_WRITE(HSW_AUD_CFG(cpu_transcoder), tmp);
> @@ -476,8 +478,8 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
>  	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
>  	u32 tmp;
>  
> -	DRM_DEBUG_KMS("Disable audio codec on transcoder %s\n",
> -		      transcoder_name(cpu_transcoder));
> +	drm_dbg_kms(&dev_priv->drm, "Disable audio codec on transcoder %s\n",
> +		    transcoder_name(cpu_transcoder));
>  
>  	mutex_lock(&dev_priv->av_mutex);
>  
> @@ -511,8 +513,9 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
>  	u32 tmp;
>  	int len, i;
>  
> -	DRM_DEBUG_KMS("Enable audio codec on transcoder %s, %u bytes ELD\n",
> -		      transcoder_name(cpu_transcoder), drm_eld_size(eld));
> +	drm_dbg_kms(&dev_priv->drm,
> +		    "Enable audio codec on transcoder %s, %u bytes ELD\n",
> +		     transcoder_name(cpu_transcoder), drm_eld_size(eld));
>  
>  	mutex_lock(&dev_priv->av_mutex);
>  
> @@ -561,9 +564,10 @@ static void ilk_audio_codec_disable(struct intel_encoder *encoder,
>  	u32 tmp, eldv;
>  	i915_reg_t aud_config, aud_cntrl_st2;
>  
> -	DRM_DEBUG_KMS("Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
> -		      encoder->base.base.id, encoder->base.name,
> -		      pipe_name(pipe));
> +	drm_dbg_kms(&dev_priv->drm,
> +		    "Disable audio codec on [ENCODER:%d:%s], pipe %c\n",
> +		     encoder->base.base.id, encoder->base.name,
> +		     pipe_name(pipe));
>  
>  	if (WARN_ON(port == PORT_A))
>  		return;
> @@ -611,9 +615,10 @@ static void ilk_audio_codec_enable(struct intel_encoder *encoder,
>  	int len, i;
>  	i915_reg_t hdmiw_hdmiedid, aud_config, aud_cntl_st, aud_cntrl_st2;
>  
> -	DRM_DEBUG_KMS("Enable audio codec on [ENCODER:%d:%s], pipe %c, %u bytes ELD\n",
> -		      encoder->base.base.id, encoder->base.name,
> -		      pipe_name(pipe), drm_eld_size(eld));
> +	drm_dbg_kms(&dev_priv->drm,
> +		    "Enable audio codec on [ENCODER:%d:%s], pipe %c, %u bytes ELD\n",
> +		    encoder->base.base.id, encoder->base.name,
> +		    pipe_name(pipe), drm_eld_size(eld));
>  
>  	if (WARN_ON(port == PORT_A))
>  		return;
> @@ -701,14 +706,13 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
>  
>  	/* FIXME precompute the ELD in .compute_config() */
>  	if (!connector->eld[0])
> -		DRM_DEBUG_KMS("Bogus ELD on [CONNECTOR:%d:%s]\n",
> -			      connector->base.id, connector->name);
> +		drm_dbg_kms(&dev_priv->drm,
> +			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
> +			    connector->base.id, connector->name);
>  
> -	DRM_DEBUG_DRIVER("ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
> -			 connector->base.id,
> -			 connector->name,
> -			 connector->encoder->base.id,
> -			 connector->encoder->name);
> +	drm_dbg(&dev_priv->drm, "ELD on [CONNECTOR:%d:%s], [ENCODER:%d:%s]\n",
> +		connector->base.id, connector->name,
> +		connector->encoder->base.id, connector->encoder->name);

Please convert this to drm_dbg_kms() while at it.

>  
>  	connector->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
>  
> @@ -851,8 +855,9 @@ static unsigned long i915_audio_component_get_power(struct device *kdev)
>  	if (dev_priv->audio_power_refcount++ == 0) {
>  		if (IS_TIGERLAKE(dev_priv) || IS_ICELAKE(dev_priv)) {
>  			I915_WRITE(AUD_FREQ_CNTRL, dev_priv->audio_freq_cntrl);
> -			DRM_DEBUG_KMS("restored AUD_FREQ_CNTRL to 0x%x\n",
> -				      dev_priv->audio_freq_cntrl);
> +			drm_dbg_kms(&dev_priv->drm,
> +				    "restored AUD_FREQ_CNTRL to 0x%x\n",
> +				    dev_priv->audio_freq_cntrl);
>  		}
>  
>  		/* Force CDCLK to 2*BCLK as long as we need audio powered. */
> @@ -992,7 +997,8 @@ static int i915_audio_component_sync_audio_rate(struct device *kdev, int port,
>  	/* 1. get the pipe */
>  	encoder = get_saved_enc(dev_priv, port, pipe);
>  	if (!encoder || !encoder->base.crtc) {
> -		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
> +		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
> +			    port_name(port));
>  		err = -ENODEV;
>  		goto unlock;
>  	}
> @@ -1023,7 +1029,8 @@ static int i915_audio_component_get_eld(struct device *kdev, int port,
>  
>  	intel_encoder = get_saved_enc(dev_priv, port, pipe);
>  	if (!intel_encoder) {
> -		DRM_DEBUG_KMS("Not valid for port %c\n", port_name(port));
> +		drm_dbg_kms(&dev_priv->drm, "Not valid for port %c\n",
> +			    port_name(port));
>  		mutex_unlock(&dev_priv->av_mutex);
>  		return ret;
>  	}
> @@ -1119,15 +1126,17 @@ static void i915_audio_component_init(struct drm_i915_private *dev_priv)
>  				  &i915_audio_component_bind_ops,
>  				  I915_COMPONENT_AUDIO);
>  	if (ret < 0) {
> -		DRM_ERROR("failed to add audio component (%d)\n", ret);
> +		drm_err(&dev_priv->drm,
> +			"failed to add audio component (%d)\n", ret);
>  		/* continue with reduced functionality */
>  		return;
>  	}
>  
>  	if (IS_TIGERLAKE(dev_priv) || IS_ICELAKE(dev_priv)) {
>  		dev_priv->audio_freq_cntrl = I915_READ(AUD_FREQ_CNTRL);
> -		DRM_DEBUG_KMS("init value of AUD_FREQ_CNTRL of 0x%x\n",
> -			      dev_priv->audio_freq_cntrl);
> +		drm_dbg_kms(&dev_priv->drm,
> +			    "init value of AUD_FREQ_CNTRL of 0x%x\n",
> +			    dev_priv->audio_freq_cntrl);
>  	}
>  
>  	dev_priv->audio_component_registered = true;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
