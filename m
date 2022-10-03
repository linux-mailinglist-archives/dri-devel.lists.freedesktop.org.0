Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3A5F2C79
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 10:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0310E282;
	Mon,  3 Oct 2022 08:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF38610E283
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664787209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+e17AtTExH8qB0x8Rj756iZTD5s3YcIzRR2kWycljHw=;
 b=JzLUOeXyHK/1QjhEzmkS6S6GapsVyRYMyC5zjNxR7NJwRDArsnCLl6579IvM9WqN5kLWwB
 mnkR58Q3mw+WBrlPdB5tjQZMuhy+QkDQ5yCW7RsmS35ri8IBPE8woDWomQifxjXt3sEoNm
 rpzybc86gHRfklIa3RWpA1ziXBRJYaE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-9K-tdeKDNi2SOed2B0NfHg-1; Mon, 03 Oct 2022 04:53:28 -0400
X-MC-Unique: 9K-tdeKDNi2SOed2B0NfHg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w2-20020a056402268200b00458ef2a5a4eso2077337edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 01:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+e17AtTExH8qB0x8Rj756iZTD5s3YcIzRR2kWycljHw=;
 b=mMPNUwqzO2hfmdHUFgY/E5DCZU9TBWbUVJWTbLSsZy6giTvS8LVwsXzjyRPgKSDYTK
 bnDfjmDKs7z9CE4NEwS27H4A0zqsCjgD+uq1Jbsk3iEzb/a6hakyAUHh55blJ67/npfR
 bc9drVs//uhbYbsSN6OkMFQSY6EO/CdOF+KIlZf6wQV/vI5gFo2XpRYLVjX8nqA7EqCz
 xLrnIXMLlwJcd2oc6Igay4ZJETAkIw+j4A+xxrtN1bNB4w+FGeNSBuvLnHjFAgn++SjI
 wEVJOX4Wzcj7U9QkiLLqC/4j2rY426u1I0toR7jjHaagrtm1pw6Q9YNmALIbIWT0gUl5
 TWIQ==
X-Gm-Message-State: ACrzQf0QRSXWFRF6RjxcZ5EcHJ23qihj7mA5LmVsZ/SSoepkqZr7bDwZ
 +ssat8w7IyCTNzkKnB1XaQbuIPhQtYE98kzE1np2rOjy296+zCviE8p25dj88dsP/RWHIRCgCdX
 Vmy1bHEF35J0I7DOjmRyWGb22u9aY
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id
 fj11-20020a0564022b8b00b0043a5475f1aemr17445038edb.363.1664787207061; 
 Mon, 03 Oct 2022 01:53:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5MmDFNhvqIe0OOCbBEd+PeNXoTSJBdBp/FBPh4W/ZJ8iESGnBEqYQ3dET19WfBMRhiJtpWig==
X-Received: by 2002:a05:6402:2b8b:b0:43a:5475:f1ae with SMTP id
 fj11-20020a0564022b8b00b0043a5475f1aemr17445018edb.363.1664787206715; 
 Mon, 03 Oct 2022 01:53:26 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056402240c00b0044e7862ab3fsm7031715eda.7.2022.10.03.01.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:53:26 -0700 (PDT)
Message-ID: <d8861b3a-a4f8-ef54-9909-5e58e1f23745@redhat.com>
Date: Mon, 3 Oct 2022 10:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <878rm3zuge.fsf@intel.com>
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

On 9/28/22 12:04, Jani Nikula wrote:
> On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi all,
>>
>> Here is v2 of my "drm/kms: control display brightness through drm_connector properties" RFC:
>>
>> Changes from version 1:
>> - Drop bl_brightness_0_is_min_brightness from list of new connector
>>   properties.
>> - Clearly define that 0 is always min-brightness when setting the brightness
>>   through the connector properties.
>> - Drop bl_brightness_control_method from list of new connector
>>   properties.
>> - Phase 1 of the plan has been completed
>>
>> As discussed already several times in the past:
>>  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
>>  https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>>
>> The current userspace API for brightness control offered by
>> /sys/class/backlight devices has various issues:
>>
>> 1. There is no way to map the backlight device to a specific
>>    display-output / panel (1)
>> 2. Controlling the brightness requires root-rights requiring
>>    desktop-environments to use suid-root helpers for this.
>> 3. The meaning of 0 is not clearly defined, it can be either off,
>>    or minimum brightness at which the display is still readable
>>    (in a low light environment)
>> 4. It's not possible to change both the gamma and the brightness in the
>>    same KMS atomic commit. You'd want to be able to reduce brightness to
>>    conserve power, and counter the effects of that by changing gamma to
>>    reach a visually similar image. And you'd want to have the changes take
>>    effect at the same time instead of reducing brightness at some frame and
>>    change gamma at some other frame. This is pretty much impossible to do
>>    via the sysfs interface.
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
>> multiple backlight-devices for a single internal laptop LCD panel.
>>
>> A plan to fix this was posted here:
>> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>> And a pull-req actually implementing this plan has been send out this week:
>> https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/
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
>> It is unsure if we will ever be able to do this. For example people using
>> non fully integrated desktop environments like e.g. sway often use custom
>> scripts binded to hotkeys to get functionality like the brightness
>> up/down keyboard hotkeys changing the brightness. This typically involves
>> e.g. the xbacklight utility.
>>
>> Even if the xbacklight utility is ported to use kms with the new connector
>> object brightness properties then this still will not work because
>> changing the properties will require drm-master rights and e.g. sway will
>> already hold those.
>>
>>
>> The drm_connector brightness properties
>> =======================================
>>
>> The new uAPI for this consists of 2 properties:
>>
>> 1. "display brightness": rw 0-int32_max property controlling the brightness setting
>> of the connected display. The actual maximum of this will be less then
>> int32_max and is given in "display brightness max".
> 
> This could use a few words explaining the choice of range and property
> type. (I assume it's because you can't change a range property's max at
> runtime. Which is also why you need a separate max property.)

Right. One of the things some users are asking for is brightness control for
external monitors through e.g. DDC/DI which means that the control only
becomes available when the monitor is plugged in, which with laptops
may be much later then boot.

> 
>> Unlike the /sys/class/backlight/foo/brightness this brightness property
>> has a clear definition for the value 0. The kernel must ensure that 0
>> means minimum brightness (so 0 should _never_ turn the backlight off).
>> If necessary the kernel must enforce a minimum value by adding
>> an offset to the value seen in the property to ensure this behavior.
>>
>> For example if necessary the driver must clamp 0-255 to 10-255, which then
>> becomes 0-245 on the brightness property, adding 10 internally to writes
>> done to the brightness property. This adding of an extra offset when
>> necessary must only be done on the brightness property,
>> the /sys/class/backlight interface should be left unchanged to not break
>> userspace which may rely on 0 = off on some systems.
>>
>> Note amdgpu already does something like this even for /sys/class/backlight,
>> see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
>>
>> Also whenever possible the kernel must ensure that the brightness range
>> is in perceived brightness, but this cannot always be guaranteed.
> 
> Do you mean every step should be a visible change?

No that would mean that more or less raw 16 bit pwm controls would need
to loose a lot of range. This is more about what Ville mentions further
in the thread (and which you mention below) when the raw PWM directly controls
a LED backlight, or when it linearly controls a current-source for a LED backlight
then when going from 10% dutycycle (which would be 0) to 20% would double
the brightness where as going from 90% to 100& only adds 11%.

Some brightness control methods use a curve to make things feel more linear
giving a similar % brightness increase on all parts of the curve.

What I'm trying to say here is that ideally the control should always
follow such a curve (but only if available, the kernel should not make
up its own curves).

> 
>> 2. "display brightness max": ro 0-int32_max property giving the actual maximum
>> of the display's brightness setting. This will report 0 when brightness
>> control is not available.
>>
>> The value of "display brightness max" may change at runtime, either by
>> a legacy drivers/platform/x86 backlight driver loading after the drm
>> driver has loaded; or when plugging in a monitor which allows brightness
>> control over DDC/CI. In both these cases the max value will change from 0
>> to the actual max value, indicating backlight control has become available
>> on this connector.
> 
> I think this could be a bit more restrictive in stating the allowed
> runtime changes. Is it only 0 -> actual max for non-hotpluggable
> displays, nothing else, and additionally actual max -> 0 when unplugging
> a display?

Right, only 0 -> actual max for non-hotpluggable displays, nothing else
and additionally actual max -> 0 when unplugging a display?

I'll adjust the wording here a bit, but I don't plan to make
the non-hotpluggable vs hotpluggable difference though. I'm not sure
that is helpful. With LCD panel muxes used in some hybrid GPU
designs even a laptop panel can be hotplugged (from the GPU pov
on a switch its unplugged/plugged-in).

> 
>>
>>
>> Future extensions
>> =================
>>
>> Some hardware do adaptive brightness in hardware, rather then providing
>> an ALS sensor and letting userspace handle this.
>>
>> One example of this is the Steam deck, which currently uses some custom
>> sysfs attributes to allow tweaking (and enable/disable?) the adaptive
>> brightness. Adding standardized uAPI for this through new
>> "display brightness *" properties seems like a natural extension of this
>> proposal.
> 
> Another example is adjusting for non-linear luminance curve. It would be
> nicer for equal steps in brightness value to have similar luminance
> changes.

Actually that is sorta what I meant above. So I guess what you are
suggesting is allowing userspace to load some adjustment curve into the
kernel ?  That would definitely fall under the "Future Extensions"
bit, but yeah that would be interesting. In some cases we may even be
able to pre-populate such a curve with firmware provided data.

> I think sometimes we lose precision with the limited number of
> steps in UIs. But this is thinking pretty far ahead. :)
> 
> Other than the minor clarifications, the plans sounds good to me.

Thank you for the review. 
> Thanks again for doing all this, much appreciated.

You're welcome.

Regards,

Hans



> 
> 
> BR,
> Jani.
> 
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
>> 2) https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>> Note this proposal included a method for userspace to be able to tell the
>> kernel if the native/acpi_video/vendor backlight device should be used,
>> but this has been solved in the kernel for years now:
>>  https://www.spinics.net/lists/linux-acpi/msg50526.html
>> An initial implementation of this proposal is available here:
>>  https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight
>>
>>
> 

