Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B88A837CD6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 02:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCE810F255;
	Tue, 23 Jan 2024 01:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C56B10F255
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 01:18:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99AFCE4;
 Tue, 23 Jan 2024 02:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705972662;
 bh=Po4T/IjGZp1UTUz0bKFVpijLYioCAg8MTsY3sk6USfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LHbgaoIPK+K+PeU6wOnWRvRtz9lkLUvvnWj43z7RMlqYToyeb6vwSDCAtvtj3IW+p
 hJf6UBdrEibznY38sXerc87XxxewewdwAI/pVEZnGWIyqOgJlMHv75GlsiXc6CLb9I
 8U9K+MR/BJxDkzZQ81QPDTD90qWThLc5uz8+/ZZ8=
Date: Tue, 23 Jan 2024 03:18:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH 3/5] drm/bridge: simple-bridge: Allow acquiring the next
 bridge with fwnode API
Message-ID: <20240123011859.GB22880@pendragon.ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-4-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240122163220.110788-4-sui.jingfeng@linux.dev>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 12:32:18AM +0800, Sui Jingfeng wrote:
> Which make it possible to use this driver on non-DT based systems,
> meanwhile, made no functional changes for DT based systems.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 51 ++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 595f672745b9..cfea5a67cc5b 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -184,6 +184,39 @@ static const void *simple_bridge_get_match_data(const struct device *dev)
>  	return NULL;
>  }
>  
> +static int simple_bridge_get_next_bridge_by_fwnode(struct device *dev,
> +						   struct drm_bridge **next_bridge)
> +{
> +	struct drm_bridge *bridge;
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *remote;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev->fwnode, 1, 0, 0);
> +	if (!ep) {
> +		dev_err(dev, "The endpoint is unconnected\n");
> +		return -EINVAL;
> +	}
> +
> +	remote = fwnode_graph_get_remote_port_parent(ep);
> +	fwnode_handle_put(ep);
> +	if (!remote) {
> +		dev_err(dev, "No valid remote node\n");
> +		return -ENODEV;
> +	}
> +
> +	bridge = drm_bridge_find_by_fwnode(remote);
> +	fwnode_handle_put(remote);
> +
> +	if (!bridge) {
> +		dev_warn(dev, "Next bridge not found, deferring probe\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	*next_bridge = bridge;
> +
> +	return 0;
> +}
> +

Hmmmm yes, this convinces me further that we should switch to fwnode,
not implement fwnode and OF side-by-side.

>  static int simple_bridge_probe(struct platform_device *pdev)
>  {
>  	struct simple_bridge *sbridge;
> @@ -199,14 +232,17 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  	else
>  		sbridge->info = simple_bridge_get_match_data(&pdev->dev);
>  
> -	/* Get the next bridge in the pipeline. */
> -	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> -	if (!remote)
> -		return -EINVAL;
> -
> -	sbridge->next_bridge = of_drm_find_bridge(remote);
> -	of_node_put(remote);
> +	if (pdev->dev.of_node) {
> +		/* Get the next bridge in the pipeline. */
> +		remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
> +		if (!remote)
> +			return -EINVAL;
>  
> +		sbridge->next_bridge = of_drm_find_bridge(remote);
> +		of_node_put(remote);
> +	} else {
> +		simple_bridge_get_next_bridge_by_fwnode(&pdev->dev, &sbridge->next_bridge);
> +	}
>  	if (!sbridge->next_bridge) {
>  		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
>  		return -EPROBE_DEFER;
> @@ -231,6 +267,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
>  	/* Register the bridge. */
>  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
>  	sbridge->bridge.of_node = pdev->dev.of_node;
> +	sbridge->bridge.fwnode = pdev->dev.fwnode;
>  	sbridge->bridge.timings = sbridge->info->timings;
>  
>  	drm_bridge_add(&sbridge->bridge);
> -- 
> 2.25.1
> 

-- 
Regards,

Laurent Pinchart
