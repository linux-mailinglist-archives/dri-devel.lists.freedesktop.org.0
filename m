Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5577CED0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 03:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE68110E071;
	Thu, 19 Oct 2023 01:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742FD10E071;
 Thu, 19 Oct 2023 01:00:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39J0ZDTI022612; Thu, 19 Oct 2023 00:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=735xJrDsXj0f3h1c0u/TcUL5MFagIe1ChPAPEdruYbM=;
 b=EWorW6vMMSfiWj9fyaW+IDh8tm+hGuz7QV8HoEI+nOMYJPxBKy+H4CKu/EARkLGSraRj
 NK3SM1o0dB5OAWOv2idWOOW9TgGilp6GADFTlygy6bAHBJrQBZEupO7Lzu5WjH9kceNf
 d9uFXo6kNaC5BFrDFnyIi8zEJDPSNxmju7FgwNkRNofleBEDcVhCEQRpIaqHTkoj81Ot
 Pd2to84yNUFaph1wAcNqKPFS2NCNhDqMmogtPY1y61dZAWWybDXf/8y+f1qz85jjXNe9
 +GVyMqegh+Qh9do3yWTc8HuDHWsZG6tw3SNCVlb4KxNp2M1Hw/SjKEFV7olrN+xuFxVA gw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ttfeu9h0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 00:59:38 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39J0xbTu000956
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Oct 2023 00:59:37 GMT
Received: from [10.71.110.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 17:59:37 -0700
Message-ID: <2dace097-affe-4bc6-ac7c-b5606bd86a89@quicinc.com>
Date: Wed, 18 Oct 2023 17:59:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 08/10] drm/msm/dpu: Allow NULL FBs in atomic commit
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-8-a820efcce852@quicinc.com>
 <494ede51-46bf-437b-98b8-2460f4c40285@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <494ede51-46bf-437b-98b8-2460f4c40285@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nV9ckG_qzcqOWifFAWc49DtNzwNouqat
X-Proofpoint-GUID: nV9ckG_qzcqOWifFAWc49DtNzwNouqat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_01,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190005
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/24/2023 3:29 AM, Dmitry Baryshkov wrote:
> On 29/08/2023 03:05, Jessica Zhang wrote:
>> Since solid fill planes allow for a NULL framebuffer in a valid commit,
>> add NULL framebuffer checks to atomic commit calls within DPU.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 
>> ++++++++++++++++++++-----------
>>   2 files changed, 34 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 8ce7586e2ddf..5e845510e8c1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -451,6 +451,7 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>       struct drm_plane_state *state;
>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>>       struct dpu_plane_state *pstate = NULL;
>> +    const struct msm_format *fmt;
>>       struct dpu_format *format;
>>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>> @@ -470,7 +471,13 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>           pstate = to_dpu_plane_state(state);
>>           fb = state->fb;
>> -        format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>> +        if (drm_plane_solid_fill_enabled(state))
>> +            fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
>> +                    DRM_FORMAT_ABGR8888, 0);
>> +        else
>> +            fmt = msm_framebuffer_format(pstate->base.fb);
>> +
>> +        format = to_dpu_format(fmt);
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index c2aaaded07ed..114c803ff99b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -837,8 +837,13 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       pipe_cfg->dst_rect = new_plane_state->dst;
>> -    fb_rect.x2 = new_plane_state->fb->width;
>> -    fb_rect.y2 = new_plane_state->fb->height;
>> +    if (drm_plane_solid_fill_enabled(new_plane_state))
>> +        return 0;
> 
> This would skip all the width checks, dpu_plane_atomic_check_pipe(), 
> etc. Could you please confirm that all of those checks are irrelevant 
> for solid fill?

Hi Dmitry,

Good point -- I think it would be good to keep the rect and pipe checks 
for solid fill.

> 
>> +
>> +    if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && 
>> new_plane_state->fb) {
>> +        fb_rect.x2 = new_plane_state->fb->width;
>> +        fb_rect.y2 = new_plane_state->fb->height;
>> +    }
>>       /* Ensure fb size is supported */
>>       if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
>> @@ -1082,21 +1087,32 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>       struct drm_crtc *crtc = state->crtc;
>>       struct drm_framebuffer *fb = state->fb;
>>       bool is_rt_pipe;
>> -    const struct dpu_format *fmt =
>> -        to_dpu_format(msm_framebuffer_format(fb));
>> +    const struct dpu_format *fmt;
>>       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>>       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>>       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>       struct msm_gem_address_space *aspace = kms->base.aspace;
>>       struct dpu_hw_fmt_layout layout;
>>       bool layout_valid = false;
>> -    int ret;
>> -    ret = dpu_format_populate_layout(aspace, fb, &layout);
>> -    if (ret)
>> -        DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>> -    else
>> -        layout_valid = true;
>> +    if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
>> +        int ret;
>> +
>> +        fmt = to_dpu_format(msm_framebuffer_format(fb));
>> +
>> +        ret = dpu_format_populate_layout(aspace, fb, &layout);
>> +        if (ret)
>> +            DPU_ERROR_PLANE(pdpu, "failed to get format layout, 
>> %d\n", ret);
>> +        else
>> +            layout_valid = true;
>> +
>> +        DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> +                ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> +                crtc->base.id, DRM_RECT_ARG(&state->dst),
>> +                (char *)&fmt->base.pixel_format, 
>> DPU_FORMAT_IS_UBWC(fmt));
>> +    } else {
>> +        fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> 
> #define DPU_SOLID_FILL_FORMAT ?

Acked.

> 
> Also, I don't think that solid_fill planes consume bandwidth, so this 
> likely needs to be fixed too.

You're right -- I think we can actually return early here if solid fill 
is enabled.

Thanks,

Jessica Zhang

> 
> 
>> +    }
>>       pstate->pending = true;
>> @@ -1104,11 +1120,6 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>>       pdpu->is_rt_pipe = is_rt_pipe;
>> -    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> -            ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> -            crtc->base.id, DRM_RECT_ARG(&state->dst),
>> -            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>> -
>>       dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
>>                      drm_mode_vrefresh(&crtc->mode),
>>                      layout_valid ? &layout : NULL);
>>
> 
> -- 
> With best wishes
> Dmitry
> 
