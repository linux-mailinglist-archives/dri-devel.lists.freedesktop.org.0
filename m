Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4DB8D56EF
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 02:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A96F10E58B;
	Fri, 31 May 2024 00:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nQz4l9No";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CC210E226;
 Fri, 31 May 2024 00:28:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UGuVGT001837;
 Fri, 31 May 2024 00:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PdTUToQ/qpxd7Kzu0XBI0vZWZYujTF4o6iJ1w3qa+XE=; b=nQz4l9NoXn/mDlz6
 cytTKdzzGWKyhRI8Di1qLlVmfukd5TrkhypQ1tnDN3/y5ir3nA4MrNv7U7nZmP50
 lGLzKoD4lkBhF+qMtBzLFyfzPmQSfaeWR2SHH5hz+dgsmb4qqdTx0dwrcGbNJcvc
 Ix+j1HRysqaiUAnt4z1InFv8680GTBur5GkpGQ9gu4Ef5Gj20kTmTLfqHTeTSG4w
 6H7ltYftPQUEwCxz9/IL941gYpnJ5CfSxvKH1qLKF1WaHhZtV378EPK3WACUte+/
 q0NYCr2zp2XMPmdRtNo3l6fwKkKyYI3/fBHn3ZsKhzOjwXNu1YuNTIELbHzPXUxh
 T+SqNA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0gdkw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 00:28:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V0SfO0025519
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 00:28:41 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 17:28:36 -0700
Message-ID: <8b2bb781-f91d-5dd1-6307-4d39b00b0f5c@quicinc.com>
Date: Thu, 30 May 2024 17:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 03/13] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xKi6_QBCrl0iqsBer2APStF-9iL5w8zW
X-Proofpoint-ORIG-GUID: xKi6_QBCrl0iqsBer2APStF-9iL5w8zW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310000
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
> In preparation for virtualized planes support, move pstate->pipe
> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> case of virtual planes the plane's pipe will not be known up to the
> point of atomic_check() callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 26 +++++++++++------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9c52fe3c0261..70d6a8989e1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -795,6 +795,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);

We already have kms from a few lines above. No need for getting it again.

Rest LGTM.

>   	struct dpu_sw_pipe *pipe = &pstate->pipe;
>   	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>   	const struct drm_crtc_state *crtc_state = NULL;
> @@ -805,13 +806,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	uint32_t max_linewidth;
>   	unsigned int rotation;
>   	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
> -	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
>   
>   	if (new_plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
>   							   new_plane_state->crtc);
>   
> +	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +	r_pipe->sspp = NULL;
> +
> +	if (!pipe->sspp)
> +		return -EINVAL;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
>   	min_scale = FRAC_16_16(1, sblk->maxupscale);
>   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>   						  min_scale,
> @@ -828,7 +838,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -	r_pipe->sspp = NULL;
>   
>   	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> @@ -1292,7 +1301,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
>   	struct dpu_plane_state *pstate;
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	if (!plane) {
>   		DPU_ERROR("invalid plane\n");
> @@ -1314,16 +1322,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   		return;
>   	}
>   
> -	/*
> -	 * Set the SSPP here until we have proper virtualized DPU planes.
> -	 * This is the place where the state is allocated, so fill it fully.
> -	 */
> -	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -	pstate->r_pipe.sspp = NULL;
> -
>   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>   }
>   
