Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF66B893E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 05:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D424710E0CB;
	Tue, 14 Mar 2023 04:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D5410E091;
 Tue, 14 Mar 2023 04:02:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E3WItq025225; Tue, 14 Mar 2023 04:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IQ9toOxHvsyrowamxeq5zRntlzvWvAOmUgY5A01o4uM=;
 b=TiwN44pxBqKbrgnHvudw48MRTY1F6zAbgM4zXuC2xVNKUR7mIe0ki2CxymhyVEzoKX+8
 PQrvSWrk4SZ9J3Xw7bdoNHSfF914yTCMAH2PWQboa7Y33qjNxkIm6JnFAawsocnb423m
 +KvcTZnCLxL9HPPpUtwt+PZ66lyN9DftFOynftJLP15X/gBsbrMe+b/AnmfkCCGx+Fcn
 MphgHWMlB/mTDO7qYxQIVQByZHttSBubWveoyXlpAqU6WM5HbnOwYQA5dG1c8ONjuTu6
 dg+dxfEEszcxQy4+P4AZn7dGFD9kwATA1hFPOVCoTj1vPP6g+1dgF0NcMoMZq9jCG4c3 1g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3paay38w3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:02:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32E422Q7004936
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 04:02:02 GMT
Received: from [10.110.64.241] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 21:02:01 -0700
Message-ID: <f71027ed-e871-94b5-86d3-58986ae40462@quicinc.com>
Date: Mon, 13 Mar 2023 21:02:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 16/32] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-17-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230310005704.1332368-17-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ymtAze_iFoWYHyO9bqw8d_HD-G4-4cya
X-Proofpoint-GUID: ymtAze_iFoWYHyO9bqw8d_HD-G4-4cya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140034
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



On 3/9/2023 4:56 PM, Dmitry Baryshkov wrote:
> Move plane state updates from dpu_crtc_atomic_check() to the function
> where they belong: to dpu_plane_atomic_check().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Can you please elaborate a bit on this comment?

https://patchwork.freedesktop.org/patch/521356/?series=99909&rev=4#comment_949772

Is something still missing? I dont see the multirects being cleared in 
dpu_plane_atomic_disable() before or even now.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>   3 files changed, 11 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0260c4d6ded7..bd09bb319a58 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   									  crtc);
>   	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> -	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>   
>   	const struct drm_plane_state *pstate;
>   	struct drm_plane *plane;
> @@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   	crtc_rect.x2 = mode->hdisplay;
>   	crtc_rect.y2 = mode->vdisplay;
>   
> -	 /* get plane state for all drm planes associated with crtc state */
> +	/* FIXME: move this to dpu_plane_atomic_check? */
>   	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
>   		struct dpu_plane_state *dpu_pstate = to_dpu_plane_state(pstate);
>   		struct drm_rect dst, clip = crtc_rect;
> -		int stage;
>   
>   		if (IS_ERR_OR_NULL(pstate)) {
>   			rc = PTR_ERR(pstate);
> @@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   
>   		dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>   
> -		dpu_plane_clear_multirect(pstate);
> -
>   		dst = drm_plane_state_dest(pstate);
>   		if (!drm_rect_intersect(&clip, &dst)) {
>   			DPU_ERROR("invalid vertical/horizontal destination\n");
> @@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>   				  DRM_RECT_ARG(&dst));
>   			return -E2BIG;
>   		}
> -
> -		/* verify stage setting before using it */
> -		stage = DPU_STAGE_0 + pstate->normalized_zpos;
> -		if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
> -			DPU_ERROR("> %d plane stages assigned\n",
> -				  dpu_kms->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> -			return -EINVAL;
> -		}
> -
> -		to_dpu_plane_state(pstate)->stage = stage;
> -		DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
> -
>   	}
>   
>   	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ce01a602cbc9..3fba63fbbd78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	return 0;
>   }
>   
> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
> -{
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
> -
> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -}
> -
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
>   {
>   	struct dpu_plane_state *pstate[R_MAX];
> @@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	if (!new_plane_state->visible)
>   		return 0;
>   
> +	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> +	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> +	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> +		DPU_ERROR("> %d plane stages assigned\n",
> +			  pdpu->catalog->caps->max_mixer_blendstages - DPU_STAGE_0);
> +		return -EINVAL;
> +	}
> +
>   	src.x1 = new_plane_state->src_x >> 16;
>   	src.y1 = new_plane_state->src_y >> 16;
>   	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 228db401e905..a08b0539513b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>    */
>   int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
>   
> -/**
> - * dpu_plane_clear_multirect - clear multirect bits for the given pipe
> - * @drm_state: Pointer to DRM plane state
> - */
> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
> -
>   /**
>    * dpu_plane_color_fill - enables color fill on plane
>    * @plane:  Pointer to DRM plane object
