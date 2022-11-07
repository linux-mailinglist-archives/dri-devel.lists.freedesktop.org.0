Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E261FCCB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 19:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCF010E8A5;
	Mon,  7 Nov 2022 18:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F2410E8A5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 18:07:52 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1os6X0-0005Ct-6o; Mon, 07 Nov 2022 19:07:34 +0100
Message-ID: <d63e2214c464b029a15967d81968c27a5a4a88d4.camel@pengutronix.de>
Subject: Re: [PATCH 12/26] drm: etnaviv: Remove #ifdef guards for PM related
 functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Cercueil <paul@crapouillou.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 07 Nov 2022 19:07:32 +0100
In-Reply-To: <20221107175256.360839-2-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
 <20221107175256.360839-2-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 07.11.2022 um 17:52 +0000 schrieb Paul Cercueil:
> Use the RUNTIME_PM_OPS() and pm_ptr() macros to handle the
> .runtime_suspend/.runtime_resume callbacks.
> 
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_PM is disabled, without having
> to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Some #ifdef CONFIG_PM guards were protecting simple statements, and were
> also converted to "if (IS_ENABLED(CONFIG_PM))".
> 
Reasoning and the change itself look good.

> Note that this driver should probably use the
> DEFINE_RUNTIME_DEV_PM_OPS() macro instead, which will provide
> .suspend/.resume callbacks, pointing to pm_runtime_force_suspend() and
> pm_runtime_force_resume() respectively; unless those callbacks really
> aren't needed.

This however isn't true, specifically this driver can _not_ use
pm_runtime_force_suspend, as the GPU can't be forced into suspend by
calling the rpm callback. A real suspend implementation would first
need to make sure the GPU finished working on the current queued jobs,
only then it would be able to power it down via the rpm suspend
callback.

Regards,
Lucas

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 30 +++++++++++----------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 37018bc55810..e9a5444ec1c7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1605,7 +1605,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
>  	return etnaviv_gpu_clk_disable(gpu);
>  }
>  
> -#ifdef CONFIG_PM
>  static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
> @@ -1621,7 +1620,6 @@ static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
>  
>  	return 0;
>  }
> -#endif
>  
>  static int
>  etnaviv_gpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
> @@ -1689,11 +1687,10 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>  	if (ret)
>  		goto out_workqueue;
>  
> -#ifdef CONFIG_PM
> -	ret = pm_runtime_get_sync(gpu->dev);
> -#else
> -	ret = etnaviv_gpu_clk_enable(gpu);
> -#endif
> +	if (IS_ENABLED(CONFIG_PM))
> +		ret = pm_runtime_get_sync(gpu->dev);
> +	else
> +		ret = etnaviv_gpu_clk_enable(gpu);
>  	if (ret < 0)
>  		goto out_sched;
>  
> @@ -1737,12 +1734,12 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
>  
>  	etnaviv_sched_fini(gpu);
>  
> -#ifdef CONFIG_PM
> -	pm_runtime_get_sync(gpu->dev);
> -	pm_runtime_put_sync_suspend(gpu->dev);
> -#else
> -	etnaviv_gpu_hw_suspend(gpu);
> -#endif
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		pm_runtime_get_sync(gpu->dev);
> +		pm_runtime_put_sync_suspend(gpu->dev);
> +	} else {
> +		etnaviv_gpu_hw_suspend(gpu);
> +	}
>  
>  	if (gpu->mmu_context)
>  		etnaviv_iommu_context_put(gpu->mmu_context);
> @@ -1856,7 +1853,6 @@ static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
>  static int etnaviv_gpu_rpm_suspend(struct device *dev)
>  {
>  	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
> @@ -1899,18 +1895,16 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
> -	SET_RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
>  };
>  
>  struct platform_driver etnaviv_gpu_driver = {
>  	.driver = {
>  		.name = "etnaviv-gpu",
>  		.owner = THIS_MODULE,
> -		.pm = &etnaviv_gpu_pm_ops,
> +		.pm = pm_ptr(&etnaviv_gpu_pm_ops),
>  		.of_match_table = etnaviv_gpu_match,
>  	},
>  	.probe = etnaviv_gpu_platform_probe,


