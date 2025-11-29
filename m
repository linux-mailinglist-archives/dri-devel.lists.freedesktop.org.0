Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF940C93D83
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 13:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6010E038;
	Sat, 29 Nov 2025 12:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IocKN1wV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8925F10E038
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764419721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojP16hLN0VH8JiJ7FoJX6xM5qIUykBY/yYQVVo8MY4c=;
 b=IocKN1wVTeOIY+/+rHCzJfbC1b32IXgmQ4BQot0TGG6eaNLgjp/r55WtqBDt2uRTDYb98t
 sIkX6Wqwy8z2x/C4RvgmTjgnGVBGhmZv6rm55Eqz5Uit/kf9Vh+4wgzqLLA7SIyLGc/GTQ
 OHzXZKF4q+a0BA7/Q7CD4fggsFTyLyo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-596KtLUgOyKcnyNORYq0qg-1; Sat, 29 Nov 2025 07:35:19 -0500
X-MC-Unique: 596KtLUgOyKcnyNORYq0qg-1
X-Mimecast-MFC-AGG-ID: 596KtLUgOyKcnyNORYq0qg_1764419718
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4775f51ce36so20895085e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 04:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764419718; x=1765024518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojP16hLN0VH8JiJ7FoJX6xM5qIUykBY/yYQVVo8MY4c=;
 b=e5/xfo4izx0I2wmD3n1qZgOGVSDxZqs7ZFC1fbOh2lC5SyTMGAQ/7Gj4EXxqYLgGsi
 GQ9q/GL5qJjSiShLRtOzyt9IxtXx+73uuhZWjZurjUhbnIvA0iT25yHE4P7ElR2rvgWR
 2jEqcZDV9FwYJ0orZQdjlhiaSIoZMMgUDA8LX6n3UwdGz4pjZbYXLqJIV2wC+yUXNLBp
 yonIUBGPWXyQCLIifQHMGFxIk4ZqM0IA1bCD530rkHwHuy3qSw3Ummyf8r7Pfi3SoSuB
 JRuIIuESokXY1KI1oqUXT1Bswq5RKtn8KsYsybswgLF0kNfYvLvvO8MdjbXI5WJP42pr
 RzsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrXDMFuWbpY5vhcMfJG1Vw/0rOb8yQfHMTkECxw2ulzvX0VRKqIost7JLd1XxFQ8mJAHJl3o+c2/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOGgwJuGLK9mjzRKnr41rvYrj4wKARUF1dpLyWIPSyoMHmHRc9
 bi4EqqVaqSkK5AOshAWOC5J1VghWS0oIbn4vFch79GCutrxJ9OPCkZiMEq8kli2MG8Bmd+i+2nI
 oCo3s6YYjccW5ONT956bbk26sbOEPC9ZkgHtp+x5xAS0lZ5IgYKY9llrrVHqhC10ePehtTA==
X-Gm-Gg: ASbGnctityeqndeOq9FkJnlM+3vdI9ZKyAOOayEr37dXTuPr4yWSb/g47CljhuXkO3I
 hFr2s4XPyPL2jYzLOhShgIwcYOrkOOeVi9JKpv27BDAGSNN16qkicnBWjBmRYCU0gkUr7RbOFCO
 yzMqGUv876UQWmLz71PqhVwIKOBfbPNhdIz4i/jo0FzQ1GyqEbKujmQ8Jc8VLWntDeXytO1iCjm
 il1Hp5+wBOlRh7F5TXIFyMs4/3mqy/Rye/2qd+9qI1ph198nVIfQ5s2zwRjcdBbhReBh7fveQ3M
 8HSgfLWpedTq1ggo8jGWB+mL/kiSEa9EncUS4qDClOlrvq4ICa0y4HBOsK+eF2LRMJ6uFxoX98g
 TgkxRHAXV10b/KK3MrGT24lXEsacuhdK6bhFJbylxa27vrdbBmQ==
X-Received: by 2002:a05:600c:c490:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-477c11325c2mr338327555e9.31.1764419718459; 
 Sat, 29 Nov 2025 04:35:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpLzmZPkTZjJPqPANzORzlFH9p4cn2f7t1zD5te9u81ctUh6nb2z/MCmAFemDMW6vq4f8RVw==
X-Received: by 2002:a05:600c:c490:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-477c11325c2mr338327325e9.31.1764419718068; 
 Sat, 29 Nov 2025 04:35:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adc8bc7sm213536205e9.1.2025.11.29.04.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Nov 2025 04:35:17 -0800 (PST)
Message-ID: <954b2812-9dd0-4c5a-bad0-b79a6a38b9ce@redhat.com>
Date: Sat, 29 Nov 2025 13:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Report invalid or unsupported panic modes
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Javier Martinez Canillas <javierm@redhat.com>
References: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
 <baca752c83558cac83be9008e1da072588f6997d@intel.com>
 <8fa4139e-351d-40ea-abb8-45f0fa91732c@igalia.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <8fa4139e-351d-40ea-abb8-45f0fa91732c@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fPHafUo78VUht7YCs0cORDiM5RUP5FVyhAP3l_MdmU8_1764419718
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

On 29/11/2025 11:50, Tvrtko Ursulin wrote:
> 
> On 27/11/2025 12:23, Jani Nikula wrote:
>> On Thu, 27 Nov 2025, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>> Currently the user can write anything into the drm.panic_screen 
>>> modparam,
>>> either at runtime via sysfs, or as a kernel boot time argument. Invalid
>>> strings will be silently accepted and ignored at use time by 
>>> defaulting to
>>> the 'user' panic mode.
>>>
>>> Let instead add some validation in order to have immediate feedback when
>>> something has been mistyped, or not compiled in.
>>>
>>> For example during kernel boot:
>>>
>>>   Booting kernel: `bsod' invalid for parameter `drm.panic_screen'
>>>
>>> Or at runtime:
>>>
>>>   # echo -n bsod > /sys/module/drm/parameters/panic_screen
>>>   -bash: echo: write error: Invalid argument
>>>
>>> Change of behavior is that when invalid mode is attempted to be
>>> configured, currently the code will default to the 'user' mode, while 
>>> with
>>> this change the code will ignore it, and default to the mode set at 
>>> kernel
>>> build time via CONFIG_DRM_PANIC_SCREEN.
>>>
>>> While at it lets also fix the module parameter description to include 
>>> all
>>> compiled in modes.
>>
>> I've tried to add a convenient way to use enum module parameters on two
>> occasions [1][2] but it went nowhere. Maybe I should've pushed harder.
>>
>> In a perfect world we'd use device specific parameters, here too, but in
>> the imperfect world we still use module parameters. And use cases like
>> this would be a soooo nice with that.
>>
>> Want to take over and fight the fight? ;)
> 
> You are not selling it very well. :))
> 
> If we can find enough users where new infra would consolidate them it 
> might be easier to sell. Anything else you know of apart from 
> drm.panic_screen?
> 
> Maybe drm_client_lib.active looks as a candidate? But we would need 
> something outside DRM ideally too.

Maybe the zswap compressor can be a good candidate:
https://elixir.bootlin.com/linux/v6.17.9/source/mm/zswap.c#L105
https://elixir.bootlin.com/linux/v6.17.9/source/mm/Kconfig#L117

I've taken this as an example to write CONFIG_DRM_PANIC_SCREEN.

Regards,

-- 

Jocelyn

> 
> Regards,
> 
> Tvrtko
> 
>>
>> [1] https://lore.kernel.org/r/20190611141701.7432-1-jani.nikula@intel.com
>> [2] https://lore.kernel.org/r/20220414123033.654198-1- 
>> jani.nikula@intel.com
>>
>>
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_panic.c | 77 ++++++++++++++++++++++++++++++-------
>>>   1 file changed, 63 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>> index d4b6ea42db0f..f42be7f1d8c2 100644
>>> --- a/drivers/gpu/drm/drm_panic.c
>>> +++ b/drivers/gpu/drm/drm_panic.c
>>> @@ -39,12 +39,6 @@ MODULE_AUTHOR("Jocelyn Falempe");
>>>   MODULE_DESCRIPTION("DRM panic handler");
>>>   MODULE_LICENSE("GPL");
>>> -static char drm_panic_screen[16] = CONFIG_DRM_PANIC_SCREEN;
>>> -module_param_string(panic_screen, drm_panic_screen, 
>>> sizeof(drm_panic_screen), 0644);
>>> -MODULE_PARM_DESC(panic_screen,
>>> -         "Choose what will be displayed by drm_panic, 'user' or 
>>> 'kmsg' [default="
>>> -         CONFIG_DRM_PANIC_SCREEN "]");
>>> -
>>>   /**
>>>    * DOC: overview
>>>    *
>>> @@ -813,15 +807,60 @@ static void draw_panic_static_qr_code(struct 
>>> drm_scanout_buffer *sb)
>>>           draw_panic_static_user(sb);
>>>   }
>>>   #else
>>> -static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
>>> -{
>>> -    draw_panic_static_user(sb);
>>> -}
>>> -
>>>   static void drm_panic_qr_init(void) {};
>>>   static void drm_panic_qr_exit(void) {};
>>>   #endif
>>> +enum drm_panic_type {
>>> +    DRM_PANIC_TYPE_KMSG,
>>> +    DRM_PANIC_TYPE_USER,
>>> +    DRM_PANIC_TYPE_QR,
>>> +};
>>> +
>>> +static enum drm_panic_type drm_panic_type = -1;
>>> +
>>> +static const char *drm_panic_type_map[] = {
>>> +    [DRM_PANIC_TYPE_KMSG] = "kmsg",
>>> +    [DRM_PANIC_TYPE_USER] = "user",
>>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>>> +    [DRM_PANIC_TYPE_QR] = "qr",
>>> +#endif
>>> +};
>>> +
>>> +static int drm_panic_type_set(const char *val, const struct 
>>> kernel_param *kp)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(drm_panic_type_map); i++) {
>>> +        if (!strcmp(val, drm_panic_type_map[i])) {
>>> +            drm_panic_type = i;
>>> +            return 0;
>>> +        }
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +static int drm_panic_type_get(char *buffer, const struct 
>>> kernel_param *kp)
>>> +{
>>> +    return scnprintf(buffer, PAGE_SIZE, "%s\n",
>>> +             drm_panic_type_map[drm_panic_type]);
>>> +}
>>> +
>>> +static const struct kernel_param_ops drm_panic_ops = {
>>> +    .set = drm_panic_type_set,
>>> +    .get = drm_panic_type_get,
>>> +};
>>> +
>>> +module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
>>> +MODULE_PARM_DESC(panic_screen,
>>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>>> +         "Choose what will be displayed by drm_panic, 'user', 'kmsg' 
>>> or 'qr' [default="
>>> +#else
>>> +         "Choose what will be displayed by drm_panic, 'user' or 
>>> 'kmsg' [default="
>>> +#endif
>>> +         CONFIG_DRM_PANIC_SCREEN "]");
>>> +
>>>   /*
>>>    * drm_panic_is_format_supported()
>>>    * @format: a fourcc color code
>>> @@ -838,11 +877,19 @@ static bool drm_panic_is_format_supported(const 
>>> struct drm_format_info *format)
>>>   static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>>>   {
>>> -    if (!strcmp(drm_panic_screen, "kmsg")) {
>>> +    switch (drm_panic_type) {
>>> +    case DRM_PANIC_TYPE_KMSG:
>>>           draw_panic_static_kmsg(sb);
>>> -    } else if (!strcmp(drm_panic_screen, "qr_code")) {
>>> +        break;
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>>> +    case DRM_PANIC_TYPE_QR:
>>>           draw_panic_static_qr_code(sb);
>>> -    } else {
>>> +        break;
>>> +#endif
>>> +
>>> +    case DRM_PANIC_TYPE_USER:
>>> +    default:
>>>           draw_panic_static_user(sb);
>>>       }
>>>   }
>>> @@ -1025,6 +1072,8 @@ void drm_panic_unregister(struct drm_device *dev)
>>>    */
>>>   void __init drm_panic_init(void)
>>>   {
>>> +    if (drm_panic_type == -1)
>>> +        drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
>>>       drm_panic_qr_init();
>>>   }
>>
> 


