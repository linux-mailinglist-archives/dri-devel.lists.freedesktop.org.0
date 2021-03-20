Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5C9342F73
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 21:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225D76E0D0;
	Sat, 20 Mar 2021 20:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD856E0D0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 20:09:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB6908D3;
 Sat, 20 Mar 2021 21:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616270980;
 bh=54YnA6l0786MMgUPy84Ruh3n0/JWV766Jm/XCuHtZkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eail8CqSdt10yknT3xISYwD++Hce7WTsNdJeFK6jv0EG5UdaNab56PMyp7aubFBSN
 Sa75AooJS4DIWWkk9l2OfIz05s6qcoRhxsIOjYJ0kvF7BIH5NKKvsqR2roKdHz4ZTK
 oBWbsRUmtbKfBTBwSonoD70beeIHxiLj1rYLpktg=
Date: Sat, 20 Mar 2021 22:08:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: quanyang.wang@windriver.com
Subject: Re: [PATCH] drm: xlnx: zynqmp: release reset to DP controller before
 accessing DP registers
Message-ID: <YFZWW8IPhVff/VkS@pendragon.ideasonboard.com>
References: <20210320083739.724246-1-quanyang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210320083739.724246-1-quanyang.wang@windriver.com>
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Quanyang,

Thank you for the patch.

On Sat, Mar 20, 2021 at 04:37:39PM +0800, quanyang.wang@windriver.com wrote:
> From: Quanyang Wang <quanyang.wang@windriver.com>
> 
> When insmod zynqmp-dpsub.ko after rmmod it, system will hang with the
> error log as below:
> 
> root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
> [   88.391289] [drm] Initialized zynqmp-dpsub 1.0.0 20130509 for fd4a0000.display on minor 0
> [   88.529906] Console: switching to colour frame buffer device 128x48
> [   88.549402] zynqmp-dpsub fd4a0000.display: [drm] fb0: zynqmp-dpsubdrm frame buffer device
> [   88.571624] zynqmp-dpsub fd4a0000.display: ZynqMP DisplayPort Subsystem driver probed
> root@xilinx-zynqmp:~# rmmod zynqmp_dpsub
> [   94.023404] Console: switching to colour dummy device 80x25
> root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
> 	<hang here>
> 
> This is because that in zynqmp_dp_probe it tries to access some DP
> registers while the DP controller is still in the reset state. When
> running "rmmod zynqmp_dpsub", zynqmp_dp_reset(dp, true) in
> zynqmp_dp_phy_exit is called to force the DP controller into the reset
> state. Then insmod will call zynqmp_dp_probe to write to the DP registers,
> but at this moment the DP controller isn't brought out of the reset state
> since the function zynqmp_dp_reset(dp, false) is called later and this
> will result the system hang.
> 
> Releasing the reset to DP controller before any read/write operation to it
> will fix this issue.
> 
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 99158ee67d02..bb45b3663d6b 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -402,10 +402,6 @@ static int zynqmp_dp_phy_init(struct zynqmp_dp *dp)
>  		}
>  	}
>  
> -	ret = zynqmp_dp_reset(dp, false);
> -	if (ret < 0)
> -		return ret;
> -
>  	zynqmp_dp_clr(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
>  
>  	/*
> @@ -1682,6 +1678,10 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
>  		return PTR_ERR(dp->reset);
>  	}
>  
> +	ret = zynqmp_dp_reset(dp, false);
> +	if (ret < 0)
> +		return ret;
> +

This change looks good to me.

>  	ret = zynqmp_dp_phy_probe(dp);
>  	if (ret)
>  		return ret;

But shouldn't we call zynqmp_dp_reset(dp, true) here ? Or rather, call
it in the error path at the end of the function, with a goto label.

For symmetry, should we also move the zynqmp_dp_reset() call from
zynqmp_dp_phy_exit() to zynqmp_dp_remove() ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
