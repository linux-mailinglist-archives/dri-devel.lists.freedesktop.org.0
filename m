Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E5A35261
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 00:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126B010E186;
	Thu, 13 Feb 2025 23:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CJTsgqEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C629510E12F;
 Thu, 13 Feb 2025 23:57:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AE48581;
 Fri, 14 Feb 2025 00:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739490998;
 bh=wnNf1nxymJb4gKNJpnoj6akFj49zAksSq0Yg6Yso8no=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJTsgqEAEKovD6aim4UcDNseqIB8fBYRUII0rsoP0LGNW3OhtIqxnqMxklaFvktmV
 +T621TIJ49ANTCxryvAqDiPj0uu5U61uHpYAANcyC9W78RvPgAv8HqjouZYLDlL8Cf
 w9Gk612QkXT39HO0CW5hOQEzARXEcDOnsOoTvzrs=
Date: Fri, 14 Feb 2025 01:57:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort
 bridges
Message-ID: <20250213235745.GA7688@pendragon.ideasonboard.com>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
 <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, Feb 09, 2025 at 03:41:18PM +0200, Dmitry Baryshkov wrote:
> DRM HDMI Codec framework is useful not only for the HDMI bridges, but
> also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
> define in order to distinguish DP bridges. Create HDMI codec device
> automatically for DP bridges which have declared audio support.
> 
> Note, unlike HDMI devices, which already have a framework to handle HPD
> notifications in a standard way, DP drivers don't (yet?) have such a
> framework. As such it is necessary to manually call
> drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
> can be lifted later on, if/when DRM framework gets better DisplayPort
> ports support in the core layer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
>  include/drm/drm_bridge.h                       | 14 +++++-
>  2 files changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -98,6 +98,13 @@ struct drm_bridge_connector {
>  	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
>  	 */
>  	struct drm_bridge *bridge_hdmi;
> +	/**
> +	 * @bridge_dp:
> +	 *
> +	 * The bridge in the chain that implements necessary support for the
> +	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
> +	 */
> +	struct drm_bridge *bridge_dp;
>  };
>  
>  #define to_drm_bridge_connector(x) \
> @@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
>  	.mute_stream = drm_bridge_connector_audio_mute_stream,
>  };
>  
> +static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
> +						struct drm_bridge *bridge)
> +{
> +	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> +	    !bridge->hdmi_audio_spdif_playback)
> +		return 0;
> +
> +	if (!bridge->funcs->hdmi_audio_prepare ||
> +	    !bridge->funcs->hdmi_audio_shutdown)
> +		return -EINVAL;
> +
> +	return drm_connector_hdmi_audio_init(connector,
> +					     bridge->hdmi_audio_dev,
> +					     &drm_bridge_connector_hdmi_audio_funcs,
> +					     bridge->hdmi_audio_max_i2s_playback_channels,
> +					     bridge->hdmi_audio_spdif_playback,
> +					     bridge->hdmi_audio_dai_port);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Bridge Connector Initialisation
>   */
> @@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
>  			if (bridge_connector->bridge_hdmi)
>  				return ERR_PTR(-EBUSY);
> +			if (bridge_connector->bridge_dp)
> +				return ERR_PTR(-EINVAL);
>  			if (!bridge->funcs->hdmi_write_infoframe ||
>  			    !bridge->funcs->hdmi_clear_infoframe)
>  				return ERR_PTR(-EINVAL);
> @@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  				max_bpc = bridge->max_bpc;
>  		}
>  
> +		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
> +			if (bridge_connector->bridge_dp)
> +				return ERR_PTR(-EBUSY);
> +			if (bridge_connector->bridge_hdmi)
> +				return ERR_PTR(-EINVAL);
> +
> +			bridge_connector->bridge_dp = bridge;
> +
> +		}
> +
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type = bridge->type;
>  
> @@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		if (ret)
>  			return ERR_PTR(ret);
>  
> -		if (bridge->hdmi_audio_max_i2s_playback_channels ||
> -		    bridge->hdmi_audio_spdif_playback) {
> -			if (!bridge->funcs->hdmi_audio_prepare ||
> -			    !bridge->funcs->hdmi_audio_shutdown)
> -				return ERR_PTR(-EINVAL);
> +		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else if (bridge_connector->bridge_dp) {
> +		bridge = bridge_connector->bridge_dp;
>  
> -			ret = drm_connector_hdmi_audio_init(connector,
> -							    bridge->hdmi_audio_dev,
> -							    &drm_bridge_connector_hdmi_audio_funcs,
> -							    bridge->hdmi_audio_max_i2s_playback_channels,
> -							    bridge->hdmi_audio_spdif_playback,
> -							    bridge->hdmi_audio_dai_port);
> -			if (ret)
> -				return ERR_PTR(ret);
> -		}
> +		ret = drmm_connector_init(drm, connector,
> +					  &drm_bridge_connector_funcs,
> +					  connector_type, ddc);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
> +		if (ret)
> +			return ERR_PTR(ret);
>  	} else {
>  		ret = drmm_connector_init(drm, connector,
>  					  &drm_bridge_connector_funcs,
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -811,9 +811,21 @@ enum drm_bridge_ops {
>  	 *
>  	 * Note: currently there can be at most one bridge in a chain that sets
>  	 * this bit. This is to simplify corresponding glue code in connector
> -	 * drivers.
> +	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
> +	 * chain is also not allowed.
>  	 */
>  	DRM_BRIDGE_OP_HDMI = BIT(4),
> +	/**
> +	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
> +	 * operations. Currently this is limited to the optional HDMI codec
> +	 * support.
> +	 *
> +	 * Note: currently there can be at most one bridge in a chain that sets
> +	 * this bit. This is to simplify corresponding glue code in connector
> +	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
> +	 * chain is also not allowed.
> +	 */
> +	DRM_BRIDGE_OP_DisplayPort = BIT(5),

The OP bits are not supposed to describe tbe type of bridge, but the
operations it implements. I see quite a bit of duplication between HDMI
and DisplayPort in this patch. Can we have a single bit named after the
feature that you want to support ? The bridge_hdmi and bridge_dp fields
should also be merged into a single one.

>  };
>  
>  /**
> 

-- 
Regards,

Laurent Pinchart
