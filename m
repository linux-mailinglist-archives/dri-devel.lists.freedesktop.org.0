Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8262AB56D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 11:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0BA898E8;
	Mon,  9 Nov 2020 10:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3F3898E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 10:51:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 825ADB2B;
 Mon,  9 Nov 2020 11:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604919115;
 bh=mPcRd5c3Glv29NFsxt2/XsIH+bx4fv83CdGo0U/mELA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gPkg+iI9MNmkobzI6RyChQf29e2x/EMNgzTlulwh3ojpHCaQnquM0d+DLJXU8YYv2
 KvCXZYdsg1iiAhxgbifcBrPd/in/+i+xKyZn7mi4dCCcSihiAiD92Ak1vE47pb5Tqa
 6K8znRDNvVAlfS2vgP4UOrcNQEU4woQqfGc+AwZY=
Date: Mon, 9 Nov 2020 12:51:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 39/56] drm/omap: remove global dss_device variable
Message-ID: <20201109105152.GJ6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-40-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-40-tomi.valkeinen@ti.com>
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

On Thu, Nov 05, 2020 at 02:03:16PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> We can simply provide the device to the omapdrm driver
> via pdata. omapdss_is_initialized() is no longer required
> (even before this patch), since omapdrm device is only
> registered after the pointer is initialized.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/omapdrm/dss/base.c    | 14 --------------
>  drivers/gpu/drm/omapdrm/dss/dss.c     |  9 ++++-----
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  9 +++------
>  drivers/gpu/drm/omapdrm/omap_drv.c    |  6 ++----
>  4 files changed, 9 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
> index 455b410f7401..8e08c49b4f97 100644
> --- a/drivers/gpu/drm/omapdrm/dss/base.c
> +++ b/drivers/gpu/drm/omapdrm/dss/base.c
> @@ -16,20 +16,6 @@
>  #include "dss.h"
>  #include "omapdss.h"
>  
> -static struct dss_device *dss_device;
> -
> -struct dss_device *omapdss_get_dss(void)
> -{
> -	return dss_device;
> -}
> -EXPORT_SYMBOL(omapdss_get_dss);
> -
> -void omapdss_set_dss(struct dss_device *dss)
> -{
> -	dss_device = dss;
> -}
> -EXPORT_SYMBOL(omapdss_set_dss);
> -
>  struct dispc_device *dispc_get_dispc(struct dss_device *dss)
>  {
>  	return dss->dispc;
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 6ccbc29c4ce4..6e86f4e67a2c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1305,6 +1305,7 @@ static int dss_bind(struct device *dev)
>  {
>  	struct dss_device *dss = dev_get_drvdata(dev);
>  	struct platform_device *drm_pdev;
> +	struct dss_pdata pdata;
>  	int r;
>  
>  	r = component_bind_all(dev, NULL);
> @@ -1313,9 +1314,9 @@ static int dss_bind(struct device *dev)
>  
>  	pm_set_vt_switch(0);
>  
> -	omapdss_set_dss(dss);
> -
> -	drm_pdev = platform_device_register_simple("omapdrm", 0, NULL, 0);
> +	pdata.dss = dss;
> +	drm_pdev = platform_device_register_data(NULL, "omapdrm", 0,
> +						 &pdata, sizeof(pdata));
>  	if (IS_ERR(drm_pdev)) {
>  		component_unbind_all(dev, NULL);
>  		return PTR_ERR(drm_pdev);
> @@ -1332,8 +1333,6 @@ static void dss_unbind(struct device *dev)
>  
>  	platform_device_unregister(dss->drm_pdev);
>  
> -	omapdss_set_dss(NULL);
> -
>  	component_unbind_all(dev, NULL);
>  }
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 3ee3063b6a2d..42d1ec3aaf0c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -356,12 +356,9 @@ struct omap_dss_device {
>  	unsigned int of_port;
>  };
>  
> -struct dss_device *omapdss_get_dss(void);
> -void omapdss_set_dss(struct dss_device *dss);
> -static inline bool omapdss_is_initialized(void)
> -{
> -	return !!omapdss_get_dss();
> -}
> +struct dss_pdata {
> +	struct dss_device *dss;
> +};
>  
>  void omapdss_display_init(struct omap_dss_device *dssdev);
>  int omapdss_display_get_modes(struct drm_connector *connector,
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 53d5e184ee77..b342f5b6ced0 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -577,6 +577,7 @@ static const struct soc_device_attribute omapdrm_soc_devices[] = {
>  static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>  {
>  	const struct soc_device_attribute *soc;
> +	struct dss_pdata *pdata = dev->platform_data;
>  	struct drm_device *ddev;
>  	int ret;
>  
> @@ -591,7 +592,7 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
>  	ddev->dev_private = priv;
>  
>  	priv->dev = dev;
> -	priv->dss = omapdss_get_dss();
> +	priv->dss = pdata->dss;
>  	priv->dispc = dispc_get_dispc(priv->dss);
>  	priv->dispc_ops = dispc_get_ops(priv->dss);
>  
> @@ -686,9 +687,6 @@ static int pdev_probe(struct platform_device *pdev)
>  	struct omap_drm_private *priv;
>  	int ret;
>  
> -	if (omapdss_is_initialized() == false)
> -		return -EPROBE_DEFER;
> -
>  	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to set the DMA mask\n");

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
