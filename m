Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4A4DCB9A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 17:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE29A10E070;
	Thu, 17 Mar 2022 16:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C045D10E070
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 16:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647535332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzE7s7gOfkshbPUt8+wGRbjesHGSP8ZQ2nmEFpwkfrc=;
 b=PWSpzilghFol2H7xYdZ+S4MmYkgo/XCftHA2mLgwpV+Zbl4oFfvxqqsedT902wiIN1N0sI
 a61MbOMcagxnWSHkGifv9fZQzkscsemIlrUsN8RCmagRhYa1emAbj5M+8Eh4fgqkKZ74MH
 bTUVebKPDR+jZ2pBG8biPOTm/ZMKLCk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-IJRzvRq2Ma6XWaMasZWCZQ-1; Thu, 17 Mar 2022 12:42:09 -0400
X-MC-Unique: IJRzvRq2Ma6XWaMasZWCZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso3458638edh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tzE7s7gOfkshbPUt8+wGRbjesHGSP8ZQ2nmEFpwkfrc=;
 b=p6mdSHn1IYL8KW9AFELQ4EKRrAWFSaRIgdwKt+8BGjsZov2K7vI+yPWEmCmC9A8h82
 VGzWkM5qOiq1rqcryFVLKPWcv6i62cPmtVW2PEoZJXfZtxvTIdvwSKu3ufv5dcMVtn/z
 9c3Y/ei1TcRnjnzBPiiqfPu0PhilPis9pzgVC2Lfb0IwiTulrsWruytcXpTGbC7ucAXD
 hGuI2ZckwqteIxrb6GTOWkr7yRQIp6VSB7Xl62EE4gB1wfFS5nos9VSiQkS7D6sY4xEa
 n8f8h/3HHntb1GBW1oyVK3f+KEyF1/u4//K01ujEtf2tT4KadRhndsvPCIuud4xh9sSm
 zjBQ==
X-Gm-Message-State: AOAM5309dsh3dVHMOsCrYEzKsF1LNCkD32BSgoVjASmMc9FcIuCpUEYi
 sFBz1+1r6jjkMhL5V8qCc1KI6K7/qpAyozhZPLEFT0QyQg6uI8CQrZIs34S3Bjk0MNoflR2iuyP
 XsKRQvXRLhbDUTw3emZjK4eG45lXp
X-Received: by 2002:a17:907:3d94:b0:6df:8791:135f with SMTP id
 he20-20020a1709073d9400b006df8791135fmr5111015ejc.205.1647535327641; 
 Thu, 17 Mar 2022 09:42:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4yObwGMTN4Y76cFHy392bZX/keTAQtZwIuUHJB4twOgO01u/PrhMqPZYOOXpESxD33HRHCg==
X-Received: by 2002:a17:907:3d94:b0:6df:8791:135f with SMTP id
 he20-20020a1709073d9400b006df8791135fmr5110977ejc.205.1647535327108; 
 Thu, 17 Mar 2022 09:42:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0?
 (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a1709072cc800b006d6e469fbf0sm2553899ejc.134.2022.03.17.09.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 09:42:06 -0700 (PDT)
Message-ID: <5cbec4f6-4f77-0381-4f19-bb4af273db6f@redhat.com>
Date: Thu, 17 Mar 2022 17:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
To: Daniel Dadap <ddadap@nvidia.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
 <100e0cb5-98c4-cdd9-cfc7-4b76edef8950@redhat.com>
 <D7458E1F-6F4F-48E6-B100-B4B9B1226BCF@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <D7458E1F-6F4F-48E6-B100-B4B9B1226BCF@nvidia.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "markgross@kernel.org" <markgross@kernel.org>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 Alexandru Dinu <alex.dinu07@gmail.com>,
 "Mario.Limonciello@amd.com" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 3/17/22 14:28, Daniel Dadap wrote:
> 
>> On Mar 17, 2022, at 07:17, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> ﻿Hi,
>>
>>> On 3/16/22 21:33, Daniel Dadap wrote:
>>> Some notebook systems with EC-driven backlight control appear to have a
>>> firmware bug which causes the system to use GPU-driven backlight control
>>> upon a fresh boot, but then switches to EC-driven backlight control
>>> after completing a suspend/resume cycle. All the while, the firmware
>>> reports that the backlight is under EC control, regardless of what is
>>> actually controlling the backlight brightness.
>>>
>>> This leads to the following behavior:
>>>
>>> * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
>>>  WMI-wrapped ACPI method erroneously reporting EC control.
>>> * nvidia-wmi-ec-backlight does not work until after a suspend/resume
>>>  cycle, due to the backlight control actually being GPU-driven.
>>> * GPU drivers also register their own backlight handlers: in the case
>>>  of the notebook system where this behavior has been observed, both
>>>  amdgpu and the NVIDIA proprietary driver register backlight handlers.
>>> * The GPU which has backlight control upon a fresh boot (amdgpu in the
>>>  case observed so far) can successfully control the backlight through
>>>  its backlight driver's sysfs interface, but stops working after the
>>>  first suspend/resume cycle.
>>> * nvidia-wmi-ec-backlight is unable to control the backlight upon a
>>>  fresh boot, but begins to work after the first suspend/resume cycle.
>>> * The GPU which does not have backlight control (NVIDIA in this case)
>>>  is not able to control the backlight at any point while the system
>>>  is in operation. On similar hybrid systems with an EC-controlled
>>>  backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
>>>  does not register its backlight handler. It has not been determined
>>>  whether the non-functional handler registered by the NVIDIA driver
>>>  is due to another firmware bug, or a bug in the NVIDIA driver.
>>>
>>> Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
>>> device, it takes precedence over the BACKLIGHT_RAW devices registered
>>> by the GPU drivers. This in turn leads to backlight control appearing
>>> to be non-functional until after completing a suspend/resume cycle.
>>> However, it is still possible to control the backlight through direct
>>> interaction with the working GPU driver's backlight sysfs interface.
>>>
>>> These systems also appear to have a second firmware bug which resets
>>> the EC's brightness level to 100% on resume, but leaves the state in
>>> the kernel at the pre-suspend level. This causes attempts to save
>>> and restore the backlight level across the suspend/resume cycle to
>>> fail, due to the level appearing not to change even though it did.
>>>
>>> In order to work around these issues, add a quirk table to detect
>>> systems that are known to show these behaviors. So far, there is
>>> only one known system that requires these workarounds, and both
>>> issues are present on that system, but the quirks are tracked
>>> separately to make it easier to add them to other systems which
>>> may exhibit one of the bugs, but not the other. The original systems
>>> that this driver was tested on during development do not exhibit
>>> either of these quirks.
>>>
>>> If a system with the "GPU driver has backlight control" quirk is
>>> detected, nvidia-wmi-ec-backlight will grab a reference to the working
>>> (when freshly booted) GPU backlight handler and relays any backlight
>>> brightness level change requests directed at the EC to also be applied
>>> to the GPU backlight interface. This leads to redundant updates
>>> directed at the GPU backlight driver after a suspend/resume cycle, but
>>> it does allow the EC backlight control to work when the system is
>>> freshly booted.
>>
>> Ugh, I'm really not a fan of the backlight proxy plan here. I have
>> plans to clean-up the whole x86 backlight mess soon and an important part
>> of that is to stop registering multiple backlight interfaces for the
>> same panel/screen.
>>
>> Where as going with this workaround requires us to have 2 active
>> backlight interfaces active. Also this will very likely work to
>> (subtly) different backlight behavior before and after the first
>> suspend/resume.
> 
> I understand. Having multiple backlight devices for the same panel is indeed annoying. Out of curiosity, what is the plan for determining that multiple backlight interfaces are all supposed to control the same panel?

ATM the kernel basically only supports a bunch of different methods
to control the backlight of 1 internal panel. The plan is to tie this
to the panel from a userspace pov by making the brightness +
max_brightness properties on the drm_connector object for the
internal-panel.

The in kernel tying of the backlight device to the internal panel
will be done hardcoded inside the drm driver(s) based on the
drivers already knowing which connector is the internal panel.

This all naively assumes there is only 1 internal panel, which
for the majority of cases is true. My plan for devices with
2 internal panels is to cross that bridge when we get there
(I expect those mostly in phone/tablet like devices for now
which will likely use devicetree where solving this is trivial).

I do realize we will eventually get some x86/acpi device with
2 internal panels. Hopefully we can just figure out what
the Windows drivers are doing there and parse e.g. the ACPI
info which Windows is using for this.

As part of the move to properties on the drm_connector object
the /sys/class/backlight interface will become deprecated,
but will be kept for backward compat and will eventually
be put behind a Kconfig option.

The kernel internal backlight_device stuff will be kept
since we need some internal representation anyways and
I don't see much value in reworking that, esp. since
we need to have /sys/class/backlight backward compat.

Note this is all based on discussions which I had with
mainly Daniel Vetter @plumbers 2019 in Lisabon. I have
never gotten around to actually start working on this,
but this has resurfaced recently and I plan to actually
take a stab at implementing this plan sometime during 2022.

> I’m not sure I’m aware of any driver-agnostic ways of identifying a particular panel instance uniquely, and if there is one, that would actually help with something else I’m working on at the moment. If the idea involves e.g. the EDID, that could be troublesome for backlight drivers such as this one which aren’t associated with any GPU.

Right, see above the main idea is to make this
"the kernel's problem" and I expect us to fix this in
the kernel in a variety of different ways depending on
the actual hardware.

As for "troublesome for backlight drivers such as this one
which aren’t associated with any GPU.", the idea is that:

1. E.g the i915 driver (which I have the most experience with)
knows which connector is the internal panel

2. The acpi_video_get_backlight_type() helper from
drivers/acpi/video_detect.c will get extended to make sure
that there is always only *1* /sys/class/backlight device.

To be specific atm code supporting old vendor specific backlight
fw interfaces, e.g. drivers/platform/x86/dell-laptop.c:
already does:

       if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
                return 0;

And drivers/acpi/acpi_video.c also already does:

       if (acpi_video_get_backlight_type() != acpi_backlight_video)
                return 0;

Currently looking at the 3 main x86 backlight interfaces: vendor,
generic-ACPI and native-drm-driver, only the native driver's
backlight registers unconditionally. The plan is to make those also
do a similar check (*) and to also add special backlight drivers like
nvidia-wmi-ec-backlight and drivers/video/backlight/apple_bl.c
to this mechanism.

3. 1 + 2 means that the drm_driver can just tie the single
backlight_device which will be registered on the system to
the internal panel.

Again I'm completely ignoring dual-internal-panel devices here
for simplicity's sake.

Note this is getting a bit off-topic, but if you have insights
in this, or already can think of ways how this is not going to
work :)  please let me know.


*) And adding that check + the presence of nvidia-wmi-ec-backlight
support will make the native drm-driver not register it's
backlight_device at all at which point the backlight-proxy workaround
from this patch breaks.


> This also gives me an idea for another experiment I didn’t think to try earlier. Alex: what happens if you hack amdgpu_atombios_encoder_init_backlight() in the amdgpu driver to just return right away? I wonder if the AMD GPU’s attempt to take over backlight control is what makes the firmware give control to the GPU rather than the EC initially.
> 
> Regardless of the backlight proxy workaround, does the force refresh one seem reasonable? That one at least addresses a condition that happens at every suspend/resume cycle.

Good question, I must admit I stopped reading the patch after seeing
the proxy thing.

I see that you are using a pm_notifer for this. I wonder if you
can try (on your own system) to add a pm_ops struct and make
wmi_driver.driver.pm point to that and check if that gets called
by adding e.g. a pr_info (I don't see why it would not get called).

And assuming that works, using that would be a bit cleaner IMHO.
Although that does have resume-ordering implications. But I would
expect the EC to basically be always ready to get talked to at
the point in the resume cycle where normal (non early) resume
handlers are called.

To be clear the idea would be to always have the suspend handler
(so that the driver and pm_ops structs can be const) and to check
a quirk flag inside the resume handler. Or maybe even just always
read back the brightness from the hw and check if it has changed?
Does this need to be behind a quirk ?

>> Is there no other way to solve this issue? Maybe we need to poke
>> vgaswitcheroo to set the current GPU mode even though this is
>> already reported as active to get things to switch to the ECs
>> control right away ?
> 
> There isn’t a vgaswitcheroo handler for this particular mux device (yet), but there are separate ACPI interfaces for the mux itself. Poking the mux *shouldn’t* have any effect on what device is controlling the backlight for the panel, since when the system is in dynamic mux mode the EC is always supposed to be in control, but this system is already showing some weird behavior, so it doesn’t hurt to try.

Right, as you said the EC is always supposed to be in control, but
it is not. I would not be surprised if making the ACPI call to put
things in dynamic mode (even though they already are) fixes this,
assuming there is such an ACPI call...

>> I'm pretty certain that Windows is not doing this backlight proxying,
>> IMHO we need to figure out what causes the switch after suspend/resume
>> and then do that thing at boot.
> 
> I’ll put together an instrumented driver for Alex to try on his system, to capture some more data and see if I can get some more insight into that. I also have a dump of his ACPI tables, and can check there for some other potential leads. Hopefully whatever changes the state across the suspend/resume cycle is response to something that Linux does or doesn’t do, and not some state that is only handled internally within the firmware.

Great, thank you.

Regards,

Hans



>>> If a system with the "backlight level reset to full on resume" quirk
>>> is detected, nvidia-wmi-ec-backlight will register a PM notifier to
>>> reset the backlight to the previous level upon resume.
>>>
>>> These workarounds are also plumbed through to kernel module parameters,
>>> to make it easier for users who suspect they may be affected by one or
>>> both of these bugs to test whether these workarounds are effective on
>>> their systems as well.
>>>
>>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>>> Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
>>> ---
>>> Note: the Tested-by: line above applies to the previous version of this
>>> patch; an explicit ACK from the tester is required for it to apply to
>>> the current version.
>>>
>>> v2:
>>> * Add readable sysfs files for module params, use linear interpolation
>>>   from fixp-arith.h, fix return value of notifier callback, use devm_*()
>>>   for kzalloc and put_device. (Barnabás Pőcze <pobrn@protonmail.com>)
>>> * Add comment to denote known firmware versions that exhibit the bugs.
>>>   (Mario Limonciello <Mario.Limonciello@amd.com>)
>>> * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.com>)
>>>
>>> .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++-
>>> 1 file changed, 194 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>>> index 61e37194df70..95e1ddf780fc 100644
>>> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>>> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>>> @@ -3,8 +3,12 @@
>>>  * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>>>  */
>>>
>>> +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
>>> +
>>> #include <linux/acpi.h>
>>> #include <linux/backlight.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/fixp-arith.h>
>>> #include <linux/mod_devicetable.h>
>>> #include <linux/module.h>
>>> #include <linux/types.h>
>>> @@ -75,6 +79,73 @@ struct wmi_brightness_args {
>>>    u32 ignored[3];
>>> };
>>>
>>> +/**
>>> + * struct nvidia_wmi_ec_backlight_priv - driver private data
>>> + * @bl_dev:       the associated backlight device
>>> + * @proxy_target: backlight device which receives relayed brightness changes
>>> + * @notifier:     notifier block for resume callback
>>> + */
>>> +struct nvidia_wmi_ec_backlight_priv {
>>> +    struct backlight_device *bl_dev;
>>> +    struct backlight_device *proxy_target;
>>> +    struct notifier_block nb;
>>> +};
>>> +
>>> +static char *backlight_proxy_target;
>>> +module_param(backlight_proxy_target, charp, 0444);
>>> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
>>> +
>>> +static int max_reprobe_attempts = 128;
>>> +module_param(max_reprobe_attempts, int, 0444);
>>> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
>>> +
>>> +static bool restore_level_on_resume;
>>> +module_param(restore_level_on_resume, bool, 0444);
>>> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
>>> +
>>> +/* Bit field values for quirks table */
>>> +
>>> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
>>> +
>>> +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device names */
>>> +
>>> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
>>> +
>>> +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
>>> +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
>>> +
>>> +static int assign_quirks(const struct dmi_system_id *id)
>>> +{
>>> +    if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
>>> +        restore_level_on_resume = 1;
>>> +
>>> +    /* If the module parameter is set, override the quirks table */
>>> +    if (!backlight_proxy_target) {
>>> +        if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
>>> +            backlight_proxy_target = "amdgpu_bl1";
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +#define QUIRK_ENTRY(vendor, product, quirks) {          \
>>> +    .callback = assign_quirks,                      \
>>> +    .matches = {                                    \
>>> +        DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
>>> +        DMI_MATCH(DMI_PRODUCT_VERSION, product) \
>>> +    },                                              \
>>> +    .driver_data = (void *)(quirks)                 \
>>> +}
>>> +
>>> +static const struct dmi_system_id quirks_table[] = {
>>> +    QUIRK_ENTRY(
>>> +        /* This quirk is preset as of firmware revision HACN31WW */
>>> +        "LENOVO", "Legion S7 15ACH6",
>>> +        QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL1)
>>> +    ),
>>> +    { }
>>> +};
>>> +
>>> /**
>>>  * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>>>  * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
>>> @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
>>>    return 0;
>>> }
>>>
>>> +/* Scale the current brightness level of 'from' to the range of 'to'. */
>>> +static int scale_backlight_level(const struct backlight_device *from,
>>> +                 const struct backlight_device *to)
>>> +{
>>> +    int from_max = from->props.max_brightness;
>>> +    int from_level = from->props.brightness;
>>> +    int to_max = to->props.max_brightness;
>>> +
>>> +    return fixp_linear_interpolate(0, 0, from_max, to_max, from_level);
>>> +}
>>> +
>>> static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
>>> {
>>>    struct wmi_device *wdev = bl_get_data(bd);
>>> +    struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
>>> +    struct backlight_device *proxy_target = priv->proxy_target;
>>> +
>>> +    if (proxy_target) {
>>> +        int level = scale_backlight_level(bd, proxy_target);
>>> +
>>> +        if (backlight_device_set_brightness(proxy_target, level))
>>> +            pr_warn("Failed to relay backlight update to \"%s\"",
>>> +                backlight_proxy_target);
>>> +    }
>>>
>>>    return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
>>>                                 WMI_BRIGHTNESS_MODE_SET,
>>> @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
>>>    .get_brightness = nvidia_wmi_ec_backlight_get_brightness,
>>> };
>>>
>>> +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
>>> +{
>>> +
>>> +    /*
>>> +     * On some systems, the EC backlight level gets reset to 100% when
>>> +     * resuming from suspend, but the backlight device state still reflects
>>> +     * the pre-suspend value. Refresh the existing state to sync the EC's
>>> +     * state back up with the kernel's.
>>> +     */
>>> +    if (event == PM_POST_SUSPEND) {
>>> +        struct nvidia_wmi_ec_backlight_priv *p;
>>> +        int ret;
>>> +
>>> +        p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
>>> +        ret = backlight_update_status(p->bl_dev);
>>> +
>>> +        if (ret)
>>> +            pr_warn("failed to refresh backlight level: %d", ret);
>>> +
>>> +        return NOTIFY_OK;
>>> +    }
>>> +
>>> +    return NOTIFY_DONE;
>>> +}
>>> +
>>> +static void putdev(void *data)
>>> +{
>>> +    struct device *dev = data;
>>> +
>>> +    put_device(dev);
>>> +}
>>> +
>>> static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
>>> {
>>> +    struct backlight_device *bdev, *target = NULL;
>>> +    struct nvidia_wmi_ec_backlight_priv *priv;
>>>    struct backlight_properties props = {};
>>> -    struct backlight_device *bdev;
>>>    u32 source;
>>>    int ret;
>>>
>>> +    /*
>>> +     * Check quirks tables to see if this system needs any of the firmware
>>> +     * bug workarounds.
>>> +     */
>>> +    dmi_check_system(quirks_table);
>>> +
>>> +    if (backlight_proxy_target && backlight_proxy_target[0]) {
>>> +        static int num_reprobe_attempts;
>>> +
>>> +        target = backlight_device_get_by_name(backlight_proxy_target);
>>> +
>>> +        if (target) {
>>> +            ret = devm_add_action_or_reset(&wdev->dev, putdev,
>>> +                               &target->dev);
>>> +            if (ret)
>>> +                return ret;
>>> +        } else {
>>> +            /*
>>> +             * The target backlight device might not be ready;
>>> +             * try again and disable backlight proxying if it
>>> +             * fails too many times.
>>> +             */
>>> +            if (num_reprobe_attempts < max_reprobe_attempts) {
>>> +                num_reprobe_attempts++;
>>> +                return -EPROBE_DEFER;
>>> +            }
>>> +
>>> +            pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
>>> +                backlight_proxy_target, max_reprobe_attempts);
>>> +        }
>>> +    }
>>> +
>>>    ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>>>                               WMI_BRIGHTNESS_MODE_GET, &source);
>>>    if (ret)
>>> @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>>>                          &wdev->dev, wdev,
>>>                          &nvidia_wmi_ec_backlight_ops,
>>>                          &props);
>>> -    return PTR_ERR_OR_ZERO(bdev);
>>> +
>>> +    if (IS_ERR(bdev))
>>> +        return PTR_ERR(bdev);
>>> +
>>> +    priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +    if (!priv)
>>> +        return -ENOMEM;
>>> +
>>> +    priv->bl_dev = bdev;
>>> +
>>> +    dev_set_drvdata(&wdev->dev, priv);
>>> +
>>> +    if (target) {
>>> +        int level = scale_backlight_level(target, bdev);
>>> +
>>> +        if (backlight_device_set_brightness(bdev, level))
>>> +            pr_warn("Unable to import initial brightness level from %s.",
>>> +                backlight_proxy_target);
>>> +        priv->proxy_target = target;
>>> +    }
>>> +
>>> +    if (restore_level_on_resume) {
>>> +        priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
>>> +        register_pm_notifier(&priv->nb);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
>>> +{
>>> +    struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
>>> +
>>> +    if (priv->nb.notifier_call)
>>> +        unregister_pm_notifier(&priv->nb);
>>> }
>>>
>>> #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>>> @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
>>>        .name = "nvidia-wmi-ec-backlight",
>>>    },
>>>    .probe = nvidia_wmi_ec_backlight_probe,
>>> +    .remove = nvidia_wmi_ec_backlight_remove,
>>>    .id_table = nvidia_wmi_ec_backlight_id_table,
>>> };
>>> module_wmi_driver(nvidia_wmi_ec_backlight_driver);
>>

