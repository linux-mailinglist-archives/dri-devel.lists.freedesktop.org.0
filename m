Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A03558AADD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 14:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BADB5562;
	Fri,  5 Aug 2022 12:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18573B54BB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 12:24:16 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 364211F697;
 Fri,  5 Aug 2022 14:24:14 +0200 (CEST)
Date: Fri, 5 Aug 2022 14:24:06 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
Message-ID: <20220805122406.x7xxywofeaquhfxg@SoMainline.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-05 14:56:30, Dmitry Baryshkov wrote:
> The commit 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master
> components") changed the MDP5 driver to look for the interconnect paths
> in the MDSS device rather than in the MDP5 device itself. This was left
> unnoticed since on my testing devices the interconnects probably didn't
> reach the sync state.
> 
> Rather than just using the MDP5 device for ICC path lookups for the MDP5
> devices, introduce an additional helper to check both MDP5/DPU and MDSS
> nodes. This will be helpful for the MDP5->DPU conversion, since the
> driver will have to check both nodes.
> 
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On sdm630

But I'm not sure about giving my Reviewed-by to this, as I'd rather
*correct* the DT bindings for sdm630 and msm8996 to provide
interconnects in the MDSS node unless there are strong reasons not to
(and I don't consider "backwards compatibility" to be one, this binding
"never even existed" if mdp5.txt is to be believed).

- Marijn

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  7 ++-----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  9 +++------
>  drivers/gpu/drm/msm/msm_drv.h            |  2 ++
>  drivers/gpu/drm/msm/msm_io_utils.c       | 22 ++++++++++++++++++++++
>  4 files changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e23e2552e802..9eff6c2b1917 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -383,12 +383,9 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
>  	struct icc_path *path1;
>  	struct drm_device *dev = dpu_kms->dev;
>  	struct device *dpu_dev = dev->dev;
> -	struct device *mdss_dev = dpu_dev->parent;
>  
> -	/* Interconnects are a part of MDSS device tree binding, not the
> -	 * MDP/DPU device. */
> -	path0 = of_icc_get(mdss_dev, "mdp0-mem");
> -	path1 = of_icc_get(mdss_dev, "mdp1-mem");
> +	path0 = msm_icc_get(dpu_dev, "mdp0-mem");
> +	path1 = msm_icc_get(dpu_dev, "mdp1-mem");
>  
>  	if (IS_ERR_OR_NULL(path0))
>  		return PTR_ERR_OR_ZERO(path0);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3d5621a68f85..b0c372fef5d5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -921,12 +921,9 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>  
>  static int mdp5_setup_interconnect(struct platform_device *pdev)
>  {
> -	/* Interconnects are a part of MDSS device tree binding, not the
> -	 * MDP5 device. */
> -	struct device *mdss_dev = pdev->dev.parent;
> -	struct icc_path *path0 = of_icc_get(mdss_dev, "mdp0-mem");
> -	struct icc_path *path1 = of_icc_get(mdss_dev, "mdp1-mem");
> -	struct icc_path *path_rot = of_icc_get(mdss_dev, "rotator-mem");
> +	struct icc_path *path0 = msm_icc_get(&pdev->dev, "mdp0-mem");
> +	struct icc_path *path1 = msm_icc_get(&pdev->dev, "mdp1-mem");
> +	struct icc_path *path_rot = msm_icc_get(&pdev->dev, "rotator-mem");
>  
>  	if (IS_ERR(path0))
>  		return PTR_ERR(path0);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 08388d742d65..d38510f6dbf5 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -441,6 +441,8 @@ void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
>  		phys_addr_t *size);
>  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name);
>  
> +struct icc_path *msm_icc_get(struct device *dev, const char *name);
> +
>  #define msm_writel(data, addr) writel((data), (addr))
>  #define msm_readl(addr) readl((addr))
>  
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 7b504617833a..d02cd29ce829 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -5,6 +5,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <linux/interconnect.h>
> +
>  #include "msm_drv.h"
>  
>  /*
> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>  	work->worker = worker;
>  	kthread_init_work(&work->work, fn);
>  }
> +
> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
> +{
> +	struct device *mdss_dev = dev->parent;
> +	struct icc_path *path;
> +
> +	path = of_icc_get(dev, name);
> +	if (path)
> +		return path;
> +
> +	/*
> +	 * If there are no interconnects attached to the corresponding device
> +	 * node, of_icc_get() will return NULL.
> +	 *
> +	 * If the MDP5/DPU device node doesn't have interconnects, lookup the
> +	 * path in the parent (MDSS) device.
> +	 */
> +	return of_icc_get(mdss_dev, name);
> +
> +}
> -- 
> 2.35.1
> 
