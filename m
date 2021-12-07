Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F3346C42D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BEB6EE19;
	Tue,  7 Dec 2021 20:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17856E58B;
 Tue,  7 Dec 2021 20:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638907590; x=1670443590;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3exB8zaRsZebxfq+UlLKDo2IIRoEok+rbXxYWjF5Yfo=;
 b=VaPXG2eQRAuLb4LPDW+EqkLcE0zr2k+TaL78KzMG08iNydiRRcFY1zMy
 6GE2UXZ3r8XqGoXdhU5VZHaYOVWlo33XAhjen9YH2HJNitBU9wbg/363l
 632AfwnRTxmQSZj5/238ZJov4Lzztc/fXFpT/iXwLr8Euw5VLWHsn1o2S k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 07 Dec 2021 12:06:30 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:06:29 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 7 Dec 2021 12:06:29 -0800
Received: from [10.111.164.126] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 7 Dec 2021
 12:06:26 -0800
Message-ID: <743671e8-9e6b-2786-1da2-2ec9f09cf2b6@quicinc.com>
Date: Tue, 7 Dec 2021 12:06:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: fix CDP setup to account for
 multirect index
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
 <20211201225140.2481577-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201225140.2481577-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/2021 2:51 PM, Dmitry Baryshkov wrote:
> Client driven prefetch (CDP) is properly setup only for SSPP REC0
> currently. Enable client driven prefetch also for SSPP REC1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 12 ++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 +-
>   3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 7235605bfc9e..75aa47835214 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -75,6 +75,7 @@
>   #define SSPP_TRAFFIC_SHAPER                0x130
>   #define SSPP_CDP_CNTL                      0x134
>   #define SSPP_UBWC_ERROR_STATUS             0x138
> +#define SSPP_CDP_CNTL_REC1                 0x13c
>   #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
>   #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
>   #define SSPP_TRAFFIC_SHAPER_REC1           0x158
> @@ -624,10 +625,12 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
>   }
>   
>   static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cdp_cfg *cfg)
> +		struct dpu_hw_pipe_cdp_cfg *cfg,
> +		enum dpu_sspp_multirect_index index)
>   {
>   	u32 idx;
>   	u32 cdp_cntl = 0;
> +	u32 cdp_cntl_offset = 0;
>   
>   	if (!ctx || !cfg)
>   		return;
> @@ -635,6 +638,11 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
>   	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
>   		return;
>   
> +	if (index == DPU_SSPP_RECT_SOLO || index == DPU_SSPP_RECT_0)
> +		cdp_cntl_offset = SSPP_CDP_CNTL;
> +	else
> +		cdp_cntl_offset = SSPP_CDP_CNTL_REC1;
> +
>   	if (cfg->enable)
>   		cdp_cntl |= BIT(0);
>   	if (cfg->ubwc_meta_enable)
> @@ -644,7 +652,7 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
>   	if (cfg->preload_ahead == DPU_SSPP_CDP_PRELOAD_AHEAD_64)
>   		cdp_cntl |= BIT(3);
>   
> -	DPU_REG_WRITE(&ctx->hw, SSPP_CDP_CNTL, cdp_cntl);
> +	DPU_REG_WRITE(&ctx->hw, cdp_cntl_offset, cdp_cntl);
>   }
>   
>   static void _setup_layer_ops(struct dpu_hw_pipe *c,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 3c53bd03bdeb..227b09fa4689 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -356,9 +356,11 @@ struct dpu_hw_sspp_ops {
>   	 * setup_cdp - setup client driven prefetch
>   	 * @ctx: Pointer to pipe context
>   	 * @cfg: Pointer to cdp configuration
> +	 * @index: rectangle index in multirect
>   	 */
>   	void (*setup_cdp)(struct dpu_hw_pipe *ctx,
> -			struct dpu_hw_pipe_cdp_cfg *cfg);
> +			struct dpu_hw_pipe_cdp_cfg *cfg,
> +			enum dpu_sspp_multirect_index index);
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 911f5f0b41d8..1134171f4d1c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1191,7 +1191,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   					DPU_FORMAT_IS_TILE(fmt);
>   			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
>   
> -			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg);
> +			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
>   		}
>   	}
>   
> 
