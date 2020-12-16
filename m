Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C62DC1E2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C5894E0;
	Wed, 16 Dec 2020 14:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6451D894E0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:11:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B395E2CF;
 Wed, 16 Dec 2020 15:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608127907;
 bh=1QtTdiuL4L/w3PVnidBSpRT9rFtKDCxuibwgoKsTD7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X3NooqnTUsSIZM1YVqqv4et/ZSA7MzcI3t/xgiiyM0Rh2bGkbGWpAUfXoNBBghp+N
 0/EjEgcF5iyQCuU2F0Ce5u8RZvdlvpeOZkO/VWCIyyxZIBK5D8WmFLqnDa/PDgavGZ
 2TESwp1TDytJRnSUIlugzvYCzR2KF0eKksZU+18M=
Date: Wed, 16 Dec 2020 16:11:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/bridge: use devm_add_action_or_reset() to handle
 failed condition
Message-ID: <X9oVnTa8IZmZZVAU@pendragon.ideasonboard.com>
References: <1608121352-58404-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608121352-58404-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org, a.hajda@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tian,

Thank you for the patch.

On Wed, Dec 16, 2020 at 08:22:32PM +0800, Tian Tao wrote:
> switch to using devm_add_action_or_reset() instead of devm_add_action to
> avoid call the cec_delete_adapter,when devm_add_action_or_reset return
> failed.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 70ab4fb..c8f44bc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -265,11 +265,9 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>  	/* override the module pointer */
>  	cec->adap->owner = THIS_MODULE;
>  
> -	ret = devm_add_action(&pdev->dev, dw_hdmi_cec_del, cec);
> -	if (ret) {
> -		cec_delete_adapter(cec->adap);
> +	ret = devm_add_action_or_reset(&pdev->dev, dw_hdmi_cec_del, cec);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	ret = devm_request_threaded_irq(&pdev->dev, cec->irq,
>  					dw_hdmi_cec_hardirq,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
