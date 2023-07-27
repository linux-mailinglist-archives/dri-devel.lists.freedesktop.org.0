Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD51765064
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E811C10E561;
	Thu, 27 Jul 2023 09:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382FE10E561
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:55:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2950E29A;
 Thu, 27 Jul 2023 11:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690451660;
 bh=52l2fE698ZVJp/Pwim4ovXviYlJUSpyIEpTqajcG8hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ug4jKoFzBP5iUCIvhN0PK0CdPHa35wYWjxGDw9KsTCD46ZnvEnhWHO6dRJUD6J41s
 FpJup+JNNzMIKbc0kRx9WJl+/pEW3odZ0Mg4b7mwUd6CKI1xyA/FRIHfQt2GDTwlwW
 RDlP2H01fOFTpv4jyN7ccEZDXEPJPebmq5nRGT/A=
Date: Thu, 27 Jul 2023 12:55:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] drm: omapdrm: dss: Remove redundant DSSERR()
Message-ID: <20230727095525.GG25174@pendragon.ideasonboard.com>
References: <20230727113923.3093070-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230727113923.3093070-1-ruanjinjie@huawei.com>
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
Cc: arnd@arndb.de, guozhengkui@vivo.com, tomi.valkeinen@ideasonboard.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, yuancan@huawei.com,
 u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ruan,

Thank you for the patch.

On Thu, Jul 27, 2023 at 11:39:23AM +0000, Ruan Jinjie wrote:
> There is no need to call the DSSERR() function directly to print
> a custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message
> in case of a failure.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Tomi to pick this up and push it to drm-misc.

> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 1 -
>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 4 +---
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c | 1 -
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c | 1 -
>  4 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index c26aab4939fa..9209103f5dc5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -4779,7 +4779,6 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
>  
>  	dispc->irq = platform_get_irq(dispc->pdev, 0);
>  	if (dispc->irq < 0) {
> -		DSSERR("platform_get_irq failed\n");
>  		r = -ENODEV;
>  		goto err_free;
>  	}
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index ea63c64d3a1a..63cfe0776788 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4935,10 +4935,8 @@ static int dsi_probe(struct platform_device *pdev)
>  		return PTR_ERR(dsi->pll_base);
>  
>  	dsi->irq = platform_get_irq(pdev, 0);
> -	if (dsi->irq < 0) {
> -		DSSERR("platform_get_irq failed\n");
> +	if (dsi->irq < 0)
>  		return -ENODEV;
> -	}
>  
>  	r = devm_request_irq(dev, dsi->irq, omap_dsi_irq_handler,
>  			     IRQF_SHARED, dev_name(dev), dsi);
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index a26b77d99d52..d4fd6c680db3 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -782,7 +782,6 @@ static int hdmi4_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		DSSERR("platform_get_irq failed\n");
>  		r = -ENODEV;
>  		goto err_free;
>  	}
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index e6611c683857..27c21ff8c4e5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -756,7 +756,6 @@ static int hdmi5_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -		DSSERR("platform_get_irq failed\n");
>  		r = -ENODEV;
>  		goto err_free;
>  	}

-- 
Regards,

Laurent Pinchart
