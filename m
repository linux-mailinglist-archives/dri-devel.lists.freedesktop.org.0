Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88F2A8E7C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 05:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605A46EE03;
	Fri,  6 Nov 2020 04:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5386EE03
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 04:50:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA328B16;
 Fri,  6 Nov 2020 05:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604638206;
 bh=mWGcTscioAhu2GB1EWb2T9azei10YT3QsM4gehU3Vm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZcXoNqHF2c+zB9zadFN7pwtipV26qOj9odsOeTNN5t3ZcqpvFJmIcERJaYdmWxsnU
 w0ykIlntuhOUdF2H9pGeSEqBubyYNKeXCrMq/b/WWJ3Lw4kbzKU8Lms1CIE7P4fRPz
 zHaxJPxN7mF5DrqZp5PhM17uHu+ML6Zqn1CbiXK4=
Date: Fri, 6 Nov 2020 06:50:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 02/56] Revert "drm/omap: dss: Remove unused
 omap_dss_device operations"
Message-ID: <20201106045004.GC16469@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-3-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:39PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> This reverts commit 4ff8e98879e6eeae9d125dfcf3b642075d00089d.

With this fixed as requested by Sam,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> This is still needed by DSI. E.g. unloading modules without this will
> cause a crash.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/base.c     | 26 +++++++++++++++
>  drivers/gpu/drm/omapdrm/dss/omapdss.h  |  6 ++++
>  drivers/gpu/drm/omapdrm/omap_encoder.c | 44 +++++++++++++++++++++++---
>  3 files changed, 71 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index c7650a7c155d..455b410f7401 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -234,6 +234,18 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
>  }
>  EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
>  
> +void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
> +{
> +	if (!dssdev)
> +		return;
> +
> +	omapdss_device_pre_enable(dssdev->next);
> +
> +	if (dssdev->ops && dssdev->ops->pre_enable)
> +		dssdev->ops->pre_enable(dssdev);
> +}
> +EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
> +
>  void omapdss_device_enable(struct omap_dss_device *dssdev)
>  {
>  	if (!dssdev)
> @@ -260,6 +272,20 @@ void omapdss_device_disable(struct omap_dss_device *dssdev)
>  }
>  EXPORT_SYMBOL_GPL(omapdss_device_disable);
>  
> +void omapdss_device_post_disable(struct omap_dss_device *dssdev)
> +{
> +	if (!dssdev)
> +		return;
> +
> +	if (dssdev->ops && dssdev->ops->post_disable)
> +		dssdev->ops->post_disable(dssdev);
> +
> +	omapdss_device_post_disable(dssdev->next);
> +
> +	dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
> +}
> +EXPORT_SYMBOL_GPL(omapdss_device_post_disable);
> +
>  /* -----------------------------------------------------------------------------
>   * Components Handling
>   */
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index ab19d4af8de7..cbbe10b2b60d 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -342,11 +342,15 @@ struct omap_dss_device_ops {
>  	void (*disconnect)(struct omap_dss_device *dssdev,
>  			struct omap_dss_device *dst);
>  
> +	void (*pre_enable)(struct omap_dss_device *dssdev);
>  	void (*enable)(struct omap_dss_device *dssdev);
>  	void (*disable)(struct omap_dss_device *dssdev);
> +	void (*post_disable)(struct omap_dss_device *dssdev);
>  
>  	int (*check_timings)(struct omap_dss_device *dssdev,
>  			     struct drm_display_mode *mode);
> +	void (*set_timings)(struct omap_dss_device *dssdev,
> +			    const struct drm_display_mode *mode);
>  
>  	int (*get_modes)(struct omap_dss_device *dssdev,
>  			 struct drm_connector *connector);
> @@ -445,8 +449,10 @@ int omapdss_device_connect(struct dss_device *dss,
>  			   struct omap_dss_device *dst);
>  void omapdss_device_disconnect(struct omap_dss_device *src,
>  			       struct omap_dss_device *dst);
> +void omapdss_device_pre_enable(struct omap_dss_device *dssdev);
>  void omapdss_device_enable(struct omap_dss_device *dssdev);
>  void omapdss_device_disable(struct omap_dss_device *dssdev);
> +void omapdss_device_post_disable(struct omap_dss_device *dssdev);
>  
>  int omap_dss_get_num_overlay_managers(void);
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
> index ae4b867a67a3..18a79dde6815 100644
> --- a/drivers/gpu/drm/omapdrm/omap_encoder.c
> +++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
> @@ -113,8 +113,13 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
>  	bus_flags = connector->display_info.bus_flags;
>  	omap_encoder_update_videomode_flags(&vm, bus_flags);
>  
> -	/* Set timings for the dss manager. */
> +	/* Set timings for all devices in the display pipeline. */
>  	dss_mgr_set_timings(output, &vm);
> +
> +	for (dssdev = output; dssdev; dssdev = dssdev->next) {
> +		if (dssdev->ops && dssdev->ops->set_timings)
> +			dssdev->ops->set_timings(dssdev, adjusted_mode);
> +	}
>  }
>  
>  static void omap_encoder_disable(struct drm_encoder *encoder)
> @@ -127,10 +132,26 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
>  
>  	/*
>  	 * Disable the chain of external devices, starting at the one at the
> -	 * internal encoder's output. This is used for DSI outputs only, as
> -	 * dssdev->next is NULL for all other outputs.
> +	 * internal encoder's output.
>  	 */
>  	omapdss_device_disable(dssdev->next);
> +
> +	/*
> +	 * Disable the internal encoder. This will disable the DSS output. The
> +	 * DSI is treated as an exception as DSI pipelines still use the legacy
> +	 * flow where the pipeline output controls the encoder.
> +	 */
> +	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
> +		if (dssdev->ops && dssdev->ops->disable)
> +			dssdev->ops->disable(dssdev);
> +		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
> +	}
> +
> +	/*
> +	 * Perform the post-disable operations on the chain of external devices
> +	 * to complete the display pipeline disable.
> +	 */
> +	omapdss_device_post_disable(dssdev->next);
>  }
>  
>  static void omap_encoder_enable(struct drm_encoder *encoder)
> @@ -141,10 +162,23 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
>  
>  	dev_dbg(dev->dev, "enable(%s)\n", dssdev->name);
>  
> +	/* Prepare the chain of external devices for pipeline enable. */
> +	omapdss_device_pre_enable(dssdev->next);
> +
> +	/*
> +	 * Enable the internal encoder. This will enable the DSS output. The
> +	 * DSI is treated as an exception as DSI pipelines still use the legacy
> +	 * flow where the pipeline output controls the encoder.
> +	 */
> +	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
> +		if (dssdev->ops && dssdev->ops->enable)
> +			dssdev->ops->enable(dssdev);
> +		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
> +	}
> +
>  	/*
>  	 * Enable the chain of external devices, starting at the one at the
> -	 * internal encoder's output. This is used for DSI outputs only, as
> -	 * dssdev->next is NULL for all other outputs.
> +	 * internal encoder's output.
>  	 */
>  	omapdss_device_enable(dssdev->next);
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
