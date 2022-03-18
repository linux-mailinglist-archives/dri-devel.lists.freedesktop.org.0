Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600964DE01D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00010E09B;
	Fri, 18 Mar 2022 17:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7534910E09B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647625352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2dFE+YdomThiNavUGiK8tH6CHfp/8RyoA1ZlUsKlAI=;
 b=B47LpfU8aZY1KC7Ctw7fAb8zVS5WU5gTzesQXpFe2UXKCqSDsPmXT/4cd42xTCb4ks4cV9
 +MWmyvxVQ7qx4c1PyjreeAwB/e47r3XfdmpS5BJugT7lwY9NXgt0ptTTOm1Y40geF3Ofik
 FvuZ+eYdbpH2WL2Km933+QpYgxla4lI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-NtqKwzQHNqWZ1p6wGX3Njg-1; Fri, 18 Mar 2022 13:42:28 -0400
X-MC-Unique: NtqKwzQHNqWZ1p6wGX3Njg-1
Received: by mail-ed1-f69.google.com with SMTP id
 n4-20020a5099c4000000b00418ed58d92fso4612142edb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r2dFE+YdomThiNavUGiK8tH6CHfp/8RyoA1ZlUsKlAI=;
 b=VLCob0mCDlM/AlEzWWLbMud1YrvsMCIC6BQwQQEJgW+9Dn/V+vL11oTOYY1wxqScaX
 LpoVK9NNpAEMpn1Nw+Tcv6TewqPf06mXiDBwaVb96gRK02zCCd/lUwczrD0zieMKpHV1
 NrMM+hEdFyFXmWFuQGVU+SVg6FeTTcBGeViDmssOzqmu3/gqYnFCPqIt6713nqVIoXgQ
 A42TQ5qFFvVcTRcfN8kfgpOwHXguFhHmRlmPqvEybLaobaCgWR7uP39SG0iouMq3mj5C
 xwQwJMyxLxxKdKV4I/KSJJLW9Kqmvl3HXdYd8GsJq6bXJS/rzX/uV6hoBrQ8W/sAaCvu
 Z2sA==
X-Gm-Message-State: AOAM532wMiq7hjia99v+aFZQk/96JnyEhHqIPUSqULxCl/sVJeuY6LsC
 6ssi0mj6qWYkSbYcpnh1oubfGnL+G/fTLzmAE0XsI6Fk+ocbQs6NzZ9q47ZxUYjLSD1Q7K6Tx9C
 xG32OxofesFAr9bju3I2SuSPUqVCu
X-Received: by 2002:a05:6402:2711:b0:416:6442:76dc with SMTP id
 y17-20020a056402271100b00416644276dcmr10963759edd.314.1647625346200; 
 Fri, 18 Mar 2022 10:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytQadpk/oqFg8rdTLYPtJm1JKiALkqDEPA3KgopWn+Ak5i/vPTxOMlg+QNvL0gdqqGu36bZw==
X-Received: by 2002:a05:6402:2711:b0:416:6442:76dc with SMTP id
 y17-20020a056402271100b00416644276dcmr10963724edd.314.1647625345540; 
 Fri, 18 Mar 2022 10:42:25 -0700 (PDT)
Received: from ?IPV6:2a0e:5700:4:11:334c:7e36:8d57:40cb?
 ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709062a5300b006c75a94c587sm3845255eje.65.2022.03.18.10.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:42:24 -0700 (PDT)
Message-ID: <a05ecd6d-3975-f82c-bcf6-8bc4dc30d320@redhat.com>
Date: Fri, 18 Mar 2022 18:42:23 +0100
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
 <5cbec4f6-4f77-0381-4f19-bb4af273db6f@redhat.com>
 <50f306ab-121f-7aa1-7ba9-96ad50ccc5e9@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <50f306ab-121f-7aa1-7ba9-96ad50ccc5e9@nvidia.com>
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

On 3/17/22 19:36, Daniel Dadap wrote:
> 
> On 3/17/22 11:42, Hans de Goede wrote:
>> Hi Daniel,
>>
>> On 3/17/22 14:28, Daniel Dadap wrote:
>>>> On Mar 17, 2022, at 07:17, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> ﻿Hi,
>>>>
>>>>> On 3/16/22 21:33, Daniel Dadap wrote:
>>>>> Some notebook systems with EC-driven backlight control appear to have a
>>>>> firmware bug which causes the system to use GPU-driven backlight control
>>>>> upon a fresh boot, but then switches to EC-driven backlight control
>>>>> after completing a suspend/resume cycle. All the while, the firmware
>>>>> reports that the backlight is under EC control, regardless of what is
>>>>> actually controlling the backlight brightness.
>>>>>
>>>>> This leads to the following behavior:
>>>>>
>>>>> * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
>>>>>   WMI-wrapped ACPI method erroneously reporting EC control.
>>>>> * nvidia-wmi-ec-backlight does not work until after a suspend/resume
>>>>>   cycle, due to the backlight control actually being GPU-driven.
>>>>> * GPU drivers also register their own backlight handlers: in the case
>>>>>   of the notebook system where this behavior has been observed, both
>>>>>   amdgpu and the NVIDIA proprietary driver register backlight handlers.
>>>>> * The GPU which has backlight control upon a fresh boot (amdgpu in the
>>>>>   case observed so far) can successfully control the backlight through
>>>>>   its backlight driver's sysfs interface, but stops working after the
>>>>>   first suspend/resume cycle.
>>>>> * nvidia-wmi-ec-backlight is unable to control the backlight upon a
>>>>>   fresh boot, but begins to work after the first suspend/resume cycle.
>>>>> * The GPU which does not have backlight control (NVIDIA in this case)
>>>>>   is not able to control the backlight at any point while the system
>>>>>   is in operation. On similar hybrid systems with an EC-controlled
>>>>>   backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
>>>>>   does not register its backlight handler. It has not been determined
>>>>>   whether the non-functional handler registered by the NVIDIA driver
>>>>>   is due to another firmware bug, or a bug in the NVIDIA driver.
>>>>>
>>>>> Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
>>>>> device, it takes precedence over the BACKLIGHT_RAW devices registered
>>>>> by the GPU drivers. This in turn leads to backlight control appearing
>>>>> to be non-functional until after completing a suspend/resume cycle.
>>>>> However, it is still possible to control the backlight through direct
>>>>> interaction with the working GPU driver's backlight sysfs interface.
>>>>>
>>>>> These systems also appear to have a second firmware bug which resets
>>>>> the EC's brightness level to 100% on resume, but leaves the state in
>>>>> the kernel at the pre-suspend level. This causes attempts to save
>>>>> and restore the backlight level across the suspend/resume cycle to
>>>>> fail, due to the level appearing not to change even though it did.
>>>>>
>>>>> In order to work around these issues, add a quirk table to detect
>>>>> systems that are known to show these behaviors. So far, there is
>>>>> only one known system that requires these workarounds, and both
>>>>> issues are present on that system, but the quirks are tracked
>>>>> separately to make it easier to add them to other systems which
>>>>> may exhibit one of the bugs, but not the other. The original systems
>>>>> that this driver was tested on during development do not exhibit
>>>>> either of these quirks.
>>>>>
>>>>> If a system with the "GPU driver has backlight control" quirk is
>>>>> detected, nvidia-wmi-ec-backlight will grab a reference to the working
>>>>> (when freshly booted) GPU backlight handler and relays any backlight
>>>>> brightness level change requests directed at the EC to also be applied
>>>>> to the GPU backlight interface. This leads to redundant updates
>>>>> directed at the GPU backlight driver after a suspend/resume cycle, but
>>>>> it does allow the EC backlight control to work when the system is
>>>>> freshly booted.
>>>> Ugh, I'm really not a fan of the backlight proxy plan here. I have
>>>> plans to clean-up the whole x86 backlight mess soon and an important part
>>>> of that is to stop registering multiple backlight interfaces for the
>>>> same panel/screen.
>>>>
>>>> Where as going with this workaround requires us to have 2 active
>>>> backlight interfaces active. Also this will very likely work to
>>>> (subtly) different backlight behavior before and after the first
>>>> suspend/resume.
>>> I understand. Having multiple backlight devices for the same panel is indeed annoying. Out of curiosity, what is the plan for determining that multiple backlight interfaces are all supposed to control the same panel?
>> ATM the kernel basically only supports a bunch of different methods
>> to control the backlight of 1 internal panel. The plan is to tie this
>> to the panel from a userspace pov by making the brightness +
>> max_brightness properties on the drm_connector object for the
>> internal-panel.
>>
>> The in kernel tying of the backlight device to the internal panel
>> will be done hardcoded inside the drm driver(s) based on the
>> drivers already knowing which connector is the internal panel.
> 
> 
> Okay. At the moment the other problem I am thinking about also makes a one-internal-panel assumption, and it's true for the particular hardware that I'm working with, but I didn't like that assumption. If there isn't something existing that can be used to link connectors from multiple GPUs together to indicate they actually (potentially) drive the same display panel, then I suppose I'll continue assuming that. But I really do think the >1 display case needs to be more than just an afterthought, even if the solution, for now, is to just have all the drivers agree that a single internal panel is e.g. index 0 of some shared table that the drivers can all consult so that everybody knows which panel is which.
> 
> I am also concerned about muxed designs that don't have an EC-controlled backlight. If there's only allowed to be one backlight device per panel, then that means vga_switcheroo would have to do something to disable the outgoing GPU's backlight control and enable the incoming one's.

The one backlight device rule mainly applies to the case where the GPU driver's native backlight control is not used, so it needs to find another backlight-device (e.gf. acpi_video or  nvidia-wmi-ec-backlight) and proxy that to the properties on the panel's drm_connector.

If the native backlight control of the 2 GPUs is used then their is no such constriant since the GPU driver in that case knows which backlight-device to use itself.

Currently acpi_video_get_backlight_type() has the following return values:

enum acpi_backlight_type {
        acpi_backlight_undef = -1,
        acpi_backlight_none = 0,
        acpi_backlight_video,
        acpi_backlight_vendor,
        acpi_backlight_native,
};

The idea is to extend this to:

enum acpi_backlight_type {
        acpi_backlight_undef = -1,
        acpi_backlight_none = 0,
        acpi_backlight_video,
        acpi_backlight_vendor,
        acpi_backlight_native,
	acpi_backlight_nvidia_wmi_ec,
	acpi_backlight_apple_gmux,
};

And then have *all* (x86) backlight drivers do:

         if (acpi_video_get_backlight_type() != acpi_backlight_<my_type>)
                 return 0;

before registering the backlight-device. This is currently already
done by the acpi_backlight_video and acpi_backlight_vendor type
drivers, but not by the other ones.

In case of there being 2 native GPIU driver backlight-device (with the active GPU being in actual control) then both GPU drivers will do:

         if (acpi_video_get_backlight_type() != acpi_backlight_native)
                 return 0;

and since acpi_video_get_backlight_type() will return acpi_backlight_native in this case, the if condition will be false and both will continue with registering their (native) backlight device. Each offering the new brightness properties on the drm_connector for *their* internal display connection.

One of those 2 internal-panel drm_connectors should always be in a disconnected state, so this way userspace can choose which one to use (the one which is actually connected).

I believe something similar is already done by userspace on devices like this. For native backlight-devices userspace can find the matching GPU by looking at the parent device and I remember at least discussing userspace checking which GPU is connected to the panel to chose which backlight device to use on systems with 2 native backlight devices.

> And then all the userspace software that controls the sysfs backlight interf	aces would need to make sure to check to see what backlight devices are exposed every time a brightness change request is made, and not e.g. just once at init and then assume that the backlight devices won't change over the lifetime of whatever backlight manager software we're talking about (e.g. gnome-settings-daemon). I suppose if what the kernel exposes is an abstraction so that userspace only sees one backlight interface per panel in sysfs at any given time, which might actually be connected to one of several different drivers in the backlight subsystem, that would make it a little better, but I still think there would
> be potential for races between a mux switch and a brightness change event.

See above in this case there will be 2 separate drm_connector-s and on a dynamic switch userspace will see a display disconnect + reconnect and userspace really needs to see this to be able to setup things like prime properly.

> 
>> This all naively assumes there is only 1 internal panel, which
>> for the majority of cases is true. My plan for devices with
>> 2 internal panels is to cross that bridge when we get there
>> (I expect those mostly in phone/tablet like devices for now
>> which will likely use devicetree where solving this is trivial).
>>
>> I do realize we will eventually get some x86/acpi device with
>> 2 internal panels. Hopefully we can just figure out what
>> the Windows drivers are doing there and parse e.g. the ACPI
>> info which Windows is using for this.
> 
> 
> I'm not aware of any more modern examples, but there already have been such systems. See e.g. Lenovo ThinkPad W701ds. IIRC that system was discrete GPU only, so there wouldn't be any concern about coordinating panel IDs between different GPU drivers, but there is a very real possibility that a vendor may want to bring back a similar design with hybrid GPUs. The asymmetry of that system always bothered me a bit: I imagine that if the NVIDIA GPUs of that era supported more than two heads per GPU, we may have seen a three-screen notebook.
> 
> It's very possible that some of the modern exotic e.g. folding designs show up as dual displays, but I don't have any first-hand experience with those to know whether that is the case. I definitely remember the W701ds exposed the two displays as separate entities. (And the one that popped off to the side was rotated, which was fun.)
> 
> 
>> As part of the move to properties on the drm_connector object
>> the /sys/class/backlight interface will become deprecated,
>> but will be kept for backward compat and will eventually
>> be put behind a Kconfig option.
> 
> 
> If you have a high-level design for this written down somewhere, do you mind sharing it? I want to get an idea of what types of changes the proprietary nvidia-drm driver might need to participate in this.

I don't really have a high level design written down yet.

Basically the plan is to have some generic helper code to allow a GPU driver to proxy a backlight device (including its own native backlight) to a set of properties on the drm_connector object. As mentioned before the idea is to keep the backlight-device API as kernel-internal API for this since we need this for backward compat and we need some sort of internal API between e.g. nvidia-wmi-ec-backligt and the GPU drivers anyways.

It will be the GPU drivers responsibility to pick a backlight-device + connector to pair up. Although I likely will add a helper for that too which
will take the GPU drivers own native backlight-device (may be NULL) + a drm-connector as input and then based on the acpi_video_get_backlight_type() return value find a backlight-device to proxy (iow it may end up not using the native backlight-device even if one is passed in).

I expect the helpers for this to also be suitable for the proprietary nvidia driver, but I guess that also depends on how much of the existing drm-helpers you already use.

>> The kernel internal backlight_device stuff will be kept
>> since we need some internal representation anyways and
>> I don't see much value in reworking that, esp. since
>> we need to have /sys/class/backlight backward compat.
>>
>> Note this is all based on discussions which I had with
>> mainly Daniel Vetter @plumbers 2019 in Lisabon. I have
>> never gotten around to actually start working on this,
>> but this has resurfaced recently and I plan to actually
>> take a stab at implementing this plan sometime during 2022.
>>
>>> I’m not sure I’m aware of any driver-agnostic ways of identifying a particular panel instance uniquely, and if there is one, that would actually help with something else I’m working on at the moment. If the idea involves e.g. the EDID, that could be troublesome for backlight drivers such as this one which aren’t associated with any GPU.
>> Right, see above the main idea is to make this
>> "the kernel's problem" and I expect us to fix this in
>> the kernel in a variety of different ways depending on
>> the actual hardware.
>>
>> As for "troublesome for backlight drivers such as this one
>> which aren’t associated with any GPU.", the idea is that:
>>
>> 1. E.g the i915 driver (which I have the most experience with)
>> knows which connector is the internal panel
> 
> 
> Sure, the NVIDIA proprietary driver knows this as well, and what I've seen from the other DRM drivers also suggests that this is an easy determination to make.
> 
> 
>> 2. The acpi_video_get_backlight_type() helper from
>> drivers/acpi/video_detect.c will get extended to make sure
>> that there is always only *1* /sys/class/backlight device.
>>
>> To be specific atm code supporting old vendor specific backlight
>> fw interfaces, e.g. drivers/platform/x86/dell-laptop.c:
>> already does:
>>
>>         if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>>                  return 0;
>>
>> And drivers/acpi/acpi_video.c also already does:
>>
>>         if (acpi_video_get_backlight_type() != acpi_backlight_video)
>>                  return 0;
>>
>> Currently looking at the 3 main x86 backlight interfaces: vendor,
>> generic-ACPI and native-drm-driver, only the native driver's
>> backlight registers unconditionally. The plan is to make those also
>> do a similar check (*) and to also add special backlight drivers like
>> nvidia-wmi-ec-backlight and drivers/video/backlight/apple_bl.c
>> to this mechanism.
> 
> 
> nvidia-wmi-ec-backlight does this check during probe:
> 
>>         ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>>                                    WMI_BRIGHTNESS_MODE_GET, &source);
>>         if (ret)
>>                 return ret;
>>
>>         /*
>>          * This driver is only to be used when brightness control is handled
>>          * by the EC; otherwise, the GPU driver(s) should control brightness.
>>          */
>>         if (source != WMI_BRIGHTNESS_SOURCE_EC)
>>                 return -ENODEV;

Right, we will need to do something similar inside drivers/acpi/video_detect.c
in the future to make acpi_video_get_backlight_type() return 
acpi_backlight_nvidia_wmi_ec on systems which use this fw interface.

> 
> 
> And part of the problem with this bug is that what the firmware is reporting here is a lie, at least until the first suspend/resume cycle.
> 
> Also, unlike the DRM drivers, the NVIDIA proprietary driver does not register its backlight handler unconditionally: one of the strange things about this system is that the NVIDIA proprietary driver *does* register a backlight handler, even though it's definitely not supposed to in this case. I did notice that the DRM drivers don't currently seem to have any checks to see whether they should register, and indeed on the EC backlight systems I have tested, with both amdgpu and i915, there is a non-functional sysfs backlight interface exposed by the iGPU. One of the other strange things about the system is the fact that the amdgpu backlight driver works at all.


Right, note that if making the amdgpu driver not register it backlight handler,
then we might add acpi_backlight_nvidia_wmi_ec support to acpi_video_get_backlight_type()
sooner (now) and add a:

         if (acpi_video_get_backlight_type() != acpi_backlight_native)
                 return 0;

to amdgpu now, to fix this.

>> 3. 1 + 2 means that the drm_driver can just tie the single
>> backlight_device which will be registered on the system to
>> the internal panel.
> 
> This sounds kind of ugly to me. If the backlight control is GPU-agnostic, as is the case here, then associating the backlight_device with a drm_driver doesn't seem right. It sounds like the plan is to move from the current sysfs interface to one that's exposed by the DRM subsystem. If that's the case, I think there should be a way to do so without tying it to a specific GPU driver. e.g., on a muxed system, one or the other GPU might be scanning out at any given time (which is why many of these systems have non-GPU backlight control), so if the interface is GPU-specific, that would be at the very least confusing.

Most muxed systems that I know don't support dynamic switching, so we would tie e.g.
the nvidia-wmi-ec-backlight device to the internal-panel drm_connector of the GPU
which actually is connected to the panel.

For dynamic switching the drm_connector_s_ for the internal panel would both
proxy the nvidia-wmi-ec-backlight device and userspace will use the one for
connector which is actually connected at a given time.

>> Again I'm completely ignoring dual-internal-panel devices here
>> for simplicity's sake.
>>
>> Note this is getting a bit off-topic, but if you have insights
>> in this, or already can think of ways how this is not going to
>> work :)  please let me know.
> 
> 
> My concerns listed above are everything I can think of off the top of my head. I'm sure if I think about it more I'll come up with other concerns. This did get a bit off-topic, but I'm actually very glad you've told me all this.

Yeah it is good to discuss this now. It will likely be a couple
of months before I can actually post a RFC series implemeting
my ideas for this.

Regards,

Hans


> 
> 
>>
>> *) And adding that check + the presence of nvidia-wmi-ec-backlight
>> support will make the native drm-driver not register it's
>> backlight_device at all at which point the backlight-proxy workaround
>> from this patch breaks.
>>
>>
>>> This also gives me an idea for another experiment I didn’t think to try earlier. Alex: what happens if you hack amdgpu_atombios_encoder_init_backlight() in the amdgpu driver to just return right away? I wonder if the AMD GPU’s attempt to take over backlight control is what makes the firmware give control to the GPU rather than the EC initially.
>>>
>>> Regardless of the backlight proxy workaround, does the force refresh one seem reasonable? That one at least addresses a condition that happens at every suspend/resume cycle.
>> Good question, I must admit I stopped reading the patch after seeing
>> the proxy thing.
>>
>> I see that you are using a pm_notifer for this. I wonder if you
>> can try (on your own system) to add a pm_ops struct and make
>> wmi_driver.driver.pm point to that and check if that gets called
>> by adding e.g. a pr_info (I don't see why it would not get called).
>>
>> And assuming that works, using that would be a bit cleaner IMHO.
>> Although that does have resume-ordering implications. But I would
>> expect the EC to basically be always ready to get talked to at
>> the point in the resume cycle where normal (non early) resume
>> handlers are called.
>>
>> To be clear the idea would be to always have the suspend handler
>> (so that the driver and pm_ops structs can be const) and to check
>> a quirk flag inside the resume handler. Or maybe even just always
>> read back the brightness from the hw and check if it has changed?
>> Does this need to be behind a quirk ?
> 
> 
> Okay, thanks. I missed the wmi_driver.driver.pm when I was looking to wire up something to refresh the backlight level on resume; that does sound cleaner than registering a notifier. Alex did report that the backlight was briefly at maximum brightness following resume, before the notifier kicked in and reset it to the correct level, so hopefully hooking it up through pm_ops will be able to catch it early enough to avoid that. And making the refresh unconditional rather than hidden behind a quirk sounds reasonable too; I expect it to be harmless on systems that don't need it.
> 
> 
>>>> Is there no other way to solve this issue? Maybe we need to poke
>>>> vgaswitcheroo to set the current GPU mode even though this is
>>>> already reported as active to get things to switch to the ECs
>>>> control right away ?
>>> There isn’t a vgaswitcheroo handler for this particular mux device (yet), but there are separate ACPI interfaces for the mux itself. Poking the mux *shouldn’t* have any effect on what device is controlling the backlight for the panel, since when the system is in dynamic mux mode the EC is always supposed to be in control, but this system is already showing some weird behavior, so it doesn’t hurt to try.
>> Right, as you said the EC is always supposed to be in control, but
>> it is not. I would not be surprised if making the ACPI call to put
>> things in dynamic mode (even though they already are) fixes this,
>> assuming there is such an ACPI call...
> 
> 
> Yes, there is one, although changes to the mode aren't supposed to take effect until reboot. However, this system already seems to be misbehaving, so it's certainly possible that poking at that call will do something.
> 
> 
>>>> I'm pretty certain that Windows is not doing this backlight proxying,
>>>> IMHO we need to figure out what causes the switch after suspend/resume
>>>> and then do that thing at boot.
>>> I’ll put together an instrumented driver for Alex to try on his system, to capture some more data and see if I can get some more insight into that. I also have a dump of his ACPI tables, and can check there for some other potential leads. Hopefully whatever changes the state across the suspend/resume cycle is response to something that Linux does or doesn’t do, and not some state that is only handled internally within the firmware.
>> Great, thank you.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>>> If a system with the "backlight level reset to full on resume" quirk
>>>>> is detected, nvidia-wmi-ec-backlight will register a PM notifier to
>>>>> reset the backlight to the previous level upon resume.
>>>>>
>>>>> These workarounds are also plumbed through to kernel module parameters,
>>>>> to make it easier for users who suspect they may be affected by one or
>>>>> both of these bugs to test whether these workarounds are effective on
>>>>> their systems as well.
>>>>>
>>>>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>>>>> Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
>>>>> ---
>>>>> Note: the Tested-by: line above applies to the previous version of this
>>>>> patch; an explicit ACK from the tester is required for it to apply to
>>>>> the current version.
>>>>>
>>>>> v2:
>>>>> * Add readable sysfs files for module params, use linear interpolation
>>>>>    from fixp-arith.h, fix return value of notifier callback, use devm_*()
>>>>>    for kzalloc and put_device. (Barnabás Pőcze <pobrn@protonmail.com>)
>>>>> * Add comment to denote known firmware versions that exhibit the bugs.
>>>>>    (Mario Limonciello <Mario.Limonciello@amd.com>)
>>>>> * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.com>)
>>>>>
>>>>> .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++-
>>>>> 1 file changed, 194 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>>>>> index 61e37194df70..95e1ddf780fc 100644
>>>>> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>>>>> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>>>>> @@ -3,8 +3,12 @@
>>>>>   * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>>>>>   */
>>>>>
>>>>> +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
>>>>> +
>>>>> #include <linux/acpi.h>
>>>>> #include <linux/backlight.h>
>>>>> +#include <linux/dmi.h>
>>>>> +#include <linux/fixp-arith.h>
>>>>> #include <linux/mod_devicetable.h>
>>>>> #include <linux/module.h>
>>>>> #include <linux/types.h>
>>>>> @@ -75,6 +79,73 @@ struct wmi_brightness_args {
>>>>>     u32 ignored[3];
>>>>> };
>>>>>
>>>>> +/**
>>>>> + * struct nvidia_wmi_ec_backlight_priv - driver private data
>>>>> + * @bl_dev:       the associated backlight device
>>>>> + * @proxy_target: backlight device which receives relayed brightness changes
>>>>> + * @notifier:     notifier block for resume callback
>>>>> + */
>>>>> +struct nvidia_wmi_ec_backlight_priv {
>>>>> +    struct backlight_device *bl_dev;
>>>>> +    struct backlight_device *proxy_target;
>>>>> +    struct notifier_block nb;
>>>>> +};
>>>>> +
>>>>> +static char *backlight_proxy_target;
>>>>> +module_param(backlight_proxy_target, charp, 0444);
>>>>> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
>>>>> +
>>>>> +static int max_reprobe_attempts = 128;
>>>>> +module_param(max_reprobe_attempts, int, 0444);
>>>>> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
>>>>> +
>>>>> +static bool restore_level_on_resume;
>>>>> +module_param(restore_level_on_resume, bool, 0444);
>>>>> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
>>>>> +
>>>>> +/* Bit field values for quirks table */
>>>>> +
>>>>> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
>>>>> +
>>>>> +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device names */
>>>>> +
>>>>> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
>>>>> +
>>>>> +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
>>>>> +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
>>>>> +
>>>>> +static int assign_quirks(const struct dmi_system_id *id)
>>>>> +{
>>>>> +    if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
>>>>> +        restore_level_on_resume = 1;
>>>>> +
>>>>> +    /* If the module parameter is set, override the quirks table */
>>>>> +    if (!backlight_proxy_target) {
>>>>> +        if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
>>>>> +            backlight_proxy_target = "amdgpu_bl1";
>>>>> +    }
>>>>> +
>>>>> +    return true;
>>>>> +}
>>>>> +
>>>>> +#define QUIRK_ENTRY(vendor, product, quirks) {          \
>>>>> +    .callback = assign_quirks,                      \
>>>>> +    .matches = {                                    \
>>>>> +        DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
>>>>> +        DMI_MATCH(DMI_PRODUCT_VERSION, product) \
>>>>> +    },                                              \
>>>>> +    .driver_data = (void *)(quirks)                 \
>>>>> +}
>>>>> +
>>>>> +static const struct dmi_system_id quirks_table[] = {
>>>>> +    QUIRK_ENTRY(
>>>>> +        /* This quirk is preset as of firmware revision HACN31WW */
>>>>> +        "LENOVO", "Legion S7 15ACH6",
>>>>> +        QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL1)
>>>>> +    ),
>>>>> +    { }
>>>>> +};
>>>>> +
>>>>> /**
>>>>>   * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>>>>>   * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
>>>>> @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
>>>>>     return 0;
>>>>> }
>>>>>
>>>>> +/* Scale the current brightness level of 'from' to the range of 'to'. */
>>>>> +static int scale_backlight_level(const struct backlight_device *from,
>>>>> +                 const struct backlight_device *to)
>>>>> +{
>>>>> +    int from_max = from->props.max_brightness;
>>>>> +    int from_level = from->props.brightness;
>>>>> +    int to_max = to->props.max_brightness;
>>>>> +
>>>>> +    return fixp_linear_interpolate(0, 0, from_max, to_max, from_level);
>>>>> +}
>>>>> +
>>>>> static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
>>>>> {
>>>>>     struct wmi_device *wdev = bl_get_data(bd);
>>>>> +    struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
>>>>> +    struct backlight_device *proxy_target = priv->proxy_target;
>>>>> +
>>>>> +    if (proxy_target) {
>>>>> +        int level = scale_backlight_level(bd, proxy_target);
>>>>> +
>>>>> +        if (backlight_device_set_brightness(proxy_target, level))
>>>>> +            pr_warn("Failed to relay backlight update to \"%s\"",
>>>>> +                backlight_proxy_target);
>>>>> +    }
>>>>>
>>>>>     return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
>>>>>                                  WMI_BRIGHTNESS_MODE_SET,
>>>>> @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
>>>>>     .get_brightness = nvidia_wmi_ec_backlight_get_brightness,
>>>>> };
>>>>>
>>>>> +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
>>>>> +{
>>>>> +
>>>>> +    /*
>>>>> +     * On some systems, the EC backlight level gets reset to 100% when
>>>>> +     * resuming from suspend, but the backlight device state still reflects
>>>>> +     * the pre-suspend value. Refresh the existing state to sync the EC's
>>>>> +     * state back up with the kernel's.
>>>>> +     */
>>>>> +    if (event == PM_POST_SUSPEND) {
>>>>> +        struct nvidia_wmi_ec_backlight_priv *p;
>>>>> +        int ret;
>>>>> +
>>>>> +        p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
>>>>> +        ret = backlight_update_status(p->bl_dev);
>>>>> +
>>>>> +        if (ret)
>>>>> +            pr_warn("failed to refresh backlight level: %d", ret);
>>>>> +
>>>>> +        return NOTIFY_OK;
>>>>> +    }
>>>>> +
>>>>> +    return NOTIFY_DONE;
>>>>> +}
>>>>> +
>>>>> +static void putdev(void *data)
>>>>> +{
>>>>> +    struct device *dev = data;
>>>>> +
>>>>> +    put_device(dev);
>>>>> +}
>>>>> +
>>>>> static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
>>>>> {
>>>>> +    struct backlight_device *bdev, *target = NULL;
>>>>> +    struct nvidia_wmi_ec_backlight_priv *priv;
>>>>>     struct backlight_properties props = {};
>>>>> -    struct backlight_device *bdev;
>>>>>     u32 source;
>>>>>     int ret;
>>>>>
>>>>> +    /*
>>>>> +     * Check quirks tables to see if this system needs any of the firmware
>>>>> +     * bug workarounds.
>>>>> +     */
>>>>> +    dmi_check_system(quirks_table);
>>>>> +
>>>>> +    if (backlight_proxy_target && backlight_proxy_target[0]) {
>>>>> +        static int num_reprobe_attempts;
>>>>> +
>>>>> +        target = backlight_device_get_by_name(backlight_proxy_target);
>>>>> +
>>>>> +        if (target) {
>>>>> +            ret = devm_add_action_or_reset(&wdev->dev, putdev,
>>>>> +                               &target->dev);
>>>>> +            if (ret)
>>>>> +                return ret;
>>>>> +        } else {
>>>>> +            /*
>>>>> +             * The target backlight device might not be ready;
>>>>> +             * try again and disable backlight proxying if it
>>>>> +             * fails too many times.
>>>>> +             */
>>>>> +            if (num_reprobe_attempts < max_reprobe_attempts) {
>>>>> +                num_reprobe_attempts++;
>>>>> +                return -EPROBE_DEFER;
>>>>> +            }
>>>>> +
>>>>> +            pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
>>>>> +                backlight_proxy_target, max_reprobe_attempts);
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>     ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>>>>>                                WMI_BRIGHTNESS_MODE_GET, &source);
>>>>>     if (ret)
>>>>> @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>>>>>                           &wdev->dev, wdev,
>>>>>                           &nvidia_wmi_ec_backlight_ops,
>>>>>                           &props);
>>>>> -    return PTR_ERR_OR_ZERO(bdev);
>>>>> +
>>>>> +    if (IS_ERR(bdev))
>>>>> +        return PTR_ERR(bdev);
>>>>> +
>>>>> +    priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>>>> +    if (!priv)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    priv->bl_dev = bdev;
>>>>> +
>>>>> +    dev_set_drvdata(&wdev->dev, priv);
>>>>> +
>>>>> +    if (target) {
>>>>> +        int level = scale_backlight_level(target, bdev);
>>>>> +
>>>>> +        if (backlight_device_set_brightness(bdev, level))
>>>>> +            pr_warn("Unable to import initial brightness level from %s.",
>>>>> +                backlight_proxy_target);
>>>>> +        priv->proxy_target = target;
>>>>> +    }
>>>>> +
>>>>> +    if (restore_level_on_resume) {
>>>>> +        priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
>>>>> +        register_pm_notifier(&priv->nb);
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
>>>>> +{
>>>>> +    struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
>>>>> +
>>>>> +    if (priv->nb.notifier_call)
>>>>> +        unregister_pm_notifier(&priv->nb);
>>>>> }
>>>>>
>>>>> #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>>>>> @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
>>>>>         .name = "nvidia-wmi-ec-backlight",
>>>>>     },
>>>>>     .probe = nvidia_wmi_ec_backlight_probe,
>>>>> +    .remove = nvidia_wmi_ec_backlight_remove,
>>>>>     .id_table = nvidia_wmi_ec_backlight_id_table,
>>>>> };
>>>>> module_wmi_driver(nvidia_wmi_ec_backlight_driver);
> 

