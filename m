Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37CD4F92D3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E6710F10D;
	Fri,  8 Apr 2022 10:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486810F0E6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649413390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flkOrr8kF6M5A/wkeRTmD2PylhwxLaddERYlI5YiqiE=;
 b=NhxliM/ynNeYPR1RV3WKRAUE4ywQ6y5WI1VvrOHhlWkIOwcbxWKH4uJD1UQyvP9NgEO7yT
 9A3++emdrtifjaBsgo1GRIvYuNaE6iEm7JVMuFZYVOjDTUvkzCOfpKA/phT9fAPuusamAE
 /gh2pBhsG4MroX/8wydpcSnFubFTquk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-AHus1oT4NAqhshtmxJcSeA-1; Fri, 08 Apr 2022 06:23:07 -0400
X-MC-Unique: AHus1oT4NAqhshtmxJcSeA-1
Received: by mail-ed1-f71.google.com with SMTP id
 ch1-20020a0564021bc100b0041d3ea44adaso490265edb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 03:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=flkOrr8kF6M5A/wkeRTmD2PylhwxLaddERYlI5YiqiE=;
 b=wNDbxy9BQ6TaMhKz/Fd/WuEnfdb/jIPYg3qNLeS6sE7ku3VXfHcYeBL3JfElaQ9Lme
 wVDosOXGyW2LAoR6Vcn9hjGEEC8QQxiaeIeiprh7e9fiNtAxyiqlIQb1b9OZ9b/hU5si
 hrPc1fDYu7Y2OzIGjTQEkCnjEBqrC7H2+q+X1n6QZ2+FO6+Fx2VCEzA3ucnwFKZL12wt
 qDE8iXUkSVkqDIUmBmU1DB/NLqtQoBCfUQpyucqKEK73KJsBTdfrTPYVGPYbCGfuu+IV
 7qLcz4J0Xw7izJjjDE86XnqykNRhpY+NxjQAjIYSdP/zzn7SREL2cpSUhpLy8mOOA2Le
 XQSg==
X-Gm-Message-State: AOAM531eTX5uJa4C8R1E9V1Ery5W6mjTxSQcNRsYZQQcZXPeWB459ZsK
 8M4lY7qfBNRSLfW9MzmsHlvu+Wc4uDfoxxhkHzKabWhuaHGpP791tg0xpVSB+5lUUx4pO4mboKU
 mbrtUbp11X1tn142I2cXKUb0r4PwF
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr18384837ejc.516.1649413386142; 
 Fri, 08 Apr 2022 03:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypSLDL7p+jFHhMUbji6LSsTXjDc8gC/+dAzskVH7Mwadw5BKbjkMTzRh0c78Q71yPAteYPKA==
X-Received: by 2002:a17:907:72d0:b0:6db:4788:66a9 with SMTP id
 du16-20020a17090772d000b006db478866a9mr18384813ejc.516.1649413385871; 
 Fri, 08 Apr 2022 03:23:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090679c300b006cf9ce53354sm8521286ejo.190.2022.04.08.03.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 03:23:05 -0700 (PDT)
Message-ID: <87957d0f-5452-39c1-c84a-dee447fa0a77@redhat.com>
Date: Fri, 8 Apr 2022 12:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>,
 Carsten Haitzler <raster@rasterman.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
In-Reply-To: <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/8/22 11:58, Hans de Goede wrote:
> Hi Daniel,
> 
> On 4/8/22 10:07, Daniel Vetter wrote:
>> On Thu, Apr 07, 2022 at 05:05:52PM -0400, Alex Deucher wrote:
>>> On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi Simon,
>>>>
>>>> On 4/7/22 18:51, Simon Ser wrote:
>>>>> Very nice plan! Big +1 for the overall approach.
>>>>
>>>> Thanks.
>>>>
>>>>> On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>>> The drm_connector brightness properties
>>>>>> =======================================
>>>>>>
>>>>>> bl_brightness: rw 0-int32_max property controlling the brightness setting
>>>>>> of the connected display. The actual maximum of this will be less then
>>>>>> int32_max and is given in bl_brightness_max.
>>>>>
>>>>> Do we need to split this up into two props for sw/hw state? The privacy screen
>>>>> stuff needed this, but you're pretty familiar with that. :)
>>>>
>>>> Luckily that won't be necessary, since the privacy-screen is a security
>>>> feature the firmware/embedded-controller may refuse our requests
>>>> (may temporarily lock-out changes) and/or may make changes without
>>>> us requesting them itself. Neither is really the case with the
>>>> brightness setting of displays.
>>>>
>>>>>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
>>>>>> of the display's brightness setting. This will report 0 when brightness
>>>>>> control is not available (yet).
>>>>>
>>>>> I don't think we actually need that one. Integer KMS props all have a
>>>>> range which can be fetched via drmModeGetProperty. The max can be
>>>>> exposed via this range. Example with the existing alpha prop:
>>>>>
>>>>>     "alpha": range [0, UINT16_MAX] = 65535
>>>>
>>>> Right, I already knew that, which is why I explicitly added a range
>>>> to the props already. The problem is that the range must be set
>>>> before registering the connector and when the backlight driver
>>>> only shows up (much) later during boot then we don't know the
>>>> range when registering the connector. I guess we could "patch-up"
>>>> the range later. But AFAIK that would be a bit of abuse of the
>>>> property API as the range is intended to never change, not
>>>> even after hotplug uevents. At least atm there is no infra
>>>> in the kernel to change the range later.
>>>>
>>>> Which is why I added an explicit bl_brightness_max property
>>>> of which the value gives the actual effective maximum of the
>>>> brightness.
>>
>> Uh ... I'm not a huge fan tbh. The thing is, if we allow hotplugging
>> brightness control later on then we just perpetuate the nonsense we have
>> right now, forever.
>>
>> Imo we should support two kinds of drivers:
>>
>> - drivers which are non-crap, and make sure their backlight driver is
>>   loaded before they register the drm_device (or at least the
>>   drm_connector). For those we want the drm_connector->backlight pointer
>>   to bit static over the lifetime of the connector, and then we can also
>>   set up the brightness range correctly.
> 
> The only problem is that outside of device-tree platforms where
> we can have a backlight link in a devicetree display-connector node,
> there are no non crap devices and thus no non crap drivers.
> 
>> - funny drivers which implement the glorious fallback dance which
>>   libbacklight implements currently in userspace. Imo for these drivers we
>>   should have a libbacklight_heuristics_backlight, which normalizes or
>>   whatever, and is also ways there. And then internally handles the
>>   fallback mess to the "right" backlight driver.
> 
> So this will be pretty much all of them including i915 and nouveau.
> 
> My first thoughts where the same as yours and we can mostly guarantee
> that the drm_connector->backlight pointer is static over lifetime of
> the connector. But the problem is with the backlight device-s provided
> by things like the dell-laptop, thinkpad_acpi, etc. drivers which are
> still necessary / used for backlight control on core2duo era laptops
> which are still being active used by people.
> 
> Basically atm the kernel code to determine which backlight-device
> to use (which assumes a single internal LCD panel) goes like this (1):
> 
> 1. Check cmdline-override, DMI quirks (and return their value if set)
> 2. If ACPI video extensions are not supported then expect a backlight
>    device of the dell-laptop, thinkpad_acpi, etc. type, and use that.
> 3. If the ACPI tables have been written for Windows8 or later and
>    the GPU driver offers a GPU native backlight device use that.
> 4. Use the ACPI video extensions backlight device
> 
>> We might have some gaps on acpi systems to make sure the drm driver can
>> wait for the backlight driver to show up, but that's about it.
> 
> The problem here is 2. or IOW devices which don't support the
> ACPI video extensions, these typically (always?) also don't offer
> a GPU native backlight device, instead relying on
> the embedded-controller for backlight control using some vendor
> specific firmware API to talk to the EC.
> 
> For the other cases there are indeed some gaps which I plan to close
> so that we can make sure that the backlight device will be in place
> when we register the connector.
> 
> But the old devices without ACPI video extensions case is a big
> problem and more then just some gaps" and that is a path which all
> major x86 drivers may hit.
> 
> In some cases I even expect the backlight_device to simply never
> show up when hitting 2. Either because the necessary driver is
> not enabled in the kernel or because no-one ever added support for
> the specific fw interface used on the laptop in question. But I
> do expect this to be quite rare.
> 
> For the privacy-screen case where we had a similar issue this
> was solved by in essence duplicating the detection part of the
> privacy-screen drivers inside the drm_privacy code and use
> -EPROBE_DEFER to wait for the privacy-screen driver to load.
> 
> But in this case that is not really feasible IMHO because:
> 
> [hans@shalem linux]$ ack -l backlight_device_register drivers/platform/x86
> drivers/platform/x86/toshiba_acpi.c
> drivers/platform/x86/intel/oaktrail.c
> drivers/platform/x86/dell/dell-laptop.c
> drivers/platform/x86/msi-laptop.c
> drivers/platform/x86/panasonic-laptop.c
> drivers/platform/x86/ideapad-laptop.c
> drivers/platform/x86/sony-laptop.c
> drivers/platform/x86/thinkpad_acpi.c
> drivers/platform/x86/acer-wmi.c
> drivers/platform/x86/samsung-q10.c
> drivers/platform/x86/asus-wmi.c
> drivers/platform/x86/apple-gmux.c
> drivers/platform/x86/nvidia-wmi-ec-backlight.c
> drivers/platform/x86/msi-wmi.c
> drivers/platform/x86/asus-laptop.c
> drivers/platform/x86/classmate-laptop.c
> drivers/platform/x86/eeepc-laptop.c
> drivers/platform/x86/fujitsu-laptop.c
> drivers/platform/x86/samsung-laptop.c
> drivers/platform/x86/compal-laptop.c
> [hans@shalem linux]$ ack -l backlight_device_register drivers/platform/x86 | wc -l
> 20
> 
> Duplicating 20 wildly different ACPI/WMI backlight detection
> routines is a bit much; and also something which I cannot test
> easily and doing EPROBE_DEFER like behavior will require all
> of these to also be available in the initrd.
> 
> So IMHO at least for devices relying on these it is best to allow
> having the bl_brightness* properties be presend on the internal
> LCD connector at registration time with a hint that they are
> not functional and then send an uevent when they become functional.
> 
> I really see no other way to deal with these (old) devices.

Oh and I just realized another important reason why we really
need to the support for this to be dynamic.

The reason why I've started looking into this (again) is because
Sebastian Wick has been looking into HDR support and he inquired
about support the brightness of external monitors through DDC/CI
and while we were discussing that a series was posted to add
DDC/CI support to /sys/class/backlight, which I nacked because
that would make the backlight-dev <-> connector mapping problem
a lot bigger:
https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/

But there clearly is demand for offering brightness control over
DDC/CI and the intend of this proposal is to also cover that.

But external devices can be plugged/unplugged and then DDC/CI
support may come and go and/or if a different monitor gets
plugged in the range may change. So we need support for brightness
control going away (brightness_max becomes 0) and for the range
changing on the fly regardless of the whole internal panel
discussion.

At least we must support this to support DDC/CI which at least
for me is an explicit goal here.

Regards,

Hans


> 1) For now I, intend to extend this with detection of Apple GMUX and
>    NVIDIA_WMI_EC_BACKLIGHT support

