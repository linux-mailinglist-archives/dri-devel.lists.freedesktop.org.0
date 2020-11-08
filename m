Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E4A2AAA82
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 11:12:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9896E155;
	Sun,  8 Nov 2020 10:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B81E6E155
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 10:12:31 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CECD3804F6;
 Sun,  8 Nov 2020 11:12:28 +0100 (CET)
Date: Sun, 8 Nov 2020 11:12:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] drm: xlnx: Use dma_request_chan for DMA channel request
Message-ID: <20201108101227.GD1129714@ravnborg.org>
References: <20201023094602.5630-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023094602.5630-1-peter.ujfalusi@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=4ucCiA6Z2YONicSglYkA:9 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: hyun.kwon@xilinx.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter.

On Fri, Oct 23, 2020 at 12:46:02PM +0300, Peter Ujfalusi wrote:
> There is no need to use the of_dma_request_slave_channel() directly as
> dma_request_chan() is going to try to get the channel via OF as well.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

I took a look at this and agree on your analysis.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect the maintainers to pick up this patch.

	Sam

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 98bd48f13fd1..a4405d081aca 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -28,7 +28,6 @@
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_dma.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
> @@ -1316,8 +1315,7 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
>  
>  		snprintf(dma_channel_name, sizeof(dma_channel_name),
>  			 "%s%u", dma_names[layer->id], i);
> -		dma->chan = of_dma_request_slave_channel(disp->dev->of_node,
> -							 dma_channel_name);
> +		dma->chan = dma_request_chan(disp->dev, dma_channel_name);
>  		if (IS_ERR(dma->chan)) {
>  			dev_err(disp->dev, "failed to request dma channel\n");
>  			ret = PTR_ERR(dma->chan);
> -- 
> Peter
> 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
