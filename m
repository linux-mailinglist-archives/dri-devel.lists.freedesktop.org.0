Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E172681D42
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87EC10E13A;
	Mon, 30 Jan 2023 21:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2C510E13A;
 Mon, 30 Jan 2023 21:51:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30ULdKKe014527; Mon, 30 Jan 2023 21:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5+noB3W6DaL82vU/p5DnpkKDFteSMGlw5wDLlwRO76Y=;
 b=ovmkJecIvOxu3BJqitbWqAkNZEe/KbQu1yuZ64p3EhIwHdVaZLY/v7MAoH8T6OiarJCn
 +TJBZTQk/J2VrwpHYQ0XmNrfHciMRaN1pj0C3wOEXJrc+apyC+QzjcbURx5XQexo/HuF
 4f7TsMky5MZyzqxC16in7g+GFtmxZ1yimz1q2Lgn7GGA2KJ3xh4LPZt6tPPSJ9Yqjtvm
 aCrvjavSyN9P56YcD39/alkQ6f56RrDbt1urMOcO+eWFj0KgagMuUHReC5D/gQnvr90X
 g3A3Ci+v6jdkxRTmMDLQ+oqRNCqz0I15THX8sMKL7QB/9mHYp+McQxrc56xbNgSlQdHX tw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ncvfpcmew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 21:51:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30ULpVuO030337
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 21:51:31 GMT
Received: from [10.110.114.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 13:51:31 -0800
Message-ID: <f27fd72c-43a1-fa4f-6fda-4214d5b2920b@quicinc.com>
Date: Mon, 30 Jan 2023 13:51:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 06/27] drm/msm/dpu: move pipe_hw to dpu_plane_state
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20221229191856.3508092-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qwtJp5_BrouWYGMB5RZhoH1msNCqsV5U
X-Proofpoint-ORIG-GUID: qwtJp5_BrouWYGMB5RZhoH1msNCqsV5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_17,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300201
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
> In preparation to adding fully virtualized planes, move struct
> dpu_hw_sspp instance from struct dpu_plane to struct dpu_plane_state, as
> it will become a part of state (allocated during atomic check) rather
> than part of a plane (allocated during boot).
> 

I was thinking about a couple of things about this patch:

1) Since we are moving away from using "pipe" and using "sspp", perhaps 
we can rename pipe_hw to hw_sspp in the below struct

--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -35,6 +35,8 @@  struct dpu_plane_state {
  	uint32_t multirect_mode;
  	bool pending;

+	struct dpu_hw_pipe *hw_sspp;
+
  	u64 plane_fetch_bw;
  	u64 plane_clk;
  };

2) I still dont see any comment as promised in v1 about why we are doing 
this in dpu_plane_reset().

https://patchwork.freedesktop.org/patch/473155/?series=99909&rev=1#comment_875365

I think what we need to mention is that the dpu_plane_reset() is the one 
which allocates the plane state today and hence pipe_hw can only be 
assigned there.

Rest LGTM.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 102 ++++++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   2 +
>   2 files changed, 57 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 43fb8e00ada6..7ba954c7b3e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -104,7 +104,6 @@ struct dpu_plane {
>   
>   	enum dpu_sspp pipe;
>   
> -	struct dpu_hw_sspp *pipe_hw;
>   	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
> @@ -279,6 +278,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   		struct drm_framebuffer *fb, struct dpu_hw_pipe_cfg *pipe_cfg)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	const struct dpu_format *fmt = NULL;
>   	u64 qos_lut;
>   	u32 total_fl = 0, lut_usage;
> @@ -310,7 +310,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
>   			fmt ? (char *)&fmt->base.pixel_format : NULL,
>   			pdpu->is_rt_pipe, total_fl, qos_lut);
>   
> -	pdpu->pipe_hw->ops.setup_creq_lut(pdpu->pipe_hw, qos_lut);
> +	pstate->pipe_hw->ops.setup_creq_lut(pstate->pipe_hw, qos_lut);
>   }
>   
>   /**
> @@ -322,6 +322,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   		struct drm_framebuffer *fb)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	const struct dpu_format *fmt = NULL;
>   	u32 danger_lut, safe_lut;
>   
> @@ -361,7 +362,7 @@ static void _dpu_plane_set_danger_lut(struct drm_plane *plane,
>   		danger_lut,
>   		safe_lut);
>   
> -	pdpu->pipe_hw->ops.setup_danger_safe_lut(pdpu->pipe_hw,
> +	pstate->pipe_hw->ops.setup_danger_safe_lut(pstate->pipe_hw,
>   			danger_lut, safe_lut);
>   }
>   
> @@ -375,14 +376,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
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
> @@ -408,7 +410,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>   		pipe_qos_cfg.danger_vblank,
>   		pdpu->is_rt_pipe);
>   
> -	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
> +	pstate->pipe_hw->ops.setup_qos_ctrl(pstate->pipe_hw,
>   			&pipe_qos_cfg);
>   }
>   
> @@ -422,18 +424,19 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
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
> @@ -446,14 +449,15 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
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
> @@ -478,11 +482,11 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
>   	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
>   	if (ret)
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
> @@ -534,7 +538,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_plane *pdpu,
>   			scale_cfg->src_height[i] /= chroma_subsmpl_v;
>   		}
>   
> -		if (pdpu->pipe_hw->cap->features &
> +		if (pstate->pipe_hw->cap->features &
>   			BIT(DPU_SSPP_SCALER_QSEED4)) {
>   			scale_cfg->preload_x[i] = DPU_QSEED4_DEFAULT_PRELOAD_H;
>   			scale_cfg->preload_y[i] = DPU_QSEED4_DEFAULT_PRELOAD_V;
> @@ -607,6 +611,7 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
>   
>   static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
>   {
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
>   	const struct dpu_csc_cfg *csc_ptr;
>   
>   	if (!pdpu) {
> @@ -617,7 +622,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
>   	if (!DPU_FORMAT_IS_YUV(fmt))
>   		return NULL;
>   
> -	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
> +	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe_hw->cap->features)
>   		csc_ptr = &dpu_csc10_YUV2RGB_601L;
>   	else
>   		csc_ptr = &dpu_csc_YUV2RGB_601L;
> @@ -660,8 +665,8 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
>   			src_width, src_height, info->hsub, info->vsub);
>   
> -	if (pdpu->pipe_hw->ops.setup_pe)
> -		pdpu->pipe_hw->ops.setup_pe(pdpu->pipe_hw,
> +	if (pstate->pipe_hw->ops.setup_pe)
> +		pstate->pipe_hw->ops.setup_pe(pstate->pipe_hw,
>   				&pixel_ext);
>   
>   	/**
> @@ -669,9 +674,9 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
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
> @@ -700,8 +705,8 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
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
> @@ -715,13 +720,13 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
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
> @@ -973,8 +978,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	uint32_t min_src_size, max_linewidth;
>   	unsigned int rotation;
>   	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps = pdpu->pipe_hw->cap;
> -	const struct dpu_sspp_sub_blks *sblk = pdpu->pipe_hw->cap->sblk;
> +	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe_hw->cap;
> +	const struct dpu_sspp_sub_blks *sblk = pstate->pipe_hw->cap->sblk;
>   
>   	if (new_plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1087,12 +1092,12 @@ void dpu_plane_flush(struct drm_plane *plane)
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
> @@ -1162,21 +1167,21 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
>   		unsigned int rotation = pstate->rotation;
>   
>   		src_flags = 0x0;
> @@ -1191,10 +1196,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   			src_flags |= DPU_SSPP_ROT_90;
>   
>   		/* update format */
> -		pdpu->pipe_hw->ops.setup_format(pdpu->pipe_hw, fmt, src_flags,
> +		pstate->pipe_hw->ops.setup_format(pstate->pipe_hw, fmt, src_flags,
>   				pstate->multirect_index);
>   
> -		if (pdpu->pipe_hw->ops.setup_cdp) {
> +		if (pstate->pipe_hw->ops.setup_cdp) {
>   			struct dpu_hw_cdp_cfg cdp_cfg;
>   
>   			memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
> @@ -1208,7 +1213,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   					DPU_FORMAT_IS_TILE(fmt);
>   			cdp_cfg.preload_ahead = DPU_SSPP_CDP_PRELOAD_AHEAD_64;
>   
> -			pdpu->pipe_hw->ops.setup_cdp(pdpu->pipe_hw, &cdp_cfg, pstate->multirect_index);
> +			pstate->pipe_hw->ops.setup_cdp(pstate->pipe_hw, &cdp_cfg, pstate->multirect_index);
>   		}
>   	}
>   
> @@ -1348,10 +1353,9 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
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
> @@ -1360,6 +1364,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
>   	struct dpu_plane_state *pstate;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	if (!plane) {
>   		DPU_ERROR("invalid plane\n");
> @@ -1381,6 +1386,8 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   		return;
>   	}
>   
> +	pstate->pipe_hw = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +
>   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>   }
>   
> @@ -1445,6 +1452,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	struct dpu_plane *pdpu;
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct dpu_kms *kms = to_dpu_kms(priv->kms);
> +	struct dpu_hw_sspp *pipe_hw;
>   	uint32_t num_formats;
>   	uint32_t supported_rotations;
>   	int ret = -EINVAL;
> @@ -1462,14 +1470,14 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   	pdpu->pipe = pipe;
>   
>   	/* initialize underlying h/w driver */
> -	pdpu->pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> -	if (!pdpu->pipe_hw || !pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
> +	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
> +	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
>   		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
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
> @@ -1491,7 +1499,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   
>   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
>   
> -	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +	if (pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
>   		supported_rotations |= DRM_MODE_ROTATE_MASK;
>   
>   	drm_plane_create_rotation_property(plane,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index b7b1b05199c2..0d268729ce81 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -37,6 +37,8 @@ struct dpu_plane_state {
>   	uint32_t multirect_mode;
>   	bool pending;
>   
> +	struct dpu_hw_sspp *pipe_hw;
> +
>   	u64 plane_fetch_bw;
>   	u64 plane_clk;
>   
