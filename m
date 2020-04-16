Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CE1AD21D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 23:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB646EB76;
	Thu, 16 Apr 2020 21:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DA26EB76
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 21:46:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0497D97D;
 Thu, 16 Apr 2020 23:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587073608;
 bh=YnVX9kx1ktI0ybMo9FTw1KK97VU/pddRDv0WisuHbvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=drqtgiwQlWQFoWRUuZt+zKKzjGNHOElDVl0ns/IZA/URl7QWIVTHFYpAiJAZGST0s
 WF4KrDJ6OfG32ypZvZg5fVBRRIKZJ46v8McykKgVoo8cqDGl/IHfKpsmZhEnsMfq9j
 j1yz+EbAYKDSQ0koqWrHOOCiKnLTzCSNNg+ARRqI=
Date: Fri, 17 Apr 2020 00:46:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] drm/bridge: panel: Return always an error pointer in
 drm_panel_bridge_add()
Message-ID: <20200416214635.GD28162@pendragon.ideasonboard.com>
References: <20200416210654.2468805-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416210654.2468805-1-enric.balletbo@collabora.com>
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
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Collabora Kernel ML <kernel@collabora.com>, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Thu, Apr 16, 2020 at 11:06:54PM +0200, Enric Balletbo i Serra wrote:
> Since commit 89958b7cd955 ("drm/bridge: panel: Infer connector type from
> panel by default"), drm_panel_bridge_add() and their variants can return
> NULL and an error pointer. This is fine but none of the actual users of
> the API are checking for the NULL value. Instead of change all the
> users, seems reasonable to return an error pointer instead. So change
> the returned value for those functions when the connector type is unknown.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  drivers/gpu/drm/bridge/panel.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 8461ee8304ba..7a3df0f319f3 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -166,7 +166,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>   *
>   * The connector type is set to @panel->connector_type, which must be set to a
>   * known type. Calling this function with a panel whose connector type is
> - * DRM_MODE_CONNECTOR_Unknown will return NULL.
> + * DRM_MODE_CONNECTOR_Unknown will return ERR_PTR(-EINVAL).
>   *
>   * See devm_drm_panel_bridge_add() for an automatically managed version of this
>   * function.
> @@ -174,7 +174,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)
>  {
>  	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
> -		return NULL;
> +		return ERR_PTR(-EINVAL);
>  
>  	return drm_panel_bridge_add_typed(panel, panel->connector_type);
>  }
> @@ -265,7 +265,7 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>  					     struct drm_panel *panel)
>  {
>  	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
> -		return NULL;
> +		return ERR_PTR(-EINVAL);
>  
>  	return devm_drm_panel_bridge_add_typed(dev, panel,
>  					       panel->connector_type);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
