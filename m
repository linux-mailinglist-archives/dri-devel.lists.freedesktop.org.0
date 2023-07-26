Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A176398E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F5510E485;
	Wed, 26 Jul 2023 14:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CE110E485
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:50:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13814440;
 Wed, 26 Jul 2023 16:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690382995;
 bh=MQfRZf/H3BgoNNCWVRlZoYaGK5CIedLjl0BElcFRs4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F9uAPYx7aHrGamXP/wlIEBWZOhnPqw0qofifXN2Mcmn8KRZOYkTipsPYbk/KtetDO
 9Eq66WgWqcuwdAMvsSXgbfbhDvD7ligUVvBYcjGMgPxW+rsMjk3TPyvnhsn0mEv2It
 zNiSbCOZgAwrCOrxRLsSrRh0eH/LG09r+U0DaRnE=
Date: Wed, 26 Jul 2023 17:51:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wang Ming <machel@vivo.com>
Subject: Re: [PATCH v2] gpu: drm: Use dev_err_probe instead of dev_err
Message-ID: <20230726145100.GB5148@pendragon.ideasonboard.com>
References: <20230726115806.5702-1-machel@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726115806.5702-1-machel@vivo.com>
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
Cc: opensource.kernel@vivo.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang,

Thank you for the patch.

On Wed, Jul 26, 2023 at 07:57:56PM +0800, Wang Ming wrote:
> It is possible that dma_request_chan will return EPROBE_DEFER,
> which means that disp->dev is not ready yet. In this case,
> dev_err(disp->dev), there will be no output. This patch fixes the bug.

It's not a bug. The existing code works as expected. dev_err_probe() is
nicer though, as it records the reason for the probe deferral. Here's a
proposal for a better commit message:

  It is possible that dma_request_chan() returns EPROBE_DEFER, in which
  case the driver defers probing without printing any message. Use
  dev_err_probe() to record the probe deferral cause and ease debugging.

> Signed-off-by: Wang Ming <machel@vivo.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 3b87eebddc97..676f09fe8594 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1094,8 +1094,8 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
>  			 "%s%u", dma_names[layer->id], i);
>  		dma->chan = dma_request_chan(disp->dev, dma_channel_name);
>  		if (IS_ERR(dma->chan)) {
> -			dev_err(disp->dev, "failed to request dma channel\n");
> -			ret = PTR_ERR(dma->chan);
> +			ret = dev_err_probe(disp->dev, PTR_ERR(dma->chan),
> +				"failed to request dma channel\n");

The alignment is wrong, this should be

			ret = dev_err_probe(disp->dev, PTR_ERR(dma->chan),
					    "failed to request dma channel\n");

If you're fine with those changes, I can fix this locally, there's no
need to resubmit.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			dma->chan = NULL;
>  			return ret;
>  		}

-- 
Regards,

Laurent Pinchart
