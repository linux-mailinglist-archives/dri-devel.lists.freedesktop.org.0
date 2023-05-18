Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F27708878
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 21:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7698A10E549;
	Thu, 18 May 2023 19:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8A410E549
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:40:45 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 448AB203AE;
 Thu, 18 May 2023 21:40:44 +0200 (CEST)
Date: Thu, 18 May 2023 21:40:43 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 3/4] drm/msm/dpu: remove GC and IGC related code from
 dpu catalog
Message-ID: <cwnoowgglhlsx7357sddgonyohj7vj3z23bqlgleaskozzpcu2@nnyxzzzyhgem>
References: <20230428223646.23595-1-quic_abhinavk@quicinc.com>
 <20230428223646.23595-3-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428223646.23595-3-quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-28 15:36:45, Abhinav Kumar wrote:
> Gamma Correction (GC) and Inverse Gamma Correction(IGC) is
> currently unused. In addition dpu_dspp_sub_blks didn't even have an igc
> member describing the block.
> 
> Drop related code from the dpu hardware catalog otherwise this becomes a
> burden to carry across chipsets in the catalog.
> 
> changes in v3:
> 	- drop IGC related code from dpu_hw_catalog too
> 	- update commit text accordingly
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 10 ----------
>  2 files changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5d994bce696f..791a6fc8bdbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -91,7 +91,7 @@
>  
>  #define MERGE_3D_SM8150_MASK (0)
>  
> -#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)

Oops we weren't even using parenthesis here before...

> +#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
>  
>  #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>  
> @@ -449,8 +449,6 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
>  static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
>  	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
>  		.len = 0x90, .version = 0x10007},
> -	.gc = { .id = DPU_DSPP_GC, .base = 0x17c0,
> -		.len = 0x90, .version = 0x10007},
>  };
>  
>  static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd56fd7..1230739e37d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -127,13 +127,9 @@ enum {
>  /**
>   * DSPP sub-blocks
>   * @DPU_DSPP_PCC             Panel color correction block
> - * @DPU_DSPP_GC              Gamma correction block
> - * @DPU_DSPP_IGC             Inverse gamma correction block
>   */
>  enum {
>  	DPU_DSPP_PCC = 0x1,
> -	DPU_DSPP_GC,
> -	DPU_DSPP_IGC,
>  	DPU_DSPP_MAX
>  };
>  
> @@ -398,7 +394,6 @@ struct dpu_caps {
>   * @hsic:
>   * @memcolor:
>   * @pcc_blk:
> - * @igc_blk:
>   * @format_list: Pointer to list of supported formats
>   * @num_formats: Number of supported formats
>   * @virt_format_list: Pointer to list of supported formats for virtual planes
> @@ -419,7 +414,6 @@ struct dpu_sspp_sub_blks {
>  	struct dpu_pp_blk hsic_blk;
>  	struct dpu_pp_blk memcolor_blk;
>  	struct dpu_pp_blk pcc_blk;
> -	struct dpu_pp_blk igc_blk;
>  
>  	const u32 *format_list;
>  	u32 num_formats;
> @@ -433,22 +427,18 @@ struct dpu_sspp_sub_blks {
>   * @maxwidth:               Max pixel width supported by this mixer
>   * @maxblendstages:         Max number of blend-stages supported
>   * @blendstage_base:        Blend-stage register base offset
> - * @gc: gamma correction block
>   */
>  struct dpu_lm_sub_blks {
>  	u32 maxwidth;
>  	u32 maxblendstages;
>  	u32 blendstage_base[MAX_BLOCKS];
> -	struct dpu_pp_blk gc;
>  };
>  
>  /**
>   * struct dpu_dspp_sub_blks: Information of DSPP block
> - * @gc : gamma correction block
>   * @pcc: pixel color correction block
>   */
>  struct dpu_dspp_sub_blks {
> -	struct dpu_pp_blk gc;
>  	struct dpu_pp_blk pcc;
>  };
>  
> -- 
> 2.40.1
> 
