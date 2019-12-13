Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E9011EC83
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 22:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC5C6ED19;
	Fri, 13 Dec 2019 21:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424FF6ED19
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 21:06:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF596A4C;
 Fri, 13 Dec 2019 22:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576271167;
 bh=71NSmDcIsAZtivhwhp0QyFErm8lG1OMlM5HXbEzzgmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vsLjpQxPz1jZp0iZYXBGHt3zSkvkVVwwTtNYEoA9zMymyg00bLsaX7IWaXDS/xaFS
 mkLLbVX2Mtlo7zFiWmpVAMdBOXM/qbdkMSMoTUNiyE/CBDZ8p2z7+rG7RjbGQPdZv2
 j8mhyHArwjWVqFgdxwB0hUKuVtO3z1qkrgM2dgb8=
Date: Fri, 13 Dec 2019 23:05:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] drm: of: Add drm_of_lvds_get_dual_link_pixel_order
Message-ID: <20191213210558.GJ4860@pendragon.ideasonboard.com>
References: <1575649974-31472-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1575649974-31472-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575649974-31472-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Magnus Damm <magnus.damm@gmail.com>,
 ebiharaml@si-linux.co.jp, devicetree@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabrizio,

Thank you for the patch.

On Fri, Dec 06, 2019 at 04:32:48PM +0000, Fabrizio Castro wrote:
> An LVDS dual-link connection is made of two links, with even
> pixels transitting on one link, and odd pixels on the other
> link. The device tree can be used to fully describe dual-link
> LVDS connections between encoders and bridges/panels.
> The sink of an LVDS dual-link connection is made of two ports,
> the corresponding OF graph port nodes can be marked
> with either dual-lvds-even-pixels or dual-lvds-odd-pixels,
> and that fully describes an LVDS dual-link connection,
> including pixel order.
> 
> drm_of_lvds_get_dual_link_pixel_order is a new helper
> added by this patch, given the source port nodes it
> returns DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS if the source
> port nodes belong to an LVDS dual-link connection, with even
> pixels expected to be generated from the first port, and odd
> pixels expected to be generated from the second port.
> If the new helper returns DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS,
> odd pixels are expected to be generated from the first port,
> and even pixels from the other port.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v3->v4:
> * The patch had title "drm: Add bus timings helper" in v3
> * The code has now been moved to drm_of, and has been fully
>   restructured, thanks to Laurent and Daniel for the comments
> 
> v2->v3:
> * new patch
> ---
>  drivers/gpu/drm/drm_of.c | 104 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_of.h     |  20 +++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 0ca5880..c2e9ab7 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -274,3 +274,107 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> +
> +enum drm_of_lvds_pixels {
> +	DRM_OF_LVDS_EVEN = BIT(0),
> +	DRM_OF_LVDS_ODD = BIT(1),
> +};
> +
> +static int drm_of_lvds_get_port_pixels_type(struct device_node *port_node)
> +{
> +	bool even_pixels =
> +		of_property_read_bool(port_node, "dual-lvds-even-pixels");
> +	bool odd_pixels =
> +		of_property_read_bool(port_node, "dual-lvds-odd-pixels");
> +
> +	return (even_pixels ? DRM_OF_LVDS_EVEN : 0) |
> +	       (odd_pixels ? DRM_OF_LVDS_ODD : 0);
> +}
> +
> +static int drm_of_lvds_get_remote_pixels_type(
> +			const struct device_node *port_node)
> +{
> +	struct device_node *endpoint = NULL;
> +	int pixels_type = -EPIPE;
> +
> +	for_each_child_of_node(port_node, endpoint) {
> +		struct device_node *remote_port;
> +		int current_pt;
> +
> +		if (!of_node_name_eq(endpoint, "endpoint"))
> +			continue;
> +
> +		remote_port = of_graph_get_remote_port(endpoint);
> +		if (!remote_port)

You need an of_node_put(endpoint) in the code paths that exit from the
loop.

> +			return -EPIPE;
> +
> +		current_pt = drm_of_lvds_get_port_pixels_type(remote_port);
> +		of_node_put(remote_port);
> +		if (!pixels_type)
> +			pixels_type = current_pt;

This will never happen as pixels_type is initialized to -EPIPE.
Replacing the condition with if (pixels_type < 0) should fix it.

> +		if (!current_pt || pixels_type != current_pt)
> +			return -EINVAL;

I would add a comment to explain this. If I understand the code
correcty, something along the lines of

		/*
		 * Sanity check, ensure that all remote endpoints have the same
		 * pixel type. We may lift this restriction later if we need to
		 * support multiple sinks with different dual-link
		 * configurations by passing the endpoints explicitly to
		 * drm_of_lvds_get_dual_link_pixel_order().
		 /

> +	}
> +
> +	return pixels_type;
> +}
> +
> +/**
> + * drm_of_lvds_get_dual_link_pixel_order - Get LVDS dual-link pixel order
> + * @port1: First DT port node of the Dual-link LVDS source
> + * @port2: Second DT port node of the Dual-link LVDS source
> + *
> + * An LVDS dual-link connection is made of two links, with even pixels
> + * transitting on one link, and odd pixels on the other link. This function
> + * returns, for two ports of an LVDS dual-link source, which port shall transmit
> + * the even and odd pixels, based on the requirements of the connected sink.
> + *
> + * The pixel order is determined from the dual-lvds-even-pixels and
> + * dual-lvds-odd-pixels properties in the sink's DT port nodes. If those
> + * properties are not present, or if their usage is not valid, this function
> + * returns -EINVAL.
> + *
> + * If either port is not connected, this function returns -EPIPE.
> + *
> + * @port1 and @port2 are typically DT sibling nodes, but may have different
> + * parents when, for instance, two separate LVDS encoders carry the even and odd
> + * pixels.
> + *
> + * Return:
> + * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries even pixels and @port2
> + *   carries odd pixels
> + * * DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS - @port1 carries odd pixels and @port1

This should be DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS, and the second @port1
should be @port2.

> + *   carries even pixels
> + * * -EINVAL - @port1 and @port2 are not connected to a dual-link LVDS sink, or
> + *   the sink configuration is invalid
> + * * -EPIPE - when @port1 or port2 are not connected

s/port2/@port2/

With those small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + */
> +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> +					  const struct device_node *port2)
> +{
> +	int remote_p1_pt, remote_p2_pt;
> +
> +	if (!port1 || !port2)
> +		return -EINVAL;
> +
> +	remote_p1_pt = drm_of_lvds_get_remote_pixels_type(port1);
> +	if (remote_p1_pt < 0)
> +		return remote_p1_pt;
> +
> +	remote_p2_pt = drm_of_lvds_get_remote_pixels_type(port2);
> +	if (remote_p2_pt < 0)
> +		return remote_p2_pt;
> +
> +	/*
> +	 * A valid dual-lVDS bus is found when one remote port is marked with
> +	 * "dual-lvds-even-pixels", and the other remote port is marked with
> +	 * "dual-lvds-odd-pixels", bail out if the markers are not right.
> +	 */
> +	if (remote_p1_pt + remote_p2_pt != DRM_OF_LVDS_EVEN + DRM_OF_LVDS_ODD)
> +		return -EINVAL;
> +
> +	return remote_p1_pt == DRM_OF_LVDS_EVEN ?
> +		DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS :
> +		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
> +}
> +EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
> diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
> index ead34ab..8ec7ca6 100644
> --- a/include/drm/drm_of.h
> +++ b/include/drm/drm_of.h
> @@ -16,6 +16,18 @@ struct drm_panel;
>  struct drm_bridge;
>  struct device_node;
>  
> +/**
> + * enum drm_lvds_dual_link_pixels - Pixel order of an LVDS dual-link connection
> + * @DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS: Even pixels are expected to be generated
> + *    from the first port, odd pixels from the second port
> + * @DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS: Odd pixels are expected to be generated
> + *    from the first port, even pixels from the second port
> + */
> +enum drm_lvds_dual_link_pixels {
> +	DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS = 0,
> +	DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS = 1,
> +};
> +
>  #ifdef CONFIG_OF
>  uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
>  			    struct device_node *port);
> @@ -35,6 +47,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  				int port, int endpoint,
>  				struct drm_panel **panel,
>  				struct drm_bridge **bridge);
> +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> +					  const struct device_node *port2);
>  #else
>  static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
>  					  struct device_node *port)
> @@ -77,6 +91,12 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
>  {
>  	return -EINVAL;
>  }
> +
> +int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
> +					  const struct device_node *port2)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  /*

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
