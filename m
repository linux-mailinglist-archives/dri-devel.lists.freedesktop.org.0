Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25567A99B3E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 00:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8581810E283;
	Wed, 23 Apr 2025 22:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UtynJzZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7F710E0B9;
 Wed, 23 Apr 2025 22:08:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBEs4D014367;
 Wed, 23 Apr 2025 22:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OEQlUKkfnmUt4jlpeo3Vq8q4aEwqjke9KagT4WfFbyg=; b=UtynJzZcWe14mAB9
 yfAiipGIAjCTTWoCF6h28UX0vOEqvUyrbQd6HR3qs1JWGaDzwYjnhhx5gY70FhLZ
 /5F+rCZCk2s6XixFAeNSgsseipzMax0di3MPx3KulG5nLsluQC0cAHGhtCu0yxUc
 AeyLOuLkGZCTpagubASrPgF3sBYrD9S3m7gTMKpXR1cwpumvGiWdLb9Sbax8Pjjc
 gn7VMOD2RpMx2HRPzR1cwo2uXIrj1DN175a4gYcp4J5UJj63H7X0Q7AcQKLT5ZCu
 yv9kY/RUmUEe6wWRYAsxOyAvcCxQH1l/MJeXAA6fTocU03uZoiBGiaKjJLoSHNAO
 nMGJdw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bgub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:08:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NM8sI5025595
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Apr 2025 22:08:54 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 15:08:54 -0700
Message-ID: <a6eb0f12-6941-47a2-a86d-3a6e2feeba29@quicinc.com>
Date: Wed, 23 Apr 2025 15:08:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/msm/dpu: allow sharing SSPP between planes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250227-dpu-share-sspp-v6-1-4d469910f399@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250227-dpu-share-sspp-v6-1-4d469910f399@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NiBTYWx0ZWRfX9XGOF9HsDmCB
 FkKlRn14g+ehHhxfFWGzu0MTpcXipC0PgQiwzHi+3KzMzeIt9ZsB/sJMFNNTiHEa+oJN8IPhK+K
 hGWI3xf5qwkaFGLQVXmYThf0EEjMXhbNlBjGhdxf63BaMHjgNDiQ9yNlRv+FiNHSLK56a2b9eKw
 65PkKELucEKbBEBBEbLiQ9GuvOgxJvXE4jvPBc+J0BzcsX+lFHY6uOekKMVKnlnSykkJycmsdo5
 ZkPCDoUjDfUB6cdApjVv55ps2IZqhrvCbWzDenRt0LLx44GKDggKglxPEoWDLEtmPl7a05m7hUD
 Mb5nUPXyQhlgFxLXe+hKBQghRpN2Hc/bV2P1Xx7VzL8q2aomSxFrSXyLKY3B1JlP0sofSJi7qbS
 KWVEYd6O9A5CDj8i2AEmgpfvN7gZMqNxp0l1uNh3clMgHFXWJ9izAeX7SOxteC1uUX2VF28s
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680964f7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=UZlzyAkw_FUpu7lwVMsA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6o0Qak2Q2a_jlSP4fRMnY1ZRIZwoOFlV
X-Proofpoint-GUID: 6o0Qak2Q2a_jlSP4fRMnY1ZRIZwoOFlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230146
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



On 2/26/2025 6:31 PM, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> This patch has been deferred from v4 of virtual wide patchset to
> simplify the merging path. Now as the wide planes have been merged, pick
> up the patch that allows sharing of the SSPPs between two planes.
> ---
> Changes in v6:
> - Fixed typo (consecutive) in the commit message (Abhinav)
> - Renamed prev_plane_state to prev_adjancent_plane_state (Abhinav)
> - Renamed prev_pstate to prev_adjancent_pstate as a followup to the
>    previous change
> - Link to v5: https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org
> 
> Changes in v5:
> - Rebased on top of the current msm-next-lumag
> - Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
>    (Abhinav)
> - Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 156 +++++++++++++++++++++++++-----
>   1 file changed, 130 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index af3e541f60c303eb5212524e877129359b5ca98c..11c4d5dfd9703b27b7ffde34e9b4f92ec956c3c0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -887,10 +887,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   	return 0;
>   }
>   

<snip>

>   
> +static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> +					  struct dpu_plane_state *prev_adjancent_pstate,

pls fix typo

prev_adjancent_pstate ---> prev_adjacent_pstate in this entire function

With that fixed,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> +					  const struct msm_format *fmt,
> +					  uint32_t max_linewidth)
> +{
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct dpu_sw_pipe *prev_pipe = &prev_adjancent_pstate->pipe;
> +	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjancent_pstate->pipe_cfg;
> +	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjancent_pstate->base.fb);
> +	u16 max_tile_height = 1;
> +
> +	if (prev_adjancent_pstate->r_pipe.sspp != NULL ||
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
> +					      struct drm_plane_state *prev_adjancent_plane_state)
>   {
>   	const struct drm_crtc_state *crtc_state = NULL;
>   	struct drm_plane *plane = plane_state->plane;
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   	struct dpu_rm_sspp_requirements reqs;
> -	struct dpu_plane_state *pstate;
> +	struct dpu_plane_state *pstate, *prev_adjancent_pstate;
>   	struct dpu_sw_pipe *pipe;
>   	struct dpu_sw_pipe *r_pipe;
>   	struct dpu_sw_pipe_cfg *pipe_cfg;
> @@ -1116,6 +1196,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   							   plane_state->crtc);
>   
>   	pstate = to_dpu_plane_state(plane_state);
> +	prev_adjancent_pstate = prev_adjancent_plane_state ?
> +		to_dpu_plane_state(prev_adjancent_plane_state) : NULL;
>   	pipe = &pstate->pipe;
>   	r_pipe = &pstate->r_pipe;
>   	pipe_cfg = &pstate->pipe_cfg;
> @@ -1134,24 +1216,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   
>   	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>   
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> +		if (!prev_adjancent_pstate ||
> +		    !dpu_plane_try_multirect_shared(pstate, prev_adjancent_pstate, fmt,
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
> @@ -1164,6 +1264,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   			       unsigned int num_planes)
>   {
>   	unsigned int i;
> +	struct drm_plane_state *prev_adjancent_plane_state = NULL;
>   
>   	for (i = 0; i < num_planes; i++) {
>   		struct drm_plane_state *plane_state = states[i];
> @@ -1173,9 +1274,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   			continue;
>   
>   		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> -							 state, plane_state);
> +							     state, plane_state,
> +							     prev_adjancent_plane_state);
>   		if (ret)
> -			return ret;
> +			break;
> +
> +		prev_adjancent_plane_state = plane_state;
>   	}
>   
>   	return 0;
> 
> ---
> base-commit: 89839e69f6154feecd79bd01171375225b0296e9
> change-id: 20241215-dpu-share-sspp-75a566eec185
> 
> Best regards,

