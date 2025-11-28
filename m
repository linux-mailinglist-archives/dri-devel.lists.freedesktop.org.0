Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAE3C92716
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 16:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919710E171;
	Fri, 28 Nov 2025 15:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kQ64kOL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F8210E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=txi9KxxsEC7i013PJh4XXoPLaCuOXW7loOqoQFFWv+M=; b=kQ64kOL8YJUYKEVYcFe+H2tnSF
 I6NDaPTwzTib/b32KrHg/n5Yh5Z9z12Vn5DDYNdRPeYnKttkfijsVVs/xlMSxNwLOW0/pOOnP05X4
 7pfLZIwdyCXwVAtqo9aUD8hVYFn+L6mf7TpvyBU9uAOFAscG59gBc1meV+Zpw2+HiiT0EPM36vuQl
 RL+n/M4KpzTi8twJJ/sp2E1r/0tOgkZOV9z+RwZW15m0ia/Lr6Xkj92x7CxU5NBJtAA7ROgNfnVD6
 iN+1trHZV87MVeQgANTfUkZj9y6+1KM7EYCkPaUkcrvB1RHwpuz2JMUSHwDHC2IW4IpimrA4lF/MT
 UKU8OpYA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vP0If-006V04-O7; Fri, 28 Nov 2025 16:22:21 +0100
Message-ID: <2452a612-9e93-4616-9dc2-fb03c4ab67f4@igalia.com>
Date: Fri, 28 Nov 2025 15:22:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Report invalid or unsupported panic modes
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Javier Martinez Canillas <javierm@redhat.com>
References: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
 <d695dca7-fde1-40f6-8d1b-5aca90eb98f4@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <d695dca7-fde1-40f6-8d1b-5aca90eb98f4@redhat.com>
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


On 27/11/2025 09:52, Jocelyn Falempe wrote:
> On 27/11/2025 10:03, Tvrtko Ursulin wrote:
>> Currently the user can write anything into the drm.panic_screen modparam,
>> either at runtime via sysfs, or as a kernel boot time argument. Invalid
>> strings will be silently accepted and ignored at use time by 
>> defaulting to
>> the 'user' panic mode.
>>
>> Let instead add some validation in order to have immediate feedback when
>> something has been mistyped, or not compiled in.
>>
>> For example during kernel boot:
>>
>>   Booting kernel: `bsod' invalid for parameter `drm.panic_screen'
>>
>> Or at runtime:
>>
>>   # echo -n bsod > /sys/module/drm/parameters/panic_screen
>>   -bash: echo: write error: Invalid argument
>>
>> Change of behavior is that when invalid mode is attempted to be
>> configured, currently the code will default to the 'user' mode, while 
>> with
>> this change the code will ignore it, and default to the mode set at 
>> kernel
>> build time via CONFIG_DRM_PANIC_SCREEN.
>>
>> While at it lets also fix the module parameter description to include all
>> compiled in modes.
> 
> Thanks, I agree that's better than the current implementation.
> 
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Thank you both, I have pushed it to drm-misc-next.

Btw I briefly thought about how we could change kconfig away from free 
form text to a list of choices but I did not have time to think about 
kconfig backward compatibility.

Regards,

Tvrtko
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Jocelyn Falempe <jfalempe@redhat.com>
>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 77 ++++++++++++++++++++++++++++++-------
>>   1 file changed, 63 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index d4b6ea42db0f..f42be7f1d8c2 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -39,12 +39,6 @@ MODULE_AUTHOR("Jocelyn Falempe");
>>   MODULE_DESCRIPTION("DRM panic handler");
>>   MODULE_LICENSE("GPL");
>> -static char drm_panic_screen[16] = CONFIG_DRM_PANIC_SCREEN;
>> -module_param_string(panic_screen, drm_panic_screen, 
>> sizeof(drm_panic_screen), 0644);
>> -MODULE_PARM_DESC(panic_screen,
>> -         "Choose what will be displayed by drm_panic, 'user' or 
>> 'kmsg' [default="
>> -         CONFIG_DRM_PANIC_SCREEN "]");
>> -
>>   /**
>>    * DOC: overview
>>    *
>> @@ -813,15 +807,60 @@ static void draw_panic_static_qr_code(struct 
>> drm_scanout_buffer *sb)
>>           draw_panic_static_user(sb);
>>   }
>>   #else
>> -static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
>> -{
>> -    draw_panic_static_user(sb);
>> -}
>> -
>>   static void drm_panic_qr_init(void) {};
>>   static void drm_panic_qr_exit(void) {};
>>   #endif
>> +enum drm_panic_type {
>> +    DRM_PANIC_TYPE_KMSG,
>> +    DRM_PANIC_TYPE_USER,
>> +    DRM_PANIC_TYPE_QR,
>> +};
>> +
>> +static enum drm_panic_type drm_panic_type = -1;
>> +
>> +static const char *drm_panic_type_map[] = {
>> +    [DRM_PANIC_TYPE_KMSG] = "kmsg",
>> +    [DRM_PANIC_TYPE_USER] = "user",
>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>> +    [DRM_PANIC_TYPE_QR] = "qr",
>> +#endif
>> +};
>> +
>> +static int drm_panic_type_set(const char *val, const struct 
>> kernel_param *kp)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(drm_panic_type_map); i++) {
>> +        if (!strcmp(val, drm_panic_type_map[i])) {
>> +            drm_panic_type = i;
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +static int drm_panic_type_get(char *buffer, const struct kernel_param 
>> *kp)
>> +{
>> +    return scnprintf(buffer, PAGE_SIZE, "%s\n",
>> +             drm_panic_type_map[drm_panic_type]);
>> +}
>> +
>> +static const struct kernel_param_ops drm_panic_ops = {
>> +    .set = drm_panic_type_set,
>> +    .get = drm_panic_type_get,
>> +};
>> +
>> +module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
>> +MODULE_PARM_DESC(panic_screen,
>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>> +         "Choose what will be displayed by drm_panic, 'user', 'kmsg' 
>> or 'qr' [default="
>> +#else
>> +         "Choose what will be displayed by drm_panic, 'user' or 
>> 'kmsg' [default="
>> +#endif
>> +         CONFIG_DRM_PANIC_SCREEN "]");
>> +
>>   /*
>>    * drm_panic_is_format_supported()
>>    * @format: a fourcc color code
>> @@ -838,11 +877,19 @@ static bool drm_panic_is_format_supported(const 
>> struct drm_format_info *format)
>>   static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>>   {
>> -    if (!strcmp(drm_panic_screen, "kmsg")) {
>> +    switch (drm_panic_type) {
>> +    case DRM_PANIC_TYPE_KMSG:
>>           draw_panic_static_kmsg(sb);
>> -    } else if (!strcmp(drm_panic_screen, "qr_code")) {
>> +        break;
>> +
>> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>> +    case DRM_PANIC_TYPE_QR:
>>           draw_panic_static_qr_code(sb);
>> -    } else {
>> +        break;
>> +#endif
>> +
>> +    case DRM_PANIC_TYPE_USER:
>> +    default:
>>           draw_panic_static_user(sb);
>>       }
>>   }
>> @@ -1025,6 +1072,8 @@ void drm_panic_unregister(struct drm_device *dev)
>>    */
>>   void __init drm_panic_init(void)
>>   {
>> +    if (drm_panic_type == -1)
>> +        drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
>>       drm_panic_qr_init();
>>   }
> 
