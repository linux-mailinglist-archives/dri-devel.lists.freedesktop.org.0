Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C3C53BE1E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 20:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094291134F2;
	Thu,  2 Jun 2022 18:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641FE1134EE;
 Thu,  2 Jun 2022 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654195035; x=1685731035;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aHEi0AO+PmDGD3hdImy3VGvU6eGoBNn9tzeMNX3phaE=;
 b=Tf11EaTg4AGTXAy0Iu4CqvWTp+h3DcaTtp505xUJqJ6iZ4T/PQ8jPmtb
 H0k3OzbEDvEqE534clj57BGu580HA9PtbrTHY8bOSEAZE6h2ShAoDpd8r
 dM/v7q13R8ZEeJiRhgVwatOAgQLNMGvS69FdetAgeGTHtWC9+fhOSykfM k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 02 Jun 2022 11:37:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 11:37:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 11:37:13 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 11:37:11 -0700
Message-ID: <4a041600-5ff2-9f95-52c9-ebd5f1f10a81@quicinc.com>
Date: Thu, 2 Jun 2022 11:37:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/7] drm/msm/dpu: use feature bit for LM combined alpha
 check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> Rather than checking hwversion, follow the usual patter and add special
> bit to the lm->features to check whether the LM has combined or separate
> alpha registers. While we are at it, rename
> dpu_hw_lm_setup_blend_config_sdm845() to
> dpu_hw_lm_setup_blend_config_combined_alpha().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 17 ++++++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      |  6 +++---
>   3 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 400ebceb56bb..78c7d987c2ca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -50,9 +50,12 @@
>   #define DMA_CURSOR_MSM8998_MASK \
>   	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
>   
> -#define MIXER_SDM845_MASK \
> +#define MIXER_MSM8998_MASK \
>   	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
>   
> +#define MIXER_SDM845_MASK \
> +	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
> +
>   #define MIXER_SC7180_MASK \
>   	(BIT(DPU_DIM_LAYER))
>   
> @@ -936,17 +939,17 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
>   };
>   
>   static const struct dpu_lm_cfg msm8998_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
>   		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
>   		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
>   		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
>   		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
>   		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
>   		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 8cb6d1f25bf9..80bc09b1f1b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -145,6 +145,7 @@ enum {
>    * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
>    * @DPU_MIXER_GC              Gamma correction block
>    * @DPU_DIM_LAYER             Layer mixer supports dim layer
> + * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
>    * @DPU_MIXER_MAX             maximum value
>    */
>   enum {
> @@ -152,6 +153,7 @@ enum {
>   	DPU_MIXER_SOURCESPLIT,
>   	DPU_MIXER_GC,
>   	DPU_DIM_LAYER,
> +	DPU_MIXER_COMBINED_ALPHA,
>   	DPU_MIXER_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 462f5082099e..25d2eba28e71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -148,7 +148,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>   	return 0;
>   }
>   
> -static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
> +static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
>   	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
>   {
>   	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -204,8 +204,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
>   		unsigned long features)
>   {
>   	ops->setup_mixer_out = dpu_hw_lm_setup_out;
> -	if (m->hwversion >= DPU_HW_VER_400)
> -		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
> +	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
> +		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;

This will not work for all chipsets.

In the catalog you have added BIT(DPU_MIXER_COMBINED_ALPHA) only for 
MIXER_SDM845_MASK but MIXER_SC7180_MASK is not updated.

HW version of sc7180 is > DPU_HW_VER_400 so this would break both sc7180 
and sc7280.

Please update all the relevant chipset masks.

>   	else
>   		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
>   	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
