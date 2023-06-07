Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B5725331
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 07:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB4310E420;
	Wed,  7 Jun 2023 05:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5F610E420
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 05:07:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126233170111.36.openmobile.ne.jp
 [126.233.170.111])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2292E75B;
 Wed,  7 Jun 2023 07:06:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686114403;
 bh=OY3A9j7LWxOtGxybg39w2drC3GWF5OQYZWWDTDkqIl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e+qzQQ5Ms+6pyd+JJuGtTCMUTlrdpkI66ZpoUc0G0AIVMadYFeM6oErtqYj5rfk4r
 gj2PIIrbvDaabOh/tJ7w7tq4MBacAjZffFdzBjj2pAcdOcn4apUQjywT3SyHjLGkfN
 v59wNOfHzqgPxm4LuMifva0ZC55wPCBWEdVeCin0=
Date: Wed, 7 Jun 2023 08:07:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Add missing check for
 dma_set_mask
Message-ID: <20230607050705.GF14101@pendragon.ideasonboard.com>
References: <20230607020529.22934-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230607020529.22934-1-jiasheng@iscas.ac.cn>
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
Cc: hyun.kwon@xilinx.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Jiasheng,

Thank you for the patch.

On Wed, Jun 07, 2023 at 10:05:29AM +0800, Jiasheng Jiang wrote:
> Add check for dma_set_mask() and return the error if it fails.
> 
> Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index bab862484d42..068413be6527 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -227,7 +227,9 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	dpsub->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, dpsub);
>  
> -	dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
> +	ret = dma_set_mask(dpsub->dev, DMA_BIT_MASK(ZYNQMP_DISP_MAX_DMA_BIT));
> +	if (ret)
> +		return ret;

This seems reasonable.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, would you be able to quickly test this ?

>  
>  	/* Try the reserved memory. Proceed if there's none. */
>  	of_reserved_mem_device_init(&pdev->dev);

-- 
Regards,

Laurent Pinchart
