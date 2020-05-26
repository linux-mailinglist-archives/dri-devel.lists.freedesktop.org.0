Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212231E1F1A
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 11:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213476E132;
	Tue, 26 May 2020 09:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEF36E132
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 09:49:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h4so2502873wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JTwfEhrVhRiybZj1p67Ecv+rlgQyeszPhQ8sN/8XRfU=;
 b=mi4tdGs1iQdgxFNqg5VP+qvjiC2yGAhL6aksnvz1dxyBTy1wm2JPIe2QYrdDeBJKAO
 tEc0yP+rHcW0Fpn3OiasyOlkfaVzKfL96w439gTLUVjfA9AsoTVbk7c3g0+/kT4vuOAH
 Eiyo3JQO+bvmLFBW4OI+bdY3s9/aVg+ChlmD7U7fuDiNXlWAGn9HWnGuvqiPNzfOLjew
 Jy/BUyLs7DXgAR8DA6zAzemi79nNX/ZfZvDqPIveufyhVovx3jC7WPmMLkWYZkGuvd5g
 BlgHzBkHOrQl2j7dh9XXTdJUshZoSM7Ve6cBOm/QLkaaNZ0cPWel7MGnA/sp8jYxriKL
 cKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JTwfEhrVhRiybZj1p67Ecv+rlgQyeszPhQ8sN/8XRfU=;
 b=kF32mdl11q+tSNIhihzNInziD1YNoouTKJYNOb2k+STeq8ggpSoD9GcdCk4aJsARGY
 iKjYb8c5gvEL1JbfOZKs37Yaq8+vDuqEDy1BngiAam93RDHqAa6FTOH2152s9VLp6QwJ
 plptrgqNByVHAJPG4gpTFW8J/+zCbL7ZOdMt5vxWFjHfc0TjKBZUZir4BkLjnnzKOSHC
 5hYfxdE6EoOPl0bZ4Uo7h6c9nJo1ivXh7kQogRjFN+coXLk8sHptOr0V6jO0ud24OjJ9
 VxyCt3Fk35HTfHXb4HY2fdDaxKbY8qqB2+XnP7Jw6XJWGjXSqjfq3ckVyliA2o4ZyaCd
 hj3g==
X-Gm-Message-State: AOAM533SPomz7t+E716WCvQ90uQ8IN9J0doQFpL90dr6SEKrQmPmMpUN
 3/ZBTs497f/IkH7gyn6z1JwkHDxEIThHRQ==
X-Google-Smtp-Source: ABdhPJwWQ408uvzWVSPoGUHEdtAKfQAA8KgbeqVUy4ZeYfrncfHMtST0ElyAppe3KgJg3pY+NLfBjw==
X-Received: by 2002:a1c:9802:: with SMTP id a2mr625039wme.74.1590486593050;
 Tue, 26 May 2020 02:49:53 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b?
 ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id j2sm14571369wre.52.2020.05.26.02.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 02:49:52 -0700 (PDT)
Subject: Re: [PATCH 19/27] drm: bridge: dw-hdmi: Split connector creation to a
 separate function
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-20-laurent.pinchart+renesas@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <790e38a7-16f3-eb00-d20a-1a1df7727844@baylibre.com>
Date: Tue, 26 May 2020 11:49:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526011505.31884-20-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2020 03:14, Laurent Pinchart wrote:
> Isolate all the code related to connector creation to a new
> dw_hdmi_connector_create() function, to prepare for making connector
> creation optional.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 107 +++++++++++++---------
>  1 file changed, 62 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index a18794cce0d8..35d38b644912 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2317,6 +2317,10 @@ static void dw_hdmi_update_phy_mask(struct dw_hdmi *hdmi)
>  					  hdmi->rxsense);
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * DRM Connector Operations
> + */
> +
>  static enum drm_connector_status
>  dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
> @@ -2438,6 +2442,59 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
>  	.atomic_check = dw_hdmi_connector_atomic_check,
>  };
>  
> +static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
> +{
> +	struct drm_connector *connector = &hdmi->connector;
> +	struct cec_connector_info conn_info;
> +	struct cec_notifier *notifier;
> +
> +	if (hdmi->version >= 0x200a)
> +		connector->ycbcr_420_allowed =
> +			hdmi->plat_data->ycbcr_420_allowed;
> +	else
> +		connector->ycbcr_420_allowed = false;
> +
> +	connector->interlace_allowed = 1;
> +	connector->polled = DRM_CONNECTOR_POLL_HPD;
> +
> +	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
> +
> +	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
> +				    &dw_hdmi_connector_funcs,
> +				    DRM_MODE_CONNECTOR_HDMIA,
> +				    hdmi->ddc);
> +
> +	/*
> +	 * drm_connector_attach_max_bpc_property() requires the
> +	 * connector to have a state.
> +	 */
> +	drm_atomic_helper_connector_reset(connector);
> +
> +	drm_connector_attach_max_bpc_property(connector, 8, 16);
> +
> +	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
> +		drm_object_attach_property(&connector->base,
> +			connector->dev->mode_config.hdr_output_metadata_property, 0);
> +
> +	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
> +
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> +	if (!notifier)
> +		return -ENOMEM;
> +
> +	mutex_lock(&hdmi->cec_notifier_mutex);
> +	hdmi->cec_notifier = notifier;
> +	mutex_unlock(&hdmi->cec_notifier_mutex);
> +
> +	return 0;
> +}
> +
> +/* -----------------------------------------------------------------------------
> + * DRM Bridge Operations
> + */
> +
>  /*
>   * Possible output formats :
>   * - MEDIA_BUS_FMT_UYYVYY16_0_5X48,
> @@ -2713,51 +2770,13 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
>  	struct dw_hdmi *hdmi = bridge->driver_private;
> -	struct drm_encoder *encoder = bridge->encoder;
> -	struct drm_connector *connector = &hdmi->connector;
> -	struct cec_connector_info conn_info;
> -	struct cec_notifier *notifier;
>  
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		DRM_ERROR("Fix bridge driver to make connector optional!");
>  		return -EINVAL;
>  	}
>  
> -	connector->interlace_allowed = 1;
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
> -
> -	drm_connector_init_with_ddc(bridge->dev, connector,
> -				    &dw_hdmi_connector_funcs,
> -				    DRM_MODE_CONNECTOR_HDMIA,
> -				    hdmi->ddc);
> -
> -	/*
> -	 * drm_connector_attach_max_bpc_property() requires the
> -	 * connector to have a state.
> -	 */
> -	drm_atomic_helper_connector_reset(connector);
> -
> -	drm_connector_attach_max_bpc_property(connector, 8, 16);
> -
> -	if (hdmi->version >= 0x200a && hdmi->plat_data->use_drm_infoframe)
> -		drm_object_attach_property(&connector->base,
> -			connector->dev->mode_config.hdr_output_metadata_property, 0);
> -
> -	drm_connector_attach_encoder(connector, encoder);
> -
> -	cec_fill_conn_info_from_drm(&conn_info, connector);
> -
> -	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
> -	if (!notifier)
> -		return -ENOMEM;
> -
> -	mutex_lock(&hdmi->cec_notifier_mutex);
> -	hdmi->cec_notifier = notifier;
> -	mutex_unlock(&hdmi->cec_notifier_mutex);
> -
> -	return 0;
> +	return dw_hdmi_connector_create(hdmi);
>  }
>  
>  static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
> @@ -2841,6 +2860,10 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>  	.mode_valid = dw_hdmi_bridge_mode_valid,
>  };
>  
> +/* -----------------------------------------------------------------------------
> + * IRQ Handling
> + */
> +
>  static irqreturn_t dw_hdmi_i2c_irq(struct dw_hdmi *hdmi)
>  {
>  	struct dw_hdmi_i2c *i2c = hdmi->i2c;
> @@ -3303,12 +3326,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
>  
> -	if (hdmi->version >= 0x200a)
> -		hdmi->connector.ycbcr_420_allowed =
> -			hdmi->plat_data->ycbcr_420_allowed;
> -	else
> -		hdmi->connector.ycbcr_420_allowed = false;
> -
>  	memset(&pdevinfo, 0, sizeof(pdevinfo));
>  	pdevinfo.parent = dev;
>  	pdevinfo.id = PLATFORM_DEVID_AUTO;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
