Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09EEAB0200
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACF110E940;
	Thu,  8 May 2025 18:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e4G+a+RN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6812B10E93F;
 Thu,  8 May 2025 18:01:02 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cDRp012603;
 Thu, 8 May 2025 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWJgU0/yq5pGSENJwMl0YveYRJtHXY45M6wwzjSwn9A=; b=e4G+a+RNAPll+Azo
 Cdy4zcLGidaRTsIcU4as8Xf8LlvDSdJQ3IwGCilzPelUspbR4kdi7suYArUuhSFT
 Um39o/1XnXXlpv5x7T2VxiFYhBc/EMIHGcJ5QtlgILSuiSFveGqz5Ozhn5Ub5T88
 ZdGLXvWE1zy1S+l5lQXZ+Fz+ObObICcXZpNZYPCp/y2V4z4Xe30k3ne7lLl6gXRD
 3OhQs9DBZF2/jMULRQgi8jCz/8iA20KYjOm8Vpq1akBqq0JLnCnPcE4nldhThL4N
 73iiSPoPeLIJs0OvEMDLjdgeluyRJBAd2HEmdAXEXs7LtaB+FyU6mbXnCquevqZo
 JK1ofg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52sb6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 18:00:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548I05Im024368
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 18:00:05 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 11:00:05 -0700
Message-ID: <32900da6-0dad-4024-b9d1-cd6f07447af1@quicinc.com>
Date: Thu, 8 May 2025 11:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/14] drm/msm/dpu: handle pipes as array
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-8-f7b273a8cc80@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250506-quad-pipe-upstream-v9-8-f7b273a8cc80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE1OSBTYWx0ZWRfXy+Fgk2z2sFZ/
 gNNmU/yqAm1aYRSOZCP0DIZ+jNREThE5v3wguLFZatEV04iJ/H64qk46mp2AN40amlrTWVTtBAn
 lZxjoT6Dp9LNion991x6MHutNtk+kuM96YQT7cxTJo7cE7ugnSC/4yQSXXh70S2izWK9CJaWjn6
 X0hzSLZ0k1D0uuQNhyh4dWUIYwzMIQnwAzyiUmSBjGqbcGU4K9y5UseCrb8C3wdC29kBPnt5WLd
 LjlDcx0ca1MNvKaXtvQTd+yEDMlwiI9n7PqDoq4/YD1E8qIFZNyXajdgHKlvb0AA9jgp6dH6jVj
 0Xas+EtGx18tKbyRSJXmZAdeSUO4BIv17NeaM+Zwj/aeLQ+3wLLU8PJBS315s67OoKW5bdTtn+U
 yRKYp05lgIIXBlj34D5UnsvKOq/fbnt3JWQe0Fv/uNr3WvR4g2UV+BpZd0TeQAbAY5ey3sSU
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681cf126 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=hTr5nq-WQ0FNcBpSPF0A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UynwrvB7_zkNiwu4YMEXkkG3HnsUF37-
X-Proofpoint-GUID: UynwrvB7_zkNiwu4YMEXkkG3HnsUF37-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080159
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



On 5/6/2025 8:47 AM, Jun Nie wrote:
> There are 2 pipes in a drm plane at most currently, while 4 pipes are
> required for quad-pipe case. Generalize the handling to pipe pair and
> ease handling to another pipe pair later. Store pipes in array with
> removing dedicated r_pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Jun,

I think my R-b from v8 was dropped. Since I don't see any changes from 
v8 here:

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 169 +++++++++++++++++-------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
>   3 files changed, 113 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 095497d80e8a4168ed6b7b0a1b0f535bb9099d7d..6338603bf8be9fcc4324b098d5d69d20235cdbae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	const struct msm_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> -	uint32_t lm_idx;
> +	uint32_t lm_idx, i;
>   	bool bg_alpha_enable = false;
>   	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>   
> @@ -463,20 +463,15 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -		set_bit(pstate->pipe.sspp->idx, fetch_active);
> -		_dpu_crtc_blend_setup_pipe(crtc, plane,
> -					   mixer, cstate->num_mixers,
> -					   pstate->stage,
> -					   format, fb ? fb->modifier : 0,
> -					   &pstate->pipe, 0, stage_cfg);
> -
> -		if (pstate->r_pipe.sspp) {
> -			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> +		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +			if (!pstate->pipe[i].sspp)
> +				continue;
> +			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
>   			_dpu_crtc_blend_setup_pipe(crtc, plane,
>   						   mixer, cstate->num_mixers,
>   						   pstate->stage,
>   						   format, fb ? fb->modifier : 0,
> -						   &pstate->r_pipe, 1, stage_cfg);
> +						   &pstate->pipe[i], i, stage_cfg);
>   		}
>   
>   		/* blend config update */
> @@ -1634,15 +1629,15 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>   		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>   			state->crtc_x, state->crtc_y, state->crtc_w,
>   			state->crtc_h);
> -		seq_printf(s, "\tsspp[0]:%s\n",
> -			   pstate->pipe.sspp->cap->name);
> -		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
> -			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
> -		if (pstate->r_pipe.sspp) {
> -			seq_printf(s, "\tsspp[1]:%s\n",
> -				   pstate->r_pipe.sspp->cap->name);
> -			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
> -				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
> +
> +		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +			if (!pstate->pipe[i].sspp)
> +				continue;
> +			seq_printf(s, "\tsspp[%d]:%s\n",
> +				   i, pstate->pipe[i].sspp->cap->name);
> +			seq_printf(s, "\tmultirect[%d]: mode: %d index: %d\n",
> +				   i, pstate->pipe[i].multirect_mode,
> +				   pstate->pipe[i].multirect_index);
>   		}
>   
>   		seq_puts(s, "\n");
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index aeb90c287245d6aaa18b9f280d1e628ee6ed74f5..4cb81a6a692be51d342d9a6f322b632e5fd07b2c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	struct msm_drm_private *priv = plane->dev->dev_private;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
> +	int i;
>   
>   	DPU_DEBUG_PLANE(pdpu, "\n");
>   
> @@ -632,12 +633,13 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   		return;
>   
>   	/* update sspp */
> -	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
> -				   fill_color, fmt);
> -
> -	if (pstate->r_pipe.sspp)
> -		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (!pstate->pipe[i].sspp)
> +			continue;
> +		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> +					   &pstate->pipe_cfg[i].dst_rect,
>   					   fill_color, fmt);
> +	}
>   }
>   
>   static int dpu_plane_prepare_fb(struct drm_plane *plane,
> @@ -827,8 +829,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>   	struct drm_rect fb_rect = { 0 };
>   	uint32_t max_linewidth;
>   
> @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   		return -EINVAL;
>   	}
>   
> +	/* move the assignment here, to ease handling to another pairs later */
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
>   	/* state->src is 16.16, src_rect is not */
>   	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
>   
> @@ -949,10 +954,10 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   		drm_atomic_get_new_plane_state(state, plane);
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
>   	int ret = 0;
>   
>   	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> @@ -1011,10 +1016,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
>   	const struct drm_crtc_state *crtc_state = NULL;
>   	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
>   
> @@ -1058,7 +1063,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   		drm_atomic_get_old_plane_state(state, plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>   	struct drm_crtc_state *crtc_state;
> -	int ret;
> +	int ret, i;
>   
>   	if (plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1073,8 +1078,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   		 * resources are freed by dpu_crtc_assign_plane_resources(),
>   		 * but clean them here.
>   		 */
> -		pstate->pipe.sspp = NULL;
> -		pstate->r_pipe.sspp = NULL;
> +		for (i = 0; i < PIPES_PER_STAGE; i++)
> +			pstate->pipe[i].sspp = NULL;
>   
>   		return 0;
>   	}
> @@ -1111,19 +1116,21 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	struct dpu_sw_pipe_cfg *pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>   	const struct msm_format *fmt;
> +	int i;
>   
>   	if (plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
>   							   plane_state->crtc);
>   
>   	pstate = to_dpu_plane_state(plane_state);
> -	pipe = &pstate->pipe;
> -	r_pipe = &pstate->r_pipe;
> -	pipe_cfg = &pstate->pipe_cfg;
> -	r_pipe_cfg = &pstate->r_pipe_cfg;
>   
> -	pipe->sspp = NULL;
> -	r_pipe->sspp = NULL;
> +	pipe = &pstate->pipe[0];
> +	r_pipe = &pstate->pipe[1];
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i++)
> +		pstate->pipe[i].sspp = NULL;
>   
>   	if (!plane_state->fb)
>   		return -EINVAL;
> @@ -1212,6 +1219,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
>   	struct dpu_plane_state *pstate;
> +	int i;
>   
>   	if (!plane || !plane->state) {
>   		DPU_ERROR("invalid plane\n");
> @@ -1232,8 +1240,8 @@ void dpu_plane_flush(struct drm_plane *plane)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>   	else {
> -		dpu_plane_flush_csc(pdpu, &pstate->pipe);
> -		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> +		for (i = 0; i < PIPES_PER_STAGE; i++)
> +			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>   	}
>   
>   	/* flag h/w flush complete */
> @@ -1334,15 +1342,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct drm_plane_state *state = plane->state;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
>   	bool is_rt_pipe;
>   	const struct msm_format *fmt =
>   		msm_framebuffer_format(fb);
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	int i;
>   
>   	pstate->pending = true;
>   
> @@ -1357,12 +1362,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   			crtc->base.id, DRM_RECT_ARG(&state->dst),
>   			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>   
> -	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> -				   drm_mode_vrefresh(&crtc->mode),
> -				   &pstate->layout);
> -
> -	if (r_pipe->sspp) {
> -		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
> +	/* move the assignment here, to ease handling to another pairs later */
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (!pstate->pipe[i].sspp)
> +			continue;
> +		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> +					   &pstate->pipe_cfg[i], fmt,
>   					   drm_mode_vrefresh(&crtc->mode),
>   					   &pstate->layout);
>   	}
> @@ -1370,15 +1375,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   	if (pstate->needs_qos_remap)
>   		pstate->needs_qos_remap = false;
>   
> -	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
> -						    &crtc->mode, pipe_cfg);
> -
> -	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
> -
> -	if (r_pipe->sspp) {
> -		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
> +	pstate->plane_fetch_bw = 0;
> +	pstate->plane_clk = 0;
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (!pstate->pipe[i].sspp)
> +			continue;
> +		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> +							     &crtc->mode, &pstate->pipe_cfg[i]);
>   
> -		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> +		pstate->plane_clk = max(pstate->plane_clk,
> +					_dpu_plane_calc_clk(&crtc->mode,
> +							    &pstate->pipe_cfg[i]));
>   	}
>   }
>   
> @@ -1386,17 +1393,31 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>   {
>   	struct drm_plane_state *state = plane->state;
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe *pipe;
> +	int i;
>   
> -	trace_dpu_plane_disable(DRMID(plane), false,
> -				pstate->pipe.multirect_mode);
> +	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
>   
> -	if (r_pipe->sspp) {
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		trace_dpu_plane_disable(DRMID(plane), false,
> +					pstate->pipe[i].multirect_mode);
> +
> +		if (!pipe->sspp)
> +			continue;
>   
> -		if (r_pipe->sspp->ops.setup_multirect)
> -			r_pipe->sspp->ops.setup_multirect(r_pipe);
> +		if (i % PIPES_PER_STAGE == 0)
> +			continue;
> +
> +		/*
> +		 * clear multirect for the right pipe so that the SSPP
> +		 * can be further reused in the solo mode
> +		 */
> +		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		if (pipe->sspp->ops.setup_multirect)
> +			pipe->sspp->ops.setup_multirect(pipe);
>   	}
>   
>   	pstate->pending = true;
> @@ -1491,31 +1512,26 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>   		const struct drm_plane_state *state)
>   {
>   	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	const struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	const struct dpu_sw_pipe *pipe;
> +	const struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int i;
>   
>   	drm_printf(p, "\tstage=%d\n", pstate->stage);
>   
> -	if (pipe->sspp) {
> -		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> -		drm_printf(p, "\tmultirect_mode[0]=%s\n",
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		drm_printf(p, "\tsspp[%d]=%s\n", i, pipe->sspp->cap->name);
> +		drm_printf(p, "\tmultirect_mode[%d]=%s\n", i,
>   			   dpu_get_multirect_mode(pipe->multirect_mode));
> -		drm_printf(p, "\tmultirect_index[0]=%s\n",
> +		drm_printf(p, "\tmultirect_index[%d]=%s\n", i,
>   			   dpu_get_multirect_index(pipe->multirect_index));
> -		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> -		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> -	}
> -
> -	if (r_pipe->sspp) {
> -		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> -		drm_printf(p, "\tmultirect_mode[1]=%s\n",
> -			   dpu_get_multirect_mode(r_pipe->multirect_mode));
> -		drm_printf(p, "\tmultirect_index[1]=%s\n",
> -			   dpu_get_multirect_index(r_pipe->multirect_index));
> -		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> -		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
> +		drm_printf(p, "\tsrc[%d]=" DRM_RECT_FMT "\n", i,
> +			   DRM_RECT_ARG(&pipe_cfg->src_rect));
> +		drm_printf(p, "\tdst[%d]=" DRM_RECT_FMT "\n", i,
> +			   DRM_RECT_ARG(&pipe_cfg->dst_rect));
>   	}
>   }
>   
> @@ -1553,14 +1569,17 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	int i;
>   
>   	if (!pdpu->is_rt_pipe)
>   		return;
>   
>   	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
> -	if (pstate->r_pipe.sspp)
> -		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (!pstate->pipe[i].sspp)
> +			continue;
> +		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
> +	}
>   	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>   }
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index acd5725175cdde4fcf7a9f71bb446251c5a14d22..052fd046e8463855b16b30389c2efc67c0c15281 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -18,10 +18,8 @@
>    * struct dpu_plane_state: Define dpu extension of drm plane state object
>    * @base:	base drm plane state object
>    * @aspace:	pointer to address space for input/output buffers
> - * @pipe:	software pipe description
> - * @r_pipe:	software pipe description of the second pipe
> - * @pipe_cfg:	software pipe configuration
> - * @r_pipe_cfg:	software pipe configuration for the second pipe
> + * @pipe:	software pipe description array
> + * @pipe_cfg:	software pipe configuration array
>    * @stage:	assigned by crtc blender
>    * @needs_qos_remap: qos remap settings need to be updated
>    * @multirect_index: index of the rectangle of SSPP
> @@ -35,10 +33,8 @@
>   struct dpu_plane_state {
>   	struct drm_plane_state base;
>   	struct msm_gem_address_space *aspace;
> -	struct dpu_sw_pipe pipe;
> -	struct dpu_sw_pipe r_pipe;
> -	struct dpu_sw_pipe_cfg pipe_cfg;
> -	struct dpu_sw_pipe_cfg r_pipe_cfg;
> +	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> +	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
>   	enum dpu_stage stage;
>   	bool needs_qos_remap;
>   	bool pending;
> 

