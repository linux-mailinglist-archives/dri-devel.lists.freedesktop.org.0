Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4363F1B8727
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 16:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E16E267;
	Sat, 25 Apr 2020 14:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA786E267
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Apr 2020 14:49:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8BB5620070;
 Sat, 25 Apr 2020 16:49:44 +0200 (CEST)
Date: Sat, 25 Apr 2020 16:49:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] drm/bridge: panel: Return always an error pointer in
 drm_panel_bridge_add()
Message-ID: <20200425144943.GE32235@ravnborg.org>
References: <20200416210654.2468805-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416210654.2468805-1-enric.balletbo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=QX4gbG5DAAAA:8 a=e5mUnYsNAAAA:8
 a=-fIW-uut3qeXBzhQ7CAA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Thanks, added to drm-misc-next.

	Sam

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
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
