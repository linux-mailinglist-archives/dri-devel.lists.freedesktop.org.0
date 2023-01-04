Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83165CB3D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 02:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930B10E422;
	Wed,  4 Jan 2023 01:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E812910E045;
 Wed,  4 Jan 2023 01:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1672794609; x=1704330609;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UG/HF2RKXw0TF8Oh4EslzYFixvHeeRHeC2iht7VlO+U=;
 b=ccHzDhgSI/XaXmjjw4R9iq+N4BYx3x/OwODrtVebsi+TGhItCmDYKYNt
 ezliU7dcymMRbrwFtOjpAylgPpuDyHE+JNTCeweq+J2eutifKx71NU+2O
 0aTYfnDGIoB6iLZSI5j83d14G3tKUNs0DD9rqwuv7/8nrV1GAFObau/A2 k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Jan 2023 17:10:08 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 17:10:07 -0800
Received: from [10.110.122.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 17:10:06 -0800
Message-ID: <66072aca-c8c5-db21-64c1-5d23762dc338@quicinc.com>
Date: Tue, 3 Jan 2023 17:09:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 3/3] drm/msm/dpu: Use color_fill property for DPU
 planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
 <20221222221441.6980-4-quic_jesszhan@quicinc.com>
 <fd9a9aca-8225-6cd1-ff5e-19f0a39bf49c@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <fd9a9aca-8225-6cd1-ff5e-19f0a39bf49c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/22/2022 7:12 PM, Dmitry Baryshkov wrote:
> On 23/12/2022 00:14, Jessica Zhang wrote:
>> Initialize and use the color_fill properties for planes in DPU driver. In
>> addition, relax framebuffer requirements within atomic commit path and
>> add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
>> as it's unused.
>>
>> Changes since V2:
>> - Fixed dropped 'const' warning
>> - Dropped use of solid_fill_format
>> - Switched to using drm_plane_solid_fill_enabled helper method
>> - Added helper to convert color fill to BGR888 (Rob)
>> - Added support for solid fill on planes of varying sizes
>> - Removed DPU_PLANE_COLOR_FILL_FLAG
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
>>   2 files changed, 49 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..0695b70ea1b7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>       struct drm_plane_state *state;
>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>>       struct dpu_plane_state *pstate = NULL;
>> +    const struct msm_format *fmt;
>>       struct dpu_format *format;
>>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>> @@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>                   sspp_idx - SSPP_VIG0,
>>                   state->fb ? state->fb->base.id : -1);
>> -        format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>> +        if (pstate->base.fb)
>> +            fmt = msm_framebuffer_format(pstate->base.fb);
>> +        else
>> +            fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
>> +                    DRM_FORMAT_ABGR8888, 0);
>> +
>> +        format = to_dpu_format(fmt);
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 86719020afe2..51a7507373f7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -44,7 +44,6 @@
>>   #define DPU_NAME_SIZE  12
>> -#define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
>>   #define DPU_ZPOS_MAX 255
>>   /* multirect rect index */
>> @@ -105,7 +104,6 @@ struct dpu_plane {
>>       enum dpu_sspp pipe;
>>       struct dpu_hw_pipe *pipe_hw;
>> -    uint32_t color_fill;
>>       bool is_error;
>>       bool is_rt_pipe;
>>       const struct dpu_mdss_cfg *catalog;
>> @@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct 
>> dpu_plane *pdpu,
>>                   &scaler3_cfg);
>>   }
>> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill 
>> solid_fill)
>> +{
>> +    uint32_t ret = 0;
>> +
>> +    ret |= ((uint8_t) solid_fill.b) << 16;
>> +    ret |= ((uint8_t) solid_fill.g) << 8;
>> +    ret |= ((uint8_t) solid_fill.r);
>> +
>> +    return ret;
>> +}
>> +
>>   /**
>>    * _dpu_plane_color_fill - enables color fill on plane
>>    * @pdpu:   Pointer to DPU plane object
>> @@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       dst = drm_plane_state_dest(new_plane_state);
>> -    fb_rect.x2 = new_plane_state->fb->width;
>> -    fb_rect.y2 = new_plane_state->fb->height;
>> +    if (new_plane_state->fb) {
>> +        fb_rect.x2 = new_plane_state->fb->width;
>> +        fb_rect.y2 = new_plane_state->fb->height;
>> +    }
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +    if (new_plane_state->fb)
>> +        fmt = 
>> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +    else
>> +        fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>>       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> @@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>           return -EINVAL;
>>       /* check src bounds */
>> -    } else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
>> +    } else if (new_plane_state->fb && !dpu_plane_validate_src(&src, 
>> &fb_rect, min_src_size)) {
>>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>                   DRM_RECT_ARG(&src));
>>           return -E2BIG;
>> @@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>>       if (pdpu->is_error)
>>           /* force white frame with 100% alpha pipe output on error */
>>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
>> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>> +    else if (!(plane->state->fb) && 
>> drm_plane_solid_fill_enabled(plane->state))
> 
> And what if the plane has both fb and solid_fill proprety?

Hi Dmitry,

If both the FB and solid_fill are set, then the driver should prioritize 
the FB over the solid_fill.

Thanks,

Jessica Zhang

> 
>>           /* force 100% alpha */
>> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>> +        _dpu_plane_color_fill(pdpu, 
>> _dpu_plane_get_fill_color(plane->state->solid_fill),
>> +                0xFF);
>>       else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>>           const struct dpu_format *fmt = 
>> to_dpu_format(msm_framebuffer_format(plane->state->fb));
>>           const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, 
>> fmt);
>> @@ -1127,23 +1142,30 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>       struct drm_crtc *crtc = state->crtc;
>>       struct drm_framebuffer *fb = state->fb;
>>       bool is_rt_pipe, update_qos_remap;
>> -    const struct dpu_format *fmt =
>> -        to_dpu_format(msm_framebuffer_format(fb));
>> +    const struct dpu_format *fmt;
>>       struct dpu_hw_pipe_cfg pipe_cfg;
>> -    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> -
>> -    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>> -
>>       pstate->pending = true;
>>       is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>>       _dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>> -    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> -            ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> -            crtc->base.id, DRM_RECT_ARG(&state->dst),
>> -            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>> +    /* override for color fill */
>> +    if (!fb && drm_plane_solid_fill_enabled(plane->state)) {
> 
> And here too.
> 
>> +        /* skip remaining processing on color fill */
>> +        return;
>> +    }
>> +
>> +    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> +
>> +    fmt = to_dpu_format(msm_framebuffer_format(fb));
>> +    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>> +
>> +    if (fb)
>> +        DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> +                ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> +                crtc->base.id, DRM_RECT_ARG(&state->dst),
>> +                (char *)&fmt->base.pixel_format, 
>> DPU_FORMAT_IS_UBWC(fmt));
>>       pipe_cfg.src_rect = state->src;
>> @@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       pipe_cfg.dst_rect = state->dst;
>> -    /* override for color fill */
>> -    if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>> -        /* skip remaining processing on color fill */
>> -        return;
>> -    }
>> -
>>       if (pdpu->pipe_hw->ops.setup_rects) {
>>           pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>>                   &pipe_cfg,
>> @@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>           DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>>       drm_plane_create_alpha_property(plane);
>> +    drm_plane_create_solid_fill_property(plane);
>>       drm_plane_create_blend_mode_property(plane,
>>               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>>               BIT(DRM_MODE_BLEND_PREMULTI) |
> 
> -- 
> With best wishes
> Dmitry
> 
