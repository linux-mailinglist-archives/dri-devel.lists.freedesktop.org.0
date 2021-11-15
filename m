Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C14500F0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609A36E453;
	Mon, 15 Nov 2021 09:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63776E453
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 09:14:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68509D3E;
 Mon, 15 Nov 2021 10:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967679;
 bh=Mqu9AjHOXNqVwePLKX9nbSoWI9lixf+/xad48n+NCXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmpIYw6iL+QGg/jQfPaAXjxBhbT8ed5+LXpS9Vfki8On0XIjUU+Fxa8QV1Z77Uq7z
 y6IDsVjB8zbvUKldzAH2W1BEVsA/FZvp6/ibJRVnAxSdL6j4sHfh4FyJeHP6WjIk0w
 BufJuEgiIHtwCFssoB38BxxBci3DM0+P7P/jbs7w=
Date: Mon, 15 Nov 2021 11:14:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-9-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

Thank you for the patch.

On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The display driver wants to pass a custom flag to the DMA engine driver,
> which it started doing by using the slave_id field that was traditionally
> used for a different purpose.
> 
> As there is no longer a correct use for the slave_id field, it should
> really be removed, and the remaining users changed over to something
> different.
> 
> The new mechanism for passing nonstandard settings is using the
> .peripheral_config field, so use that to pass a newly defined structure
> here, making it clear that this will not work in portable drivers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma/xilinx/xilinx_dpdma.c  | 12 ++++++++----
>  drivers/gpu/drm/xlnx/zynqmp_disp.c |  9 +++++++--
>  include/linux/dma/xilinx_dpdma.h   | 11 +++++++++++
>  3 files changed, 26 insertions(+), 6 deletions(-)
>  create mode 100644 include/linux/dma/xilinx_dpdma.h
> 
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index ce5c66e6897d..e2c1ef7a659c 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -12,6 +12,7 @@
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> +#include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dmapool.h>
>  #include <linux/interrupt.h>
> @@ -1273,6 +1274,7 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
>  			       struct dma_slave_config *config)
>  {
>  	struct xilinx_dpdma_chan *chan = to_xilinx_chan(dchan);
> +	struct xilinx_dpdma_peripheral_config *pconfig;
>  	unsigned long flags;
>  
>  	/*
> @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
>  	spin_lock_irqsave(&chan->lock, flags);
>  
>  	/*
> -	 * Abuse the slave_id to indicate that the channel is part of a video
> -	 * group.
> +	 * Abuse the peripheral_config to indicate that the channel is part

Is it still an abuse, or is this now the right way to pass custom data
to the DMA engine driver ?

> +	 * of a video group.
>  	 */
> -	if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> -		chan->video_group = config->slave_id != 0;
> +	pconfig = config->peripheral_config;

This could be moved to the variable declaration above, up to you.

> +	if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> +	    config->peripheral_size == sizeof(*pconfig))

Silently ignoring a size mismatch isn't nice. Could we validate the size
at the beginning of the function and return an error ?

With these issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		chan->video_group = pconfig->video_group;
>  
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ff2b308d8651..11c409cbc88e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -24,6 +24,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
> @@ -1058,14 +1059,18 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
>  
>  	/*
> -	 * Set slave_id for each DMA channel to indicate they're part of a
> +	 * Set pconfig for each DMA channel to indicate they're part of a
>  	 * video group.
>  	 */
>  	for (i = 0; i < info->num_planes; i++) {
>  		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
> +		struct xilinx_dpdma_peripheral_config pconfig = {
> +			.video_group = true,
> +		};
>  		struct dma_slave_config config = {
>  			.direction = DMA_MEM_TO_DEV,
> -			.slave_id = 1,
> +			.peripheral_config = &pconfig,
> +			.peripheral_size = sizeof(pconfig),
>  		};
>  
>  		dmaengine_slave_config(dma->chan, &config);
> diff --git a/include/linux/dma/xilinx_dpdma.h b/include/linux/dma/xilinx_dpdma.h
> new file mode 100644
> index 000000000000..83a1377f03f8
> --- /dev/null
> +++ b/include/linux/dma/xilinx_dpdma.h
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef __LINUX_DMA_XILINX_DPDMA_H
> +#define __LINUX_DMA_XILINX_DPDMA_H
> +
> +#include <linux/types.h>
> +
> +struct xilinx_dpdma_peripheral_config {
> +	bool video_group;
> +};
> +
> +#endif /* __LINUX_DMA_XILINX_DPDMA_H */

-- 
Regards,

Laurent Pinchart
