Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A06F9DC8
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245810E0D4;
	Mon,  8 May 2023 02:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE4F10E0D4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:40:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 811DB814;
 Mon,  8 May 2023 04:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513636;
 bh=8cljPFuI1JkrTqDhhztblXvmvJz+dW8VJylJZ3dVGVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FEIWyKC91QEdrKH5i9nLRuNZK8bOtyhtSwEqTjIcAv7BHAWSev98BapA7ZMztsQz5
 8oyUFjVYGdnRQ0COLH9SW+WejO/tJ+xVRkMGwwB/ua3EdE46NsGSdVUPdIazMOjT2q
 lzDNzoZ61P/6K3McrWm/w5JtxpdnLDg0vIoiK1uM=
Date: Mon, 8 May 2023 05:40:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 39/53] drm/shmobile: Convert to platform remove callback
 returning void
Message-ID: <20230508024054.GF23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:26:02PM +0200, Uwe Kleine-König wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index faacfee24763..fa32115320ca 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -171,7 +171,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
>   * Platform driver
>   */
>  
> -static int shmob_drm_remove(struct platform_device *pdev)
> +static void shmob_drm_remove(struct platform_device *pdev)
>  {
>  	struct shmob_drm_device *sdev = platform_get_drvdata(pdev);
>  	struct drm_device *ddev = sdev->ddev;
> @@ -180,8 +180,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  	drm_kms_helper_poll_fini(ddev);
>  	free_irq(sdev->irq, ddev);
>  	drm_dev_put(ddev);
> -
> -	return 0;
>  }
>  
>  static int shmob_drm_probe(struct platform_device *pdev)
> @@ -285,7 +283,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  
>  static struct platform_driver shmob_drm_platform_driver = {
>  	.probe		= shmob_drm_probe,
> -	.remove		= shmob_drm_remove,
> +	.remove_new	= shmob_drm_remove,
>  	.driver		= {
>  		.name	= "shmob-drm",
>  		.pm	= pm_sleep_ptr(&shmob_drm_pm_ops),
> -- 
> 2.39.2
> 

-- 
Regards,

Laurent Pinchart
