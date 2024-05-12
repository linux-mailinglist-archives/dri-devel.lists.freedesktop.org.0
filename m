Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F208C3886
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1179E10E0CD;
	Sun, 12 May 2024 21:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l4prDfu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E527110E0CD
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:16:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F18B58BE;
 Sun, 12 May 2024 23:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548560;
 bh=/VA+56EQcAeeuiXoZF5k8oky+wUSFnx62y8AokILwhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l4prDfu5OchUlvmt+W/JmcSJhHpsGYBQrIPBxajPK649DhnzPCX2qalpn2B/HGm3k
 /1JlntQ04X/D5+xQQM8NupTKo3zUynlAeRRMosNEG8vAbtouwhHziGVIG+iwMPSUfT
 dyYfI5UXwcJkrsrkFyx5ohMZeZFleJfcZgtYZFHg=
Date: Mon, 13 May 2024 00:15:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Alicja Michalska <ahplka19@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: analogix: Remove redundant checks on
 existence of bridge->encoder
Message-ID: <20240512211558.GN17158@pendragon.ideasonboard.com>
References: <20240511152222.328167-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511152222.328167-1-sui.jingfeng@linux.dev>
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

Hi Sui,

Thank you for the patch.

On Sat, May 11, 2024 at 11:22:22PM +0800, Sui Jingfeng wrote:
> The check on the existence of bridge->encoder on the implementation layer
> of drm bridge driver is not necessary, as it has already been done in the
> drm_bridge_attach() function. It is guaranteed that the .encoder member
> of the drm_bridge instance is not NULL when various anxxxx_bridge_attach()
> function gets called. And .atomic_enable() of struct drm_bridge_funcs
> shouldn't be able to called before the various is acctached.
> 
> Remove the redundant checking codes "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  5 -----
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c |  5 -----
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  5 -----
>  drivers/gpu/drm/bridge/analogix/anx7625.c          | 10 ----------
>  4 files changed, 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index c9e35731e6a1..cfe43d2ca3be 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -528,11 +528,6 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	/* Register aux channel */
>  	anx6345->aux.name = "DP-AUX";
>  	anx6345->aux.dev = &anx6345->client->dev;
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 5748a8581af4..58875dde496f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -897,11 +897,6 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	/* Register aux channel */
>  	anx78xx->aux.name = "DP-AUX";
>  	anx78xx->aux.dev = &anx78xx->client->dev;
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index df9370e0ff23..7b841232321f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1228,11 +1228,6 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	if (!dp->plat_data->skip_connector) {
>  		connector = &dp->connector;
>  		connector->polled = DRM_CONNECTOR_POLL_HPD;
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 59e9ad349969..3d09efa4199c 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2193,11 +2193,6 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
>  	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
>  		return -EINVAL;
>  
> -	if (!bridge->encoder) {
> -		DRM_DEV_ERROR(dev, "Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	ctx->aux.drm_dev = bridge->dev;
>  	err = drm_dp_aux_register(&ctx->aux);
>  	if (err) {
> @@ -2435,11 +2430,6 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  	dev_dbg(dev, "drm atomic enable\n");
>  
> -	if (!bridge->encoder) {
> -		dev_err(dev, "Parent encoder object not found");
> -		return;
> -	}
> -
>  	connector = drm_atomic_get_new_connector_for_encoder(state->base.state,
>  							     bridge->encoder);
>  	if (!connector)

-- 
Regards,

Laurent Pinchart
