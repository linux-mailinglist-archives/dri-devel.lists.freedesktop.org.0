Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E358828AB0B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 01:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614066E063;
	Sun, 11 Oct 2020 23:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D67A6E063
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Oct 2020 23:01:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A4A9308;
 Mon, 12 Oct 2020 01:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602457275;
 bh=uhwaH5dk8caXUXCfjGq8FIzwI8jsBl7UFxbmORYemP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jk4XuflM7wT92ttPSgspLWilsQwimZAMmefxagq796kzRwpgOT7Z8E1qWE649FYev
 gn3eMWmV7BcwfPKp54KMQ8KtYSp7sjhLQ98wiMefKoZR8U6cUBN3b9g1GhpCc1LozR
 5UAPd2L7DuODEYj5zNh5GoCjOQXu0tFs4sfqOaLY=
Date: Mon, 12 Oct 2020 02:00:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH RESEND v3 1/6] drm/of: Change the prototype of
 drm_of_lvds_get_dual_link_pixel_order
Message-ID: <20201011230030.GD3944@pendragon.ideasonboard.com>
References: <cover.6cdb798a6b393c8faa9c1297bbdfb8db81238141.1601910923.git-series.maxime@cerno.tech>
 <6169dd15782627c8415583881fa94ba39c4f5221.1601910923.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6169dd15782627c8415583881fa94ba39c4f5221.1601910923.git-series.maxime@cerno.tech>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Mon, Oct 05, 2020 at 05:15:39PM +0200, Maxime Ripard wrote:
> The drm_of_lvds_get_dual_link_pixel_order() function took so far the
> device_node of the two ports used together to make up a dual-link LVDS
> output.
> 
> This assumes that a binding would use an entire port for the LVDS output.
> However, some bindings have used endpoints instead and thus we need to
> operate at the endpoint level. Change slightly the arguments to allow that.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_of.c            | 98 +++++++++++++++---------------
>  drivers/gpu/drm/rcar-du/rcar_lvds.c |  8 +--
>  include/drm/drm_of.h                | 16 +++--
>  3 files changed, 63 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index b50b44e76279..2dcb49b0401b 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -291,50 +291,34 @@ static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
>  	       (odd_pixels ? DRM_OF_LVDS_ODD : 0);
>  }
>  
> -static int drm_of_lvds_get_remote_pixels_type(
> -			const struct device_node *port_node)
> +static int drm_of_lvds_get_remote_pixels_type(const struct device_node *endpoint)
>  {
> -	struct device_node *endpoint = NULL;
> -	int pixels_type = -EPIPE;
> +	struct device_node *remote_port;
> +	int pixels_type;
>  
> -	for_each_child_of_node(port_node, endpoint) {
> -		struct device_node *remote_port;
> -		int current_pt;
> -
> -		if (!of_node_name_eq(endpoint, "endpoint"))
> -			continue;
> -
> -		remote_port = of_graph_get_remote_port(endpoint);
> -		if (!remote_port) {
> -			of_node_put(remote_port);
> -			return -EPIPE;
> -		}
> -
> -		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
> +	remote_port = of_graph_get_remote_port(endpoint);
> +	if (!remote_port) {
>  		of_node_put(remote_port);

You can drop this line.

> -		if (pixels_type < 0)
> -			pixels_type = current_pt;
> -
> -		/*
> -		 * Sanity check, ensure that all remote endpoints have the same
> -		 * pixel type. We may lift this restriction later if we need to
> -		 * support multiple sinks with different dual-link
> -		 * configurations by passing the endpoints explicitly to
> -		 * drm_of_lvds_get_dual_link_pixel_order().
> -		 */

Shouldn't we keep this check when endpoint_id is -1 in
drm_of_lvds_get_dual_link_pixel_order() ?

> -		if (!current_pt || pixels_type != current_pt) {
> -			of_node_put(remote_port);
> -			return -EINVAL;
> -		}
> +		return -EPIPE;
>  	}
>  
> +	pixels_type = drm_of_lvds_get_port_pixels_type(remote_port);
> +	of_node_put(remote_port);
> +
> +	if (pixels_type < 0)
> +		pixels_type = -EPIPE;
> +
>  	return pixels_type;
>  }
>  
>  /**
>   * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
> - * @port1: First DT port node of the Dual-link LVDS source
> - * @port2: Second DT port node of the Dual-link LVDS source
> + * @dev1: First DT device node of the Dual-Link LVDS source
> + * @port1_id: ID of the first DT port node of the Dual-Link LVDS source
> + * @endpoint1_id: ID of the first DT port node of the Dual-Link LVDS source

The port1_id and endpoint1_id parameters have the exact same
documentation. Same for port2.

I would shorten port1_id to port1 and endpoint1_id to endpoint1, but
that's up to you.

> + * @dev2: First DT device node of the Dual-Link LVDS source
> + * @port2_id: ID of the first DT port node of the Dual-Link LVDS source
> + * @endpoint2_id: ID of the first DT port node of the Dual-Link LVDS source
>   *
>   * An LVDS dual-link connection is made of two links, with even pixels
>   * transitting on one link, and odd pixels on the other link. This function
> @@ -348,32 +332,48 @@ static int drm_of_lvds_get_remote_pixels_type(
>   *
>   * If either port is not connected, this function returns -EPIPE.
>   *
> - * @port1 and @port2 are typically DT sibling nodes, but may have different
> - * parents when, for instance, two separate LVDS encoders carry the even and odd
> - * pixels.
> + * @port1_id and @port2_id are typically DT sibling nodes, but may have
> + * different parents when, for instance, two separate LVDS encoders carry the
> + * even and odd pixels.
> + *
> + * If @port1_id, @port2_id, @endpoint1_id or @endpoint2_id are set to -1, their
> + * value is going to be ignored.

And what happens when they're ignored ? :-) You should document that
the first endpoint / port is then used.

>   *
>   * Return:
> - * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries even pixels and @port2
> - *   carries odd pixels
> - * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @port1 carries odd pixels and @port2
> - *   carries even pixels
> - * * -EINVAL - @port1 and @port2 are not connected to a dual-link LVDS sink, or
> - *   the sink configuration is invalid
> - * * -EPIPE - when @port1 or @port2 are not connected
> + * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @endpoint1_id carries even pixels and
> + *   @endpoint2_id carries odd pixels
> + * * DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS - @endpoint1_id carries odd pixels and
> + *   @endpoint2_id carries even pixels
> + * * -EINVAL - @endpoint1_id and @endpoint2_id are not connected to a dual-link
> + *   LVDS sink, or the sink configuration is invalid
> + * * -EPIPE - when @endpoint1_id or @endpoint2_id are not connected
>   */
> -int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> -					  const struct device_node *port2)
> +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *dev1,
> +					  int port1_id,
> +					  int endpoint1_id,
> +					  const struct device_node *dev2,
> +					  int port2_id,
> +					  int endpoint2_id)
>  {
> +	struct device_node *endpoint1, *endpoint2;
>  	int remote_p1_pt, remote_p2_pt;
>  
> -	if (!port1 || !port2)
> +	if (!dev1 || !dev2)
> +		return -EINVAL;
> +
> +	endpoint1 = of_graph_get_endpoint_by_regs(dev1, port1_id, endpoint1_id);
> +	if (!endpoint1)
> +		return -EINVAL;
> +
> +	endpoint2 = of_graph_get_endpoint_by_regs(dev2, port2_id, endpoint2_id);
> +	if (!endpoint2)
>  		return -EINVAL;

YOu're leaking a reference to endpoint1 here, and to both endpoint1 and
endpoint2 in all the error paths (and the success path actually) below.

>  
> -	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(port1);
> +	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(endpoint1);
>  	if (remote_p1_pt < 0)
>  		return remote_p1_pt;
>  
> -	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(port2);
> +	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(endpoint2);
>  	if (remote_p2_pt < 0)
>  		return remote_p2_pt;
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index ab0d49618cf9..02d8c4ce820e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -715,7 +715,6 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  {
>  	const struct of_device_id *match;
>  	struct device_node *companion;
> -	struct device_node *port0, *port1;
>  	struct rcar_lvds *companion_lvds;
>  	struct device *dev = lvds->dev;
>  	int dual_link;
> @@ -743,11 +742,8 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
>  	 * connected to, if they are marked as expecting even pixels and
>  	 * odd pixels than we need to enable vertical stripe output.
>  	 */
> -	port0 = of_graph_get_port_by_id(dev->of_node, 1);
> -	port1 = of_graph_get_port_by_id(companion, 1);
> -	dual_link = drm_of_lvds_get_dual_link_pixel_order(port0, port1);
> -	of_node_put(port0);
> -	of_node_put(port1);
> +	dual_link = drm_of_lvds_get_dual_link_pixel_order(dev->of_node, 1, -1,
> +							  companion, 1, -1);
>  
>  	switch (dual_link) {
>  	case DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS:
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index b9b093add92e..7bb1f6603beb 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -47,8 +47,12 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  				int port, int endpoint,
>  				struct drm_panel **panel,
>  				struct drm_bridge **bridge);
> -int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> -					  const struct device_node *port2);
> +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *dev1,
> +					  int port1_id,
> +					  int endpoint1_id,
> +					  const struct device_node *dev2,
> +					  int port2_id,
> +					  int endpoint2_id);
>  #else
>  static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
>  					  struct device_node *port)
> @@ -93,8 +97,12 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
>  }
>  
>  static inline int
> -drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> -				      const struct device_node *port2)
> +drm_of_lvds_get_dual_link_pixel_order(const struct device_node *dev1,
> +				      int port1_id,
> +				      int endpoint1_id,
> +				      const struct device_node *dev2,
> +				      int port2_id,
> +				      int endpoint2_id)
>  {
>  	return -EINVAL;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
