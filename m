Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDC6F9993
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 18:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F3810E1D6;
	Sun,  7 May 2023 16:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFF710E1D6
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 16:00:46 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2C4803F1C4;
 Sun,  7 May 2023 18:00:44 +0200 (CEST)
Date: Sun, 7 May 2023 18:00:42 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Message-ID: <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-05 14:23:50, Jessica Zhang wrote:
> Add DATA_COMPRESS feature flag to DPU INTF block.
> 
> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> PINGPONG to INTF.
> 
> As core_rev (and related macros) was removed from the dpu_kms struct, the
> most straightforward way to indicate the presence of this register would be
> to have a feature flag.

Irrelevant.  Even though core_rev was still in mainline until recently,
we always hardcoded the features in the catalog and only used core_rev
to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
then enable feature Y" logic, this manually-enabled feature flag is the
only, correct way to do it.

> Changes in v2:
> - Changed has_data_compress dpu_cap to a DATA_COMPRESS INTF feature flag
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 7944481d0a33..c74051906d05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -104,7 +104,7 @@
>  #define INTF_SC7180_MASK \
>  	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>  
> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)

Konrad: Your SM6350/SM6375 series v3 [1] switched from INTF_SC7180_MASK
to INTF_SC7280_MASK to enable HCTL on SM6375, but that will now
erroneously also receive this feature flag and write the new
DATA_COMPESS mask even if it's DPU 6.9 (< 7.x where it got added).

[1]: https://lore.kernel.org/linux-arm-msm/80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org/T/#u

Depending on who lands first, this flag should be split.

I still see value in inlining and removing these defines, though that
brings a host of other complexity.

- Marijn

>  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>  			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 4eda2cc847ef..01c65f940f2a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -185,6 +185,7 @@ enum {
>   * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>   *                                  than video timing
>   * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>   * @DPU_INTF_MAX
>   */
>  enum {
> @@ -192,6 +193,7 @@ enum {
>  	DPU_INTF_TE,
>  	DPU_DATA_HCTL_EN,
>  	DPU_INTF_STATUS_SUPPORTED,
> +	DPU_INTF_DATA_COMPRESS,
>  	DPU_INTF_MAX
>  };
>  
> 
> -- 
> 2.40.1
> 
