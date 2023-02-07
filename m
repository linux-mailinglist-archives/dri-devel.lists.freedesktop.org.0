Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B5268CB0C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 01:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DD110E1AD;
	Tue,  7 Feb 2023 00:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F70410E2C4;
 Tue,  7 Feb 2023 00:22:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31709TiZ004517; Tue, 7 Feb 2023 00:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kLCNLFBgffF/WAO14SUibcgtWypvMVPvbIpnrk4RwNY=;
 b=Z5BGYqdTmsMHTu79jZndrcb4bFQ0jBJT5K+rYIx7Y5RvrOtPSfK0eGgBtcYgT0+5XBpD
 MM8flEGt3aztYPhGNOqIDpwFrS68TSxsXqbV9o77iKHCL63xSqqXQEXyNIsxAxrD8gRl
 9KVte9yrBFkbNrwehCzktWnVUpt+ZHVUmIpwxaXY60VmILrxznH1GX0UfjM7SkjgNln2
 QXodDuMAtKR9alXvFBpVX+K7zipj/qqV4FXhXE8zI9NwVjAIaFiiIru3Pu21md/oslMe
 Gg3/NvGwbQTd5spai9Je45dzQPbJyeZyiIHlrkTQs0Jhtfncyngeoj7osSPYrxICMXJT 0A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nhghv4u16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 00:22:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3170MDb4030405
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 7 Feb 2023 00:22:13 GMT
Received: from [10.110.44.26] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 16:22:12 -0800
Message-ID: <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
Date: Mon, 6 Feb 2023 16:22:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 22/27] drm/msm/dpu: rework
 dpu_plane_sspp_atomic_update()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8TocRg8EFqMudnhS_QIbAnVd19VtZaHD
X-Proofpoint-ORIG-GUID: 8TocRg8EFqMudnhS_QIbAnVd19VtZaHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070002
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



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the

sspp-dependent?

> separate function dpu_plane_sspp_update_pipe(). This is one of
> preparational steps to add r_pipe support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Just a couple of minor comments below but otherwise this split up lgtm

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 113 ++++++++++++----------
>   1 file changed, 63 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0986e740b978..f94e132733f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -404,12 +404,13 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
>    * _dpu_plane_set_ot_limit - set OT limit for the given plane
>    * @plane:		Pointer to drm plane
>    * @pipe:		Pointer to software pipe
> - * @crtc:		Pointer to drm crtc
>    * @pipe_cfg:		Pointer to pipe configuration
> + * @frame_rate:		CRTC's frame rate

Can you please check the spacing here. There seems to be an extra tab 
before the CRTC's frame rate

>    */
>   static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>   		struct dpu_sw_pipe *pipe,
> -		struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
> +		struct dpu_hw_sspp_cfg *pipe_cfg,
> +		int frame_rate)
>   {
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_vbif_set_ot_params ot_params;
> @@ -421,7 +422,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>   	ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>   	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>   	ot_params.is_wfd = !pdpu->is_rt_pipe;
> -	ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
> +	ot_params.frame_rate = frame_rate;
>   	ot_params.vbif_idx = VBIF_RT;
>   	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
>   	ot_params.rd = true;
> @@ -457,26 +458,6 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
>   	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
>   }
>   
> -static void _dpu_plane_set_scanout(struct drm_plane *plane,
> -		struct dpu_plane_state *pstate,
> -		struct drm_framebuffer *fb)
> -{
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> -	struct msm_gem_address_space *aspace = kms->base.aspace;
> -	struct dpu_hw_fmt_layout layout;
> -	int ret;
> -
> -	ret = dpu_format_populate_layout(aspace, fb, &layout);
> -	if (ret)
> -		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> -	else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
> -		trace_dpu_plane_set_scanout(&pstate->pipe,
> -					    &layout);
> -		pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, &layout);
> -	}
> -}
> -
>   static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>   		uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>   		struct dpu_hw_scaler3_cfg *scale_cfg,
> @@ -1102,35 +1083,25 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error)
>   	pdpu->is_error = error;
>   }
>   
> -static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
> +static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
> +				       struct dpu_sw_pipe *pipe,
> +				       struct dpu_hw_sspp_cfg *pipe_cfg,

You can call this parameter sspp_cfg instead of pipe_cfg?

> +				       const struct dpu_format *fmt,
> +				       int frame_rate,
> +				       struct dpu_hw_fmt_layout *layout)
>   {
>   	uint32_t src_flags;
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct drm_plane_state *state = plane->state;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct drm_crtc *crtc = state->crtc;
> -	struct drm_framebuffer *fb = state->fb;
> -	bool is_rt_pipe;
> -	const struct dpu_format *fmt =
> -		to_dpu_format(msm_framebuffer_format(fb));
> -	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>   
> -	_dpu_plane_set_scanout(plane, pstate, fb);
> -
> -	pstate->pending = true;
> -
> -	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
> -	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
> -	pdpu->is_rt_pipe = is_rt_pipe;
> +	if (layout && pipe->sspp->ops.setup_sourceaddress) {
> +		trace_dpu_plane_set_scanout(pipe, layout);
> +		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
> +	}
>   
>   	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
> -	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> -			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> -			crtc->base.id, DRM_RECT_ARG(&state->dst),
> -			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> -
>   	/* override for color fill */
>   	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>   		/* skip remaining processing on color fill */
> @@ -1183,22 +1154,64 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   		}
>   	}
>   
> -	_dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
> +	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
>   	_dpu_plane_set_danger_lut(plane, pipe, fmt);
>   
>   	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>   		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
> -		_dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
> +		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
>   	}
>   
> -	if (pstate->needs_qos_remap) {
> -		pstate->needs_qos_remap = false;
> +	if (pstate->needs_qos_remap)
>   		_dpu_plane_set_qos_remap(plane, pipe);
> -	}
> +}
> +
> +static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
> +{
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct drm_plane_state *state = plane->state;
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct drm_crtc *crtc = state->crtc;
> +	struct drm_framebuffer *fb = state->fb;
> +	bool is_rt_pipe;
> +	const struct dpu_format *fmt =
> +		to_dpu_format(msm_framebuffer_format(fb));
> +	struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
> +
> +	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> +	struct msm_gem_address_space *aspace = kms->base.aspace;
> +	struct dpu_hw_fmt_layout layout;
> +	bool layout_valid = false;
> +	int ret;
> +
> +	ret = dpu_format_populate_layout(aspace, fb, &layout);
> +	if (ret)
> +		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> +	else
> +		layout_valid = true;
> +
> +	pstate->pending = true;
> +
> +	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
> +	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
> +	pdpu->is_rt_pipe = is_rt_pipe;
> +
> +	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> +			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> +			crtc->base.id, DRM_RECT_ARG(&state->dst),
> +			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> +
> +	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> +				   drm_mode_vrefresh(&crtc->mode),
> +				   layout_valid ? &layout: NULL);
> +
> +	if (pstate->needs_qos_remap)
> +		pstate->needs_qos_remap = false;
>   
> -	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pstate->pipe_cfg);
> +	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, pipe_cfg);
>   
> -	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pstate->pipe_cfg);
> +	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
>   }
>   
>   static void _dpu_plane_atomic_disable(struct drm_plane *plane)
