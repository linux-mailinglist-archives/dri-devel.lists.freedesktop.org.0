Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127371B1F46
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9283E6E8C9;
	Tue, 21 Apr 2020 06:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284D66E8C3;
 Tue, 21 Apr 2020 06:55:40 +0000 (UTC)
IronPort-SDR: /uWrBlMaTMX6VDk7kLbGrrwt9OAkn+9poTQwNp7WEuadq7P/4XHCghXsSo65SOd/kv1CVTtJN5
 XpqW+qbHrvpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:55:39 -0700
IronPort-SDR: 2JMRaGxKmaWAPRgifcZ7HiD+TsHeWZTAaIRRuwHP0upcg53a6diM8U+2/mwhhLm4NTEViizthj
 /ohuYMq9HK7Q==
X-IronPort-AV: E=Sophos;i="5.72,409,1580803200"; d="scan'208";a="429422984"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.46.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 23:55:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 11/18] drm/i915/display/sdvo: Prefer drm_WARN* over WARN*
In-Reply-To: <20200406112800.23762-12-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200406112800.23762-12-pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue, 21 Apr 2020 09:55:30 +0300
Message-ID: <875zdt1g65.fsf@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 06 Apr 2020, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com> wrote:
> struct drm_device specific drm_WARN* macros include device information
> in the backtrace, so we know what device the warnings originate from.
>
> Prefer drm_WARN* over WARN* calls.
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_sdvo.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index e6306cbb7a3a..477465a9af90 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -431,7 +431,7 @@ static void intel_sdvo_debug_write(struct intel_sdvo *intel_sdvo, u8 cmd,
>  	else
>  		BUF_PRINT("(%02X)", cmd);
>  
> -	WARN_ON(pos >= sizeof(buffer) - 1);
> +	drm_WARN_ON(intel_sdvo->base.base.dev, pos >= sizeof(buffer) - 1);
>  #undef BUF_PRINT
>  
>  	DRM_DEBUG_KMS("%s: W: %02X %s\n", SDVO_NAME(intel_sdvo), cmd, buffer);
> @@ -597,7 +597,7 @@ static bool intel_sdvo_read_response(struct intel_sdvo *intel_sdvo,
>  		BUF_PRINT(" %02X", ((u8 *)response)[i]);
>  	}
>  
> -	WARN_ON(pos >= sizeof(buffer) - 1);
> +	drm_WARN_ON(intel_sdvo->base.base.dev, pos >= sizeof(buffer) - 1);
>  #undef BUF_PRINT
>  
>  	DRM_DEBUG_KMS("%s: R: %s\n", SDVO_NAME(intel_sdvo), buffer);
> @@ -1106,7 +1106,7 @@ static bool intel_sdvo_compute_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  					   HDMI_QUANTIZATION_RANGE_FULL);
>  
>  	ret = hdmi_avi_infoframe_check(frame);
> -	if (WARN_ON(ret))
> +	if (drm_WARN_ON(intel_sdvo->base.base.dev, ret))
>  		return false;
>  
>  	return true;
> @@ -1123,11 +1123,12 @@ static bool intel_sdvo_set_avi_infoframe(struct intel_sdvo *intel_sdvo,
>  	     intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_AVI)) == 0)
>  		return true;
>  
> -	if (WARN_ON(frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
> +	if (drm_WARN_ON(intel_sdvo->base.base.dev,
> +			frame->any.type != HDMI_INFOFRAME_TYPE_AVI))
>  		return false;
>  
>  	len = hdmi_infoframe_pack_only(frame, sdvo_data, sizeof(sdvo_data));
> -	if (WARN_ON(len < 0))
> +	if (drm_WARN_ON(intel_sdvo->base.base.dev, len < 0))

For most places, but especially places like this, I'd rather you added a
i915 local variable and used &i915->drm instead.

BR,
Jani.


>  		return false;
>  
>  	return intel_sdvo_write_infoframe(intel_sdvo, SDVO_HBUF_INDEX_AVI_IF,
> @@ -1257,7 +1258,8 @@ static void i9xx_adjust_sdvo_tv_clock(struct intel_crtc_state *pipe_config)
>  		clock->m1 = 12;
>  		clock->m2 = 8;
>  	} else {
> -		WARN(1, "SDVO TV clock out of range: %i\n", dotclock);
> +		drm_WARN(pipe_config->uapi.crtc->dev, 1,
> +			 "SDVO TV clock out of range: %i\n", dotclock);
>  	}
>  
>  	pipe_config->clock_set = true;
> @@ -2294,7 +2296,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
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
