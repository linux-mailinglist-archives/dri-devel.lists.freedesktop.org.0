Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA64F63C8D2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE08E10E359;
	Tue, 29 Nov 2022 19:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC8610E359
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:54:46 +0000 (UTC)
Received: from maud (138-51-69-208-lsn-2.nat.utoronto.ca [138.51.69.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A34E56602B48;
 Tue, 29 Nov 2022 19:54:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669751684;
 bh=8sOUNJfo2XVzksYNeNteXITbOiF3xF+EQXDfo2VK0Cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E1Sx80nWgreL04FQlNV7e0E4jkRiQQEqxUn14Tg06W7Ns6N2Pp+RjWxjkbO1p3cGO
 h8/j19zpGcrrPumBpA5zXWdPYU0FlZp3LWY8lvMn9UPQG/dIManDAcfnzoG2fVpuCL
 ptmDqVUvAe24htomoAbPxKHvmy67te0boTGbj+lmJXP3uok+qwkFfiR+0eUn1DXlUL
 ZKrvtHRrCce7uUDq9sSa4PDMjhxx6Xl1uUqHH54TygC2jKfG3FwAVQkVX/KBUgbElG
 9/wz8k9y7myR5p1nXVKcRXCd6DmusaEf3ObD+JAgK8TFILym32qDqGY4bLaFpB9bCg
 4/fPkBmcvpSrg==
Date: Tue, 29 Nov 2022 14:54:39 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 16/26] drm: panfrost: Remove #ifdef guards for PM
 related functions
Message-ID: <Y4Zjf710e7dYXnnQ@maud>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
 <20221129191942.138244-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129191942.138244-3-paul@crapouillou.net>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sounds like a nice clean up :-) 

	Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Tue, Nov 29, 2022 at 07:19:32PM +0000, Paul Cercueil wrote:
> Use the EXPORT_GPL_RUNTIME_DEV_PM_OPS() and pm_ptr() macros to handle
> the PM callbacks.
> 
> These macros allow the PM functions to be automatically dropped by the
> compiler when CONFIG_PM is disabled, without having to use #ifdef
> guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 10 ++++++----
>  drivers/gpu/drm/panfrost/panfrost_device.h |  4 ++--
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  7 +------
>  3 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index ee612303f076..fa1a086a862b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -6,6 +6,7 @@
>  #include <linux/reset.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include "panfrost_device.h"
> @@ -400,8 +401,7 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>  	panfrost_job_enable_interrupts(pfdev);
>  }
>  
> -#ifdef CONFIG_PM
> -int panfrost_device_resume(struct device *dev)
> +static int panfrost_device_resume(struct device *dev)
>  {
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
> @@ -411,7 +411,7 @@ int panfrost_device_resume(struct device *dev)
>  	return 0;
>  }
>  
> -int panfrost_device_suspend(struct device *dev)
> +static int panfrost_device_suspend(struct device *dev)
>  {
>  	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  
> @@ -423,4 +423,6 @@ int panfrost_device_suspend(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
> +
> +EXPORT_GPL_RUNTIME_DEV_PM_OPS(panfrost_pm_ops, panfrost_device_suspend,
> +			      panfrost_device_resume, NULL);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 8b25278f34c8..d9ba68cffb77 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -7,6 +7,7 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/io-pgtable.h>
> +#include <linux/pm.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
>  #include <drm/drm_device.h>
> @@ -172,8 +173,7 @@ int panfrost_device_init(struct panfrost_device *pfdev);
>  void panfrost_device_fini(struct panfrost_device *pfdev);
>  void panfrost_device_reset(struct panfrost_device *pfdev);
>  
> -int panfrost_device_resume(struct device *dev);
> -int panfrost_device_suspend(struct device *dev);
> +extern const struct dev_pm_ops panfrost_pm_ops;
>  
>  enum drm_panfrost_exception_type {
>  	DRM_PANFROST_EXCEPTION_OK = 0x00,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 2fa5afe21288..fa619fe72086 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -676,17 +676,12 @@ static const struct of_device_id dt_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
>  
> -static const struct dev_pm_ops panfrost_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(panfrost_device_suspend, panfrost_device_resume, NULL)
> -};
> -
>  static struct platform_driver panfrost_driver = {
>  	.probe		= panfrost_probe,
>  	.remove		= panfrost_remove,
>  	.driver		= {
>  		.name	= "panfrost",
> -		.pm	= &panfrost_pm_ops,
> +		.pm	= pm_ptr(&panfrost_pm_ops),
>  		.of_match_table = dt_match,
>  	},
>  };
> -- 
> 2.35.1
> 
