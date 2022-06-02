Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9E53C14E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE855113CD8;
	Thu,  2 Jun 2022 23:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4F2113CD4;
 Thu,  2 Jun 2022 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654212412; x=1685748412;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ivezjXpweXckUKpAvrheexSbMjYk3O5ebUbCjNb52/c=;
 b=cr4PVYWr6rMFbp3k8LmuWDXgorrje4qw2Y580ec+ByHhK/Iv4TF1Enaq
 tExihs+JH39F6bt2MfEXfZRSGdQfYh+6kDfN1ZsMVN+c9aItkNmZ64Aaw
 qY5Z8d9Hv/XMaDGXHsX9UQanCpk978Gqt0owZa7RhojLddU+bTGVe5ZGm s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 16:26:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 16:26:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 16:26:51 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 16:26:48 -0700
Message-ID: <0824b797-0547-eb5a-f901-025b34d3e295@quicinc.com>
Date: Thu, 2 Jun 2022 16:26:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v4 1/7] drm/msm/dpu: use feature bit for LM
 combined alpha check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
 <20220602202447.1755115-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602202447.1755115-2-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 1:24 PM, Dmitry Baryshkov wrote:
> Rather than checking hwversion, follow the usual patter and add special
> bit to the lm->features to check whether the LM has combined or separate
> alpha registers. While we are at it, rename
> dpu_hw_lm_setup_blend_config_sdm845() to
> dpu_hw_lm_setup_blend_config_combined_alpha().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 19 +++++++++++--------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  6 +++---
>   3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 400ebceb56bb..c3759fc4b154 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -50,11 +50,14 @@
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
> -	(BIT(DPU_DIM_LAYER))
> +	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
>   #define PINGPONG_SDM845_MASK BIT(DPU_PINGPONG_DITHER)
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
>   	else
>   		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
>   	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
