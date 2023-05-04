Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D226F70D8
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061C788DE5;
	Thu,  4 May 2023 17:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DFA10E052;
 Thu,  4 May 2023 17:28:19 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1C82B20C3D;
 Thu,  4 May 2023 19:28:15 +0200 (CEST)
Date: Thu, 4 May 2023 19:28:14 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v5 4/7] drm/msm/dpu: Introduce PINGPONG_NONE to
 disconnect DSC from PINGPONG
Message-ID: <j6fllkmd4e75hss6dwxdiiu4keocknt5zg2iu6jgj5nsfku6d6@5ec25ecgpvva>
References: <1683218805-23419-1-git-send-email-quic_khsieh@quicinc.com>
 <1683218805-23419-5-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683218805-23419-5-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-04 09:46:42, Kuogee Hsieh wrote:
> Disabling the crossbar mux between DSC and PINGPONG currently
> requires a bogus enum dpu_pingpong value to be passed when calling
> dsc_bind_pingpong_blk() with enable=false, even though the register
> value written is independent of the current PINGPONG block.  Replace
> that `bool enable` parameter with a new PINGPONG_NONE dpu_pingpong
> flag that triggers the write of the "special" 0xF "crossbar
> disabled" value to the register instead.
> 
> Changes in v4:
> -- more details to commit text
> 
> Changes in v5:
> -- rewording commit text suggested by Marijn
> -- add DRM_DEBUG_KMS for DSC unbinding case
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for bearing with all the comments thus far!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 15 ++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  |  1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 ++-
>  4 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index cf1de5d..ffa6f04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1850,7 +1850,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>  		hw_pp->ops.setup_dsc(hw_pp);
>  
>  	if (hw_dsc->ops.dsc_bind_pingpong_blk)
> -		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, hw_pp->idx);
>  
>  	if (hw_pp->ops.enable_dsc)
>  		hw_pp->ops.enable_dsc(hw_pp);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 4a6bbcc..47cb9f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -157,7 +157,6 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
>  
>  static void dpu_hw_dsc_bind_pingpong_blk(
>  		struct dpu_hw_dsc *hw_dsc,
> -		bool enable,
>  		const enum dpu_pingpong pp)
>  {
>  	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> @@ -166,14 +165,16 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>  
>  	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
>  
> -	if (enable)
> +	if (pp)
>  		mux_cfg = (pp - PINGPONG_0) & 0x7;
>  
> -	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
> -			enable ? "Binding" : "Unbinding",
> -			hw_dsc->idx - DSC_0,
> -			enable ? "to" : "from",
> -			pp - PINGPONG_0);
> +	if (pp)
> +		DRM_DEBUG_KMS("Binding dsc:%d to pp:%d\n",
> +				hw_dsc->idx - DSC_0,
> +				pp - PINGPONG_0);
> +	else
> +		DRM_DEBUG_KMS("Unbinding dsc:%d from any pp\n",
> +				hw_dsc->idx - DSC_0);
>  
>  	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index 287ec5f..138080a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -44,7 +44,6 @@ struct dpu_hw_dsc_ops {
>  				  struct drm_dsc_config *dsc);
>  
>  	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
> -				  bool enable,
>  				  enum dpu_pingpong pp);
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 1913a19..02a0f48 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -191,7 +191,8 @@ enum dpu_dsc {
>  };
>  
>  enum dpu_pingpong {
> -	PINGPONG_0 = 1,
> +	PINGPONG_NONE,
> +	PINGPONG_0,
>  	PINGPONG_1,
>  	PINGPONG_2,
>  	PINGPONG_3,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
