Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0B962947
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAB710E524;
	Wed, 28 Aug 2024 13:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VIdn+1S8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3976910E169
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:51:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A49F2C5;
 Wed, 28 Aug 2024 15:50:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724853000;
 bh=0JqbVVk8ZKB5BH0F3tvupNAmLRWvpSuhEZuWeLBjlQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VIdn+1S8BYJtynOyCu2LikSnR6kDI0dICtB47/5pEm0btk2jXBwQg0DkIzcyq7j3e
 n7sMOeMeJtcC7tkh59itW+VdVeUL3+y7QtJfaZhXcdzCUpvYB1Jxh6IXP+ASLFGdvb
 6/x1NjjWU8+ci7XCnXZB0jrGYST3e78AP94D1XVU=
Date: Wed, 28 Aug 2024 16:51:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] drm: zynqmp_dp: Use
 devm_platform_ioremap_resource_byname()
Message-ID: <20240828135103.GC27131@pendragon.ideasonboard.com>
References: <20240828084929.2527228-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828084929.2527228-1-ruanjinjie@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jinjie,

Thank you for the patch.

On Wed, Aug 28, 2024 at 04:49:29PM +0800, Jinjie Ruan wrote:
> platform_get_resource_byname() and devm_ioremap_resource() can be
> replaced by devm_platform_ioremap_resource_byname(), which can
> simplify the code logic a bit, No functional change here.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, feel free to push this to drm-misc.

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 129beac4c073..4eb19ac95bdb 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1715,7 +1715,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>  	struct platform_device *pdev = to_platform_device(dpsub->dev);
>  	struct drm_bridge *bridge;
>  	struct zynqmp_dp *dp;
> -	struct resource *res;
>  	int ret;
>  
>  	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
> @@ -1729,8 +1728,7 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>  	INIT_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
>  
>  	/* Acquire all resources (IOMEM, IRQ and PHYs). */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dp");
> -	dp->iomem = devm_ioremap_resource(dp->dev, res);
> +	dp->iomem = devm_platform_ioremap_resource_byname(pdev, "dp");
>  	if (IS_ERR(dp->iomem)) {
>  		ret = PTR_ERR(dp->iomem);
>  		goto err_free;

-- 
Regards,

Laurent Pinchart
