Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E921613F19
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 21:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573610E0F7;
	Mon, 31 Oct 2022 20:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC2810E17C;
 Mon, 31 Oct 2022 20:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1667248884; x=1698784884;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s/+zSapwtbO3gYn8zGcbb5Sq/Na3M4nPzN/kw6GP67w=;
 b=OLLfbMgeG+3CWIVG+2NC89L7hMUlicBdf9/OpUcLdrkoA4/Jhdeshncl
 jCtf74QCj9BAiTMM7jLZca4TSi1txrgXJuANeFo33GgYIweblieheYhN1
 nrT+Az3r1gAQYyhH8fh0cp28aqcTpo4gD0WgHHrUX8VaAAJTrfKXV/t+x M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Oct 2022 13:41:23 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 13:41:23 -0700
Received: from [10.71.111.47] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Mon, 31 Oct
 2022 13:41:22 -0700
Message-ID: <4c3a1efa-bd64-deba-0420-96f40c64557a@quicinc.com>
Date: Mon, 31 Oct 2022 13:41:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 2/3] drm: Adjust atomic checks for solid fill color
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <freedreno@lists.freedesktop.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-3-quic_jesszhan@quicinc.com>
 <8d375543-846a-59b0-0bd5-061c31b32d02@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <8d375543-846a-59b0-0bd5-061c31b32d02@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/29/2022 4:38 AM, Dmitry Baryshkov wrote:
> On 29/10/2022 01:59, Jessica Zhang wrote:
>> Loosen the requirements for atomic and legacy commit so that, in cases
>> where solid fill planes is enabled (and FB_ID is NULL), the commit can
>> still go through.
>>
>> In addition, add framebuffer NULL checks in other areas to account for
>> FB being NULL when solid fill is enabled.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/drm_atomic.c        | 68 ++++++++++++++++-------------
>>   drivers/gpu/drm/drm_atomic_helper.c | 34 +++++++++------
>>   drivers/gpu/drm/drm_plane.c         |  8 ++--
>>   include/drm/drm_atomic_helper.h     |  5 ++-
>>   4 files changed, 64 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
>> index f197f59f6d99..b576ed221431 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -601,8 +601,10 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       uint32_t num_clips;
>>       int ret;
>> -    /* either *both* CRTC and FB must be set, or neither */
>> -    if (crtc && !fb) {
>> +    /* When color_fill is disabled,
>> +     * either *both* CRTC and FB must be set, or neither
>> +     */
>> +    if (crtc && !fb && !new_plane_state->color_fill) {
> 
> Using !color_fill sounds bad. It would disallow using black as the plane 
> fill color. I think, you need to check color_fill_format instead.

Hey Dmitry,

Good point -- acked.

> 
>>           drm_dbg_atomic(plane->dev, "[PLANE:%d:%s] CRTC set but no 
>> FB\n",
>>                      plane->base.id, plane->name);
>>           return -EINVAL;
>> @@ -626,14 +628,16 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>       }
> 
> 
> Don't we need to check that the color_fill_format is supported too?

Acked.

> 
>>       /* Check whether this plane supports the fb pixel format. */
>> -    ret = drm_plane_check_pixel_format(plane, fb->format->format,
>> -                       fb->modifier);
>> -    if (ret) {
>> -        drm_dbg_atomic(plane->dev,
>> -                   "[PLANE:%d:%s] invalid pixel format %p4cc, 
>> modifier 0x%llx\n",
>> -                   plane->base.id, plane->name,
>> -                   &fb->format->format, fb->modifier);
>> -        return ret;
>> +    if (fb) {
>> +        ret = drm_plane_check_pixel_format(plane, fb->format->format,
>> +                           fb->modifier);
>> +
>> +        if (ret)
>> +            drm_dbg_atomic(plane->dev,
>> +                       "[PLANE:%d:%s] invalid pixel format %p4cc, 
>> modifier 0x%llx\n",
>> +                       plane->base.id, plane->name,
>> +                       &fb->format->format, fb->modifier);
>> +            return ret;
>>       }
>>       /* Give drivers some help against integer overflows */
>> @@ -649,28 +653,30 @@ static int drm_atomic_plane_check(const struct 
>> drm_plane_state *old_plane_state,
>>           return -ERANGE;
>>       }
>> -    fb_width = fb->width << 16;
>> -    fb_height = fb->height << 16;
>> +    if (fb) {
>> +        fb_width = fb->width << 16;
>> +        fb_height = fb->height << 16;
>> -    /* Make sure source coordinates are inside the fb. */
>> -    if (new_plane_state->src_w > fb_width ||
>> -        new_plane_state->src_x > fb_width - new_plane_state->src_w ||
>> -        new_plane_state->src_h > fb_height ||
>> -        new_plane_state->src_y > fb_height - new_plane_state->src_h) {
>> -        drm_dbg_atomic(plane->dev,
>> -                   "[PLANE:%d:%s] invalid source coordinates "
>> -                   "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
>> -                   plane->base.id, plane->name,
>> -                   new_plane_state->src_w >> 16,
>> -                   ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_h >> 16,
>> -                   ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_x >> 16,
>> -                   ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
>> -                   new_plane_state->src_y >> 16,
>> -                   ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
>> -                   fb->width, fb->height);
>> -        return -ENOSPC;
>> +        /* Make sure source coordinates are inside the fb. */
>> +        if (new_plane_state->src_w > fb_width ||
>> +            new_plane_state->src_x > fb_width - 
>> new_plane_state->src_w ||
>> +            new_plane_state->src_h > fb_height ||
>> +            new_plane_state->src_y > fb_height - 
>> new_plane_state->src_h) {
>> +            drm_dbg_atomic(plane->dev,
>> +                       "[PLANE:%d:%s] invalid source coordinates "
>> +                       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
>> +                       plane->base.id, plane->name,
>> +                       new_plane_state->src_w >> 16,
>> +                       ((new_plane_state->src_w & 0xffff) * 15625) >> 
>> 10,
>> +                       new_plane_state->src_h >> 16,
>> +                       ((new_plane_state->src_h & 0xffff) * 15625) >> 
>> 10,
>> +                       new_plane_state->src_x >> 16,
>> +                       ((new_plane_state->src_x & 0xffff) * 15625) >> 
>> 10,
>> +                       new_plane_state->src_y >> 16,
>> +                       ((new_plane_state->src_y & 0xffff) * 15625) >> 
>> 10,
>> +                       fb->width, fb->height);
>> +            return -ENOSPC;
>> +        }
>>       }
>>       clips = __drm_plane_get_damage_clips(new_plane_state);
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c 
>> b/drivers/gpu/drm/drm_atomic_helper.c
>> index 8bf41aa24068..5a5ffa06b8bd 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -818,7 +818,7 @@ int drm_atomic_helper_check_plane_state(struct 
>> drm_plane_state *plane_state,
>>       *src = drm_plane_state_src(plane_state);
>>       *dst = drm_plane_state_dest(plane_state);
>> -    if (!fb) {
>> +    if (!fb && !plane_state->color_fill) {
>>           plane_state->visible = false;
>>           return 0;
>>       }
>> @@ -835,25 +835,31 @@ int drm_atomic_helper_check_plane_state(struct 
>> drm_plane_state *plane_state,
>>           return -EINVAL;
>>       }
>> -    drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>> +    if (fb) {
>> +        drm_rect_rotate(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> -    /* Check scaling */
>> -    hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>> -    vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>> -    if (hscale < 0 || vscale < 0) {
>> -        drm_dbg_kms(plane_state->plane->dev,
>> -                "Invalid scaling of plane\n");
>> -        drm_rect_debug_print("src: ", &plane_state->src, true);
>> -        drm_rect_debug_print("dst: ", &plane_state->dst, false);
>> -        return -ERANGE;
>> +        /* Check scaling */
>> +        hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>> +        vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>> +
>> +        if (hscale < 0 || vscale < 0) {
>> +            drm_dbg_kms(plane_state->plane->dev,
>> +                    "Invalid scaling of plane\n");
>> +            drm_rect_debug_print("src: ", &plane_state->src, true);
>> +            drm_rect_debug_print("dst: ", &plane_state->dst, false);
>> +            return -ERANGE;
>> +        }
>>       }
>>       if (crtc_state->enable)
>>           drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
>> -    plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
>> -
>> -    drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> +    if (fb) {
>> +        plane_state->visible = drm_rect_clip_scaled(src, dst, &clip);
>> +        drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, 
>> rotation);
>> +    } else if (plane_state->color_fill) {
>> +        plane_state->visible = true;
>> +    }
>>       if (!plane_state->visible)
>>           /*
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 726f2f163c26..223b5ed93d3a 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -850,8 +850,8 @@ static int __setplane_internal(struct drm_plane 
>> *plane,
>>       WARN_ON(drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb) {
>> +    /* No fb and no color fill means shut it down */
>> +    if (!fb && (plane->state && !plane->state->color_fill)) {
> 
> I'd suggest abstracting this to a helper function, which can then be 
> used in drm_atomic_plane_check() too.

Agreed.

> 
>>           plane->old_fb = plane->fb;
>>           ret = plane->funcs->disable_plane(plane, ctx);
>>           if (!ret) {
>> @@ -902,8 +902,8 @@ static int __setplane_atomic(struct drm_plane *plane,
>>       WARN_ON(!drm_drv_uses_atomic_modeset(plane->dev));
>> -    /* No fb means shut it down */
>> -    if (!fb)
>> +    /* No fb and no color fill means shut it down */
>> +    if (!fb && (plane->state && !plane->state->color_fill))
>>           return plane->funcs->disable_plane(plane, ctx);
>>       /*
>> diff --git a/include/drm/drm_atomic_helper.h 
>> b/include/drm/drm_atomic_helper.h
>> index 2a0b17842402..aa7576f0879d 100644
>> --- a/include/drm/drm_atomic_helper.h
>> +++ b/include/drm/drm_atomic_helper.h
>> @@ -219,8 +219,9 @@ drm_atomic_plane_disabling(struct drm_plane_state 
>> *old_plane_state,
>>        * Anything else should be considered a bug in the atomic core, 
>> so we
>>        * gently warn about it.
>>        */
>> -    WARN_ON((new_plane_state->crtc == NULL && new_plane_state->fb != 
>> NULL) ||
>> -        (new_plane_state->crtc != NULL && new_plane_state->fb == NULL));
>> +    WARN_ON(!new_plane_state->color_fill &&
>> +            ((new_plane_state->crtc == NULL && new_plane_state->fb != 
>> NULL) ||
>> +            (new_plane_state->crtc != NULL && new_plane_state->fb == 
>> NULL)));
> 
> Please fix the indentation.

Acked.

Thanks,

Jessica Zhang

> 
>>       return old_plane_state->crtc && !new_plane_state->crtc;
>>   }
> 
> -- 
> With best wishes
> Dmitry
> 
