Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065849275F0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E21310EAC3;
	Thu,  4 Jul 2024 12:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IXXZ9oMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054B410EAC3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720096070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGOK3v380mScVxIB+5nhCn1pnCqZuzK3mPDmWhKwBs4=;
 b=IXXZ9oMY8tSvxr9GDpO724TpizElZW1S8WOvuXSywYyGq2mKb9828nHbR62K/2MrtcM2LH
 3a8rGMyGatcz4obsxILg5xivoAzj4CXfamvEPz6R5gy4X8tObUXMSKQ0NucKR/O66BmDe9
 SQb8yno061NezRohzbXIJqj8a1PqWv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-ZRDkq7ejO8KReFlbcGpKxw-1; Thu, 04 Jul 2024 08:27:48 -0400
X-MC-Unique: ZRDkq7ejO8KReFlbcGpKxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-425685183edso4636895e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 05:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720096067; x=1720700867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aGOK3v380mScVxIB+5nhCn1pnCqZuzK3mPDmWhKwBs4=;
 b=usEv1hl9gT9y1itbALSuyB5ru3SuCacG4xhZ/Q+dWa1zwiIwW4PLbfI5E9tTs2TnSy
 NxT62VwNtvY16jqEyPC5ITML55xD4XP46ONlJDFW5NnA/BcNE1Z5+I7+pIhdTWmHZvmB
 XrDSuniZno9M2Wjj8BqIEv7GkMrdo11hdRE6lkAF0sH+N7edNeUBOXIATh6fqHrJ5fx6
 BtSrqtyS4yuDpjmh0UxD6HixDoTIj3zg0V8Aqk1RHW9iA/qE1rts9ZQ/ncfEq4iwgLkS
 JIc6cXA8TtZZDsmEWd6+zYKOM7/JsXDX83ONTzhEQ/0Ixod0yoHjXFDrQtH9RXeIm8Pd
 lVBw==
X-Gm-Message-State: AOJu0YwvhRmc9sObpvcOVSttK+Yous55rPow7Abo14Yi4bAdOE+QASdP
 eoEjtTwNe4RBV8SJHoUgXfObEPSVrXEfJKXp26JjPfNgS6E7NWszp+gMHoggBfwogx9/JkAWJEr
 t3jPD6GQ9IcLh57FV2Vmmw7wW8w8cMWl7KnJCBCNnOGV+V8A8dGV8jyPezlTZu9T5EA==
X-Received: by 2002:a05:600c:214d:b0:424:aa73:83db with SMTP id
 5b1f17b1804b1-4264a3d98e2mr13251055e9.3.1720096067666; 
 Thu, 04 Jul 2024 05:27:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzdLHfL9RaReLV6CPIXnxHg8cEadvCD1rEtiqkF9KreNiF5bzt7y0iLgOXCDf756IATmGc0g==
X-Received: by 2002:a05:600c:214d:b0:424:aa73:83db with SMTP id
 5b1f17b1804b1-4264a3d98e2mr13250875e9.3.1720096067245; 
 Thu, 04 Jul 2024 05:27:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1f2391sm23208165e9.25.2024.07.04.05.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 05:27:46 -0700 (PDT)
Message-ID: <b89600c3-59b9-4eb4-8e26-34e36cdd0a82@redhat.com>
Date: Thu, 4 Jul 2024 14:27:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/mgag200: Only set VIDRST bits in CRTC modesetting
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240703135502.29190-1-tzimmermann@suse.de>
 <20240703135502.29190-2-tzimmermann@suse.de>
 <bdc20978-933d-4b57-8350-3775fa01e145@redhat.com>
 <119aeaca-9a9f-4914-8730-6dacf72705f5@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <119aeaca-9a9f-4914-8730-6dacf72705f5@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/07/2024 14:16, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.07.24 um 14:03 schrieb Jocelyn Falempe:
>>
>>
>> On 03/07/2024 15:40, Thomas Zimmermann wrote:
>>> The VRSTEN and HRSTEN bits control whether a CRTC synchronizes its
>>> display signal with an external source on the VIDRST pin. The G200WB
>>> and G200EW3 models synchronize with a BMC chip, but different external
>>> video encoders, such as the Matrox Maven, can also be attached to the
>>> pin.
>>
>> If I understand correctly, it's a kind of VSYNC with the BMC, to avoid
>> tearing when using the remote console ?
> 
> I closely looked through the code behind enable_vidrst and 
> disable_vidrst. The involved registers are mostly undocumented, but from 
> the comments I assume that the BMC has to stop scanning out the display 
> signal. It's likely that it only picks up mode changes after the scanout 
> has been re-enabled.
> 
> BTW we've seen various models with BMC attached, but only G200EW3 and 
> G200WB use this code for synchronization. Do you think we could enable 
> it for all models and BMCs?
> 
 From one side it makes sense because all those chips are made for BMC. 
On the other hand, it may break, and we don't know what the other BMC 
firmwares are doing, and we even don't know if those pins are connected.

So I prefer to stay on the safe side, and keep it like this.


>>
>>>
>>> Only set VRSTEN and HRSTEN bits in the CRTC mode-setting code, so the
>>> driver maintains the bits independently from the BMC. Add the field
>>> set_vidrst to the CRTC state for this purpose. Off by default, control
>>> the CRTC VIDRST setting from the BMC's atomic_check helper. So if a
>>> BMC (or another external clock) requires synchronization, it instructs
>>> the CRTC to synchronize. >
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/mgag200/mgag200_bmc.c    | 26 +++++++++++++++++++-----
>>>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  5 ++++-
>>>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 +-
>>>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 +-
>>>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 +-
>>>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 11 ++++++----
>>>   6 files changed, 35 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> index 23ef85aa7e37..cb5400333862 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
>>> @@ -77,11 +77,6 @@ void mgag200_bmc_enable_vidrst(struct mga_device 
>>> *mdev)
>>>   {
>>>       u8 tmp;
>>>   -    /* Ensure that the vrsten and hrsten are set */
>>> -    WREG8(MGAREG_CRTCEXT_INDEX, 1);
>>> -    tmp = RREG8(MGAREG_CRTCEXT_DATA);
>>> -    WREG8(MGAREG_CRTCEXT_DATA, tmp | 0x88);
>>> -
>>>       /* Assert rstlvl2 */
>>>       WREG8(DAC_INDEX, MGA1064_REMHEADCTL2);
>>>       tmp = RREG8(DAC_DATA);
>>> @@ -108,6 +103,25 @@ void mgag200_bmc_enable_vidrst(struct mga_device 
>>> *mdev)
>>>       WREG_DAC(MGA1064_GEN_IO_DATA, tmp);
>>>   }
>>>   +static int mgag200_bmc_encoder_helper_atomic_check(struct 
>>> drm_encoder *encoder,
>>> +                           struct drm_crtc_state *crtc_state,
>>> +                           struct drm_connector_state *conn_state)
>>> +{
>>> +    struct mga_device *mdev = to_mga_device(encoder->dev);
>>> +    struct mgag200_crtc_state *mgag200_crtc_state = 
>>> to_mgag200_crtc_state(crtc_state);
>>> +
>>> +    if (mdev->info->has_vidrst)
>>> +        mgag200_crtc_state->set_vidrst = true;
>>> +    else
>>> +        mgag200_crtc_state->set_vidrst = false;
>>> +
>>
>> I think you can simplify it with:
>>
>> mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;
> 
> Ok.
> 
> Best regards
> Thomas
> 
> 
>>
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct drm_encoder_helper_funcs 
>>> mgag200_bmc_encoder_helper_funcs = {
>>> +    .atomic_check = mgag200_bmc_encoder_helper_atomic_check,
>>> +};
>>> +
>>>   static const struct drm_encoder_funcs mgag200_bmc_encoder_funcs = {
>>>       .destroy = drm_encoder_cleanup,
>>>   };
>>> @@ -190,6 +204,8 @@ int mgag200_bmc_output_init(struct mga_device 
>>> *mdev, struct drm_connector *physi
>>>                      DRM_MODE_ENCODER_VIRTUAL, NULL);
>>>       if (ret)
>>>           return ret;
>>> +    drm_encoder_helper_add(encoder, &mgag200_bmc_encoder_helper_funcs);
>>> +
>>>       encoder->possible_crtcs = drm_crtc_mask(crtc);
>>>         bmc_connector = &mdev->output.bmc.bmc_connector;
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> index 7f7dfbd0f013..4b75613de882 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>>> @@ -179,6 +179,8 @@ struct mgag200_crtc_state {
>>>       const struct drm_format_info *format;
>>>         struct mgag200_pll_values pixpllc;
>>> +
>>> +    bool set_vidrst;
>>>   };
>>>     static inline struct mgag200_crtc_state 
>>> *to_mgag200_crtc_state(struct drm_crtc_state *base)
>>> @@ -430,7 +432,8 @@ void mgag200_crtc_atomic_destroy_state(struct 
>>> drm_crtc *crtc, struct drm_crtc_st
>>>       .atomic_duplicate_state = mgag200_crtc_atomic_duplicate_state, \
>>>       .atomic_destroy_state = mgag200_crtc_atomic_destroy_state
>>>   -void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>>> drm_display_mode *mode);
>>> +void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>>> drm_display_mode *mode,
>>> +               bool set_vidrst);
>>>   void mgag200_set_format_regs(struct mga_device *mdev, const struct 
>>> drm_format_info *format);
>>>   void mgag200_enable_display(struct mga_device *mdev);
>>>   void mgag200_init_registers(struct mga_device *mdev);
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>>> index 4e8a1756138d..abfbed6ec390 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>>> @@ -195,7 +195,7 @@ static void 
>>> mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>>           funcs->disable_vidrst(mdev);
>>>         mgag200_set_format_regs(mdev, format);
>>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>>> mgag200_crtc_state->set_vidrst);
>>>         if (funcs->pixpllc_atomic_update)
>>>           funcs->pixpllc_atomic_update(crtc, old_state);
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>>> index d884f3cb0ec7..acc99999e2b5 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>>> @@ -196,7 +196,7 @@ static void 
>>> mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>>           funcs->disable_vidrst(mdev);
>>>         mgag200_set_format_regs(mdev, format);
>>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>>> mgag200_crtc_state->set_vidrst);
>>>         if (funcs->pixpllc_atomic_update)
>>>           funcs->pixpllc_atomic_update(crtc, old_state);
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>>> index a824bb8ad579..be4e124102c6 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>>> @@ -327,7 +327,7 @@ static void 
>>> mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>>           funcs->disable_vidrst(mdev);
>>>         mgag200_set_format_regs(mdev, format);
>>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>>> mgag200_crtc_state->set_vidrst);
>>>         if (funcs->pixpllc_atomic_update)
>>>           funcs->pixpllc_atomic_update(crtc, old_state);
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> index bb6204002cb3..4f4612192e30 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>>> @@ -201,9 +201,9 @@ void mgag200_init_registers(struct mga_device *mdev)
>>>       WREG8(MGA_MISC_OUT, misc);
>>>   }
>>>   -void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>>> drm_display_mode *mode)
>>> +void mgag200_set_mode_regs(struct mga_device *mdev, const struct 
>>> drm_display_mode *mode,
>>> +               bool set_vidrst)
>>>   {
>>> -    const struct mgag200_device_info *info = mdev->info;
>>>       unsigned int hdisplay, hsyncstart, hsyncend, htotal;
>>>       unsigned int vdisplay, vsyncstart, vsyncend, vtotal;
>>>       u8 misc, crtcext1, crtcext2, crtcext5;
>>> @@ -238,9 +238,11 @@ void mgag200_set_mode_regs(struct mga_device 
>>> *mdev, const struct drm_display_mod
>>>              ((hdisplay & 0x100) >> 7) |
>>>              ((hsyncstart & 0x100) >> 6) |
>>>               (htotal & 0x40);
>>> -    if (info->has_vidrst)
>>> +    if (set_vidrst)
>>>           crtcext1 |= MGAREG_CRTCEXT1_VRSTEN |
>>>                   MGAREG_CRTCEXT1_HRSTEN;
>>> +    else
>>> +        crtcext1 &= ~(MGAREG_CRTCEXT1_VRSTEN | MGAREG_CRTCEXT1_HRSTEN);
>>>         crtcext2 = ((vtotal & 0xc00) >> 10) |
>>>              ((vdisplay & 0x400) >> 8) |
>>> @@ -656,7 +658,7 @@ void mgag200_crtc_helper_atomic_enable(struct 
>>> drm_crtc *crtc, struct drm_atomic_
>>>           funcs->disable_vidrst(mdev);
>>>         mgag200_set_format_regs(mdev, format);
>>> -    mgag200_set_mode_regs(mdev, adjusted_mode);
>>> +    mgag200_set_mode_regs(mdev, adjusted_mode, 
>>> mgag200_crtc_state->set_vidrst);
>>>         if (funcs->pixpllc_atomic_update)
>>>           funcs->pixpllc_atomic_update(crtc, old_state);
>>> @@ -717,6 +719,7 @@ struct drm_crtc_state 
>>> *mgag200_crtc_atomic_duplicate_state(struct drm_crtc *crtc
>>>       new_mgag200_crtc_state->format = mgag200_crtc_state->format;
>>>       memcpy(&new_mgag200_crtc_state->pixpllc, 
>>> &mgag200_crtc_state->pixpllc,
>>>              sizeof(new_mgag200_crtc_state->pixpllc));
>>> +    new_mgag200_crtc_state->set_vidrst = 
>>> mgag200_crtc_state->set_vidrst;
>>>         return &new_mgag200_crtc_state->base;
>>>   }
>>
>> With the small nitpick.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>>
> 

