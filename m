Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F3DAB0300
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEE610E966;
	Thu,  8 May 2025 18:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XgoNchby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7092F10E961;
 Thu,  8 May 2025 18:39:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0OuE008438;
 Thu, 8 May 2025 18:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AwvyEPsD5Q0PCcCumP8CpW1fZpHC8RgQXGb7Ms2yZ00=; b=XgoNchbyi5Evdc4q
 odrtUiQV+AKOc7zAKngo7G37I5cs3bFT3HNLK6W6G140Nz2m5oatBcIrWDcCGq1n
 QvzzINxTPKJ0a5sf8vxa0MPXvSmlNePBdio3JK0XPz/bCAaD/PpjxaKy+spGNhw/
 FoxxqHk2olW8gGI0sCzWd9Pb7LQlg8A36U11KhvfoUwfHdjeUvtL5pRzDC5nSI73
 OQWwxulR5ExGWV/RXLD9bXaRaIYfyUW6mgfTT+8V76UtJgR5w4qCJAqCsOd2v05A
 MbPwBOn4x9MFepqrsuMR7FOf0tL/m58ApnwdiTSXtyRSQVy5oFuAowu4A5WTjDww
 axzzcA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5a9a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 May 2025 18:38:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548IcOXG024960
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 May 2025 18:38:24 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 11:38:23 -0700
Message-ID: <d86495d1-4d18-4809-a0a2-53ff26406e9f@quicinc.com>
Date: Thu, 8 May 2025 11:38:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/14] drm/msm/dpu: check every pipe per capability
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
 <20250506-quad-pipe-upstream-v9-2-f7b273a8cc80@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250506-quad-pipe-upstream-v9-2-f7b273a8cc80@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cfa21 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Gd4LdviHRNl5hc7774IA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GUkCkDEPsFlc9iNOPzm2O3vMhu7P9XP_
X-Proofpoint-ORIG-GUID: GUkCkDEPsFlc9iNOPzm2O3vMhu7P9XP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE2NiBTYWx0ZWRfXykdximAyVKat
 3rp/jXymrcpRgLbqU86z0dz4eIddFT1BuebWpGILWeUzxksREyalPHhqESkxz0XQtTFRX83pCkq
 HgcQfQjRwDHC7IC93OKlxDVuH2EqRDhycUXwcpTcSyMq/kQStzBEkgyYfp4Hkkpy67seiPoOBW5
 HAllb5mAUQqhGpplfCOG2zS76xagNKw0AQMJt6dBlBKXN54FtAsoxF7us0+2ezhdU7EPM0d83Ii
 +DmL2Z8H5fZlv+7PDDYAFw8jvNVB/RpeOTl1nvuIYOPl4RI2CztfRqF2jj2/0GKDANJkG0skwhR
 tno9gXHf6dcHOXyKm4mShrbglN9SVJf9I7R91LZV6BOlu4Aj009MTRXkxvYsPBeNzNDruDexc1t
 WPAKb6aXsUo825+Apv7/pWSSPiXDUsluzynC65/djV7B0t2dRhc8bf8aJPjN29USs8mgTIGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080166
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
> The capability stored in sblk and pipe_hw_caps is checked only for
> SSPP of the first pipe in the pair with current implementation. That
> of the 2nd pipe, r_pipe, is not checked and may violate hardware
> capability. Move requirement check to dpu_plane_atomic_check_pipe()
> for the check of every pipe.
> 
> Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Jun,

Just wanted to note that this has already been merged in msm-next [1] so 
I think you can drop this in the next revision.

But, FWIW

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

[1] 
https://gitlab.freedesktop.org/drm/msm/-/commit/bcaa391e177c06a58c5f3cd18484a317d40239aa

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
>   1 file changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index af3e541f60c303eb5212524e877129359b5ca98c..aeb90c287245d6aaa18b9f280d1e628ee6ed74f5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>   static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>   		struct dpu_sw_pipe *pipe,
>   		struct dpu_sw_pipe_cfg *pipe_cfg,
> -		const struct msm_format *fmt,
> -		const struct drm_display_mode *mode)
> +		const struct drm_display_mode *mode,
> +		struct drm_plane_state *new_plane_state)
>   {
>   	uint32_t min_src_size;
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	int ret;
> +	const struct msm_format *fmt;
> +	uint32_t supported_rotations;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
> +	/*
> +	 * We already have verified scaling against platform limitations.
> +	 * Now check if the SSPP supports scaling at all.
> +	 */
> +	if (!sblk->scaler_blk.len &&
> +	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +	      drm_rect_width(&new_plane_state->dst)) ||
> +	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> +	      drm_rect_height(&new_plane_state->dst))))
> +		return -ERANGE;
> +
> +	fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +		supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> +						   supported_rotations);
>   
>   	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>   
> @@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>   	struct dpu_sw_pipe *pipe = &pstate->pipe;
>   	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	const struct msm_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
>   	int ret = 0;
>   
> -	pipe_hw_caps = pipe->sspp->cap;
> -	sblk = pipe->sspp->cap->sblk;
> -
> -	/*
> -	 * We already have verified scaling against platform limitations.
> -	 * Now check if the SSPP supports scaling at all.
> -	 */
> -	if (!sblk->scaler_blk.len &&
> -	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> -	      drm_rect_width(&new_plane_state->dst)) ||
> -	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> -	      drm_rect_height(&new_plane_state->dst))))
> -		return -ERANGE;
> -
> -	fmt = msm_framebuffer_format(new_plane_state->fb);
> -
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> -
> -	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> -		supported_rotations |= DRM_MODE_ROTATE_90;
> -
> -	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> -						   supported_rotations);
> -	r_pipe_cfg->rotation = pipe_cfg->rotation;
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> -					  &crtc_state->adjusted_mode);
> +	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +					  &crtc_state->adjusted_mode,
> +					  new_plane_state);
>   	if (ret)
>   		return ret;
>   
>   	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -						  &crtc_state->adjusted_mode);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
> +						  &crtc_state->adjusted_mode,
> +						  new_plane_state);
>   		if (ret)
>   			return ret;
>   	}
> 

