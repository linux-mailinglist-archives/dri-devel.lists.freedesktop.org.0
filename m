Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF77C2DF666
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 19:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20176E0EA;
	Sun, 20 Dec 2020 18:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483116E0EA
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:07:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6812831A;
 Sun, 20 Dec 2020 19:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608487633;
 bh=ESmu1mf1+w7dS5R6u7cgTeN7XbB4mMnlHWe0WVNNlQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mQL+4bEiu1pivhSbVx9T6uOsJAde4JaEOFJNiTFNa3ME5Ig8CUsPxL0MbewOp5stS
 mVyUv6ncdHaj35qqJsNgt3Mmzw4Xsri1AlR05KZXFbN0tFbb91DImaV8GoHbbeBFLj
 R1BFXs1Povt/kmFwwpkcAomZZSp9T1tNFmodGYTI=
Date: Sun, 20 Dec 2020 20:07:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] drm: bridge: adv7511: Remove redundant null check before
 clk_disable_unprepare
Message-ID: <X9+SyT5fHfAlzKG9@pendragon.ideasonboard.com>
References: <20201127091829.50695-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201127091829.50695-1-vulab@iscas.ac.cn>
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
 laurentiu.palcu@nxp.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 bogdan.togorean@analog.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xu Wang,

Thank you for the patch.

On Fri, Nov 27, 2020 at 09:18:29AM +0000, Xu Wang wrote:
> Because clk_disable_unprepare() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove them.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index a0d392c338da..76555ae64e9c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1292,8 +1292,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  
>  err_unregister_cec:
>  	i2c_unregister_device(adv7511->i2c_cec);
> -	if (adv7511->cec_clk)
> -		clk_disable_unprepare(adv7511->cec_clk);
> +	clk_disable_unprepare(adv7511->cec_clk);
>  err_i2c_unregister_packet:
>  	i2c_unregister_device(adv7511->i2c_packet);
>  err_i2c_unregister_edid:
> @@ -1311,8 +1310,7 @@ static int adv7511_remove(struct i2c_client *i2c)
>  	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>  		adv7533_detach_dsi(adv7511);
>  	i2c_unregister_device(adv7511->i2c_cec);
> -	if (adv7511->cec_clk)
> -		clk_disable_unprepare(adv7511->cec_clk);
> +	clk_disable_unprepare(adv7511->cec_clk);
>  
>  	adv7511_uninit_regulators(adv7511);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
