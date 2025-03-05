Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59972A4F1F3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 01:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465B610E6D2;
	Wed,  5 Mar 2025 00:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HRVdt61T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010AB10E6D1;
 Wed,  5 Mar 2025 00:00:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NAHVW031827;
 Wed, 5 Mar 2025 00:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jxtt3HZrGPoT2LV9PishgDJcmzgpZkNVYAcCirTB0pc=; b=HRVdt61TE1+qu+j6
 ueT1indn/+W4Y7EMB468pEZEr+rUyPD2GFzvQBi+wP+MorcmEC7SOP4ZtJzWy8ie
 QMA/bodsTOUjF9dvAc2t9MbZrwA/SUAhbY+ZyVTLYtyjZDwjrKFhL5AvqmXx5MC+
 gptfwabwcva6yvD1D476CRuvNivlRjSMXclpwo8/kdbSnku/YJzoj3ws9CWP58oP
 PhaEwSMUP37TCewKpcsXw0lbJJ9NBoiupDDZ8l97dMtu9pTAKbvLy2mlxtMII02m
 oG08HZ6JZrDMAXPnK8hwCkAEw0ld00kvU97UEPSvgOguUrci6OmHcSb+sZdUE4sm
 wNvLNg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t3j0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Mar 2025 00:00:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52500WnV030387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Mar 2025 00:00:32 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 16:00:32 -0800
Message-ID: <21645a8e-d8fd-4abd-906c-dd184ebbb8d1@quicinc.com>
Date: Tue, 4 Mar 2025 16:00:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
 <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-12-eb5df105c807@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-12-eb5df105c807@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aSYvmhFGQPmsVDdlJ0zifZBGmSrC4Jjb
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c79421 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=JNjiuPNCUcLITEZ8of0A:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aSYvmhFGQPmsVDdlJ0zifZBGmSrC4Jjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503040191
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



On 3/3/2025 7:14 AM, Jun Nie wrote:
> Currently, only 2 pipes are used at most for a plane. A stage structure
> describes the configuration for a mixer pair. So only one stage is needed
> for current usage cases. The quad-pipe case will be added in future and 2
> stages are used in the case. So extend the stage to an array with array
> size STAGES_PER_PLANE and blend pipes per mixer pair with configuration
> in the stage structure.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++-----------
>   1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 81474823e6799132db71c9712046d359e3535d90..6fbe42e8988edac7e7917ae8de180aefdaf443e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -392,7 +392,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>   static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				       struct drm_plane *plane,
>   				       struct dpu_crtc_mixer *mixer,
> -				       u32 num_mixers,
> +				       u32 lms_in_stage,
>   				       enum dpu_stage stage,
>   				       const struct msm_format *format,
>   				       uint64_t modifier,
> @@ -426,7 +426,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
>   
>   	/* blend config update */
> -	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> +	for (lm_idx = 0; lm_idx < lms_in_stage; lm_idx++)
>   		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
>   }
>   
> @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	const struct msm_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> -	uint32_t lm_idx, i;
> +	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_stage;
>   	bool bg_alpha_enable = false;
>   	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>   
> @@ -463,15 +463,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -		for (i = 0; i < PIPES_PER_PLANE; i++) {
> -			if (!pstate->pipe[i].sspp)
> -				continue;
> -			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> -			_dpu_crtc_blend_setup_pipe(crtc, plane,
> -						   mixer, cstate->num_mixers,
> -						   pstate->stage,
> -						   format, fb ? fb->modifier : 0,
> -						   &pstate->pipe[i], i, stage_cfg);
> +		/* loop pipe per mixer pair with config in stage structure */
> +		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
> +			head_pipe_in_stage = stage * PIPES_PER_STAGE;
> +			for (i = 0; i < PIPES_PER_STAGE; i++) {
> +				pipe_idx = i + head_pipe_in_stage;
> +				if (!pstate->pipe[pipe_idx].sspp)
> +					continue;
> +
> +				lms_in_stage = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
> +						  PIPES_PER_STAGE);
> +				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
> +				_dpu_crtc_blend_setup_pipe(crtc, plane,
> +							   &mixer[head_pipe_in_stage],
> +							   lms_in_stage,
> +							   pstate->stage,
> +							   format, fb ? fb->modifier : 0,
> +							   &pstate->pipe[pipe_idx], i,
> +							   &stage_cfg[stage]);
> +			}
>   		}
>   
>   		/* blend config update */
> @@ -503,7 +513,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>   	struct dpu_crtc_mixer *mixer = cstate->mixers;
>   	struct dpu_hw_ctl *ctl;
>   	struct dpu_hw_mixer *lm;
> -	struct dpu_hw_stage_cfg stage_cfg;
> +	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
>   	int i;
>   
>   	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
> @@ -516,9 +526,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>   	}
>   
>   	/* initialize stage cfg */
> -	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
> +	memset(&stage_cfg, 0, sizeof(stage_cfg));
>   
> -	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
> +	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
>   
>   	for (i = 0; i < cstate->num_mixers; i++) {
>   		ctl = mixer[i].lm_ctl;
> @@ -535,8 +545,12 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>   			mixer[i].mixer_op_mode,
>   			ctl->idx - CTL_0);
>   
> +		/*
> +		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +		 * stage data is shared between PIPES_PER_STAGE pipes.
> +		 */
>   		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -			&stage_cfg);
> +			&stage_cfg[i / PIPES_PER_STAGE]);
>   	}
>   }
>   
> 
> -- 
> 2.34.1
> 

