Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684259029E1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 22:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8F7C10E4FB;
	Mon, 10 Jun 2024 20:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Mi4usKBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EE510E4FB;
 Mon, 10 Jun 2024 20:20:04 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEKxrG001296;
 Mon, 10 Jun 2024 20:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u9Nj6YH64EdfLNAULralaBJwSjACSwIdbfB9+j72f78=; b=Mi4usKBIDbHPUkqO
 sdB2tvJXYslpO9784gKuW3A9SXt04Povko/rhgQouA+7/bUj+GhmKzgvhZBlIqkX
 z7jcElptoRpN/z+0p0+UZgd9lFspJX1+3j2QICLVwMqhO85QzMmZQBfW/iciKUb6
 Ae9/iY69LFdOBlh51GG/Jv8D8Thbj47MmZxo3piaw3FbQrB89qNteLZ28ll0L9bV
 /YvO5lyA1Xa71c2jLE6LwERimV4hEmfuPibbIBfgdHkX5sVYCueMSG8SGd5XU8xC
 wza+e9cLAM9hsJz2XZ+AkLtbpBWGJEmIL+zpiCQrhsctEbNXH3XSsOBPwufIdqzU
 PU/T+g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymemgmkxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 20:19:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45AKJObU013456
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 20:19:24 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 13:19:19 -0700
Message-ID: <1dff0318-921e-ea43-4eba-8c4e2b283afb@quicinc.com>
Date: Mon, 10 Jun 2024 13:19:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 09/13] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-10-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yStIEB6Nh6eVPgqwA7uEyCJwY5crWBkQ
X-Proofpoint-ORIG-GUID: yStIEB6Nh6eVPgqwA7uEyCJwY5crWBkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_06,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406100152
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
> Virtual wide planes give high amount of flexibility, but it is not
> always enough:
> 
> In parallel multirect case only the half of the usual width is supported
> for tiled formats. Thus the whole width of two tiled multirect
> rectangles can not be greater than max_linewidth, which is not enough
> for some platforms/compositors.
> 
> Another example is as simple as wide YUV plane. YUV planes can not use
> multirect, so currently they are limited to max_linewidth too.
> 
> Now that the planes are fully virtualized, add support for allocating
> two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> cases and allows all planes to go up to 2*max_linewidth (at the cost of
> making some of the planes unavailable to the user).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 172 ++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   8 +
>   2 files changed, 131 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 2961b809ccf3..cde20c1fa90d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -886,6 +886,28 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> +						   struct dpu_sw_pipe_cfg *pipe_cfg,
> +						   const struct dpu_format *fmt,
> +						   uint32_t max_linewidth)
> +{
> +	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> +	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> +		return false;
> +
> +	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
> +		return false;
> +
> +	if (DPU_FORMAT_IS_YUV(fmt))
> +		return false;
> +
> +	if (DPU_FORMAT_IS_UBWC(fmt) &&
> +	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> +		return false;
> +
> +	return true;
> +}
> +

This is a good idea to separate out multirect checks to a separate API. 
I think can push this part of the change even today.

>   static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>   					struct drm_atomic_state *state,
>   					const struct drm_crtc_state *crtc_state)
> @@ -899,7 +921,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>   	const struct dpu_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -	uint32_t max_linewidth;
>   	uint32_t supported_rotations;
>   	const struct dpu_sspp_cfg *pipe_hw_caps;
>   	const struct dpu_sspp_sub_blks *sblk;
> @@ -919,15 +940,8 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>   	      drm_rect_height(&new_plane_state->dst))))
>   		return -ERANGE;
>   
> -	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
>   	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>   
> -	max_linewidth = pdpu->catalog->caps->max_linewidth;
> -
>   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>   
>   	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> @@ -943,41 +957,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>   		return ret;
>   
>   	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		/*
> -		 * In parallel multirect case only the half of the usual width
> -		 * is supported for tiled formats. If we are here, we know that
> -		 * full width is more than max_linewidth, thus each rect is
> -		 * wider than allowed.
> -		 */
> -		if (DPU_FORMAT_IS_UBWC(fmt) &&
> -		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> -		}
> -
> -		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> -		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> -		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> -		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
> -		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
> -		    DPU_FORMAT_IS_YUV(fmt)) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> -		}
> -
> -		/*
> -		 * Use multirect for wide plane. We do not support dynamic
> -		 * assignment of SSPPs, so we know the configuration.
> -		 */
> -		pipe->multirect_index = DPU_SSPP_RECT_0;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> -
> -		r_pipe->sspp = pipe->sspp;
> -		r_pipe->multirect_index = DPU_SSPP_RECT_1;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> -
>   		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
>   						  &crtc_state->adjusted_mode);
>   		if (ret)
> @@ -998,16 +977,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   	struct dpu_sw_pipe *pipe = &pstate->pipe;
>   	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   	const struct drm_crtc_state *crtc_state = NULL;
>   
>   	if (new_plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
>   							   new_plane_state->crtc);
>   
> -	if (pdpu->pipe != SSPP_NONE) {
> -		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -		r_pipe->sspp = NULL;
> -	}
> +	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +	r_pipe->sspp = NULL;
>   
>   	if (!pipe->sspp)
>   		return -EINVAL;
> @@ -1019,6 +998,52 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> +		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> +		const struct dpu_format *fmt;
> +
> +		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +
> +		/*
> +		 * In parallel multirect case only the half of the usual width
> +		 * is supported for tiled formats. If we are here, we know that
> +		 * full width is more than max_linewidth, thus each rect is
> +		 * wider than allowed.
> +		 */
> +		if (DPU_FORMAT_IS_UBWC(fmt) &&
> +		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}
> +
> +		r_pipe->sspp = pipe->sspp;
> +
> +		if (!dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) ||
> +		    !dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) ||
> +		    !(test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> +		      test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}
> +
> +		/*
> +		 * Use multirect for wide plane. We do not support dynamic
> +		 * assignment of SSPPs, so we know the configuration.
> +		 */
> +		pipe->multirect_index = DPU_SSPP_RECT_0;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +		r_pipe->multirect_index = DPU_SSPP_RECT_1;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +	}
> +

I might be wrong here, but it seems like this part was moved to 
dpu_plane_atomic_check_nopipe() in patch 6 and now being brought back 
(atleast most of it) to dpu_plane_atomic_check().

If this is correct, then the migration in patch 6 was not necessary.

>   	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
>   }
>   
> @@ -1053,10 +1078,18 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   
>   	format = to_dpu_format(msm_framebuffer_format(plane_state->fb));
>   
> -	/* force resource reallocation if the format of FB has changed */
> -	if (pstate->saved_fmt != format) {
> +	/* force resource reallocation if the format of FB or src/dst have changed */
> +	if (pstate->saved_fmt != format ||
> +	    pstate->saved_src_w != plane_state->src_w ||
> +	    pstate->saved_src_h != plane_state->src_h ||
> +	    pstate->saved_src_w != plane_state->src_w ||
> +	    pstate->saved_crtc_h != plane_state->crtc_h) {
>   		crtc_state->planes_changed = true;
>   		pstate->saved_fmt = format;
> +		pstate->saved_src_w = plane_state->src_w;
> +		pstate->saved_src_h = plane_state->src_h;
> +		pstate->saved_crtc_w = plane_state->crtc_w;
> +		pstate->saved_crtc_h = plane_state->crtc_h;
>   	}

Is thic chunk checking that if the src/dst have changed, this plane 
might span more than one LM?

Will be better to add more comment on why we are also checking src/dest 
changes.

Overall, can we just use for_each_oldnew_plane_in_state to compare the 
prev and current dimensions and drop saved_****?

>   
>   	return 0;
> @@ -1074,7 +1107,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	struct dpu_plane_state *pstate;
>   	struct dpu_sw_pipe *pipe;
>   	struct dpu_sw_pipe *r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>   	const struct dpu_format *fmt;
> +	uint32_t max_linewidth;
>   
>   	if (plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1083,6 +1119,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	pstate = to_dpu_plane_state(plane_state);
>   	pipe = &pstate->pipe;
>   	r_pipe = &pstate->r_pipe;
> +	pipe_cfg = &pstate->pipe_cfg;
> +	r_pipe_cfg = &pstate->r_pipe_cfg;
>   
>   	pipe->sspp = NULL;
>   	r_pipe->sspp = NULL;
> @@ -1097,10 +1135,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   
>   	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>   
> +	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> +
>   	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>   	if (!pipe->sspp)
>   		return -ENODEV;
>   
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> +		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +		r_pipe->sspp = NULL;
> +	} else {
> +		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
> +		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
> +		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> +		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
> +			r_pipe->sspp = pipe->sspp;
> +
> +			pipe->multirect_index = DPU_SSPP_RECT_0;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +			r_pipe->multirect_index = DPU_SSPP_RECT_1;
> +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +		} else {
> +			/* multirect is not possible, use two SSPP blocks */
> +			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!r_pipe->sspp)
> +				return -ENODEV;
> +
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
> +	}
> +

This chunk LGTM.

>   	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 15f7d60d8b85..5522f9035d68 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -31,6 +31,10 @@
>    * @plane_clk: calculated clk per plane
>    * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
>    * @saved_fmt: format used by the plane's FB, saved for for virtual plane support
> + * @saved_src_w: cached value of plane's src_w, saved for for virtual plane support
> + * @saved_src_h: cached value of plane's src_h, saved for for virtual plane support
> + * @saved_crtc_w: cached value of plane's crtc_w, saved for for virtual plane support
> + * @saved_crtc_h: cached value of plane's crtc_h, saved for for virtual plane support
>    */
>   struct dpu_plane_state {
>   	struct drm_plane_state base;
> @@ -49,6 +53,10 @@ struct dpu_plane_state {
>   	bool needs_dirtyfb;
>   
>   	const struct dpu_format *saved_fmt;
> +	uint32_t saved_src_w;
> +	uint32_t saved_src_h;
> +	uint32_t saved_crtc_w;
> +	uint32_t saved_crtc_h;
>   };
>   
>   #define to_dpu_plane_state(x) \
