Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FEA6FE673
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 23:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3255E10E552;
	Wed, 10 May 2023 21:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC13C10E552
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:50:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1258113E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:51:23 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E007D3F663
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 14:50:38 -0700 (PDT)
Date: Wed, 10 May 2023 22:50:29 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 01/53] drm/komeda: Convert to platform remove callback
 returning void
Message-ID: <ZFwRpeuhkQJgiReH@e110455-lin.cambridge.arm.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-2-u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, James@pengutronix.de,
 dri-devel@lists.freedesktop.org, Mali DP Maintainers <malidp@foss.arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 07, 2023 at 06:25:24PM +0200, Uwe Kleine-König wrote:
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

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the clean up!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index 28f76e07dd95..c597c362f689 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -131,10 +131,9 @@ static int komeda_platform_probe(struct platform_device *pdev)
>  	return component_master_add_with_match(dev, &komeda_master_ops, match);
>  }
>  
> -static int komeda_platform_remove(struct platform_device *pdev)
> +static void komeda_platform_remove(struct platform_device *pdev)
>  {
>  	component_master_del(&pdev->dev, &komeda_master_ops);
> -	return 0;
>  }
>  
>  static const struct of_device_id komeda_of_match[] = {
> @@ -189,7 +188,7 @@ static const struct dev_pm_ops komeda_pm_ops = {
>  
>  static struct platform_driver komeda_platform_driver = {
>  	.probe	= komeda_platform_probe,
> -	.remove	= komeda_platform_remove,
> +	.remove_new = komeda_platform_remove,
>  	.driver	= {
>  		.name = "komeda",
>  		.of_match_table	= komeda_of_match,
> -- 
> 2.39.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
