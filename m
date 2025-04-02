Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9BA78F00
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B5210E783;
	Wed,  2 Apr 2025 12:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p+NQD2PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C4810E783
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:50:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA8163B;
 Wed,  2 Apr 2025 14:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743598102;
 bh=seEcfsTx/2axYLwPT5YXHyXv+dAslO1ezGacxvR5VHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p+NQD2PD8PiA3RJhi7tyR7HaK5qJrm5RVlw6DEqp4nPt/pn08/DJEkLOqExnzuto+
 RUQSRPX6PgKd+D/v1ASa1EVrzqEn7FWNPxNG3tMPIIqWhkqmRSkJkw6Mnj62Hzl+H5
 n3SZJFRMETsYmMR2QNreddDMFnLLwc3ypynaMvOk=
Date: Wed, 2 Apr 2025 15:49:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: shao.mingyin@zte.com.cn
Cc: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, zhang.enpei@zte.com.cn
Subject: Re: [PATCH linux-next 2/2] gpu: drm: xlnx: zynqmp_dp: Use
 dev_err_probe()
Message-ID: <20250402124951.GA13762@pendragon.ideasonboard.com>
References: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
 <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
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

On Wed, Apr 02, 2025 at 07:38:52PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index a6a4a871f197..28efa4c7ec8e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2466,10 +2466,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> 
>  	dp->reset = devm_reset_control_get(dp->dev, NULL);
>  	if (IS_ERR(dp->reset)) {
> -		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
> -			dev_err(dp->dev, "failed to get reset: %ld\n",
> -				PTR_ERR(dp->reset));
> -		ret = PTR_ERR(dp->reset);
> +		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
> +				    "failed to get reset\n");
>  		goto err_free;
>  	}
> 

-- 
Regards,

Laurent Pinchart
