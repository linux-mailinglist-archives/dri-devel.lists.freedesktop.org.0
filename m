Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEE06F3A5E
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011C410E335;
	Mon,  1 May 2023 22:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D0710E335
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 22:17:47 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6BFB340E5C;
 Tue,  2 May 2023 00:17:45 +0200 (CEST)
Date: Tue, 2 May 2023 00:17:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/4] drm/msm/dpu: use PINGPONG_NONE for LMs with no PP
 attached
Message-ID: <alkcwa7qrqtwjxis4eish5aiqcp5o5uanlpo26gjhk76fx7spj@pcv7ibcnrdvo>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430203556.3184252-4-dmitry.baryshkov@linaro.org>
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

On 2023-04-30 23:35:55, Dmitry Baryshkov wrote:
> On msm8998/sdm845 some LM blocks do not have corresponding PINGPONG
> block. Currently the driver uses PINGPONG_MAX for such cases. Switch
> that to use PINGPONG_NONE instead, which is more logical.

dpu_lm_cfg::pingpong still has a doc-comment stating that PINGPONG_MAX
is to be used if this is unsupported, that should be updated to read
PINGPONG_NONE as well.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Good cleanup otherwise:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h             | 3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index bdcd554fc8a8..6ae30f806ebc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -104,9 +104,9 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>  	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
>  		&msm8998_lm_sblk, PINGPONG_2, LM_5, 0),
>  	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
> -		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> +		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
>  	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
> -		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
> +		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
>  	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
>  		&msm8998_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index ceca741e93c9..4a94fd9b64a9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -102,9 +102,9 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
>  	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
>  	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> +		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>  	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
> +		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>  	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 2d9192a6ce00..56826a92c155 100644
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
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index d5a06628885e..bf7b8e7c45b1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -117,7 +117,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_mixer *hw;
>  		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>  
> -		if (lm->pingpong == PINGPONG_MAX) {
> +		if (lm->pingpong == PINGPONG_NONE) {
>  			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
>  			continue;
>  		}
> -- 
> 2.39.2
> 
