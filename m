Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53EF5249FA
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 12:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D94E10E877;
	Thu, 12 May 2022 10:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B0F10E077
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652350117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ry8Ix1u7/KJbiC6DOyjauVWC79XD9dhe6GdbLqvLcc=;
 b=NCoXVQ0SMQ1yVWRNDujsVqTYVa+UYGkahRrTb3OGygr27vT6u6MfuOKRiZLDtU+ZUAOsfm
 Bl5yMjEB/H2KUZLBXNKKP1oqlxe2Vfw5a/x6og0EbKn855LXJtXo1pjkIvrn8q6jmXNXyn
 9dklEPP37Vgc+iDVGGEg2tSunVXUcNo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-zdg_uSiMMfKX8gzU4AB4yw-1; Thu, 12 May 2022 06:08:36 -0400
X-MC-Unique: zdg_uSiMMfKX8gzU4AB4yw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso1441560wmm.7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 03:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Ry8Ix1u7/KJbiC6DOyjauVWC79XD9dhe6GdbLqvLcc=;
 b=JtBjUsX3pLjiH1ZfA+MDs41g1GgA5Ri+xDbYbPMdVJ1bJW/qMcLL+dBiRkf56HB9vT
 ehLIxrym+a+4nC9dgcuL3r3AyW97biautl9WgRCX9hjWkKtkAVd5yEQae5JGDQztWXjZ
 mfaKXzjHKLAr8smj/rpV+hOH8qajEVyER8PDnTEWeEjdmaw+C8PNiSPbGpo37d2Tl0qy
 3UW5JMKvRbt5CByZw+K2YMn7AZHwRZRBfKiLbjrFttf8z14nm7ygAhacwdX4wY72lKt7
 BJWD9NFS55B8lJ0E8eGVI+z0O2G/oleJ1ZnmNBQZ8oj0KiInZ2xuuRRYuyvO5mWQ23Hz
 ZXVw==
X-Gm-Message-State: AOAM530X0lwlhHw0RqdG31DJkJWSyamLL7DCdlmtCIlBtIgnG3KsuxJa
 3zd2q3E1rias2Z7wFIfGW69yJi+Q55ssKbozxqSp+jri8hFmuR05n2aYTjK7tExzNiHNzaZBqyL
 ahTL0X1fcv/kapG4yRvQlNlwRwp8/
X-Received: by 2002:a1c:a181:0:b0:392:8f7e:d2f8 with SMTP id
 k123-20020a1ca181000000b003928f7ed2f8mr9585066wme.30.1652350115020; 
 Thu, 12 May 2022 03:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRLT/I76e+8zut4DCNlXzNNmugzRZsGOKIhNyxmU8PqqFf92lQKRL/ExQUK9edMNa6uy5koA==
X-Received: by 2002:a1c:a181:0:b0:392:8f7e:d2f8 with SMTP id
 k123-20020a1ca181000000b003928f7ed2f8mr9585045wme.30.1652350114740; 
 Thu, 12 May 2022 03:08:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm2636968wmi.9.2022.05.12.03.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 03:08:34 -0700 (PDT)
Message-ID: <c30f3cb4-2d1e-0241-48ec-f67c0168493c@redhat.com>
Date: Thu, 12 May 2022 12:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] mgag200: Enable atomic gamma lut update
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 lyude@redhat.com
References: <20220511152815.892562-1-jfalempe@redhat.com>
 <ba15fc5e-29a8-d819-a34a-f196d20709b3@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ba15fc5e-29a8-d819-a34a-f196d20709b3@suse.de>
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 10:52, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.05.22 um 17:28 schrieb Jocelyn Falempe:
>> Add support for atomic update of gamma lut.
>> With this patch the "Night light" feature of gnome3
>> is working properly on mgag200.
>>
>> v2:
>>   - Add a default linear gamma function
>>   - renamed functions with mgag200 prefix
>>   - use format's 4cc code instead of bit depth
>>   - use better interpolation for 16bits gamma
>>   - remove legacy function mga_crtc_load_lut()
>>   - can't remove the call to drm_mode_crtc_set_gamma_size()
>>      because it doesn't work with userspace.
>>   - other small refactors
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> I already gave a Tested-by on the first iteration. It's good practice to 
> add these tags in follow-up patches unless the patch has changed entirely.

Sorry, I though I changed too much code in v2 to add it.
> 
> A few more comments are below. With those fixed:
> 
> Reviewed-by: Thomas Zimmermann <tzimemrmann@suse.de>
> 
> I suggest to post another version of the patch and merge it if no 
> further comments arrive within 2 days.
> 
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 125 ++++++++++++++++---------
>>   1 file changed, 81 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 6e18d3bbd720..b748bc5b0e93 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -32,57 +32,76 @@
>>    * This file contains setup code for the CRTC.
>>    */
>> -static void mga_crtc_load_lut(struct drm_crtc *crtc)
>> +static void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
>> +                      uint32_t format)
>>   {
>> -    struct drm_device *dev = crtc->dev;
>> -    struct mga_device *mdev = to_mga_device(dev);
>> -    struct drm_framebuffer *fb;
>> -    u16 *r_ptr, *g_ptr, *b_ptr;
>>       int i;
>> -    if (!crtc->enabled)
>> -        return;
>> -
>> -    if (!mdev->display_pipe.plane.state)
>> -        return;
>> +    WREG8(DAC_INDEX + MGA1064_INDEX, 0);
>> -    fb = mdev->display_pipe.plane.state->fb;
>> +    switch (format) {
>> +    case DRM_FORMAT_RGB565:
>> +        /* Use better interpolation, to take 32 values from 0 to 255 */
>> +        for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
>> +        }
>> +        /* Green has one more bit, so add padding with 0 for red and 
>> blue. */
>> +        for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
>> +        }
>> +        break;
>> +    case DRM_FORMAT_RGB888:
>> +    case DRM_FORMAT_XRGB8888:
>> +        for (i = 0; i < MGAG200_LUT_SIZE; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
>> +        }
> 
> These loops look much nicer to me.
> 
>> +        break;
>> +    default:
>> +        drm_warn_once(&mdev->base, "Unsupported format for gamma 
>> %d\n", format);
> 
> There's a print format modifier for 4cc formats. It's %p4cc and expects 
> a pointer to the format's 4cc code. See 'git grep p4cc' for examples.

ok, that's a cool feature.

> 
> The comment itself is not easy to understand. Maybe "Unsupported format 
> %p4cc for gamma correction.\n" ?

Sure, having good error message is always helpful.

> 
>> +        break;
>> +    }
>> +}
>> -    r_ptr = crtc->gamma_store;
>> -    g_ptr = r_ptr + crtc->gamma_size;
>> -    b_ptr = g_ptr + crtc->gamma_size;
>> +static void mgag200_crtc_set_gamma(struct mga_device *mdev,
>> +                   struct drm_color_lut *lut,
>> +                   uint32_t format)
>> +{
>> +    int i;
>>       WREG8(DAC_INDEX + MGA1064_INDEX, 0);
>> -    if (fb && fb->format->cpp[0] * 8 == 16) {
>> -        int inc = (fb->format->depth == 15) ? 8 : 4;
>> -        u8 r, b;
>> -        for (i = 0; i < MGAG200_LUT_SIZE; i += inc) {
>> -            if (fb->format->depth == 16) {
>> -                if (i > (MGAG200_LUT_SIZE >> 1)) {
>> -                    r = b = 0;
>> -                } else {
>> -                    r = *r_ptr++ >> 8;
>> -                    b = *b_ptr++ >> 8;
>> -                    r_ptr++;
>> -                    b_ptr++;
>> -                }
>> -            } else {
>> -                r = *r_ptr++ >> 8;
>> -                b = *b_ptr++ >> 8;
>> -            }
>> -            /* VGA registers */
>> -            WREG8(DAC_INDEX + MGA1064_COL_PAL, r);
>> -            WREG8(DAC_INDEX + MGA1064_COL_PAL, *g_ptr++ >> 8);
>> -            WREG8(DAC_INDEX + MGA1064_COL_PAL, b);
>> +    switch (format) {
>> +    case DRM_FORMAT_RGB565:
>> +        /* Use better interpolation, to take 32 values from lut[0] to 
>> lut[255] */
>> +        for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].red 
>> >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 
>> 16].green >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 
>> 4].blue >> 8);
>>           }
>> -        return;
>> -    }
>> -    for (i = 0; i < MGAG200_LUT_SIZE; i++) {
>> -        /* VGA registers */
>> -        WREG8(DAC_INDEX + MGA1064_COL_PAL, *r_ptr++ >> 8);
>> -        WREG8(DAC_INDEX + MGA1064_COL_PAL, *g_ptr++ >> 8);
>> -        WREG8(DAC_INDEX + MGA1064_COL_PAL, *b_ptr++ >> 8);
>> +        /* Green has one more bit, so add padding with 0 for red and 
>> blue. */
>> +        for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 
>> 16].green >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
>> +        }
>> +        break;
>> +    case DRM_FORMAT_RGB888:
>> +    case DRM_FORMAT_XRGB8888:
>> +        for (i = 0; i < MGAG200_LUT_SIZE; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
>> +        }
>> +        break;
>> +    default:
>> +        drm_warn_once(&mdev->base, "Unsupported format for gamma 
>> %d\n", format);
> 
> Same as above.
> 
>> +        break;
>>       }
>>   }
>> @@ -900,7 +919,11 @@ mgag200_simple_display_pipe_enable(struct 
>> drm_simple_display_pipe *pipe,
>>       if (mdev->type == G200_WB || mdev->type == G200_EW3)
>>           mgag200_g200wb_release_bmc(mdev);
>> -    mga_crtc_load_lut(crtc);
>> +    if (crtc_state->gamma_lut)
>> +        mgag200_crtc_set_gamma(mdev, crtc_state->gamma_lut->data, 
>> fb->format->format);
> 
> Nitpicking: I'd give the format before the LUT data. It's more logical 
> and aligns with '_set_gamma_linear'. I'd also pass fb->format instead of 
> fb->format->format.

ok, I will do that too.
> 
>> +    else
>> +        mgag200_crtc_set_gamma_linear(mdev, fb->format->format);
>> +
>>       mgag200_enable_display(mdev);
>>       mgag200_handle_damage(mdev, fb, &fullscreen, 
>> &shadow_plane_state->data[0]);
>> @@ -945,6 +968,14 @@ mgag200_simple_display_pipe_check(struct 
>> drm_simple_display_pipe *pipe,
>>               return ret;
>>       }
>> +    if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
>> +        if (crtc_state->gamma_lut->length !=
>> +            MGAG200_LUT_SIZE * sizeof(struct drm_color_lut)) {
>> +            drm_err(dev, "Wrong size for gamma_lut %ld\n",
> 
> The kernel bot complained about '%ld'. I think %zu is the one for size_t.

I had no warnings when building on x86_64, but printf format is a bit 
tricky to get right.
> 
>> +                crtc_state->gamma_lut->length);
>> +            return -EINVAL;
>> +        }
>> +    }
>>       return 0;
>>   }
>> @@ -953,6 +984,7 @@ mgag200_simple_display_pipe_update(struct 
>> drm_simple_display_pipe *pipe,
>>                      struct drm_plane_state *old_state)
>>   {
>>       struct drm_plane *plane = &pipe->plane;
>> +    struct drm_crtc *crtc = &pipe->crtc;
>>       struct drm_device *dev = plane->dev;
>>       struct mga_device *mdev = to_mga_device(dev);
>>       struct drm_plane_state *state = plane->state;
>> @@ -963,6 +995,9 @@ mgag200_simple_display_pipe_update(struct 
>> drm_simple_display_pipe *pipe,
>>       if (!fb)
>>           return;
>> +    if (crtc->state->color_mgmt_changed && crtc->state->gamma_lut)
>> +        mgag200_crtc_set_gamma(mdev, crtc->state->gamma_lut->data, 
>> fb->format->format);
>> +
> 
> This also needs a call to _set_gamma_linear?

No, I think the gamma table should be properly initialized in 
mgag200_simple_display_pipe_enable(), so only set it if userspace gives 
a new table.

> 
> Best regards
> Thomas
> 
>>       if (drm_atomic_helper_damage_merged(old_state, state, &damage))
>>           mgag200_handle_damage(mdev, fb, &damage, 
>> &shadow_plane_state->data[0]);
>>   }
>> @@ -1107,9 +1142,11 @@ int mgag200_modeset_init(struct mga_device *mdev)
>>           return ret;
>>       }
>> -    /* FIXME: legacy gamma tables; convert to CRTC state */
>> +    /* FIXME: legacy gamma tables, but atomic gamma doesn't work 
>> without */
>>       drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
>> +    drm_crtc_enable_color_mgmt(&pipe->crtc, 0, false, MGAG200_LUT_SIZE);
>> +
>>       drm_mode_config_reset(dev);
>>       return 0;
> 

Thanks for your review, I will send a v3 soon,

-- 

Jocelyn

