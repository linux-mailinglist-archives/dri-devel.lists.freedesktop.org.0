Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0C8A20CD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F86010F3A1;
	Thu, 11 Apr 2024 21:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dxRjos08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD21E10F3A1;
 Thu, 11 Apr 2024 21:20:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43BLJwdN020245; Thu, 11 Apr 2024 21:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=KOigFIZ+FuFOzDUBhFuZwBLf9f12TpTgEOfyrbFj5S4=; b=dx
 Rjos085uKgIV2yNuRCRXXcqUyRE6ZmPaUR5jKoLiyN7c4qXWYZ+AzvtfchjGB3P0
 G8Gqy1hwJ8jRRDmBogzvHQ7x0hI01op/PHrFsqstbB1PWGZKmJzhOBlxU0CE7OY7
 Xa0OnveRmGwAeJrf0ZD1fZ0sE7x+etoeI5d4Rf3JKg+HS+CaxXbXOeDPysMU+qHK
 GQENQryi2Eqzf2j0heLKHtzt/pDNi3Dhxd2qIMM8lSaxuQAy8cKCaI14Mf4HIiYd
 u+vYXerFt4IijeUOWGmp4QT9I5L7FJqCYy5yMvPpXZfjH/wyV+Sc3phpK8yOA/uq
 dSuz/sJYCosvxvbw4XgQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe8dtkcub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 21:20:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BLKVLs021495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 21:20:31 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 14:20:30 -0700
Message-ID: <ec73ae6f-3a81-70f6-27e7-a94a6794f2d0@quicinc.com>
Date: Thu, 11 Apr 2024 14:20:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/12] drm/msm: convert msm_format::alpha_enable to the
 flag
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-11-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202214016.1257621-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4G2M27ZpS7rQqevjJiuH6TwgGzJ13fxS
X-Proofpoint-ORIG-GUID: 4G2M27ZpS7rQqevjJiuH6TwgGzJ13fxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110153
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



On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> Instead of having a bool field alpha_enable, convert it to the
> flag, this save space in the tables and allows us to handle all booleans
> in the same way.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 12 ++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 24 ++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  7 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  4 ++--
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 ++-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  9 ++++----
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 ++-
>   drivers/gpu/drm/msm/disp/mdp_format.c       |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
>   11 files changed, 40 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9041b0d71b25..201010038660 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -342,7 +342,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   
>   	/* default to opaque blending */
>   	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
> -	    !format->alpha_enable) {
> +	    !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)) {
>   		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
>   			DPU_BLEND_BG_ALPHA_BG_CONST;
>   	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
> @@ -373,8 +373,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   	lm->ops.setup_blend_config(lm, pstate->stage,
>   				fg_alpha, bg_alpha, blend_op);
>   
> -	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
> -		  &format->pixel_format, format->alpha_enable, blend_op);
> +	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%lu blend_op:0x%x\n",
> +		  &format->pixel_format, format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE, blend_op);
>   }
>   
>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> @@ -472,7 +472,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   
>   		format = msm_framebuffer_format(pstate->base.fb);
>   
> -		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
> +		if (pstate->stage == DPU_STAGE_BASE &&
> +		    format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
>   			bg_alpha_enable = true;
>   
>   		set_bit(pstate->pipe.sspp->idx, fetch_active);
> @@ -495,7 +496,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
>   			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
>   
> -			if (bg_alpha_enable && !format->alpha_enable)
> +			if (bg_alpha_enable &&
> +			    !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE))
>   				mixer[lm_idx].mixer_op_mode = 0;
>   			else
>   				mixer[lm_idx].mixer_op_mode |=
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index baf0fd67bf42..de9e93cb42c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -36,7 +36,6 @@ bp, flg, fm, np)                                                          \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> -	.alpha_enable = alpha,                                            \
>   	.element = { (e0), (e1), (e2), (e3) },                            \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
> @@ -46,7 +45,9 @@ bp, flg, fm, np)                                                          \
>   	.unpack_count = uc,                                               \
>   	.bpp = bp,                                                        \
>   	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
> +		flg,                                                      \

In the previous two patches where the same thing was done for 
unpack_tight and unpack_align_msb, it was different in the sense that 
just on the basis of which macro we were choosing we knew the value of 
those flags so you could just unconditionally OR those flags.

But for alpha, you are performing a conditional before ORing this so I 
think for this leaving it as a bool is cleaner.
