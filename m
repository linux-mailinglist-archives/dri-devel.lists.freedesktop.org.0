Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62596FE21E
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 18:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145C610E4D0;
	Wed, 10 May 2023 16:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51EE810E4D0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 16:05:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41AE51063;
 Wed, 10 May 2023 09:06:12 -0700 (PDT)
Received: from [10.57.58.89] (unknown [10.57.58.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7000F3F67D;
 Wed, 10 May 2023 09:05:25 -0700 (PDT)
Message-ID: <80e50aea-d32b-450c-1f88-ef3d78f37617@arm.com>
Date: Wed, 10 May 2023 17:05:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 36/53] drm/panfrost: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-37-u.kleine-koenig@pengutronix.de>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230507162616.1368908-37-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel@pengutronix.de, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/05/2023 17:25, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index abb0dadd8f63..adaacc8c39d7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -618,7 +618,7 @@ static int panfrost_probe(struct platform_device *pdev)
>  	return err;
>  }
>  
> -static int panfrost_remove(struct platform_device *pdev)
> +static void panfrost_remove(struct platform_device *pdev)
>  {
>  	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = pfdev->ddev;
> @@ -632,7 +632,6 @@ static int panfrost_remove(struct platform_device *pdev)
>  	pm_runtime_set_suspended(pfdev->dev);
>  
>  	drm_dev_put(ddev);
> -	return 0;
>  }
>  
>  /*
> @@ -687,7 +686,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
>  
>  static struct platform_driver panfrost_driver = {
>  	.probe		= panfrost_probe,
> -	.remove		= panfrost_remove,
> +	.remove_new	= panfrost_remove,
>  	.driver		= {
>  		.name	= "panfrost",
>  		.pm	= pm_ptr(&panfrost_pm_ops),

