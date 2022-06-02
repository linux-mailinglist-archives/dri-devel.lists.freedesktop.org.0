Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7953BA92
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 16:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DECF112D5A;
	Thu,  2 Jun 2022 14:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8E6112D43
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 14:20:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (lmontsouris-659-1-41-236.w92-154.abo.wanadoo.fr [92.154.76.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2CE2474;
 Thu,  2 Jun 2022 16:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654179632;
 bh=cW56JNy1YMzo/+mpBUCnE11x7qyE/FsTuFp/vI0Hu4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSmlqs942oDdUxWYEtAWQyZeoYuxBbiqIcUaMg+PU49W8Fy2PlrU8NmzkLykZe7Rj
 LZ1SZF6IWyHuyeh0d6ITrTYFnwci5K99VDcPSqLQNTB1qpRM4vOAA1DClGJ5HjgcxS
 2cAFkflFQRCeeo7i9PpMk5sbYWfjaG/fOK8cAZ+w=
Date: Thu, 2 Jun 2022 17:20:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] drm: bridge: adv7511: Add check for
 mipi_dsi_driver_register
Message-ID: <YpjHLN2U8DOh9NLH@pendragon.ideasonboard.com>
References: <20220602103401.2980938-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220602103401.2980938-1-jiasheng@iscas.ac.cn>
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
Cc: jagan@amarulasolutions.com, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, alsi@bang-olufsen.dk, biju.das.jz@bp.renesas.com,
 sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiasheng,

Thank you for the patch.

On Thu, Jun 02, 2022 at 06:34:01PM +0800, Jiasheng Jiang wrote:
> As mipi_dsi_driver_register could return error if fails,
> it should be better to check the return value and return error
> if fails.
> Moreover, if i2c_add_driver fails,  mipi_dsi_driver_register
> should be reverted.
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog:
> 
> v1 -> v2
> 
> *Change 1. Add the mipi_dsi_driver_unregister if i2c_add_driver fails.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..2275d15d4a8b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1392,10 +1392,21 @@ static struct i2c_driver adv7511_driver = {
>  
>  static int __init adv7511_init(void)
>  {
> -	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> -		mipi_dsi_driver_register(&adv7533_dsi_driver);
> +	int ret;
> +
> +	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
> +		ret = mipi_dsi_driver_register(&adv7533_dsi_driver);
> +		if (ret)
> +			return ret;
> +	}
>  
> -	return i2c_add_driver(&adv7511_driver);
> +	ret = i2c_add_driver(&adv7511_driver);
> +	if (ret) {
> +		if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
> +			mipi_dsi_driver_unregister(&adv7533_dsi_driver);
> +	}
> +
> +	return ret;
>  }
>  module_init(adv7511_init);
>  

-- 
Regards,

Laurent Pinchart
