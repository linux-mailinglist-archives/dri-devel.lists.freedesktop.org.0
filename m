Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6B8C388D
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 23:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAACA10E12E;
	Sun, 12 May 2024 21:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l1krWNOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF88310E12E
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 21:19:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C355C8BE;
 Sun, 12 May 2024 23:19:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715548746;
 bh=W5wIChAYZ5UvL2GEo9zFX6SQxx9WytPsTIt3oj8gUuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1krWNOQ04OrDPabstuawxD40jtbNzuAX7l9xF3TivsxgQSAm3byLtkF5aYL+8B9n
 vWtl/gB8j6D4xcpFJ7QXNJ8gjgsyK63rP29wGSHp86uEyEUX8kQwmjlaJ5XSGVWQ8u
 NxtQSKdT3XpADAw4dqeRyd8H55O5uKRRgtqT7N8g=
Date: Mon, 13 May 2024 00:19:03 +0300
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
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Remove a redundant check on
 existence of bridge->encoder
Message-ID: <20240512211903.GQ17158@pendragon.ideasonboard.com>
References: <20240511145549.325852-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511145549.325852-1-sui.jingfeng@linux.dev>
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

On Sat, May 11, 2024 at 10:55:49PM +0800, Sui Jingfeng wrote:
> In the lt9611uxc_connector_init() function, the check on the existence
> of bridge->encoder is not necessary, as it has already been done in the
> drm_bridge_attach() function. And the check on the drm bridge core
> happens before check in the implementation. Hence, it is guaranteed that
> the .encoder member of the struct drm_bridge is not NULL when
> lt9611uxc_connector_init() function gets called.
> 
> Remove the redundant checking codes "if (!bridge->encoder) { ... }".
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index f4f593ad8f79..f1fccfe6c534 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -339,11 +339,6 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
>  {
>  	int ret;
>  
> -	if (!bridge->encoder) {
> -		DRM_ERROR("Parent encoder object not found");
> -		return -ENODEV;
> -	}
> -
>  	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
>  
>  	drm_connector_helper_add(&lt9611uxc->connector,

-- 
Regards,

Laurent Pinchart
