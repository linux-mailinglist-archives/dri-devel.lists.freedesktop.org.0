Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C190478D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 01:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DF010E0DC;
	Tue, 11 Jun 2024 23:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y11ctdjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209CE10E044;
 Tue, 11 Jun 2024 23:12:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BFD0IM031044;
 Tue, 11 Jun 2024 23:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LkssiW4Rv/Oty1gAxuq6udQ7ea1djF3GtQiRocoy84s=; b=Y11ctdjcVVKbY7xG
 RKZefDtxTQyhrrQbYt5hH9DDMJJiTXfC6B5i09EznEeBfwYj01Y1CuO6HU/A0nQJ
 ZOExNP8WNolZqgcCtGxTqUwRT6BNuMaPXBQRtkCXkhr3X6EgHIvUxRwEtmgoLKRP
 wWLF+tZ4NLLiUfkZqqM5uK+lBwsOUGNFPIJJEkA2mFd1ZKy7RCxo9T3C68WXrzqt
 xCuFxF6wM2PRa70QmYZKWYjQR/zP4v9cWt6UZxjpMKY9WA0FQiixDoO4TP4sIS9z
 Ivs6X/AUxJ5FlDs6EXvDteu0JO6gyFbmlrvwOs/fHRDmDiY5E+CS5SB9Hw0szg2j
 nkbGgQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmyjx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 23:12:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BNCbfh021775
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 23:12:37 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 16:12:32 -0700
Message-ID: <68dc0d98-9830-d71d-ec65-71890fb2986e@quicinc.com>
Date: Tue, 11 Jun 2024 16:12:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 10/13] drm/msm/dpu: allow sharing SSPP between planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0DjmiNwj1zJl1JC9bvmpU94Co6ra59tl
X-Proofpoint-ORIG-GUID: 0DjmiNwj1zJl1JC9bvmpU94Co6ra59tl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_11,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110157
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
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consequetive planes are considered.
> 

consequetive - > consecutive

Can you please explain why only consecutive planes are considered for this?

So lets say we have 4 virtual planes : 0, 1, 2, 3

It will try 0-1, 1-2, 2-3

Because all planes are virtual, there are only 3 unique pairs to be 
considered? Otherwise technically 6 pairs are possible.


General request:

Patches 1-9 : Add support for using 2 SSPPs in one plane
Patches 10-12 : Add support for using two rectangles of the same SSPP as 
two virtual planes
Patch 13 : Can be pushed along with the first set.

Can we break up this series in this way to make it easier to test and 
land the bulk of it in this cycle?

I have some doubts on patches 10-12 and would like to spend more time 
reviewing and testing this. So I am trying to reduce the debt of patches 
we have been carrying as this is a tricky feature to simulate and test 
the cases.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 128 +++++++++++++++++++---
>   1 file changed, 112 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index cde20c1fa90d..2e1c544efc4a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -886,10 +886,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>   	return 0;
>   }
>   
> -static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> -						   struct dpu_sw_pipe_cfg *pipe_cfg,
> -						   const struct dpu_format *fmt,
> -						   uint32_t max_linewidth)
> +static int dpu_plane_is_multirect_capable(struct dpu_sw_pipe *pipe,
> +					  struct dpu_sw_pipe_cfg *pipe_cfg,
> +					  const struct dpu_format *fmt)
>   {
>   	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
>   	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> @@ -901,6 +900,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
>   	if (DPU_FORMAT_IS_YUV(fmt))
>   		return false;
>   
> +	return true;
> +}
> +
> +static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
> +					 const struct dpu_format *fmt,
> +					 uint32_t max_linewidth)
> +{
>   	if (DPU_FORMAT_IS_UBWC(fmt) &&
>   	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
>   		return false;
> @@ -908,6 +914,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
>   	return true;
>   }
>   
> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> +						   struct dpu_sw_pipe_cfg *pipe_cfg,
> +						   const struct dpu_format *fmt,
> +						   uint32_t max_linewidth)
> +{
> +	return dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) &&
> +		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> +}
> +
> +
> +static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
> +				   struct dpu_plane_state *prev_pstate,
> +				   const struct dpu_format *fmt,
> +				   uint32_t max_linewidth)
> +{
> +	struct dpu_sw_pipe *pipe = &pstate->pipe;
> +	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> +	struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
> +	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
> +	const struct dpu_format *prev_fmt =
> +		to_dpu_format(msm_framebuffer_format(prev_pstate->base.fb));
> +	u16 max_tile_height = 1;
> +
> +	if (prev_pstate->r_pipe.sspp != NULL ||
> +	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> +		return false;
> +
> +	if (!dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) ||
> +	    !dpu_plane_is_multirect_capable(prev_pipe, prev_pipe_cfg, prev_fmt) ||
> +	    !(test_bit(DPU_SSPP_SMART_DMA_V1, &prev_pipe->sspp->cap->features) ||
> +	      test_bit(DPU_SSPP_SMART_DMA_V2, &prev_pipe->sspp->cap->features)))

This test_bit check should be absorbed into 
dpu_plane_is_multirect_capable()?

> +		return false;
> +
> +	if (DPU_FORMAT_IS_UBWC(fmt))
> +		max_tile_height = max(max_tile_height, fmt->tile_height);
> +
> +	if (DPU_FORMAT_IS_UBWC(prev_fmt))
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

Even if y1 > y2 or y2 > y1 but the separation is less than the  2 * 
max_tile_height, it can qualify for parallel fetch.

So parallel fetch is possible not only in x direction but y direction as 
well as it will be fetched by different SSPPs.

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
>   static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>   					struct drm_atomic_state *state,
>   					const struct drm_crtc_state *crtc_state)
> @@ -1098,13 +1180,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
> @@ -1117,6 +1200,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   							   plane_state->crtc);
>   
>   	pstate = to_dpu_plane_state(plane_state);
> +	prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
>   	pipe = &pstate->pipe;
>   	r_pipe = &pstate->r_pipe;
>   	pipe_cfg = &pstate->pipe_cfg;
> @@ -1137,19 +1221,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   
>   	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
>   
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> -
>   	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		if (!prev_pstate ||
> +		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {

This is a bit confusing to check esp since i am unable to apply this 
patch and check .... but...

dpu_plane_atomic_check_nopipe() will set r_pipe_cfg if we are going to 
do multirect with two rectangles of the same sspp. Right?

Which means r_pipe_cfg will be 0 if multirect is not possible with same 
SSPP. Thats why the else case of this either uses two SSPPs.

So why are we trying multirect with again with the two rectangles of the 
same SSPP as different planes? The result will be same right?


> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
>   
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			r_pipe->sspp = NULL;
> +
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
>   
> -		r_pipe->sspp = NULL;
>   	} else {
> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +		if (!pipe->sspp)
> +			return -ENODEV;
> +

Unless I am missing something, you are assigning pipe->sspp in both if 
and else cases, so why dont you keep the allocation if pipe->sspp 
outside the conditionals.

>   		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
>   		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
>   		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> @@ -1186,6 +1278,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>   {
>   	unsigned int i;
>   	int ret;
> +	struct drm_plane_state *prev_plane_state = NULL;
>   

This naming is a bit confusing. prev_plane_state could mean the plane's 
previous state but here you are implying the state of the previous plane 
in the list of planes.

Maybe prev_adjacent_plane_state?

>   	for (i = 0; i < num_planes; i++) {
>   		struct drm_plane_state *plane_state = states[i];
> @@ -1195,9 +1288,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
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
>   
>   	return ret;
