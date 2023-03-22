Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7AD6C459D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0420610E8BE;
	Wed, 22 Mar 2023 09:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E43810E8BE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:06:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E4D1A58;
 Wed, 22 Mar 2023 10:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679475969;
 bh=U7CJkK0D897WT+EahfWLxd3wuQ97nR7HlBX4dORZ3Ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5iVo1vWx7hX7hPTpesp3UOc5K/+gC3kCU+KfO4OLR+lV/ze29iAwkCXJv3JqfN6/
 3eDzF51b5ilcoJj8DdnGS0ar0/X7lSK+KhjOlDxb00hfKj2mR6W/H2v3z/RJn0CqPh
 N2Pbk8nacO45yWOVPIQmM1q183IkW3pb1ZpNpfEg=
Date: Wed, 22 Mar 2023 11:06:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] drm: bridge: simple-bridge: Use dev_err_probe()
Message-ID: <20230322090616.GJ20234@pendragon.ideasonboard.com>
References: <202303221622511915615@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202303221622511915615@zte.com.cn>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ye,

Thank you for the patch.

On Wed, Mar 22, 2023 at 04:22:51PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 5ede3e111096..d85d9ee463b8 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -202,11 +202,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
> 
>  	sbridge->enable = devm_gpiod_get_optional(&pdev->dev, "enable",
>  						  GPIOD_OUT_LOW);
> -	if (IS_ERR(sbridge->enable)) {
> -		if (PTR_ERR(sbridge->enable) != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Unable to retrieve enable GPIO\n");
> -		return PTR_ERR(sbridge->enable);
> -	}
> +	if (IS_ERR(sbridge->enable))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
> +				     "Unable to retrieve enable GPIO\n");
> 
>  	/* Register the bridge. */
>  	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;

-- 
Regards,

Laurent Pinchart
