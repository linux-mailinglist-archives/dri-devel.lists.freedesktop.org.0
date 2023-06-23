Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C988B73BBE5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE2510E664;
	Fri, 23 Jun 2023 15:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F25610E662
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:42:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81B49838;
 Fri, 23 Jun 2023 17:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687534882;
 bh=vAvgOuo7ciMIJdwJYscA2jdeSsVY0tXeEX6+c1G6yUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AhTrQcq0V0NHivubxoHGh6Ds97i2wVL7EETm/YajjkosrMXnyhS7b/zS86q5XoYbf
 pc5sp32yxe17PIVEwCGzvESweTETB/zgXhF5TdESW0fh87614QDSdWXkb9Gl6y7hgh
 Fk0PL2uoSazBvYuvhkCko6B+bmSgdNtYPGs92Jkg=
Date: Fri, 23 Jun 2023 18:41:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 16/39] drm: renesas: shmobile: Convert to use
 devm_request_irq()
Message-ID: <20230623154158.GT2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <c8d14f4a5e455d523c5c7ff89bd815196df7e4f9.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c8d14f4a5e455d523c5c7ff89bd815196df7e4f9.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:28AM +0200, Geert Uytterhoeven wrote:
> Convert to managed IRQ handling, to simplify cleanup.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index 50fca18282c5cb5e..ece9aedde9b662d4 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -169,7 +169,6 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  
>  	drm_dev_unregister(ddev);
>  	drm_kms_helper_poll_fini(ddev);
> -	free_irq(sdev->irq, ddev);
>  	drm_dev_put(ddev);
>  
>  	return 0;
> @@ -252,8 +251,8 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  		goto err_modeset_cleanup;
>  	sdev->irq = ret;
>  
> -	ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
> -			  ddev);
> +	ret = devm_request_irq(&pdev->dev, sdev->irq, shmob_drm_irq, 0,
> +			       ddev->driver->name, ddev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to install IRQ handler\n");
>  		goto err_modeset_cleanup;
> @@ -265,14 +264,12 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	 */
>  	ret = drm_dev_register(ddev, 0);
>  	if (ret < 0)
> -		goto err_irq_uninstall;
> +		goto err_modeset_cleanup;
>  
>  	drm_fbdev_generic_setup(ddev, 16);
>  
>  	return 0;
>  
> -err_irq_uninstall:
> -	free_irq(sdev->irq, ddev);
>  err_modeset_cleanup:
>  	drm_kms_helper_poll_fini(ddev);
>  err_free_drm_dev:

-- 
Regards,

Laurent Pinchart
