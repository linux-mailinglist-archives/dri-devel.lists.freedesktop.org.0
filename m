Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC556EA4E7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8310EDB4;
	Fri, 21 Apr 2023 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51D10EDB4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 07:35:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 67E053ED5F;
 Fri, 21 Apr 2023 09:35:55 +0200 (CEST)
Date: Fri, 21 Apr 2023 09:35:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: stop mapping the regdma region
Message-ID: <cwy7eyop2heahqvlijp6a66acwhpfcg6feq2khfw2detul6fxk@qnkhj4iwo23k>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
 <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420222558.1208887-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-21 01:25:58, Dmitry Baryshkov wrote:
> Stop mapping the regdma region. The driver does not support regdma.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Should you add a third patch to remove this from dt-bindings?
(msm8998 has it in both dpu and mdss files)

Regardless, the patch itself is:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..28d74d4d2c1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1033,12 +1033,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		DPU_DEBUG("VBIF NRT is not defined");
>  	}
>  
> -	dpu_kms->reg_dma = msm_ioremap_quiet(dpu_kms->pdev, "regdma");
> -	if (IS_ERR(dpu_kms->reg_dma)) {
> -		dpu_kms->reg_dma = NULL;
> -		DPU_DEBUG("REG_DMA is not defined");
> -	}
> -
>  	dpu_kms_parse_data_bus_icc_path(dpu_kms);
>  
>  	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index aca39a4689f4..15111e433f21 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -71,7 +71,7 @@ struct dpu_kms {
>  	const struct dpu_mdss_cfg *catalog;
>  
>  	/* io/register spaces: */
> -	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
> +	void __iomem *mmio, *vbif[VBIF_MAX];
>  
>  	struct regulator *vdd;
>  	struct regulator *mmagic;
> -- 
> 2.39.2
> 
