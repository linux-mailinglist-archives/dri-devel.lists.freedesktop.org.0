Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA068FDA40
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 01:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3896810E24D;
	Wed,  5 Jun 2024 23:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Um468Ktf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042EB10E24D;
 Wed,  5 Jun 2024 23:19:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455Lnx79010981;
 Wed, 5 Jun 2024 23:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ie7G5QiJNJnOxk2EnafVN7I2oHW3Oj+5f1jjnahgjHA=; b=Um468KtfEDDTfaf7
 pws1+8KZc65wOQgE8tatxwDpA5TXRDlV8XlUhLBozlSx+2XsEQCKJ2r6dPAcOg31
 8DrCjUA/U6ehIDe4prsCsX8P9ANF9U9NqdID/xa44A1theq5wrpkBw+r1/o2+qzh
 CiqBS3kmL2amYLrIGdOYzEdrCqbNuE0tAvGqa7eZ0V6+4WwHdOiyb22dmtw02FFX
 2VxuaWgSQhWyCeaUgfldS7ofUeEVCcN8BrF6y0c/WvEC4kl/4TxjU8obcPHK8JH7
 W6wXAp1K/xxy5qLlUfCl2TD6HeLdcKrGygjPZz5y4ZIA7rHeJw4vZ9UW8L7fmICb
 yHDt4Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjhw0tcjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 23:19:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455NJPwD009691
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Jun 2024 23:19:25 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 16:19:22 -0700
Message-ID: <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
Date: Wed, 5 Jun 2024 16:19:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: K2QUqcitr3o1LGDFN0EONGJoJKWrm6UZ
X-Proofpoint-GUID: K2QUqcitr3o1LGDFN0EONGJoJKWrm6UZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406050175
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



On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> Split dpu_plane_atomic_check() function into two pieces:
> 
> dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
> without touching the associated pipe,
> 
> and
> 
> dpu_plane_atomic_check_pipes(), which takes into account used pipes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
>   1 file changed, 117 insertions(+), 67 deletions(-)
> 

One thing which seemed odd to me is even dpu_plane_atomic_check_nopipe() 
does use pipe_cfg even though its named "nopipe".

Perhaps were you targetting a split of SW planes vs SSPP atomic_check?

I tried applying this patch on top of msm-next to more closely review 
the split up but it does not apply. So, I will review this patch a 
little better after it is re-spun. But will proceed with remaining patches.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6360052523b5..187ac2767a2b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -788,50 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>   #define MAX_UPSCALE_RATIO	20
>   #define MAX_DOWNSCALE_RATIO	4
>   
> -static int dpu_plane_atomic_check(struct drm_plane *plane,
> -				  struct drm_atomic_state *state)
> +static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> +					 struct drm_plane_state *new_plane_state,
> +					 const struct drm_crtc_state *crtc_state)
>   {
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> -										 plane);
>   	int ret = 0, min_scale, max_scale;
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	const struct drm_crtc_state *crtc_state = NULL;
> -	const struct dpu_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   	struct drm_rect fb_rect = { 0 };
>   	uint32_t max_linewidth;
> -	unsigned int rotation;
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
>   
> -	if (new_plane_state->crtc)
> -		crtc_state = drm_atomic_get_new_crtc_state(state,
> -							   new_plane_state->crtc);
> -
> -	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -	r_pipe->sspp = NULL;
> -
> -	if (!pipe->sspp)
> -		return -EINVAL;
> -
> -	pipe_hw_caps = pipe->sspp->cap;
> -	sblk = pipe->sspp->cap->sblk;
> -
> -	if (sblk->scaler_blk.len) {
> -		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> -		max_scale = MAX_DOWNSCALE_RATIO << 16;
> -	} else {
> -		min_scale = 1 << 16;
> -		max_scale = 1 << 16;
> -	}
> +	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> +	max_scale = MAX_DOWNSCALE_RATIO << 16;
>   
>   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>   						  min_scale,
> @@ -844,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> -	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
>   	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>   		DPU_ERROR("> %d plane stages assigned\n",
> @@ -872,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -E2BIG;
>   	}
>   
> -	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> -
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
>   	drm_rect_rotate(&pipe_cfg->src_rect,
> @@ -882,6 +847,83 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
>   	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> +		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}
> +
> +		*r_pipe_cfg = *pipe_cfg;
> +		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> +		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> +		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> +		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> +	} else {
> +		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> +	}
> +
> +	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +			    new_plane_state->fb->width, new_plane_state->fb->height,
> +			    new_plane_state->rotation);
> +	if (r_pipe_cfg->src_rect.x1 != 0)
> +		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +				    new_plane_state->fb->width, new_plane_state->fb->height,
> +				    new_plane_state->rotation);
> +
> +	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
> +					struct drm_atomic_state *state,
> +					const struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_plane_state *new_plane_state =
> +		drm_atomic_get_new_plane_state(state, plane);
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	const struct dpu_format *fmt;
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	uint32_t max_linewidth;
> +	unsigned int rotation;
> +	uint32_t supported_rotations;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
> +	int ret = 0;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
> +	/*
> +	 * We already have verified scaling against platform limitations.
> +	 * Now check if the SSPP supports scaling at all.
> +	 */
> +	if (!sblk->scaler_blk.len &&
> +	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +	      drm_rect_width(&new_plane_state->dst)) ||
> +	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> +	      drm_rect_height(&new_plane_state->dst))))
> +		return -ERANGE;
> +
> +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +
> +	max_linewidth = pdpu->catalog->caps->max_linewidth;
> +
> +	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> +					  &crtc_state->adjusted_mode);
> +	if (ret)
> +		return ret;
> +
> +	if (r_pipe_cfg->src_rect.x1 != 0) {
>   		/*
>   		 * In parallel multirect case only the half of the usual width
>   		 * is supported for tiled formats. If we are here, we know that
> @@ -895,12 +937,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   			return -E2BIG;
>   		}
>   
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> -		}
> -
>   		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
>   		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
>   		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> @@ -922,26 +958,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		r_pipe->multirect_index = DPU_SSPP_RECT_1;
>   		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>   
> -		*r_pipe_cfg = *pipe_cfg;
> -		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -	}
> -
> -	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -			    new_plane_state->fb->width, new_plane_state->fb->height,
> -			    new_plane_state->rotation);
> -	if (r_pipe->sspp)
> -		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> -				    new_plane_state->fb->width, new_plane_state->fb->height,
> -				    new_plane_state->rotation);
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
> -	if (ret)
> -		return ret;
> -
> -	if (r_pipe->sspp) {
>   		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
>   						  &crtc_state->adjusted_mode);
>   		if (ret)
> @@ -964,11 +980,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	}
>   
>   	pstate->rotation = rotation;
> -	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>   
>   	return 0;
>   }
>   
> +static int dpu_plane_atomic_check(struct drm_plane *plane,
> +				  struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> +										 plane);
> +	int ret = 0;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	const struct drm_crtc_state *crtc_state = NULL;
> +
> +	if (new_plane_state->crtc)
> +		crtc_state = drm_atomic_get_new_crtc_state(state,
> +							   new_plane_state->crtc);
> +
> +	if (pdpu->pipe != SSPP_NONE) {

This check was not present iirc, why did you have to add this?
RM will return the same SSPP unless freed. So why this additional check?

> +		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +		r_pipe->sspp = NULL;
> +	}
> +
> +	if (!pipe->sspp)
> +		return -EINVAL;
> +
> +	ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
> +}
> +
>   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
>   {
>   	const struct dpu_format *format =
