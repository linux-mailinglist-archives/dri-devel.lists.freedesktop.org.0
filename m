Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5314584CE6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 09:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3323C10F1D0;
	Fri, 29 Jul 2022 07:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9D10EEE7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659080894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PHoHL43kHD8XrQaAHvaWiAH97fSzh9dyEt0FW5pBeQ=;
 b=GUiD0pga/WZygwyA8nJFpCy+qkRMsye6qaOScfK1bhxkFHTjqoNavj3+7oJvfuIcIhQkDh
 qp6VKwSAduZVYlPojyWGjNg4VRYOJaR/nA+dFKqS2lKJbk2oWgC/SVVX5l4wsR+gF44G80
 oCQBNLS+ECeKcqGv9MnhPelkPWVY1L0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-IPT5gl-nNLCkp8ZWeCCBPg-1; Fri, 29 Jul 2022 03:48:10 -0400
X-MC-Unique: IPT5gl-nNLCkp8ZWeCCBPg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p36-20020a05600c1da400b003a33a8c14f2so1872877wms.7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 00:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8PHoHL43kHD8XrQaAHvaWiAH97fSzh9dyEt0FW5pBeQ=;
 b=ziVNOgXEBRXRz6ogUbh84/FQpCgYpDsFQc++AkjUOZ/jlumWQS51caeGzfvvN9F1at
 /STX8ekjkINOy4NVXr4VN9H4/LVZl3fvR3n6SrL5CD8lMbXwEoAo9maqudgC94OXsF8l
 RF6mmrtivQbCbwSyG1S++FoUMTPkhmBdqyKA6WcYRWmEMmdQEx3xtW2Gppzd8QDOifGy
 gUOBwAjlNwXoOTN0dm54JXLV6tZjFAjkSqqKbkJXCpqPHW9F+55v7Bu4Tao4zVL5LobL
 GnElBWXJ1MGitAq9pEj6IG23EHzsUcjfSI6blqBLeZaFydFdIW0VJaQXqIfdWMQ+MgMP
 a4yQ==
X-Gm-Message-State: AJIora/GcubXkECXHB+YU4idi9wQ3UzenNpk6rlLWF8U5smHAaZ8o1qh
 v0ufCdj0iMfLZW1g150PV1MjpD0eV+Th8G5fWPn50R6Jjza7gplPITI5pkDnX8dAOto2aF4mXFJ
 T2pHaJdUp7yLNzsCsR81+CZEqqCyS
X-Received: by 2002:a05:600c:6002:b0:3a3:5453:bcbe with SMTP id
 az2-20020a05600c600200b003a35453bcbemr1627268wmb.190.1659080888146; 
 Fri, 29 Jul 2022 00:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tR6Sdcj7TN7SQl40kSwrgnPRwTAZGGzuhVkoTYfKHcLsc7v+V0FV5iLfqj6vkwr8U0nmzg6w==
X-Received: by 2002:a05:600c:6002:b0:3a3:5453:bcbe with SMTP id
 az2-20020a05600c600200b003a35453bcbemr1627240wmb.190.1659080887804; 
 Fri, 29 Jul 2022 00:48:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003a32251c3f0sm3659977wmq.33.2022.07.29.00.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 00:48:07 -0700 (PDT)
Message-ID: <312b6b68-fdb0-a2aa-48ed-7606f512b8c9@redhat.com>
Date: Fri, 29 Jul 2022 09:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/14] drm/mgag200: Replace simple-KMS with regular
 atomic helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220728124103.30159-1-tzimmermann@suse.de>
 <20220728124103.30159-8-tzimmermann@suse.de>
 <c31031c1-1496-67d6-9cb4-ef829914cfd3@redhat.com>
 <b78a8e35-a94b-acb5-f74d-9e790e8811a5@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b78a8e35-a94b-acb5-f74d-9e790e8811a5@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 20:31, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> Am 28.07.22 um 17:09 schrieb Jocelyn Falempe:
>> On 28/07/2022 14:40, Thomas Zimmermann wrote:
>>> Drop simple-KMS in favor of regular atomic helpers. Makes the code
>>> more modular and hence better to adapt to per-model requirements.
>>>
>>> The simple-KMS helpers provide few extra features, so the patch is
>>> mostly about open-coding what simple-KMS does. The simple-KMS helpers
>>> do mix up plane and CRTC state. Changing to regular atomic helpers
>>> requires to split some of the simple-pipe functions into per-plane
>>> and per-CRTC code
>>>
>>> No functional changes.
>>>
>>> v3:
>>>     * always run drm_atomic_helper_check_plane_state()
>>>     * clean up style
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>> ---
>>>   drivers/gpu/drm/mgag200/mgag200_drv.h  |   8 +-
>>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 382 +++++++++++++++----------
>>>   2 files changed, 233 insertions(+), 157 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> index bf6a01ff9719..b0433985ec0d 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> @@ -15,11 +15,13 @@
>>>   #include <video/vga.h>
>>> +#include <drm/drm_connector.h>
>>> +#include <drm/drm_crtc.h>
>>>   #include <drm/drm_encoder.h>
>>>   #include <drm/drm_fb_helper.h>
>>>   #include <drm/drm_gem.h>
>>>   #include <drm/drm_gem_shmem_helper.h>
>>> -#include <drm/drm_simple_kms_helper.h>
>>> +#include <drm/drm_plane.h>
>>>   #include "mgag200_reg.h"
>>> @@ -276,9 +278,11 @@ struct mga_device {
>>>       enum mga_type            type;
>>>       struct mgag200_pll pixpll;
>>> +    struct drm_plane primary_plane;
>>> +    struct drm_crtc crtc;
>>> +    struct drm_encoder encoder;
>>>       struct mga_i2c_chan i2c;
>>>       struct drm_connector connector;
>>> -    struct drm_simple_display_pipe display_pipe;
>>>   };
>>>   static inline struct mga_device *to_mga_device(struct drm_device *dev)
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> index 67795135d4dd..b524c1c5f032 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> @@ -23,7 +23,6 @@
>>>   #include <drm/drm_gem_framebuffer_helper.h>
>>>   #include <drm/drm_print.h>
>>>   #include <drm/drm_probe_helper.h>
>>> -#include <drm/drm_simple_kms_helper.h>
>>>   #include "mgag200_drv.h"
>>> @@ -614,25 +613,106 @@ static void mgag200_handle_damage(struct 
>>> mga_device *mdev, const struct iosys_ma
>>>   }
>>>   /*
>>> - * Simple Display Pipe
>>> + * Primary plane
>>>    */
>>> -static const uint32_t mgag200_simple_display_pipe_formats[] = {
>>> +static const uint32_t mgag200_primary_plane_formats[] = {
>>>       DRM_FORMAT_XRGB8888,
>>>       DRM_FORMAT_RGB565,
>>>       DRM_FORMAT_RGB888,
>>>   };
>>> -static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
>>> +static const uint64_t mgag200_primary_plane_fmtmods[] = {
>>>       DRM_FORMAT_MOD_LINEAR,
>>>       DRM_FORMAT_MOD_INVALID
>>>   };
>>> -static enum drm_mode_status
>>> -mgag200_simple_display_pipe_mode_valid(struct 
>>> drm_simple_display_pipe *pipe,
>>> -                       const struct drm_display_mode *mode)
>>> +static int mgag200_primary_plane_helper_atomic_check(struct 
>>> drm_plane *plane,
>>> +                             struct drm_atomic_state *new_state)
>>>   {
>>> -    struct mga_device *mdev = to_mga_device(pipe->crtc.dev);
>>> +    struct drm_plane_state *new_plane_state = 
>>> drm_atomic_get_new_plane_state(new_state, plane);
>>> +    struct drm_framebuffer *new_fb = new_plane_state->fb;
>>> +    struct drm_framebuffer *fb = NULL;
>>> +    struct drm_crtc *new_crtc = new_plane_state->crtc;
>>> +    struct drm_crtc_state *new_crtc_state = NULL;
>>> +    struct mgag200_crtc_state *new_mgag200_crtc_state;
>>> +    int ret;
>>> +
>>> +    if (new_crtc)
>>> +        new_crtc_state = drm_atomic_get_new_crtc_state(new_state, 
>>> new_crtc);
>>
>> If new_crtc is NULL, then new_crtc_state will be NULL too, and it's 
>> dereferenced in drm_atomic_helper_check_plane_state() and later in 
>> this function.
>> So either there is a garantee that new_crtc is never NULL when calling 
>> this function, or it should return before trying to access it.
> 
> That's a good observation. Luckily it's not a problem in practice. The 
> logic in the DRM code is confusing, however.
> 
> Near the top of the function, drm_atomic_check_planes_state() will only 
> deref crtc_state if the plane has a CRTC set, [1] so we're safe here.
> 
> That will work because every CRTC/plane/connector/encoder always has an 
> associated state; even if it's disabled. Hence if the plane has a crtc, 
> that crtc will have a state. Or else, both will be NULL.
> 
> Further down, drm_atomic_helper_check_plane_state() first tests for 
> !plane->fb [2] and then for !plane->crtc. [3] In both cases, 
> drm_atomic_helper_check_plane_state() clears the visibility field to 0 
> and returns 0.  Our code in mgag200_primary_plane_helper_atomic_check() 
> will return early for invisible planes before deref'ing new_crtc_state, 
> so we're safe here as well.
> 
> Best regards
> Thomas
> 
> [1] 
> https://elixir.bootlin.com/linux/v5.18.14/source/drivers/gpu/drm/drm_atomic_helper.c#L814 
> 
> [2] 
> https://elixir.bootlin.com/linux/v5.18.14/source/drivers/gpu/drm/drm_atomic_helper.c#L819 
> 
> [3] 
> https://elixir.bootlin.com/linux/v5.18.14/source/drivers/gpu/drm/drm_atomic_helper.c#L825 
> 
> 

Thanks a lot for the detailed explanation, I agree that it's safe now.

Best regards,

-- 

Jocelyn


>>
>>> +
>>> +    ret = drm_atomic_helper_check_plane_state(new_plane_state, 
>>> new_crtc_state,
>>> +                          DRM_PLANE_NO_SCALING,
>>> +                          DRM_PLANE_NO_SCALING,
>>> +                          false, true);
>>> +    if (ret)
>>> +        return ret;
>>> +    else if (!new_plane_state->visible)
>>> +        return 0;
>>> +
>>> +    if (plane->state)
>>> +        fb = plane->state->fb;
>>> +
>>> +    if (!fb || (fb->format != new_fb->format))
>>> +        new_crtc_state->mode_changed = true; /* update PLL settings */
>>> +
>>> +    new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
>>> +    new_mgag200_crtc_state->format = new_fb->format;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void mgag200_primary_plane_helper_atomic_update(struct 
>>> drm_plane *plane,
>>> +                               struct drm_atomic_state *old_state)
>>> +{
>>> +    struct drm_device *dev = plane->dev;
>>> +    struct mga_device *mdev = to_mga_device(dev);
>>> +    struct drm_plane_state *plane_state = plane->state;
>>> +    struct drm_plane_state *old_plane_state = 
>>> drm_atomic_get_old_plane_state(old_state, plane);
>>> +    struct drm_shadow_plane_state *shadow_plane_state = 
>>> to_drm_shadow_plane_state(plane_state);
>>> +    struct drm_framebuffer *fb = plane_state->fb;
>>> +    struct drm_atomic_helper_damage_iter iter;
>>> +    struct drm_rect damage;
>>> +
>>> +    if (!fb)
>>> +        return;
>>> +
>>> +    drm_atomic_helper_damage_iter_init(&iter, old_plane_state, 
>>> plane_state);
>>> +    drm_atomic_for_each_plane_damage(&iter, &damage) {
>>> +        mgag200_handle_damage(mdev, shadow_plane_state->data, fb, 
>>> &damage);
>>> +    }
>>> +
>>> +    /* Always scanout image at VRAM offset 0 */
>>> +    mgag200_set_startadd(mdev, (u32)0);
>>> +    mgag200_set_offset(mdev, fb);
>>> +}
>>> +
>>> +static void mgag200_primary_plane_helper_atomic_disable(struct 
>>> drm_plane *plane,
>>> +                            struct drm_atomic_state *old_state)
>>> +{ }
>>> +
>>> +static const struct drm_plane_helper_funcs 
>>> mgag200_primary_plane_helper_funcs = {
>>> +    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>>> +    .atomic_check = mgag200_primary_plane_helper_atomic_check,
>>> +    .atomic_update = mgag200_primary_plane_helper_atomic_update,
>>> +    .atomic_disable = mgag200_primary_plane_helper_atomic_disable,
>>> +};
>>> +
>>> +static const struct drm_plane_funcs mgag200_primary_plane_funcs = {
>>> +    .update_plane = drm_atomic_helper_update_plane,
>>> +    .disable_plane = drm_atomic_helper_disable_plane,
>>> +    .destroy = drm_plane_cleanup,
>>> +    DRM_GEM_SHADOW_PLANE_FUNCS,
>>> +};
>>> +
>>> +/*
>>> + * CRTC
>>> + */
>>> +
>>> +static enum drm_mode_status mgag200_crtc_helper_mode_valid(struct 
>>> drm_crtc *crtc,
>>> +                               const struct drm_display_mode *mode)
>>> +{
>>> +    struct mga_device *mdev = to_mga_device(crtc->dev);
>>>       const struct mgag200_device_info *info = mdev->info;
>>>       /*
>>> @@ -659,26 +739,69 @@ mgag200_simple_display_pipe_mode_valid(struct 
>>> drm_simple_display_pipe *pipe,
>>>       return MODE_OK;
>>>   }
>>> -static void
>>> -mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe 
>>> *pipe,
>>> -                   struct drm_crtc_state *crtc_state,
>>> -                   struct drm_plane_state *plane_state)
>>> +static int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc,
>>> +                        struct drm_atomic_state *new_state)
>>>   {
>>> -    struct drm_crtc *crtc = &pipe->crtc;
>>>       struct drm_device *dev = crtc->dev;
>>>       struct mga_device *mdev = to_mga_device(dev);
>>> +    struct drm_crtc_state *new_crtc_state = 
>>> drm_atomic_get_new_crtc_state(new_state, crtc);
>>>       struct mgag200_pll *pixpll = &mdev->pixpll;
>>> +    struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(new_crtc_state);
>>> +    struct drm_property_blob *new_gamma_lut = 
>>> new_crtc_state->gamma_lut;
>>> +    int ret;
>>> +
>>> +    ret = drm_atomic_helper_check_crtc_state(new_crtc_state, false);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    if (!new_crtc_state->enable)
>>> +        return 0;
>>> +
>>> +    if (new_crtc_state->mode_changed) {
>>> +        ret = pixpll->funcs->compute(pixpll, 
>>> new_crtc_state->mode.clock,
>>> +                         &mgag200_crtc_state->pixpllc);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    if (new_crtc_state->color_mgmt_changed && new_gamma_lut) {
>>> +        if (new_gamma_lut->length != MGAG200_LUT_SIZE * 
>>> sizeof(struct drm_color_lut)) {
>>> +            drm_dbg(dev, "Wrong size for gamma_lut %zu\n", 
>>> new_gamma_lut->length);
>>> +            return -EINVAL;
>>> +        }
>>> +    }
>>> +
>>> +    return drm_atomic_add_affected_planes(new_state, crtc);
>>> +}
>>> +
>>> +static void mgag200_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>>> +                         struct drm_atomic_state *old_state)
>>> +{
>>> +    struct drm_crtc_state *crtc_state = crtc->state;
>>> +    struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(crtc_state);
>>> +    struct drm_device *dev = crtc->dev;
>>> +    struct mga_device *mdev = to_mga_device(dev);
>>> +
>>> +    if (crtc_state->enable && crtc_state->color_mgmt_changed) {
>>> +        const struct drm_format_info *format = 
>>> mgag200_crtc_state->format;
>>> +
>>> +        if (crtc_state->gamma_lut)
>>> +            mgag200_crtc_set_gamma(mdev, format, 
>>> crtc_state->gamma_lut->data);
>>> +        else
>>> +            mgag200_crtc_set_gamma_linear(mdev, format);
>>> +    }
>>> +}
>>> +
>>> +static void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>> +                          struct drm_atomic_state *old_state)
>>> +{
>>> +    struct drm_device *dev = crtc->dev;
>>> +    struct mga_device *mdev = to_mga_device(dev);
>>> +    struct drm_crtc_state *crtc_state = crtc->state;
>>>       struct drm_display_mode *adjusted_mode = 
>>> &crtc_state->adjusted_mode;
>>>       struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(crtc_state);
>>> -    struct drm_framebuffer *fb = plane_state->fb;
>>>       const struct drm_format_info *format = mgag200_crtc_state->format;
>>> -    struct drm_shadow_plane_state *shadow_plane_state = 
>>> to_drm_shadow_plane_state(plane_state);
>>> -    struct drm_rect fullscreen = {
>>> -        .x1 = 0,
>>> -        .x2 = fb->width,
>>> -        .y1 = 0,
>>> -        .y2 = fb->height,
>>> -    };
>>> +    struct mgag200_pll *pixpll = &mdev->pixpll;
>>>       if (mdev->type == G200_WB || mdev->type == G200_EW3)
>>>           mgag200_g200wb_hold_bmc(mdev);
>>> @@ -696,108 +819,50 @@ mgag200_simple_display_pipe_enable(struct 
>>> drm_simple_display_pipe *pipe,
>>>       else if (mdev->type == G200_EV)
>>>           mgag200_g200ev_set_hiprilvl(mdev);
>>> -    if (mdev->type == G200_WB || mdev->type == G200_EW3)
>>> -        mgag200_g200wb_release_bmc(mdev);
>>> -
>>> -    if (crtc_state->gamma_lut)
>>> -        mgag200_crtc_set_gamma(mdev, format, 
>>> crtc_state->gamma_lut->data);
>>> -    else
>>> -        mgag200_crtc_set_gamma_linear(mdev, format);
>>> -
>>>       mgag200_enable_display(mdev);
>>> -    mgag200_handle_damage(mdev, shadow_plane_state->data, fb, 
>>> &fullscreen);
>>> -
>>> -    /* Always scanout image at VRAM offset 0 */
>>> -    mgag200_set_startadd(mdev, (u32)0);
>>> -    mgag200_set_offset(mdev, fb);
>>> +    if (mdev->type == G200_WB || mdev->type == G200_EW3)
>>> +        mgag200_g200wb_release_bmc(mdev);
>>>   }
>>> -static void
>>> -mgag200_simple_display_pipe_disable(struct drm_simple_display_pipe 
>>> *pipe)
>>> +static void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>>> +                           struct drm_atomic_state *old_state)
>>>   {
>>> -    struct drm_crtc *crtc = &pipe->crtc;
>>>       struct mga_device *mdev = to_mga_device(crtc->dev);
>>> -    mgag200_disable_display(mdev);
>>> -}
>>> -
>>> -static int
>>> -mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
>>> -                  struct drm_plane_state *plane_state,
>>> -                  struct drm_crtc_state *crtc_state)
>>> -{
>>> -    struct drm_plane *plane = plane_state->plane;
>>> -    struct drm_device *dev = plane->dev;
>>> -    struct mga_device *mdev = to_mga_device(dev);
>>> -    struct mgag200_pll *pixpll = &mdev->pixpll;
>>> -    struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(crtc_state);
>>> -    struct drm_framebuffer *new_fb = plane_state->fb;
>>> -    struct drm_framebuffer *fb = NULL;
>>> -    int ret;
>>> -
>>> -    if (!new_fb)
>>> -        return 0;
>>> -
>>> -    if (plane->state)
>>> -        fb = plane->state->fb;
>>> -
>>> -    if (!fb || (fb->format != new_fb->format))
>>> -        crtc_state->mode_changed = true; /* update PLL settings */
>>> -
>>> -    mgag200_crtc_state->format = new_fb->format;
>>> +    if (mdev->type == G200_WB || mdev->type == G200_EW3)
>>> +        mgag200_g200wb_hold_bmc(mdev);
>>> -    if (crtc_state->mode_changed) {
>>> -        ret = pixpll->funcs->compute(pixpll, crtc_state->mode.clock,
>>> -                         &mgag200_crtc_state->pixpllc);
>>> -        if (ret)
>>> -            return ret;
>>> -    }
>>> +    mgag200_disable_display(mdev);
>>> -    if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
>>> -        if (crtc_state->gamma_lut->length !=
>>> -            MGAG200_LUT_SIZE * sizeof(struct drm_color_lut)) {
>>> -            drm_err(dev, "Wrong size for gamma_lut %zu\n",
>>> -                crtc_state->gamma_lut->length);
>>> -            return -EINVAL;
>>> -        }
>>> -    }
>>> -    return 0;
>>> +    if (mdev->type == G200_WB || mdev->type == G200_EW3)
>>> +        mgag200_g200wb_release_bmc(mdev);
>>>   }
>>> -static void
>>> -mgag200_simple_display_pipe_update(struct drm_simple_display_pipe 
>>> *pipe,
>>> -                   struct drm_plane_state *old_state)
>>> -{
>>> -    struct drm_plane *plane = &pipe->plane;
>>> -    struct drm_crtc *crtc = &pipe->crtc;
>>> -    struct drm_device *dev = plane->dev;
>>> -    struct mga_device *mdev = to_mga_device(dev);
>>> -    struct drm_plane_state *state = plane->state;
>>> -    struct drm_shadow_plane_state *shadow_plane_state = 
>>> to_drm_shadow_plane_state(state);
>>> -    struct drm_framebuffer *fb = state->fb;
>>> -    struct drm_rect damage;
>>> -    struct drm_atomic_helper_damage_iter iter;
>>> +static const struct drm_crtc_helper_funcs mgag200_crtc_helper_funcs = {
>>> +    .mode_valid = mgag200_crtc_helper_mode_valid,
>>> +    .atomic_check = mgag200_crtc_helper_atomic_check,
>>> +    .atomic_flush = mgag200_crtc_helper_atomic_flush,
>>> +    .atomic_enable = mgag200_crtc_helper_atomic_enable,
>>> +    .atomic_disable = mgag200_crtc_helper_atomic_disable,
>>> +};
>>> -    if (!fb)
>>> -        return;
>>> +static void mgag200_crtc_reset(struct drm_crtc *crtc)
>>> +{
>>> +    struct mgag200_crtc_state *mgag200_crtc_state;
>>> -    if (crtc->state->color_mgmt_changed && crtc->state->gamma_lut)
>>> -        mgag200_crtc_set_gamma(mdev, fb->format, 
>>> crtc->state->gamma_lut->data);
>>> +    if (crtc->state)
>>> +        crtc->funcs->atomic_destroy_state(crtc, crtc->state);
>>> -    drm_atomic_helper_damage_iter_init(&iter, old_state, state);
>>> -    drm_atomic_for_each_plane_damage(&iter, &damage) {
>>> -        mgag200_handle_damage(mdev, shadow_plane_state->data, fb, 
>>> &damage);
>>> -    }
>>> -    /* Always scanout image at VRAM offset 0 */
>>> -    mgag200_set_startadd(mdev, (u32)0);
>>> -    mgag200_set_offset(mdev, fb);
>>> +    mgag200_crtc_state = kzalloc(sizeof(*mgag200_crtc_state), 
>>> GFP_KERNEL);
>>> +    if (mgag200_crtc_state)
>>> +        __drm_atomic_helper_crtc_reset(crtc, 
>>> &mgag200_crtc_state->base);
>>> +    else
>>> +        __drm_atomic_helper_crtc_reset(crtc, NULL);
>>>   }
>>> -static struct drm_crtc_state *
>>> -mgag200_simple_display_pipe_duplicate_crtc_state(struct 
>>> drm_simple_display_pipe *pipe)
>>> +static struct drm_crtc_state 
>>> *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>>>   {
>>> -    struct drm_crtc *crtc = &pipe->crtc;
>>>       struct drm_crtc_state *crtc_state = crtc->state;
>>>       struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(crtc_state);
>>>       struct mgag200_crtc_state *new_mgag200_crtc_state;
>>> @@ -817,8 +882,8 @@ 
>>> mgag200_simple_display_pipe_duplicate_crtc_state(struct 
>>> drm_simple_display_pipe
>>>       return &new_mgag200_crtc_state->base;
>>>   }
>>> -static void mgag200_simple_display_pipe_destroy_crtc_state(struct 
>>> drm_simple_display_pipe *pipe,
>>> -                               struct drm_crtc_state *crtc_state)
>>> +static void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>>> +                          struct drm_crtc_state *crtc_state)
>>>   {
>>>       struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(crtc_state);
>>> @@ -826,33 +891,21 @@ static void 
>>> mgag200_simple_display_pipe_destroy_crtc_state(struct drm_simple_dis
>>>       kfree(mgag200_crtc_state);
>>>   }
>>> -static void mgag200_simple_display_pipe_reset_crtc(struct 
>>> drm_simple_display_pipe *pipe)
>>> -{
>>> -    struct drm_crtc *crtc = &pipe->crtc;
>>> -    struct mgag200_crtc_state *mgag200_crtc_state;
>>> -
>>> -    if (crtc->state) {
>>> -        mgag200_simple_display_pipe_destroy_crtc_state(pipe, 
>>> crtc->state);
>>> -        crtc->state = NULL; /* must be set to NULL here */
>>> -    }
>>> +static const struct drm_crtc_funcs mgag200_crtc_funcs = {
>>> +    .reset = mgag200_crtc_reset,
>>> +    .destroy = drm_crtc_cleanup,
>>> +    .set_config = drm_atomic_helper_set_config,
>>> +    .page_flip = drm_atomic_helper_page_flip,
>>> +    .atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state,
>>> +    .atomic_destroy_state = mgag200_crtc_atomic_destroy_state,
>>> +};
>>> -    mgag200_crtc_state = kzalloc(sizeof(*mgag200_crtc_state), 
>>> GFP_KERNEL);
>>> -    if (!mgag200_crtc_state)
>>> -        return;
>>> -    __drm_atomic_helper_crtc_reset(crtc, &mgag200_crtc_state->base);
>>> -}
>>> +/*
>>> + * Encoder
>>> + */
>>> -static const struct drm_simple_display_pipe_funcs
>>> -mgag200_simple_display_pipe_funcs = {
>>> -    .mode_valid = mgag200_simple_display_pipe_mode_valid,
>>> -    .enable        = mgag200_simple_display_pipe_enable,
>>> -    .disable    = mgag200_simple_display_pipe_disable,
>>> -    .check        = mgag200_simple_display_pipe_check,
>>> -    .update        = mgag200_simple_display_pipe_update,
>>> -    .reset_crtc = mgag200_simple_display_pipe_reset_crtc,
>>> -    .duplicate_crtc_state = 
>>> mgag200_simple_display_pipe_duplicate_crtc_state,
>>> -    .destroy_crtc_state = 
>>> mgag200_simple_display_pipe_destroy_crtc_state,
>>> -    DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
>>> +static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
>>> +    .destroy = drm_encoder_cleanup,
>>>   };
>>>   /*
>>> @@ -999,12 +1052,49 @@ static int mgag200_mode_config_init(struct 
>>> mga_device *mdev, resource_size_t vra
>>>   static int mgag200_pipeline_init(struct mga_device *mdev)
>>>   {
>>>       struct drm_device *dev = &mdev->base;
>>> +    struct drm_plane *primary_plane = &mdev->primary_plane;
>>> +    struct drm_crtc *crtc = &mdev->crtc;
>>> +    struct drm_encoder *encoder = &mdev->encoder;
>>>       struct mga_i2c_chan *i2c = &mdev->i2c;
>>>       struct drm_connector *connector = &mdev->connector;
>>> -    struct drm_simple_display_pipe *pipe = &mdev->display_pipe;
>>> -    size_t format_count = 
>>> ARRAY_SIZE(mgag200_simple_display_pipe_formats);
>>>       int ret;
>>> +    ret = mgag200_pixpll_init(&mdev->pixpll, mdev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = drm_universal_plane_init(dev, primary_plane, 0,
>>> +                       &mgag200_primary_plane_funcs,
>>> +                       mgag200_primary_plane_formats,
>>> +                       ARRAY_SIZE(mgag200_primary_plane_formats),
>>> +                       mgag200_primary_plane_fmtmods,
>>> +                       DRM_PLANE_TYPE_PRIMARY, NULL);
>>> +    if (ret) {
>>> +        drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    drm_plane_helper_add(primary_plane, 
>>> &mgag200_primary_plane_helper_funcs);
>>> +    drm_plane_enable_fb_damage_clips(primary_plane);
>>> +
>>> +    ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL, 
>>> &mgag200_crtc_funcs, NULL);
>>> +    if (ret) {
>>> +        drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +    drm_crtc_helper_add(crtc, &mgag200_crtc_helper_funcs);
>>> +
>>> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
>>> without */
>>> +    drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>>> +    drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>>> +
>>> +    encoder->possible_crtcs = drm_crtc_mask(crtc);
>>> +    ret = drm_encoder_init(dev, encoder, &mgag200_dac_encoder_funcs,
>>> +                   DRM_MODE_ENCODER_DAC, NULL);
>>> +    if (ret) {
>>> +        drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>>       ret = mgag200_i2c_init(mdev, i2c);
>>>       if (ret) {
>>>           drm_err(dev, "failed to add DDC bus: %d\n", ret);
>>> @@ -1021,30 +1111,12 @@ static int mgag200_pipeline_init(struct 
>>> mga_device *mdev)
>>>       }
>>>       drm_connector_helper_add(connector, 
>>> &mga_vga_connector_helper_funcs);
>>> -    ret = mgag200_pixpll_init(&mdev->pixpll, mdev);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>> -    ret = drm_simple_display_pipe_init(dev, pipe,
>>> -                       &mgag200_simple_display_pipe_funcs,
>>> -                       mgag200_simple_display_pipe_formats,
>>> -                       format_count,
>>> -                       mgag200_simple_display_pipe_fmtmods,
>>> -                       connector);
>>> +    ret = drm_connector_attach_encoder(connector, encoder);
>>>       if (ret) {
>>> -        drm_err(dev,
>>> -            "drm_simple_display_pipe_init() failed, error %d\n",
>>> -            ret);
>>> +        drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", 
>>> ret);
>>>           return ret;
>>>       }
>>> -    drm_plane_enable_fb_damage_clips(&pipe->plane);
>>> -
>>> -    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
>>> without */
>>> -    drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
>>> -
>>> -    drm_crtc_enable_color_mgmt(&pipe->crtc, 0, false, 
>>> MGAG200_LUT_SIZE);
>>> -
>>>       return 0;
>>>   }
>>
>> Everything else looks good to me.
>>
>> Thanks,
>>
> 

