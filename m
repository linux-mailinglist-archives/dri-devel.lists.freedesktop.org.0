Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC704FB98C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 12:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0250610F2CD;
	Mon, 11 Apr 2022 10:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923AD10F2C2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649672861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PEJP+wvFp+96bV+xUfKx7NW/3Nox/97/cRNYCTZWDMg=;
 b=iMmYqefXgyOiH2PwZvp2cDYC6xUv1rKV47ENhp4GZHq2ojRUNA3X6WgDuIJ9TXmEDYWt2x
 81BEXrh4+s8h+ZWsiuMxB0LDWFXMuf8fC9TALQODzXJIMpx0djjtOKnJEjdeSPODLsCEyx
 fdK0LvpWACd/LnyoX7aLiUO1b5nML48=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-J7gqgaJJN6aWkyY8Kq-pnQ-1; Mon, 11 Apr 2022 06:27:40 -0400
X-MC-Unique: J7gqgaJJN6aWkyY8Kq-pnQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 cm1-20020a0564020c8100b0041d6b9cf07eso3505073edb.14
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 03:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PEJP+wvFp+96bV+xUfKx7NW/3Nox/97/cRNYCTZWDMg=;
 b=Kxd1hrWtCQ+OlHSBV8ThefBri5j3iVz2wRFl2+J8d0zfY4QeivVxhbi9TFUSnA0WRd
 W0kmLwW8J/sVioGkCqmiAir5i4ahLSUuxj71edXlWen/0sO8Jl1a8bH0/A9Cz7rhMA1c
 XpD5RcHGMoGp0GClHsjBrTwQ0/P2ZJTEdRG6BkkrDA96XYDlIbnU+ML/3Rc1EYDKJDd/
 axKBpsRnx3aWWoB7YknTdfX8BS6Aa5O/D4vDOICuFsgCFSG4WBu6YYPloyr/jMlxMFdq
 fCqrhsc2sgaKRHwx0duQz8R3ToMIUV6x6UR2MwGfmYsft10vge/1cgA0zoboAc6mz3El
 dYbg==
X-Gm-Message-State: AOAM531YxdPFTfMwZfaWtbJ6suQBGSMKt/6NLbo1pZWh9+EFaJiDK2Jj
 1AUpqeVTBD+Wsa0voUEqU8YVovGu5h/tt0XY8yUsindEZw+3hxGQ1MGaqz/z2M9C9lDaFcn2i+B
 H0WQN+bcN7Jpy82kYRI2rKysi7NYW
X-Received: by 2002:a05:6402:4247:b0:419:3c6e:b0bf with SMTP id
 g7-20020a056402424700b004193c6eb0bfmr31993671edb.374.1649672859024; 
 Mon, 11 Apr 2022 03:27:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGjBs6oof/FSp8u0WkjkgrWwIA1MJWnSdukaEylPUcXW4wq+qqoDbzD704R9uqsE/OSsZFtQ==
X-Received: by 2002:a05:6402:4247:b0:419:3c6e:b0bf with SMTP id
 g7-20020a056402424700b004193c6eb0bfmr31993641edb.374.1649672858619; 
 Mon, 11 Apr 2022 03:27:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 sa23-20020a1709076d1700b006e89f401d7esm360496ejc.206.2022.04.11.03.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 03:27:38 -0700 (PDT)
Message-ID: <5b4b1d72-f432-2df3-d893-d5a311c1e6dd@redhat.com>
Date: Mon, 11 Apr 2022 12:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Carsten Haitzler <raster@rasterman.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <20220407195813.1a35952f89c22b9c64c0e3dd@rasterman.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220407195813.1a35952f89c22b9c64c0e3dd@rasterman.com>
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
Cc: Yusuf Khan <yusisamerican@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/7/22 20:58, Carsten Haitzler wrote:
> On Thu, 7 Apr 2022 17:38:59 +0200 Hans de Goede <hdegoede@redhat.com> said:
> 
> Below you covered our usual /sys/class/backlight device friends... what about
> DDC monitor controls? These function similarly but just remotely control a
> screen via I2C and also suffer from the same problems of "need root" and "have
> to do some fun in mapping them to a given screen".

Right, supporting this definitely is part of the plan, this is why my original
email had the following footnote:

1) The need to be able to map the backlight device to a specific display
has become clear once more with the recent proposal to add DDCDI support:
https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/

:)
 
> Otherwise I welcome this de-uglification of the backlight device and putting it
> together with the drm device that controls that monitor.

Thx.

> Just to make life more fun ... DDC does much more than backlight controls. It
> can control essentially anything that is in the OSD for your monitor (contrast,
> brightness, backlight, sharpness, color temperatures, input to display (DP vs
> HDMI vs DVI etc.), an for extra fun points can even tel you the current
> rotation state of your monitor. All of these do make sense to live as drm
> connector properties too. Perhaps not a first iteration but something to
> consider in this design.

One thing which I do want to take into account is to make sure that userspace
can still do DDC/CI for all the other features. I know there is demand for
adding brightness control over DDC/CI. I'm not aware of any concrete use-cases
for the other DDC/CI settings. Also DDC/CI can include some pretty crazy
stuff like setting up picture in picture using 2 different inputs of the
monitor, which is very vendor specific. So all in all I think that we should
just punt most of the DDC/CI stuff to userspace.

With that said I agree that it would be good to think about possibly other
some of the other settings in case some use-case does show up for those.

The biggest problem with doing this is coming up with some prefix to
namespace things. I've gone with bl_brightness to avoid a conflict
with the existing TV specific properties which have plain "brightness"
put if we want to e.g. also add DDC/CI contrast as a property later
then it might be good to come up with another more generic prefix
which can be shared between laptop-panel-brightness, DDC/CI-brightness
and DDC/CI-contrast ... ?

So any suggestions for a better prefix?

Regards,

Hans





> 
>> As discussed already several times in the past:
>>  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
>>  https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>>
>> The current userspace API for brightness control offered by
>> /sys/class/backlight devices has various issues, the biggest 2 being:
>>
>> 1. There is no way to map the backlight device to a specific
>>    display-output / panel (1)
>> 2. Controlling the brightness requires root-rights requiring
>>    desktop-environments to use suid-root helpers for this.
>>
>> As already discussed on various conference's hallway tracks
>> and as has been proposed on the dri-devel list once before (2),
>> it seems that there is consensus that the best way to to solve these
>> 2 issues is to add support for controlling a video-output's brightness
>> through properties on the drm_connector.
>>
>> This RFC outlines my plan to try and actually implement this,
>> which has 3 phases:
>>
>>
>> Phase 1: Stop registering multiple /sys/class/backlight devs for a single
>> display
>> =================================================================================
>>
>> On x86 there can be multiple firmware + direct-hw-access methods
>> for controlling the backlight and in some cases the kernel registers
>> multiple backlight-devices for a single internal laptop LCD panel:
>>
>> a) i915 and nouveau unconditionally register their "native" backlight dev
>>    even on devices where /sys/class/backlight/acpi_video0 must be used
>>    to control the backlight, relying on userspace to prefer the "firmware"
>>    acpi_video0 device over "native" devices.
>> b) amdgpu and nouveau rely on the acpi_video driver initializing before
>>    them, which currently causes /sys/class/backlight/acpi_video0 to usually
>>    show up and then they register their own native backlight driver after
>>    which the drivers/acpi/video_detect.c code unregisters the acpi_video0
>>    device. This means that userspace briefly sees 2 devices and the
>>    disappearing of acpi_video0 after a brief time confuses the systemd
>>    backlight level save/restore code, see e.g.:
>>    https://bbs.archlinux.org/viewtopic.php?id=269920
>>
>> I already have a pretty detailed plan to tackle this, which I will
>> post in a separate RFC email. I plan to start working on this right
>> away, as it will be good to have this fixed regardless.
>>
>>
>> Phase 2: Add drm_connector properties mirroring the matching backlight device
>> =============================================================================
>>
>> The plan is to add a drm_connector helper function, which optionally takes
>> a pointer to the backlight device for the GPU's native backlight device,
>> which will then mirror the backlight settings from the backlight device
>> in a set of read/write brightness* properties on the connector.
>>
>> This function can then be called by GPU drivers for the drm_connector for
>> the internal panel and it will then take care of everything. When there
>> is no native GPU backlight device, or when it should not be used then
>> (on x86) the helper will use the acpi_video_get_backlight_type() to
>> determine which backlight-device should be used instead and it will find
>> + mirror that one.
>>
>>
>> Phase 3: Deprecate /sys/class/backlight uAPI
>> ============================================
>>
>> Once most userspace has moved over to using the new drm_connector
>> brightness props, a Kconfig option can be added to stop exporting
>> the backlight-devices under /sys/class/backlight. The plan is to
>> just disable the sysfs interface and keep the existing backlight-device
>> internal kernel abstraction as is, since some abstraction for (non GPU
>> native) backlight devices will be necessary regardless.
>>
>> An alternative to disabling the sysfs class entirely, would be
>> to allow setting it to read-only through Kconfig.
>>
>>
>> What scale to use for the drm_connector bl_brightness property?
>> ===============================================================
>>
>> The tricky part of this plan is phase 2 and then esp. defining what the
>> new brightness properties will look like and how they will work.
>>
>> The biggest challenge here is to decide on a fixed scale for the main
>> brightness property, say 0-65535, using scaling where the actual hw scale
>> is different, or if this should simply be a 1:1 mirror of the current
>> backlight interface, with the actual hw scale / brightness_max value
>> exposed as a drm_connector property.
>>
>> 1:1 advantages / 0-65535 disadvantages
>> - Userspace will likely move over to the connector-props quite slowly and
>>   we can expect various userspace bits, esp. also custom user scripts, to
>>   keep using the old uAPI for a long time. Using the 2 APIs are intermixed
>>   is fine when using a 1:1 brightness scale mapping. But if we end up doing
>>   a scaling round-trip all the time then eventually the brightness is going
>>   do drift. This can even happen if the user never changes the brightness
>>   when userspace saves it over suspend/resume or reboots.
>> - Almost all laptops have brightness up/down hotkeys. E.g GNOME decides
>>   on a step size for the hotkeys by doing min(brightness_max/20, 1).
>>   Some of the vendor specific backlight fw APIs (e.g. dell-laptop) have
>>   only 8 steps. When giving userspace the actual max_brightness value, then
>>   this will all work just fine. When hardcode brightness_max to 65535 OTOH
>>   then in this case GNOME will still give the user 20 steps where only 1
>>   in every 2-3 steps actually changes the brightness which IMHO is
>>   an unacceptably bad user experience.
>>
>> 0-65535 advantages / 1:1 disadvantages
>> - Without a fixed scale for the brightness property the brightness_max
>>   value may change after an userspace application's initial enumeration
>>   of the drm_connector. This can happen when neither the native GPU nor
>>   the acpi_video backlight devices are present/usable in this case
>>   acpi_video_get_backlight_type() will _assume_ a vendor specific fw API
>>   will be used for backlight control and the driver proving the "vendor"
>>   backlight device will show up much later and may even never show-up,
>>   so waiting for it is not an option. With a fixed 0-65535 scale userspace
>>   can just always assume this and the drm_connector backlight props helper
>>   code can even cache writes and send it to the actual backlight device
>>   when it shows up. With a 1:1 mapping userspace needs to listen for
>>   a uevent and then update the brightness range on such an event.
>>
>> I believe that the 1:1 mapping advantages out way the disadvantages
>> here. Also note that current userspace already blindly assumes that
>> all relevant drivers are loaded before the graphical-environment
>> starts and all the desktop environments as such already only do
>> a single scan of /sys/class/backlight when they start. So when
>> userspace forgets to add code to listen for the uevent when switching
>> to the new API nothing changes; and with the uevent userspace actually
>> gets a good mechanism to detect backlight drivers loading after
>> the graphical-environment has already started.
>>
>> So based on this here is my proposal for a set of new brightness
>> properties on the drm_connector object. Note these are all prefixed with
>> bl which stands for backlight, which is technically not correct for OLED.
>> But we need a prefix to avoid a name collision with the "brightness"
>> attribute which is part of the existing TV specific properties and IMHO
>> it is good to have a common prefix to make it clear that these all
>> belong together.
>>
>>
>> The drm_connector brightness properties
>> =======================================
>>
>> bl_brightness: rw 0-int32_max property controlling the brightness setting
>> of the connected display. The actual maximum of this will be less then
>> int32_max and is given in bl_brightness_max.
>>
>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
>> of the display's brightness setting. This will report 0 when brightness
>> control is not available (yet).
>>
>> bl_brightness_0_is_min_brightness: ro, boolean
>> When this is set to true then it is safe to set brightness to 0
>> without worrying that this completely turns the backlight off causing
>> the screen to become unreadable. When this is false setting brightness
>> to 0 may turn the backlight off, but this is _not_ guaranteed.
>> This will e.g. be true when directly driving a PWM and the video-BIOS
>> has provided a minimum (non 0) duty-cycle below which the driver will
>> never go.
>>
>> bl_brightness_control_method: ro, enum, possible values:
>> none:     The GPU driver expects brightness control to be provided by another
>>           driver and that driver has not loaded yet.
>> unknown:  The underlying control mechanism is unknown.
>> pwm:      The brightness property directly controls the duty-cycle of a PWM
>>           output.
>> firmware: The brightness is controlled through firmware calls.
>> DDC/CI:   The brightness is controlled through the DDC/CI protocol.
>> gmux:     The brightness is controlled by the GMUX.
>> Note this enum may be extended in the future, so other values may
>> be read, these should be treated as "unknown".
>>
>> When brightness control becomes available after being reported
>> as not available before (bl_brightness_control_method=="none")
>> a uevent with CONNECTOR=<connector-id> and
>> PROPERTY=<bl_brightness_control_method-id> will be generated
>> at this point all the properties must be re-read.
>>
>> When/once brightness control is available then all the read-only
>> properties are fixed and will never change.
>>
>> Besides the "none" value for no driver having loaded yet,
>> the different bl_brightness_control_method values are intended for
>> (userspace) heuristics for such things as the brightness setting
>> linearly controlling electrical power or setting perceived brightness.
>>
>> Regards,
>>
>> Hans
>>
>>
>> 1) The need to be able to map the backlight device to a specific display
>> has become clear once more with the recent proposal to add DDCDI support:
>> https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/
>>
>> 2)
>> https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>> Note this proposal included a method for userspace to be able to tell the
>> kernel if the native/acpi_video/vendor backlight device should be used, but
>> this has been solved in the kernel for years now:
>> https://www.spinics.net/lists/linux-acpi/msg50526.html An initial
>> implementation of this proposal is available here:
>> https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight
>>
> 
> 

