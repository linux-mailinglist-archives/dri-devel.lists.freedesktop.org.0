Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A108C3882
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F3110E0AD;
	Sun, 12 May 2024 21:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OVf1pBUr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDB610E0AD
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:14:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C6D38BE;
 Sun, 12 May 2024 23:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548467;
 bh=FG6iKX2wYIDzAZO1I+hGEmxBg8st+4S4h3rD+0EIdPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OVf1pBUrQ3+ReIvEpXYckwu1PKGSeSbmzPcp8TgSMlMRqZyrqyT4t7PDTX8bx8+Bj
 O5wneKOyBWUey0VJV5wTZMi1HEdsToGMSwbq1rng8Q4NmT8F/R3SrMqmea+Q75w2ww
 gw6+tHULeVflFJl8VHtc8VB4gfsSxiJmlRzdLg5g=
Date: Mon, 13 May 2024 00:14:25 +0300
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
Subject: Re: [PATCH] drm/bridge: panel: Remove a redundant check on existence
 of bridge->encoder
Message-ID: <20240512211425.GL17158@pendragon.ideasonboard.com>
References: <20240511140316.318080-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511140316.318080-1-sui.jingfeng@linux.dev>
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

On Sat, May 11, 2024 at 10:03:16PM +0800, Sui Jingfeng wrote:
> In panel_bridge_attach(), the check on the existence of bridge->encoder
> has already been done in the implementation of drm_bridge_attach(). And
> it is done before the bridge->funcs->attach hook is called. Hence, it is
> guaranteed that the .encoder member of the struct drm_bridge is not NULL
> when the panel_bridge_attach() is called.
> 
> There is no need to check the existence of bridge->encoder another time
> at the implementation layer, therefore remove the redundant checking codes
> "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/panel.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 7f41525f7a6e..762402dca6dd 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -65,11 +65,6 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>  		return 0;
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Missing encoder\n");
> -		return -ENODEV;
> -	}
> -
>  	drm_connector_helper_add(connector,
>  				 &panel_bridge_connector_helper_funcs);
>  

-- 
Regards,

Laurent Pinchart
