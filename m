Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5844BA2D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 03:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419E26E5D5;
	Wed, 10 Nov 2021 02:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD346E8AD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 02:07:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636510026; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UTykqthGx7J/wYBF36U925g4w3yMNYE0twqFd2mbmJ0=;
 b=S8Xyk7LdU5kToK69NB5SwAg+rZYewEeNtw45KlIOU3oz+/PQfP2yXAs1kTcZQd0O1/EjptMO
 s9HZkfPx4kFh8ztiGRD0/yASkYz0AGBt7yyAbuzPRsBHZYrSkN2V3tcfhneMYnZfTh7lQeKB
 VEzyIGXwDQJqgCytxN4708sct5o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 618b293efacd20d795199721 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 02:06:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 40B03C43619; Wed, 10 Nov 2021 02:06:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F1E5EC4338F;
 Wed, 10 Nov 2021 02:06:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Nov 2021 18:06:52 -0800
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 20/22] drm/msm/dpu: fix smart dma support
In-Reply-To: <20210705012115.4179824-21-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-21-dmitry.baryshkov@linaro.org>
Message-ID: <d616a12acce1a525fb312f811a92840d@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> Downstream driver uses dpu->caps->smart_dma_rev to update
> sspp->cap->features with the bit corresponding to the supported 
> SmartDMA
> version. Upstream driver does not do this, resulting in SSPP subdriver
> not enbaling setup_multirect callback. Make SSPP subdriver check global
> smart_dma_rev to decide if setup_multirect should be enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Instead of this approach, we can OR the DPU_SSPP_SMART_DMA_* to the 
features list?

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  9 +++++----
>  3 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b8e0fece1f0b..d2321648b8d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -185,7 +185,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> +	.smart_dma_rev = DPU_SMART_DMA_V2,
>  	.ubwc_version = DPU_HW_UBWC_VER_20,
>  	.has_src_split = true,
>  	.has_dim_layer = true,
> @@ -203,7 +203,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0x9,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> +	.smart_dma_rev = DPU_SMART_DMA_V2,
>  	.ubwc_version = DPU_HW_UBWC_VER_20,
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
> @@ -217,7 +217,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
>  	.ubwc_version = DPU_HW_UBWC_VER_30,
>  	.has_src_split = true,
>  	.has_dim_layer = true,
> @@ -235,7 +235,7 @@ static const struct dpu_caps sm8250_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.smart_dma_rev = DPU_SMART_DMA_V2, /* TODO: v2.5 */
>  	.ubwc_version = DPU_HW_UBWC_VER_40,
>  	.has_src_split = true,
>  	.has_dim_layer = true,
> @@ -251,7 +251,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0x7,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
> +	.smart_dma_rev = DPU_SMART_DMA_V2,
>  	.ubwc_version = DPU_HW_UBWC_VER_30,
>  	.has_dim_layer = true,
>  	.has_idle_pc = true,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index f3c5aa3f4b3f..66d7b43c0019 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -70,6 +70,18 @@ enum {
>  	DPU_HW_UBWC_VER_40 = 0x400,
>  };
> 
> +/**
> + * SmartDMA support
> + * @DPU_SMART_DMA_UNSUPPORTED,   SmartDMA not support
> + * @DPU_SMART_DMA_V1,   SmartDMA 1.0 support
> + * @DPU_SMART_DMA_V2,   SmartDMA 2.0 support
> + */
> +enum {
> +	DPU_SMART_DMA_UNSUPPORTED,
> +	DPU_SMART_DMA_V1,
> +	DPU_SMART_DMA_V2,
> +};
> +
>  /**
>   * MDP TOP BLOCK features
>   * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per 
> pipe
> @@ -104,8 +116,6 @@ enum {
>   * @DPU_SSPP_QOS,            SSPP support QoS control, 
> danger/safe/creq
>   * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
>   * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
> - * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
> - * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
>   * @DPU_SSPP_TS_PREFILL      Supports prefill with traffic shaper
>   * @DPU_SSPP_TS_PREFILL_REC1 Supports prefill with traffic shaper 
> multirec
>   * @DPU_SSPP_CDP             Supports client driven prefetch
> @@ -124,8 +134,6 @@ enum {
>  	DPU_SSPP_QOS,
>  	DPU_SSPP_QOS_8LVL,
>  	DPU_SSPP_EXCL_RECT,
> -	DPU_SSPP_SMART_DMA_V1,
> -	DPU_SSPP_SMART_DMA_V2,
>  	DPU_SSPP_TS_PREFILL,
>  	DPU_SSPP_TS_PREFILL_REC1,
>  	DPU_SSPP_CDP,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 2be43d5a235a..f93cdeb08ac7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -648,7 +648,8 @@ static void dpu_hw_sspp_setup_cdp(struct 
> dpu_hw_pipe *ctx,
>  }
> 
>  static void _setup_layer_ops(struct dpu_hw_pipe *c,
> -		unsigned long features)
> +		unsigned long features,
> +		int smart_dma_rev)
>  {
>  	if (test_bit(DPU_SSPP_SRC, &features)) {
>  		c->ops.setup_format = dpu_hw_sspp_setup_format;
> @@ -669,8 +670,8 @@ static void _setup_layer_ops(struct dpu_hw_pipe *c,
>  		test_bit(DPU_SSPP_CSC_10BIT, &features))
>  		c->ops.setup_csc = dpu_hw_sspp_setup_csc;
> 
> -	if (test_bit(DPU_SSPP_SMART_DMA_V1, &c->cap->features) ||
> -		test_bit(DPU_SSPP_SMART_DMA_V2, &c->cap->features))
> +	if (smart_dma_rev == DPU_SMART_DMA_V1 ||
> +	    smart_dma_rev == DPU_SMART_DMA_V2)
>  		c->ops.setup_multirect = dpu_hw_sspp_setup_multirect;
> 
>  	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
> @@ -731,7 +732,7 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp 
> idx,
>  	hw_pipe->mdp = &catalog->mdp[0];
>  	hw_pipe->idx = idx;
>  	hw_pipe->cap = cfg;
> -	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
> +	_setup_layer_ops(hw_pipe, hw_pipe->cap->features,
> catalog->caps->smart_dma_rev);
> 
>  	return hw_pipe;
>  }
