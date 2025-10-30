Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5FC20BED
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035A710E289;
	Thu, 30 Oct 2025 14:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ruv6qCMI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2984310E289
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:53:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0FA511A1788;
 Thu, 30 Oct 2025 14:53:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D90506068C;
 Thu, 30 Oct 2025 14:53:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB9FA118080E2; Thu, 30 Oct 2025 15:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761836023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=SLIcsYRY8Q+15Jjta6F4CJmD02FxJpVh79SIuLmyk8I=;
 b=ruv6qCMI8yoarwCEL1jH7aR9gsVFz5lUVRjAuhx/jUsimgmTaakkqvMe0XsHeFjipgmrdO
 f4waRlpemzTfLq4uL+i27gzu/tQGP2tMdJ2oFHqjb7v7yS4qGTc93gkY94dm2/vRI4Gl7e
 b9JeEd+6+fMfPLVC3GMbnE3lFVrKjLZtoSAXYFNm5BRUBZS5u2z46B9IOoqGyKPXpwROqG
 XPzQGOliQtGORjCsPb4UX1wmOdHeYMopLxr19JilQluFS45xcJ5YBNXtRov5pHPwWmT/2i
 M3BWKnAaGhBcBo6pRWKATJXHClTzL4CW3RSWz3+NdFa6Hfny78kBlKBNjtSaRA==
Message-ID: <6dbe7287-43ef-4c9e-96fb-78dedc12bbf8@bootlin.com>
Date: Thu, 30 Oct 2025 15:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/display: bridge_connector: get/put the stored
 bridges
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
 <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-2-667abf6d47c0@bootlin.com>
Content-Language: en-US, fr
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-2-667abf6d47c0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 17/10/2025 à 18:15, Luca Ceresoli a écrit :
> drm_bridge_connector_init() takes eight pointers to various bridges, some
> of which can be identical, and stores them in pointers inside struct
> drm_bridge_connector. Get a reference to each of the taken bridges and put
> it on cleanup.
> 
> Achieve this by adding a drmm cleanup callback whic puts all the non-NULL
> bridges. Using drmm ensures the cleanup happens on drm_device teardown,
> whichever is the return value of this function.
> 
> Four of these pointers (edid, hpd, detect and modes) can be written
> multiple times (up to once per loop iterations), in order to eventually
> store the last matching bridge. So when one of those pointers is
> overwritten, we need to put the reference that we got during the previous
> assignment. Add a drm_bridge_put() before writing them to handle this.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
> 
> This patch was added in v2:
> - it is a rewrite of the original (buggy) patch, but simpler after
>    realizing thanks to drmm we don't need the temporary pointers as the
>    stored pointers will be put just before deallocating
> - compared to the original patch, moved the panel_bridge changes to a
>    separate patch for clarity
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 52 +++++++++++++++++++-------
>   1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index a5bdd6c1064399ece6b19560f145b877c9e0680e..95ccf86527129edaa6fcc75c6202985e73c46da8 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -618,6 +618,20 @@ static const struct drm_connector_hdmi_cec_funcs drm_bridge_connector_hdmi_cec_f
>    * Bridge Connector Initialisation
>    */
>   
> +static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
> +{
> +	struct drm_bridge_connector *bridge_connector = (struct drm_bridge_connector *)data;
> +
> +	drm_bridge_put(bridge_connector->bridge_edid);
> +	drm_bridge_put(bridge_connector->bridge_hpd);
> +	drm_bridge_put(bridge_connector->bridge_detect);
> +	drm_bridge_put(bridge_connector->bridge_modes);
> +	drm_bridge_put(bridge_connector->bridge_hdmi);
> +	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
> +	drm_bridge_put(bridge_connector->bridge_dp_audio);
> +	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
> +}
> +
>   /**
>    * drm_bridge_connector_init - Initialise a connector for a chain of bridges
>    * @drm: the DRM device
> @@ -649,6 +663,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	if (!bridge_connector)
>   		return ERR_PTR(-ENOMEM);
>   
> +	ret = drmm_add_action(drm, drm_bridge_connector_put_bridges, bridge_connector);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>   	bridge_connector->encoder = encoder;
>   
>   	/*
> @@ -672,14 +690,22 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		if (!bridge->ycbcr_420_allowed)
>   			connector->ycbcr_420_allowed = false;
>   
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			bridge_connector->bridge_edid = bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_HPD)
> -			bridge_connector->bridge_hpd = bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
> -			bridge_connector->bridge_detect = bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			bridge_connector->bridge_modes = bridge;
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID) {
> +			drm_bridge_put(bridge_connector->bridge_edid);
> +			bridge_connector->bridge_edid = drm_bridge_get(bridge);
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_HPD) {
> +			drm_bridge_put(bridge_connector->bridge_hpd);
> +			bridge_connector->bridge_hpd = drm_bridge_get(bridge);
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_DETECT) {
> +			drm_bridge_put(bridge_connector->bridge_detect);
> +			bridge_connector->bridge_detect = drm_bridge_get(bridge);
> +		}
> +		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
> +			drm_bridge_put(bridge_connector->bridge_modes);
> +			bridge_connector->bridge_modes = drm_bridge_get(bridge);
> +		}
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
>   			if (bridge_connector->bridge_hdmi)
>   				return ERR_PTR(-EBUSY);
> @@ -687,7 +713,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->hdmi_clear_infoframe)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_connector->bridge_hdmi = bridge;
> +			bridge_connector->bridge_hdmi = drm_bridge_get(bridge);
>   
>   			if (bridge->supported_formats)
>   				supported_formats = bridge->supported_formats;
> @@ -710,7 +736,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->hdmi_audio_shutdown)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_connector->bridge_hdmi_audio = bridge;
> +			bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge);
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
> @@ -728,21 +754,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   			    !bridge->funcs->dp_audio_shutdown)
>   				return ERR_PTR(-EINVAL);
>   
> -			bridge_connector->bridge_dp_audio = bridge;
> +			bridge_connector->bridge_dp_audio = drm_bridge_get(bridge);
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
>   			if (bridge_connector->bridge_hdmi_cec)
>   				return ERR_PTR(-EBUSY);
>   
> -			bridge_connector->bridge_hdmi_cec = bridge;
> +			bridge_connector->bridge_hdmi_cec = drm_bridge_get(bridge);
>   		}
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
>   			if (bridge_connector->bridge_hdmi_cec)
>   				return ERR_PTR(-EBUSY);
>   
> -			bridge_connector->bridge_hdmi_cec = bridge;
> +			bridge_connector->bridge_hdmi_cec = drm_bridge_get(bridge);
>   
>   			if (!bridge->funcs->hdmi_cec_enable ||
>   			    !bridge->funcs->hdmi_cec_log_addr ||
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

