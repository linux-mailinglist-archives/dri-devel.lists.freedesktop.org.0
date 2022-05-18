Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F418852BB43
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DA510E296;
	Wed, 18 May 2022 13:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694E010E296
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652878803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZUGaqKI+IHUytQKFd/5r50df+El5nVPdLriQFzuls8=;
 b=VLpBVDeQ0avk4OXF5m/5T3emLsPSd+g31mIu1MxPFzUSh5I0JG2BuArC/79xQJaR5cImvh
 vdjtyAK60hlvz4cekYZrJDVTyc6GuAs6+i6sZL8rbUDLYsIQ8iXWsKb0ROzSSmy7J6htH7
 Jm96SJ9bqtzioHXbWHmlkODEDC16hgE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-bclIn2XvNcSin0Xi0Ez4VQ-1; Wed, 18 May 2022 09:00:02 -0400
X-MC-Unique: bclIn2XvNcSin0Xi0Ez4VQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 l18-20020a1709066b9200b006fe40aaf3bbso947273ejr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 06:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QZUGaqKI+IHUytQKFd/5r50df+El5nVPdLriQFzuls8=;
 b=akL62w56wimt63FTN8Tt427Aqwv4KRE8oHRZKh6MqCsQysPJhkrIrDDsIRxt80xND9
 bafKzqexgT/WSzhqxGHu5CNguDRMFU7vm6p2GtQysdxZTuwBph/VP8bd+XtZr7/Jtxh0
 6wWToj8jZC5yviqmvd7tYKeIWBeHX8EOc5F1MLsOodOv2MMrEQxOGdWCYyHBg2Rr3vl3
 07JeyJZjpo8bSpVbW8ogt50XbrjdS/9c9Tt9cGxYz2X3ZzxpYOgKk57Qv5WcaFCOKZq4
 pvlBNmlZ/8jvZ3qhFAFncQD2GLUTmgnFKbfjZIWcWP26DINio2vDJ/os17GQe671P6dY
 TlMQ==
X-Gm-Message-State: AOAM530d90J4CPQw+MC0nsZBuQRwXLs1+C5AIjDwCiwb3QhDvpCXNLSn
 3O4D5QZQwlJkuR28i/7ZCUNQbAmxvY7XZCKOXI0pBAF5qsbnwfu4mqxF5DcnG/lktxTPiOX3Xxc
 H+37Y2k/7u9vQKhjb7uZDsrc6vXMC
X-Received: by 2002:a05:6402:5113:b0:427:f443:f63e with SMTP id
 m19-20020a056402511300b00427f443f63emr24609873edd.317.1652878800645; 
 Wed, 18 May 2022 06:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/rcyW+hj3KmlBFzyFzh1zJPRt4IL1JWP5XtTITCpnR8t+fWANlFvbijHNenHayLS+8QbOkg==
X-Received: by 2002:a05:6402:5113:b0:427:f443:f63e with SMTP id
 m19-20020a056402511300b00427f443f63emr24609855edd.317.1652878800292; 
 Wed, 18 May 2022 06:00:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 y28-20020a170906519c00b006fa981fcd78sm962731ejk.93.2022.05.18.05.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 05:59:59 -0700 (PDT)
Message-ID: <5423103a-3707-ba99-f45e-8608bc594bbd@redhat.com>
Date: Wed, 18 May 2022 14:59:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <87pmljerpi.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87pmljerpi.fsf@intel.com>
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
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/14/22 15:10, Jani Nikula wrote:
> On Thu, 07 Apr 2022, Hans de Goede <hdegoede@redhat.com> wrote:
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
>> Phase 1: Stop registering multiple /sys/class/backlight devs for a single display
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
> 
> Some eDP panels support brightness control via DPCD, in complex
> ways. Some of them support mixed modes via both DPCD and PWM
> simultaneously. Some of them support luminance based control.
> 
> DSI command mode panels support brightness control via DCS commands.

Right the whole bl_brightness_control_method is a bad idea and
I'll drop for the actual implementation of this.

> 
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
> 
> I'm not sure if it's a good idea to expose this with the goal that it's
> to be used for heuristics. We usually don't even know if we're
> controlling actual backlight brightness or just the OLED
> brightness. Basically any of the methods could be used to control OLED,
> or some HDR display with luminance based controls, and the heuristics
> would be off.

Ack, as said I plan to drop both the bl_brightness_0_is_min_brightness
(discussed elsewhere in the thread) and bl_brightness_control_method
properties, leaving just bl_brightness + bl_brightness_max.

> There are some cases where we can actually get a rough PWM/luminance
> curve from i915 opregion. I think maybe 16 data points. We've never
> exposed that. My idea was that you'd have a property where you could add
> data points for the curve, it could get pre-populated by the kernel if
> the kernel knows how to do it, defaulting to linear, but it could also
> be set or adjusted by userspace. The point would be that the userspace
> adjusts brightness linearly, and the kernel would use the curve data
> points to adjust it non-linearly. The userspace could have completely
> separated brightness adjustment and curve adjustment, and the brightness
> adjustment would be dead simple.

Interesting, I guess this could be a future feature addition on top
of my work.

> Finally, I'd drop "backlight" as a term throughout. It's brightness
> we're setting, and backlight is just a panel implementation detail.

Right, I'm fine with dropping backlight, but we do need a prefix
for the brightness property because there already is a plain
"brightness" property which is part of the existing TV specific
properties.

So how about: display_brightness or panel_brightness ?

I'm not sure which one I like better myself...

Regards,

Hans

