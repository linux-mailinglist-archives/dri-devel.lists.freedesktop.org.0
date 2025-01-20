Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46302A16D32
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4410E40A;
	Mon, 20 Jan 2025 13:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3E510E406
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:15:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 34FBD201E9;
 Mon, 20 Jan 2025 14:15:15 +0100 (CET)
Date: Mon, 20 Jan 2025 14:15:13 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v5 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
Message-ID: <6n655caflr2snsgmqtmpzxt4jynrwjqdjurnixujfuefldxhxj@uunzpzfezfqy>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-01-18 00:00:51, Jun Nie wrote:
> There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> interface to 3rd PP instead of the 2nd PP.

Can you explain why this patch uses the number of LMs, instead of dividing the
number of PPs divided by the number of physical encoders?  This detail is not
explained at all, or that we're filling hw_lm now for no other reason.

- Marijn

> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 018a1a49ca7d1..b0cab3ccbb57c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_ctl, num_pp, num_dsc;
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>  	}
>  
> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +
> +
> +	/*
> +	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
> +	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> +	 */
> +	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
> +
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
>  
> -		phys->hw_pp = dpu_enc->hw_pp[i];
> +		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
>  		if (!phys->hw_pp) {
>  			DPU_ERROR_ENC(dpu_enc,
>  				"no pp block assigned at idx: %d\n", i);
> 
> -- 
> 2.34.1
> 
