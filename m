Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AE776BF80
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859AC10E421;
	Tue,  1 Aug 2023 21:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEAE10E421
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:47:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A52D58D;
 Tue,  1 Aug 2023 23:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1690926381;
 bh=rvxTV1SCXgOAEIkRLL4HkAnQE1NZjTm0D0Hq8mQie2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NqZjrLchhTI0b6vkjvPTG64e1zRK5/RotWlt4sndx2vAjXvc4nmsXsu9T0KYPjQ2z
 DwxA1HIkqEPQKPmxIm2eJDDwbQAX21Xf20kbUESTpXmF+GTtwkTK31Zm8X6ojBLu6J
 Rap5mxONFDiYZHFiZgW5wbaycJm4t9GUfr+xFz8M=
Date: Wed, 2 Aug 2023 00:47:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Li Zetao <lizetao1@huawei.com>
Subject: Re: [PATCH -next] drm: xlnx: zynqmp_dpsub: Use
 devm_platform_ioremap_resource_byname()
Message-ID: <20230801214729.GF8578@pendragon.ideasonboard.com>
References: <20230801083220.3892883-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230801083220.3892883-1-lizetao1@huawei.com>
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
Cc: linux-arm-kernel@lists.infradead.org, michal.simek@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Li,

Thank you for the patch.

On Tue, Aug 01, 2023 at 04:32:20PM +0800, Li Zetao wrote:
> Convert platform_get_resource_byname() + devm_ioremap_resource() to a
> single call to devm_platform_ioremap_resource_byname(), as this is
> exactly what this function does.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 3b87eebddc97..2b731f3eea54 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1228,7 +1228,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>  {
>  	struct platform_device *pdev = to_platform_device(dpsub->dev);
>  	struct zynqmp_disp *disp;
> -	struct resource *res;
>  	int ret;
>  
>  	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
> @@ -1238,22 +1237,19 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
>  	disp->dev = &pdev->dev;
>  	disp->dpsub = dpsub;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "blend");
> -	disp->blend.base = devm_ioremap_resource(disp->dev, res);
> +	disp->blend.base = devm_platform_ioremap_resource_byname(pdev, "blend");
>  	if (IS_ERR(disp->blend.base)) {
>  		ret = PTR_ERR(disp->blend.base);
>  		goto error;
>  	}
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "av_buf");
> -	disp->avbuf.base = devm_ioremap_resource(disp->dev, res);
> +	disp->avbuf.base = devm_platform_ioremap_resource_byname(pdev, "av_buf");
>  	if (IS_ERR(disp->avbuf.base)) {
>  		ret = PTR_ERR(disp->avbuf.base);
>  		goto error;
>  	}
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aud");
> -	disp->audio.base = devm_ioremap_resource(disp->dev, res);
> +	disp->audio.base = devm_platform_ioremap_resource_byname(pdev, "aud");
>  	if (IS_ERR(disp->audio.base)) {
>  		ret = PTR_ERR(disp->audio.base);
>  		goto error;

-- 
Regards,

Laurent Pinchart
