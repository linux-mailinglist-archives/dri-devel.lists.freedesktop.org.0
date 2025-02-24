Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF94A42113
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9F10E3FD;
	Mon, 24 Feb 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CeUtgmJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4210E051;
 Mon, 24 Feb 2025 03:53:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NM4Hin001740;
 Mon, 24 Feb 2025 03:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ALU04tsqdZsRPiZwa5Y6ZXqz2LMFNuvmWWw14DcDdbI=; b=CeUtgmJ48KQhhit0
 84ugcNOGp9lmAOhyD1xbKk9M3uGwFjHtGnIKI05EblYKrpy/G34i+A1GYHv5J4xf
 nlfi3dxyKp3qdmn4n0E+KguyGcbNjhuSJJvvl4mDSvrsiyTUUu+EKqbASV2uITvW
 lg9zTGIlYkE7A494ycr9U9E9JKmNwiaxuLuf9hpEa0XUKmfP8EAzHbiYfaO1dAxg
 csMeNSaW7jvmhLyDNhRF2W4QC83c3p5mVASpuES1eilWi7kJ4NF44+604WrbgCLM
 i253xFM8polYGnml+/uObqMtj1+iQmEoCaWd4rqYhYAsIa8M/e/7EqJsIm5BrNYl
 UsvECg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnbq2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2025 03:53:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O3rQNW005913
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2025 03:53:26 GMT
Received: from [10.110.85.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Feb
 2025 19:53:26 -0800
Message-ID: <a49164d9-50ec-4362-954d-5667725d1a94@quicinc.com>
Date: Sun, 23 Feb 2025 19:53:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/msm/dpu: allow sharing SSPP between planes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: J4cGPwJ5op0wOEYXkWlTFI3bXNF8R20e
X-Proofpoint-GUID: J4cGPwJ5op0wOEYXkWlTFI3bXNF8R20e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240026
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



On 12/15/2024 5:10 AM, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consequetive planes are considered.
> 

consequetive - > consecutive (this was highlighted in v4 too)

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> This patch has been deferred from v5 of virtual wide patchset to
> simplify the merging path. Now as the wide planes have been merged, pick
> up the patch that allows sharing of the SSPPs between two planes.
> ---
> Changes since v4:
> - Rebased on top of the current msm-next-lumag
> - Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
>    (Abhinav)
> - Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 153 +++++++++++++++++++++++++-----
>   1 file changed, 128 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003cde90ce6219c97ee18fa055a92a5..2fd21d27df4741a8d942f9c9bae989f319cfb8d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -887,10 +887,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   	return 0;
>   }
>   
> -static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> -						   struct dpu_sw_pipe_cfg *pipe_cfg,
> -						   const struct msm_format *fmt,
> -						   uint32_t max_linewidth)
> +static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
> +					  struct dpu_sw_pipe_cfg *pipe_cfg,
> +					  const struct msm_format *fmt)
>   {
>   	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
>   	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> @@ -902,10 +901,6 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>   	if (MSM_FORMAT_IS_YUV(fmt))
>   		return false;
>   
> -	if (MSM_FORMAT_IS_UBWC(fmt) &&
> -	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> -		return false;
> -
>   	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
>   	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
>   		return false;
> @@ -913,6 +908,27 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>   	return true;
>   }
>   
> +static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
> +					 const struct msm_format *fmt,
> +					 uint32_t max_linewidth)
> +{
> +	if (MSM_FORMAT_IS_UBWC(fmt) &&
> +	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> +						   struct dpu_sw_pipe_cfg *pipe_cfg,
> +						   const struct msm_format *fmt,
> +						   uint32_t max_linewidth)
> +{
> +	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
> +		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> +}
> +
> +
>   static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   				       struct drm_atomic_state *state,
>   				       const struct drm_crtc_state *crtc_state)
> @@ -1001,6 +1017,69 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
>   	return true;
>   }
>   
> +static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> +					  struct dpu_plane_state *prev_pstate,
> +					  const struct msm_format *fmt,
> +					  uint32_t max_linewidth)
> +{
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
> +	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
> +	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_pstate->base.fb);
> +	u16 max_tile_height = 1;
> +
> +	if (prev_pstate->r_pipe.sspp != NULL ||
> +	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> +		return false;
> +
> +	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
> +	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
> +		return false;
> +
> +	if (MSM_FORMAT_IS_UBWC(fmt))
> +		max_tile_height = max(max_tile_height, fmt->tile_height);
> +
> +	if (MSM_FORMAT_IS_UBWC(prev_fmt))
> +		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> +
> +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	r_pipe->sspp = NULL;
> +
> +	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> +	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> +	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> +	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
> +		pipe->sspp = prev_pipe->sspp;
> +
> +		pipe->multirect_index = DPU_SSPP_RECT_1;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> +		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> +
> +		return true;
> +	}
> +
> +	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
> +	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
> +		pipe->sspp = prev_pipe->sspp;
> +
> +		pipe->multirect_index = DPU_SSPP_RECT_1;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> +
> +		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
> +		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>   				  struct drm_atomic_state *state)
>   {
> @@ -1098,13 +1177,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   					      struct dpu_global_state *global_state,
>   					      struct drm_atomic_state *state,
> -					      struct drm_plane_state *plane_state)
> +					      struct drm_plane_state *plane_state,
> +					      struct drm_plane_state *prev_plane_state)
>   {
>   	const struct drm_crtc_state *crtc_state = NULL;
>   	struct drm_plane *plane = plane_state->plane;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   	struct dpu_rm_sspp_requirements reqs;
> -	struct dpu_plane_state *pstate;
> +	struct dpu_plane_state *pstate, *prev_pstate;
>   	struct dpu_sw_pipe *pipe;
>   	struct dpu_sw_pipe *r_pipe;
>   	struct dpu_sw_pipe_cfg *pipe_cfg;
> @@ -1116,6 +1196,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   							   plane_state->crtc);
>   
>   	pstate = to_dpu_plane_state(plane_state);
> +	prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
>   	pipe = &pstate->pipe;
>   	r_pipe = &pstate->r_pipe;
>   	pipe_cfg = &pstate->pipe_cfg;
> @@ -1134,24 +1215,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   
>   	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>   
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> +		if (!prev_pstate ||
> +		    !dpu_plane_try_multirect_shared(pstate, prev_pstate, fmt,
> +						    dpu_kms->catalog->caps->max_linewidth)) {
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
>   
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(plane_state->fb),
> -					      dpu_kms->catalog->caps->max_linewidth)) {
> -		/* multirect is not possible, use two SSPP blocks */
> -		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!r_pipe->sspp)
> +			r_pipe->sspp = NULL;
> +
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
> +	} else {
> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +		if (!pipe->sspp)
>   			return -ENODEV;
>   
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +						      pipe->sspp,
> +						      msm_framebuffer_format(plane_state->fb),
> +						      dpu_kms->catalog->caps->max_linewidth)) {
> +			/* multirect is not possible, use two SSPP blocks */
> +			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!r_pipe->sspp)
> +				return -ENODEV;
>   
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
>   	}
>   
>   	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> @@ -1165,6 +1264,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   {
>   	unsigned int i;
>   	int ret;
> +	struct drm_plane_state *prev_plane_state = NULL;
>   
>   	for (i = 0; i < num_planes; i++) {
>   		struct drm_plane_state *plane_state = states[i];
> @@ -1174,9 +1274,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   			continue;
>   
>   		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> -							 state, plane_state);
> +							 state, plane_state,
> +							 prev_plane_state);
>   		if (ret)
>   			break;
> +
> +		prev_plane_state = plane_state;
>   	}

We agreed to rename this to prev_adjacent_plane_state in v4. This has 
not been addressed.

With these two changes done,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>   
>   	return ret;
> 
> ---
> base-commit: d82c9281189d2b27642ede2760db495379503b86
> change-id: 20241215-dpu-share-sspp-75a566eec185
> 
> Best regards,

