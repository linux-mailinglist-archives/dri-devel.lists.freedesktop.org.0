Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FD4153D3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 01:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07296E07B;
	Wed, 22 Sep 2021 23:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3176E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 23:19:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32273E52;
 Thu, 23 Sep 2021 01:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632352772;
 bh=lirq6R1zilU8AH/ITqGiM3d1OMtteL95cTbYnXKaqJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jEJ2khWXsYpOfWVDgNgPUyMJ05r0aPjPLP8ScOFN0EjH9xBVdAzabLz1IOgPt+eub
 Bs521dGOj1sLg+Uas50hOHExvx3xL3zu4UFs3s+WqDQEyJeu8NZEF9yVSZRYlTrkua
 x77yV54rQmWCTzmHfw1zXrsq16B9y1O/YdACPSKI=
Date: Thu, 23 Sep 2021 02:19:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: dw-hdmi-cec: Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <YUu6AukldZ482TDf@pendragon.ideasonboard.com>
References: <20210922125909.215-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210922125909.215-1-caihuoqing@baidu.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

Thank you for the patch.

On Wed, Sep 22, 2021 at 08:59:08PM +0800, Cai Huoqing wrote:
> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> index 70ab4fbdc23e..c8f44bcb298a 100644
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
