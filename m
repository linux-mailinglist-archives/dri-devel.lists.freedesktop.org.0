Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF121B11D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 10:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E857E6EB9F;
	Fri, 10 Jul 2020 08:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485AC6EB9F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 08:20:02 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jtoGB-0008Kp-Uh; Fri, 10 Jul 2020 10:19:56 +0200
Message-ID: <6098f2549eb96348af0ba062d87a716f20d1af1c.camel@pengutronix.de>
Subject: Re: [PATCH 2/4] drm/etnaviv: add loadavg accounting
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Fri, 10 Jul 2020 10:19:54 +0200
In-Reply-To: <20200710074143.306787-3-christian.gmeiner@gmail.com>
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
 <20200710074143.306787-3-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Freitag, den 10.07.2020, 09:41 +0200 schrieb Christian Gmeiner:
> The GPU has an idle state register where each bit represents the idle
> state of a sub-GPU component like FE or TX. Sample this register
> every 10ms and calculate a simple moving average over the sub-GPU
> component idle states with a total observation time frame of 1s.
> 
> This provides us with a percentage based load of each sub-GPU
> component.
> 
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 14 ++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 32 +++++++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 29 ++++++++++++++++++++++++
>  3 files changed, 75 insertions(+)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index f9afe11c50f0..b31920241c86 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -46,6 +46,19 @@ static void load_gpu(struct drm_device *dev)
>  	}
>  }
>  
> +static void unload_gpu(struct drm_device *dev)
> +{
> +	struct etnaviv_drm_private *priv = dev->dev_private;
> +	unsigned int i;
> +
> +	for (i = 0; i < ETNA_MAX_PIPES; i++) {
> +		struct etnaviv_gpu *g = priv->gpu[i];
> +
> +		if (g)
> +			etnaviv_gpu_shutdown(g);
> +	}
> +}
> +
>  static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct etnaviv_drm_private *priv = dev->dev_private;
> @@ -581,6 +594,7 @@ static void etnaviv_unbind(struct device *dev)
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct etnaviv_drm_private *priv = drm->dev_private;
>  
> +	unload_gpu(drm);
>  	drm_dev_unregister(drm);
>  
>  	component_unbind_all(dev, drm);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index a31eeff2b297..1f0eb7e00657 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -714,6 +714,28 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
>  	gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
>  }
>  
> +static void etnaviv_loadavg_function(struct timer_list *t)
> +{
> +	struct etnaviv_gpu *gpu = from_timer(gpu, t, loadavg_timer);
> +	const u32 idle = gpu_read(gpu, VIVS_HI_IDLE_STATE);

This isn't guaranteed to work on a clock/power gated GPU. Also we
surely don't want to wake a idle system every 10ms just to sample a "no
load" value, so this needs some integration with runtime PM, to disable
the sampling when the GPU is powered down and enable when powered up.
The loadavg must be able to adapt to jumps in the sampling interval
while idle.

> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
> +		if ((idle & etna_idle_module_names[i].bit))
> +			sma_loadavg_add(&gpu->loadavg_value[i], 0);
> +		else
> +			sma_loadavg_add(&gpu->loadavg_value[i], 100);
> +
> +	spin_lock_bh(&gpu->loadavg_spinlock);
> +
> +	for (i = 0; i < ARRAY_SIZE(etna_idle_module_names); i++)
> +		gpu->loadavg_percentage[i] = sma_loadavg_read(&gpu->loadavg_value[i]);
> +
> +	spin_unlock_bh(&gpu->loadavg_spinlock);
> +
> +	mod_timer(t, jiffies + msecs_to_jiffies(10));

A jiffies based timer is much too coarse for a regular 10ms sampling.
On a typical 100Hz system 10ms is a single jiffy, so your timer will
fire anywhere in the range of ~0ms...~20ms. This won't get us a usable
measurement.

Regards,
Lucas

> +}
> +
>  int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  {
>  	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
> @@ -804,6 +826,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  	for (i = 0; i < ARRAY_SIZE(gpu->event); i++)
>  		complete(&gpu->event_free);
>  
> +	/* Setup loadavg timer */
> +	timer_setup(&gpu->loadavg_timer, etnaviv_loadavg_function, 0);
> +	mod_timer(&gpu->loadavg_timer, jiffies + msecs_to_jiffies(10));
> +
>  	/* Now program the hardware */
>  	mutex_lock(&gpu->lock);
>  	etnaviv_gpu_hw_init(gpu);
> @@ -824,6 +850,11 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  	return ret;
>  }
>  
> +void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu)
> +{
> +	del_timer(&gpu->loadavg_timer);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  struct dma_debug {
>  	u32 address[2];
> @@ -1762,6 +1793,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  	gpu->dev = &pdev->dev;
>  	mutex_init(&gpu->lock);
>  	mutex_init(&gpu->fence_lock);
> +	spin_lock_init(&gpu->loadavg_spinlock);
>  
>  	/* Map registers: */
>  	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 8ea48697d132..a5b9c89c6744 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -10,6 +10,8 @@
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
>  #include "etnaviv_drv.h"
> +#include "etnaviv_sma.h"
> +#include "state_hi.xml.h"
>  
>  struct etnaviv_gem_submit;
>  struct etnaviv_vram_mapping;
> @@ -91,6 +93,26 @@ struct clk;
>  
>  #define ETNA_NR_EVENTS 30
>  
> +DECLARE_SMA(loadavg, 100)
> +
> +static const struct {
> +    const char *name;
> +    u32 bit;
> +} etna_idle_module_names[] = {
> +    { "FE", VIVS_HI_IDLE_STATE_FE },
> +    { "DE", VIVS_HI_IDLE_STATE_DE },
> +    { "PE", VIVS_HI_IDLE_STATE_PE },
> +    { "SH", VIVS_HI_IDLE_STATE_SH },
> +    { "PA", VIVS_HI_IDLE_STATE_PA },
> +    { "SE", VIVS_HI_IDLE_STATE_SE },
> +    { "RA", VIVS_HI_IDLE_STATE_RA },
> +    { "TX", VIVS_HI_IDLE_STATE_TX },
> +    { "VG", VIVS_HI_IDLE_STATE_VG },
> +    { "IM", VIVS_HI_IDLE_STATE_IM },
> +    { "FP", VIVS_HI_IDLE_STATE_FP },
> +    { "TS", VIVS_HI_IDLE_STATE_TS },
> +};
> +
>  struct etnaviv_gpu {
>  	struct drm_device *drm;
>  	struct thermal_cooling_device *cooling;
> @@ -145,6 +167,12 @@ struct etnaviv_gpu {
>  	unsigned int freq_scale;
>  	unsigned long base_rate_core;
>  	unsigned long base_rate_shader;
> +
> +	/* Loadavg: */
> +	struct timer_list loadavg_timer;
> +	spinlock_t loadavg_spinlock;
> +	struct sma_loadavg loadavg_value[ARRAY_SIZE(etna_idle_module_names)];
> +	unsigned int loadavg_percentage[ARRAY_SIZE(etna_idle_module_names)];
>  };
>  
>  static inline void gpu_write(struct etnaviv_gpu *gpu, u32 reg, u32 data)
> @@ -160,6 +188,7 @@ static inline u32 gpu_read(struct etnaviv_gpu *gpu, u32 reg)
>  int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value);
>  
>  int etnaviv_gpu_init(struct etnaviv_gpu *gpu);
> +void etnaviv_gpu_shutdown(struct etnaviv_gpu *gpu);
>  bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu);
>  
>  #ifdef CONFIG_DEBUG_FS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
