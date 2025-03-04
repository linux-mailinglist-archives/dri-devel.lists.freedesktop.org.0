Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4845A4EFA1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 22:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F83110E6BD;
	Tue,  4 Mar 2025 21:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Gy+HAwGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF2E10E472;
 Tue,  4 Mar 2025 21:56:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524KD6aY015969;
 Tue, 4 Mar 2025 21:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qyp8m8Sh49PD9qumn7tFoylai5tKzYR7lV/vxRbdQTY=; b=Gy+HAwGFVG+sHqUu
 5HWaAf7DzhaDWLrLy9rHCTQFu470a4lfzgjSvZscG8fPqjcMcERabEiDg8Ta3+A4
 b9vTUeiewZ+rBCNZpQAgio1iqpziBUU2UBHteE+gekT5tHNfCh6JfhFeQAMx0Ue8
 SwTTLM5Nrsx71cAw3fu8Z9zXdexygKpfrsYfKRqGDWY8W4cF+0JorZY+pdST+uWk
 GSr2g+FCUcA98WksrbYG7uz5oVZaQkcSZ9KD5tOjkb0KH2nfWF4AgKGKok4zQeeO
 8ymWm82eCGQzFzR8iW4WuENRwbslsP77UzuGH3BkufSznLPaFrDLj2hqMjjSiKgV
 QgAh3Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tkb2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Mar 2025 21:56:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524LuT5X013434
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 4 Mar 2025 21:56:29 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 13:56:29 -0800
Message-ID: <942b9411-e170-47ac-8af5-9a26f06db0a3@quicinc.com>
Date: Tue, 4 Mar 2025 13:56:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/15] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
 <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-11-eb5df105c807@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-11-eb5df105c807@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c7770e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8
 a=0uiON693c8ldkTsWMEsA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gkLFucouSjbiLnl0kPQGbnXC1jqo0jyk
X-Proofpoint-GUID: gkLFucouSjbiLnl0kPQGbnXC1jqo0jyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040175
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
> The stage contains configuration for a mixer pair. Currently the plane
> supports just one stage and 2 pipes. Quad-pipe support will require
> handling 2 stages and 4 pipes at the same time. In preparation for that
> add a separate define, PIPES_PER_PLANE, to denote number of pipes that
> can be used by the plane.

Hi Jun,

Sorry for missing this in the last revision, but it seems to me that the 
looping of the pipes in `_dpu_debugfs_status_show()` should also be 
using PIPES_PER_PLANE.

Thanks,

Jessica Zhang

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
>   4 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 193818b02197d0737c86de7765d98732fa914e8e..81474823e6799132db71c9712046d359e3535d90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
>   
> -		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		for (i = 0; i < PIPES_PER_PLANE; i++) {
>   			if (!pstate->pipe[i].sspp)
>   				continue;
>   			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index ba7bb05efe9b8cac01a908e53121117e130f91ec..74bf3ab9d6cfb8152b32d89a6c66e4d92d5cee1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,7 +34,9 @@
>   #define DPU_MAX_PLANES			4
>   #endif
>   
> +#define STAGES_PER_PLANE		1
>   #define PIPES_PER_STAGE			2
> +#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
>   #ifndef DPU_MAX_DE_CURVES
>   #define DPU_MAX_DE_CURVES		3
>   #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index ef44af5ab681c8f526333fa92531a2225983aa09..1095727d1d9f17407f2b063039bf2efd8733ec70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -633,7 +633,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   		return;
>   
>   	/* update sspp */
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> @@ -1078,7 +1078,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>   		 * resources are freed by dpu_crtc_assign_plane_resources(),
>   		 * but clean them here.
>   		 */
> -		for (i = 0; i < PIPES_PER_STAGE; i++)
> +		for (i = 0; i < PIPES_PER_PLANE; i++)
>   			pstate->pipe[i].sspp = NULL;
>   
>   		return 0;
> @@ -1129,7 +1129,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>   	pipe_cfg = &pstate->pipe_cfg[0];
>   	r_pipe_cfg = &pstate->pipe_cfg[1];
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i++)
> +	for (i = 0; i < PIPES_PER_PLANE; i++)
>   		pstate->pipe[i].sspp = NULL;
>   
>   	if (!plane_state->fb)
> @@ -1241,7 +1241,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>   		/* force 100% alpha */
>   		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>   	else {
> -		for (i = 0; i < PIPES_PER_STAGE; i++)
> +		for (i = 0; i < PIPES_PER_PLANE; i++)
>   			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>   	}
>   
> @@ -1364,7 +1364,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>   
>   	/* move the assignment here, to ease handling to another pairs later */
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> @@ -1378,7 +1378,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>   
>   	pstate->plane_fetch_bw = 0;
>   	pstate->plane_clk = 0;
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		if (!pstate->pipe[i].sspp)
>   			continue;
>   		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> @@ -1397,7 +1397,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>   	struct dpu_sw_pipe *pipe;
>   	int i;
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
>   		pipe = &pstate->pipe[i];
>   		if (!pipe->sspp)
>   			continue;
> @@ -1519,7 +1519,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>   
>   	drm_printf(p, "\tstage=%d\n", pstate->stage);
>   
> -	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
>   		pipe = &pstate->pipe[i];
>   		if (!pipe->sspp)
>   			continue;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index 052fd046e8463855b16b30389c2efc67c0c15281..18ff5ec2603ed63ce45f530ced3407d3b70c737b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -33,8 +33,8 @@
>   struct dpu_plane_state {
>   	struct drm_plane_state base;
>   	struct msm_gem_address_space *aspace;
> -	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> -	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
> +	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
> +	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
>   	enum dpu_stage stage;
>   	bool needs_qos_remap;
>   	bool pending;
> 
> -- 
> 2.34.1
> 

