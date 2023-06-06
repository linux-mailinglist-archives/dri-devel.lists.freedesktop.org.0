Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E8724342
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 14:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF38010E33E;
	Tue,  6 Jun 2023 12:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE20610E33E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 12:55:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42FC2AB;
 Tue,  6 Jun 2023 14:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686056115;
 bh=v1ebWPm9f57kmCy8NGOr72XyV35bqnA9olqTFoX1h0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTxjqppgykua5g3f+sz22G5bMh0HeRARGlDCvYnIF4hdA+sUbKd1dk3zAzAQZuBpl
 gA+wZDiERLVn8ntmn8KAdjlbkjFyaT6ISRs+4BnWIZ8l8zS9Vr0YZDS1oDJw7KDGPE
 W0frUSEwX/86rVESPsLMihBDetS6UsmhRJrOwQNk=
Date: Tue, 6 Jun 2023 15:55:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 1/8] Revert "drm: mipi-dsi: Convert logging to drm_*
 functions."
Message-ID: <20230606125537.GC25774@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <bff523677c65a4a6b1c06152b154cf5651f51d68.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bff523677c65a4a6b1c06152b154cf5651f51d68.1686047727.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:15:15PM +0530, Siddh Raman Pant wrote:
> This reverts commit 1040e424353f5f4d39f6f3aa8723eb3bd6ea6446.
> 
> It used an incorrect way to use drm_* functions. Only drm_device ptrs
> should be passed, but the mentioned commit passed mipi_dsi_host ptr.
> It worked by accident due to macro magic.
> 
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Any chance we could prevent this from happening by turning the macros
into inline functions ?

> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 3fd6c733ff4e..a37af4edf394 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -33,7 +33,6 @@
>  
>  #include <drm/display/drm_dsc.h>
>  #include <drm/drm_mipi_dsi.h>
> -#include <drm/drm_print.h>
>  
>  #include <video/mipi_display.h>
>  
> @@ -156,18 +155,19 @@ static int mipi_dsi_device_add(struct mipi_dsi_device *dsi)
>  static struct mipi_dsi_device *
>  of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *node)
>  {
> +	struct device *dev = host->dev;
>  	struct mipi_dsi_device_info info = { };
>  	int ret;
>  	u32 reg;
>  
>  	if (of_alias_from_compatible(node, info.type, sizeof(info.type)) < 0) {
> -		drm_err(host, "modalias failure on %pOF\n", node);
> +		dev_err(dev, "modalias failure on %pOF\n", node);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	ret = of_property_read_u32(node, "reg", &reg);
>  	if (ret) {
> -		drm_err(host, "device node %pOF has no valid reg property: %d\n",
> +		dev_err(dev, "device node %pOF has no valid reg property: %d\n",
>  			node, ret);
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -202,21 +202,22 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>  			      const struct mipi_dsi_device_info *info)
>  {
>  	struct mipi_dsi_device *dsi;
> +	struct device *dev = host->dev;
>  	int ret;
>  
>  	if (!info) {
> -		drm_err(host, "invalid mipi_dsi_device_info pointer\n");
> +		dev_err(dev, "invalid mipi_dsi_device_info pointer\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	if (info->channel > 3) {
> -		drm_err(host, "invalid virtual channel: %u\n", info->channel);
> +		dev_err(dev, "invalid virtual channel: %u\n", info->channel);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
>  	dsi = mipi_dsi_device_alloc(host);
>  	if (IS_ERR(dsi)) {
> -		drm_err(host, "failed to allocate DSI device %ld\n",
> +		dev_err(dev, "failed to allocate DSI device %ld\n",
>  			PTR_ERR(dsi));
>  		return dsi;
>  	}
> @@ -227,7 +228,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>  
>  	ret = mipi_dsi_device_add(dsi);
>  	if (ret) {
> -		drm_err(host, "failed to add DSI device %d\n", ret);
> +		dev_err(dev, "failed to add DSI device %d\n", ret);
>  		kfree(dsi);
>  		return ERR_PTR(ret);
>  	}
> 

-- 
Regards,

Laurent Pinchart
