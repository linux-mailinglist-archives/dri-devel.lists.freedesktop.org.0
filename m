Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECE904884
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 03:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2086410E12B;
	Wed, 12 Jun 2024 01:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h8OVDQgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C64710E12B;
 Wed, 12 Jun 2024 01:48:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BCZFQH009027;
 Wed, 12 Jun 2024 01:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qxXzdQxfHkCtNKsqmmrSyucgB2JfRhPahfaLkSnynM4=; b=h8OVDQgnM3uU+8V+
 xhOsJg0pdJy42sXz2ESIYhgHPzecaQRE7h9a+U3iLYX9Z4F+3ZmBsuBQLTVxC90c
 Phq8Plp0eLPcx6k90dsHg/6JqffW8je2ea3tSeSk4nHhP0tZWtFz/sUorpi4V8eJ
 N2zX1zKXriIo1ENS8lhVJtrpXf+Zf78v4JizfRpfMtPdP7uQcdhylSnzHA8g+rVg
 WZb9U6viWMjIZ3siTucoZRFYjDRCqSjVEuEqCHVq9KEaS97wf1HUy50j8sI9s+tC
 lIwLrXDKwXA8i32/YtWF6SK67WyA1hyWoF5bMiLR9oyREghMrvUamDVF7TdLsGsO
 SOp7+g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8s0f0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 01:48:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45C1m7ec019126
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2024 01:48:07 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 18:48:02 -0700
Message-ID: <0996ccd1-32b1-eaa9-0331-e0270da80da2@quicinc.com>
Date: Tue, 11 Jun 2024 18:47:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 12/13] drm/msm/dpu: allow sharing of blending stages
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-13-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dIB9REMI2tFqx5MOR1SzqHxCk81R5gqI
X-Proofpoint-GUID: dIB9REMI2tFqx5MOR1SzqHxCk81R5gqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120010
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
> It is possible to slightly bend the limitations of the HW blender. If
> two rectangles are contiguous (like two rectangles of a single plane)
> they can be blended using a single LM blending stage, allowing one to
> blend more planes via a single LM.
> 

Can you pls let me know the source of this optimization (assuming its 
present downstream) ?

Otherwise I will have to lookup some more docs to confirm this.

It certainly makes sense, that if the same layer is being split across 
two SSPP's we can certainly use the same blend stage. But want to make 
sure this is already in place somewhere and not something which was 
tried and just worked.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 37 ++++++++++++++++++-----
>   2 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 794c5643584f..fbbd7f635d04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -445,6 +445,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   	uint32_t lm_idx;
>   	bool bg_alpha_enable = false;
> +	unsigned int stage_indices[DPU_STAGE_MAX] = {};
>   	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>   
>   	memset(fetch_active, 0, sizeof(fetch_active));
> @@ -469,7 +470,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   					   mixer, cstate->num_mixers,
>   					   pstate->stage,
>   					   format, fb ? fb->modifier : 0,
> -					   &pstate->pipe, 0, stage_cfg);
> +					   &pstate->pipe,
> +					   stage_indices[pstate->stage]++,
> +					   stage_cfg);
>   
>   		if (pstate->r_pipe.sspp) {
>   			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> @@ -477,7 +480,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   						   mixer, cstate->num_mixers,
>   						   pstate->stage,
>   						   format, fb ? fb->modifier : 0,
> -						   &pstate->r_pipe, 1, stage_cfg);
> +						   &pstate->r_pipe,
> +						   stage_indices[pstate->stage]++,
> +						   stage_cfg);
>   		}

Is this part of the change related to this patch? We moved from 
hard-coding 0 and 1 for the stage_idx to stage_indices[pstate->stage] 
will still result in the same values of 0 and 1 right?

The sharing will be achieved with the change below of doing
pstate->stage = prev_pstate->stage.

Rest of the change LGTM.


>   
>   		/* blend config update */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 2e1c544efc4a..43dfe13eb298 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -827,13 +827,6 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> -	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> -	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> -		DPU_ERROR("> %d plane stages assigned\n",
> -			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> -		return -EINVAL;
> -	}
> -
>   	/* state->src is 16.16, src_rect is not */
>   	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
>   
> @@ -971,6 +964,18 @@ static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
>   		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
>   		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>   
> +		if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
> +		    pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
> +		    pipe_cfg->dst_rect.x1 == prev_pipe_cfg->dst_rect.x2) {
> +			pstate->stage = prev_pstate->stage;
> +		} else if (pipe_cfg->dst_rect.y1 == prev_pipe_cfg->dst_rect.y1 &&
> +			   pipe_cfg->dst_rect.y2 == prev_pipe_cfg->dst_rect.y2 &&
> +			   pipe_cfg->dst_rect.x2 == prev_pipe_cfg->dst_rect.x1) {
> +			pstate->stage = prev_pstate->stage;
> +			pipe->multirect_index = DPU_SSPP_RECT_0;
> +			prev_pipe->multirect_index = DPU_SSPP_RECT_1;
> +		}
> +
>   		return true;
>   	}
>   
> @@ -1080,6 +1085,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> +	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> +	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> +		DPU_ERROR("> %d plane stages assigned\n",
> +			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> +		return -EINVAL;
> +	}
> +
>   	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>   	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> @@ -1221,6 +1233,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   
>   	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
>   
> +	if (prev_pstate)
> +		pstate->stage = prev_pstate->stage + 1;
> +	else
> +		pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> +
>   	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
>   		if (!prev_pstate ||
>   		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
> @@ -1267,6 +1284,12 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   		}
>   	}
>   
> +	if (pstate->stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
> +		DPU_ERROR("> %d plane stages assigned\n",
> +			  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> +		return -EINVAL;
> +	}
> +
>   	return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
>   }
>   
