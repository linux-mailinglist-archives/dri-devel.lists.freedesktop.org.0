Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6D68FB66
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 00:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3810E8BC;
	Wed,  8 Feb 2023 23:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B010E8BC;
 Wed,  8 Feb 2023 23:45:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318Ne7tl022719; Wed, 8 Feb 2023 23:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wyGf6Tc4T59wjxA3/3cTucZYWcs/+ZiResn3kMAdYuY=;
 b=oBrz2ZR5s5ggXShYlhAqfzXsIYDj647SGmOKbXUvEwvsHS9Wax2Kwdy91nG+Fe2jcMfN
 xV66S5ykT8OoDyCcyheHF1F8J4DoVORvuJeShj0LDNRg32AuZtWc38+ImkJDFrhTrXLE
 uy25CVRNao7uOshcmdqHQx3s5AYJ78Sznrkb3nZaxUfK/SLeIh20dlxA9wkYf5KU7RnQ
 K5Kgx+mEZ2Dbsu/+O2q+pH+WlvuaNBpjJ5pcoyc7I5w4m9ZJlhAYkyCttetvaiOnF4Z+
 bG8LxOicrpJgA2QmOL+fuvX8vTXRwNJn5HUjPEHZPr8UaRkYHWil6wDBOW3RtQI3FiTf Kw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkk2d5anj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 23:44:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318NitCP018577
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Feb 2023 23:44:55 GMT
Received: from [10.110.17.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 8 Feb 2023
 15:44:54 -0800
Message-ID: <133ba8d8-f52f-42a5-712c-039f225d61fa@quicinc.com>
Date: Wed, 8 Feb 2023 15:44:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 26/27] drm/msm/dpu: split pipe handling from
 _dpu_crtc_blend_setup_mixer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-27-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230203182132.1307834-27-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: beZlYQduvACaOORvNR-9m9g8MSh4xSHv
X-Proofpoint-ORIG-GUID: beZlYQduvACaOORvNR-9m9g8MSh4xSHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080200
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



On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
> Rework _dpu_crtc_blend_setup_mixer() to split away pipe handling to a
> separate functon. This is a preparation for the r_pipe support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 86 ++++++++++++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 ++-
>   2 files changed, 63 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 73e1a8c69ef0..0ca3bc38ff7e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -400,6 +400,47 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>   	}
>   }
>   
> +static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
> +				       struct drm_plane *plane,
> +				       struct dpu_crtc_mixer *mixer,
> +				       u32 num_mixers,
> +				       struct dpu_hw_stage_cfg *stage_cfg,
> +				       enum dpu_stage stage,
> +				       unsigned int stage_idx,
> +				       unsigned long *fetch_active,
> +				       struct dpu_sw_pipe *pipe
> +				      )
> +{
> +	uint32_t lm_idx;
> +	enum dpu_sspp sspp_idx;
> +	struct drm_plane_state *state;
> +
> +	if (!pipe->sspp)
> +		return;
> +
> +	sspp_idx = pipe->sspp->idx;
> +
> +	state = plane->state;
> +
> +	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> +			 crtc->base.id,
> +			 stage,
> +			 plane->base.id,
> +			 sspp_idx - SSPP_NONE,
> +			 state->fb ? state->fb->base.id : -1);
> +
> +	set_bit(sspp_idx, fetch_active);
> +
> +	stage_cfg->stage[stage][stage_idx] = sspp_idx;
> +	stage_cfg->multirect_index[stage][stage_idx] =
> +				pipe->multirect_index;
> +
> +	/* blend config update */
> +	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> +		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
> +								    sspp_idx);

If you just pass the format to this function you can move rest of the 
for loop also to this function.

Also, you will be able to add the trace_dpu_crtc_setup_mixer() with 
complete information.

trace_dpu_crtc_setup_mixer is currently missing te stage_idx which is 
important to debug blend issues.

> +}
> +
>   static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
>   	struct dpu_hw_stage_cfg *stage_cfg)
> @@ -412,15 +453,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct dpu_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> -	uint32_t stage_idx, lm_idx;
> -	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
> +	uint32_t lm_idx;
>   	bool bg_alpha_enable = false;
>   	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>   
>   	memset(fetch_active, 0, sizeof(fetch_active));
>   	drm_atomic_crtc_for_each_plane(plane, crtc) {
> -		enum dpu_sspp sspp_idx;
> -
>   		state = plane->state;
>   		if (!state)
>   			continue;
> @@ -431,39 +469,25 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		pstate = to_dpu_plane_state(state);
>   		fb = state->fb;
>   
> -		sspp_idx = pstate->pipe.sspp->idx;
> -		set_bit(sspp_idx, fetch_active);
> -
> -		DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> -				crtc->base.id,
> -				pstate->stage,
> -				plane->base.id,
> -				sspp_idx - SSPP_VIG0,
> -				state->fb ? state->fb->base.id : -1);
> -
>   		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>   
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -		stage_idx = zpos_cnt[pstate->stage]++;
> -		stage_cfg->stage[pstate->stage][stage_idx] =
> -					sspp_idx;
> -		stage_cfg->multirect_index[pstate->stage][stage_idx] =
> -					pstate->pipe.multirect_index;
> -
>   		trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
> -					   state, pstate, stage_idx,
> +					   state, pstate,
>   					   format->base.pixel_format,
>   					   fb ? fb->modifier : 0);
>   
> +		_dpu_crtc_blend_setup_pipe(crtc, plane,
> +					   mixer, cstate->num_mixers,
> +					   stage_cfg, pstate->stage, 0,
> +					   fetch_active,
> +					   &pstate->pipe);
> +
>   		/* blend config update */
>   		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
> -			_dpu_crtc_setup_blend_cfg(mixer + lm_idx,
> -						pstate, format);
> -
> -			mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
> -									    sspp_idx);
> +			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
>   
>   			if (bg_alpha_enable && !format->alpha_enable)
>   				mixer[lm_idx].mixer_op_mode = 0;
> @@ -1297,8 +1321,16 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>   		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>   			state->crtc_x, state->crtc_y, state->crtc_w,
>   			state->crtc_h);
> -		seq_printf(s, "\tmultirect: mode: %d index: %d\n",
> +		seq_printf(s, "\tsspp[0]:%d\n",
> +			   pstate->pipe.sspp->idx - SSPP_NONE);
> +		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
>   			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
> +		if (pstate->r_pipe.sspp) {
> +			seq_printf(s, "\tsspp[1]:%d\n",
> +				   pstate->r_pipe.sspp->idx - SSPP_NONE);
> +			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
> +				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
> +		}
>   
>   		seq_puts(s, "\n");
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 0ad148cc2fb8..5ec4f89e8814 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -633,9 +633,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
>   TRACE_EVENT(dpu_crtc_setup_mixer,
>   	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>   		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
> -		 uint32_t stage_idx, uint32_t pixel_format,
> +		 uint32_t pixel_format,
>   		 uint64_t modifier),
> -	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> +	TP_ARGS(crtc_id, plane_id, state, pstate,
>   		pixel_format, modifier),
>   	TP_STRUCT__entry(
>   		__field(	uint32_t,		crtc_id		)
> @@ -643,7 +643,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>   		__field(	uint32_t,		fb_id		)
>   		__field_struct(	struct drm_rect,	src_rect	)
>   		__field_struct(	struct drm_rect,	dst_rect	)
> -		__field(	uint32_t,		stage_idx	)
>   		__field(	enum dpu_stage,		stage		)
>   		__field(	enum dpu_sspp,		sspp		)
>   		__field(	uint32_t,		multirect_idx	)
> @@ -657,7 +656,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>   		__entry->fb_id = state ? state->fb->base.id : 0;
>   		__entry->src_rect = drm_plane_state_src(state);
>   		__entry->dst_rect = drm_plane_state_dest(state);
> -		__entry->stage_idx = stage_idx;
>   		__entry->stage = pstate->stage;
>   		__entry->sspp = pstate->pipe.sspp->idx;
>   		__entry->multirect_idx = pstate->pipe.multirect_index;
> @@ -666,13 +664,13 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>   		__entry->modifier = modifier;
>   	),
>   	TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
> -		  " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
> +		  " dst:" DRM_RECT_FMT " stage:%d, sspp:%d "
>   		  "multirect_index:%d multirect_mode:%u pix_format:%u "
>   		  "modifier:%llu",
>   		  __entry->crtc_id, __entry->plane_id, __entry->fb_id,
>   		  DRM_RECT_FP_ARG(&__entry->src_rect),
>   		  DRM_RECT_ARG(&__entry->dst_rect),
> -		  __entry->stage_idx, __entry->stage, __entry->sspp,
> +		  __entry->stage, __entry->sspp,
>   		  __entry->multirect_idx, __entry->multirect_mode,
>   		  __entry->pixel_format, __entry->modifier)
>   );
