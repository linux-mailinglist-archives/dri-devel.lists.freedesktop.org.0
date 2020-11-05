Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8D2A8007
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA746ED27;
	Thu,  5 Nov 2020 13:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD736ED23;
 Thu,  5 Nov 2020 13:52:17 +0000 (UTC)
IronPort-SDR: 5FwFoBLNEIKs+wEZBpFNtxkNgp6Q5RxmaORspUCghtHwxiA6enHs+FxFl4VauUyscbGgdbTZhl
 jRXH2VO5jahw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="168600972"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="168600972"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:52:16 -0800
IronPort-SDR: 1DabSkTvUv6oDq+nLca8W0Kku9Rm1o/FaM9/mq8xe94KXsbjwCd/UgUlVGYDZuysfr9+Uvdced
 26gBJsXKDqHg==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="471655623"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:52:13 -0800
Date: Thu, 5 Nov 2020 19:22:57 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v4 04/16] drm/i915/hdcp: DP MST transcoder for link and
 stream
Message-ID: <20201105135256.GE3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201027164208.10026-5-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 at 22:11:56 +0530, Anshuman Gupta wrote:
> Gen12 has H/W delta with respect to HDCP{1.x,2.x} display engine
> instances lies in Transcoder instead of DDI as in Gen11.
> 
> This requires hdcp driver to use mst_master_transcoder for link
> authentication and stream transcoder for stream encryption
> separately.
> 
> This will be used for both HDCP 1.4 and HDCP 2.2 over DP MST
> on Gen12.
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c          |  2 +-
>  .../gpu/drm/i915/display/intel_display_types.h    |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c       |  2 +-
>  drivers/gpu/drm/i915/display/intel_hdcp.c         | 15 +++++++++++----
>  drivers/gpu/drm/i915/display/intel_hdcp.h         |  2 +-
>  5 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 63380b166c25..9fce623e951e 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4059,7 +4059,7 @@ static void intel_enable_ddi(struct intel_atomic_state *state,
>  	if (conn_state->content_protection ==
>  	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
>  		intel_hdcp_enable(to_intel_connector(conn_state->connector),
> -				  crtc_state->cpu_transcoder,
> +				  crtc_state,
>  				  (u8)conn_state->hdcp_content_type);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index f6f0626649e0..c47124a679b6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -432,6 +432,8 @@ struct intel_hdcp {
>  	 * Hence caching the transcoder here.
>  	 */
>  	enum transcoder cpu_transcoder;
> +	/* Only used for DP MST stream encryption */
> +	enum transcoder stream_transcoder;
>  };
>  
>  struct intel_connector {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index c8fcec4d0788..16865b200062 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -568,7 +568,7 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>  	if (conn_state->content_protection ==
>  	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
>  		intel_hdcp_enable(to_intel_connector(conn_state->connector),
> -				  pipe_config->cpu_transcoder,
> +				  pipe_config,
>  				  (u8)conn_state->hdcp_content_type);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b9d8825e2bb1..fc5de48456ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2095,7 +2095,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  }
>  
>  int intel_hdcp_enable(struct intel_connector *connector,
> -		      enum transcoder cpu_transcoder, u8 content_type)
> +		      const struct intel_crtc_state *pipe_config, u8 content_type)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> @@ -2111,10 +2111,17 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  	drm_WARN_ON(&dev_priv->drm,
>  		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
>  	hdcp->content_type = content_type;
> -	hdcp->cpu_transcoder = cpu_transcoder;
> +
> +	if (intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST)) {
> +		hdcp->cpu_transcoder = pipe_config->mst_master_transcoder;
> +		hdcp->stream_transcoder = pipe_config->cpu_transcoder;
> +	} else {
> +		hdcp->cpu_transcoder = pipe_config->cpu_transcoder;
> +		hdcp->stream_transcoder = INVALID_TRANSCODER;
> +	}
>  
>  	if (INTEL_GEN(dev_priv) >= 12)
> -		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(cpu_transcoder);
> +		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
>  
>  	/*
>  	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
> @@ -2234,7 +2241,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
>  
>  	if (desired_and_not_enabled || content_protection_type_changed)
>  		intel_hdcp_enable(connector,
> -				  crtc_state->cpu_transcoder,
> +				  crtc_state,
>  				  (u8)conn_state->hdcp_content_type);
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
> index 1bbf5b67ed0a..bc51c1e9b481 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
> @@ -25,7 +25,7 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
>  int intel_hdcp_init(struct intel_connector *connector, enum port port,
>  		    const struct intel_hdcp_shim *hdcp_shim);
>  int intel_hdcp_enable(struct intel_connector *connector,
> -		      enum transcoder cpu_transcoder, u8 content_type);
> +		      const struct intel_crtc_state *pipe_config, u8 content_type);
>  int intel_hdcp_disable(struct intel_connector *connector);
>  void intel_hdcp_update_pipe(struct intel_atomic_state *state,
>  			    struct intel_encoder *encoder,
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
