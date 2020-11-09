Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1982AB5C5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 12:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F798892CC;
	Mon,  9 Nov 2020 11:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791D6892CC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 11:04:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03E71B2B;
 Mon,  9 Nov 2020 12:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604919897;
 bh=dKsSjnkIsEh+mn1K0u6sJl91rKlHvGknFg7Gq0yRcAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pq4huQaICSsWCrYD+5EonTJVzmk66tHUcNEZuHAtfT/3QZqn1KvCgC1GphSK0mEmw
 SXJzVPfNWMpiE5Vkn75nLpR79Cvs6vRBuFDFAQLI1Bm32ean01TySZ0VB7AxqsW2+9
 3lSHpbWWmoCpXv8cWbMx5/HGFmTPeEesWtmVclV4=
Date: Mon, 9 Nov 2020 13:04:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 45/56] drm/omap: drop unused DSS next pointer
Message-ID: <20201109110453.GP6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-46-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-46-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:22PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Since all encoders and panels are using the bridge API now,
> we next pointer is no longer useful and can be dropped.

I would squash this with the previous patch.

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c     |  2 +-
>  drivers/gpu/drm/omapdrm/dss/omapdss.h  |  1 -
>  drivers/gpu/drm/omapdrm/dss/output.c   | 13 +------------
>  drivers/gpu/drm/omapdrm/omap_encoder.c |  4 ----
>  4 files changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index c2791305c332..d62713b241d2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -135,7 +135,7 @@ struct omap_dss_device *omapdss_device_next_output(struct omap_dss_device *from)
>  			goto done;
>  		}
>  
> -		if (dssdev->id && (dssdev->next || dssdev->bridge))
> +		if (dssdev->id && (dssdev->bridge))

No need for the inner parentheses.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			goto done;
>  	}
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 5d6edec5a427..1f02d3e406dc 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -293,7 +293,6 @@ struct omap_dss_device {
>  	struct module *owner;
>  
>  	struct dss_device *dss;
> -	struct omap_dss_device *next;
>  	struct drm_bridge *bridge;
>  	struct drm_bridge *next_bridge;
>  	struct drm_panel *panel;
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index ce21c798cca6..40cb353572f6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -30,7 +30,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  		return 0;
>  	}
>  
> -	out->next = omapdss_find_device_by_node(remote_node);
>  	out->bridge = of_drm_find_bridge(remote_node);
>  	out->panel = of_drm_find_panel(remote_node);
>  	if (IS_ERR(out->panel))
> @@ -38,12 +37,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  
>  	of_node_put(remote_node);
>  
> -	if (out->next && out->type != out->next->type) {
> -		dev_err(out->dev, "output type and display type don't match\n");
> -		ret = -EINVAL;
> -		goto error;
> -	}
> -
>  	if (out->panel) {
>  		struct drm_bridge *bridge;
>  
> @@ -69,7 +62,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  		out->bridge = local_bridge;
>  	}
>  
> -	if (!out->next && !out->bridge) {
> +	if (!out->bridge) {
>  		ret = -EPROBE_DEFER;
>  		goto error;
>  	}
> @@ -78,7 +71,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  
>  error:
>  	omapdss_device_cleanup_output(out);
> -	out->next = NULL;
>  	return ret;
>  }
>  EXPORT_SYMBOL(omapdss_device_init_output);
> @@ -88,9 +80,6 @@ void omapdss_device_cleanup_output(struct omap_dss_device *out)
>  	if (out->bridge && out->panel)
>  		drm_panel_bridge_remove(out->next_bridge ?
>  					out->next_bridge : out->bridge);
> -
> -	if (out->next)
> -		omapdss_device_put(out->next);
>  }
>  EXPORT_SYMBOL(omapdss_device_cleanup_output);
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index 610c5a2f2771..5f5fa01240a7 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -75,7 +75,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  {
>  	struct omap_encoder *omap_encoder = to_omap_encoder(encoder);
>  	struct omap_dss_device *output = omap_encoder->output;
> -	struct omap_dss_device *dssdev;
>  	struct drm_device *dev = encoder->dev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *bridge;
> @@ -98,9 +97,6 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  	 *
>  	 * A better solution is to use DRM's bus-flags through the whole driver.
>  	 */
> -	for (dssdev = output; dssdev; dssdev = dssdev->next)
> -		omap_encoder_update_videomode_flags(&vm, dssdev->bus_flags);
> -
>  	for (bridge = output->bridge; bridge;
>  	     bridge = drm_bridge_get_next_bridge(bridge)) {
>  		if (!bridge->timings)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
