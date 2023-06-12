Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D172D4D7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 01:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA21010E2CE;
	Mon, 12 Jun 2023 23:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B353710E2CB;
 Mon, 12 Jun 2023 23:11:45 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 25EFF201B1;
 Tue, 13 Jun 2023 01:11:41 +0200 (CEST)
Date: Tue, 13 Jun 2023 01:11:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks found on
 sdm845
Message-ID: <vwd7khwlh2kn2nyrw5jm3sy4lm4hm4nweksg76cezvxnnybgoc@jjvtfaxufslb>
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
 <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-12 21:25:34, Dmitry Baryshkov wrote:
> Add definitions of DSPP blocks present on the sdm845 platform. This
> should enable color-management on sdm845-bassed devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

And with this, the CTM property is back on SDM845 and functions as
intended: I am able to set a color transformation of choice with a
quickly-pieced-together DRM utility:

    https://github.com/MarijnS95/drm-tools

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 36ea1af10894..b6098141bb9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>  
>  static const struct dpu_lm_cfg sdm845_lm[] = {
>  	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>  	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>  	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> +		&sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
>  	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
> +		&sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
>  	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>  	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>  
> +static const struct dpu_dspp_cfg sdm845_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
>  static const struct dpu_pingpong_cfg sdm845_pp[] = {
>  	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
>  	.sspp = sdm845_sspp,
>  	.mixer_count = ARRAY_SIZE(sdm845_lm),
>  	.mixer = sdm845_lm,
> +	.dspp_count = ARRAY_SIZE(sdm845_dspp),
> +	.dspp = sdm845_dspp,
>  	.pingpong_count = ARRAY_SIZE(sdm845_pp),
>  	.pingpong = sdm845_pp,
>  	.dsc_count = ARRAY_SIZE(sdm845_dsc),
> -- 
> 2.39.2
> 
