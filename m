Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E607D6C4557
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 09:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE0110E370;
	Wed, 22 Mar 2023 08:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF6D10E370
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 08:49:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068E9A58;
 Wed, 22 Mar 2023 09:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679474980;
 bh=6QZ1PsOMp+7W6iDxFRNuFgWGUQvAt/eYqNCv/Wjo14I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mzvCulRemaeNYC8FQXQhe6QvMW4vt/EtlPbKoN9ruDFQINnftCqvEZHq65a/cyc/t
 JvZaoW1BgyPT0S0IM2OjcT9CeM+wDOopSjbIs+2xMzMTGWvtTPo0qtF41ku6nVNka7
 bnNa3fEkkXVRaL+Akxm0kbscBLJWvbLHqO5T+uR8=
Date: Wed, 22 Mar 2023 10:49:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] drm: xlnx: zynqmp: Use dev_err_probe()
Message-ID: <20230322084946.GI20234@pendragon.ideasonboard.com>
References: <202303221625255005719@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202303221625255005719@zte.com.cn>
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
Cc: hyun.kwon@xilinx.com, michal.simek@xilinx.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ye,

Thank you for the patch.

On Wed, Mar 22, 2023 at 04:25:25PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 0a7b466446fb..c6c2cb4626b9 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1700,10 +1700,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> 
>  	dp->reset = devm_reset_control_get(dp->dev, NULL);
>  	if (IS_ERR(dp->reset)) {
> -		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
> -			dev_err(dp->dev, "failed to get reset: %ld\n",
> -				PTR_ERR(dp->reset));
> -		ret = PTR_ERR(dp->reset);
> +		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
> +				    "failed to get reset: %ld\n");

There's no format string argument anymore, so you should drop the
": %ld". Didn't the compiler warn about this ?

>  		goto err_free;
>  	}
> 

-- 
Regards,

Laurent Pinchart
