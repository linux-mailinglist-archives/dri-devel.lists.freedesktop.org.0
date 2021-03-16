Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED933DED3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 21:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2B6E440;
	Tue, 16 Mar 2021 20:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E676E440
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 20:32:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CCEAD8B;
 Tue, 16 Mar 2021 21:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615926776;
 bh=k8tM2NOiK7JhC0RBT3aIvWY7N+SOv2q0Ygeh8ZxmVgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qZTzTvYeM+dB5B60dksSpa+fn2RM+0k4ySkkysvbX+Tv8Qy/f9uzFIG+wqFIGGVpd
 TEPzHoJu9vDzN2aVAvvKjqOzgQaD0jA177OSiT3JJfXs7s6Qp2R1697Mt5KfSfoDwq
 +Bv2Jd6lpWoTfVv45j2RH/OOYwdCb3USFDETF+Os=
Date: Tue, 16 Mar 2021 22:32:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: quanyang.wang@windriver.com
Subject: Re: [PATCH] drm: xlnx: call pm_runtime_get_sync before setting pixel
 clock
Message-ID: <YFEV1ehZfivgBoKn@pendragon.ideasonboard.com>
References: <20210310045945.3034364-1-quanyang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310045945.3034364-1-quanyang.wang@windriver.com>
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

On Wed, Mar 10, 2021 at 12:59:45PM +0800, quanyang.wang@windriver.com wrote:
> From: Quanyang Wang <quanyang.wang@windriver.com>
> 
> The Runtime PM subsystem will force the device "fd4a0000.zynqmp-display"
> to enter suspend state while booting if the following conditions are met:
> - the usage counter is zero (pm_runtime_get_sync hasn't been called yet)
> - no 'active' children (no zynqmp-dp-snd-xx node under dpsub node)
> - no other device in the same power domain (dpdma node has no
> 		"power-domains = <&zynqmp_firmware PD_DP>" property)
> 
> So there is a scenario as below:
> 1) DP device enters suspend state   <- call zynqmp_gpd_power_off
> 2) zynqmp_disp_crtc_setup_clock	    <- configurate register VPLL_FRAC_CFG
> 3) pm_runtime_get_sync		    <- call zynqmp_gpd_power_on and clear previous
> 				       VPLL_FRAC_CFG configuration
> 4) clk_prepare_enable(disp->pclk)   <- enable failed since VPLL_FRAC_CFG
> 				       configuration is corrupted
> 
> From above, we can see that pm_runtime_get_sync may clear register
> VPLL_FRAC_CFG configuration and result the failure of clk enabling.
> Putting pm_runtime_get_sync at the very beginning of the function
> zynqmp_disp_crtc_atomic_enable can resolve this issue.

Isn't this an issue in the firmware though, which shouldn't clear the
previous VPLLF_FRAC_CFG ?

> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>

Nonetheless, this change looks good to me, I actually had the same patch
in my tree while investigation issues related to the clock rate, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I was hoping it would solve the issue I'm experiencing with the DP
clock, but that's not the case :-( In a nutshell, when the DP is first
started, the clock frequency is incorrect. The following quick & dirty
patch fixes the problem:

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 74ac0a064eb5..fdbe1b0640aa 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1439,6 +1439,10 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,

 	pm_runtime_get_sync(disp->dev);

+	ret = clk_prepare_enable(disp->pclk);
+	if (!ret)
+		clk_disable_unprepare(disp->pclk);
+
 	zynqmp_disp_crtc_setup_clock(crtc, adjusted_mode);

 	ret = clk_prepare_enable(disp->pclk);

The problem doesn't seem to be in the kernel, but on the TF-A or PMU
firmware side. Have you experienced this by any chance ?

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 148add0ca1d6..909e6c265406 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1445,9 +1445,10 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
>  	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
>  	int ret, vrefresh;
>  
> +	pm_runtime_get_sync(disp->dev);
> +
>  	zynqmp_disp_crtc_setup_clock(crtc, adjusted_mode);
>  
> -	pm_runtime_get_sync(disp->dev);
>  	ret = clk_prepare_enable(disp->pclk);
>  	if (ret) {
>  		dev_err(disp->dev, "failed to enable a pixel clock\n");

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
