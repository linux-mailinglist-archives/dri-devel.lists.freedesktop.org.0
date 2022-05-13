Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18377526995
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 20:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667F710EC31;
	Fri, 13 May 2022 18:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAEF10EC31;
 Fri, 13 May 2022 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652467895; x=1684003895;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tLVEtdEKBeNKN8603d/dhWsWNCi3dfMTAtPKWGBHjdc=;
 b=RQBKHdiPL1BHIsznjsOjlGzSHqWbqU3Z11SgGpeNSp3o/Gc5udHOCL2O
 SqKgEe7oIaku3/MFgErIoVnwwW4ynGCBeY55QQFj6f7eyMgonupBriTw2
 0xbnokLt/L5iCjs/kB0ZOqk0NzcKXd65UXYP15vehqvEMOaqxtw9l/lYF o=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 13 May 2022 11:51:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 11:51:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 11:50:54 -0700
Received: from [10.38.247.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 13 May
 2022 11:50:52 -0700
Message-ID: <952f224a-e3a3-0f17-cd06-23b019b39346@quicinc.com>
Date: Fri, 13 May 2022 11:50:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 14/25] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-15-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-15-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
> dpu_hw_sspp_setup_rects() programs only source and destination
> rectangles.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This separation is logically correct, but there is another codepath 
using this.

_dpu_plane_color_fill() calls pdpu->pipe_hw->ops.setup_rects.

So for solid fill, I presume that stride getting programmed is 0 as
there is no buffer to fetch from.

But with this separation, we will miss re-programming stride and it will 
remain at the old value even for solid fil cases?

You might want to add setup_sourceaddress call there? But that wont make 
sense either because for solid fill there is nothing to fetch from.

Perhaps, another op for stride programming then?


> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
>   1 file changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 7194c14f87bc..2186506e6315 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -447,7 +447,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   {
>   	struct dpu_hw_pipe *ctx = pipe->sspp;
>   	struct dpu_hw_blk_reg_map *c;
> -	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
> +	u32 src_size, src_xy, dst_size, dst_xy;
>   	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
>   	u32 idx;
>   
> @@ -478,44 +478,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
>   	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
>   		drm_rect_width(&cfg->dst_rect);
>   
> -	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> -		ystride0 = (cfg->layout.plane_pitch[0]) |
> -			(cfg->layout.plane_pitch[1] << 16);
> -		ystride1 = (cfg->layout.plane_pitch[2]) |
> -			(cfg->layout.plane_pitch[3] << 16);
> -	} else {
> -		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
> -		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
> -
> -		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> -			ystride0 = (ystride0 & 0xFFFF0000) |
> -				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> -			ystride1 = (ystride1 & 0xFFFF0000)|
> -				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> -		} else {
> -			ystride0 = (ystride0 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[0] << 16) &
> -				 0xFFFF0000);
> -			ystride1 = (ystride1 & 0x0000FFFF) |
> -				((cfg->layout.plane_pitch[2] << 16) &
> -				 0xFFFF0000);
> -		}
> -	}
> -
>   	/* rectangle register programming */
>   	DPU_REG_WRITE(c, src_size_off + idx, src_size);
>   	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
>   	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
>   	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
> -
> -	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> -	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		struct dpu_hw_pipe_cfg *cfg)
>   {
>   	struct dpu_hw_pipe *ctx = pipe->sspp;
> +	u32 ystride0, ystride1;
>   	int i;
>   	u32 idx;
>   
> @@ -537,6 +511,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
>   		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
>   				cfg->layout.plane_addr[2]);
>   	}
> +
> +	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
> +		ystride0 = (cfg->layout.plane_pitch[0]) |
> +			(cfg->layout.plane_pitch[1] << 16);
> +		ystride1 = (cfg->layout.plane_pitch[2]) |
> +			(cfg->layout.plane_pitch[3] << 16);
> +	} else {
> +		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
> +		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
> +
> +		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> +			ystride0 = (ystride0 & 0xFFFF0000) |
> +				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
> +			ystride1 = (ystride1 & 0xFFFF0000)|
> +				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
> +		} else {
> +			ystride0 = (ystride0 & 0x0000FFFF) |
> +				((cfg->layout.plane_pitch[0] << 16) &
> +				 0xFFFF0000);
> +			ystride1 = (ystride1 & 0x0000FFFF) |
> +				((cfg->layout.plane_pitch[2] << 16) &
> +				 0xFFFF0000);
> +		}
> +	}
> +
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
> +	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
>   }
>   
>   static void dpu_hw_sspp_setup_csc(struct dpu_hw_pipe *ctx,
