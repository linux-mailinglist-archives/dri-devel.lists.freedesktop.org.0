Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5163539D71
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 08:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F158112D4F;
	Wed,  1 Jun 2022 06:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31113112D4F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 06:52:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (lmontsouris-659-1-41-236.w92-154.abo.wanadoo.fr [92.154.76.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35F9D6D1;
 Wed,  1 Jun 2022 08:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654066326;
 bh=9U51zIdFo623msxiQzlZ5c7urUVTOlg5NLFUSyleXjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T9U4nYh3scF7O79G7ri7mNf7EnIC7VTS5q1eVW+AyUiy4ZQok/wAL+N6UiU3ISjX/
 fSP3Dno+DLsZtIrc5M7Q2X3r/mUsKwtVm2oIhauQSDxh4A4aOWOcNVRTyCD0+1rno3
 X8LQDEIVHhg/VYlHnFLdfVgkbVTVnfFcyNRaxAJs=
Date: Wed, 1 Jun 2022 09:52:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm: bridge: adv7511: Add check for
 mipi_dsi_driver_register
Message-ID: <YpcMkIefWGCwZZJ+@pendragon.ideasonboard.com>
References: <20220601024822.2804516-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220601024822.2804516-1-jiasheng@iscas.ac.cn>
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

On Wed, Jun 01, 2022 at 10:48:22AM +0800, Jiasheng Jiang wrote:
> As mipi_dsi_driver_register could return error if fails,
> it should be better to check the return value and return error
> if fails.
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..795855b41eb2 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1392,8 +1392,13 @@ static struct i2c_driver adv7511_driver = {
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
>  	return i2c_add_driver(&adv7511_driver);

While at it, should this then call mipi_dsi_driver_unregister() on
failure ?

>  }
> -- 
> 2.25.1
> 

-- 
Regards,

Laurent Pinchart
