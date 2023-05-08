Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16CC6F9DC0
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 04:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6504F10E0C4;
	Mon,  8 May 2023 02:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40EB10E0C4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 02:35:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126090219015.bbtec.net
 [126.90.219.15])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 369E6814;
 Mon,  8 May 2023 04:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1683513297;
 bh=DyKJO4qlTIvxqZ/yu5DRIag+9avkFIC93/u3fV0KZA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwUDYdqBrH8ncx2DowYnsCA9dJ1XeizE0HhNnjMYesbgNKFccPk7fVpyEisoMBnhM
 aQR+WQql3J+yD+YhhKY+5sE+WUR8dwXgUFO5UU0QeTSsk5uu0Q/XpIRtmfM/J1IHJQ
 tLFjiGgrFDpGgQMN6a41P34miJh87BSEPL5t11n4=
Date: Mon, 8 May 2023 05:35:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 53/53] drm/xlnx/zynqmp_dpsub: Convert to platform remove
 callback returning void
Message-ID: <20230508023514.GA23514@pendragon.ideasonboard.com>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-54-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230507162616.1368908-54-u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, Hyun Kwon <hyun.kwon@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Sun, May 07, 2023 at 06:26:16PM +0200, Uwe Kleine-König wrote:
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
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index bab862484d42..9d64a8d98372 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -280,7 +280,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int zynqmp_dpsub_remove(struct platform_device *pdev)
> +static void zynqmp_dpsub_remove(struct platform_device *pdev)
>  {
>  	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
>  
> @@ -298,8 +298,6 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
>  
>  	if (!dpsub->drm)
>  		zynqmp_dpsub_release(dpsub);
> -
> -	return 0;
>  }
>  
>  static void zynqmp_dpsub_shutdown(struct platform_device *pdev)
> @@ -320,7 +318,7 @@ MODULE_DEVICE_TABLE(of, zynqmp_dpsub_of_match);
>  
>  static struct platform_driver zynqmp_dpsub_driver = {
>  	.probe			= zynqmp_dpsub_probe,
> -	.remove			= zynqmp_dpsub_remove,
> +	.remove_new		= zynqmp_dpsub_remove,
>  	.shutdown		= zynqmp_dpsub_shutdown,
>  	.driver			= {
>  		.name		= "zynqmp-dpsub",

-- 
Regards,

Laurent Pinchart
