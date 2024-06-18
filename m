Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C490C55E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F8510E603;
	Tue, 18 Jun 2024 09:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gfk+Du9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE7510E608
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:34:37 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso65257541fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718703276; x=1719308076; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3OtPQx/Pu4izNrX/Re5hWMRulfkvuWWXAK3KKNMzu7g=;
 b=Gfk+Du9BnMNaFjCE1mYAwR4HAjFUZEjSFc7EUF1z8RDP2RiyZpFocQCwaSkFwYjC8Y
 LqoaMnq75PLW1iZHd/tDjPKJpUT6oX2zXNfxnBicMolJjdhfjTPgmbEC2W9Z3A6nyt8t
 Ss3r5Y58k/W5xdAAkACMMBAxmsNdlaijuf/JaK9UfapSUSq/oWQlXqgdrGevQubpZmFg
 f7nv0XLDIkVSENHZnM20ILDP52AGQx31Di5h4AjlyqJLDp/hMJj454xXQrHzBFow13ga
 AXrPAZBJ+eCss6UqQcth8Z2OqR26atE7vmoCl5dXFrmJOlTHHYbetxIzKgTH/nziO47D
 0Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718703276; x=1719308076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OtPQx/Pu4izNrX/Re5hWMRulfkvuWWXAK3KKNMzu7g=;
 b=OXd81O6n13Ek2Mk+reHkGqavPHyWJ2tSMr/iDL92Kfdo/ARhckGBJWUByk+IJ8PDap
 Tr5H9pu++ZpllJT06nDEn3w8D0fK5ljENP8xRz4fECNi0ZHhIjgzSUS3cVBvI6YrG1Op
 jS4bRptGch4vBRk9LIoQTFBHQN4Sjq/7kPEXs/RT0u/saT8suWQsdJjJlJeYnoUpmUBG
 OFrc6Z1VA4haqYNa1iddKMbxPZBL+HM4XLqFEcCTXCskjnDwCIFVXxk6fpjX5ZRjXKIw
 pccE5IpZhwmnGkutA92xg+WDU/5MQ7M0B/3erwvLv0JLxXAmYwa4dPvflETUjKxxb+Kt
 gWaQ==
X-Gm-Message-State: AOJu0Yz76V1F07WJyJ0lYCCiC3xAinAv7aXc+rHXy20vYUa0S94cWNpd
 0Zv5ISSBd+S07rOzJ8RAx22E1qlQCdGi8NfWOyB1eahJz1LdceP9yLfZGyeAN4U=
X-Google-Smtp-Source: AGHT+IGV3fdRHGz8W6Ml8JMRCptiBjlFKzjIcCxhI6Uj5qvvYAKo3j/iWUDBncEItZIdRBsrs9DQOg==
X-Received: by 2002:a2e:8609:0:b0:2eb:fb9c:5a85 with SMTP id
 38308e7fff4ca-2ec0e47b5c6mr68554821fa.23.1718703275629; 
 Tue, 18 Jun 2024 02:34:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c78422sm16495521fa.95.2024.06.18.02.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:34:35 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
Message-ID: <fal5jtesucasboygxde2uiamq6fhycwuhor6g4uqi54jx3sis7@gw5im7xxss6n>
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-5-d59fc7865ab2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615-drm-bridge-hdmi-connector-v1-5-d59fc7865ab2@linaro.org>
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

On Sat, Jun 15, 2024 at 08:53:34PM GMT, Dmitry Baryshkov wrote:
> Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
> framework. This enables programming of Audio InfoFrames using the HDMI
> Connector interface and also enables support for the missing features,
> including the ELD retrieval and better hotplug support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 207 ++++++++++++++++----------------
>  1 file changed, 104 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 4fa0dfc5539a..02953468cb76 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -45,7 +45,6 @@ struct lt9611 {
>  	struct device_node *dsi1_node;
>  	struct mipi_dsi_device *dsi0;
>  	struct mipi_dsi_device *dsi1;
> -	struct platform_device *audio_pdev;
>  
>  	bool ac_mode;
>  
> @@ -688,15 +687,22 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	/* Enable HDMI output */
>  	regmap_write(lt9611->regmap, 0x8130, 0xea);
> +
> +	drm_connector_hdmi_codec_plugged_notify(connector, true);
>  }
>  
>  static void
>  lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
>  			     struct drm_bridge_state *old_bridge_state)
>  {
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	struct drm_connector *connector;
>  	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
>  	int ret;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);

Of course this should have been
drm_atomic_get_old_connector_for_encoder(), otherwise it crashes because
connector is NULL.

> +	drm_connector_hdmi_codec_plugged_notify(connector, false);
> +
>  	/* Disable HDMI output */
>  	ret = regmap_write(lt9611->regmap, 0x8130, 0x6a);
>  	if (ret) {

-- 
With best wishes
Dmitry
