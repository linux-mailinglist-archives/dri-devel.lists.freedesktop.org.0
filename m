Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830458C3893
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7295B10E1AE;
	Sun, 12 May 2024 21:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YxcMJYwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1BD10E1AE
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:22:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB2BB8BE;
 Sun, 12 May 2024 23:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548942;
 bh=IpE/1z4h7esQnfB3BIM9qsCQl4xVSuaOIPmnyTRgaBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxcMJYwZCxTQu53OrYfLQOFrMUZazvyfuG++c0347NxPAvHlz6JXv4gaeKHyFGh0Z
 t1LZGBRV58ZdFi4eHbd163FJPs/SZz9lz8P1XCMVp8bFSjxx6bvtl4FQ8AYydovExq
 pCKoKqeaq0FmSJDKMIqNl7Ry8EIQjv2ccgvwKxDI=
Date: Mon, 13 May 2024 00:22:15 +0300
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
Subject: Re: [PATCH] drm/bridge: cdns-mhdp8546: Remove a redundant check on
 existence of bridge->encoder
Message-ID: <20240512212215.GT17158@pendragon.ideasonboard.com>
References: <20240511143027.320180-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511143027.320180-1-sui.jingfeng@linux.dev>
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

On Sat, May 11, 2024 at 10:30:27PM +0800, Sui Jingfeng wrote:
> In the cdns_mhdp_connector_init() function, the check on the existence
> of bridge->encoder is not necessary, as it has already been done in the
> drm_bridge_attach() function. And the check on the drm bridge core
> happens before check in the implementation. Hence, it is guaranteed that
> the .encoder member of the struct drm_bridge is not NULL when
> adv7511_bridge_attach() function gets called.
> 
> Remove the redundant checking codes "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index e226acc5c15e..16b58a7dcc54 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1697,11 +1697,6 @@ static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
>  	struct drm_bridge *bridge = &mhdp->bridge;
>  	int ret;
>  
> -	if (!bridge->encoder) {
> -		dev_err(mhdp->dev, "Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	conn->polled = DRM_CONNECTOR_POLL_HPD;
>  
>  	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,

-- 
Regards,

Laurent Pinchart
