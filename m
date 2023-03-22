Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F226C4516
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54D810E8B2;
	Wed, 22 Mar 2023 08:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AAA10E8B2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:35:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C783A58;
 Wed, 22 Mar 2023 09:35:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679474128;
 bh=dzRkl61AnobAS2ipZh6Jf0RiwfAoBUdWthcPEZM9bHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMSutXQ/60qmKy2BkVjuWbDTdI/Jlo6Hhtaq52EPoozPHoxeO/0IPOZSfJ9LDpT1K
 wSw0pwEWctTkp6S8rpyO42Iqw+MGh9GU/WHHjktDIYdpHcuMYtTwZtgT9mr4HTh8n/
 O53BOPzxBDXvefnwu7+4sxjCC1LmBtY9Dveuu4h8=
Date: Wed, 22 Mar 2023 10:35:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] drm/bridge: display-connector: Use dev_err_probe()
Message-ID: <20230322083535.GH20234@pendragon.ideasonboard.com>
References: <202303221621336645576@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202303221621336645576@zte.com.cn>
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

On Wed, Mar 22, 2023 at 04:21:33PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/display-connector.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index fbb3e102c02f..56ae511367b1 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -271,12 +271,9 @@ static int display_connector_probe(struct platform_device *pdev)
>  	    type == DRM_MODE_CONNECTOR_DisplayPort) {
>  		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
>  							 GPIOD_IN);
> -		if (IS_ERR(conn->hpd_gpio)) {
> -			if (PTR_ERR(conn->hpd_gpio) != -EPROBE_DEFER)
> -				dev_err(&pdev->dev,
> -					"Unable to retrieve HPD GPIO\n");
> -			return PTR_ERR(conn->hpd_gpio);
> -		}
> +		if (IS_ERR(conn->hpd_gpio))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(conn->hpd_gpio),
> +					     "Unable to retrieve HPD GPIO\n");
> 
>  		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
>  	} else {

-- 
Regards,

Laurent Pinchart
