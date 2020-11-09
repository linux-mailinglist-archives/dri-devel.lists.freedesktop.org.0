Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539162AB2AE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCA3895C4;
	Mon,  9 Nov 2020 08:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE00895C4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 08:45:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3E812FE;
 Mon,  9 Nov 2020 09:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604911548;
 bh=15aff/NnbwjQPBSjczg7dx8+GclOhtsYYmUqyp3hKN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYeAktNMfT95CKaYJkw6WLWbTnrcPZPLXxcg6/QsRvIzBcfpHbEUHqkAp3mZNvl7a
 L+k/ukI/Ztbw8lfavc0RmGFik6M7tdOhdvEGa0jG61NroRDpViK/RorBktk6DYtqA8
 snvebvTERbW9Y8oUFrGlHyOcGFk65cQ+XL4jPTZ4=
Date: Mon, 9 Nov 2020 10:45:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 19/56] drm/omap: dsi: drop unused get_te()
Message-ID: <20201109084544.GP6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-20-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-20-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:02:56PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The get_te() callback is not used, so we can drop the
> custom API.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

You could squash this with the previous and next patches.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 13 -------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h           |  1 -
>  2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index dd9112ca76ba..92ac90035fec 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -919,18 +919,6 @@ static int dsicm_enable_te(struct omap_dss_device *dssdev, bool enable)
>  	return r;
>  }
>  
> -static int dsicm_get_te(struct omap_dss_device *dssdev)
> -{
> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
> -	int r;
> -
> -	mutex_lock(&ddata->lock);
> -	r = ddata->te_enabled;
> -	mutex_unlock(&ddata->lock);
> -
> -	return r;
> -}
> -
>  static void dsicm_ulps_work(struct work_struct *work)
>  {
>  	struct panel_drv_data *ddata = container_of(work, struct panel_drv_data,
> @@ -1002,7 +990,6 @@ static const struct omap_dss_driver dsicm_dss_driver = {
>  	.sync		= dsicm_sync,
>  
>  	.enable_te	= dsicm_enable_te,
> -	.get_te		= dsicm_get_te,
>  };
>  
>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index e67928373560..aa307f5ab9cf 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -388,7 +388,6 @@ struct omap_dss_driver {
>  	int (*sync)(struct omap_dss_device *dssdev);
>  
>  	int (*enable_te)(struct omap_dss_device *dssdev, bool enable);
> -	int (*get_te)(struct omap_dss_device *dssdev);
>  };
>  
>  struct dss_device *omapdss_get_dss(void);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
