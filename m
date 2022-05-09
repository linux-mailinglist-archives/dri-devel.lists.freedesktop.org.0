Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E783520153
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 17:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA3610E1EA;
	Mon,  9 May 2022 15:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E654610E1EA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 15:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652111002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDvoQEu426PQhNK75aV6i5kIMrCKM4IyiWys5+OoScE=;
 b=EDZsjBa7V2gGgIik6BJoiL+FbLsAkmrdJVOkdVozeqylW3Z+fdX6OTf19jfJ1JtDbaxFDy
 WJzUIhab9iS8TR8VzI3c0kD7mgYAjEOOimqsR5TjuPrKg27ZwrYBrkWxcnb2XVIyXTnfe+
 8OzFPXjOvaEKt+pY8Ol6pEcX7Mdz6sE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-F7ohdlm-P6qK5TZgc146CA-1; Mon, 09 May 2022 11:43:21 -0400
X-MC-Unique: F7ohdlm-P6qK5TZgc146CA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso5920529wrd.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 08:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pDvoQEu426PQhNK75aV6i5kIMrCKM4IyiWys5+OoScE=;
 b=Z3ld1vefjXNHLerCklrgO1CRPH6zdmAvMahOoWVc/7/+JmjfCTX3FjwaQrCg/lwmWf
 6pwrRT2lmVNnzYE6N9F9iP5fd1utiq6UbgUHMPKFbTtdZp5KhWdDiyqY11Llc0+p0eOj
 hpRw4l3o2CSgnoea7t0yrV5pTebISOgSkZIli9byv47ava3iHB7k7IG3LzxQcgVsndnG
 UV+6epWLqwpcUbQoz5wNcN6Iu/vB7RS51ZJZ/U/8hxG3XS7uSTO7oKvKVxP9wsP6Ny1O
 0NIWQ1xx7A15ge1jpEw9dP84bTp9rzSAenMztnpMSKK8tg+HtSWnbsl6mTTRXnUYwZWa
 6MhQ==
X-Gm-Message-State: AOAM532uknj8Rj0oDG3jEzUU31QmsS1Qu5omMibjq36u4s4zioXsqMMF
 sBcKpOXOKfBltqm7mMQ7390jTdHOJgk3BOrOxpg8qkNXsME7BF8gzUVxoCtOVui1CwXNCILezou
 EiWjvWnOxXYJ7Lj7SFiM81vgxysJ8
X-Received: by 2002:a5d:45d0:0:b0:20a:d002:b80e with SMTP id
 b16-20020a5d45d0000000b0020ad002b80emr14395422wrs.447.1652110999994; 
 Mon, 09 May 2022 08:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwUH6w15JMrHaWl+o5OtfHnJbdiEnFLFbouX+dWQySkupS9shz25KXFqkMxmAmrYyIoIW5Sw==
X-Received: by 2002:a5d:45d0:0:b0:20a:d002:b80e with SMTP id
 b16-20020a5d45d0000000b0020ad002b80emr14395403wrs.447.1652110999655; 
 Mon, 09 May 2022 08:43:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c264b00b0039444973258sm19793428wmy.0.2022.05.09.08.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 08:43:19 -0700 (PDT)
Message-ID: <c8c9ab62-8e6a-3bdd-8f6e-a75839e97ffa@redhat.com>
Date: Mon, 9 May 2022 17:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] mgag200: Enable atomic gamma lut update
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 lyude@redhat.com
References: <20220509094930.44613-1-jfalempe@redhat.com>
 <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
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

On 09/05/2022 16:22, Thomas Zimmermann wrote:
> Hi,
> 
> first of all
> 
> Tested-by: Thomas Zimemrmann <tzimmermann@suse.de>
> 
> on G200EH. I clicked a bit in Gnome settings and the display changed 
> colors. It's pretty cool.

yeah, I also played a bit with https://github.com/zb3/gnome-gamma-tool

> 
> Am 09.05.22 um 11:49 schrieb Jocelyn Falempe:
>> Add support for atomic update of gamma lut.
>> With this patch the "Night light" feature of gnome3
>> is working properly on mgag200.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_mode.c | 46 ++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 6e18d3bbd720..9fc688e15db8 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -86,6 +86,46 @@ static void mga_crtc_load_lut(struct drm_crtc *crtc)
> 
> mga_crtc_load_lut is legacy code and needs to go away.
> 
>>       }
>>   }
>> +static void mga_crtc_update_lut(struct mga_device *mdev,
>> +                struct drm_crtc_state *state,
>> +                u8 depth)
> 
> Rather name this function mgag200_crtc_set_gamma().
> 
> The driver was once ported from X11 userspace, where it was called mga. 
> Thus the occational mga_ prefix. It it should now be mgag200.

ok
> 
>> +{
>> +    struct drm_color_lut * lut;
>> +    int i;
>> +
>> +    if (!state->color_mgmt_changed || !state->gamma_lut)
>> +        return
> 
> Semicolon is missing here.

oops ;)
> 
> The test itself should go into the caller. The update function here 
> should be independent from the crtc state. Pass in the plane state's 
> framebuffer and the crtc state's gamma_lut property.

ok, it makes sense.
> 
>> +
>> +    lut = (struct drm_color_lut *) state->gamma_lut->data;
>> +    WREG8(DAC_INDEX + MGA1064_INDEX, 0);
>> +
>> +    if (depth == 15) {
> 
> format->depth is deprecated.  Better write these if-else branches as 
> switch of the format's 4cc code:
> 
> switch (fb->format->format) {
> case DRM_FORMAT_XRGB1555:
>      ...
>      break;
> case DRM_FORMAT_RGB565:
>      ...
>      break;
> case DRM_FORMAT_RGB888:
> case DRM_FORMAT_XRGB:
>      ...
>      break;
> }

As the driver doesn't advertise XRGB1555, maybe I can drop it ?
I kept it because the mga_crtc_load_lut() supports it.

> 
>> +        /* 16 bits r5g5b5a1 */
> 
> With 4cc codes, you can remove these comments.
> 
>> +        for (i = 0; i < MGAG200_LUT_SIZE; i += 8) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
>> +        }
>> +    } else if (depth == 16) {
>> +        /* 16 bits r5g6b5, as green has one more bit,
>> +         * add padding with 0 for red and blue. */
>> +        for (i = 0; i < MGAG200_LUT_SIZE; i += 4) {
>> +            u8 red = 2 * i < MGAG200_LUT_SIZE ? lut[2 * i].red >> 8 : 0;
>> +            u8 blue = 2 * i < MGAG200_LUT_SIZE ? lut[2 * i].red >> 8 
>> : 0;
> 
> '[].blue' here.

oops again ;)

> 
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, red);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, blue);
>> +        }
>> +    } else {
>> +        /* 24 bits r8g8b8 */
>> +        for (i = 0; i < MGAG200_LUT_SIZE; i++) {
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
>> +            WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
>> +        }
>> +    }
>> +}
>> +
> 
> These loops seem hard to understand because the index i doesn't 
> obviously correspond to the source or destination; except for the final 
> one.
> 
> I'd write out the offset into the HW palette as constant value in the 
> for loop and walk over the given lut table via pointer arithmetic.
> 
> It might also make sense to adjust the starting value of the lut table 
> such that its final entry is used for the final entry in the HW palette. 
> For typical gamma ramps ~2, the curve is fairly flat for small values 
> and goes up steeply at high values. (Please correct me if I'm 
> misinterpreting the gamma ramps.)

I didn't realize that taking 1 out of 8 values will have this side 
effect. sure this can be fixed.
> 
> For 15-bit case I'd do thing like this.
> 
>   lut += 7;
>   for (i < 0; i < 32; ++i, lut += 8) {
>      // write  lut
>   }
> 
> 16-bit is complicated and may better be done in 2 loops
> 
>   lutr += 7;
>   lutg += 3;
>   lutb += 7;
>   for (i < 0; i < 32; ++i, lutr += 8, lutg += 3, lutb += 8) {
>     // write  r/g/b lut
>   }
>   for (; i < 64; ++i, lutg += 3) {
>     // write  0/g/0 lut
>   }

ok, will try to do something like this. It took me a while to understand 
the loops of mga_crtc_load_lut(), so I tried to simplify.
> 
>>   static inline void mga_wait_vsync(struct mga_device *mdev)
>>   {
>>       unsigned long timeout = jiffies + HZ/10;
>> @@ -953,6 +993,7 @@ mgag200_simple_display_pipe_update(struct 
>> drm_simple_display_pipe *pipe,
>>                      struct drm_plane_state *old_state)
>>   {
>>       struct drm_plane *plane = &pipe->plane;
>> +    struct drm_crtc *crtc = &pipe->crtc;
>>       struct drm_device *dev = plane->dev;
>>       struct mga_device *mdev = to_mga_device(dev);
>>       struct drm_plane_state *state = plane->state;
>> @@ -963,7 +1004,10 @@ mgag200_simple_display_pipe_update(struct 
>> drm_simple_display_pipe *pipe,
>>       if (!fb)
>>           return;
>> +    mga_crtc_update_lut(mdev, crtc->state, fb->format->depth);
>> +
> 
> We should also call this function in pipe_enable.
> 
> And there's the question what happens if gamma_lut is not set.  So far, 
> we get away with it because mga_crtc_load_lut().  A better approach is 
> to add another function mgag200_crtc_set_gamma_linear() that clears the 
> palette to a linear curve (i.e., same as mga_crtc_load_lut() does now). 
> It would be called if no crtc->state->gamma_lut is NULL.

Yes, if I remove mga_crtc_load_lut() I will need to set the default.
should be simple to do.


> 
>>       if (drm_atomic_helper_damage_merged(old_state, state, &damage))
>> +
> 
> That empty line is fallout from rebasing from the other patchset?

yes ;)
> 
>>           mgag200_handle_damage(mdev, fb, &damage, 
>> &shadow_plane_state->data[0]);
>>   }
>> @@ -1110,6 +1154,8 @@ int mgag200_modeset_init(struct mga_device *mdev)
>>       /* FIXME: legacy gamma tables; convert to CRTC state */
>>       drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
> 
> Here's another legacy call that should get removed.

Yes, I can remove that one too.

> 
>> +    drm_crtc_enable_color_mgmt(&pipe->crtc, 0, false, MGAG200_LUT_SIZE);
> 
> AFAICT the DRM core does not enforce the LUT size. It's just information 
> for userspace, which could give any amount of palette entries. So the 
> driver's pipe_check function has to enforce the limit. If the gamma_lut 
> property is set, it should always contain 256 entries.
> 
> Best regards
> Thomas
> 
>> +
>>       drm_mode_config_reset(dev);
>>       return 0;
> 

Thanks a lot for your review, I will rework this and send a v2.

-- 

Jocelyn

