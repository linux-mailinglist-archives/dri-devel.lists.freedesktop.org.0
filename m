Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736A576ED3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB710E4C8;
	Sat, 16 Jul 2022 14:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4038E8919F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657901076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sp/UGNgi/73pvwSOWnPEk60LYHAolqV1dOxRpJbQKug=;
 b=IiU1mjfnUGBaPE9M9hJwmcP8qQzBR2BQ7hb3NAXtiQyzbpGzRa1hVchFS0j4Rcc/bdjFJU
 QTfzQwpGwIpDXDTV700HAUSpf4idRCPu21D7YeTtjs4XUkNgZ30Yt1l122wAaypRnq3lfM
 ZivsGpMONABxo6ecPSGatRjhYXA0UJo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-MxHEVgX5MyaIbHrDSNjZqQ-1; Fri, 15 Jul 2022 12:04:35 -0400
X-MC-Unique: MxHEVgX5MyaIbHrDSNjZqQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso3690237edd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 09:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sp/UGNgi/73pvwSOWnPEk60LYHAolqV1dOxRpJbQKug=;
 b=ncil4/biE5bPSCS+CcfObkEL6C2mUO+NknnS1Wskl0mU4FoDFHIgdss1G3QOVidP4r
 l7rV8NMHNUaqAFdWNkmQfzd7jIV/LA65k2o7upmumJZ7UbuZtitzNtCWfKhQZIa1YPMy
 ZxGAPy3UcTuzjDStJtR+SbGmNgd15UnlY2yvDEwjeCrTewHhN8wV3NHveVOYiaKPJE8+
 GpacEjuKqK+b0mDUzlpiEUsSvD3okg1x7PYr2F3Bnm99JH+dfUgjoZHTnm8EBrTgG+qH
 1cS+VvAq+srXvMcLOqevdkILmEVbmoRvhTVwG1aYbEA98fhd8IsSl63B1VqCsJJDQrre
 ZuVA==
X-Gm-Message-State: AJIora+m3Rpv5v6452hkDSLl+lOOl/Fg8hpeMf2fm3MBW3JZwXTHlQO0
 B/FclF6O45XEU859kvdt+QlhCOsRIUE9H7s0Fl+kAVvX4fNtYjsEW4nrYtAtX8oUaiMwduiVcyi
 PAmUKkBwC5HNSM1Z4tS6W1yq4JEGt
X-Received: by 2002:a05:6402:48c:b0:43a:8bc7:f440 with SMTP id
 k12-20020a056402048c00b0043a8bc7f440mr19772636edv.8.1657901073484; 
 Fri, 15 Jul 2022 09:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sjkMDeAFnOqp5ui6Lqjz/acKZQJMsuG0q68f+Y5L+ry3ktYy6aNCAr4JLTEzr7HBBN7TsGNw==
X-Received: by 2002:a05:6402:48c:b0:43a:8bc7:f440 with SMTP id
 k12-20020a056402048c00b0043a8bc7f440mr19772569edv.8.1657901073101; 
 Fri, 15 Jul 2022 09:04:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6?
 (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7cb4d000000b0043a5004e714sm3050479edt.64.2022.07.15.09.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 09:04:32 -0700 (PDT)
Message-ID: <cbaa803b-9d06-58c2-a03e-66471ebcf43e@redhat.com>
Date: Fri, 15 Jul 2022 18:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 16/29] ACPI: video: Add Nvidia WMI EC brightness
 control detection
To: Daniel Dadap <ddadap@nvidia.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-17-hdegoede@redhat.com>
 <8cde70e6-1115-9b7f-d550-52b9e3623c85@nvidia.com>
 <f68353f9-fb4c-b5fe-f7f8-69b97865c720@redhat.com>
 <3DA6A58C-E24D-45AD-8C82-3D8905D0C690@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3DA6A58C-E24D-45AD-8C82-3D8905D0C690@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Len Brown <lenb@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/15/22 17:32, Daniel Dadap wrote:
> 
> 
>> On Jul 15, 2022, at 06:59, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> ﻿Hi Daniel,
>>
>>> On 7/12/22 22:13, Daniel Dadap wrote:
>>> Thanks, Hans:
>>>
>>>> On 7/12/22 14:38, Hans de Goede wrote:
>>>> On some new laptop designs a new Nvidia specific WMI interface is present
>>>> which gives info about panel brightness control and may allow controlling
>>>> the brightness through this interface when the embedded controller is used
>>>> for brightness control.
>>>>
>>>> When this WMI interface is present and indicates that the EC is used,
>>>> then this interface should be used for brightness control.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>   drivers/acpi/Kconfig           |  1 +
>>>>   drivers/acpi/video_detect.c    | 35 ++++++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/gma500/Kconfig |  2 ++
>>>>   drivers/gpu/drm/i915/Kconfig   |  2 ++
>>>>   include/acpi/video.h           |  1 +
>>>>   5 files changed, 41 insertions(+)
>>>>
>>>> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>>>> index 1e34f846508f..c372385cfc3f 100644
>>>> --- a/drivers/acpi/Kconfig
>>>> +++ b/drivers/acpi/Kconfig
>>>> @@ -212,6 +212,7 @@ config ACPI_VIDEO
>>>>       tristate "Video"
>>>>       depends on X86 && BACKLIGHT_CLASS_DEVICE
>>>>       depends on INPUT
>>>> +    depends on ACPI_WMI
>>>>       select THERMAL
>>>>       help
>>>>         This driver implements the ACPI Extensions For Display Adapters
>>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>>> index 8c2863403040..7b89dc9a04a2 100644
>>>> --- a/drivers/acpi/video_detect.c
>>>> +++ b/drivers/acpi/video_detect.c
>>>> @@ -75,6 +75,35 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
>>>>       return AE_OK;
>>>>   }
>>>>   +#define WMI_BRIGHTNESS_METHOD_SOURCE            2
>>>> +#define WMI_BRIGHTNESS_MODE_GET                0
>>>> +#define WMI_BRIGHTNESS_SOURCE_EC            2
>>>> +
>>>> +struct wmi_brightness_args {
>>>> +    u32 mode;
>>>> +    u32 val;
>>>> +    u32 ret;
>>>> +    u32 ignored[3];
>>>> +};
>>>> +
>>>> +static bool nvidia_wmi_ec_supported(void)
>>>> +{
>>>> +    struct wmi_brightness_args args = {
>>>> +        .mode = WMI_BRIGHTNESS_MODE_GET,
>>>> +        .val = 0,
>>>> +        .ret = 0,
>>>> +    };
>>>> +    struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>>>> +    acpi_status status;
>>>> +
>>>> +    status = wmi_evaluate_method("603E9613-EF25-4338-A3D0-C46177516DB7", 0,
>>>> +                     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
>>>> +    if (ACPI_FAILURE(status))
>>>> +        return false;
>>>> +
>>>> +    return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
>>>> +}
>>>> +
>>>
>>>
>>> The code duplication here with nvidia-wmi-ec-backlight.c is a little unfortunate. Can we move the constants, struct definition, and WMI GUID from that file to a header file that's used both by the EC backlight driver and the ACPI video driver?
>>
>> Yes that is a good idea. I suggest using include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>> to move the shared definitions there.
>>
>> If you can submit 2 patches on top of this series:
>>
>> 1. Moving the definitions from drivers/platform/x86/nvidia-wmi-ec-backlight.c to
>>   include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>>
>> 2. Switching the code from this patch over to using the new nvidia-wmi-ec-backlight.h
>>
>> Then for the next version I'll add patch 1. to the series and squash patch 2.
>> into this one.
>>
>>> I was thinking it might be nice to add a wrapper around wmi_brightness_notify() in nvidia-wmi-ec-backlight.c that does this source == WMI_BRIGHTNESS_SOURCE_EC test, and then export it so that it can be called both here and in the EC backlight driver's probe routine, but then I guess that would make video.ko depend on nvidia-wmi-ec-backlight.ko, which seems wrong. It also seems wrong to implement the WMI plumbing in the ACPI video driver, and export it so that the EC backlight driver can use it, so I guess I can live with the duplication of the relatively simple WMI stuff here, it would just be nice to not have to define all of the API constants, structure, and GUID twice.
>>
>> Agreed.
>>
>>>
>>>
>>>>   /* Force to use vendor driver when the ACPI device is known to be
>>>>    * buggy */
>>>>   static int video_detect_force_vendor(const struct dmi_system_id *d)
>>>> @@ -518,6 +547,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>>>>   static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>   {
>>>>       static DEFINE_MUTEX(init_mutex);
>>>> +    static bool nvidia_wmi_ec_present;
>>>>       static bool native_available;
>>>>       static bool init_done;
>>>>       static long video_caps;
>>>> @@ -530,6 +560,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>           acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>>>>                       ACPI_UINT32_MAX, find_video, NULL,
>>>>                       &video_caps, NULL);
>>>> +        nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
>>>>           init_done = true;
>>>>       }
>>>>       if (native)
>>>> @@ -547,6 +578,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>>>>       if (acpi_backlight_dmi != acpi_backlight_undef)
>>>>           return acpi_backlight_dmi;
>>>>   +    /* Special cases such as nvidia_wmi_ec and apple gmux. */
>>>> +    if (nvidia_wmi_ec_present)
>>>> +        return acpi_backlight_nvidia_wmi_ec;
>>>
>>>
>>> Should there also be a change to the EC backlight driver to call acpi_video_get_backlight_type() and make sure we get acpi_backlight_nvidia_wmi_ec? I don't see such a change in this patch series; I could implement it (and test it) against your patch if there's some reason you didn't do so with the current patchset.
>>
>> I was thinking about this myself too and I decided it was not necessary since
>> acpi_video_get_backlight_type() will always return acpi_backlight_nvidia_wmi_ec.
>>
>> But thinking more about this, that is not true, a user might try to force
>> using a different backlight firmware interface by e.g. adding:
>> acpi_backlight=video on the kernel commandline.
>>
>> So yes a patch adding something like this:
>>
>>    if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
>>        return -ENODEV;
>>
>> to the EC backlight driver would be very welcome.
>>
>>>
>>>
>>>> +
>>>>       /* On systems with ACPI video use either native or ACPI video. */
>>>>       if (video_caps & ACPI_VIDEO_BACKLIGHT) {
>>>>           /*
>>>> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
>>>> index 0cff20265f97..807b989e3c77 100644
>>>> --- a/drivers/gpu/drm/gma500/Kconfig
>>>> +++ b/drivers/gpu/drm/gma500/Kconfig
>>>> @@ -7,6 +7,8 @@ config DRM_GMA500
>>>>       select ACPI_VIDEO if ACPI
>>>>       select BACKLIGHT_CLASS_DEVICE if ACPI
>>>>       select INPUT if ACPI
>>>> +    select X86_PLATFORM_DEVICES if ACPI
>>>> +    select ACPI_WMI if ACPI
>>>
>>>
>>> I'm not sure I understand why the Intel DRM drivers pick up the additional platform/x86 and WMI dependencies here. ACPI_VIDEO already depends on these, doesn't it?
>>
>> It does.
>>
>>> If Kconfig doesn't otherwise automatically pull in an option's dependencies when selecting that option
>>
>> Right that is the reason why this is done, for select the Kconfig block must also select all deps
>>
>>> then shouldn't Nouveau's Kconfig get updated as well?
>>> It selects ACPI_VIDEO in some configuration cases.
>>
>> nouveau's Kconfig block already selects ACPI_WMI:
>>
>> config DRM_NOUVEAU
>>    tristate "Nouveau (NVIDIA) cards"
>>    ...
>>    select X86_PLATFORM_DEVICES if ACPI && X86
>>    select ACPI_WMI if ACPI && X86
>>    ...
>>    select ACPI_VIDEO if ACPI && X86
>>
>> That is why this patch does not add this.
>>
>>> (It looks like amdgpu doesn't currently select ACPI_VIDEO, maybe because it doesn't depend on it the way the Intel drivers do: there are several AMD+NVIDIA iGPU/dGPU designs out there which use this backlight interface.)
>>
>> Correct, but with this series amdgpu/radeon also start using ACPI_VIDEO
>> functions so these patches:
>>
>> https://patchwork.freedesktop.org/patch/493650/
>> https://patchwork.freedesktop.org/patch/493653/
>>
>> Add the necessary selects and I cheated a bit and also made
>> them select ACPI_WMI already even though that is only
>> necessary after this patch (which comes later in the series).
>>
>> I hope this answers al your questions...
>>
> 
> Yes, thank you. I don’t have to work with Kconfig much, but that reasoning lined up with my best guess. Sorry for not looking at the other patches in the series, or at Nouveau’s Kconfig more closely.
> 
> I will work on and test the three patches we discussed above. Would you prefer if I sent them and set In-reply-to a message in this thread, or as a separate message with no In-reply-to?

I have no real preference. Whatever is easiest for you.

Regards,

Hans




>>>>       help
>>>>         Say yes for an experimental 2D KMS framebuffer driver for the
>>>>         Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
>>>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>>>> index 7ae3b7d67fcf..3efce05d7b57 100644
>>>> --- a/drivers/gpu/drm/i915/Kconfig
>>>> +++ b/drivers/gpu/drm/i915/Kconfig
>>>> @@ -23,6 +23,8 @@ config DRM_I915
>>>>       # but for select to work, need to select ACPI_VIDEO's dependencies, ick
>>>>       select BACKLIGHT_CLASS_DEVICE if ACPI
>>>>       select INPUT if ACPI
>>>> +    select X86_PLATFORM_DEVICES if ACPI
>>>> +    select ACPI_WMI if ACPI
>>>>       select ACPI_VIDEO if ACPI
>>>>       select ACPI_BUTTON if ACPI
>>>>       select SYNC_FILE
>>>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>>>> index 0625806d3bbd..91578e77ac4e 100644
>>>> --- a/include/acpi/video.h
>>>> +++ b/include/acpi/video.h
>>>> @@ -48,6 +48,7 @@ enum acpi_backlight_type {
>>>>       acpi_backlight_video,
>>>>       acpi_backlight_vendor,
>>>>       acpi_backlight_native,
>>>> +    acpi_backlight_nvidia_wmi_ec,
>>>>   };
>>>>     #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>>>
>>

