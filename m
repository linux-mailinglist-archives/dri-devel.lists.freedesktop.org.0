Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810CE8C3880
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34EA10E0A0;
	Sun, 12 May 2024 21:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Oagbd5b0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509DA10E0A0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:13:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EFF78BE;
 Sun, 12 May 2024 23:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548403;
 bh=wDUVbv8ZpYrdpvWTtjkKG9IWXTdRp0GildcxKyLIlAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oagbd5b00gl5Njyd3u5ypxKJ/hgK+l/Ok/rKSJEuXzER0o/7sm5Z8y4lMlzstK3Uf
 G6ghJcW/HtQYzoWAVPHr6bhHR0dPX+MthO1XjT6nux3Cy+PTFjw5sNiDgTkeH59vA5
 oYefUCdaZicEYg9LGU/YAGWhQ4bFLPuxCmqYapzE=
Date: Mon, 13 May 2024 00:13:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: nxp-ptn3460: Remove a small useless code
 snippet
Message-ID: <20240512211321.GK17158@pendragon.ideasonboard.com>
References: <20240511134251.313513-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511134251.313513-1-sui.jingfeng@linux.dev>
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

On Sat, May 11, 2024 at 09:42:50PM +0800, Sui Jingfeng wrote:
> In ptn3460_bridge_attach(), the check on the existence of bridge->encoder
> has already been done in the implementation of drm_bridge_attach(). The
> driver won't go further if bridge->encoder is NULL and the driver will quit
> even if drm_bridge_attach() fails for some reasons. Thereforei, there is

s/Thereforei/Therefore/

> no need to check another time at the later, remove the redundant checking
> codes "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index ed93fd4c3265..e77aab965fcf 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -229,11 +229,6 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>  		return 0;
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	ptn_bridge->connector.polled = DRM_CONNECTOR_POLL_HPD;
>  	ret = drm_connector_init(bridge->dev, &ptn_bridge->connector,
>  			&ptn3460_connector_funcs, DRM_MODE_CONNECTOR_LVDS);

-- 
Regards,

Laurent Pinchart
