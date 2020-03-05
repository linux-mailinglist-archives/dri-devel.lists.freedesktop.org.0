Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4787617B7F6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0276EC90;
	Fri,  6 Mar 2020 08:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2790B6E196
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 10:08:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C18A031B;
 Thu,  5 Mar 2020 02:08:06 -0800 (PST)
Received: from [10.37.12.115] (unknown [10.37.12.115])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3BEE3F6C4;
 Thu,  5 Mar 2020 02:08:04 -0800 (PST)
Subject: Re: [PATCH] drm/exynos: Fix cleanup of IOMMU related objects
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
References: <CGME20200302142822eucas1p1749e7cd54ad0b8657b753a8b720ccba2@eucas1p1.samsung.com>
 <20200302142709.15007-1-m.szyprowski@samsung.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <dd5c8562-48a4-c6f8-219d-51c2e02740f6@arm.com>
Date: Thu, 5 Mar 2020 10:08:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200302142709.15007-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 3/2/20 2:27 PM, Marek Szyprowski wrote:
> Store the IOMMU mapping created by device core of each Exynos DRM
> sub-device and restore it when Exynos DRM driver is unbound. This fixes
> IOMMU initialization failure for the second time when deferred probe is
> triggered from the bind() callback of master's compound DRM driver.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Attaching back the old mapping looks good. The problem with leakage
is also no longer reported (you can add it to the commit message).

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Regards,
Lukasz

> ---
>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
>   drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +++--
>   drivers/gpu/drm/exynos/exynos_drm_dma.c       | 22 +++++++++++--------
>   drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +++--
>   drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
>   drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
>   drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
>   drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
>   drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
>   drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +++--
>   drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++--
>   11 files changed, 47 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 8428ae12dfa5..1f79bc2a881e 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -55,6 +55,7 @@ static const char * const decon_clks_name[] = {
>   struct decon_context {
>   	struct device			*dev;
>   	struct drm_device		*drm_dev;
> +	void				*dma_priv;
>   	struct exynos_drm_crtc		*crtc;
>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -644,7 +645,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>   
>   	decon_clear_channels(ctx->crtc);
>   
> -	return exynos_drm_register_dma(drm_dev, dev);
> +	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>   }
>   
>   static void decon_unbind(struct device *dev, struct device *master, void *data)
> @@ -654,7 +655,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
>   	decon_atomic_disable(ctx->crtc);
>   
>   	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>   }
>   
>   static const struct component_ops decon_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index ff59c641fa80..1eed3327999f 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -40,6 +40,7 @@
>   struct decon_context {
>   	struct device			*dev;
>   	struct drm_device		*drm_dev;
> +	void				*dma_priv;
>   	struct exynos_drm_crtc		*crtc;
>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -127,13 +128,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
>   
>   	decon_clear_channels(ctx->crtc);
>   
> -	return exynos_drm_register_dma(drm_dev, ctx->dev);
> +	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
>   }
>   
>   static void decon_ctx_remove(struct decon_context *ctx)
>   {
>   	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>   }
>   
>   static u32 decon_calc_clkdiv(struct decon_context *ctx,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 9ebc02768847..482bec7756fa 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -58,7 +58,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
>    * mapping.
>    */
>   static int drm_iommu_attach_device(struct drm_device *drm_dev,
> -				struct device *subdrv_dev)
> +				struct device *subdrv_dev, void **dma_priv)
>   {
>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>   	int ret;
> @@ -74,7 +74,8 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   		return ret;
>   
>   	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		if (to_dma_iommu_mapping(subdrv_dev))
> +		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
> +		if (*dma_priv)
>   			arm_iommu_detach_device(subdrv_dev);
>   
>   		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
> @@ -98,19 +99,21 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>    * mapping
>    */
>   static void drm_iommu_detach_device(struct drm_device *drm_dev,
> -				struct device *subdrv_dev)
> +				    struct device *subdrv_dev, void **dma_priv)
>   {
>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>   
> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
> +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
>   		arm_iommu_detach_device(subdrv_dev);
> -	else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> +		arm_iommu_attach_device(subdrv_dev, *dma_priv);
> +	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
>   		iommu_detach_device(priv->mapping, subdrv_dev);
>   
>   	clear_dma_max_seg_size(subdrv_dev);
>   }
>   
> -int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
> +int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> +			    void **dma_priv)
>   {
>   	struct exynos_drm_private *priv = drm->dev_private;
>   
> @@ -137,13 +140,14 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
>   		priv->mapping = mapping;
>   	}
>   
> -	return drm_iommu_attach_device(drm, dev);
> +	return drm_iommu_attach_device(drm, dev, dma_priv);
>   }
>   
> -void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev)
> +void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
> +			       void **dma_priv)
>   {
>   	if (IS_ENABLED(CONFIG_EXYNOS_IOMMU))
> -		drm_iommu_detach_device(drm, dev);
> +		drm_iommu_detach_device(drm, dev, dma_priv);
>   }
>   
>   void exynos_drm_cleanup_dma(struct drm_device *drm)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index d4d21d8cfb90..6ae9056e7a18 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -223,8 +223,10 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
>   	return priv->mapping ? true : false;
>   }
>   
> -int exynos_drm_register_dma(struct drm_device *drm, struct device *dev);
> -void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev);
> +int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> +			    void **dma_priv);
> +void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
> +			       void **dma_priv);
>   void exynos_drm_cleanup_dma(struct drm_device *drm);
>   
>   #ifdef CONFIG_DRM_EXYNOS_DPI
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 8ea2e1d77802..29ab8be8604c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -97,6 +97,7 @@ struct fimc_scaler {
>   struct fimc_context {
>   	struct exynos_drm_ipp ipp;
>   	struct drm_device *drm_dev;
> +	void		*dma_priv;
>   	struct device	*dev;
>   	struct exynos_drm_ipp_task	*task;
>   	struct exynos_drm_ipp_formats	*formats;
> @@ -1133,7 +1134,7 @@ static int fimc_bind(struct device *dev, struct device *master, void *data)
>   
>   	ctx->drm_dev = drm_dev;
>   	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev);
> +	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -1153,7 +1154,7 @@ static void fimc_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &ctx->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(drm_dev, dev);
> +	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
>   }
>   
>   static const struct component_ops fimc_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index 21aec38702fc..bb67cad8371f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -167,6 +167,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
>   struct fimd_context {
>   	struct device			*dev;
>   	struct drm_device		*drm_dev;
> +	void				*dma_priv;
>   	struct exynos_drm_crtc		*crtc;
>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -1090,7 +1091,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>   	if (is_drm_iommu_supported(drm_dev))
>   		fimd_clear_channels(ctx->crtc);
>   
> -	return exynos_drm_register_dma(drm_dev, dev);
> +	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>   }
>   
>   static void fimd_unbind(struct device *dev, struct device *master,
> @@ -1100,7 +1101,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
>   
>   	fimd_atomic_disable(ctx->crtc);
>   
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
>   
>   	if (ctx->encoder)
>   		exynos_dpi_remove(ctx->encoder);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 2a3382d43bc9..fcee33a43aca 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -232,6 +232,7 @@ struct g2d_runqueue_node {
>   
>   struct g2d_data {
>   	struct device			*dev;
> +	void				*dma_priv;
>   	struct clk			*gate_clk;
>   	void __iomem			*regs;
>   	int				irq;
> @@ -1409,7 +1410,7 @@ static int g2d_bind(struct device *dev, struct device *master, void *data)
>   		return ret;
>   	}
>   
> -	ret = exynos_drm_register_dma(drm_dev, dev);
> +	ret = exynos_drm_register_dma(drm_dev, dev, &g2d->dma_priv);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to enable iommu.\n");
>   		g2d_fini_cmdlist(g2d);
> @@ -1434,7 +1435,7 @@ static void g2d_unbind(struct device *dev, struct device *master, void *data)
>   	priv->g2d_dev = NULL;
>   
>   	cancel_work_sync(&g2d->runqueue_work);
> -	exynos_drm_unregister_dma(g2d->drm_dev, dev);
> +	exynos_drm_unregister_dma(g2d->drm_dev, dev, &g2d->dma_priv);
>   }
>   
>   static const struct component_ops g2d_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 88b6fcaa20be..45e9aee8366a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -97,6 +97,7 @@ struct gsc_scaler {
>   struct gsc_context {
>   	struct exynos_drm_ipp ipp;
>   	struct drm_device *drm_dev;
> +	void		*dma_priv;
>   	struct device	*dev;
>   	struct exynos_drm_ipp_task	*task;
>   	struct exynos_drm_ipp_formats	*formats;
> @@ -1169,7 +1170,7 @@ static int gsc_bind(struct device *dev, struct device *master, void *data)
>   
>   	ctx->drm_dev = drm_dev;
>   	ctx->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev);
> +	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -1189,7 +1190,7 @@ static void gsc_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &ctx->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(drm_dev, dev);
> +	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
>   }
>   
>   static const struct component_ops gsc_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index b98482990d1a..dafa87b82052 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -56,6 +56,7 @@ struct rot_variant {
>   struct rot_context {
>   	struct exynos_drm_ipp ipp;
>   	struct drm_device *drm_dev;
> +	void		*dma_priv;
>   	struct device	*dev;
>   	void __iomem	*regs;
>   	struct clk	*clock;
> @@ -243,7 +244,7 @@ static int rotator_bind(struct device *dev, struct device *master, void *data)
>   
>   	rot->drm_dev = drm_dev;
>   	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev);
> +	exynos_drm_register_dma(drm_dev, dev, &rot->dma_priv);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE,
> @@ -261,7 +262,7 @@ static void rotator_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &rot->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(rot->drm_dev, rot->dev);
> +	exynos_drm_unregister_dma(rot->drm_dev, rot->dev, &rot->dma_priv);
>   }
>   
>   static const struct component_ops rotator_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index 497973e9b2c5..93c43c8d914e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -39,6 +39,7 @@ struct scaler_data {
>   struct scaler_context {
>   	struct exynos_drm_ipp		ipp;
>   	struct drm_device		*drm_dev;
> +	void				*dma_priv;
>   	struct device			*dev;
>   	void __iomem			*regs;
>   	struct clk			*clock[SCALER_MAX_CLK];
> @@ -450,7 +451,7 @@ static int scaler_bind(struct device *dev, struct device *master, void *data)
>   
>   	scaler->drm_dev = drm_dev;
>   	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev);
> +	exynos_drm_register_dma(drm_dev, dev, &scaler->dma_priv);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -470,7 +471,8 @@ static void scaler_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &scaler->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev);
> +	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev,
> +				  &scaler->dma_priv);
>   }
>   
>   static const struct component_ops scaler_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index 38ae9c32feef..21b726baedea 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -94,6 +94,7 @@ struct mixer_context {
>   	struct platform_device *pdev;
>   	struct device		*dev;
>   	struct drm_device	*drm_dev;
> +	void			*dma_priv;
>   	struct exynos_drm_crtc	*crtc;
>   	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>   	unsigned long		flags;
> @@ -894,12 +895,14 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
>   		}
>   	}
>   
> -	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev);
> +	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev,
> +				       &mixer_ctx->dma_priv);
>   }
>   
>   static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
>   {
> -	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev);
> +	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev,
> +				  &mixer_ctx->dma_priv);
>   }
>   
>   static int mixer_enable_vblank(struct exynos_drm_crtc *crtc)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
