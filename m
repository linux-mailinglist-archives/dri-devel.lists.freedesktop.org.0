Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB295207A9
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 00:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE3210F0F4;
	Mon,  9 May 2022 22:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA05310F0F1;
 Mon,  9 May 2022 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652135426; x=1683671426;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=txrlFWqiGdkiALrcSI2wR/yr/MIiFo2lpP8fu+2tkI8=;
 b=KVPVV9PWBL9fdFgUtc6wxvLyFUHSYYF5Qe4HX8cztGRCM7smOEHWJcCr
 Tpeg63OGx7YvOhQQmpYR+Ef7lzsWwVRZ4ZSNgJFQhgEJfYPCC0pdy3L27
 lzoSuXG5SvZIiL5OrUZh6WRsP5ree9QW0flr8mahSFVAieR2VWozeHDso A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 May 2022 15:30:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 15:30:26 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 15:30:25 -0700
Received: from [10.111.163.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 9 May 2022
 15:30:23 -0700
Message-ID: <0fa56e8f-a169-e342-a670-89dc48ac3cdc@quicinc.com>
Date: Mon, 9 May 2022 15:30:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 13/25] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-14-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-14-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> There is no need to pass full dpu_hw_pipe_cfg instance to
> _dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
>   3 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index d8120168f974..7194c14f87bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
>   }
>   
>   static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cfg *sspp,
> -		void *scaler_cfg)

This change does two things:

1) pass fmt and stop passing dpu_hw_pipe_cfg
2) change the scaler_cfg from void to struct dpu_hw_scaler3_cfg

So it seems like we had this void casting to allow different versions of 
the scaler to be passed and based on catalog bits the appropriate 
structs can be used (scaler2/scaler3)

In the current DPU we have only scaler3. For that reason this is fine.

I do not know what versions of scaler we will support in DPU.

Do you think we can retain the void casting in this change and just 
change passing the format?



> +		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +		const struct dpu_format *format)
>   {
>   	u32 idx;
> -	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
>   
> -	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
> +	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
>   		|| !scaler3_cfg)
>   		return;
>   
>   	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
>   			ctx->cap->sblk->scaler_blk.version,
> -			sspp->layout.format);
> +			format);
>   }
>   
>   static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 74171fb4e585..eee8501ea80d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -334,13 +334,12 @@ struct dpu_hw_sspp_ops {
>   
>   	/**
>   	 * setup_scaler - setup scaler
> -	 * @ctx: Pointer to pipe context
> -	 * @pipe_cfg: Pointer to pipe configuration
>   	 * @scaler_cfg: Pointer to scaler configuration
> +	 * @format: pixel format parameters
>   	 */
>   	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
> -		struct dpu_hw_pipe_cfg *pipe_cfg,
> -		void *scaler_cfg);
> +		struct dpu_hw_scaler3_cfg *scaler3_cfg,
> +		const struct dpu_format *format);
>   
>   	/**
>   	 * get_scaler_ver - get scaler h/w version
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3ce7dcc285e2..e9421fa2fb2e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -646,8 +646,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
>   	if (pipe_hw->ops.setup_scaler &&
>   			pipe->multirect_index != DPU_SSPP_RECT_1)
>   		pipe_hw->ops.setup_scaler(pipe_hw,
> -				pipe_cfg,
> -				&scaler3_cfg);
> +				&scaler3_cfg,
> +				fmt);
>   }
>   
>   /**
