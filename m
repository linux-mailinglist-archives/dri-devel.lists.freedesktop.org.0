Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4C1CA475
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7113E6EA81;
	Fri,  8 May 2020 06:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211296EA81;
 Fri,  8 May 2020 06:49:07 +0000 (UTC)
IronPort-SDR: YSn3jlAJ/ovFyvOYu7hWmZrlYZ2b64tthQiqOm5/JkWf3PBpHM2NszlEfodMhH7fAbGi3bxa9N
 1FRrmm3wbWBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 23:49:06 -0700
IronPort-SDR: 5nGyvKNXcLhxXoRI6+ljuHIZP9XiiXE8us99kRracXVYKloDX8QHJFK8Nu6+Ia9RfLPw0HQA6S
 KjT9oB8yNb2g==
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; d="scan'208";a="435579005"
Received: from keolinsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.33.209])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 23:49:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Imre Deak <imre.deak@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Pankaj Bharadiya
 <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v2 3/9] drm/i915/display/sdvo: Prefer drm_WARN* over WARN*
In-Reply-To: <20200504181600.18503-4-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200504181600.18503-4-pankaj.laxminarayan.bharadiya@intel.com>
Date: Fri, 08 May 2020 09:48:57 +0300
Message-ID: <87tv0q6hwm.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 04 May 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> struct drm_device specific drm_WARN* macros include device information
> in the backtrace, so we know what device the warnings originate from.
>
> Prefer drm_WARN* over WARN* calls.
>
> changes since v1:
> - Added dev_priv local variable and used it in drm_WARN* calls (Jani)

In the earlier patches you're adding i915 local variable, here it's
dev_priv. We're gradually transitioning from dev_priv to i915, so I'm
not thrilled about adding new dev_priv.

BR,
Jani.



>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_sdvo.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index bc6c26818e15..773523dcd107 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -411,6 +411,7 @@ static const char *sdvo_cmd_name(u8 cmd)
>  static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
>  				   const void *args, int args_len)
>  {
> +	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
>  	const char *cmd_name;
>  	int i, pos = 0;
>  	char buffer[64];
> @@ -431,7 +432,7 @@ static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
>  	else
>  		BUF_PRINT("(%02X)", cmd);
>  
> -	WARN_ON(pos >= sizeof(buffer) - 1);
> +	drm_WARN_ON(&dev_priv->drm, pos >= sizeof(buffer) - 1);
>  #undef BUF_PRINT
>  
>  	DRM_DEBUG_KMS("%s: W: %02X %s\n", SDVO_NAME(intel_sdvo), cmd, buffer);
> @@ -533,6 +534,7 @@ static bool intel_sdvo_write_cmd(struct intel_sdvo *intel_sdvo, u8 cmd,
>  static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
>  				     void *response, int response_len)
>  {
> +	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
>  	const char *cmd_status;
>  	u8 retry = 15; /* 5 quick checks, followed by 10 long checks */
>  	u8 status;
> @@ -597,7 +599,7 @@ static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
>  		BUF_PRINT(" %02X", ((u8 *)response)[i]);
>  	}
>  
> -	WARN_ON(pos >= sizeof(buffer) - 1);
> +	drm_WARN_ON(&dev_priv->drm, pos >= sizeof(buffer) - 1);
>  #undef BUF_PRINT
>  
>  	DRM_DEBUG_KMS("%s: R: %s\n", SDVO_NAME(intel_sdvo), buffer);
> @@ -1081,6 +1083,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  					     struct intel_crtc_state *crtc_state,
>  					     struct drm_connector_state *conn_state)
>  {
> +	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
>  	struct hdmi_avi_infoframe *frame = &crtc_state->infoframes.avi.avi;
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
> @@ -1106,7 +1109,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  					   HDMI_QUANTIZATION_RANGE_FULL);
>  
>  	ret = hdmi_avi_infoframe_check(frame);
> -	if (WARN_ON(ret))
> +	if (drm_WARN_ON(&dev_priv->drm, ret))
>  		return false;
>  
>  	return true;
> @@ -1115,6 +1118,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  					 const struct intel_crtc_state *crtc_state)
>  {
> +	struct drm_i915_private *dev_priv = to_i915(intel_sdvo->base.base.dev);
>  	u8 sdvo_data[HDMI_INFOFRAME_SIZE(AVI)];
>  	const union hdmi_infoframe *frame = &crtc_state->infoframes.avi;
>  	ssize_t len;
> @@ -1123,11 +1127,12 @@ static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  	     intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_AVI)) == 0)
>  		return true;
>  
> -	if (WARN_ON(frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
> +	if (drm_WARN_ON(&dev_priv->drm,
> +			frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
>  		return false;
>  
>  	len = hdmi_infoframe_pack_only(frame, sdvo_data, sizeof(sdvo_data));
> -	if (WARN_ON(len < 0))
> +	if (drm_WARN_ON(&dev_priv->drm, len < 0))
>  		return false;
>  
>  	return intel_sdvo_write_infoframe(intel_sdvo, SDVO_HBUF_INDEX_AVI_IF,
> @@ -1237,6 +1242,7 @@ intel_sdvo_get_preferred_input_mode(struct intel_sdvo *intel_sdvo,
>  
>  static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
>  {
> +	struct drm_i915_private *dev_priv = to_i915(pipe_config->uapi.crtc->dev);
>  	unsigned dotclock = pipe_config->port_clock;
>  	struct dpll *clock = &pipe_config->dpll;
>  
> @@ -1257,7 +1263,8 @@ static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
>  		clock->m1 = 12;
>  		clock->m2 = 8;
>  	} else {
> -		WARN(1, "SDVO TV clock out of range: %i\n", dotclock);
> +		drm_WARN(&dev_priv->drm, 1,
> +			 "SDVO TV clock out of range: %i\n", dotclock);
>  	}
>  
>  	pipe_config->clock_set = true;
> @@ -2293,7 +2300,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
>  				return 0;
>  			}
>  
> -		WARN_ON(1);
> +		drm_WARN_ON(connector->dev, 1);
>  		*val = 0;
>  	} else if (property == intel_sdvo_connector->top ||
>  		   property == intel_sdvo_connector->bottom)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
