Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D135E8C387C
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36C710E00E;
	Sun, 12 May 2024 21:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TRAw1oL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF4810E00E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:09:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58CE38BE;
 Sun, 12 May 2024 23:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548150;
 bh=fCWAahIT/hAJe3k/y0iiyAVf9CH7viLpCUTVy233AxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TRAw1oL2FDVmkRCJkBG0UC1UZ0E7Ofluwevib+Yj9OVIqA8WrBz6hXvauu8LJMfhd
 5nQ3hZGgq+/hBLIBJ278QThc1H+LYWnJcBs9ALdcDM5MemCAb9wei1mM2Z8TigIatO
 lpT1WBSToTWeCc4nXJvbZeuhkmKG1K3ocNakGYk0=
Date: Mon, 13 May 2024 00:09:07 +0300
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
Subject: Re: [PATCH] drm/bridge: Remove a small useless code snippet
Message-ID: <20240512210907.GI17158@pendragon.ideasonboard.com>
References: <20240511124238.297192-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511124238.297192-1-sui.jingfeng@linux.dev>
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

On Sat, May 11, 2024 at 08:42:38PM +0800, Sui Jingfeng wrote:
> Because the check on the non-existence (encoder == NULL) has already been
> done in the implementation of drm_bridge_attach() function, and
> drm_bridge_attach() is called earlier. The driver won't get to check point
> even if drm_bridge_attach() fails for some reasons, as it will clear the
> bridge->encoder to NULL and return a negective error code.

s/negective/negative/

> 
> Therefore, there is no need to check another again. Remove the redundant
> codes at the later.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If you end up sending a second version of this patch, please include all
similar patches you have sent at the same time in a patch series,
instead of sending them separately.

> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 28376d0ecd09..3caa918ac2e0 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -116,11 +116,6 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>  		return 0;
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	drm_connector_helper_add(&sbridge->connector,
>  				 &simple_bridge_con_helper_funcs);
>  	ret = drm_connector_init_with_ddc(bridge->dev, &sbridge->connector,

-- 
Regards,

Laurent Pinchart
