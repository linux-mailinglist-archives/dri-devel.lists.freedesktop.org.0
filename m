Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2114519175
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8210ED4B;
	Tue,  3 May 2022 22:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E30810ED4B;
 Tue,  3 May 2022 22:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651617168; x=1683153168;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AxWxmioqdorPaxsMswuzhsp6LssExKJjddmcccN1vlc=;
 b=AP5dOhl8zl9TFxpogHZSzIQ1Ezvg1uthpdv3WF91rekn1K48nv9+cUlR
 S3dOBpnkKGpXXlqbFja0yRmG1WDTjs5jE2AaLUj01+QBryA7huzk2VAm4
 anVvrzAiwWiubWAHqEGc0pDjhIwrKrDzlxeHfxCeh28jsAPSKr8cPnYeg g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 03 May 2022 15:32:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 15:32:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 15:32:46 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 3 May 2022
 15:32:43 -0700
Message-ID: <368f0587-2c34-034c-ee00-b41ab6d01f66@quicinc.com>
Date: Tue, 3 May 2022 15:32:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 05/25] drm/msm/dpu: move pipe_hw to dpu_plane_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-6-dmitry.baryshkov@linaro.org>
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
> In preparation to adding fully virtualized planes, move struct
> dpu_hw_pipe instance from struct dpu_plane to struct dpu_plane_state, as
> it will become a part of state (allocated during atomic check) rather
> than part of a plane (allocated during boot).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 104 ++++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   2 +
>   2 files changed, 58 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 37742f74a7bf..0247ff8a67a2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -100,7 +100,6 @@ struct dpu_plane {
>   
>   	enum dpu_sspp pipe;
>   
> -	struct dpu_hw_pipe *pipe_hw;
>   	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
> @@ -300,6 +299,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	const struct dpu_format *fmt = NULL;
>   	u64 qos_lut;
>   	u32 total_fl = 0, lut_usage;
> @@ -331,7 +331,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   			fmt ? (char *)&fmt->base.pixel_format : NULL,
>   			pdpu->is_rt_pipe, total_fl, qos_lut);
>   
> -	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
> +	pstate->pipe_hw->ops.setup_creq_lut(pstate->pipe_hw, qos_lut);
>   }
>   
>   /**
> @@ -343,6 +343,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   		struct drm_framebuffer *fb)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	const struct dpu_format *fmt = NULL;
>   	u32 danger_lut, safe_lut;
>   
> @@ -382,7 +383,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   		danger_lut,
>   		safe_lut);
>   
> -	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
> +	pstate->pipe_hw->ops.setup_danger_safe_lut(pstate->pipe_hw,
>   			danger_lut, safe_lut);
>   }
>   
> @@ -396,14 +397,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   	bool enable, u32 flags)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
>   
>   	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
>   
>   	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
> -		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
> +		pipe_qos_cfg.creq_vblank = pstate->pipe_hw->cap->sblk->creq_vblank;
>   		pipe_qos_cfg.danger_vblank =
> -				pdpu->pipe_hw->cap->sblk->danger_vblank;
> +				pstate->pipe_hw->cap->sblk->danger_vblank;
>   		pipe_qos_cfg.vblank_en = enable;
>   	}
>   
> @@ -429,7 +431,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   		pipe_qos_cfg.danger_vblank,
>   		pdpu->is_rt_pipe);
>   
> -	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
> +	pstate->pipe_hw->ops.setup_qos_ctrl(pstate->pipe_hw,
>   			&pipe_qos_cfg);
>   }
>   
> @@ -443,18 +445,19 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>   		struct drm_crtc *crtc, struct dpu_hw_pipe_cfg *pipe_cfg)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_vbif_set_ot_params ot_params;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	memset(&ot_params, 0, sizeof(ot_params));
> -	ot_params.xin_id = pdpu->pipe_hw->cap->xin_id;
> -	ot_params.num = pdpu->pipe_hw->idx - SSPP_NONE;
> +	ot_params.xin_id = pstate->pipe_hw->cap->xin_id;
> +	ot_params.num = pstate->pipe_hw->idx - SSPP_NONE;
>   	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>   	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>   	ot_params.is_wfd = !pdpu->is_rt_pipe;
>   	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
>   	ot_params.vbif_idx = VBIF_RT;
> -	ot_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
> +	ot_params.clk_ctrl = pstate->pipe_hw->cap->clk_ctrl;
>   	ot_params.rd = true;
>   
>   	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
> @@ -467,14 +470,15 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>   static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_vbif_set_qos_params qos_params;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	memset(&qos_params, 0, sizeof(qos_params));
>   	qos_params.vbif_idx = VBIF_RT;
> -	qos_params.clk_ctrl = pdpu->pipe_hw->cap->clk_ctrl;
> -	qos_params.xin_id = pdpu->pipe_hw->cap->xin_id;
> -	qos_params.num = pdpu->pipe_hw->idx - SSPP_VIG0;
> +	qos_params.clk_ctrl = pstate->pipe_hw->cap->clk_ctrl;
> +	qos_params.xin_id = pstate->pipe_hw->cap->xin_id;
> +	qos_params.num = pstate->pipe_hw->idx - SSPP_VIG0;
>   	qos_params.is_rt = pdpu->is_rt_pipe;
>   
>   	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
> @@ -501,11 +505,11 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
>   		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>   	else if (ret)
>   		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> -	else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
> -		trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
> +	else if (pstate->pipe_hw->ops.setup_sourceaddress) {
> +		trace_dpu_plane_set_scanout(pstate->pipe_hw->idx,
>   					    &pipe_cfg->layout,
>   					    pstate->multirect_index);
> -		pdpu->pipe_hw->ops.setup_sourceaddress(pdpu->pipe_hw, pipe_cfg,
> +		pstate->pipe_hw->ops.setup_sourceaddress(pstate->pipe_hw, pipe_cfg,
>   						pstate->multirect_index);
>   	}
>   }
> @@ -549,7 +553,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   			scale_cfg->src_height[i] /= chroma_subsmpl_v;
>   		}
>   
> -		if (pdpu->pipe_hw->cap->features &
> +		if (pstate->pipe_hw->cap->features &
>   			BIT(DPU_SSPP_SCALER_QSEED4)) {
>   			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>   			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> @@ -609,6 +613,7 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>   
>   static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
>   {
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
>   	const struct dpu_csc_cfg *csc_ptr;
>   
>   	if (!pdpu) {
> @@ -619,7 +624,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
>   	if (!DPU_FORMAT_IS_YUV(fmt))
>   		return NULL;
>   
> -	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
> +	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe_hw->cap->features)
>   		csc_ptr = &dpu_csc10_YUV2RGB_601L;
>   	else
>   		csc_ptr = &dpu_csc_YUV2RGB_601L;
> @@ -654,8 +659,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   			&scaler3_cfg, &pixel_ext, fmt,
>   			info->hsub, info->vsub);
>   
> -	if (pdpu->pipe_hw->ops.setup_pe)
> -		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
> +	if (pstate->pipe_hw->ops.setup_pe)
> +		pstate->pipe_hw->ops.setup_pe(pstate->pipe_hw,
>   				&pixel_ext);
>   
>   	/**
> @@ -663,9 +668,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   	 * bypassed. Still we need to update alpha and bitwidth
>   	 * ONLY for RECT0
>   	 */
> -	if (pdpu->pipe_hw->ops.setup_scaler &&
> +	if (pstate->pipe_hw->ops.setup_scaler &&
>   			pstate->multirect_index != DPU_SSPP_RECT_1)
> -		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
> +		pstate->pipe_hw->ops.setup_scaler(pstate->pipe_hw,
>   				pipe_cfg,
>   				&scaler3_cfg);
>   }
> @@ -694,8 +699,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>   
>   	/* update sspp */
> -	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
> -		pdpu->pipe_hw->ops.setup_solidfill(pdpu->pipe_hw,
> +	if (fmt && pstate->pipe_hw->ops.setup_solidfill) {
> +		pstate->pipe_hw->ops.setup_solidfill(pstate->pipe_hw,
>   				(color & 0xFFFFFF) | ((alpha & 0xFF) << 24),
>   				pstate->multirect_index);
>   
> @@ -709,13 +714,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   		pipe_cfg.src_rect.y2 =
>   			drm_rect_height(&pipe_cfg.dst_rect);
>   
> -		if (pdpu->pipe_hw->ops.setup_format)
> -			pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw,
> +		if (pstate->pipe_hw->ops.setup_format)
> +			pstate->pipe_hw->ops.setup_format(pstate->pipe_hw,
>   					fmt, DPU_SSPP_SOLID_FILL,
>   					pstate->multirect_index);
>   
> -		if (pdpu->pipe_hw->ops.setup_rects)
> -			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
> +		if (pstate->pipe_hw->ops.setup_rects)
> +			pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
>   					&pipe_cfg,
>   					pstate->multirect_index);
>   
> @@ -953,10 +958,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
>   							   new_plane_state->crtc);
>   
> -	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
> +	min_scale = FRAC_16_16(1, pstate->pipe_hw->cap->sblk->maxupscale);
>   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>   						  min_scale,
> -						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
> +						  pstate->pipe_hw->cap->sblk->maxdwnscale << 16,
>   						  true, true);
>   	if (ret) {
>   		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
> @@ -982,8 +987,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>   
>   	if (DPU_FORMAT_IS_YUV(fmt) &&
> -		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> -		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
> +		(!(pstate->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> +		 !(pstate->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
>   		DPU_DEBUG_PLANE(pdpu,
>   				"plane doesn't have scaler/csc for yuv\n");
>   		return -EINVAL;
> @@ -1044,12 +1049,12 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> -	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
> +	else if (pstate->pipe_hw && pstate->pipe_hw->ops.setup_csc) {
>   		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>   		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
>   
>   		if (csc_ptr)
> -			pdpu->pipe_hw->ops.setup_csc(pdpu->pipe_hw, csc_ptr);
> +			pstate->pipe_hw->ops.setup_csc(pstate->pipe_hw, csc_ptr);
>   	}
>   
>   	/* flag h/w flush complete */
> @@ -1116,21 +1121,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		return;
>   	}
>   
> -	if (pdpu->pipe_hw->ops.setup_rects) {
> -		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
> +	if (pstate->pipe_hw->ops.setup_rects) {
> +		pstate->pipe_hw->ops.setup_rects(pstate->pipe_hw,
>   				&pipe_cfg,
>   				pstate->multirect_index);
>   	}
>   
>   	_dpu_plane_setup_scaler(pdpu, pstate, fmt, false, &pipe_cfg);
>   
> -	if (pdpu->pipe_hw->ops.setup_multirect)
> -		pdpu->pipe_hw->ops.setup_multirect(
> -				pdpu->pipe_hw,
> +	if (pstate->pipe_hw->ops.setup_multirect)
> +		pstate->pipe_hw->ops.setup_multirect(
> +				pstate->pipe_hw,
>   				pstate->multirect_index,
>   				pstate->multirect_mode);
>   
> -	if (pdpu->pipe_hw->ops.setup_format) {
> +	if (pstate->pipe_hw->ops.setup_format) {
>   		unsigned int rotation;
>   
>   		src_flags = 0x0;
> @@ -1147,10 +1152,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   			src_flags |= DPU_SSPP_FLIP_UD;
>   
>   		/* update format */
> -		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
> +		pstate->pipe_hw->ops.setup_format(pstate->pipe_hw, fmt, src_flags,
>   				pstate->multirect_index);
>   
> -		if (pdpu->pipe_hw->ops.setup_cdp) {
> +		if (pstate->pipe_hw->ops.setup_cdp) {
>   			struct dpu_hw_pipe_cdp_cfg cdp_cfg;
>   
>   			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
> @@ -1164,7 +1169,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   					DPU_FORMAT_IS_TILE(fmt);
>   			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
>   
> -			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
> +			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg, pstate->multirect_index);
>   		}
>   	}
>   
> @@ -1310,10 +1315,9 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>   		const struct drm_plane_state *state)
>   {
>   	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	const struct dpu_plane *pdpu = to_dpu_plane(state->plane);
>   
>   	drm_printf(p, "\tstage=%d\n", pstate->stage);
> -	drm_printf(p, "\tsspp=%s\n", pdpu->pipe_hw->cap->name);
> +	drm_printf(p, "\tsspp=%s\n", pstate->pipe_hw->cap->name);
>   	drm_printf(p, "\tmultirect_mode=%s\n", dpu_get_multirect_mode(pstate->multirect_mode));
>   	drm_printf(p, "\tmultirect_index=%s\n", dpu_get_multirect_index(pstate->multirect_index));
>   }
> @@ -1322,6 +1326,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
>   	struct dpu_plane_state *pstate;
> +	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
>   
>   	if (!plane) {
>   		DPU_ERROR("invalid plane\n");
> @@ -1343,6 +1348,8 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   		return;
>   	}
>   
> +	pstate->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pdpu->pipe - SSPP_NONE]);
> +
>   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>   }
>   
> @@ -1411,6 +1418,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	struct dpu_plane *pdpu;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_kms *kms = to_dpu_kms(priv->kms);
> +	struct dpu_hw_pipe *pipe_hw;
>   	uint32_t num_formats;
>   	int ret = -EINVAL;
>   
> @@ -1429,15 +1437,15 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	/* initialize underlying h/w driver */
>   	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
>   		goto clean_plane;
> -	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
> +	pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
>   
> -	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
> +	if (!pipe_hw->cap || !pipe_hw->cap->sblk) {
>   		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
>   		goto clean_plane;
>   	}
>   
> -	format_list = pdpu->pipe_hw->cap->sblk->format_list;
> -	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
> +	format_list = pipe_hw->cap->sblk->format_list;
> +	num_formats = pipe_hw->cap->sblk->num_formats;
>   
>   	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
>   				format_list, num_formats,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index d2f60810434e..42b88b6bc9c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -35,6 +35,8 @@ struct dpu_plane_state {
>   	uint32_t multirect_mode;
>   	bool pending;
>   
> +	struct dpu_hw_pipe *pipe_hw;

now that pipe_hw has been made part of the dpu_plane_state, it means
that it can also change with atomic state.

In this change, I can see you update this only in dpu_plane_reset() 
which will be invoked during the drm_mode_config_reset().

Should this pipe_hw assignment be moved to the dpu_plane_atomic_update() 
function?

> +
>   	u64 plane_fetch_bw;
>   	u64 plane_clk;
>   };
