Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903978BFBA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 09:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4664389316;
	Tue, 29 Aug 2023 07:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023789316
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 07:55:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07AD5814;
 Tue, 29 Aug 2023 09:53:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693295638;
 bh=5cOP94qqNrBgULFveKFc6IAw0bc5znHNNLQmUntqGqY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=epDqz0rYTM79JJFNPghEPnAZECaeIptNdG22y6KsZn6/+oCj7WR4QLIxqKvdj/pIx
 l4QYVZm25sLhJepBsUO19vIzJYhOesPPsY+n3UnTy53iQTUB6NFSsHOh2rQqoNzMHK
 Rbv21DUlAQmqtHfUj2oUw/0WY92CYnMAQwwjqL1s=
Date: Tue, 29 Aug 2023 10:55:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] drm: xlnx: zynqmp_dpsub: Use
 devm_clk_get_enabled() helper function
Message-ID: <20230829075529.GB4698@pendragon.ideasonboard.com>
References: <20230825072324.2809260-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230825072324.2809260-1-ruanjinjie@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jinjie,

(CC'ing Tomi)

Thank you for the patch.

On Fri, Aug 25, 2023 at 03:23:24PM +0800, Jinjie Ruan wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.

While this indeed simplifies the code, I think we should instead control
the clock dynamically at runtime.

I don't have access to the hardware at the moment. Tomi, would you be
able to give this a go ? I can also write a patch and let you test it if
desired.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 88eb33acd5f0..92e61434473f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -92,16 +92,10 @@ unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub)
>  
>  static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
>  {
> -	int ret;
> -
> -	dpsub->apb_clk = devm_clk_get(dpsub->dev, "dp_apb_clk");
> -	if (IS_ERR(dpsub->apb_clk))
> -		return PTR_ERR(dpsub->apb_clk);
> -
> -	ret = clk_prepare_enable(dpsub->apb_clk);
> -	if (ret) {
> +	dpsub->apb_clk = devm_clk_get_enabled(dpsub->dev, "dp_apb_clk");
> +	if (IS_ERR(dpsub->apb_clk)) {
>  		dev_err(dpsub->dev, "failed to enable the APB clock\n");
> -		return ret;
> +		return PTR_ERR(dpsub->apb_clk);
>  	}
>  
>  	/*
> @@ -274,7 +268,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
>  	zynqmp_dp_remove(dpsub);
>  err_pm:
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dpsub->apb_clk);
>  err_mem:
>  	of_reserved_mem_device_release(&pdev->dev);
>  	if (!dpsub->drm)
> @@ -295,7 +288,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
>  	zynqmp_dp_remove(dpsub);
>  
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(dpsub->apb_clk);
>  	of_reserved_mem_device_release(&pdev->dev);
>  
>  	if (!dpsub->drm)

-- 
Regards,

Laurent Pinchart
