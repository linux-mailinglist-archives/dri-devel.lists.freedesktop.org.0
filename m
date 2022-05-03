Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CCF5191F0
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170E410F467;
	Tue,  3 May 2022 22:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4631210F467;
 Tue,  3 May 2022 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651618562; x=1683154562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/bXc6PmLSiya/35ATiW+XNjyJ5gHOb7yWo93Qqu4O6k=;
 b=CYbZ8l1kJz1qcSuThk7SXSEZMsjXG4i68HaTFu5X7CBg+dUklhDkUIvD
 GBmcvullm0ai5qJEfSxnb1TlNJnDK0uYIhP1ofm1m0QIuZYF94KnUacw8
 nYrnqOheWdsc4QoSMt8ltgyWDo1p3zZxaobKceHANOEgZwuXRt9IIjaKu s=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 03 May 2022 15:56:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 15:56:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 15:56:00 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 15:55:58 -0700
Message-ID: <dd2daa5e-9d72-9b07-82f3-e163fef0f42f@quicinc.com>
Date: Tue, 3 May 2022 15:55:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 06/25] drm/msm/dpu: inline dpu_plane_get_ctl_flush
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-7-dmitry.baryshkov@linaro.org>
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
> There is no need to keep a separate function for calling into the ctl if
> we already know all the details. Inline this function in the dpu_crtc.c
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 15 ++++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  9 ---------
>   3 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7318bd45637a..5fc338ef3460 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -348,7 +348,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct dpu_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> -	u32 flush_mask;
>   	uint32_t stage_idx, lm_idx;
>   	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
>   	bool bg_alpha_enable = false;
> @@ -356,6 +355,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   	memset(fetch_active, 0, sizeof(fetch_active));
>   	drm_atomic_crtc_for_each_plane(plane, crtc) {
> +		enum dpu_sspp sspp_idx;
> +
>   		state = plane->state;
>   		if (!state)
>   			continue;
> @@ -363,14 +364,14 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		pstate = to_dpu_plane_state(state);
>   		fb = state->fb;
>   
> -		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
> -		set_bit(dpu_plane_pipe(plane), fetch_active);
> +		sspp_idx = dpu_plane_pipe(plane);
> +		set_bit(sspp_idx, fetch_active);
>   
>   		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
>   				crtc->base.id,
>   				pstate->stage,
>   				plane->base.id,
> -				dpu_plane_pipe(plane) - SSPP_VIG0,
> +				sspp_idx - SSPP_VIG0,
>   				state->fb ? state->fb->base.id : -1);
>   
>   		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> @@ -380,13 +381,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   		stage_idx = zpos_cnt[pstate->stage]++;
>   		stage_cfg->stage[pstate->stage][stage_idx] =
> -					dpu_plane_pipe(plane);
> +					sspp_idx;
>   		stage_cfg->multirect_index[pstate->stage][stage_idx] =
>   					pstate->multirect_index;
>   
>   		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>   					   state, pstate, stage_idx,
> -					   dpu_plane_pipe(plane) - SSPP_VIG0,
> +					   sspp_idx - SSPP_VIG0,
>   					   format->base.pixel_format,
>   					   fb ? fb->modifier : 0);
>   
> @@ -395,7 +396,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
>   						pstate, format);
>   
> -			mixer[lm_idx].flush_mask |= flush_mask;
> +			mixer[lm_idx].flush_mask |= ctl->ops.get_bitmask_sspp(ctl, sspp_idx);
>   
>   			if (bg_alpha_enable && !format->alpha_enable)
>   				mixer[lm_idx].mixer_op_mode = 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0247ff8a67a2..ca194cd83cd0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -849,18 +849,6 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
>   	return 0;
>   }
>   
> -/**
> - * dpu_plane_get_ctl_flush - get control flush for the given plane
> - * @plane: Pointer to drm plane structure
> - * @ctl: Pointer to hardware control driver
> - * @flush_sspp: Pointer to sspp flush control word
> - */
> -void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
> -		u32 *flush_sspp)
> -{
> -	*flush_sspp = ctl->ops.get_bitmask_sspp(ctl, dpu_plane_pipe(plane));
> -}
> -
>   static int dpu_plane_prepare_fb(struct drm_plane *plane,
>   		struct drm_plane_state *new_state)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 42b88b6bc9c2..aa9478b475d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -61,15 +61,6 @@ struct dpu_multirect_plane_states {
>    */
>   enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
>   
> -/**
> - * dpu_plane_get_ctl_flush - get control flush mask
> - * @plane:   Pointer to DRM plane object
> - * @ctl: Pointer to control hardware
> - * @flush_sspp: Pointer to sspp flush control word
> - */
> -void dpu_plane_get_ctl_flush(struct drm_plane *plane, struct dpu_hw_ctl *ctl,
> -		u32 *flush_sspp);
> -
>   /**
>    * dpu_plane_flush - final plane operations before commit flush
>    * @plane: Pointer to drm plane structure
