Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C09B5588
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 23:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDD510E3B6;
	Tue, 29 Oct 2024 22:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TnsuNHBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC8310E3B5;
 Tue, 29 Oct 2024 22:07:36 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TAaNDj013129;
 Tue, 29 Oct 2024 22:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2lzwmUYG0jlCTMFyMqNKgK1XdqTfRmNkBr46ecBflIc=; b=TnsuNHBwXNt/ASce
 rOvnqz6HN0w3tDnjyS711JvMUD4dlbqdxFxvL1vWNVstD8xUFfdO1O7GxX/wgv/w
 otzMtMdStMboUzETCa0I4VQUvrARfdhjRw9hLDiuBMdWzKM9/XCrSHTMbyEFU7vs
 WSBXwRCFjxIjr3mNuMzhzvBBeOEpzeYpLZ5/XiabuTgyP4GOy9Mm180sIhh6B8q0
 K9DKMpekB3Gmg7V3XEqSgO+pp3A4ubqdQ7j+to1JIjUNzM36g516yUoMdbDFkGjf
 6DvQf2tFuYeaPBnjcvEigwpgRMNzVXef4vrHfxjR75Dl0lvN5ljlOWf7YfCcnvE7
 AsqtYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe61s5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 22:07:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TM7XQC016222
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2024 22:07:33 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Oct
 2024 15:07:31 -0700
Message-ID: <e09a547a-c123-489e-b993-a246ebe32513@quicinc.com>
Date: Tue, 29 Oct 2024 15:07:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-8-0310fd519765@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241025-dpu-virtual-wide-v6-8-0310fd519765@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1z7gA5ECiLu-GVER1Z_KnhkfIpEuZYND
X-Proofpoint-ORIG-GUID: 1z7gA5ECiLu-GVER1Z_KnhkfIpEuZYND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=987 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290167
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



On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
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
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 163 ++++++++++++++++++++++--------
>   1 file changed, 119 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 125db3803cf5..ad6cc469f475 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -20,7 +20,6 @@
>   #include "msm_drv.h"
>   #include "msm_mdss.h"
>   #include "dpu_kms.h"
> -#include "dpu_formats.h"
>   #include "dpu_hw_sspp.h"
>   #include "dpu_hw_util.h"
>   #include "dpu_trace.h"
> @@ -888,6 +887,28 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> +						   struct dpu_sw_pipe_cfg *pipe_cfg,
> +						   const struct msm_format *fmt,
> +						   uint32_t max_linewidth)
> +{
> +	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> +	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> +		return false;
> +
> +	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
> +		return false;
> +
> +	if (MSM_FORMAT_IS_YUV(fmt))
> +		return false;
> +
> +	if (MSM_FORMAT_IS_UBWC(fmt) &&
> +	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> +		return false;
> +
> +	return true;
> +}

Dont we also need to check for

if (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))?
	return false;

> +
>   static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   				       struct drm_atomic_state *state,
>   				       const struct drm_crtc_state *crtc_state)
> @@ -901,7 +922,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   	const struct msm_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -	uint32_t max_linewidth;
>   	uint32_t supported_rotations;
>   	const struct dpu_sspp_cfg *pipe_hw_caps;
>   	const struct dpu_sspp_sub_blks *sblk;
> @@ -923,8 +943,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   
>   	fmt = msm_framebuffer_format(new_plane_state->fb);
>   
> -	max_linewidth = pdpu->catalog->caps->max_linewidth;
> -
>   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>   
>   	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> @@ -940,41 +958,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   		return ret;
>   
>   	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		/*
> -		 * In parallel multirect case only the half of the usual width
> -		 * is supported for tiled formats. If we are here, we know that
> -		 * full width is more than max_linewidth, thus each rect is
> -		 * wider than allowed.
> -		 */
> -		if (MSM_FORMAT_IS_UBWC(fmt) &&
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
> -		    MSM_FORMAT_IS_YUV(fmt)) {
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
> @@ -995,16 +978,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> @@ -1021,6 +1004,49 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>   
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> +		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> +		const struct msm_format *fmt;
> +
> +		fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +		/*
> +		 * In parallel multirect case only the half of the usual width
> +		 * is supported for tiled formats. If we are here, we know that
> +		 * full width is more than max_linewidth, thus each rect is
> +		 * wider than allowed.
> +		 */
> +		if (MSM_FORMAT_IS_UBWC(fmt) &&
> +		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}
> +
> +		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> +		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> +		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> +		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
> +		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
> +		    MSM_FORMAT_IS_YUV(fmt)) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
> +		}

Dont the above two conditions translate to 
!dpu_plane_is_multirect_parallel_capable()?

I think once we have a unified plane atomic check and not a separate one 
for virtual planes (we had to add one to support the modparam), some 
duplication will go away but till then I think this is the best we can do.


> +
> +		/*
> +		 * Use multirect for wide plane. We do not support dynamic
> +		 * assignment of SSPPs, so we know the configuration.
> +		 */
> +		r_pipe->sspp = pipe->sspp;
> +
> +		pipe->multirect_index = DPU_SSPP_RECT_0;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +		r_pipe->multirect_index = DPU_SSPP_RECT_1;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +	}
> +
>   	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>   }
>   
> @@ -1054,8 +1080,16 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   		return 0;
>   	}
>   
> -	/* force resource reallocation if the format of FB has changed */
> +	/*
> +	 * Force resource reallocation if the format of FB or src/dst have
> +	 * changed. We might need to allocate different SSPP or SSPPs for this
> +	 * plane than the one used previously.
> +	 */
>   	if (!old_plane_state || !old_plane_state->fb ||
> +	    old_plane_state->src_w != plane_state->src_w ||
> +	    old_plane_state->src_h != plane_state->src_h ||
> +	    old_plane_state->src_w != plane_state->src_w ||
> +	    old_plane_state->crtc_h != plane_state->crtc_h ||
>   	    msm_framebuffer_format(old_plane_state->fb) !=
>   	    msm_framebuffer_format(plane_state->fb))
>   		crtc_state->planes_changed = true;
> @@ -1075,7 +1109,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	struct dpu_plane_state *pstate;
>   	struct dpu_sw_pipe *pipe;
>   	struct dpu_sw_pipe *r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>   	const struct msm_format *fmt;
> +	uint32_t max_linewidth;
>   
>   	if (plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1084,6 +1121,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	pstate = to_dpu_plane_state(plane_state);
>   	pipe = &pstate->pipe;
>   	r_pipe = &pstate->r_pipe;
> +	pipe_cfg = &pstate->pipe_cfg;
> +	r_pipe_cfg = &pstate->r_pipe_cfg;
>   
>   	pipe->sspp = NULL;
>   	r_pipe->sspp = NULL;
> @@ -1098,10 +1137,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
>   	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>   }
>   
> 
