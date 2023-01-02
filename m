Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC6565B1D3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 13:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364510E1B3;
	Mon,  2 Jan 2023 12:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594DD10E1B3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 12:11:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF0E5BA;
 Mon,  2 Jan 2023 13:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1672661467;
 bh=IpFKObRlVAEYHA8hryv4sn2dC3P6rWMw0jcNW2fm6zA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJifLgKhN0uJvkqjAE57bRPEJnJjdC6g6IbdZ06UKg1yJMxP+3b0zl2Rh5Viu6+Ar
 K3w3QqNRiZqYBxJNVqIy5+BSx3YsWVui4fV4/ELm47iixKEwn5K0I+ly7wFHX8n0XW
 CxsMcsH80WJ8jOXhl1y3s3IH5QQyGRj0bBax7br0=
Date: Mon, 2 Jan 2023 14:11:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/bridge: panel: Prevent ERR_PTR Dereference
Message-ID: <Y7LJ16ahuo3jAm7z@pendragon.ideasonboard.com>
References: <20230102120123.19062-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230102120123.19062-1-maxime@cerno.tech>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dan Carpenter <error27@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Mon, Jan 02, 2023 at 01:01:23PM +0100, Maxime Ripard wrote:
> Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
> drm_panel") introduced an access to the bridge pointer in the
> devm_drm_panel_bridge_add_typed() function.
> 
> However, due to the unusual ERR_PTR check when getting that pointer, the
> pointer access is done even though the pointer might be an error
> pointer.
> 
> Rework the function for a more traditional design that will return
> immediately if it gets an ERR_PTR so that we never access the pointer in
> that case.
> 
> Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/panel.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 1708098fba6d..e8aae3cdc73d 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -357,15 +357,16 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  		return ERR_PTR(-ENOMEM);
>  
>  	bridge = drm_panel_bridge_add_typed(panel, connector_type);
> -	if (!IS_ERR(bridge)) {
> -		*ptr = bridge;
> -		devres_add(dev, ptr);
> -	} else {
> +	if (IS_ERR(bridge)) {
>  		devres_free(ptr);
> +		return bridge;
>  	}
>  
>  	bridge->pre_enable_prev_first = panel->prepare_prev_first;
>  
> +	*ptr = bridge;
> +	devres_add(dev, ptr);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);

-- 
Regards,

Laurent Pinchart
