Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFFE8C3884
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E015310E0B0;
	Sun, 12 May 2024 21:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gKMkrveb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD14A10E0B0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:15:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4B00A98;
 Sun, 12 May 2024 23:15:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548508;
 bh=Rkze3iANAO8ka/TqH6bLFED6WH90fpw+Xj1Fk1AxUKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKMkrvebfwOotaJNVHsGOpFLDbvnJALxqRtA0XsmJx84n+aUG7NAs4As0rccyepL0
 ZNswEqH95lgUyUMn2EpaN29pQ+G9U3WqYA0c4gUAqBv1t2vkI3ej001e3y0fD4++0v
 ocpuaDA87oX/zBbooTsDYliElX7NW54ddNtsaadc=
Date: Mon, 13 May 2024 00:15:06 +0300
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
Subject: Re: [PATCH] drm/bridge: it6505: Remove a redundant check on
 existence of bridge->encoder
Message-ID: <20240512211506.GM17158@pendragon.ideasonboard.com>
References: <20240511141056.318679-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511141056.318679-1-sui.jingfeng@linux.dev>
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

On Sat, May 11, 2024 at 10:10:56PM +0800, Sui Jingfeng wrote:
> In it6505_bridge_attach(), the check on the existence of bridge->encoder
> has already been done in the implementation of drm_bridge_attach(). And
> it is done before the bridge->funcs->attach function hook is called. Hence,
> it is guaranteed that the .encoder member of the struct drm_bridge is not
> NULL when the panel_bridge_attach() is called.
> 
> There is no need to check the existence of bridge->encoder another time,
> remove the redundant checking codes "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 27334173e911..494030a75dba 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2881,11 +2881,6 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!bridge->encoder) {
> -		dev_err(dev, "Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	/* Register aux channel */
>  	it6505->aux.drm_dev = bridge->dev;
>  

-- 
Regards,

Laurent Pinchart
