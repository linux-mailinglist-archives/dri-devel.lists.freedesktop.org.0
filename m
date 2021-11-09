Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9344B3BA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8536E0FC;
	Tue,  9 Nov 2021 20:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8439F6E18F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:06:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636488401; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=0qpZdumH7UDsW2izS6M3tyL1Qg8q84i2R13GYtwCLgw=;
 b=qOEZ6lZhm+fu1D5re4hKASTnDvxD3vlcZNmwuwlK2Rr7RH1vwikwj2B6923dFx8/mhlChPCo
 iaP1P3ULq7FS/n0O73Z6anyO14PednA3u5XGGBM9OUPRze2RpB8cuMMasVWZlNxezyQiCHvs
 cJoZG3d7sitjxv3GShJky0uJIVE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 618ad4c79198e3b256440042 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 20:06:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DB297C43617; Tue,  9 Nov 2021 20:06:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 18DB2C4338F;
 Tue,  9 Nov 2021 20:06:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Nov 2021 12:06:30 -0800
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 15/22] drm/msm/dpu: simplify DPU_SSPP
 features checks
In-Reply-To: <20210705012115.4179824-16-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-16-dmitry.baryshkov@linaro.org>
Message-ID: <5ddd16ddb7270fe81582be12540852ef@codeaurora.org>
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
> Add DPU_SSPP_CSC_ANY denoting any CSC block. As we are at it, rewrite
> DPU_SSPP_SCALER (any scaler) to use BIT(x) instead of hand-coded
> bitshifts.
> 
This can go independent of the multi-rect series, so can you please take 
this with the
first half of the series which was going to be taken separately?

With that,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 +++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  3 +--
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 264a9d0d5fca..00098e33391e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -25,11 +25,17 @@ struct dpu_hw_pipe;
>  /**
>   * Define all scaler feature bits in catalog
>   */
> -#define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
> -	(1UL << DPU_SSPP_SCALER_QSEED2) | \
> -	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
> -	 (1UL << DPU_SSPP_SCALER_QSEED3LITE) | \
> -	  (1UL << DPU_SSPP_SCALER_QSEED4))
> +#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED2) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED3) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
> +			 BIT(DPU_SSPP_SCALER_QSEED4))
> +
> +/*
> + * Define all CSC feature bits in catalog
> + */
> +#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
> +			  BIT(DPU_SSPP_CSC_10BIT))
> 
>  /**
>   * Component indices
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 34ecd971cbbb..8ed7b8f0db69 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -983,8 +983,7 @@ static int dpu_plane_atomic_check(struct drm_plane 
> *plane,
> 
>  	if (DPU_FORMAT_IS_YUV(fmt) &&
>  		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> -		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
> -		 | BIT(DPU_SSPP_CSC_10BIT))))) {
> +		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
>  		DPU_DEBUG_PLANE(pdpu,
>  				"plane doesn't have scaler/csc for yuv\n");
>  		return -EINVAL;
