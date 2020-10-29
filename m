Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2020D29F8B8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 23:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245366E922;
	Thu, 29 Oct 2020 22:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518D6E922
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 22:55:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3C0550E;
 Thu, 29 Oct 2020 23:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604012132;
 bh=ovDHuKXXAmDXvjIT2eq7pyOlaQsk/HVLGY9nfJAOUnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTL1EZlwzD/YQHty2EZ5ys4Hx/x1TqbF7jESYkfmno19NiP2AISmg2XOzdONlNllU
 SuMu6Pu1iJJetHhQHr41zscmsN/saSZiVj7wQxx0M5lmO7VMboQyiiETgUYc/rL/A5
 NrDvPAsrIhtOFYaVInZ3pNRBieMbFyv+FDYPAsjM=
Date: Fri, 30 Oct 2020 00:54:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: Re: [PATCH 1/5] drm/tidss: Move to newer connector model
Message-ID: <20201029225443.GJ15024@pendragon.ideasonboard.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-2-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016103917.26838-2-nikhil.nd@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikhil,

Thank you for the patch.

On Fri, Oct 16, 2020 at 04:09:13PM +0530, Nikhil Devshatwar wrote:
> To be able to support connector operations across multiple
> bridges, it is recommended that the connector should be
> created by the SoC driver instead of the bridges.
> 
> Modify the tidss modesetting initialization sequence to
> create the connector and attach bridges with flag
> DRM_BRIDGE_ATTACH_NO_CONNECTOR
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.h |  3 +++
>  drivers/gpu/drm/tidss/tidss_kms.c | 15 ++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 7de4bba52e6f..cfbf85a4d92b 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -27,6 +27,9 @@ struct tidss_device {
>  	unsigned int num_planes;
>  	struct drm_plane *planes[TIDSS_MAX_PLANES];
>  
> +	unsigned int num_connectors;
> +	struct drm_connector *connectors[TIDSS_MAX_PORTS];
> +
>  	spinlock_t wait_lock;	/* protects the irq masks */
>  	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
>  };
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 09485c7f0d6f..51c24b4a6a21 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -192,6 +193,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>  	for (i = 0; i < num_pipes; ++i) {
>  		struct tidss_plane *tplane;
>  		struct tidss_crtc *tcrtc;
> +		struct drm_connector *connector;
>  		struct drm_encoder *enc;
>  		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
>  		int ret;
> @@ -222,11 +224,22 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>  			return PTR_ERR(enc);
>  		}
>  
> -		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
> +		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
>  			return ret;
>  		}
> +
> +		connector = drm_bridge_connector_init(&tidss->ddev, enc);
> +		if (IS_ERR(connector)) {
> +			dev_err(tidss->dev, "bridge_connector create failed\n");
> +			return PTR_ERR(connector);
> +		}
> +
> +		tidss->connectors[tidss->num_connectors++] = connector;
> +
> +		drm_connector_attach_encoder(connector, enc);

Apart from the issue reported by Tomi, the patch looks goood to me. Fix
this fixed, and the series reordered to move this to the end,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
>  	/* create overlay planes of the leftover planes */

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
